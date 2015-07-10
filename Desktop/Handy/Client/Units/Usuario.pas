unit Usuario;

interface

uses Cadastro, SysUtils, UDM, DB, Variants, Dialogs, Classes, Controls,
  UCadastrarListaComum, Vendedor, Empresa;

type
  TUsuario = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_usuario: String;
    _nome_usuario: String;
    _senha_usuario: String;
    _vendedor_sq: TVendedor;
  protected
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_usuario: String     read _codigo_usuario write _codigo_usuario;
    property nome_usuario  : String     read _nome_usuario   write _nome_usuario  ;
    property senha_usuario : String     read _senha_usuario  write _senha_usuario ;
    property vendedor_sq   : TVendedor  read _vendedor_sq    write _vendedor_sq   ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

type
  TFListaUsuarios = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaUsuarios: TFListaUsuarios;

implementation

uses UCadastrarFormUsuarios, DBCtrls;

{ TUsuario }

constructor TUsuario.Create;
begin
  setTabela('usuarios');
  setLista('Código=codigo_usuario, Nome=nome_usuario');
end;

destructor TUsuario.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_vendedor_sq);

  inherited;
end;

{ TFListaUsuarios }

procedure TFListaUsuarios.FormCreate(Sender: TObject);
begin
  Caption := 'Cadastrar Usuários';
  Name := 'FCadastrarListaUsuarios';
  registro := TUsuario.Create;
  sbEditar.OnClick := sbEditarClick;
  inherited;
end;

procedure TFListaUsuarios.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormUsuarios := TFCadastrarFormUsuarios.Create(Self);
    FCadastrarFormUsuarios.ShowModal;
  finally
    FreeAndNil(FCadastrarFormUsuarios);
    FreeAndNil(registro);
    registro := TUsuario.Create;
  end;
end;

end.
