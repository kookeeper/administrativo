unit Estado;

interface

uses Cadastro, Empresa, SysUtils;

type
  TEstado = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_estado   : String;
    _aliq_icms_intra : Double;
    _descricao_estado: String;
    _codigo_ibge     : Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_estado   : String  read _codigo_estado    write _codigo_estado   ;
    property aliq_icms_intra : Double  read _aliq_icms_intra  write _aliq_icms_intra ;
    property descricao_estado: String  read _descricao_estado write _descricao_estado;
    property codigo_ibge     : Integer read _codigo_ibge      write _codigo_ibge     ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TEstado }

constructor TEstado.Create;
begin
  setTabela('estado');
  setLista('"Código=codigo_estado","Descrição=descricao_estado",' +
    '"Aliq. ICMS Intra=aliq_icms_intra","Código IBGE=codigo_ibge"');
end;

destructor TEstado.Destroy;
begin
  FreeAndNil(_empresa_sq);
  
  inherited;
end;

end.
