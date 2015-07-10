unit Acesso;

interface

uses Cadastro, Usuario, Empresa;

type
  TAcesso = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _nome_programa : String  ;
    _usuario_sq    : TUsuario;
    _visualizar    : String  ;
    _criar         : String  ;
    _editar        : String  ;
    _apagar        : String  ;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property nome_programa : String   read _nome_programa write _nome_programa;
    property usuario_sq    : TUsuario read _usuario_sq    write _usuario_sq   ;
    property visualizar    : String   read _visualizar    write _visualizar   ;
    property criar         : String   read _criar         write _criar        ;
    property editar        : String   read _editar        write _editar       ;
    property apagar        : String   read _apagar        write _apagar       ;
  public
    constructor Create; override;
    destructor Destroy; override;
    class function VerificaAcesso(programa, tipo: String): Boolean;
  end;

implementation

uses DbClient, SysUtils, UDM;

{ TAcesso }

constructor TAcesso.Create;
begin
  setTabela('acessos');
  setLista('Usuário=nome_usuario');
  sqlLista := 'select * from usuarios';
end;

destructor TAcesso.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndnil(_usuario_sq);
  inherited;
end;

class function TAcesso.VerificaAcesso(programa, tipo: String): Boolean;
var
  cds: TClientDataSet;
begin
  cds := TAcesso.listaRegistros(' where nome_programa = ' + QuotedStr(programa) + ' and usuario_sq = ' + IntToStr(DM.useq));
  result := cds.FieldByName(tipo).AsString = 'S';
end;

end.
