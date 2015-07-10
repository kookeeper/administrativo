unit UCadastrarFormNfiscais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, DBCtrls, ToolWin,
  ComCtrls, Grids, DBGrids, Mask, Variants, DBClient, RzCmboBx, RzDBCmbo,
  RzEdit, RzDBEdit, RzDBGrid, Math, Nfiscal;

type
  TFCadastrarFormNfiscais = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    tsItens: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    tsMensagem: TTabSheet;
    dsListaCondPagto: TDataSource;
    dsListaNaturezas: TDataSource;
    tsCabecalho: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    dblcCondPagto: TDBLookupComboBox;
    dbldCondPagto: TDBLookupComboBox;
    dblcNatureza: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    tsRodape: TTabSheet;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    lblCliente: TLabel;
    dblcCliente: TDBLookupComboBox;
    dblnCliente: TDBLookupComboBox;
    Label11: TLabel;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    dsListaClientes: TDataSource;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    dsListaTransportadoras: TDataSource;
    GroupBox2: TGroupBox;
    dblTransportadora: TDBLookupComboBox;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    GroupBox4: TGroupBox;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    dsListaPedidos: TDataSource;
    Label51: TLabel;
    Label52: TLabel;
    mmMensagem: TMemo;
    rgFrete: TRadioGroup;
    DBEdit1: TDBEdit;
    cbEstadoTransp: TComboBox;
    Label53: TLabel;
    Label54: TLabel;
    dblVendedor: TDBLookupComboBox;
    dsListaVendedores: TDataSource;
    bbAtualizar: TBitBtn;
    SpeedButton1: TSpeedButton;
    dbldNatureza: TDBLookupComboBox;
    Label55: TLabel;
    DBEdit2: TDBEdit;
    Label56: TLabel;
    ednfat1: TRzEdit;
    edvfat1: TRzEdit;
    eddfat1: TRzEdit;
    eddfat2: TRzEdit;
    ednfat2: TRzEdit;
    edvfat2: TRzEdit;
    eddfat3: TRzEdit;
    ednfat3: TRzEdit;
    edvfat3: TRzEdit;
    edNrNfiscal: TRzEdit;
    edDtEmissao: TRzEdit;
    edDtSaida: TRzEdit;
    edDemonstracao: TRzEdit;
    edPlacaTransp: TRzEdit;
    edEspecieTransp: TRzEdit;
    edPBrutoTransp: TRzEdit;
    edMarcaTransp: TRzEdit;
    edNumeroTransp: TRzEdit;
    edPLiquidoTransp: TRzEdit;
    edBaseICMS: TRzEdit;
    edVlrIcms: TRzEdit;
    edBaseICMSStrib: TRzEdit;
    edVlrICMSStrib: TRzEdit;
    edVlrProd: TRzEdit;
    edVlrTotal: TRzEdit;
    edVlrIPI: TRzEdit;
    edVlrDespAcess: TRzEdit;
    edVlrSeguro: TRzEdit;
    edVlrFrete: TRzEdit;
    edClass1: TRzEdit;
    edClass2: TRzEdit;
    edClass3: TRzEdit;
    edClass4: TRzEdit;
    edClass5: TRzEdit;
    edClass6: TRzEdit;
    edQtdeTransp: TRzNumericEdit;
    Label5: TLabel;
    Label43: TLabel;
    Label50: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    edClass7: TRzEdit;
    edClass8: TRzEdit;
    edClass9: TRzEdit;
    edClass10: TRzEdit;
    edClass11: TRzEdit;
    edClass12: TRzEdit;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    edClass13: TRzEdit;
    edClass14: TRzEdit;
    edClass15: TRzEdit;
    edClass16: TRzEdit;
    edClass17: TRzEdit;
    edClass18: TRzEdit;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    edClass19: TRzEdit;
    edClass20: TRzEdit;
    edClass21: TRzEdit;
    edClass22: TRzEdit;
    edClass23: TRzEdit;
    edClass24: TRzEdit;
    mmInfAdic: TMemo;
    Label72: TLabel;
    TabSheet1: TTabSheet;
    Label73: TLabel;
    Label74: TLabel;
    edChaveNFe: TRzEdit;
    mmNFeResposta: TRzMemo;
    Label75: TLabel;
    edNumeroNFe: TRzEdit;
    lblNfReferencia: TLabel;
    edNfRef: TRzEdit;
    RzDBGrid1: TRzDBGrid;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    edPedido: TRzNumericEdit;
    edDolar: TRzNumericEdit;
    sbAtualizarQtde: TSpeedButton;
    cdsItensNFISCAL_ITEM_SQ: TIntegerField;
    cdsItensNFISCAL_SQ: TIntegerField;
    cdsItensITEM: TIntegerField;
    cdsItensPRODUTO_SQ: TIntegerField;
    cdsItensNR_SERIE_ITEM: TMemoField;
    cdsItensCLASS_FISCAL: TStringField;
    cdsItensSTRIBUT: TIntegerField;
    cdsItensqtde_item: TIntegerField;
    cdsItensVLR_UNIT_ITEM: TBCDField;
    cdsItensVLR_TOTAL_ITEM: TBCDField;
    cdsItensALIQ_ICMS_ITEM: TBCDField;
    cdsItensALIQ_IPI_ITEM: TBCDField;
    cdsItensVLR_ICMS_ITEM: TBCDField;
    cdsItensVLR_IPI_ITEM: TBCDField;
    cdsItensPESO_BRUTO: TBCDField;
    cdsItensPESO_LIQUIDO: TBCDField;
    cdsItensVLR_DESC: TBCDField;
    cdsItensPCT_DESC: TBCDField;
    cdsItensVLR_JUROS: TBCDField;
    cdsItensPCT_JUROS: TBCDField;
    cdsItensbase_icms_subst_item: TBCDField;
    cdsItensvlr_icms_subst_item: TBCDField;
    cdsItensorigem_mercadoria: TIntegerField;
    cdsItenscodigo_produto: TStringField;
    cdsItensdescricao_produto: TStringField;
    cdsItenscodigo_nbm: TStringField;
    edtTipoCliente: TRzEdit;
    cdsItensvlr_frete_item: TBCDField;
    cdsItensvlr_seguro_item: TBCDField;
    cdsItensvlr_desp_acess_item: TBCDField;
    Label78: TLabel;
    edVlrII: TRzEdit;
    cdsItensvlr_ii_item: TBCDField;
    cdsItensbase_ii_item: TBCDField;
    cdsItensvlr_desp_adu_item: TBCDField;
    cdsItensvlr_iof_item: TBCDField;
    cdsItensnumero_di: TStringField;
    cdsItensdata_di: TDateField;
    cdsItenslocal_desemb: TStringField;
    cdsItensuf_desemb: TStringField;
    cdsItensdata_desemb: TDateField;
    cdsItenscodigo_exportador: TStringField;
    cdsItemAdicao: TClientDataSet;
    cdsItemAdicaonfiscal_item_adicao_sq: TIntegerField;
    cdsItemAdicaonfiscal_item_sq: TIntegerField;
    cdsItemAdicaonumero_adicao: TIntegerField;
    cdsItemAdicaonumero_sequencial_adicao: TIntegerField;
    cdsItemAdicaocodigo_fabricante: TStringField;
    cdsItemAdicaovlr_desc_adicao: TBCDField;
    TabSheet2: TTabSheet;
    GroupBox5: TGroupBox;
    Label77: TLabel;
    Label83: TLabel;
    edUfEmbarque: TRzEdit;
    edLocalEmbarque: TRzEdit;
    cdsItensbase_icms_item: TBCDField;
    sbPesquisarPedido: TSpeedButton;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure edPedidoExit(Sender: TObject);
    procedure lblClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure dblcCondPagtoClick(Sender: TObject);
    procedure edNrNfiscalExit(Sender: TObject);
    procedure bbAtualizarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RzDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbAtualizarQtdeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPesquisarPedidoClick(Sender: TObject);
  private
    FnfComp, _notaManual, _notaConcluida: Boolean;
    nfiscal: TNfiscal;

    procedure TotalizaNfiscal ();
    procedure Classificacao ();
    procedure TransferePedido (numeroPedido: Integer);
    procedure AtualizaItens ();
    procedure SetNfComp(const Value: Boolean);
    procedure AtualizacdsItens();
    procedure setNotaManual(const Value: Boolean);
    procedure setNotaConcluida(const Value: Boolean);
    procedure carregaTela();
  public
    MensagemPedido: String;
    Demonstracao: Boolean;
    property nfComplementar: Boolean read FnfComp write SetNfComp;
    property notaManual: Boolean read _notaManual write setNotaManual;
    property notaConcluida: Boolean read _notaConcluida write setNotaConcluida;
  end;

