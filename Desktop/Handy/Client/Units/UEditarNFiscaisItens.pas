unit UEditarNFiscaisItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask, RzEdit, RzPanel, RzRadGrp,
  RzDBEdit, RzCmboBx, RzLstBox, RzDBCmbo, Nfiscal, Natureza;

type
  TFEditarNFiscaisItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    dsListaProdutos: TDataSource;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label10: TLabel;
    bbAtualizar: TBitBtn;
    Label22: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    edClass: TRzEdit;
    Label8: TLabel;
    Label12: TLabel;
    rgOrigemMercadoria: TRzRadioGroup;
    edPreco: TRzNumericEdit;
    edVlrTotal: TRzNumericEdit;
    edAliqICMS: TRzNumericEdit;
    edVlrICMS: TRzNumericEdit;
    edAliqIPI: TRzNumericEdit;
    edVlrIPI: TRzNumericEdit;
    edPrecoSIpi: TRzNumericEdit;
    edPesoBruto: TRzNumericEdit;
    edPesoLiquido: TRzNumericEdit;
    edBaseIcmsSubst: TRzNumericEdit;
    edVlrIcmsSubst: TRzNumericEdit;
    edStrib: TRzNumericEdit;
    lbCodigo: TLabel;
    edQtde: TRzNumericEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edVlrFreteItem: TRzNumericEdit;
    edVlrSeguroItem: TRzNumericEdit;
    Label6: TLabel;
    edVlrDespAcessItem: TRzNumericEdit;
    Label7: TLabel;
    edBaseICMSItem: TRzNumericEdit;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    labelNumeroSerie: TLabel;
    Label1: TLabel;
    listBoxNumerosSerie: TRzListBox;
    comboNumeroEstoque: TRzComboBox;
    comboProduto: TRzDBLookupComboBox;
    btnImportacao: TBitBtn;
    memoNumeroSerie: TRzMemo;
    procedure bbOkClick(Sender: TObject);
    procedure lbCodigoClick(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure edPrecoSIpiExit(Sender: TObject);
    procedure bbAtualizarClick(Sender: TObject);
    procedure edVlrTotalExit(Sender: TObject);
    procedure btnImportacaoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure comboProdutoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    filtroLinha: String;
    _notaManual: Boolean;
    natureza: TNatureza;
    function AtualizaItem (): Boolean;
    procedure setNotaManual(const Value: Boolean);
    procedure listaEstoque;
    procedure salvaItem;
    property notaManual: Boolean read _notaManual write setNotaManual;
    { Private declarations }
  public
    itemNfiscal: TNfiscalItem;
    constructor Create(Sender: TComponent; _itemNfiscal: TNfiscalItem); overload;
    { Public declarations }
  end;

var
  FEditarNFiscaisItens: TFEditarNFiscaisItens;

implementation

uses UDM, UBuscaProdutos, UCadastrarFormNfiscais, Produto, Variants,
  Empresa, Cliente, UEditarNFiscalItemImportacao,
  USelecionarNumeroSerie, RzChkLst;

{$R *.DFM}

function TFEditarNFiscaisItens.AtualizaItem (): Boolean;
var
  VlrUnit, Dolar, VlrTot, VlrTotSIpi, AliqICMS, AliqIPI, VlrICMS, VlrIPI,
  VlrUnitSIpi, PctDesc, PctJuros, BaseICMSSub, VlrICMSSub, BaseICMS: Real;
begin
  try
    if edPreco.Value = 0 then
      edPreco.Value := dsListaProdutos.DataSet.FieldByName('PRECO_UNIT').AsCurrency * FCadastrarFormNfiscais.edDolar.Value;

    edPesoBruto.Value   := dsListaProdutos.DataSet.FieldByName('PESO_BRUTO').Value*edQtde.IntValue;
    edPesoLiquido.Value := dsListaProdutos.DataSet.FieldByName('PESO_LIQUIDO').Value*edQtde.IntValue;

    edPesoBruto.ReadOnly   := edPesoBruto.Value > 0;
    edPesoLiquido.ReadOnly := edPesoLiquido.Value > 0;

    VlrUnit := edPreco.Value;
    Dolar   := FCadastrarFormNfiscais.edDolar.Value;

    DM.AtualizaItem (FCadastrarFormNfiscais.dblcCliente.KeyValue,
      dsListaProdutos.DataSet.FieldByName('produto_sq').Value,
      natureza.vIndice, FCadastrarFormNfiscais.dblcCondPagto.KeyValue, VlrUnit,
      0, Dolar, edQtde.IntValue, AliqICMS, AliqIPI, VlrIpi, VlrUnitSIpi, VlrTot,
      VlrTotSIpi, PctDesc, VlrICMS, PctJuros, BaseICMSSub, VlrICMSSub, BaseICMS,
      0, edVlrFreteItem.Value, edVlrSeguroItem.Value, edVlrDespAcessItem.Value);

    if not FCadastrarFormNfiscais.notaManual then
    begin
      edPreco.Value         := VlrUnit;
      edVlrIcms.Value       := VlrIcms;
      edVlrIpi.Value        := VlrIpi;
      edVlrTotal.Value      := VlrTotSIpi;
      edBaseICMSItem.Value  := baseICMS;
      edAliqICMS.Value      := AliqICMS;
      edAliqIPI.Value       := AliqIPI;
      edPrecoSIpi.Value     := VlrUnitSIpi;
      edBaseIcmsSubst.Value := BaseICMSSub;
      edVlrIcmsSubst.Value  := VlrICMSSub;
      edVlrTotal.Value      := edPrecoSIpi.Value * edQtde.IntValue;
    end
    else begin
      if edVlrIPI.Value    = 0 then edVlrIPI.Value    := VlrIpi;
      if edVlrTotal.Value  = 0 then edVlrTotal.Value  := VlrTotSIpi;
      if edPrecoSIpi.Value = 0 then edPrecoSIpi.Value := VlrUnitSIpi;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFEditarNFiscaisItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if ((FCadastrarFormNfiscais.nfComplementar) and (edQtde.IntValue = 0)) or (edQtde.IntValue < 0) then
  begin
    edQtde.SetFocus;
    raise Exception.Create('A quantidade informada deve ser maior que zero.');
  end;

  if (comboNumeroEstoque.ItemIndex < 0) then
  begin
    comboNumeroEstoque.SetFocus;
    raise Exception.Create('Selecione um estoque.');
  end;

  //Verifica se o item existe do estoque.
  if ((empresaSelecionada.estoque_negativo = 'N') and (natureza.ent_sai='S')) then
  begin
//    if ((qtde_item > 0) and (estoque < qtde_item)) then
//      raise Exception.Create('Quantidade do produto ' + produto_sq.descricao_produto + ' insuficiente no estoque (' + descricaoEstoque + ').');
  end;

  salvaItem;
  ModalResult := mrOk;
end;

procedure TFEditarNFiscaisItens.lbCodigoClick(Sender: TObject);
begin
  FBuscaProdutos := TFBuscaProdutos.Create(Self);
  FBuscaProdutos.cliente := TCliente.Create(FCadastrarFormNfiscais.dblcCliente.KeyValue);
  FBuscaProdutos.filtroLinha := filtroLinha;
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    comboProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName('produto_sq').Value;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarNFiscaisItens.edQtdeExit(Sender: TObject);
begin
  AtualizaItem;
end;

procedure TFEditarNFiscaisItens.edPrecoSIpiExit(Sender: TObject);
var
  VlrSIPI, AliqIPI, VlrCIPI: Real;
begin
  //O Calculo só pode ser feito se a nota for manual.
  if FCadastrarFormNfiscais.notaManual then
  begin
    VlrSIPI := edPrecoSIpi.Value;
//    AliqIPI := edAliqIPI.Value;
    VlrCIPI := VlrSIPI + Int(edVlrIPI.Value * 100 / edQtde.IntValue) / 100;
    edPreco.Value := VlrCIPI;
//    VlrCIPI := Int ((VlrSIPI + ((AliqIPI * VlrSIPI)+0.5) / 100) * 100);
//    edPreco.Value := VlrCIPI / 100;
    edQtdeExit(nil);
  end;
end;

procedure TFEditarNFiscaisItens.bbAtualizarClick(Sender: TObject);
begin
  FCadastrarFormNfiscais.notaManual := False;
  AtualizaItem;
  FCadastrarFormNfiscais.notaManual := True;
end;

procedure TFEditarNFiscaisItens.edVlrTotalExit(Sender: TObject);
begin
  if not FCadastrarFormNfiscais.notaManual then
  begin
    if (edQtde.IntValue > 0) and (edVlrTotal.Text <> '') then
      edPrecoSIpi.Value := edVlrTotal.Value/edQtde.IntValue;
  end;
end;

procedure TFEditarNFiscaisItens.btnImportacaoClick(Sender: TObject);
begin
  FEditarNFiscalItemImportacao.ShowModal;
end;

procedure TFEditarNFiscaisItens.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FEditarNFiscalItemImportacao);
end;

