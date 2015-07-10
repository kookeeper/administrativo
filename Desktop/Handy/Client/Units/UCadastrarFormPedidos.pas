unit UCadastrarFormPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, DBCtrls, Db, StdCtrls, Mask, Buttons, ExtCtrls,
  ToolWin, ComCtrls, Grids, DBGrids, RzEdit, DBClient, RzDBGrid, Pedido;

type
  TFCadastrarFormPedidos = class(TFCadastrarFormComum)
    Label1: TLabel;
    dsListaClientes: TDataSource;
    Label4: TLabel;
    lblCliente: TLabel;
    dblcCliente: TDBLookupComboBox;
    dblnCliente: TDBLookupComboBox;
    Label7: TLabel;
    dblcCondPagto: TDBLookupComboBox;
    Label9: TLabel;
    dblcNatureza: TDBLookupComboBox;
    dsListaCondPagto: TDataSource;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    dsListaNat: TDataSource;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    dblnTransportadora: TDBLookupComboBox;
    dbldNatureza: TDBLookupComboBox;
    Label12: TLabel;
    dsListaTransportadoras: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    mmObservacaoPed: TMemo;
    rgFrete: TRadioGroup;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    dblnVendedor: TDBLookupComboBox;
    dsListaVendedores: TDataSource;
    mmObservacaoNf: TMemo;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    btnDuplica: TBitBtn;
    Label22: TLabel;
    Label23: TLabel;
    edDtPedido: TRzEdit;
    Label13: TLabel;
    Label14: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    btnBaixar: TBitBtn;
    cdsBuscaPedido: TClientDataSet;
    cdsBuscaPedidoItens: TClientDataSet;
    edPctDesc: TRzNumericEdit;
    edVlrDesc: TRzNumericEdit;
    edBaseIcms: TRzNumericEdit;
    edVlrIcms: TRzNumericEdit;
    edVlrIpi: TRzNumericEdit;
    edVlrProd: TRzNumericEdit;
    edVlrTotal: TRzNumericEdit;
    edPesoBruto: TRzNumericEdit;
    edPesoLiquido: TRzNumericEdit;
    edPctJuros: TRzNumericEdit;
    edVlrJuros: TRzNumericEdit;
    edSeguro: TRzNumericEdit;
    edFrete: TRzNumericEdit;
    RzDBGrid1: TRzDBGrid;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensPEDIDO_ITEM_SQ: TIntegerField;
    cdsItensPEDIDO_SQ: TIntegerField;
    cdsItensPRODUTO_SQ: TIntegerField;
    cdsItensQTDE_PEDIDO_ITEM: TIntegerField;
    cdsItensNR_SERIE_ITEM: TMemoField;
    cdsItensPRECO_UNIT: TBCDField;
    cdsItensVLR_DESC: TBCDField;
    cdsItensPCT_DESC: TBCDField;
    cdsItensALIQ_ICMS_ITEM: TBCDField;
    cdsItensALIQ_IPI_ITEM: TBCDField;
    cdsItensVLR_ICMS_ITEM: TBCDField;
    cdsItensVLR_IPI_ITEM: TBCDField;
    cdsItensVLR_TOTAL_ITEM: TBCDField;
    cdsItensPESO_BRUTO: TBCDField;
    cdsItensPESO_LIQUIDO: TBCDField;
    cdsItensVLR_JUROS: TBCDField;
    cdsItensPCT_JUROS: TBCDField;
    cdsItensCODIGO_PRODUTO: TStringField;
    cdsItensDESCRICAO_PRODUTO: TStringField;
    cdsItensCODIGO_NBM: TStringField;
    bbCancelarPedido: TBitBtn;
    bbFinalizaPedido: TBitBtn;
    edDolar: TRzNumericEdit;
    edDemonstracao: TRzNumericEdit;
    edNrPedido: TRzEdit;
    Label20: TLabel;
    Label21: TLabel;
    edBaseIcmsSubst: TRzNumericEdit;
    edVlrIcmsSubst: TRzNumericEdit;
    cdsItensbase_icms_subst_item: TBCDField;
    cdsItensvlr_icms_subst_item: TBCDField;
    edVlrCondPagto: TRzNumericEdit;
    Label24: TLabel;
    dblcCondPagto2: TDBLookupComboBox;
    edVlrCondPagto2: TRzNumericEdit;
    Label26: TLabel;
    dblcCondPagto3: TDBLookupComboBox;
    edVlrCondPagto3: TRzNumericEdit;
    Label28: TLabel;
    chkCondPagto2: TCheckBox;
    chkCondPagto3: TCheckBox;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure dblcClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lblClienteClick(Sender: TObject);
    procedure btnDuplicaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnBaixarClick(Sender: TObject);
    procedure dblcNaturezaExit(Sender: TObject);
    procedure bbCancelarPedidoClick(Sender: TObject);
    procedure bbFinalizaPedidoClick(Sender: TObject);
    procedure chkCondPagto2Click(Sender: TObject);
    procedure chkCondPagto3Click(Sender: TObject);
  private
    obs: String;
    AliqICMS: Real;
    pedido: TPedido;

    procedure TotalizaPedido ();
    procedure AtualizaItens ();
    procedure IncluiItem(item: TPedidoItem);
    procedure verificaCampos;
    procedure CancelarPedido;
    procedure GravarPedido;
    procedure FinaliarPedido;
    procedure carregaCdsLista;
    function BuscaItem(indice: Integer): TPedidoItem;
  public
    constructor Create(Sender: TComponent; registro: TPedido); overload;
  end;

