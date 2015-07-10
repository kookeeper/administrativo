unit Empresa;

interface

uses Cadastro, SysUtils, Dialogs, uDM, Classes;

type
  TEmpresa = class(TCadastro)
  private
    _codigo_empresa        : String;
    _nome_empresa          : String;
    _acessos               : Integer;
    _senha                 : String;
    _numero_nfiscal        : Integer;
    _estado                : String;
    _numero_pedido         : Integer;
    _alt_data_pedido       : String;
    _alt_dtemissao_nfiscal : String;
    _aliq_icms_prod1       : Double;
    _aliq_icms_pec1        : Double;
    _stribut               : Integer;
    _alt_nr_pedido         : String;
    _alt_nr_nfiscal        : String;
    _dias_demonstracao     : Integer;
    _numero_assistencia    : Integer;
    _aliq_pis              : Double;
    _aliq_cofins           : Double;
    _ultima_classificacao  : TDateTime;
    _aamm_classificacao    : Integer;
    _aliq_iss              : Double;
    _margem_esq_nf         : Double;
    _margem_sup_nf         : Double;
    _banco_imagens         : String;
    _baixa_estoque_pedido  : String;
    _juros_receber         : Double;
    _numero_rma            : Integer;
    _estoque_negativo      : String;
    _descricao_estoque1    : String;
    _descricao_estoque2    : String;
    _descricao_estoque3    : String;
    _descricao_estoque4    : String;
    _descricao_estoque5    : String;
    _descricao_estoque6    : String;
    _descricao_estoque7    : String;
    _descricao_estoque8    : String;
    _descricao_estoque9    : String;
    _descricao_estoque10   : String;
    _codigo_regime_tributario: Integer;
    _codigo_situacao_operacao: Variant;
  published
    property codigo_empresa        : String   read _codigo_empresa        write _codigo_empresa       ;
    property nome_empresa          : String   read _nome_empresa          write _nome_empresa         ;
    property acessos               : Integer  read _acessos               write _acessos              ;
    property senha                 : String   read _senha                 write _senha                ;
    property numero_nfiscal        : Integer  read _numero_nfiscal        write _numero_nfiscal       ;
    property estado                : String   read _estado                write _estado               ;
    property numero_pedido         : Integer  read _numero_pedido         write _numero_pedido        ;
    property alt_data_pedido       : String   read _alt_data_pedido       write _alt_data_pedido      ;
    property alt_dtemissao_nfiscal : String   read _alt_dtemissao_nfiscal write _alt_dtemissao_nfiscal;
    property aliq_icms_prod1       : Double   read _aliq_icms_prod1       write _aliq_icms_prod1      ;
    property aliq_icms_pec1        : Double   read _aliq_icms_pec1        write _aliq_icms_pec1       ;
    property stribut               : Integer  read _stribut               write _stribut              ;
    property alt_nr_pedido         : String   read _alt_nr_pedido         write _alt_nr_pedido        ;
    property alt_nr_nfiscal        : String   read _alt_nr_nfiscal        write _alt_nr_nfiscal       ;
    property dias_demonstracao     : Integer  read _dias_demonstracao     write _dias_demonstracao    ;
    property numero_assistencia    : Integer  read _numero_assistencia    write _numero_assistencia   ;
    property aliq_pis              : Double   read _aliq_pis              write _aliq_pis             ;
    property aliq_cofins           : Double   read _aliq_cofins           write _aliq_cofins          ;
    property ultima_classificacao  : TDateTime read _ultima_classificacao  write _ultima_classificacao ;
    property aamm_classificacao    : Integer  read _aamm_classificacao    write _aamm_classificacao   ;
    property aliq_iss              : Double   read _aliq_iss              write _aliq_iss             ;
    property margem_esq_nf         : Double   read _margem_esq_nf         write _margem_esq_nf        ;
    property margem_sup_nf         : Double   read _margem_sup_nf         write _margem_sup_nf        ;
    property banco_imagens         : String   read _banco_imagens         write _banco_imagens        ;
    property baixa_estoque_pedido  : String   read _baixa_estoque_pedido  write _baixa_estoque_pedido ;
    property juros_receber         : Double   read _juros_receber         write _juros_receber        ;
    property numero_rma            : Integer  read _numero_rma            write _numero_rma           ;
    property estoque_negativo      : String   read _estoque_negativo      write _estoque_negativo     ;
    property descricao_estoque1    : String   read _descricao_estoque1    write _descricao_estoque1   ;
    property descricao_estoque2    : String   read _descricao_estoque2    write _descricao_estoque2   ;
    property descricao_estoque3    : String   read _descricao_estoque3    write _descricao_estoque3   ;
    property descricao_estoque4    : String   read _descricao_estoque4    write _descricao_estoque4   ;
    property descricao_estoque5    : String   read _descricao_estoque5    write _descricao_estoque5   ;
    property descricao_estoque6    : String   read _descricao_estoque6    write _descricao_estoque6   ;
    property descricao_estoque7    : String   read _descricao_estoque7    write _descricao_estoque7   ;
    property descricao_estoque8    : String   read _descricao_estoque8    write _descricao_estoque8   ;
    property descricao_estoque9    : String   read _descricao_estoque9    write _descricao_estoque9   ;
    property descricao_estoque10   : String   read _descricao_estoque10   write _descricao_estoque10  ;
    property codigo_regime_tributario: Integer read _codigo_regime_tributario write _codigo_regime_tributario;
    property codigo_situacao_operacao: Variant read _codigo_situacao_operacao write _codigo_situacao_operacao;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure Atualizar;
    procedure VerificaSenha;
    function listaEstoques: TStrings;
  end;