procedure TFEditarNFiscaisItens.setNotaManual(const Value: Boolean);
begin
  _notaManual := Value;
  bbAtualizar.Visible  := _notaManual;
  edBaseICMSItem.ReadOnly := not _notaManual;
  edBaseICMSItem.TabStop  := _notaManual;
  edAliqICMS.ReadOnly  := not _notaManual;
  edAliqICMS.TabStop   := _notaManual;
  edAliqIPI.ReadOnly   := not _notaManual;
  edAliqIPI.TabStop    := _notaManual;
  edPrecoSIpi.ReadOnly := not _notaManual;
  edPrecoSIpi.TabStop  := _notaManual;
  edVlrTotal.ReadOnly  := not _notaManual;
  edVlrTotal.TabStop   := _notaManual;
  edVlrICMS.ReadOnly   := not _notaManual;
  edVlrICMS.TabStop    := _notaManual;
  edVlrIPI.ReadOnly    := not _notaManual;
  edVlrIPI.TabStop     := _notaManual;
  edBaseIcmsSubst.ReadOnly  := not _notaManual;
  edBaseIcmsSubst.TabStop   := _notaManual;
  edVlrIcmsSubst.ReadOnly   := not _notaManual;
  edVlrIcmsSubst.TabStop    := _notaManual;
