unit ncm;

interface

uses Cadastro, DBClient, Empresa, SysUtils;

type
  TNCM = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_nbm: String;
    _aliq_icms: Double;
    _aliq_ipi: Double;
    _aliq_iva: Double;
  protected
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_nbm: String read _codigo_nbm write _codigo_nbm;
    property aliq_icms: Double read _aliq_icms write _aliq_icms;
    property aliq_ipi: Double read _aliq_ipi write _aliq_ipi;
    property aliq_iva: Double read _aliq_iva write _aliq_iva;
  public
    constructor Create(); override;
    destructor Destroy(); override;
    class function buscaPorCodigo(codigo: String): TNCM;
  end;

implementation

uses Classes;

{ TNCM }

constructor TNCM.Create;
begin
  setTabela('nbm');
  setLista('"Código=CODIGO_NBM","I.C.M.S.=ALIQ_ICMS","I.P.I.=ALIQ_IPI","I.V.A.=ALIQ_IVA"');
end;

destructor TNCM.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

class function TNCM.buscaPorCodigo(codigo: String): TNCM;
begin
  With (listaPersonalizada('select nbm_sq from nbm where codigo_nbm = ' + QuotedStr(codigo))) do
  begin
    if (RecordCount = 0) then
      raise Exception.Create('Não foi possível encontrar o ncm com o código ' + QuotedStr(codigo));
    result := TNCM.Create(FieldByName('nbm_sq').Value);
  end;
end;

end.
