unit Vendedor;

interface

uses SysUtils, Cadastro, Classes, UDM, DB, UCadastrarListaComum, Controls,
    Variants, Empresa;

type
  TVendedor = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_vendedor: Integer;
    _nome_vendedor: String;
    _pct_comissao_propria: Double;
    _pct_comissao_parceria: Double;
    _base_comissao: String;
    _pct_comissao_desconto: Double;
    _obs_comissao_desconto: String;
    _tipo_vendedor: String;
    _data_cadastro: TDate;
    _data_inativacao: TDate;
    Fpct_desconto: Integer;
    Fpct_desconto_master: Integer;
    procedure Setpct_desconto(const Value: Integer);
    procedure Setpct_desconto_master(const Value: Integer);
  protected
    function carregaObservacao: String; override;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_vendedor      : Integer read _codigo_vendedor       write _codigo_vendedor      ;
    property nome_vendedor        : String  read _nome_vendedor         write _nome_vendedor        ;
    property pct_comissao_propria : Double  read _pct_comissao_propria  write _pct_comissao_propria ;
    property pct_comissao_parceria: Double  read _pct_comissao_parceria write _pct_comissao_parceria;
    property base_comissao        : String  read _base_comissao         write _base_comissao        ;
    property pct_comissao_desconto: Double  read _pct_comissao_desconto write _pct_comissao_desconto;
    property obs_comissao_desconto: String  read _obs_comissao_desconto write _obs_comissao_desconto;
    property tipo_vendedor        : String  read _tipo_vendedor         write _tipo_vendedor        ;
    property data_cadastro        : TDate   read _data_cadastro         write _data_cadastro        ;
    property data_inativacao      : TDate   read _data_inativacao       write _data_inativacao      ;
    property pct_desconto         : Integer read Fpct_desconto write Setpct_desconto;
    property pct_desconto_master  : Integer read Fpct_desconto_master write Setpct_desconto_master;
  public
    constructor Create; override;
    destructor Destroy; override;
    function validarDesconto(vlr_total, vlr_desc: Double; pctDescontoMaximo: Integer): Boolean;
    class function buscarDescontoMaster(vendedor_sq: Integer; senha_usuario: String): Integer;
  end;

  TFListaVendedores = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaVendedores: TFListaVendedores;

implementation

uses UCadastrarFormVendedores, Math, DBClient;

{ TVendedor }

constructor TVendedor.Create;
begin
  setTabela('vendedores');
  setLista('Código=CODIGO_VENDEDOR, Nome=NOME_VENDEDOR');
end;

function TVendedor.carregaObservacao(): String;
var
  observacao: String;
  vendedor1: TVendedor;
begin
  if vIndice = null then
    Exit;

  vendedor1 := TVendedor.Create(vIndice);

  observacao := '';
  if nome_vendedor <> vendedor1.nome_vendedor then
    observacao := observacao + 'nome(' + vendedor1.nome_vendedor + ' -> ' + nome_vendedor + ')' + chr(13);
  if data_inativacao <> vendedor1.data_inativacao then
  begin
    if vendedor1.data_inativacao = 0 then
      observacao := observacao + 'inativação(""' + ' -> ' + DateToStr(data_inativacao) + ')' + chr(13)
    else if data_inativacao = 0 then
      observacao := observacao + 'inativação(' + DateToStr(vendedor1.data_inativacao) + ' -> "")' + chr(13)
    else
      observacao := observacao + 'inativação(' + DateToStr(vendedor1.data_inativacao) + ' -> ' + DateToStr(data_inativacao) + ')' + chr(13);
  end;
  result := observacao;
end;

{ TListaVendedores }

procedure TFListaVendedores.FormCreate(Sender: TObject);
begin
  Caption := 'Cadastrar Vendedores';
  Name := 'FCadastrarListaVendedores';
  registro := TVendedor.Create;
  sbEditar.OnClick := sbEditarClick;
  inherited;
end;

procedure TFListaVendedores.sbEditarClick(Sender: TObject);
begin
  inherited;
  FCadastrarFormVendedores := TFCadastrarFormVendedores.Create(Self);
  FCadastrarFormVendedores.ShowModal;
end;

destructor TVendedor.Destroy;
begin
  FreeAndNil(_empresa_sq);
  
  inherited;
end;

procedure TVendedor.Setpct_desconto(const Value: Integer);
begin
  Fpct_desconto := Value;
end;

function TVendedor.validarDesconto(vlr_total, vlr_desc: Double; pctDescontoMaximo: Integer): Boolean;
var
  valor_desconto_maximo: Double;
begin
  valor_desconto_maximo := Ceil(vlr_total * pct_desconto / 100);
  if (vlr_desc > valor_desconto_maximo) then
  begin
    valor_desconto_maximo := Ceil(vlr_total * pctDescontoMaximo / 100);
    if (vlr_desc > valor_desconto_maximo) then
      raise Exception.Create('O valor do desconto informado é maior que o permitido.');

    result := True; // desconto liberado por senha
  end
  else
    result := False;
end;

procedure TVendedor.Setpct_desconto_master(const Value: Integer);
begin
  Fpct_desconto_master := Value;
end;

class function TVendedor.buscarDescontoMaster(vendedor_sq: Integer;
  senha_usuario: String): Integer;
var
  cds: TClientDataSet;
begin
  try
    cds := listaPersonalizada('select v.pct_desconto_master ' +
      'from vendedores v ' +
      'inner join usuarios u on (u.vendedor_sq=v.vendedor_sq and u.senha_usuario = ' + QuotedStr(senha_usuario) + ') ' +
      'where v.vendedor_sq=' + IntToStr(vendedor_sq));

    if (cds.RecordCount = 0) then
      raise Exception.Create('Vendedor não possui permissão para liberar desconto.');

    if (cds.RecordCount > 1) then
      raise Exception.Create('Vendedor vinculado a mais de um usuário, não é possível liberar desconto.');

    result := cds.FieldByName('pct_desconto_master').Value;
  finally
    FreeAndNil(cds);
  end;
end;

end.