var
  empresaSelecionada: TEmpresa;

implementation

{ TEmpresa }

procedure TEmpresa.Atualizar;
begin
  setIndice(1);
end;

constructor TEmpresa.Create;
begin
  setTabela('empresas');
end;

destructor TEmpresa.Destroy;
begin

  inherited;
end;

procedure TEmpresa.VerificaSenha;
var
  i1: integer;
  s1, s2: string;
  r1: Real;
  dtsenha: TDateTime;
begin
  try
    empresaSelecionada.acessos := empresaSelecionada.acessos + 1;
    empresaSelecionada.salvar;

    s1 := '';
    for i1 := 1 to 14 do
    begin
      s2 := InttoStr (Pos (Copy (empresaSelecionada.senha, i1, 1), 'SergioPaulo'));
      if s2 <> '0' then
      begin
        if s2 = '10' then s2 := '0';
        s1 := Concat (s1, s2);
      end;
    end;
    r1 := StrToFloat (s1);
    r1 := r1-StrToFloat(empresaSelecionada.codigo_empresa);
    r1 := Sqrt (r1);
    dtsenha := r1;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      dtsenha := 0;
    end;
  end;

  if (dtsenha < Date) or (dtsenha > Date + 90) then
    raise Exception.Create('Falha na Validação do Sistema. Programa Finalizado!');

  DM.dtsenha := dtsenha;
end;

function TEmpresa.listaEstoques: TStrings;
var
  lista: TStrings;
begin
  lista := TStringList.Create;

  if (descricao_estoque1 <> '') then
    lista.AddObject(descricao_estoque1, TObject(1));

  if (descricao_estoque2 <> '') then
    lista.AddObject(descricao_estoque2, TObject(2));

  if (descricao_estoque3 <> '') then
    lista.AddObject(descricao_estoque3, TObject(3));

  if (descricao_estoque4 <> '') then
    lista.AddObject(descricao_estoque4, TObject(4));

  if (descricao_estoque5 <> '') then
    lista.AddObject(descricao_estoque5, TObject(5));

  if (descricao_estoque6 <> '') then
    lista.AddObject(descricao_estoque6, TObject(6));

  if (descricao_estoque7 <> '') then
    lista.AddObject(descricao_estoque7, TObject(7));

  if (descricao_estoque8 <> '') then
    lista.AddObject(descricao_estoque8, TObject(8));

  if (descricao_estoque9 <> '') then
    lista.AddObject(descricao_estoque9, TObject(9));

  if (descricao_estoque10 <> '') then
    lista.AddObject(descricao_estoque10, TObject(10));

  result := lista;
end;

end.
