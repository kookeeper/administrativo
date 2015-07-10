unit UEditarNFiscalItemImportacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, DBCtrls, RzDBCmbo, ExtCtrls, RzPanel,
  Buttons, DB, DBClient, ToolWin, ComCtrls, Grids, DBGrids, RzDBGrid, Nfiscal;

type
  TFEditarNFiscalItemImportacao = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edNumeroDI: TRzEdit;
    edLocalDesemb: TRzEdit;
    edCodigoExportador: TRzEdit;
    edDataDI: TRzDateTimeEdit;
    edDataDesemb: TRzDateTimeEdit;
    edUFDesemb: TRzDBLookupComboBox;
    RzGroupBox2: TRzGroupBox;
    Label7: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    Label21: TLabel;
    edBaseIIItem: TRzNumericEdit;
    edVlrDespAduItem: TRzNumericEdit;
    edVlrIIItem: TRzNumericEdit;
    edVlrIOFItem: TRzNumericEdit;
    Panel1: TPanel;
    bbOk: TBitBtn;
    dsListaEstados: TDataSource;
    RzGroupBox3: TRzGroupBox;
    gridItemAdicao: TRzDBGrid;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    cdsItemAdicao: TClientDataSet;
    dsItemAdicao: TDataSource;
    cdsItemAdicaonfiscal_item_adicao_sq: TIntegerField;
    cdsItemAdicaonfiscal_item_sq: TIntegerField;
    cdsItemAdicaonumero_adicao: TIntegerField;
    cdsItemAdicaonumero_sequencial_adicao: TIntegerField;
    cdsItemAdicaocodigo_fabricante: TStringField;
    cdsItemAdicaovlr_desc_adicao: TBCDField;
    procedure FormDestroy(Sender: TObject);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    function BuscaItemAdicao(itemNfiscal: TNfiscalItem; numeroAdicao,
      numeroSequencia: Integer): TNfiscalItemAdicao;
    { Private declarations }
  public
    constructor Create(Sender: TComponent; itemNfiscal: TNfiscalItem); overload;
  end;

var
  FEditarNFiscalItemImportacao: TFEditarNFiscalItemImportacao;

implementation

uses Estado, UEditarNFiscaisItens;

{$R *.dfm}

procedure TFEditarNFiscalItemImportacao.FormDestroy(Sender: TObject);
begin
  dsListaEstados.DataSet.Close;
end;

procedure TFEditarNFiscalItemImportacao.sbNovoItemClick(Sender: TObject);
begin
  cdsItemAdicao.Append;
end;

procedure TFEditarNFiscalItemImportacao.sbEditarItemClick(Sender: TObject);
begin
  cdsItemAdicao.Edit;
end;

procedure TFEditarNFiscalItemImportacao.sbApagarItemClick(Sender: TObject);
begin
  cdsItemAdicao.Delete;
end;

constructor TFEditarNFiscalItemImportacao.Create(Sender: TComponent;
  itemNfiscal: TNfiscalItem);
var
  i: Integer;
