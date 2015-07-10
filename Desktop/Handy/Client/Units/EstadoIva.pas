unit EstadoIva;

interface

uses Cadastro, Classes, DBClient, uDM, SysUtils, NCM;

type
  TEstadoIva = class(TCadastro)
  private
    _estado_sq: Integer;
    _nbm_sq: TNCM;
    _aliq_iva: Double;
  published
    property estado_sq: Integer read _estado_sq write _estado_sq;
    property nbm_sq:    TNCM    read _nbm_sq    write _nbm_sq;
    property aliq_iva:  Double  read _aliq_iva  write _aliq_iva;
  public
    class function pesquisa(estado: String; nbm_sq: Integer): Real;
    constructor Create; override;
    destructor Destroy; override;
  private
  end;

implementation

{ TEstadoIva }

constructor TEstadoIva.Create;
begin
  setTabela('estado_iva');
  setLista('Estado=codigo_estado,N.C.M.=codigo_nbm,Aliq.IVA=aliq_iva');
  sqlLista := 'select ei.*, e.codigo_estado, n.codigo_nbm from estado_iva ei inner join estado e on (e.estado_sq=ei.estado_sq) inner join nbm n on (n.nbm_sq=ei.nbm_sq)';
end;

destructor TEstadoIva.Destroy;
begin
  FreeAndNil(_nbm_sq);
  
  inherited;
end;

class function TEstadoIva.pesquisa(estado: String; nbm_sq: Integer): Real;
var
  cds: TClientDataSet;
begin
  cds := TEstadoIva.listaRegistros('where nbm_sq = ' + IntToStr(nbm_sq) +
    ' and estado_sq in (select estado_sq from estado where codigo_estado = ' + QuotedStr(estado) + ')');

  if cds.RecordCount = 0 then
    result := 0
  else
    result := cds.FieldByName('aliq_iva').Value;
end;

end.