var
  FCadastrarFormNfiscais: TFCadastrarFormNfiscais;

implementation

uses UDM, UEditarNFiscaisItens, UCadastrarListaNfiscais, UBuscaClientes,
  UCadastrarListaComum, Vendedor, Transportadora, Produto, Cadastro, ncm,
  Pedido, Cliente, CondPagto, Natureza, StrUtils, Empresa, EstadoIva,
  UEditarNFiscalItemImportacao, CartaCorrecao, uPesquisarPedido;

{$R *.DFM}

procedure TFCadastrarFormNfiscais.AtualizaItens ();
var
  VlrUnit, Dolar, Qtde, VlrTot, VlrTotSIpi, PctDesc, AliqICMS, AliqIPI,
  VlrUnitSIpi, VlrICMS, VlrIPI, PctJuros, BaseICMSSub, VlrICMSSub, BaseICMS: Real;
  i: Integer;
begin
  for i := 0 to nfiscal.listaItem.Count - 1 do
  With TNfiscalItem(nfiscal.listaItem.Items[i]) do
  begin
    VlrUnit  := vlr_unit_item;
    Qtde     := qtde_item;
    Dolar    := edDolar.Value;

    DM.AtualizaItem (dblcCliente.KeyValue, produto_sq.vIndice, dblcNatureza.KeyValue,
      dblcCondPagto.KeyValue, VlrUnit, 0, Dolar, Qtde, AliqICMS, AliqIPI, VlrIpi,
      VlrUnitSIpi, VlrTot, VlrTotSIpi, PctDesc, VlrICMS, PctJuros, BaseICMSSub,
      VlrICMSSub, BaseICMS, 0, vlr_frete_item, vlr_seguro_item, vlr_desp_acess_item);

    vlr_unit_item  := VlrUnit;
    base_icms_item := BaseICMS;
    aliq_icms_item := AliqICMS;
    vlr_icms_item  := VlrIcms;
    aliq_ipi_item  := AliqIPI;
    vlr_ipi_item   := VlrIpi;
    vlr_total_item := VlrTotSIpi;
    base_icms_subst_item := BaseICMSSub;
    vlr_icms_subst_item  := VlrICMSSub;
  end;
  AtualizacdsItens();
end;

procedure TFCadastrarFormNfiscais.TotalizaNfiscal ();
var
  base_icms, vlr_icms, vlr_ipi, vlr_prod, aliqIcms, pesoBruto, pesoLiquido,
  base_icms_subst, vlr_icms_subst, {baseAdicional, valorAdicional, }aliqIVAMenor,
  apoio, vlr_seguro, vlr_frete, vlr_desp_acess, vlr_ii: Real;
  i: Integer;
begin
  if notaConcluida then
    exit;
    
  AtualizaItens;

  aliqIcms  := 0;
  base_icms := 0;
  vlr_icms  := 0;
  vlr_ipi   := 0;
  vlr_prod  := 0;
  pesoBruto := 0;
  pesoLiquido := 0;
  base_icms_subst := 0;
  vlr_icms_subst  := 0;
  aliqIVAMenor := 0;
  vlr_frete := 0;
  vlr_seguro := 0;
  vlr_desp_acess := 0;
  vlr_ii := 0;

  for i := 0 to nfiscal.listaItem.Count - 1 do
  With TNfiscalItem(nfiscal.listaItem.Items[i]) do
  begin
    apoio := TEstadoIva.pesquisa(dsListaClientes.DataSet.FieldByName('ESTADO').AsString, produto_sq.nbm_sq.vIndice);
    if ((aliqIVAMenor = 0) or (aliqIVAMenor > apoio)) then
      aliqIVAMenor := apoio;

    if aliq_icms_item > aliqIcms then
      aliqIcms := aliq_icms_item;

// Na montagem da nota fiscal eletronica, o campo N15 soma o
// valor do item na base de calculo, portanto aqui deve somar tambem.
// Se for alterar, deve ser alterado nos dois lugares.
//    if (vlr_icms_subst_item <> 0) or (vlr_icms_item <> 0) then // icms 40

