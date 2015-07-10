unit TipoCliente;

interface

uses SysUtils, Classes, Cadastro, UDM, DB, Empresa;

type
  TTipoCliente = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _descricao_tipo: String;
  protected
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property descricao_tipo: String read _descricao_tipo write _descricao_tipo;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TTipoCliente }

constructor TTipoCliente.Create;
begin
  setTabela('tipo_cliente');
  setLista('Descrição=descricao_tipo');
end;

destructor TTipoCliente.Destroy;
begin
  FreeAndNil(_empresa_sq);
  
  inherited;
end;

end.
