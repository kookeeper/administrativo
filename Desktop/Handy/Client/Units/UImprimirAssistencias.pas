unit UImprimirAssistencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, DBClient, Mask,
  RzEdit;

type
  TFImprimirAssistencias = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    btnPesquisar: TButton;
    edData: TRzEdit;
    edAssistencia: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    cds: TClientDataSet;
    { Public declarations }
  end;

var
  FImprimirAssistencias: TFImprimirAssistencias;

implementation

uses UDM, UImprimirAssistenciasRpt;

{$R *.dfm}

procedure TFImprimirAssistencias.FormCreate(Sender: TObject);
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';
  DataSource1.DataSet := cds;
end;

procedure TFImprimirAssistencias.btnPesquisarClick(Sender: TObject);
var
  S: String;
begin
  S := 'SELECT NUMERO_ASSISTENCIA, DATA_ASSISTENCIA, NOME_CLIENTE ' +
       'FROM assistencias A ' +
       'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = A.CLIENTE_SQ) ' +
       'WHERE DATA_ASSISTENCIA >= ''' + FormatDateTime ('yyyy-mm-dd', StrtoDate (edData.Text)) + '''' +
       'ORDER BY DATA_ASSISTENCIA DESC';

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

procedure TFImprimirAssistencias.bbImprimirClick(Sender: TObject);
begin
  DM.cdsImprAssist.Close;
  DM.cdsImprAssist.Params.ParamByName ('NUMERO_ASSISTENCIA').Value := StrtoInt (edAssistencia.Text);
  DM.cdsImprAssist.Open;
  DM.cdsImprAssistEquip.Close;
  DM.cdsImprAssistEquip.Params.ParamByName ('ASSISTENCIA_SQ').Value := DM.cdsImprAssistASSISTENCIA_SQ.Value;
  DM.cdsImprAssistEquip.Open;
  DM.cdsImprAssistItem.Close;
  DM.cdsImprAssistItem.Params.ParamByName ('ASSISTENCIA_SQ').Value := DM.cdsImprAssistASSISTENCIA_SQ.Value;
  DM.cdsImprAssistItem.Open;

  DM.cdsImprAssist.Refresh;
  DM.cdsImprAssistEquip.Refresh;

  Application.CreateForm(TFImprimirAssistenciasRpt, FImprimirAssistenciasRpt);
  FImprimirAssistenciasRpt.Preview;
  FImprimirAssistenciasRpt.Free;

  DM.cdsImprAssist.Close;
  DM.cdsImprAssistEquip.Close;
  DM.cdsImprAssistItem.Close;
end;

procedure TFImprimirAssistencias.edDataEnter(Sender: TObject);
begin
  btnPesquisar.Default := True;
  bbImprimir.Default := False;
end;

procedure TFImprimirAssistencias.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  edAssistencia.Text := cds.FieldByName ('NUMERO_ASSISTENCIA').AsString;
end;

end.
