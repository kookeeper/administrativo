unit Natureza;

interface

uses Cadastro, DBClient, UDM, Empresa, SysUtils;

type
  TipoNfiscal = (Vendas=0, Demonstracao=1, Remessa=2, Retorno=3, Importacao=4,
    Exportacao=5, SimplesRemessa=6, Devolucao=7, NotaComplementar=8,
    SimplesRemessaParaTerceiros=9, Outros=99);

type
  TNatureza = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_natureza: Integer;
    _descricao_natureza: String;
    _cfo: String;
    _aliq_icms: Double;
    _aliq_ipi: Double;
    _ent_sai: String;
    _observacao: String;
    _uf01: String;
    _uf02: String;
    _uf03: String;
    _uf04: String;
    _uf05: String;
    _uf06: String;
    _uf07: String;
    _uf08: String;
    _uf09: String;
    _uf10: String;
    _uf11: String;
    _uf12: String;
    _uf13: String;
    _uf14: String;
    _uf15: String;
    _uf16: String;
    _uf17: String;
    _uf18: String;
    _uf19: String;
    _uf20: String;
    _uf21: String;
    _uf22: String;
    _uf23: String;
    _uf24: String;
    _uf25: String;
    _uf26: String;
    _uf27: String;
    _uf28: String;
    _uf29: String;
    _uf30: String;
    _isencao_ipi: String;
    _isencao_icms: String;
    _descricao_natureza_nfiscal: String;
    _tipo_nfiscal: Integer;
    _icms_subst: String;
    _cfo_subst: String;
    _numero_estoque_entrada: Integer;
    _numero_estoque_saida: Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_natureza: Integer read _codigo_natureza write _codigo_natureza;
    property descricao_natureza: String read _descricao_natureza write _descricao_natureza;
    property cfo: String read _cfo write _cfo;
    property aliq_icms: Double read _aliq_icms write _aliq_icms;
    property aliq_ipi: Double read _aliq_ipi write _aliq_ipi;
    property ent_sai: String read _ent_sai write _ent_sai;
    property observacao: String read _observacao write _observacao;
    property uf01: String read _uf01 write _uf01;
    property uf02: String read _uf02 write _uf02;
    property uf03: String read _uf03 write _uf03;
    property uf04: String read _uf04 write _uf04;
    property uf05: String read _uf05 write _uf05;
    property uf06: String read _uf06 write _uf06;
    property uf07: String read _uf07 write _uf07;
    property uf08: String read _uf08 write _uf08;
    property uf09: String read _uf09 write _uf09;
    property uf10: String read _uf10 write _uf10;
    property uf11: String read _uf11 write _uf11;
    property uf12: String read _uf12 write _uf12;
    property uf13: String read _uf13 write _uf13;
    property uf14: String read _uf14 write _uf14;
    property uf15: String read _uf15 write _uf15;
    property uf16: String read _uf16 write _uf16;
    property uf17: String read _uf17 write _uf17;
    property uf18: String read _uf18 write _uf18;
    property uf19: String read _uf19 write _uf19;
    property uf20: String read _uf20 write _uf20;
    property uf21: String read _uf21 write _uf21;
    property uf22: String read _uf22 write _uf22;
    property uf23: String read _uf23 write _uf23;
    property uf24: String read _uf24 write _uf24;
    property uf25: String read _uf25 write _uf25;
    property uf26: String read _uf26 write _uf26;
    property uf27: String read _uf27 write _uf27;
    property uf28: String read _uf28 write _uf28;
    property uf29: String read _uf29 write _uf29;
    property uf30: String read _uf30 write _uf30;
    property isencao_ipi: String read _isencao_ipi write _isencao_ipi;
    property isencao_icms: String read _isencao_icms write _isencao_icms;
    property descricao_natureza_nfiscal: String read _descricao_natureza_nfiscal write _descricao_natureza_nfiscal;
    property tipo_nfiscal: Integer read _tipo_nfiscal write _tipo_nfiscal;
    property icms_subst: String read _icms_subst write _icms_subst;
    property cfo_subst: String read _cfo_subst write _cfo_subst;
    property numero_estoque_entrada: Integer read _numero_estoque_entrada write _numero_estoque_entrada;
    property numero_estoque_saida: Integer read _numero_estoque_saida write _numero_estoque_saida;
  public
    function proximo: Integer;
    constructor Create; override;
    destructor Destroy; override;
    class function entradas: TClientDataSet;
    class function demontracao: TClientDataSet;
    class function buscarPorCFOP(cfop: String): TNatureza;
  end;

implementation

{ TNatureza }

class function TNatureza.buscarPorCFOP(cfop: String): TNatureza;
begin
  With (listaPersonalizada('select natureza_sq from naturezas where cfo = ' + QuotedStr(cfop))) do
  begin
    if (RecordCount = 0) then
      raise Exception.Create('Não foi possível encontrar a natureza com o código ' + QuotedStr(cfop));
    result := TNatureza.Create(FieldByName('natureza_sq').Value);
  end;
end;

constructor TNatureza.Create;
begin
  setTabela('naturezas');
  setLista('Código=codigo_natureza,Descrição=descricao_natureza');
end;

class function TNatureza.demontracao: TClientDataSet;
begin
  result := listaRegistros('where ent_sai = ''E'' and tipo_nfiscal = 1 ORDER BY DESCRICAO_NATUREZA');
end;

destructor TNatureza.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

class function TNatureza.entradas: TClientDataSet;
begin
  result := listaRegistros('where ENT_SAI = ''E'' ORDER BY DESCRICAO_NATUREZA');
end;

function TNatureza.proximo: Integer;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  DM.SCServer.AppServer.CriaLista('select max(codigo_natureza) as maximo from naturezas');
  cds.Open;
  result := cds.FieldByName('maximo').AsInteger + 1;
end;

end.