end;

procedure TFEditarNFiscaisItens.listaEstoque;
var
  produto: TProduto;
  index: Integer;
begin
  produto := TProduto.Create(dsListaProdutos.DataSet.FieldByName('produto_sq').Value);

  edQtde.Enabled := (produto.controle_numero_serie = 0) or (notaManual);
  memoNumeroSerie.Visible := produto.controle_numero_serie = 0;

  listBoxNumerosSerie.Visible := produto.controle_numero_serie = 1;
  sbIncluir.Visible := produto.controle_numero_serie = 1;
  sbExcluir.Visible := produto.controle_numero_serie = 1;

  index := comboNumeroEstoque.ItemIndex;

  comboNumeroEstoque.Items := produto.listaEstoques;

  if (comboNumeroEstoque.Count > index) then
    comboNumeroEstoque.ItemIndex := index;
end;

constructor TFEditarNFiscaisItens.Create(Sender: TComponent; _itemNfiscal: TNfiscalItem);
var
  i: Integer;
begin
  Self.Create(Sender);

  natureza := TNatureza.Create(FCadastrarFormNfiscais.dblcNatureza.KeyValue);

  itemNfiscal := _itemNfiscal;

  notaManual := FCadastrarFormNfiscais.notaManual;
  edStrib.Text := InttoStr (empresaSelecionada.stribut);

  FEditarNFiscalItemImportacao := TFEditarNFiscalItemImportacao.Create(Self, itemNfiscal);

  rgOrigemMercadoria.ItemIndex := 0;
  dsListaProdutos.DataSet := TProduto.montaLista('where produto_ativo = ''S'' order by descricao_produto');

  if (itemNfiscal.produto_sq <> nil) then
  begin
    dsListaProdutos.DataSet.Locate('PRODUTO_SQ', itemNfiscal.produto_sq.vIndice, []);
    comboProduto.KeyValue := itemNfiscal.produto_sq.vIndice;
  end
  else
    comboProduto.KeyValue := dsListaProdutos.DataSet.FieldByName('produto_sq').Value;

  edQtde.IntValue        := itemNfiscal.qtde_item;
  edPreco.Value          := itemNfiscal.vlr_unit_item;
  edBaseICMSItem.Value   := itemNfiscal.base_icms_item;
  edAliqICMS.Value       := itemNfiscal.aliq_icms_item;
  edVlrICMS.Value        := itemNfiscal.vlr_icms_item;
  edAliqIPI.Value        := itemNfiscal.aliq_ipi_item;
  edVlrIPI.Value         := itemNfiscal.vlr_ipi_item;
  edVlrTotal.Value       := itemNfiscal.vlr_total_item;

  if edQtde.IntValue > 0 then
    edPrecoSIpi.Value    := edPreco.Value*FCadastrarFormNfiscais.edDolar.Value -(edVlrIPI.Value/edQtde.IntValue);

  edStrib.Text           := IntToStr(itemNfiscal.stribut);
  edPesoBruto.Value      := itemNfiscal.peso_bruto;
  edPesoLiquido.Value    := itemNfiscal.peso_liquido;
  edBaseIcmsSubst.Value  := itemNfiscal.base_icms_subst_item;
  edVlrIcmsSubst.Value   := itemNfiscal.vlr_icms_subst_item;
  rgOrigemMercadoria.ItemIndex := itemNfiscal.origem_mercadoria;
  edVlrFreteItem.Value   := itemNfiscal.vlr_frete_item;
  edVlrSeguroItem.Value  := itemNfiscal.vlr_seguro_item;
  edVlrDespAcessItem.Value := itemNfiscal.vlr_desp_acess_item;
  memoNumeroSerie.Text     := itemNfiscal.nr_serie_item;

  listBoxNumerosSerie.Items.Clear;
  With itemNfiscal.listaSerie do
    for i := 0 to Count -1 do
      listBoxNumerosSerie.Items.AddObject(TNfiscalItemSerie(Items[i]).produto_numero_serie_sq.numero_serie + ' (' +
        FormatDateTime('dd/mm/yyyy', TNfiscalItemSerie(Items[i]).produto_numero_serie_sq.data_ultima_entrada) + ')',
        TNfiscalItemSerie(Items[i]).produto_numero_serie_sq);

  comboProdutoClick(nil);
  if (itemNfiscal.numero_estoque <> 0) then
    comboNumeroEstoque.ItemIndex := comboNumeroEstoque.Items.IndexOfObject(TObject(itemNfiscal.numero_estoque))
  else
  begin
    if (natureza.ent_sai = 'E') then
      comboNumeroEstoque.ItemIndex := comboNumeroEstoque.Items.IndexOfObject(TObject(natureza.numero_estoque_entrada))
    else
      comboNumeroEstoque.ItemIndex := comboNumeroEstoque.Items.IndexOfObject(TObject(natureza.numero_estoque_saida));
  end;
