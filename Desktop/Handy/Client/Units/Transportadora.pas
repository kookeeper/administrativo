unit Transportadora;

interface

uses Cadastro, SysUtils, UDM, DB, Variants, Dialogs, Classes, Controls,
  UCadastrarListaComum, Empresa;

type
  TTransportadora = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _CODIGO_TRANSPORTADORA: String;
    _NOME_TRANSPORTADORA: String;
    _INSCR_ESTADUAL: String;
    _ENDERECO_TRANSPORTADORA: String;
    _MUNICIPIO_TRANSPORTADORA: String;
    _ESTADO_TRANSPORTADORA: String;
    _DDD_FONE: String;
    _NUMERO_FONE: String;
    _COMPL_FONE: String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property CODIGO_TRANSPORTADORA    : String read _CODIGO_TRANSPORTADORA    write _CODIGO_TRANSPORTADORA    ;
    property NOME_TRANSPORTADORA      : String read _NOME_TRANSPORTADORA      write _NOME_TRANSPORTADORA      ;
    property INSCR_ESTADUAL           : String read _INSCR_ESTADUAL           write _INSCR_ESTADUAL           ;
    property ENDERECO_TRANSPORTADORA  : String read _ENDERECO_TRANSPORTADORA  write _ENDERECO_TRANSPORTADORA  ;
    property MUNICIPIO_TRANSPORTADORA : String read _MUNICIPIO_TRANSPORTADORA write _MUNICIPIO_TRANSPORTADORA ;
    property ESTADO_TRANSPORTADORA    : String read _ESTADO_TRANSPORTADORA    write _ESTADO_TRANSPORTADORA    ;
    property DDD_FONE                 : String read _DDD_FONE                 write _DDD_FONE                 ;
    property NUMERO_FONE              : String read _NUMERO_FONE              write _NUMERO_FONE              ;
    property COMPL_FONE               : String read _COMPL_FONE               write _COMPL_FONE               ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

type
  TFListaTransportadoras = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaTransportadoras: TFListaTransportadoras;

implementation

uses UCadastrarFormTransportadoras;

{ TTransportadora }

constructor TTransportadora.Create;
begin
  setTabela('transportadoras');
  setLista('Código=CODIGO_TRANSPORTADORA, Nome=NOME_TRANSPORTADORA');
end;

destructor TTransportadora.Destroy;
begin
  FreeAndNil(_empresa_sq);
  
  inherited;
end;

{ TFListaTransportadoras }

procedure TFListaTransportadoras.FormCreate(Sender: TObject);
begin
  Caption := 'Cadastrar Transportadoras';
  Name := 'FCadastrarListaTransportadoras';
  registro := TTransportadora.Create;
  sbEditar.OnClick := sbEditarClick;
  inherited;
end;

procedure TFListaTransportadoras.sbEditarClick(Sender: TObject);
begin
  inherited;
  FCadastrarFormTransportadoras := TFCadastrarFormTransportadoras.Create(Self);
  FCadastrarFormTransportadoras.ShowModal;
end;

end.