var
  FCadastrarFormPedidos: TFCadastrarFormPedidos;

implementation

uses UDM, UEditarPedidosItens, UBuscaClientes, Variants, uDuplicaPedido,
  Vendedor, Transportadora, Produto, UCadastrarListaComum, Cliente,
  CondPagto, Natureza, Cadastro, Empresa, EstadoIva;

{$R *.DFM}

procedure TFCadastrarFormPedidos.TotalizaPedido ();
var
  vlr_juros, vlr_desc, base_icms, vlr_icms, vlr_ipi, vlr_prod, pct_juros,
    pct_desc, peso_bruto, peso_liquido, baseIcmsSubst, vlrIcmsSubst,
    baseAdicional, valorAdicional, apoio, aliqIVAMenor: Real;
  i: Integer;
  item: TPedidoItem;
begin
  AliqICMS  := 0;
  aliqIVAMenor := 0;
  vlr_desc  := 0;
  vlr_juros := 0;
  base_icms := 0;
  baseIcmsSubst := 0;
  vlr_icms  := 0;
  vlrIcmsSubst := 0;
  vlr_ipi   := 0;
  vlr_prod  := 0;
  peso_bruto := 0;
  peso_liquido := 0;

  for i := 0 to pedido.listaItem.Count - 1 do
  begin
    item := pedido.listaItem.Items[i];
    apoio := TEstadoIva.pesquisa(dsListaClientes.DataSet.FieldByName('ESTADO').AsString, item.produto_sq.nbm_sq.vIndice);
    if ((aliqIVAMenor = 0) or (aliqIVAMenor > apoio)) then
      aliqIVAMenor := apoio;

    if item.aliq_icms_item > AliqICMS then
      AliqICMS := item.aliq_icms_item;

    vlr_desc     := vlr_desc     + item.vlr_desc;
    vlr_juros    := vlr_juros    + item.vlr_juros;
    base_icms    := base_icms    + item.vlr_total_item;
    baseIcmsSubst := baseIcmsSubst + item.base_icms_subst_item;
    vlr_icms     := vlr_icms     + item.vlr_icms_item;
    vlrIcmsSubst := vlrIcmsSubst + item.vlr_icms_subst_item;
    vlr_ipi      := vlr_ipi      + item.vlr_ipi_item;
    vlr_prod     := vlr_prod     + item.vlr_total_item;
    peso_bruto   := peso_bruto   + item.peso_bruto;
    peso_liquido := peso_liquido + item.peso_liquido;

    if dsListaClientes.DataSet.FieldByName('tipo_cliente_sq').AsInteger = 1 then
      base_icms := base_icms + item.vlr_ipi_item;
  end;

  base_icms := base_icms + edFrete.Value + edSeguro.Value;
  vlr_icms  := vlr_icms + (edFrete.Value + edSeguro.Value) * AliqICMS / 100;

  pct_desc := 0;
  pct_juros := 0;
  if vlr_prod <> 0 then
  begin
    pct_desc  := 100 * vlr_desc / vlr_prod;
    pct_juros := 100 * vlr_juros / vlr_prod;
  end;

  baseAdicional := edFrete.Value + edSeguro.Value;

  if dsListaNat.DataSet.FieldByName('CFO_SUBST').AsString <> '' then
  begin
    valorAdicional := baseAdicional * (1 + (AliqIVAMenor / 100)) * AliqICMS / 100;
    valorAdicional := valorAdicional - (baseAdicional * AliqICMS / 100);
    baseIcmsSubst := baseIcmsSubst + baseAdicional * (1 + (AliqIVAMenor/100));
    vlrIcmsSubst := vlrIcmsSubst + valorAdicional;
  end;

  edVlrDesc.Value     := vlr_desc;
  edVlrJuros.Value    := vlr_juros;
  edBaseIcms.Value    := base_icms;
  edBaseIcmsSubst.Value := baseIcmsSubst;
  edVlrIcms.Value     := vlr_icms;
  edVlrIcmsSubst.Value := vlrIcmsSubst;
  edVlrIpi.Value      := vlr_ipi;
  edVlrProd.Value     := vlr_prod;
  edVlrTotal.Value    := vlr_prod+vlr_ipi+edSeguro.Value+edFrete.Value + edVlrIcmsSubst.Value;
  edPctDesc.Value     := pct_desc;
  edPctJuros.Value    := pct_juros;
  edPesoBruto.Value   := peso_bruto;
  edPesoLiquido.Value := peso_liquido;