end;

procedure TFEditarNFiscaisItens.salvaItem;
begin
  itemNfiscal.produto_sq        := TProduto.Create(comboProduto.KeyValue);
  itemNfiscal.numero_estoque    := Integer(comboNumeroEstoque.Items.Objects[comboNumeroEstoque.ItemIndex]);
  itemNfiscal.class_fiscal      := edClass.Text;
  itemNfiscal.stribut           := edStrib.IntValue;
  itemNfiscal.vlr_unit_item     := edPreco.Value;
  itemNfiscal.vlr_total_item    := edVlrTotal.Value;
  itemNfiscal.base_icms_item    := edBaseICMSItem.Value;
  itemNfiscal.aliq_icms_item    := edAliqICMS.Value;
  itemNfiscal.aliq_ipi_item     := edAliqIPI.Value;
  itemNfiscal.vlr_icms_item     := edVlrICMS.Value;
  itemNfiscal.vlr_ipi_item      := edVlrIPI.Value;
  itemNfiscal.peso_bruto        := edPesoBruto.Value;
  itemNfiscal.peso_liquido      := edPesoLiquido.Value;
  itemNfiscal.qtde_item         := edQtde.IntValue;
  itemNfiscal.base_icms_subst_item := edBaseIcmsSubst.Value;
  itemNfiscal.vlr_icms_subst_item  := edVlrIcmsSubst.Value;
  itemNfiscal.origem_mercadoria := rgOrigemMercadoria.ItemIndex;
  itemNfiscal.vlr_frete_item    := edVlrFreteItem.Value;
  itemNfiscal.vlr_seguro_item   := edVlrSeguroItem.Value;
  itemNfiscal.vlr_desp_acess_item := edVlrDespAcessItem.Value;
  itemNfiscal.nr_serie_item       := memoNumeroSerie.Text;
