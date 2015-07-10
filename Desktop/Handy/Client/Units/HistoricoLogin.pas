unit HistoricoLogin;

interface

uses Cadastro, DBClient, Usuario, SysUtils, Empresa;

type
  THistoricoLogin = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _usuario_sq: TUsuario;
    _data_login: TDateTime;
    _ip_login: String;
  protected
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property usuario_sq: TUsuario  read _usuario_sq write _usuario_sq;
    property data_login: TDateTime read _data_login write _data_login;
    property ip_login: String      read _ip_login write _ip_login;
  public
    constructor Create(); override;
    destructor Destroy; override;
  end;

implementation

uses Classes;

{ THistoricoLogin }

constructor THistoricoLogin.Create;
begin
  setTabela('historico_login');
  setLista('"Data=data_login"');
end;

destructor THistoricoLogin.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_usuario_sq);

  inherited;
end;

end.
