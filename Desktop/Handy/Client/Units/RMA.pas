unit RMA;

interface

uses Controls, Classes, DBClient, SysUtils, Cadastro, UDM, Produto, Variants,
    Empresa;

type
  TRMA = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _numero_rma: Integer;
    _data_entrada_nf: TDate;
    _data_emissao_nf: TDate;
    _numero_nf_cliente: Integer;
    _nome_cliente: String;
    _endereco_cliente: String;
    _email_cliente: String;
    _telefone_cliente: String;
    _responsavel_cliente: String;
    _nf_compra: Integer;
    _data_compra: TDate;
    _loja_cliente: String;
    _forma_envio: String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property numero_rma         : Integer read _numero_rma          write _numero_rma          ;
    property data_entrada_nf    : TDate   read _data_entrada_nf     write _data_entrada_nf     ;
    property data_emissao_nf    : TDate   read _data_emissao_nf     write _data_emissao_nf     ;
    property numero_nf_cliente  : Integer read _numero_nf_cliente   write _numero_nf_cliente   ;
    property nome_cliente       : String  read _nome_cliente        write _nome_cliente        ;
    property endereco_cliente   : String  read _endereco_cliente    write _endereco_cliente    ;
    property email_cliente      : String  read _email_cliente       write _email_cliente       ;
    property telefone_cliente   : String  read _telefone_cliente    write _telefone_cliente    ;
    property responsavel_cliente: String  read _responsavel_cliente write _responsavel_cliente ;
    property nf_compra          : Integer read _nf_compra           write _nf_compra           ;
    property data_compra        : TDate   read _data_compra         write _data_compra         ;
    property loja_cliente       : String  read _loja_cliente        write _loja_cliente        ;
    property forma_envio        : String  read _forma_envio         write _forma_envio         ;
  protected
    procedure setIndice(const Value: Variant); override;
  public
    rma_item: TList;
    procedure salvar; override;
    procedure proximoRMA;
    constructor Create; override;
    destructor Destroy; override;
  end;

  TRMAItem = class(TCadastro)
  private
    _rma_sq: Integer;
    _produto_sq: TProduto;
    _nr_serie_produto: String;
    _qtde_produto: Integer;
    _acessorio_produto: String;
    _vlr_unit_produto: Double;
    _defeito_produto: String;
    _data_retorno_produto: TDateTime;
    _nf_devolucao_produto: Integer;
    _finalizacao_produto: String;
  published
    property rma_sq              : Integer   read _rma_sq               write _rma_sq               ;
    property produto_sq          : TProduto  read _produto_sq           write _produto_sq           ;
    property nr_serie_produto    : String    read _nr_serie_produto     write _nr_serie_produto     ;
    property qtde_produto        : Integer   read _qtde_produto         write _qtde_produto         ;
    property acessorio_produto   : String    read _acessorio_produto    write _acessorio_produto    ;
    property vlr_unit_produto    : Double    read _vlr_unit_produto     write _vlr_unit_produto     ;
    property defeito_produto     : String    read _defeito_produto      write _defeito_produto      ;
    property data_retorno_produto: TDateTime read _data_retorno_produto write _data_retorno_produto ;
    property nf_devolucao_produto: Integer   read _nf_devolucao_produto write _nf_devolucao_produto ;
    property finalizacao_produto : String    read _finalizacao_produto  write _finalizacao_produto  ;
  public
    constructor Create; override;
    class function ListaItens(rma_sq: Integer): TList;
    destructor Destroy; override;
  end;

implementation

{ TRMA }

constructor TRMA.Create;
begin
  setTabela('rma');
  setLista('Código=numero_rma, Nome=nome_cliente');
end;

destructor TRMA.Destroy;
var
  i: Integer;
  obj: TRMAItem;
begin
  FreeAndNil(_empresa_sq);

  for i := 0 to rma_item.Count - 1 do
  begin
    obj := TRMAItem(rma_item.Items[i]);
    FreeAndNil(obj);
  end;

  inherited;
end;

procedure TRMA.proximoRMA;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';

  DM.SCServer.AppServer.ExecSQL('update empresas set numero_rma = numero_rma + 1');

  cds.Close;
  DM.SCServer.AppServer.CriaLista ('select numero_rma from empresas');
  cds.Open;

  DM.SCServer.AppServer.ExecSQL('update rma set numero_rma = ' +
    cds.FieldByName('numero_rma').AsString + ' where numero_rma = 0');
end;

procedure TRMA.salvar;
var
  i, j: Integer;
  itens: TList;
  apagar: Boolean;
begin
  inherited;

  for i := 0 to rma_item.Count - 1 do
    TRMAItem(rma_item.Items[i]).salvar;

  itens := TRMAItem.ListaItens(vIndice);
  for i := 0 to itens.Count - 1 do
  begin
    apagar := true;
    for j := 0 to rma_item.Count - 1 do
      if TRMAItem(rma_item.Items[j]).vIndice = TRMAItem(itens.Items[i]).vIndice then
        apagar := false;
    if apagar then
      TRMAItem(itens.Items[i]).excluirRegistro(false);
  end;

  if numero_rma = 0 then
    proximoRMA;
end;

procedure TRMA.setIndice(const Value: Variant);
begin
  inherited;

  if (Value <> null) then
    rma_item := TRMAItem.ListaItens(vIndice)
  else
    rma_item := TList.Create;
end;

{ TRMAItem }

constructor TRMAItem.Create;
begin
  setTabela('rma_item');
end;

destructor TRMAItem.Destroy;
begin
  FreeAndNil(_produto_sq);

  inherited;
end;

class function TRMAItem.ListaItens(rma_sq: Integer): TList;
var
  cds: TClientDataSet;
begin
  result := TList.Create;
  result.Clear;
  cds := listaRegistros('where rma_sq = ' + IntToStr(rma_sq));

  While not cds.Eof do
  begin
    result.Add(TRMAItem.Create(cds.FieldByName('rma_item_sq').Value));
    cds.Next;
  end;
  cds.Close;
end;

end.