begin
  Self.Create(Sender);
  cdsItemAdicao.CreateDataSet;
  dsListaEstados.DataSet := TEstado.listaRegistros('order by codigo_estado');
  edDataDI.Clear;
  edDataDesemb.Clear;

  edBaseIIItem.Value     := itemNfiscal.base_ii_item;
  edVlrIIItem.Value      := itemNfiscal.vlr_ii_item;
  edVlrDespAduItem.Value := itemNfiscal.vlr_desp_adu_item;
  edVlrIOFItem.Value     := itemNfiscal.vlr_iof_item;
  edNumeroDI.Text        := itemNfiscal.numero_di;
  if itemNfiscal.data_di > 0 then
    edDataDI.Date        := itemNfiscal.data_di;

  edLocalDesemb.Text     := itemNfiscal.local_desemb;
  edUFDesemb.KeyValue    := itemNfiscal.uf_desemb;
  if itemNfiscal.data_desemb > 0 then
    edDataDesemb.Date    := itemNfiscal.data_desemb;

  edCodigoExportador.Text:= itemNfiscal.codigo_exportador;

  cdsItemAdicao.Close;
  cdsItemAdicao.CreateDataSet;
  for i := 0 to itemNfiscal.listaAdicao.Count - 1 do
  With TNfiscalItemAdicao(itemNfiscal.listaAdicao.Items[i]) do
  begin
    cdsItemAdicao.Append;
    if vIndice = null then
      cdsItemAdicaonfiscal_item_adicao_sq.Value := 0
    else
      cdsItemAdicaonfiscal_item_adicao_sq.Value := vIndice;
    cdsItemAdicaonfiscal_item_sq.Value          := nfiscal_item_sq;
    cdsItemAdicaonumero_adicao.Value            := numero_adicao ;
    cdsItemAdicaonumero_sequencial_adicao.Value := numero_sequencial_adicao;
    cdsItemAdicaocodigo_fabricante.Value        := codigo_fabricante;
    cdsItemAdicaovlr_desc_adicao.Value          := vlr_desc_adicao;
    cdsItemAdicao.Post;
  end;

end;

procedure TFEditarNFiscalItemImportacao.bbOkClick(Sender: TObject);
var
  itemNfiscal: TNfiscalItem;
  itemAdicao: TNfiscalItemAdicao;
begin
  itemNfiscal := FEditarNFiscaisItens.itemNfiscal;

  itemNfiscal.base_ii_item      := edBaseIIItem.Value;
  itemNfiscal.vlr_ii_item       := edVlrIIItem.Value;
  itemNfiscal.vlr_desp_adu_item := edVlrDespAduItem.Value;
  itemNfiscal.vlr_iof_item      := edVlrIOFItem.Value;

  itemNfiscal.numero_di           := edNumeroDI.Text;
  itemNfiscal.data_di             := edDataDI.Date;
  itemNfiscal.local_desemb        := edLocalDesemb.Text;
  if edUFDesemb.KeyValue = null then
    itemNfiscal.uf_desemb         := ''
  else
    itemNfiscal.uf_desemb         := edUFDesemb.KeyValue;
  itemNfiscal.data_desemb         := edDataDesemb.Date;
  itemNfiscal.codigo_exportador   := edCodigoExportador.Text;

  cdsItemAdicao.First;
  while not cdsItemAdicao.Eof do
  begin
    itemAdicao := BuscaItemAdicao(itemNfiscal,
      cdsItemAdicaonumero_adicao.Value,
      cdsItemAdicaonumero_sequencial_adicao.Value);
    itemNfiscal.listaAdicao.Extract(itemAdicao);

    itemAdicao.nfiscal_item_sq          := cdsItemAdicaonfiscal_item_sq.Value;
    itemAdicao.numero_adicao            := cdsItemAdicaonumero_adicao.Value;
    itemAdicao.numero_sequencial_adicao := cdsItemAdicaonumero_sequencial_adicao.Value;
    itemAdicao.codigo_fabricante        := cdsItemAdicaocodigo_fabricante.Value;
    itemAdicao.vlr_desc_adicao          := cdsItemAdicaovlr_desc_adicao.Value;

    itemNfiscal.listaAdicao.Add(itemAdicao);

    cdsItemAdicao.Next;
  end;
end;

function TFEditarNFiscalItemImportacao.BuscaItemAdicao(itemNfiscal: TNfiscalItem;
  numeroAdicao, numeroSequencia: Integer): TNfiscalItemAdicao;
var
  i: Integer;
begin
  result := TNfiscalItemAdicao.Create;
  for i := 0 to itemNfiscal.listaAdicao.Count - 1 do
    if ((TNfiscalItemAdicao(itemNfiscal.listaAdicao.Items[i]).numero_adicao = numeroAdicao) and
       (TNfiscalItemAdicao(itemNfiscal.listaAdicao.Items[i]).numero_sequencial_adicao = numeroSequencia)) then
        result := TNfiscalItemAdicao(itemNfiscal.listaAdicao.Items[i]);
end;

end.