end;

procedure TFEditarNFiscaisItens.sbExcluirClick(Sender: TObject);
var
  i, estoque: Integer;
begin
  if (listBoxNumerosSerie.SelectedItem <> '') then
  begin
    estoque := Integer(listBoxNumerosSerie.Items.Objects[listBoxNumerosSerie.ItemIndex]);
    for i := 0 to itemNfiscal.listaSerie.Count - 1 do
    begin
      if (TNfiscalItemSerie(itemNfiscal.listaSerie.Items[i]).produto_numero_serie_sq.vIndice = estoque) then
        itemNfiscal.listaSerie.Delete(i);
    end;
    listBoxNumerosSerie.Items.Delete(listBoxNumerosSerie.ItemIndex);
  end;
  edQtde.IntValue := listBoxNumerosSerie.Count;
end;

procedure TFEditarNFiscaisItens.sbIncluirClick(Sender: TObject);
var
  i: Integer;
  checkList: TRzCheckList;
  itemSerie: TNfiscalItemSerie;
  emEstoque: Boolean;
begin
  try
    if (comboNumeroEstoque.ItemIndex < 0) then
      raise Exception.Create('Por favor, selecione um estoque.');

    emEstoque := TNatureza.Create(TFCadastrarFormNfiscais(Owner).dblcNatureza.KeyValue).ent_sai = 'S';

    FSelecionarNumeroSerie := TFSelecionarNumeroSerie.Create(Self,
      comboProduto.KeyValue, Integer(comboNumeroEstoque.Items.Objects[comboNumeroEstoque.ItemIndex]),
      listBoxNumerosSerie.Items, emEstoque);

    if (FSelecionarNumeroSerie.ShowModal = mrOk) then
    begin
      checkList := FSelecionarNumeroSerie.checkListNumeroSerie;
      if (checkList.ItemsChecked > 0) then
      begin
        for i := 0 to checkList.Items.Count - 1 do
        begin
          if (checkList.ItemChecked[i]) then
          begin
            listBoxNumerosSerie.AddObject(checkList.Items.ValueFromIndex[i], checkList.Items.Objects[i]);
            itemSerie := TNfiscalItemSerie.Create;
            itemSerie.produto_numero_serie_sq := TProdutoNumeroSerie(checkList.Items.Objects[i]);
            itemNfiscal.listaSerie.Add(itemSerie);
          end;
        end;
      end;
//      combo := FSelecionarNumeroSerie.comboNumeroEstoque;
//      listBoxNumerosSerie.AddObject(combo.Items.ValueFromIndex[combo.ItemIndex], combo.Items.Objects[combo.ItemIndex]);
      listBoxNumerosSerie.Sorted := True;
      edQtde.IntValue := listBoxNumerosSerie.Count;
    end;
  finally
    FreeAndNil(FSelecionarNumeroSerie);
  end;
end;

procedure TFEditarNFiscaisItens.comboProdutoClick(Sender: TObject);
begin
  rgOrigemMercadoria.ItemIndex := dsListaProdutos.DataSet.FieldByName('origem_mercadoria').AsInteger;
  edPesoBruto.ReadOnly   := dsListaProdutos.DataSet.FieldByName('TIPO_PRODUTO').AsInteger = 1;
  edPesoLiquido.ReadOnly := dsListaProdutos.DataSet.FieldByName('TIPO_PRODUTO').AsInteger = 1;
  listaEstoque;
  edQtdeExit(nil);
end;

procedure TFEditarNFiscaisItens.FormActivate(Sender: TObject);
begin
  if itemNfiscal.produto_sq = nil then
    lbCodigoClick(Self);
end;

end.
