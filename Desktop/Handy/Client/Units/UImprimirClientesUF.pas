unit UImprimirClientesUF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  OleCtrls, SHDocVw, DBCtrls, RzDBCmbo;

type
  TFImprimirClientesUF = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    bbMapa: TBitBtn;
    dblEstado: TRzDBLookupComboBox;
    Label8: TLabel;
    dsListaEstados: TDataSource;
    btnExportar: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bbMapaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure dblEstadoClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    _estado: String;
    procedure estadoChange(const Value: String);
    { Private declarations }
  public
    property estado: String read _estado write estadoChange;
  end;

var
  FImprimirClientesUF: TFImprimirClientesUF;

implementation

uses UDM, UImprimirClientesUFRpt1,
  UImprimirClientesUFRpt2, UImprimirClientesUFRpt3, UImprimirClientesHist,
  Math, Estado;

{$R *.dfm}

procedure TFImprimirClientesUF.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TFImprimirClientesHist, FImprimirClientesHist);
  FImprimirClientesHist.edNome.Text := DM.cdsImprClientesUF.FieldByName('NOME_CLIENTE').AsString;
  FImprimirClientesHist.ShowModal;
  FImprimirClientesHist.Free;
  DM.cdsImprHistClientes3.Close;
  DM.cdsImprHistClientes2.Close;
  DM.cdsImprHistClientes1.Close;
end;

procedure TFImprimirClientesUF.bbImprimirClick(Sender: TObject);
begin
  bbImprimir.Enabled    := False;
  if PageControl1.ActivePage = TabSheet1 then
  begin
    Application.CreateForm(TFImprimirClientesUFRpt1, FImprimirClientesUFRpt1);
    if estado <> '' then
      FImprimirClientesUFRpt1.QRLabel1.Caption := FImprimirClientesUFRpt1.QRLabel1.Caption + ' por Estado - ' + estado;
    FImprimirClientesUFRpt1.Preview;
    FImprimirClientesUFRpt1.Free;
  end else
  if PageControl1.ActivePage = TabSheet2 then
  begin
    Application.CreateForm(TFImprimirClientesUFRpt2, FImprimirClientesUFRpt2);
    if estado <> '' then
      FImprimirClientesUFRpt2.QRLabel1.Caption := FImprimirClientesUFRpt2.QRLabel1.Caption + ' por Estado - ' + estado;
    FImprimirClientesUFRpt2.Preview;
    FImprimirClientesUFRpt2.Free;
  end else
  if PageControl1.ActivePage = TabSheet3 then
  begin
    Application.CreateForm(TFImprimirClientesUFRpt3, FImprimirClientesUFRpt3);
    if estado <> '' then
      FImprimirClientesUFRpt3.QRLabel1.Caption := FImprimirClientesUFRpt3.QRLabel1.Caption + ' por Estado - ' + estado;
    FImprimirClientesUFRpt3.Preview;
    FImprimirClientesUFRpt3.Free;
  end;
  bbImprimir.Enabled    := True;
end;

procedure TFImprimirClientesUF.estadoChange(const Value: String);
begin
  _estado := Value;
  DM.cdsImprClientesUF.Close;
  if estado <> '' then
  begin
    DM.cdsImprClientesUF.Filter := 'ESTADO = ''' + estado + '''';
    DM.cdsImprClientesUF.Filtered := True;
  end
  else begin
    DM.cdsImprClientesUF.Filter := '';
    DM.cdsImprClientesUF.Filtered := False;
  end;
  DM.cdsImprClientesUF.Open;
end;

procedure TFImprimirClientesUF.FormActivate(Sender: TObject);
begin
  bbMapaClick(nil);
end;

procedure TFImprimirClientesUF.bbMapaClick(Sender: TObject);
begin
{
  try
    FImprimirClientesUFMapa := TFImprimirClientesUFMapa.Create(Self);
    FImprimirClientesUFMapa.ShowModal;
  finally
    FreeAndNil(FImprimirClientesUFMapa);
  end;
}
end;

procedure TFImprimirClientesUF.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (State <> [gdSelected]) and
     (State <> [gdFocused]) and
     (State <> [gdFixed]) and
     (not DM.cdsImprClientesUF.FieldByName('DATA_CADASTRO').IsNull) then
  try
    if DM.cdsImprClientesUF.FieldByName('DATA_CADASTRO').AsDateTime > Date-365 then
    begin
      DBGrid1.Canvas.Font.Color := clGreen;
      DBGrid1.Canvas.TextRect(Rect, Rect.Left, Rect.Top, Column.Field.AsString);
    end;
  except
    on E : Exception do
      raise Exception.Create ('Erro ao Atualizar Lista: ' + chr(13) + E.Message);
  end;
end;

procedure TFImprimirClientesUF.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.cdsImprClientesUF.Close;
  DM.cdsImprClientesUF.Filtered := False;
  DM.cdsImprClientesUF.Filter   := '';
end;

procedure TFImprimirClientesUF.FormCreate(Sender: TObject);
begin
  dsListaEstados.DataSet := TEstado.listaRegistros('order by codigo_estado');
end;

procedure TFImprimirClientesUF.dblEstadoClick(Sender: TObject);
begin
    estado := dsListaEstados.DataSet.FieldByName('codigo_estado').Value;
end;

procedure TFImprimirClientesUF.btnExportarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    if PageControl1.ActivePageIndex = 0 then
      DM.ExpExcel (DBGrid1.DataSource.DataSet, SaveDialog1.FileName);
    if PageControl1.ActivePageIndex = 1 then
      DM.ExpExcel (DBGrid2.DataSource.DataSet, SaveDialog1.FileName);
    if PageControl1.ActivePageIndex = 2 then
      DM.ExpExcel (DBGrid3.DataSource.DataSet, SaveDialog1.FileName);
  end;
end;

end.
