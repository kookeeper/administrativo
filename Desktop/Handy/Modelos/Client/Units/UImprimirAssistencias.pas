unit UImprimirAssistencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, Grids, DBGrids, DBClient;

type
  TFImprimirAssistencias = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    edData: TEdit;
    btnPesquisar: TButton;
    edAssistencia: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    cdsLista: TClientDataSet;
    { Public declarations }
  end;

var
  FImprimirAssistencias: TFImprimirAssistencias;

implementation

uses UDMLista, UDMImpr, UImprimirAssistenciasRpt;

{$R *.dfm}

procedure TFImprimirAssistencias.FormCreate(Sender: TObject);
begin
  cdsLista := TClientDataSet.Create(DMLista);
  cdsLista.RemoteServer := DMLista.SCServerLista;
  cdsLista.ProviderName := 'dspLista';
  DataSource1.DataSet := cdsLista;
end;

procedure TFImprimirAssistencias.btnPesquisarClick(Sender: TObject);
var
  S: String;
begin
  S := 'SELECT NUMERO_ASSISTENCIA, DATA_ASSISTENCIA, NOME_CLIENTE ' +
       'FROM ASSISTENCIAS A ' +
       'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = A.CLIENTE_SQ) ' +
       'WHERE DATA_ASSISTENCIA >= ''' + FormatDateTime ('yyyy-mm-dd', StrtoDate (edData.Text)) + '''' +
       'ORDER BY DATA_ASSISTENCIA DESC';

  cdsLista.Close;
  DMLista.SCServerLista.Open;
  DMLista.SCServerLista.AppServer.CriaLista (S);
  cdsLista.Open;
  if Sender = btnPesquisar then
  begin
    DBGrid1.SetFocus;
    btnPesquisar.Default := False;
    bbImprimir.Default := True;
  end;
end;

procedure TFImprimirAssistencias.bbImprimirClick(Sender: TObject);
begin
  DMImpr.cdsImprAssist.Close;
  DMImpr.cdsImprAssist.Params.ParamByName ('NUMERO_ASSISTENCIA').Value := StrtoInt (edAssistencia.Text);
  DMImpr.cdsImprAssist.Open;
  DMImpr.cdsImprAssistEquip.Close;
  DMImpr.cdsImprAssistEquip.Params.ParamByName ('ASSISTENCIA_SQ').Value := DMImpr.cdsImprAssistASSISTENCIA_SQ.Value;
  DMImpr.cdsImprAssistEquip.Open;
  DMImpr.cdsImprAssistItem.Close;
  DMImpr.cdsImprAssistItem.Params.ParamByName ('ASSISTENCIA_SQ').Value := DMImpr.cdsImprAssistASSISTENCIA_SQ.Value;
  DMImpr.cdsImprAssistItem.Open;

  DMImpr.cdsImprAssist.Refresh;
  DMImpr.cdsImprAssistEquip.Refresh;

  Application.CreateForm(TFImprimirAssistenciasRpt, FImprimirAssistenciasRpt);
  FImprimirAssistenciasRpt.Preview;
  FImprimirAssistenciasRpt.Free;

  DMImpr.cdsImprAssist.Close;
  DMImpr.cdsImprAssistEquip.Close;
  DMImpr.cdsImprAssistItem.Close;
end;

procedure TFImprimirAssistencias.edDataEnter(Sender: TObject);
begin
  btnPesquisar.Default := True;
  bbImprimir.Default := False;
end;

procedure TFImprimirAssistencias.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  edAssistencia.Text := cdsLista.FieldByName ('NUMERO_ASSISTENCIA').AsString;
end;

end.