//substituicao do calculo pelo campo na base de dados
{
      base_icms := base_icms + vlr_total_item; // valor total sem ipi

    if dsListaClientes.DataSet.FieldByName('tipo_cliente_sq').AsInteger = 1 then
      base_icms := base_icms + vlr_ipi_item; // valor do ipi
}
    base_icms := base_icms + base_icms_item;

    vlr_icms   := vlr_icms   + vlr_icms_item;
    vlr_ipi    := vlr_ipi    + vlr_ipi_item;
    vlr_prod   := vlr_prod   + vlr_total_item;
    pesoBruto  := pesoBruto  + peso_bruto;
    pesoLiquido := pesoLiquido + peso_liquido;
    base_icms_subst := base_icms_subst + base_icms_subst_item;
    vlr_icms_subst  := vlr_icms_subst  + vlr_icms_subst_item;
    vlr_frete  := vlr_frete + vlr_frete_item;
    vlr_seguro := vlr_seguro + vlr_seguro_item;
    vlr_desp_acess := vlr_desp_acess + vlr_desp_acess_item;
    vlr_ii := vlr_ii + vlr_ii_item;

    //solicitação do adriano: remover o frete da base de calculo. 18/05/2011
//    base_icms := base_icms + vlr_desp_acess_item;

//substituicao do calculo pelo campo na base de dados
{
    base_icms := base_icms + vlr_frete_item + vlr_seguro_item + vlr_desp_acess_item;
}
  end;
  AtualizacdsItens();

// as linhas abaixo foram comentadas porque o valor do icms do frete e do seguro ja esta no item.
{
  baseAdicional := vlr_frete + vlr_seguro + vlr_desp_acess;
  baseAdicional := (StrToFloatDef(edVlrFrete.Text, 0) + StrToFloatDef(edVlrSeguro.Text, 0));

  base_icms := base_icms + baseAdicional;
  vlr_icms  := vlr_icms  + baseAdicional * aliqIcms / 100;

  if dsListaNaturezas.DataSet.FieldByName('CFO_SUBST').AsString <> '' then
  begin
    valorAdicional := baseAdicional * (1 + (AliqIVAMenor / 100)) * aliqIcms / 100;
    valorAdicional := valorAdicional - (baseAdicional * aliqIcms / 100);
    base_icms_subst := base_icms_subst + baseAdicional * (1 + (AliqIVAMenor/100));
    vlr_icms_subst := vlr_icms_subst + valorAdicional;
  end;
}

  edBaseICMS.Text := FloatToStrF (base_icms, ffFixed, 10, 2);
  edVlrIcms.Text  := FloatToStrF (vlr_icms , ffFixed, 10, 2);
  edBaseICMSStrib.Text := FloatToStrF (base_icms_subst, ffFixed, 10, 2);
  edVlrICMSStrib.Text  := FloatToStrF (vlr_icms_subst , ffFixed, 10, 2);
  edVlrIPI.Text   := FloatToStrF (vlr_ipi  , ffFixed, 10, 2);
  edVlrProd.Text  := FloatToStrF (vlr_prod , ffFixed, 10, 2);
    //solicitação do adriano: remover o frete do total da nota. 18/05/2011
//  edVlrTotal.Text := FloatToStrF (vlr_prod + vlr_ipi + vlr_desp_acess + vlr_icms_subst, ffFixed, 10, 2);
  edVlrTotal.Text := FloatToStrF (vlr_prod + vlr_frete + vlr_seguro + vlr_ipi + vlr_desp_acess + vlr_icms_subst, ffFixed, 10, 2);
  edPBrutoTransp.Text   := FloatToStrF (pesoBruto, ffFixed, 10, 2);
  edPLiquidoTransp.Text := FloatToStrF (pesoLiquido, ffFixed, 10, 2);
  edVlrFrete.Text := FloatToStrF (vlr_frete, ffFixed, 10, 2);
  edVlrSeguro.Text := FloatToStrF (vlr_seguro, ffFixed, 10, 2);
  edVlrDespAcess.Text := FloatToStrF (vlr_desp_acess, ffFixed, 10, 2);
  edVlrII.Text := FloatToStrF(vlr_ii, ffFixed, 10, 2);

  DM.AtualizaCondPagto (edNrNfiscal.Text, StrtoFloatDef(edVlrTotal.Text, 0), StrtoDate(edDtEmissao.Text),
    dsListaCondPagto.DataSet.FieldByName('COND_PAGTO_SQ').AsInteger, dsListaNaturezas.DataSet.FieldByName('TIPO_NFISCAL').AsInteger,
    StrToIntDef(edDemonstracao.Text, 0));

  ednfat1.Text := DM.Duplicatas[0].Numero;
  edvfat1.Text := FloattoStrf (DM.Duplicatas[0].Valor, ffNumber, 10, 2);
  eddfat1.Text := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[0].Data);

  ednfat2.Text := DM.Duplicatas[1].Numero;
  edvfat2.Text := FloattoStrf (DM.Duplicatas[1].Valor, ffNumber, 10, 2);
  eddfat2.Text := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[1].Data);

  ednfat3.Text := DM.Duplicatas[2].Numero;
  edvfat3.Text := FloattoStrf (DM.Duplicatas[2].Valor, ffNumber, 10, 2);
  eddfat3.Text := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[2].Data);
end;

procedure TFCadastrarFormNfiscais.Classificacao ();
var
  i, i2: integer;
begin
  for i:= 1 to 24 do
    (FindComponent('edClass' + IntToStr(i)) as TRzEdit).Clear;

  for i := 0 to nfiscal.listaItem.Count - 1 do
  With TNFiscalItem(nfiscal.listaItem.Items[i]) do
  begin
    for i2:= 1 to 24 do
      if ((FindComponent('edClass' + IntToStr(i2)) as TRzEdit).Text = '')
      or ((FindComponent('edClass' + IntToStr(i2)) as TRzEdit).Text = produto_sq.nbm_sq.codigo_nbm)
        then
        Break;

    if i2 <= 24 then
    begin
      (FindComponent('edClass' + IntToStr(i2)) as TRzEdit).Text := produto_sq.nbm_sq.codigo_nbm;
      class_fiscal := chr(i2+64);
    end
    else
      Showmessage ('Numero insuficiente de CLASSIFICACOES FISCAIS!');

  end;
  AtualizacdsItens();
end;

