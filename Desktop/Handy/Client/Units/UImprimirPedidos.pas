unit UImprimirPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, QuickRpt, Qrctrls, jpeg, DB, Grids,
  DBGrids, DBClient, Mask, RzEdit;

type
  TFImprimirPedidos = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    DBGrid1: TDBGrid;
    dsImprPed: TDataSource;
    btnPesquisar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edData: TRzEdit;
    edPedido: TRzEdit;
    cdsImprPed: TClientDataSet;
    cdsImprPedPEDIDO_SQ: TIntegerField;
    cdsImprPedDDD_FONE1: TStringField;
    cdsImprPedNUMERO_FONE1: TStringField;
    cdsImprPedCOMPL_FONE1: TStringField;
    cdsImprPedDDD_CELULAR: TStringField;
    cdsImprPedNUMERO_CELULAR: TStringField;
    cdsImprPedCOMPL_CELULAR: TStringField;
    cdsImprPedENDERECO: TStringField;
    cdsImprPedNUMERO: TStringField;
    cdsImprPedCOMPL_ENDERECO: TStringField;
    cdsImprPedDDD_FONE2: TStringField;
    cdsImprPedNUMERO_FONE2: TStringField;
    cdsImprPedCOMPL_FONE2: TStringField;
    cdsImprPedDDD_FONE3: TStringField;
    cdsImprPedNUMERO_FONE3: TStringField;
    cdsImprPedCOMPL_FONE3: TStringField;
    cdsImprPedDDD_FAX: TStringField;
    cdsImprPedNUMERO_FAX: TStringField;
    cdsImprPedCOMPL_FAX: TStringField;
    cdsImprPedCODIGO_CLIENTE: TStringField;
    cdsImprPedNOME_CLIENTE: TStringField;
    cdsImprPedCONTATO: TStringField;
    cdsImprPedINSCR_ESTADUAL: TStringField;
    cdsImprPedBAIRRO: TStringField;
    cdsImprPedCIDADE: TStringField;
    cdsImprPedESTADO: TStringField;
    cdsImprPedPAIS: TStringField;
    cdsImprPedCEP: TStringField;
    cdsImprPedNOME_VENDEDOR: TStringField;
    cdsImprPedCODIGO_VENDEDOR: TIntegerField;
    cdsImprPedTIPO_NFISCAL: TIntegerField;
    cdsImprPedDESCRICAO_NATUREZA: TStringField;
    cdsImprPedCFO: TStringField;
    cdsImprPedCODIGO_TRANSPORTADORA: TStringField;
    cdsImprPedNOME_TRANSPORTADORA: TStringField;
    cdsImprPedOBSERVACAO_NAT: TMemoField;
    cdsImprPedVLR_FRETE: TBCDField;
    cdsImprPedVLR_SEGURO: TBCDField;
    cdsImprPedFRETE_TRANSP: TStringField;
    cdsImprPedDIAS_DEMONSTRACAO: TIntegerField;
    cdsImprPedDATA_PEDIDO: TDateTimeField;
    cdsImprPedNUMERO_PEDIDO: TIntegerField;
    cdsImprPedCOTACAO_DOLAR: TBCDField;
    cdsImprPedOBSERVACAO_PED: TMemoField;
    cdsImprPedOBSERVACAO_NF: TMemoField;
    cdsImprPedVLR_PRODUTOS: TBCDField;
    cdsImprPedVLR_IPI: TBCDField;
    cdsImprPedVLR_ICMS: TBCDField;
    cdsImprPedD00: TIntegerField;
    cdsImprPedD01: TIntegerField;
    cdsImprPedD02: TIntegerField;
    cdsImprPedD03: TIntegerField;
    cdsImprPedD04: TIntegerField;
    cdsImprPedD05: TIntegerField;
    cdsImprPedD06: TIntegerField;
    cdsImprPedD07: TIntegerField;
    cdsImprPedD08: TIntegerField;
    cdsImprPedD09: TIntegerField;
    cdsImprPedPARCELAS: TIntegerField;
    cdsImprPedDESCRICAO_COND_PAGTO: TStringField;
    cdsImprPedP00: TIntegerField;
    cdsImprPedP01: TIntegerField;
    cdsImprPedP02: TIntegerField;
    cdsImprPedP03: TIntegerField;
    cdsImprPedP04: TIntegerField;
    cdsImprPedP05: TIntegerField;
    cdsImprPedP06: TIntegerField;
    cdsImprPedP07: TIntegerField;
    cdsImprPedP08: TIntegerField;
    cdsImprPedP09: TIntegerField;
    cdsImprPedbase_icms_subst: TBCDField;
    cdsImprPedvlr_icms_subst: TBCDField;
    cdsImprPedvlr_total: TBCDField;
    cdsImprPedItem: TClientDataSet;
    cdsImprPedItemNR_SERIE_ITEM: TMemoField;
    cdsImprPedItemCODIGO_PRODUTO: TStringField;
    cdsImprPedItemDESCRICAO_PRODUTO: TStringField;
    cdsImprPedItemQTDE_PEDIDO_ITEM: TIntegerField;
    cdsImprPedItemCODIGO_NBM: TStringField;
    cdsImprPedItemPRECO_UNIT: TBCDField;
    cdsImprPedItemVLR_DESC: TBCDField;
    cdsImprPedItemVLR_IPI_ITEM: TBCDField;
    cdsImprPedItemALIQ_ICMS_ITEM: TBCDField;
    cdsImprPedItemALIQ_IPI_ITEM: TBCDField;
    cdsImprPedItemVLR_TOTAL_ITEM: TBCDField;
    cdsImprPedItembase_icms_subst_item: TBCDField;
    cdsImprPedItemvlr_icms_subst_item: TBCDField;
    procedure bbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edDataEnter(Sender: TObject);
    procedure dsImprPedDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    cds: TClientDataSet;
    { Public declarations }
  end;