end;

procedure TFCadastrarFormPedidos.AtualizaItens ();
var
  VlrUnit, VlrTot, VlrTotSIpi, VlrJuros, VlrDesc, PctJuros, PctDesc, Dolar,
    AliqICMS, AliqIPI, VlrUnitSIpi, VlrICMS, VlrIPI, BaseICMSSub, VlrICMSSub,
    BaseICMS: Real;
  Qtde: integer;
  i: Integer;
  item: TPedidoItem;
begin
  for i := 0 to pedido.listaItem.Count - 1 do
  begin
    item := pedido.listaItem.Items[i];
    VlrDesc  := item.vlr_desc;
    VlrUnit  := item.preco_unit;
    Qtde     := item.qtde_pedido_item;
    Dolar    := edDolar.Value;
    VlrJuros := item.vlr_juros;

    if dblcNatureza.KeyValue = null then
      raise Exception.Create('Por favor, selecione uma natureza da operação.');

    DM.AtualizaItem (dblcCliente.KeyValue, item.produto_sq.vIndice, dblcNatureza.KeyValue,
      dblcCondPagto.KeyValue, VlrUnit, VlrDesc, Dolar, Qtde, AliqICMS, AliqIPI,
      VlrIpi, VlrUnitSIpi, VlrTot, VlrTotSIpi, PctDesc, VlrICMS, PctJuros,
      BaseICMSSub, VlrICMSSub, BaseICMS, VlrJuros, 0, 0, 0);

    item.qtde_pedido_item := Qtde;
    item.preco_unit       := VlrUnit;
    item.vlr_desc         := VlrDesc;
    item.pct_desc         := PctDesc;
    item.vlr_icms_item    := VlrIcms;
    item.vlr_ipi_item     := VlrIpi;
    item.vlr_total_item   := VlrTotSIpi;
    item.aliq_icms_item   := AliqICMS;
    item.aliq_ipi_item    := AliqIPI;
    item.vlr_juros        := VlrJuros;
    item.pct_juros        := PctJuros;
    item.base_icms_subst_item := BaseICMSSub;
    item.vlr_icms_subst_item  := VlrICMSSub;
  end;
  carregaCdsLista;
  TotalizaPedido;
end;

procedure TFCadastrarFormPedidos.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormPedidos.sbEditarItemClick(Sender: TObject);
var
  item: TPedidoItem;
begin
  if Sender <> sbNovoItem then
    item := BuscaItem(cdsItens.RecNo)
  else
    item := TPedidoItem.Create;

  FEditarPedidosItens := TFEditarPedidosItens.Create(Self);
  FEditarPedidosItens.edPedido.Text := edNrPedido.Text;
  FEditarPedidosItens.item := item;

  if FEditarPedidosItens.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
    begin
      pedido.listaItem.Add(item);
    end;
  end;

  carregaCdsLista;
  TotalizaPedido;
  inherited;
  FEditarPedidosItens.Free;
end;

procedure TFCadastrarFormPedidos.sbApagarItemClick(Sender: TObject);
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    pedido.listaItem.Delete(pedido.listaItem.IndexOf(BuscaItem(cdsItens.RecNo)));
    cdsItens.Delete;
    TotalizaPedido;
  end;
end;

procedure TFCadastrarFormPedidos.bbOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;

  verificaCampos;

  GravarPedido;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormPedidos.dblcClienteClick(Sender: TObject);
