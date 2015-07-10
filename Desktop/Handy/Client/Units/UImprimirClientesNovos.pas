unit UImprimirClientesNovos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, ComCtrls;

type
  TFImprimirClientesNovos = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    Panel1: TPanel;
    bbImpr1: TBitBtn;
    bbFechar: TBitBtn;
    DataSource1: TDataSource;
    cbAnoMesi: TComboBox;
    lbEstado: TLabel;
    cbAnoMesf: TComboBox;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure bbImpr1Click(Sender: TObject);
    procedure cbAnoMesiChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirClientesNovos: TFImprimirClientesNovos;

implementation

uses UDM, UImprimirClientesHist, UImprimirClientesNovosRpt;

{$R *.dfm}

procedure TFImprimirClientesNovos.DBGrid1DblClick(Sender: TObject);
begin
  Application.CreateForm(TFImprimirClientesHist, FImprimirClientesHist);
  FImprimirClientesHist.edNome.Text := DM.cdsImprClientesNovos.FieldByName('NOME_CLIENTE').AsString;
  FImprimirClientesHist.ShowModal;
  FImprimirClientesHist.Free;
  DM.cdsImprHistClientes3.Close;
  DM.cdsImprHistClientes2.Close;
  DM.cdsImprHistClientes1.Close;
end;

procedure TFImprimirClientesNovos.bbImpr1Click(Sender: TObject);
begin
  bbImpr1.Enabled    := False;
  Application.CreateForm(TFImprimirClientesNovosRpt, FImprimirClientesNovosRpt);
  FImprimirClientesNovosRpt.Preview;
  FImprimirClientesNovosRpt.Free;
  bbImpr1.Enabled    := True;
end;

procedure TFImprimirClientesNovos.cbAnoMesiChange(Sender: TObject);
var
  datainicial, datafinal: TDate;
begin
  datainicial := StrtoDate('01/' + cbAnoMesi.Text);
  datafinal   := StrtoDate('28/' + cbAnoMesf.Text);
  While FormatDateTime ('mm', datafinal) = Copy (cbAnoMesf.Text, 1, 2) do
    datafinal := datafinal + 1;

  DM.cdsImprClientesNovos.Close;
  DM.cdsImprClientesNovos.Filter := 'DATA_CADASTRO >= ''' + FormatDateTime('dd/mm/yyyy', datainicial) + ''' AND DATA_CADASTRO < ''' + FormatDateTime('dd/mm/yyyy', datafinal) + '''';
  DM.cdsImprClientesNovos.Filtered := True;
  DM.cdsImprClientesNovos.IndexFieldNames := 'DATA_CADASTRO';
  DM.cdsImprClientesNovos.Open;
end;

procedure TFImprimirClientesNovos.FormCreate(Sender: TObject);
var
  i, mm, mm1, yyyy, yyyy1: integer;
begin
  mm   := StrtoInt (FormatDateTime('mm', Date));
  yyyy := StrtoInt (FormatDateTime('yyyy', Date));

  for i := -12 to 3 do
  begin
    mm1 := mm + i;
    if mm1 < 1 then
    begin
      mm1 := mm1 + 12;
      yyyy1 := yyyy - 1;
    end else yyyy1 := yyyy;
    cbAnoMesi.Items.Add(InttoStr (mm1) + '/' + InttoStr (yyyy1));
    if i = 0 then
      cbAnoMesi.Text := InttoStr (mm1) + '/' + InttoStr (yyyy1);
  end;
  cbAnoMesf.Items := cbAnoMesi.Items;
  cbAnoMesf.Text := cbAnoMesi.Text;
end;

procedure TFImprimirClientesNovos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if (State <> [gdSelected]) and
     (State <> [gdFocused]) and
     (State <> [gdFixed]) and
     (not DM.cdsImprClientesNovos.FieldByName('DATA_CADASTRO').IsNull) then
  try
    if DM.cdsImprClientesNovos.FieldByName('DATA_CADASTRO').AsDateTime > Date-365 then
    begin
      DBGrid1.Canvas.Font.Color := clGreen;
      DBGrid1.Canvas.TextRect(Rect, Rect.Left, Rect.Top, Column.Field.Value);
    end;
  except
    on E : Exception do
      raise Exception.Create ('Erro ao Atualizar Lista: ' + chr(13) + E.Message);
  end;
end;

procedure TFImprimirClientesNovos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.cdsImprClientesNovos.Close;
  DM.cdsImprClientesNovos.Filtered := False;
  DM.cdsImprClientesNovos.Filter   := '';
end;

end.
