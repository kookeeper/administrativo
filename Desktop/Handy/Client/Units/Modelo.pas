unit Modelo;

interface

uses Cadastro, Empresa, SysUtils;

type
  TModelo = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_modelo     : String;
    _descricao_modelo  : String;
    _modelo_sq_pai: Variant;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_modelo: String read _codigo_modelo write _codigo_modelo;
    property descricao_modelo: String read _descricao_modelo write _descricao_modelo;
    property modelo_sq_pai: Variant read _modelo_sq_pai write _modelo_sq_pai;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TModelo }

constructor TModelo.Create;
begin
  setTabela('modelos');
  setLista('Código=codigo_modelo,Descrição=descricao_modelo');
end;

destructor TModelo.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

end.