begin
  inherited;
  if Sender = dblcCliente then
    dblnCliente.KeyValue := dblcCliente.KeyValue;
  if Sender = dblnCliente then
    dblcCliente.KeyValue := dblnCliente.KeyValue;

  if Sender = dblcNatureza then
    dbldNatureza.KeyValue := dblcNatureza.KeyValue;
  if Sender = dbldNatureza then
    dblcNatureza.KeyValue := dbldNatureza.KeyValue;

  if (Sender = dblcNatureza) or (Sender = dbldNatureza) then
    obs := dsListaNat.DataSet.FieldByName('OBSERVACAO').AsString;

  if Sender = edPctJuros then
    edVlrJuros.Value := edPctJuros.Value * edVlrProd.Value / 100;

  if (Sender = dblcCliente) or
     (Sender = dblnCliente) then
  begin
    DM.VisualizaObservacoes(dsListaClientes.DataSet);

    if dblcNatureza.KeyValue <> Null then
      dsListaNat.DataSet.Locate('NATUREZA_SQ', dblcNatureza.KeyValue, []);
    dblcNatureza.KeyValue := dsListaNat.DataSet.FieldByName('NATUREZA_SQ').AsInteger;
    dbldNatureza.KeyValue := dsListaNat.DataSet.FieldByName('NATUREZA_SQ').AsInteger;
    dblnTransportadora.KeyValue := dsListaClientes.DataSet.FieldByName('TRANSPORTADORA_SQ').Value;
    dblnVendedor.KeyValue := dsListaClientes.DataSet.FieldByName('vendedor_sq').Value;
  end;

  AtualizaItens;
end;

procedure TFCadastrarFormPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
  dsListaCondPagto.DataSet := TCondPagto.listaRegistros('order by descricao_cond_pagto');
  dsListaNat.DataSet := TNatureza.listaRegistros('order by descricao_natureza');
  dsListaTransportadoras.DataSet := TTransportadora.listaRegistros('order by nome_transportadora');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  btnBaixar.Visible := empresaSelecionada.baixa_estoque_pedido = 'S';
  edDtPedido.ReadOnly := empresaSelecionada.alt_data_pedido = 'N';
  edNrPedido.ReadOnly := empresaSelecionada.alt_nr_pedido = 'N';

  obs := '';

  cdsItens.CreateDataSet;
  cdsItens.EmptyDataSet;

  btnDuplica.Enabled := TFCadastrarListaComum(Owner).novo;

  bbCancelarPedido.Visible := (pedido.status = null) and (TFCadastrarListaComum(Owner).cdsLista.FieldByName('notas').AsInteger = 0);
  bbFinalizaPedido.Visible := (pedido.status = null) and (not bbCancelarPedido.Visible);

  if not TFCadastrarListaComum(Owner).novo then
  begin
    if ((pedido.nfiscal_sq <> 0) or (pedido.status <> null)) then
      bbOk.Enabled      := False;
    btnBaixar.Enabled := bbOk.Enabled;

    edNrPedido.Text             := IntToStr(pedido.numero_pedido);
    edDtPedido.Text             := DateToStr(pedido.data_pedido);
    edDolar.Value               := pedido.cotacao_dolar;
    edDemonstracao.IntValue     := pedido.dias_demonstracao;
    edFrete.Value               := pedido.vlr_frete;
    edSeguro.Value              := pedido.vlr_seguro;
    edPctJuros.Value            := pedido.pct_juros;
    edVlrJuros.Value            := pedido.vlr_juros;
    rgFrete.ItemIndex           := StrToIntDef(pedido.frete_transp, 0) - 1;
    edVlrDesc.Value             := pedido.vlr_desc;
    edBaseIcms.Value            := pedido.base_icms;
    edBaseIcmsSubst.Value       := pedido.base_icms_subst;
    edVlrIcms.Value             := pedido.vlr_icms;
    edVlrIcmsSubst.Value        := pedido.vlr_icms_subst;
    edVlrIpi.Value              := pedido.vlr_ipi;
    edVlrProd.Value             := pedido.vlr_produtos;
    edPctDesc.Value             := pedido.pct_desc;
    edVlrTotal.Value            := pedido.vlr_total;
    edPesoBruto.Value           := pedido.peso_bruto;
    edPesoLiquido.Value         := pedido.peso_liquido;
    edVlrCondPagto.Value        := pedido.vlr_cond_pagto;
    edVlrCondPagto2.Value       := pedido.vlr_cond_pagto2;
    edVlrCondPagto3.Value       := pedido.vlr_cond_pagto3;
    mmObservacaoPed.Lines.Text  := pedido.observacao_ped;
    mmObservacaoNf.Lines.Text   := pedido.observacao_nf;
    dblcCliente.KeyValue        := pedido.cliente_sq.vIndice;
    dblcClienteClick(dblcCliente);
    dblnCliente.KeyValue        := pedido.cliente_sq.vIndice;
    dblcCondPagto.KeyValue      := pedido.cond_pagto_sq.vIndice;
    if (pedido.cond_pagto2_sq.vIndice <> null) then
      dblcCondPagto2.KeyValue     := pedido.cond_pagto2_sq.vIndice;
    if (pedido.cond_pagto3_sq.vIndice <> null) then
      dblcCondPagto3.KeyValue     := pedido.cond_pagto3_sq.vIndice;
    dblcNatureza.KeyValue       := pedido.natureza_sq.vIndice;
    dbldNatureza.KeyValue       := pedido.natureza_sq.vIndice;
    dblnTransportadora.KeyValue := pedido.transportadora_sq.vIndice;
    dblnVendedor.KeyValue       := pedido.vendedor_sq.vIndice;

    chkCondPagto2.Checked := pedido.cond_pagto2_sq.vIndice <> null;
    chkCondPagto2Click(nil);
    chkCondPagto3.Checked := pedido.cond_pagto3_sq.vIndice <> null;
    chkCondPagto3Click(nil);

    AtualizaItens;
    carregaCdsLista;
  end
  else
  begin
    edNrPedido.Text := '0';
    edDtPedido.Text := DatetoStr (Date);
    pedido.baixou_estoque := 'N';
  end;
