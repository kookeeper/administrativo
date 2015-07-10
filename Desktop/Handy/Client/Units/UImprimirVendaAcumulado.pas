unit UImprimirVendaAcumulado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls,
  ComCtrls, TeEngine, Series, TeeProcs, Chart, DbChart, Mask, RzEdit, DBClient,
  RzDTP, RzPanel, RzRadGrp, RzButton, RzRadChk, RzDBCmbo;

type
  TFImprimirVendaAcumulado = class(TForm)
    dsListaVendedores: TDataSource;
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    dsListaProdutos: TDataSource;
    dsListaEstados: TDataSource;
    SaveDialog1: TSaveDialog;
    DBGrid1: TDBGrid;
    dsListaVenda: TDataSource;
    Panel2: TPanel;
    Label2: TLabel;
    edCnpj: TRzEdit;
    dblEstado: TRzDBLookupComboBox;
    dblProduto: TRzDBLookupComboBox;
    dblVendedor: TRzDBLookupComboBox;
    cbVendedor: TRzCheckBox;
    cbCliente: TRzCheckBox;
    cbProduto: TRzCheckBox;
    cbEstado: TRzCheckBox;
    edAnoBase: TRzNumericEdit;
    procedure dblVendedorClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirVendaAcumulado: TFImprimirVendaAcumulado;

implementation

uses UDM, UImprimirNfiscaisVendRpt, UCadastrarListaNfiscais,
  UCadastrarFormNfiscais, Vendedor, Produto, Nfiscal, QuickRpt, Estado;

{$R *.dfm}

procedure TFImprimirVendaAcumulado.dblVendedorClick(Sender: TObject);
var
  vendedor_sq, codigo_cliente, estado: Variant;
begin
  dblProduto.Enabled := cbProduto.Checked;
  dblVendedor.Enabled := cbVendedor.Checked;
  edCnpj.Enabled := cbCliente.Checked;
  dblEstado.Enabled := cbEstado.Checked;

  if (not dblProduto.Enabled) then
  begin
    dblProduto.KeyValue := null;
  end
  else if dblProduto.KeyValue = null then
  begin
    dblProduto.KeyValue := dsListaProdutos.DataSet.FieldByName('produto_sq').AsInteger;
  end;

  vendedor_sq := null;
  codigo_cliente := null;
  estado := null;

  if dblVendedor.Enabled then
    vendedor_sq := dblVendedor.KeyValue;

  if edCnpj.Enabled then
    codigo_cliente := edCnpj.Text;

  if dblEstado.Enabled then
    estado := dblEstado.GetKeyValue;

  dsListaVenda.DataSet := TNfiscal.listaVendaAcumulada(edAnoBase.IntValue, dblProduto.KeyValue, vendedor_sq, codigo_cliente, estado);
end;

procedure TFImprimirVendaAcumulado.bbImprimirClick(Sender: TObject);
begin
  bbImprimir.Enabled := False;
  bbFechar.Enabled := False;
  try
    DM.ExpExcel(dsListaVenda.DataSet, SaveDialog1.FileName);

  finally
    bbImprimir.Enabled := True;
    bbFechar.Enabled := True;
  end;
end;

procedure TFImprimirVendaAcumulado.FormCreate(Sender: TObject);
begin
  dsListaEstados.DataSet := TEstado.listaRegistros('order by codigo_estado');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  dsListaProdutos.DataSet := TProduto.listaRegistros('order by descricao_produto');
  dblVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName('VENDEDOR_SQ').AsInteger;
  edAnoBase.IntValue := StrToInt(FormatDateTime ('yyyy', Date));
  dblVendedor.OnClick(Sender);
end;

end.

