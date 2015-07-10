unit UImprimirClientesUF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFImprimirClientesUF = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    bbImpr1: TBitBtn;
    bbFechar: TBitBtn;
    DataSource1: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    bbImpr2: TBitBtn;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    bbImpr3: TBitBtn;
    cbEstado: TComboBox;
    lbEstado: TLabel;
    procedure edEstadoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbImpr1Click(Sender: TObject);
    procedure bbImpr2Click(Sender: TObject);
    procedure bbImpr3Click(Sender: TObject);
    procedure cbEstadoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirClientesUF: TFImprimirClientesUF;

implementation

uses UDM, UDMImpr, UImprimirClientesUFRpt1,
  UImprimirClientesUFRpt2, UImprimirClientesUFRpt3, UImprimirClientesHist;

{$R *.dfm}

procedure TFImprimirClientesUF.edEstadoChange(Sender: TObject);
begin
  DMImpr.cdsImprClientesUF.Close;
  DMImpr.cdsImprClientesUF.Params.ParamByName ('ESTADO').Value   := cbEstado.Text;
  DMImpr.cdsImprClientesUF.Open;
end;

procedure TFImprimirClientesUF.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TFImprimirClientesHist, FImprimirClientesHist);
  FImprimirClientesHist.edNome.Text := DMImpr.cdsImprClientesUFNOME_CLIENTE.AsString;
  FImprimirClientesHist.ShowModal;
  FImprimirClientesHist.Free;
  DMImpr.cdsImprHistClientes3.Close;
  DMImpr.cdsImprHistClientes2.Close;
  DMImpr.cdsImprHistClientes1.Close;
end;

procedure TFImprimirClientesUF.bbImpr1Click(Sender: TObject);
begin
  bbImpr1.Enabled    := False;
  bbImpr2.Enabled    := False;
  bbImpr3.Enabled    := False;
  Application.CreateForm(TFImprimirClientesUFRpt1, FImprimirClientesUFRpt1);
  FImprimirClientesUFRpt1.QRLabel1.Caption := FImprimirClientesUFRpt1.QRLabel1.Caption + ' - ' + cbEstado.Text;
  FImprimirClientesUFRpt1.Preview;
  FImprimirClientesUFRpt1.Free;
  bbImpr1.Enabled    := True;
  bbImpr2.Enabled    := True;
  bbImpr3.Enabled    := True;
end;

procedure TFImprimirClientesUF.bbImpr2Click(Sender: TObject);
begin
  bbImpr1.Enabled    := False;
  bbImpr2.Enabled    := False;
  bbImpr3.Enabled    := False;
  Application.CreateForm(TFImprimirClientesUFRpt2, FImprimirClientesUFRpt2);
  FImprimirClientesUFRpt2.QRLabel1.Caption := FImprimirClientesUFRpt2.QRLabel1.Caption + ' - ' + cbEstado.Text;
  FImprimirClientesUFRpt2.Preview;
  FImprimirClientesUFRpt2.Free;
  bbImpr1.Enabled    := True;
  bbImpr2.Enabled    := True;
  bbImpr3.Enabled    := True;
end;

procedure TFImprimirClientesUF.bbImpr3Click(Sender: TObject);
begin
  bbImpr1.Enabled    := False;
  bbImpr2.Enabled    := False;
  bbImpr3.Enabled    := False;
  Application.CreateForm(TFImprimirClientesUFRpt3, FImprimirClientesUFRpt3);
  FImprimirClientesUFRpt3.QRLabel1.Caption := FImprimirClientesUFRpt3.QRLabel1.Caption + ' - ' + cbEstado.Text;
  FImprimirClientesUFRpt3.Preview;
  FImprimirClientesUFRpt3.Free;
  bbImpr1.Enabled    := True;
  bbImpr2.Enabled    := True;
  bbImpr3.Enabled    := True;
end;

procedure TFImprimirClientesUF.cbEstadoChange(Sender: TObject);
begin
  lbEstado.Caption := '';
  if cbEstado.Text = 'AC' then lbEstado.Caption := 'Acre';
  if cbEstado.Text = 'AL' then lbEstado.Caption := 'Alagoas';
  if cbEstado.Text = 'AM' then lbEstado.Caption := 'Amazonas';
  if cbEstado.Text = 'AP' then lbEstado.Caption := 'Amapá';
  if cbEstado.Text = 'BA' then lbEstado.Caption := 'Bahia';
  if cbEstado.Text = 'CE' then lbEstado.Caption := 'Ceará';
  if cbEstado.Text = 'DF' then lbEstado.Caption := 'Distrito Federal';
  if cbEstado.Text = 'ES' then lbEstado.Caption := 'Espírito Santo';
  if cbEstado.Text = 'GO' then lbEstado.Caption := 'Goiás';
  if cbEstado.Text = 'MA' then lbEstado.Caption := 'Manaus';
  if cbEstado.Text = 'MG' then lbEstado.Caption := 'Minas Gerais';
  if cbEstado.Text = 'MS' then lbEstado.Caption := 'Mato Grosso do Sul';
  if cbEstado.Text = 'MT' then lbEstado.Caption := 'Mato Grosso';
  if cbEstado.Text = 'PA' then lbEstado.Caption := 'Pará';
  if cbEstado.Text = 'PB' then lbEstado.Caption := 'Paraíba';
  if cbEstado.Text = 'PE' then lbEstado.Caption := 'Pernambuco';
  if cbEstado.Text = 'PI' then lbEstado.Caption := 'Piauí';
  if cbEstado.Text = 'PR' then lbEstado.Caption := 'Paraná';
  if cbEstado.Text = 'RJ' then lbEstado.Caption := 'Rio de Janeiro';
  if cbEstado.Text = 'RN' then lbEstado.Caption := 'Rio Grande do Norte';
  if cbEstado.Text = 'RO' then lbEstado.Caption := 'Rondônia';
  if cbEstado.Text = 'RR' then lbEstado.Caption := 'Roraima';
  if cbEstado.Text = 'RS' then lbEstado.Caption := 'Rio Grande do Sul';
  if cbEstado.Text = 'SC' then lbEstado.Caption := 'Santa Catarina';
  if cbEstado.Text = 'SE' then lbEstado.Caption := 'Sergipe';
  if cbEstado.Text = 'SP' then lbEstado.Caption := 'São Paulo';
  if cbEstado.Text = 'TO' then lbEstado.Caption := 'Tocantins';
end;

end.