end;

procedure TFCadastrarFormPedidos.lblClienteClick(Sender: TObject);
begin
  inherited;
  FBuscaClientes := TFBuscaClientes.Create(Self);
  if FBuscaClientes.ShowModal = mrOk then
  begin
    dblcCliente.KeyValue := FBuscaClientes.dsBuscaClientes.DataSet.FieldByName('cliente_sq').Value;
    dblcClienteClick(dblcCliente);
  end;
  FBuscaClientes.Free;
end;

procedure TFCadastrarFormPedidos.btnDuplicaClick(Sender: TObject);
var
  cds: TClientDataSet;
  pedidoOriginal: TPedido;
  item: TPedidoItem;
  itemSerie: TPedidoItemSerie;
  i, j: Integer;
begin
  fDuplicaPedido := TfDuplicaPedido.Create(Self);
  try
    if fDuplicaPedido.ShowModal = mrOk then
    begin
      cds := TPedido.listaRegistros('where numero_pedido = ' + FDuplicaPedido.edPedido.Text);
      if cds.RecordCount > 0 then
      begin
        pedidoOriginal := TPedido.Create(cds.FieldByName('pedido_sq').Value);

        edDolar.Value       := pedidoOriginal.cotacao_dolar;
        edDemonstracao.IntValue := pedidoOriginal.dias_demonstracao;
        edFrete.Value        := pedidoOriginal.vlr_frete;
        edSeguro.Value       := pedidoOriginal.vlr_seguro;
        edPctJuros.Value     := pedidoOriginal.pct_juros;
        edVlrJuros.Value     := pedidoOriginal.vlr_juros;
        rgFrete.ItemIndex    := StrToInt(pedidoOriginal.frete_transp) - 1;
        edVlrDesc.Value      := pedidoOriginal.vlr_desc;
        edBaseIcms.Value     := pedidoOriginal.base_icms;
        edBaseIcmsSubst.Value:= pedidoOriginal.base_icms_subst;
        edVlrIcms.Value      := pedidoOriginal.vlr_icms;
        edVlrIcmsSubst.Value := pedidoOriginal.vlr_icms_subst;
        edVlrIpi.Value       := pedidoOriginal.vlr_ipi;
        edVlrProd.Value      := pedidoOriginal.vlr_produtos;
        edPctDesc.Value      := pedidoOriginal.pct_desc;
        edVlrTotal.Value     := pedidoOriginal.vlr_total;
        edVlrCondPagto.Value := pedidoOriginal.vlr_cond_pagto;
        edVlrCondPagto2.Value := pedidoOriginal.vlr_cond_pagto2;
        edVlrCondPagto3.Value := pedidoOriginal.vlr_cond_pagto3;