procedure TFCadastrarFormNfiscais.TransferePedido (numeroPedido: Integer);
var
  cdsPedido, cdsItensFaturados: TClientDataSet;
  pedido: TPedido;
begin
  cdsItensFaturados := TClientDataSet.Create(DM);
  cdsItensFaturados.RemoteServer := DM.SCServer;
  cdsItensFaturados.ProviderName := 'dspLista';

  cdsPedido := TPedido.listaRegistros('where numero_pedido = ' + IntToStr(numeroPedido));

  if cdsPedido.RecordCount <> 1 then
  begin
    Showmessage ('Pedido não encontrado!');
    Exit;
  end;

  pedido := TPedido.Create(cdsPedido.FieldByName('pedido_sq').Value);

  if pedido.status = 'F' then
  begin
    Showmessage ('Pedido já finalizado.');
    edPedido.Clear;
    cdsPedido.Close;
    Exit;
  end;

  if pedido.status = 'C' then
  begin
    Showmessage ('Pedido cancelado.');
    edPedido.Clear;
    cdsPedido.Close;
    Exit;
  end;

  nfiscal.copiaPedido(pedido);
  carregaTela;
end;

procedure TFCadastrarFormNfiscais.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormNfiscais.sbEditarItemClick(Sender: TObject);
var
  itemNfiscal: TNfiscalItem;
begin
  itemNfiscal := TNfiscalItem.Create;
  if Sender <> sbNovoItem then
      itemNfiscal := TNfiscalItem(nfiscal.BuscaItem(cdsItensITEM.Value));

  FEditarNFiscaisItens := TFEditarNFiscaisItens.Create(Self, itemNfiscal);

  if FEditarNFiscaisItens.ShowModal = mrOk then
  begin
    itemNfiscal := FEditarNFiscaisItens.itemNfiscal;

    if Sender = sbNovoItem then
      itemNfiscal.item  := nfiscal.BuscaProximoItem;

    nfiscal.listaItem.Extract(itemNfiscal);
    nfiscal.listaItem.Add(itemNfiscal);
  end;
  if not notaManual then
    TotalizaNfiscal;
  Classificacao;
  inherited;
  FreeAndNil(FEditarNFiscaisItens);
end;

procedure TFCadastrarFormNfiscais.sbApagarItemClick(Sender: TObject);
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    nfiscal.listaItem.Remove(nfiscal.BuscaItem(cdsItensITEM.Value));
    if not notaManual then
      TotalizaNfiscal;
  end;
end;

procedure TFCadastrarFormNfiscais.edPedidoExit(Sender: TObject);
begin
  inherited;
  if edPedido.IntValue <> 0 then
    TransferePedido (edPedido.IntValue);
end;

procedure TFCadastrarFormNfiscais.lblClienteClick(Sender: TObject);
begin
  inherited;
  FBuscaClientes := TFBuscaClientes.Create(Self);
  if FBuscaClientes.ShowModal = mrOk then
  begin
    dblcCliente.KeyValue := FBuscaClientes.dsBuscaClientes.DataSet.FieldByName('cliente_sq').Value;
    dblcCondPagtoClick(dblcCliente);
  end;
  FreeAndNil(FBuscaClientes);
end;

procedure TFCadastrarFormNfiscais.FormCreate(Sender: TObject);
begin
  inherited;
  nfiscal := TNfiscal(TFCadastrarListaComum(Owner).registro);

  cdsItens.CreateDataSet;
  cdsItens.Open;

  cdsItemAdicao.CreateDataSet;
  cdsItemAdicao.Open;

  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
  dsListaCondPagto.DataSet := TCondPagto.listaRegistros('order by descricao_cond_pagto');
  dsListaNaturezas.DataSet := TNatureza.listaRegistros('order by descricao_natureza');
  dsListaTransportadoras.DataSet := TTransportadora.listaRegistros('order by nome_transportadora');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');

  PageControl1.ActivePageIndex := 0;
  rgFrete.ItemIndex := 1;
  edDtEmissao.ReadOnly := empresaSelecionada.alt_dtemissao_nfiscal = 'N';
  edNrNfiscal.ReadOnly := empresaSelecionada.alt_nr_nfiscal = 'N';

  if TFCadastrarListaComum(Owner).novo then
  begin
    edNrNfiscal.Text := '0';
    edDtEmissao.Text := DatetoStr (Date);
    edDtSaida.Text   := DatetoStr (Date);

    edDolar.Value := nfDefault.cotacao_dolar;
    dblcCondPagto.KeyValue := TCondPagto.CreateFiltro('codigo_cond_pagto = ' + IntToStr(nfDefault.condicao_pagamento)).vIndice;
    dblVendedor.KeyValue := TVendedor.CreateFiltro('codigo_vendedor = ' + IntToStr(nfDefault.codigo_vendedor)).vIndice;
    dblcNatureza.KeyValue := TNatureza.CreateFiltro('codigo_natureza = ' + IntToStr(nfDefault.cfop)).vIndice;
    dblTransportadora.KeyValue := TTransportadora.CreateFiltro('codigo_transportadora = ' + QuotedStr(nfDefault.codigo_transportadora)).vIndice;
    dblcCliente.KeyValue := TCliente.buscaPorCodigo(nfDefault.codigo_cliente).vIndice;

    dblcCondPagtoClick(dblcCondPagto);
    dblcCondPagtoClick(dblcNatureza);
    dblcCondPagtoClick(dblcCliente);
  end
  else
    carregaTela;
end;

procedure TFCadastrarFormNfiscais.bbOkClick(Sender: TObject);
var
  i1: integer;
  caracter: String;