var
  FImprimirPedidos: TFImprimirPedidos;

implementation

uses UImprimirPedidosRpt, Pedido, Cadastro, UDM;

{$R *.DFM}

procedure TFImprimirPedidos.bbImprimirClick(Sender: TObject);
var
  pedido: TPedido;
begin
  pedido := TPedido.CreateFiltro('numero_pedido='+edPedido.Text);
  cdsImprPed.CloneCursor(pedido.cdsImpressao, false);
  cdsImprPedItem.CloneCursor(pedido.cdsImpressaoItem, false);

  try
    FImprimirPedidosRpt := TFImprimirPedidosRpt.Create(Self);
    FImprimirPedidosRpt.Preview;
  finally
    FreeAndNil(FImprimirPedidosRpt);
  end;
end;

procedure TFImprimirPedidos.FormCreate(Sender: TObject);
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';
  dsImprPed.DataSet := cds;
end;

procedure TFImprimirPedidos.btnPesquisarClick(Sender: TObject);
var
  S: String;
begin
  S := 'SELECT NUMERO_PEDIDO, NUMERO_NFISCAL, DATA_PEDIDO, NOME_CLIENTE ' +
       'FROM pedidos P ' +
       'LEFT OUTER JOIN nfiscais N ON (N.NFISCAL_SQ = P.NFISCAL_SQ) ' +
       'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = P.CLIENTE_SQ) ' + 
       'WHERE DATA_PEDIDO >= ''' + FormatDateTime ('yyyy-mm-dd', StrtoDate (edData.Text)) + '''' +
       'ORDER BY numero_pedido DESC';

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

procedure TFImprimirPedidos.edDataEnter(Sender: TObject);
begin
  btnPesquisar.Default := True;
  bbImprimir.Default := False;
end;

procedure TFImprimirPedidos.dsImprPedDataChange(Sender: TObject;
  Field: TField);
begin
  edPedido.Text := cds.FieldByName ('NUMERO_PEDIDO').AsString;
end;

procedure TFImprimirPedidos.FormActivate(Sender: TObject);
begin
  edData.Text := FormatDateTime ('dd/mm/yyyy', Date-10);
  btnPesquisar.OnClick (nil);
end;

end.