//        edVlrTotal.Value     := pedidoOriginal.vlr_produtos + pedidoOriginal.vlr_ipi + pedidoOriginal.vlr_frete + pedidoOriginal.vlr_seguro + pedidoOriginal.vlr_icms_subst;
        mmObservacaoPed.Lines.Text  := pedidoOriginal.observacao_ped;
        mmObservacaoNf.Lines.Text   := pedidoOriginal.observacao_nf;
        dblcCliente.KeyValue        := pedidoOriginal.cliente_sq.vIndice;
        dblnCliente.KeyValue        := pedidoOriginal.cliente_sq.vIndice;
        dblcCondPagto.KeyValue      := pedidoOriginal.cond_pagto_sq.vIndice;
        dblcCondPagto2.KeyValue     := pedidoOriginal.cond_pagto2_sq.vIndice;
        dblcCondPagto3.KeyValue     := pedidoOriginal.cond_pagto3_sq.vIndice;
        dblcNatureza.KeyValue       := pedidoOriginal.natureza_sq.vIndice;
        dbldNatureza.KeyValue       := pedidoOriginal.natureza_sq.vIndice;
        dblnTransportadora.KeyValue := pedidoOriginal.transportadora_sq.vIndice;
        dblnVendedor.KeyValue       := pedidoOriginal.vendedor_sq.vIndice;

        for i := 0 to pedidoOriginal.listaItem.Count - 1 do
        begin
          item := TPedidoItem.Create;
          item.produto_sq           := TPedidoItem(pedidoOriginal.listaItem.Items[i]).produto_sq;
          item.qtde_pedido_item     := TPedidoItem(pedidoOriginal.listaItem.Items[i]).qtde_pedido_item;
          item.nr_serie_item        := TPedidoItem(pedidoOriginal.listaItem.Items[i]).nr_serie_item;
          item.preco_unit           := TPedidoItem(pedidoOriginal.listaItem.Items[i]).preco_unit;
          item.vlr_desc             := TPedidoItem(pedidoOriginal.listaItem.Items[i]).vlr_desc;
          item.pct_desc             := TPedidoItem(pedidoOriginal.listaItem.Items[i]).pct_desc;
          item.aliq_icms_item       := TPedidoItem(pedidoOriginal.listaItem.Items[i]).aliq_icms_item;
          item.aliq_ipi_item        := TPedidoItem(pedidoOriginal.listaItem.Items[i]).aliq_ipi_item;
          item.vlr_icms_item        := TPedidoItem(pedidoOriginal.listaItem.Items[i]).vlr_icms_item;
          item.vlr_ipi_item         := TPedidoItem(pedidoOriginal.listaItem.Items[i]).vlr_ipi_item;
          item.vlr_total_item       := TPedidoItem(pedidoOriginal.listaItem.Items[i]).vlr_total_item;
          item.peso_bruto           := TPedidoItem(pedidoOriginal.listaItem.Items[i]).peso_bruto;
          item.peso_liquido         := TPedidoItem(pedidoOriginal.listaItem.Items[i]).peso_liquido;
          item.vlr_juros            := TPedidoItem(pedidoOriginal.listaItem.Items[i]).vlr_juros;
          item.pct_juros            := TPedidoItem(pedidoOriginal.listaItem.Items[i]).pct_juros;
          item.base_icms_subst_item := TPedidoItem(pedidoOriginal.listaItem.Items[i]).base_icms_subst_item;
          item.vlr_icms_subst_item  := TPedidoItem(pedidoOriginal.listaItem.Items[i]).vlr_icms_subst_item;
          item.numero_estoque       := TPedidoItem(pedidoOriginal.listaItem.Items[i]).numero_estoque;
          for j := 0 to TPedidoItem(pedidoOriginal.listaItem.Items[i]).listaSerie.Count -1 do
          begin
            itemSerie := TPedidoItemSerie.Create;
            itemSerie.produto_numero_serie_sq := TPedidoItemSerie(TPedidoItem(pedidoOriginal.listaItem.Items[i]).listaSerie.Items[j]).produto_numero_serie_sq;
            item.listaSerie.Add(itemSerie);
          end;

          pedido.listaItem.Add(item)
        end;

        carregaCdsLista;
      end;
    end;
  finally
    FreeAndNil(fDuplicaPedido);
  end;
end;

procedure TFCadastrarFormPedidos.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet.Close;
  dsListaCondPagto.DataSet.Close;
  dsListaNat.DataSet.Close;
end;

procedure TFCadastrarFormPedidos.btnBaixarClick(Sender: TObject);
begin
  verificaCampos;
  GravarPedido;
  FinaliarPedido;