begin
  inherited;
  ModalResult := mrNone;

  cbEstadoTransp.Text := UpperCase (cbEstadoTransp.Text);
  if (not DM.estadoValido(cbEstadoTransp.Text)) and (cbEstadoTransp.Text <> '') then
  begin
    PageControl1.ActivePage := tsRodape;
    cbEstadoTransp.Setfocus;
    raise Exception.Create ('Estado Inválido!');
  end;

  if (dsListaNaturezas.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 1) and
     ((edDemonstracao.Text = '') or (edDemonstracao.Text = '0')) then
  begin
    PageControl1.ActivePage := tsCabecalho;
    edDemonstracao.SetFocus;
    raise Exception.Create ('Dias em Demonstração: Informação Obrigatória para Esta Natureza!');
  end;
  if dblcCliente.KeyValue = Null then
    raise Exception.Create('Cliente não selecionado!');
  if dblcCondPagto.KeyValue = Null then
    raise Exception.Create('Condição de Pagamento não selecionada!');
  if dblcNatureza.KeyValue = Null then
    raise Exception.Create('Natureza da Operação não selecionada!');
  if dblTransportadora.KeyValue = Null then
    raise Exception.Create('Transportadora não selecionada!');
  if dblVendedor.KeyValue = Null then
    raise Exception.Create('Vendedor não selecionado!');

  for i1 := 1 to 30 do
    if dsListaClientes.DataSet.FieldByName('ESTADO').Value = dsListaNaturezas.DataSet.FieldByName ('UF' + FormatFloat ('00', i1)).AsString then
      Break;

  if i1 > 30 then
  begin
    // verifica se existe algum estado cadastrado na natureza. Se não tiver nada cadastrado, nao da erro.
    for i1 := 1 to 30 do
      if dsListaNaturezas.DataSet.FieldByName ('UF' + FormatFloat ('00', i1)).AsString <> '' then
        Break;

    if i1 <= 30 then
      raise Exception.Create ('Natureza Inválida para este Estado!');
  end;

  if (StrtoIntDef(edNfRef.Text, 0) <> 0) then
  begin
    if (StrtoIntDef(edNfRef.Text, 0) = StrtoIntDef(edNrNfiscal.Text, 0)) then
      raise Exception.Create('Nota fiscal referência inválida.');

    if (TNfiscal.listaRegistros('where numero_nfiscal = ' + edNfRef.Text).RecordCount=0) then
      raise Exception.Create ('Nota fiscal referência não existe!');
  end;

  if edPlacaTransp.Text <> '' then
  for i1 := 0 to length(edPlacaTransp.Text) do
  begin
    caracter := Copy(edPlacaTransp.Text, i1, 1);
    if not (((caracter >= #65) and (caracter <= #90)) or ((caracter >= #48) and (caracter <= #57))) then
      raise Exception.Create ('Caracter inválido na placa da transportadora (' + caracter + ').');
  end;

  with nfiscal do
  begin
    if edDtSaida.Text = '' then
      dtsaida_nfiscal := null
    else
      dtsaida_nfiscal := StrtoDate(edDtSaida.Text);

    if edDtEmissao.Text = '' then
      dtemissao_nfiscal := null
    else
      dtemissao_nfiscal := StrtoDate(edDtEmissao.Text);

    numero_nfiscal    := StrToInt(edNrNfiscal.Text);
    pedido_sq         := TPedido.Create(edPedido.Tag);
    cotacao_dolar     := edDolar.Value;
    cliente_sq        := TCliente.Create(dblcCliente.KeyValue);
    cond_pagto_sq     := TCondPagto.Create(dblcCondPagto.KeyValue);
    natureza_sq       := TNatureza.Create(dblcNatureza.KeyValue);
    transportadora_sq := TTransportadora.Create(dblTransportadora.KeyValue);
    base_icms         := StrtoFloatDef (edBaseICMS.Text, 0);
    vlr_icms          := StrtoFloatDef (edVlrIcms.Text, 0);
    base_icms_subst   := StrtoFloatDef (edBaseICMSStrib.Text, 0);
    vlr_icms_subst    := StrtoFloatDef (edVlrICMSStrib.Text, 0);
    vlr_produtos      := StrtoFloatDef (edVlrProd.Text, 0);
    vlr_frete         := StrtoFloatDef (edVlrFrete.Text, 0);
    vlr_seguro        := StrtoFloatDef (edVlrSeguro.Text, 0);
    vlr_desp_acess    := StrtoFloatDef (edVlrDespAcess.Text, 0);
    vlr_ii            := StrtoFloatDef (edVlrII.Text, 0);
    vlr_ipi           := StrtoFloatDef (edVlrIPI.Text, 0);
    vlr_total         := StrtoFloatDef (edVlrTotal.Text, 0);
    frete_transp      := IntToStr(rgFrete.ItemIndex+1);
    placa_transp      := edPlacaTransp.Text;
    uf_placa_transp   := cbEstadoTransp.Text;
    qtde_transp       := edQtdeTransp.IntValue;
    especie_transp    := edEspecieTransp.Text;
    marca_transp      := edMarcaTransp.Text;
    numero_transp     := edNumeroTransp.Text;
    pbruto_transp     := edPBrutoTransp.Text;
    pliquido_transp   := edPLiquidoTransp.Text;
    class_fiscal1     := StrToIntDef(edClass1.Text, 0);
    class_fiscal2     := StrToIntDef(edClass2.Text, 0);
    class_fiscal3     := StrToIntDef(edClass3.Text, 0);
    class_fiscal4     := StrToIntDef(edClass4.Text, 0);
    class_fiscal5     := StrToIntDef(edClass5.Text, 0);
    class_fiscal6     := StrToIntDef(edClass6.Text, 0);
    class_fiscal7     := StrToIntDef(edClass7.Text, 0);
    class_fiscal8     := StrToIntDef(edClass8.Text, 0);
    class_fiscal9     := StrToIntDef(edClass9.Text, 0);
    class_fiscal10    := StrToIntDef(edClass10.Text, 0);
    class_fiscal11    := StrToIntDef(edClass11.Text, 0);
    class_fiscal12    := StrToIntDef(edClass12.Text, 0);
    class_fiscal13    := StrToIntDef(edClass13.Text, 0);
    class_fiscal14    := StrToIntDef(edClass14.Text, 0);
    class_fiscal15    := StrToIntDef(edClass15.Text, 0);
    class_fiscal16    := StrToIntDef(edClass16.Text, 0);
    class_fiscal17    := StrToIntDef(edClass17.Text, 0);
    class_fiscal18    := StrToIntDef(edClass18.Text, 0);
    class_fiscal19    := StrToIntDef(edClass19.Text, 0);
    class_fiscal20    := StrToIntDef(edClass20.Text, 0);
    class_fiscal21    := StrToIntDef(edClass21.Text, 0);
    class_fiscal22    := StrToIntDef(edClass22.Text, 0);
    class_fiscal23    := StrToIntDef(edClass23.Text, 0);
    class_fiscal24    := StrToIntDef(edClass24.Text, 0);
    mensagem          := mmMensagem.Lines.Text;
    cancelada         := 'N';
    dias_demonstracao := StrToIntDef(edDemonstracao.Text, 0);
    vendedor_sq       := TVendedor.Create(dblVendedor.KeyValue);
    nf_manual         := IfThen(notaManual, 'S', 'N');
    inf_adicional     := mmInfAdic.Lines.Text;
    nfiscal_sq_referencia := StrToIntDef(edNfRef.Text, 0);
    uf_embarque       := edUfEmbarque.Text;
    local_embarque    := edLocalEmbarque.Text;
    salvar;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormNfiscais.dblcCondPagtoClick(Sender: TObject);
var
  cliente: TCliente;
begin
  inherited;
  if Sender = dblcCliente then
    dblnCliente.KeyValue := dblcCliente.KeyValue;
  if Sender = dblnCliente then
    dblcCliente.KeyValue := dblnCliente.KeyValue;

  if Sender = dbldNatureza then
    dblcNatureza.KeyValue := dbldNatureza.KeyValue;
  if Sender = dblcNatureza then
    dbldNatureza.KeyValue := dblcNatureza.KeyValue;

  if Sender = dbldCondPagto then
    dblcCondPagto.KeyValue := dbldCondPagto.KeyValue;
  if Sender = dblcCondPagto then
    dbldCondPagto.KeyValue := dblcCondPagto.KeyValue;

  if (Sender = dblcCliente) or
     (Sender = dblnCliente) then
  begin
    try
      cliente := TCliente.Create(dsListaClientes.DataSet.FieldByName('cliente_sq').Value);
      edtTipoCliente.Text := cliente.tipo_cliente_sq.descricao_tipo;
    finally
      FreeAndNil(cliente);
    end;
    DM.VisualizaObservacoes(dsListaClientes.DataSet);
  end;

  if (Sender = dblcNatureza) or
     (Sender = dbldNatureza) then
  begin
    mmMensagem.Lines.Clear;
    mmMensagem.Lines.Add(MensagemPedido);
    mmMensagem.Lines.Add(dsListaNaturezas.DataSet.FieldByName('OBSERVACAO').Value);
    Demonstracao := dsListaNaturezas.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 1;
    nfComplementar := dsListaNaturezas.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 8;
  end;

  if (Sender = dblcCliente) or
     (Sender = dblnCliente) then
  begin
    dblcNatureza.KeyValue := dsListaNaturezas.DataSet.FieldByName('NATUREZA_SQ').AsInteger;
    dbldNatureza.KeyValue := dsListaNaturezas.DataSet.FieldByName('NATUREZA_SQ').AsInteger;
  end;

  if not notaManual then
    TotalizaNfiscal;
end;

procedure TFCadastrarFormNfiscais.edNrNfiscalExit(Sender: TObject);
var
  cds: TClientDataSet;
begin
  if StrToIntDef(edNrNfiscal.Text, 0) <> 0 then
  begin
    cds := TNfiscal.listaRegistros('where numero_nfiscal = ' + edNrNfiscal.Text);
    if ((cds.RecordCount > 0) and
       (TFCadastrarListaComum(Owner).novo or
       (cds.FieldByName('nfiscal_sq').Value <> nfiscal.vIndice))) then
      edNrNfiscal.Font.Color := clRed
    else
      edNrNfiscal.Font.Color := clWindowText;
  end;
end;

procedure TFCadastrarFormNfiscais.bbAtualizarClick(Sender: TObject);
begin
  inherited;
  TotalizaNfiscal;
end;

procedure TFCadastrarFormNfiscais.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  notaManual := True;
end;

procedure TFCadastrarFormNfiscais.SetNfComp(const Value: Boolean);
begin
  FnfComp := Value;
  edNfRef.Visible := Value;
  lblNfReferencia.Visible := Value;
end;

procedure TFCadastrarFormNfiscais.RzDBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  produto: TProduto;
  natureza: TNatureza;
  estoque: Integer;
begin
  With RzDBGrid1 do
  begin
    if (Column.Field = cdsItensqtde_item) and (cdsItensqtde_item.Value > 0) then
    begin
      natureza := TNatureza.Create(dblcNatureza.KeyValue);
      if (natureza.ent_sai = 'S') then
      begin
        estoque := 0;
        produto := TProduto.Create(cdsItensproduto_sq.Value);
        if (natureza.numero_estoque_saida = 1)  then estoque := produto.qtde_estoque1;
        if (natureza.numero_estoque_saida = 2)  then estoque := produto.qtde_estoque2;
        if (natureza.numero_estoque_saida = 3)  then estoque := produto.qtde_estoque3;
        if (natureza.numero_estoque_saida = 4)  then estoque := produto.qtde_estoque4;
        if (natureza.numero_estoque_saida = 5)  then estoque := produto.qtde_estoque5;
        if (natureza.numero_estoque_saida = 6)  then estoque := produto.qtde_estoque6;
        if (natureza.numero_estoque_saida = 7)  then estoque := produto.qtde_estoque7;
        if (natureza.numero_estoque_saida = 8)  then estoque := produto.qtde_estoque8;
        if (natureza.numero_estoque_saida = 9)  then estoque := produto.qtde_estoque9;
        if (natureza.numero_estoque_saida = 10) then estoque := produto.qtde_estoque10;
        if estoque <= 0 then
          Canvas.Brush.Color := clRed
        else if cdsItensqtde_item.Value > estoque then
          Canvas.Brush.Color := clYellow;
      end;
    end;
    Canvas.FillRect(Rect);
    Canvas.Font.Color := clWindowText;
    Canvas.Brush.Style := bsClear;
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFCadastrarFormNfiscais.sbAtualizarQtdeClick(Sender: TObject);
var
  i, qtdeTransp: integer;
begin
  qtdeTransp := 0;

  for i := 0 to nfiscal.listaItem.Count - 1 do
  With TNfiscalItem(nfiscal.listaItem.Items[i]) do
    qtdeTransp := qtdeTransp + qtde_item;

  edQtdeTransp.Value := qtdeTransp;
end;

procedure TFCadastrarFormNfiscais.AtualizacdsItens;
var
  i: Integer;
  item: TNfiscalItem;
begin
  cdsItens.EmptyDataSet;
  for i := 0 to nfiscal.listaItem.Count - 1 do
  begin
    item := TNFiscalItem(nfiscal.listaItem.Items[i]);

    cdsItens.Append;
    if item.vIndice = null then
      cdsItensNFISCAL_ITEM_SQ.Value      := 0
    else
      cdsItensNFISCAL_ITEM_SQ.Value      := item.vIndice;
    cdsItensITEM.Value                   := item.item;
    cdsItensPRODUTO_SQ.AsInteger         := item.produto_sq.vIndice;
    cdsItensqtde_item.AsInteger          := item.qtde_item;
    cdsItensVLR_UNIT_ITEM.AsFloat        := item.vlr_unit_item;
    cdsItensCLASS_FISCAL.AsString        := item.class_fiscal;
    cdsItensSTRIBUT.AsInteger            := item.stribut;
    cdsItensBASE_ICMS_ITEM.AsFloat       := item.base_icms_item;
    cdsItensALIQ_ICMS_ITEM.AsFloat       := item.aliq_icms_item;
    cdsItensVLR_ICMS_ITEM.AsFloat        := item.vlr_icms_item;
    cdsItensALIQ_IPI_ITEM.AsFloat        := item.aliq_ipi_item;
    cdsItensVLR_IPI_ITEM.AsFloat         := item.vlr_ipi_item;
    cdsItensVLR_TOTAL_ITEM.AsFloat       := item.vlr_total_item;
    cdsItensNR_SERIE_ITEM.AsString       := item.nr_serie_item;
    cdsItensPESO_BRUTO.AsFloat           := item.peso_bruto;
    cdsItensPESO_LIQUIDO.AsFloat         := item.peso_liquido;
    cdsItensbase_icms_subst_item.AsFloat := item.base_icms_subst_item;
    cdsItensvlr_icms_subst_item.AsFloat  := item.vlr_icms_subst_item;
    cdsItensorigem_mercadoria.AsInteger  := item.origem_mercadoria;
    cdsItensvlr_frete_item.AsFloat       := item.vlr_frete_item;
    cdsItensvlr_seguro_item.AsFloat      := item.vlr_seguro_item;
    cdsItensvlr_desp_acess_item.AsFloat  := item.vlr_desp_acess_item;
    cdsItensbase_ii_item.AsFloat         := item.base_ii_item;
    cdsItensvlr_ii_item.AsFloat          := item.vlr_ii_item;
    cdsItensvlr_desp_adu_item.AsFloat    := item.vlr_desp_adu_item;
    cdsItensvlr_iof_item.AsFloat         := item.vlr_iof_item;
    cdsItensnumero_di.Value              := item.numero_di;
    cdsItensdata_di.Value                := item.data_di;
    cdsItenslocal_desemb.Value           := item.local_desemb;
    cdsItensuf_desemb.Value              := item.uf_desemb;
    cdsItensdata_desemb.Value            := item.data_desemb;
    cdsItenscodigo_exportador.Value      := item.codigo_exportador;
    cdsItenscodigo_produto.Value         := item.produto_sq.codigo_produto;
    cdsItensdescricao_produto.Value      := item.produto_sq.descricao_produto;
    cdsItenscodigo_nbm.Value             := item.produto_sq.nbm_sq.codigo_nbm;
    cdsItens.Post;
  end;
end;

procedure TFCadastrarFormNfiscais.setNotaManual(const Value: Boolean);
begin
  _notaManual := Value;
  bbAtualizar.Visible   := notaManual;

  edBaseICMS.ReadOnly := not notaManual;
  edVlrIcms.ReadOnly  := not notaManual;

  edBaseICMSStrib.ReadOnly := not notaManual;
  edVlrICMSStrib.ReadOnly  := not notaManual;

  edVlrProd.ReadOnly  := not notaManual;
  edVlrIPI.ReadOnly   := not notaManual;
  edVlrTotal.ReadOnly := not notaManual;
  edVlrDespAcess.ReadOnly := not notaManual;
end;

procedure TFCadastrarFormNfiscais.setNotaConcluida(const Value: Boolean);
begin
  _notaConcluida := Value;
  if notaConcluida then
  begin
    _notaManual := True;
    bbAtualizar.Visible := False;
    SpeedButton1.Visible := False;
  end;
  bbOk.Enabled := not Value;
end;

procedure TFCadastrarFormNfiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cdsItens.Close;
  cdsItemAdicao.Close;

  dsListaClientes.DataSet.Close;
  dsListaCondPagto.DataSet.Close;
  dsListaNaturezas.DataSet.Close;
  dsListaTransportadoras.DataSet.Close;
  dsListaVendedores.DataSet.Close;

  if (Owner is TFCadastrarListaComum) then
  begin
    TFCadastrarListaComum(Owner).cdsLista.Locate('nfiscal_sq', nfiscal.vIndice, []);
  end;
end;

procedure TFCadastrarFormNfiscais.carregaTela;
begin
  edNumeroNFe.Text           := VarToStr(nfiscal.numero_nfe);
  edChaveNFe.Text            := nfiscal.nfe_chave;
  mmNFeResposta.Lines.Text   := nfiscal.nfe_resposta;

  edPedido.Enabled := TFCadastrarListaComum(Owner).novo;
  sbPesquisarPedido.Enabled := TFCadastrarListaComum(Owner).novo;
  notaManual := nfiscal.nf_manual = 'S';
  notaConcluida := nfiscal.concluida = 'S';

  if nfiscal.cancelada='S' then
  begin
    bbOk.Enabled := False;
    ShowMessage('Motivo do cancelamento: ' + nfiscal.motivo_cancelamento);
  end;

  edNrNfiscal.Text      := IntToStr(nfiscal.numero_nfiscal);
  edPedido.IntValue     := nfiscal.pedido_sq.numero_pedido;
  if ((nfiscal.pedido_sq = nil) or (nfiscal.pedido_sq.vIndice = Null)) then
    edPedido.Tag := 0
  else
    edPedido.Tag        := nfiscal.pedido_sq.vIndice;
  ednfat1.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('DUP1').AsString + '/' + TFCadastrarListaComum(Owner).cdsLista.FieldByName('IT_DUP1').AsString;
  edvfat1.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('VLR_DUP1').AsString;
  eddfat1.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('DT_DUP1').AsString;
  ednfat2.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('DUP2').AsString + '/' + TFCadastrarListaComum(Owner).cdsLista.FieldByName('IT_DUP2').AsString;
  edvfat2.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('VLR_DUP2').AsString;
  eddfat2.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('DT_DUP2').AsString;
  ednfat3.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('DUP3').AsString + '/' + TFCadastrarListaComum(Owner).cdsLista.FieldByName('IT_DUP3').AsString;
  edvfat3.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('VLR_DUP3').AsString;
  eddfat3.Text          := TFCadastrarListaComum(Owner).cdsLista.FieldByName('DT_DUP3').AsString;

  if ((nfiscal.dtsaida_nfiscal <> 0) and (nfiscal.dtsaida_nfiscal <> Null)) then
    edDtSaida.Text        := FormatDateTime ('dd/mm/yyyy', nfiscal.dtsaida_nfiscal);

  if ((nfiscal.dtemissao_nfiscal <> 0) and (nfiscal.dtemissao_nfiscal <> Null)) then
    edDtEmissao.Text      := FormatDateTime ('dd/mm/yyyy', nfiscal.dtemissao_nfiscal);

  edDemonstracao.Text   := IntToStr(nfiscal.dias_demonstracao);
  edDolar.Value         := nfiscal.cotacao_dolar;
  edBaseICMS.Text       := FloattoStr (nfiscal.base_icms);
  edVlrIcms.Text        := FloattoStr (nfiscal.vlr_icms);
  edBaseICMSStrib.Text  := FloattoStr (nfiscal.base_icms_subst);
  edVlrICMSStrib.Text   := FloattoStr (nfiscal.vlr_icms_subst);
  edVlrProd.Text        := FloattoStr (nfiscal.vlr_produtos);
  edVlrTotal.Text       := FloattoStr (nfiscal.vlr_total);
  edVlrIPI.Text         := FloattoStr (nfiscal.vlr_ipi);
  edVlrDespAcess.Text   := FloattoStr (nfiscal.vlr_desp_acess);
  edVlrSeguro.Text      := FloattoStr (nfiscal.vlr_seguro);
  edVlrFrete.Text       := FloattoStr (nfiscal.vlr_frete);
  edVlrII.Text          := FloatToStr (nfiscal.vlr_ii);
  edPlacaTransp.Text    := nfiscal.placa_transp;
  edQtdeTransp.IntValue := nfiscal.qtde_transp;
  edEspecieTransp.Text  := nfiscal.especie_transp;
  edPBrutoTransp.Text   := nfiscal.pbruto_transp;
  edMarcaTransp.Text    := nfiscal.marca_transp;
  edNumeroTransp.Text   := nfiscal.numero_transp;
  edPLiquidoTransp.Text := nfiscal.pliquido_transp;
  edClass1.Text         := IntToStr(nfiscal.class_fiscal1);
  edClass2.Text         := IntToStr(nfiscal.class_fiscal2);
  edClass3.Text         := IntToStr(nfiscal.class_fiscal3);
  edClass4.Text         := IntToStr(nfiscal.class_fiscal4);
  edClass5.Text         := IntToStr(nfiscal.class_fiscal5);
  edClass6.Text         := IntToStr(nfiscal.class_fiscal6);
  edClass7.Text         := IntToStr(nfiscal.class_fiscal7);
  edClass8.Text         := IntToStr(nfiscal.class_fiscal8);
  edClass9.Text         := IntToStr(nfiscal.class_fiscal9);
  edClass10.Text        := IntToStr(nfiscal.class_fiscal10);
  edClass11.Text        := IntToStr(nfiscal.class_fiscal11);
  edClass12.Text        := IntToStr(nfiscal.class_fiscal12);
  edClass13.Text        := IntToStr(nfiscal.class_fiscal13);
  edClass14.Text        := IntToStr(nfiscal.class_fiscal14);
  edClass15.Text        := IntToStr(nfiscal.class_fiscal15);
  edClass16.Text        := IntToStr(nfiscal.class_fiscal16);
  edClass17.Text        := IntToStr(nfiscal.class_fiscal17);
  edClass18.Text        := IntToStr(nfiscal.class_fiscal18);
  edClass19.Text        := IntToStr(nfiscal.class_fiscal19);
  edClass20.Text        := IntToStr(nfiscal.class_fiscal20);
  edClass21.Text        := IntToStr(nfiscal.class_fiscal21);
  edClass22.Text        := IntToStr(nfiscal.class_fiscal22);
  edClass23.Text        := IntToStr(nfiscal.class_fiscal23);
  edClass24.Text        := IntToStr(nfiscal.class_fiscal24);
  edNfRef.Text          := VarToStr(nfiscal.nfiscal_sq_referencia);

  mmInfAdic.Lines.Text  := nfiscal.inf_adicional;
  mmMensagem.Lines.Text := nfiscal.mensagem;
  cbEstadoTransp.Text   := nfiscal.uf_placa_transp;

  rgFrete.ItemIndex     := StrToIntDef(nfiscal.frete_transp, 0) - 1;

  dblcCliente.KeyValue       := nfiscal.cliente_sq.vIndice;
  dblnCliente.KeyValue       := nfiscal.cliente_sq.vIndice;
  dblcCondPagtoClick(dblcCliente);
  dblcCondPagto.KeyValue     := nfiscal.cond_pagto_sq.vIndice;
  dbldCondPagto.KeyValue     := nfiscal.cond_pagto_sq.vIndice;
  dblcNatureza.KeyValue      := nfiscal.natureza_sq.vIndice;
  dbldNatureza.KeyValue      := nfiscal.natureza_sq.vIndice;
  dblTransportadora.KeyValue := nfiscal.transportadora_sq.vIndice;
  dblVendedor.KeyValue       := nfiscal.vendedor_sq.vIndice;

  MensagemPedido             := nfiscal.pedido_sq.observacao_nf;
  Demonstracao               := nfiscal.natureza_sq.tipo_nfiscal = 1;
  nfComplementar             := nfiscal.natureza_sq.tipo_nfiscal = 8;

  edUfEmbarque.Text          := nfiscal.uf_embarque;
  edLocalEmbarque.Text       := nfiscal.local_embarque;

  AtualizacdsItens;

  dblcCondPagtoClick(nil);
  Classificacao;
end;

procedure TFCadastrarFormNfiscais.sbPesquisarPedidoClick(Sender: TObject);
begin
  inherited;
  try
    FPesquisarPedido := TFPesquisarPedido.Create(Self);
    if (FPesquisarPedido.ShowModal = mrOk) then
    begin
      edPedido.IntValue := FPesquisarPedido.numero_pedido;
      edPedidoExit(nil);
    end;
  finally
    FreeAndNil(FPesquisarPedido);
  end;
end;

end.
