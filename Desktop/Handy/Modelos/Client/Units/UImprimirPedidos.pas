unit UImprimirPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, QuickRpt, Qrctrls, jpeg, DB, Grids,
  DBGrids, DBClient;

type
  TFImprimirPedidos = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    edData: TEdit;
    btnPesquisar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edPedido: TEdit;
    procedure bbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    cdsLista: TClientDataSet;
    { Public declarations }
  end;

var
  FImprimirPedidos: TFImprimirPedidos;

implementation

uses UDMImpr, UDM, UImprimirPedidosRpt, UDMLista;

{$R *.DFM}

procedure TFImprimirPedidos.bbImprimirClick(Sender: TObject);
begin
  DMImpr.cdsImprPed.Close;
  DMImpr.cdsImprPed.Params.ParamByName ('NUMERO_PEDIDO').Value := StrtoInt (edPedido.Text);
  DMImpr.cdsImprPed.Open;
  DMImpr.cdsImprPedItem.Close;
  DMImpr.cdsImprPedItem.Params.ParamByName ('PEDIDO_SQ').Value := DMImpr.cdsImprPedPEDIDO_SQ.Value;
  DMImpr.cdsImprPedItem.Open;

  DMImpr.cdsImprPed.Refresh;
  DMImpr.cdsImprPedItem.Refresh;
//  DMImpr.SCServerImpr.Close;

  Application.CreateForm(TFImprimirPedidosRpt, FImprimirPedidosRpt);
  FImprimirPedidosRpt.Preview;
  FImprimirPedidosRpt.Free;

  DMImpr.cdsImprPed.Close;
  DMImpr.cdsImprPedItem.Close;
end;

procedure TFImprimirPedidos.FormCreate(Sender: TObject);
begin
  cdsLista := TClientDataSet.Create(DMLista);
  cdsLista.RemoteServer := DMLista.SCServerLista;
  cdsLista.ProviderName := 'dspLista';
  DataSource1.DataSet := cdsLista;
end;

procedure TFImprimirPedidos.btnPesquisarClick(Sender: TObject);
var
  S: String;
begin
  S := 'SELECT NUMERO_PEDIDO, NUMERO_NFISCAL, DATA_PEDIDO, NOME_CLIENTE ' +
       'FROM PEDIDOS P ' +
       'LEFT OUTER JOIN NFISCAIS N ON (N.NFISCAL_SQ = P.NFISCAL_SQ) ' +
       'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = P.CLIENTE_SQ) ' + 
       'WHERE DATA_PEDIDO >= ''' + FormatDateTime ('yyyy-mm-dd', StrtoDate (edData.Text)) + '''' +
       'ORDER BY DATA_PEDIDO DESC';

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

procedure TFImprimirPedidos.edDataEnter(Sender: TObject);
begin
  btnPesquisar.Default := True;
  bbImprimir.Default := False;
end;

procedure TFImprimirPedidos.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin
  edPedido.Text := cdsLista.FieldByName ('NUMERO_PEDIDO').AsString;
end;

end.