end;

procedure TFCadastrarFormPedidos.dblcNaturezaExit(Sender: TObject);
begin
  if obs <> '' then
  begin
    if (mmObservacaoNf.Lines.Text = '') or
       (MessageDlg('Deseja atualizar a observação da nota fiscal com a natureza?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      mmObservacaoNf.Lines.Clear;
      mmObservacaoNf.Lines.Add(obs);
    end;
  end;
  obs := '';
end;

procedure TFCadastrarFormPedidos.bbCancelarPedidoClick(Sender: TObject);
begin
  if MessageDlg ('Deseja cancelar o pedido? (O pedido não poderá mais ser faturado)', mtConfirmation, [mbyes, mbno], 0) = mryes then
    CancelarPedido;
end;

procedure TFCadastrarFormPedidos.bbFinalizaPedidoClick(Sender: TObject);
begin
  verificaCampos;
  if MessageDlg ('Deseja finalizar o pedido? (O pedido não poderá mais ser faturado)', mtConfirmation, [mbyes, mbno], 0) = mryes then
    CancelarPedido;
end;

procedure TFCadastrarFormPedidos.verificaCampos();
var
  i1: integer;
begin
  if dblcCliente.KeyValue = Null then
    raise Exception.Create('Cliente não selecionado!');
  if dblcCondPagto.KeyValue = Null then
    raise Exception.Create('Condição de Pagamento não selecionada!');
  if dblcNatureza.KeyValue = Null then
    raise Exception.Create('Natureza da Operação não selecionada!');
  if dblnTransportadora.KeyValue = Null then
    raise Exception.Create('Transportadora não selecionada!');
  if dblnVendedor.KeyValue = Null then
    raise Exception.Create('Vendedor não selecionado!');

  for i1 := 1 to 30 do
    if dsListaClientes.DataSet.FieldByName('ESTADO').Value = dsListaNat.DataSet.FieldByName ('UF' + FormatFloat ('00', i1)).AsString then
      Break;

  if i1 > 30 then
  begin
    // verifica se existe algum estado cadastrado na natureza. Se não tiver nada cadastrado, nao da erro.
    for i1 := 1 to 30 do
      if dsListaNat.DataSet.FieldByName ('UF' + FormatFloat ('00', i1)).AsString <> '' then
        Break;

    if i1 <= 30 then
      raise Exception.Create ('Natureza Inválida para este Estado!');
  end;

  if (dsListaNat.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 1) and
     (edDemonstracao.IntValue = 0) then
  begin
    edDemonstracao.SetFocus;
    raise Exception.Create ('Dias em Demonstração: Informação Obrigatória para Esta Natureza!');
  end;

end;

procedure TFCadastrarFormPedidos.CancelarPedido();
begin
  With TPedido(TFCadastrarListaComum(Owner).registro) do
  begin
    status := 'C';
    salvar;
  end;
end;

procedure TFCadastrarFormPedidos.GravarPedido();
begin

  with TFCadastrarListaComum(Owner) do
  with TPedido(registro) do
  begin
    numero_pedido := StrToInt(edNrPedido.Text);
    data_pedido   := StrToDateTime (edDtPedido.Text);
    cotacao_dolar := edDolar.Value;
    dias_demonstracao := StrtoInt (edDemonstracao.Text);
    vlr_frete     := edFrete.Value;
    pct_juros     := edPctJuros.Value;
    vlr_juros     := edVlrJuros.Value;
    frete_transp  := IntToStr(rgFrete.ItemIndex + 1);
    vlr_desc      := edVlrDesc.Value;
    base_icms     := edBaseIcms.Value;
    base_icms_subst:= edBaseIcmsSubst.Value;
    vlr_icms      := edVlrIcms.Value;
    vlr_icms_subst:= edVlrIcmsSubst.Value;
    vlr_ipi       := edVlrIpi.Value;
    vlr_produtos  := edVlrProd.Value;
    vlr_total     := edVlrTotal.Value;
    pct_desc      := edPctDesc.Value;
    observacao_ped:= mmObservacaoPed.Lines.Text;
    observacao_nf := mmObservacaoNf.Lines.Text;
    cliente_sq    := TCliente.Create(dblcCliente.KeyValue);
    cond_pagto_sq := TCondPagto.Create(dblcCondPagto.KeyValue);
    vlr_cond_pagto:= edVlrCondPagto.Value;

    if chkCondPagto2.Checked then
    begin
      cond_pagto2_sq := TCondPagto.Create(dblcCondPagto2.KeyValue);
      vlr_cond_pagto2:= edVlrCondPagto2.Value;
    end
    else
    begin
      cond_pagto2_sq := nil;
      vlr_cond_pagto2:= 0;
    end;

    if chkCondPagto3.Checked then
    begin
      cond_pagto3_sq := TCondPagto.Create(dblcCondPagto3.KeyValue);
      vlr_cond_pagto3:= edVlrCondPagto3.Value;
    end
    else
    begin
      cond_pagto3_sq := nil;
      vlr_cond_pagto3:= 0;
    end;

    natureza_sq   := TNatureza.Create(dblcNatureza.KeyValue);
    transportadora_sq := TTransportadora.Create(dblnTransportadora.KeyValue);
    vendedor_sq   := TVendedor.Create(dblnVendedor.KeyValue);
    peso_bruto    := edPesoBruto.Value;
    peso_liquido  := edPesoLiquido.Value;
    vlr_seguro    := edSeguro.Value;
    salvar;
  end;
end;

procedure TFCadastrarFormPedidos.FinaliarPedido();
begin
  TPedido(TFCadastrarListaComum(Owner).registro).Finalizar;
end;

procedure TFCadastrarFormPedidos.carregaCdsLista();
var
  i: Integer;
begin
  cdsItens.EmptyDataSet;
  for i := 0 to pedido.listaItem.Count - 1 do
    IncluiItem(pedido.listaItem.Items[i]);
end;

procedure TFCadastrarFormPedidos.IncluiItem(item: TPedidoItem);
begin
  cdsItens.Append;
  cdsItensCODIGO_PRODUTO.Value    := item.produto_sq.codigo_produto;
  cdsItensDESCRICAO_PRODUTO.Value := item.produto_sq.descricao_produto;
  cdsItensQTDE_PEDIDO_ITEM.Value  := item.qtde_pedido_item;
  cdsItensPRECO_UNIT.Value     := item.preco_unit;
  cdsItensVLR_DESC.Value       := item.vlr_desc;
  cdsItensPCT_DESC.Value       := item.pct_desc;
  cdsItensALIQ_ICMS_ITEM.Value := item.aliq_icms_item;
  cdsItensVLR_ICMS_ITEM.Value  := item.vlr_icms_item;
  cdsItensALIQ_IPI_ITEM.Value  := item.aliq_ipi_item;
  cdsItensVLR_IPI_ITEM.Value   := item.vlr_ipi_item;
  cdsItensVLR_TOTAL_ITEM.Value := item.vlr_total_item;
  cdsItensNR_SERIE_ITEM.Value  := item.nr_serie_item;
  cdsItensCODIGO_NBM.Value     := item.produto_sq.nbm_sq.codigo_nbm;
  cdsItensVLR_JUROS.Value      := item.vlr_juros;
  cdsItensPCT_JUROS.Value      := item.pct_juros;
  cdsItensPRODUTO_SQ.Value     := item.produto_sq.vIndice;
  cdsItensPESO_BRUTO.Value     := item.peso_bruto;
  cdsItensPESO_LIQUIDO.Value   := item.peso_liquido;
  cdsItensbase_icms_subst_item.Value := item.base_icms_subst_item;
  cdsItensvlr_icms_subst_item.Value  := item.vlr_icms_subst_item;
  cdsItens.Post;
  item.indiceDataSet := cdsItens.RecNo;
end;

function TFCadastrarFormPedidos.BuscaItem(indice: Integer): TPedidoItem;
var
  i: Integer;
begin
  result := nil;
  for i := 0 to pedido.listaItem.Count - 1 do
  begin
    if TPedidoItem(pedido.listaItem.Items[i]).indiceDataSet = indice then
      result := pedido.listaItem.Items[i];
  end;
end;

constructor TFCadastrarFormPedidos.Create(Sender: TComponent;
  registro: TPedido);
begin
  pedido := registro;

  Self.Create(Sender);
end;

procedure TFCadastrarFormPedidos.chkCondPagto2Click(Sender: TObject);
begin
  inherited;
  dblcCondPagto2.Enabled := chkCondPagto2.Checked;
  edVlrCondPagto2.Enabled := chkCondPagto2.Checked;
end;

procedure TFCadastrarFormPedidos.chkCondPagto3Click(Sender: TObject);
begin
  inherited;
  dblcCondPagto3.Enabled := chkCondPagto3.Checked;
  edVlrCondPagto3.Enabled := chkCondPagto3.Checked;
end;

end.
