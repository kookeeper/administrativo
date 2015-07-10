unit UImprimirClientesHist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ComCtrls;

type
  TFImprimirClientesHist = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edCodigo: TEdit;
    Label2: TLabel;
    edNome: TEdit;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    lbItens: TLabel;
    lbValor: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    dtpInicio: TDateTimePicker;
    dtpTermino: TDateTimePicker;
    Label5: TLabel;
    procedure edCodigoChange(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CalculaTotais ();
  end;

var
  FImprimirClientesHist: TFImprimirClientesHist;

implementation

uses UDM, UImprimirClientesHistRpt, UDMImpr;

{$R *.dfm}

procedure TFImprimirClientesHist.CalculaTotais ();
var
  Qtde: Integer;
  Valor: Real;
begin
  DataSource2.Enabled := False;
  DataSource3.Enabled := False;
  Qtde := 0;
  Valor := 0;
  While not DMImpr.cdsImprHistClientes2.Eof do
  begin
    While not DMImpr.cdsImprHistClientes3.Eof do
    begin
      Qtde := Qtde + DMImpr.cdsImprHistClientes3QTDE_ITEM.Value;
      Valor := Valor + DMImpr.cdsImprHistClientes3VLR_TOTAL_ITEM.Value;
      DMImpr.cdsImprHistClientes3.Next;
    end;
    DMImpr.cdsImprHistClientes2.Next;
  end;
  lbItens.Caption := InttoStr (Qtde);
  lbValor.Caption := FloatToStrF (Valor, ffCurrency, 10, 2);
  if DMImpr.cdsImprHistClientes2.RecordCount > 0 then
    DMImpr.cdsImprHistClientes2.First;
  DataSource2.Enabled := True;
  DataSource3.Enabled := True;
end;

procedure TFImprimirClientesHist.edCodigoChange(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFImprimirClientesHist.bbImprimirClick(Sender: TObject);
var
  Codigo: String;
begin
  Codigo := DMImpr.cdsImprHistClientes1CODIGO_CLIENTE.AsString;
  DataSource1.Enabled := False;
  DataSource2.Enabled := False;
  DataSource3.Enabled := False;

  Application.CreateForm(TFImprimirClientesHistRpt, FImprimirClientesHistRpt);
  FImprimirClientesHistRpt.Preview;
  FImprimirClientesHistRpt.Free;

  DataSource1.Enabled := True;
  DataSource2.Enabled := True;
  DataSource3.Enabled := True;
end;

procedure TFImprimirClientesHist.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  DMImpr.cdsImprHistClientes1.Close;
  DMImpr.cdsImprHistClientes2.Close;
  DMImpr.cdsImprHistClientes3.Close;

  DMImpr.cdsImprHistClientes2.Params.ParamByName ('DT_INICIO').AsString  := FormatDateTime ('dd/mm/yyyy', dtpInicio.Date);
  DMImpr.cdsImprHistClientes2.Params.ParamByName ('DT_TERMINO').AsString := FormatDateTime ('dd/mm/yyyy', dtpTermino.Date);
  DMImpr.cdsImprHistClientes2.Open;

  DMImpr.cdsImprHistClientes1.Params.ParamByName ('CODIGO_CLIENTE').Value := '%' + edCodigo.Text + '%';
  DMImpr.cdsImprHistClientes1.Params.ParamByName ('NOME_CLIENTE').Value   := '%' + edNome.Text   + '%';
  DMImpr.cdsImprHistClientes1.Open;
  CalculaTotais;
end;

end.
