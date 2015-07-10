unit UImprimirRMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, OleServer, ExcelXP, StdCtrls,
  Buttons, RzCmboBx, RzLabel, Mask, RzEdit, DBClient;

type
  TFImprimirRMA = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    btnPesquisar: TButton;
    edData: TRzEdit;
    edRMA: TRzNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure bbImprimirClick(Sender: TObject);
  private
    cds: TClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirRMA: TFImprimirRMA;

implementation

uses UDM, UImprimirRMARpt;

{$R *.dfm}

procedure TFImprimirRMA.FormCreate(Sender: TObject);
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';
  DataSource1.DataSet := cds;
end;

procedure TFImprimirRMA.btnPesquisarClick(Sender: TObject);
var
  S: String;
begin
  S := 'select * from rma ';
  if (edData.Text <> '') then
    s := s + ' where data_entrada_nf >= ' +
    QuotedStr(FormatDateTime ('yyyy-mm-dd', StrtoDate (edData.Text)));
  s := s + ' order by data_entrada_nf desc';

  cds.Close;
  DM.SCServer.AppServer.CriaLista (S);
  cds.Open;
  if Sender = btnPesquisar then
  begin
    DBGrid1.SetFocus;
    btnPesquisar.Default := False;
    bbImprimir.Default := True;
  end;
end;

procedure TFImprimirRMA.edDataEnter(Sender: TObject);
begin
  btnPesquisar.Default := True;
  bbImprimir.Default := False;
end;

procedure TFImprimirRMA.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  edRMA.IntValue := cds.FieldByName ('numero_rma').Value;
end;

procedure TFImprimirRMA.bbImprimirClick(Sender: TObject);
begin
  DM.cdsImprRMA2.Close;
  DM.cdsImprRMA2.Params.ParamByName ('numero_rma').Value := edRMA.IntValue;
  DM.cdsImprRMA2.Open;
  DM.cdsImprRMA2Item.Close;
  DM.cdsImprRMA2Item.Params.ParamByName ('rma_sq').Value := DM.cdsImprRMA2.FieldByName('rma_sq').Value;
  DM.cdsImprRMA2Item.Open;

  FImprimirRMARpt := TFImprimirRMARpt.Create(Self);
  FImprimirRMARpt.Preview;
  FImprimirRMARpt.Free;

  DM.cdsImprRMA2Item.Close;
  DM.cdsImprRMA2.Close;
end;

end.
