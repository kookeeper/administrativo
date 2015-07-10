unit UEditarPedidosItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask, RzEdit, Variants,
  RzDBEdit, RzCmboBx, RzLstBox, Pedido, RzDBCmbo;

type
  TFEditarPedidosItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    lblProduto: TLabel;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    dsListaProdutos: TDataSource;
    Label2: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edPedido: TRzEdit;
    edQtde: TRzNumericEdit;
    edPreco: TRzNumericEdit;
    edVlrDesc: TRzNumericEdit;
    edVlrIcms: TRzNumericEdit;
    edVlrIpi: TRzNumericEdit;
    edVlrTotal: TRzNumericEdit;
    edVlrJuros: TRzNumericEdit;
    edAliqICMS: TRzNumericEdit;
    edPctDesc: TRzNumericEdit;
    edAliqIPI: TRzNumericEdit;
    edPctJuros: TRzNumericEdit;
    edPesoBruto: TRzNumericEdit;
    edPesoLiquido: TRzNumericEdit;
    Label7: TLabel;
    Label17: TLabel;
    edVlrIcmsSubst: TRzNumericEdit;
    edBaseIcmsSubst: TRzNumericEdit;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    labelNumeroSerie: TLabel;
    Label4: TLabel;
    listBoxNumerosSerie: TRzListBox;
    comboNumeroEstoque: TRzComboBox;
    memoNumeroSerie: TRzMemo;
    dblcProduto: TRzDBLookupComboBox;
    dbldProduto: TRzDBLookupComboBox;
    procedure bbOkClick(Sender: TObject);
    procedure lblProdutoClick(Sender: TObject);
    procedure dblcProdutoClick(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure edPctDescExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    pedidoItem: TPedidoItem;
    function AtualizaItem (): Boolean;
    procedure AtualizaRegistro;
    procedure listaEstoque;
    function retornaNumeroEstoque: Integer;
    procedure selecionaEstoque(numero_estoque: Integer);
    procedure setPedidoItem(Value: TPedidoItem);
  public
    property item: TPedidoItem write setPedidoItem;
  end;

var
  FEditarPedidosItens: TFEditarPedidosItens;

implementation

uses UDM, UBuscaProdutos, UCadastrarFormPedidos, Produto, Cadastro,
  Empresa, Natureza, Cliente, USelecionarNumeroSerie, RzChkLst;

{$R *.DFM}

function TFEditarPedidosItens.AtualizaItem (): Boolean;
var
  VlrUnit, Qtde, VlrTot, VlrTotSIpi, VlrJuros, VlrDesc, Dolar, PctJuros, PctDesc,
    AliqICMS, AliqIPI, VlrUnitSIpi, VlrICMS, VlrIPI, BaseICMSSub, VlrICMSSub,
    BaseICMS: Real;
begin
  try
    VlrDesc  := edVlrDesc.Value;
    VlrJuros := edVlrJuros.Value;
    VlrUnit  := edPreco.Value;
    Qtde     := edQtde.Value;
    Dolar    := FCadastrarFormPedidos.edDolar.Value;

    edPesoBruto.Value   := dsListaProdutos.DataSet.FieldByName('PESO_BRUTO').Value*Qtde;
    edPesoLiquido.Value := dsListaProdutos.DataSet.FieldByName('PESO_LIQUIDO').Value*Qtde;

    edPesoBruto.ReadOnly   := edPesoBruto.Value > 0;
    edPesoLiquido.ReadOnly := edPesoLiquido.Value > 0;

    if FCadastrarFormPedidos.dblcNatureza.KeyValue = null then
      raise Exception.Create('Por favor, selecione uma natureza da operação.');

    DM.AtualizaItem (FCadastrarFormPedidos.dblcCliente.KeyValue, dblcProduto.KeyValue,
      FCadastrarFormPedidos.dblcNatureza.KeyValue, FCadastrarFormPedidos.dblcCondPagto.KeyValue,
      VlrUnit, VlrDesc, Dolar, Qtde, AliqICMS, AliqIPI, VlrIpi, VlrUnitSIpi,
      VlrTot, VlrTotSIpi, PctDesc, VlrICMS, PctJuros, BaseICMSSub, VlrICMSSub,
      BaseICMS, VlrJuros, 0, 0, 0);

    edQtde.Value     := Qtde;
    edPreco.Value    := VlrUnit;
    edVlrDesc.Value  := VlrDesc;
    edPctDesc.Value  := PctDesc;
    edVlrJuros.Value := VlrJuros;
    edPctJuros.Value := PctJuros;
    edVlrIcms.Value  := VlrIcms;
    edVlrIpi.Value   := VlrIpi;
    edVlrTotal.Value := VlrTotSIpi;
    edAliqICMS.Value := AliqICMS;
    edAliqIPI.Value  := AliqIPI;
    edBaseIcmsSubst.Value := BaseICMSSub;
    edVlrIcmsSubst.Value  := VlrICMSSub;
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFEditarPedidosItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if edPctDesc.Value >= 100 then
  begin
    edPctDesc.SetFocus;
    raise Exception.Create('O desconto aplicado deve ser, no máximo, 100%.');
  end;

  if ((edQtde.Value <= 0) and (edQtde.Enabled)) then
  begin
    edQtde.SetFocus;
    raise Exception.Create('A quantidade informada deve ser maior que zero.');
  end;

  if (comboNumeroEstoque.ItemIndex < 0) then
  begin
    comboNumeroEstoque.SetFocus;
    raise Exception.Create('Selecione um estoque.');
  end;

  if AtualizaItem then ModalResult := mrOk;

  AtualizaRegistro;
end;

procedure TFEditarPedidosItens.lblProdutoClick(Sender: TObject);
begin
  FBuscaProdutos := TFBuscaProdutos.Create(Self);
  FBuscaProdutos.cliente := TCliente.Create(FCadastrarFormPedidos.dblcCliente.KeyValue);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    dblcProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName('produto_sq').Value;
    dblcProdutoClick(dblcProduto);
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarPedidosItens.dblcProdutoClick(Sender: TObject);
begin
  if Sender = dblcProduto then
    dbldProduto.KeyValue := dblcProduto.KeyValue;
  if Sender = dbldProduto then
    dblcProduto.KeyValue := dbldProduto.KeyValue;

  edPesoBruto.ReadOnly   := dsListaProdutos.DataSet.FieldByName('tipo_produto').Value = 1;
  edPesoLiquido.ReadOnly := dsListaProdutos.DataSet.FieldByName('tipo_produto').Value = 1;
  edPreco.Value := dsListaProdutos.DataSet.FieldByName('PRECO_UNIT').Value;
  listaEstoque;
  AtualizaItem;
end;

procedure TFEditarPedidosItens.edQtdeExit(Sender: TObject);
begin
  AtualizaItem;
end;

procedure TFEditarPedidosItens.edPctDescExit(Sender: TObject);
begin
  if Sender = edPctDesc then
  begin
    edVlrDesc.Value := edPctDesc.Value * edPreco.Value / 100;
    edQtdeExit(edVlrDesc);
  end;
  if Sender = edPctJuros then
  begin
    edVlrJuros.Value := edPctJuros.Value * edPreco.Value / 100;
    edQtdeExit(edVlrJuros);
  end;
end;

procedure TFEditarPedidosItens.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.montaLista('where produto_ativo = ''S'' order by descricao_produto');
end;

procedure TFEditarPedidosItens.listaEstoque;
var
  produto: TProduto;
  index: Integer;
begin
  produto := TProduto.Create(dsListaProdutos.DataSet.FieldByName('produto_sq').Value);

  edQtde.Enabled := produto.controle_numero_serie = 0;
  memoNumeroSerie.Visible := produto.controle_numero_serie = 0;

  listBoxNumerosSerie.Visible := produto.controle_numero_serie = 1;
  sbIncluir.Visible := produto.controle_numero_serie = 1;
  sbExcluir.Visible := produto.controle_numero_serie = 1;

  index := comboNumeroEstoque.ItemIndex;

  comboNumeroEstoque.Items := produto.listaEstoques;

  if (comboNumeroEstoque.Count > index) then
    comboNumeroEstoque.ItemIndex := index;
end;

procedure TFEditarPedidosItens.selecionaEstoque(
  numero_estoque: Integer);
begin
  comboNumeroEstoque.ItemIndex := comboNumeroEstoque.Items.IndexOfObject(TObject(numero_estoque));
end;

function TFEditarPedidosItens.retornaNumeroEstoque: Integer;
begin
  result := Integer(comboNumeroEstoque.Items.Objects[comboNumeroEstoque.ItemIndex]);
end;

procedure TFEditarPedidosItens.sbIncluirClick(Sender: TObject);
var
  i: Integer;
  checkList: TRzCheckList;
  emEstoque: Boolean;
begin
  try
    if (comboNumeroEstoque.ItemIndex < 0) then
      raise Exception.Create('Por favor, selecione um estoque.');

    emEstoque := TNatureza.Create(TFCadastrarFormPedidos(Owner).dblcNatureza.KeyValue).ent_sai = 'S';

    FSelecionarNumeroSerie := TFSelecionarNumeroSerie.Create(Self,
      dblcProduto.KeyValue, Integer(comboNumeroEstoque.Items.Objects[comboNumeroEstoque.ItemIndex]),
      listBoxNumerosSerie.Items, emEstoque);

    if (FSelecionarNumeroSerie.ShowModal = mrOk) then
    begin
      checkList := FSelecionarNumeroSerie.checkListNumeroSerie;
      if (checkList.ItemsChecked > 0) then
      begin
        for i := 0 to checkList.Items.Count - 1 do
        begin
          if (checkList.ItemChecked[i]) then
            listBoxNumerosSerie.AddObject(checkList.Items.Strings[i], checkList.Items.Objects[i]);
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

procedure TFEditarPedidosItens.sbExcluirClick(Sender: TObject);
begin
  if (listBoxNumerosSerie.SelectedItem = '') then
    raise Exception.Create('Selectione um número de série para excluir.');

  listBoxNumerosSerie.Items.Delete(listBoxNumerosSerie.ItemIndex);
  edQtde.IntValue := listBoxNumerosSerie.Count;
end;

procedure TFEditarPedidosItens.setPedidoItem(Value: TPedidoItem);
var
  i: Integer;
begin
  pedidoItem := Value;
  edQtde.Value           := pedidoItem.qtde_pedido_item;
  edPreco.Value          := pedidoItem.preco_unit;
  edVlrDesc.Value        := pedidoItem.vlr_desc;
  edPctDesc.Value        := pedidoItem.pct_desc;
  edAliqICMS.Value       := pedidoItem.aliq_icms_item;
  edVlrIcms.Value        := pedidoItem.vlr_icms_item;
  edAliqIPI.Value        := pedidoItem.aliq_ipi_item;
  edVlrIpi.Value         := pedidoItem.vlr_ipi_item;
  edVlrTotal.Value       := pedidoItem.vlr_total_item;
  edPesoBruto.Value      := pedidoItem.peso_bruto;
  edPesoLiquido.Value    := pedidoItem.peso_liquido;
  edVlrJuros.Value       := pedidoItem.vlr_juros;
  edPctJuros.Value       := pedidoItem.pct_juros;
  edBaseIcmsSubst.Value  := pedidoItem.base_icms_subst_item;
  edVlrIcmsSubst.Value   := pedidoItem.vlr_icms_subst_item;
  memoNumeroSerie.Text   := pedidoItem.nr_serie_item;
  if (pedidoItem.produto_sq <> nil) then
  begin
    dblcProduto.KeyValue   := pedidoItem.produto_sq.vIndice;
    dblcProdutoClick(dblcProduto);
  end
  else begin
    dblcProduto.KeyValue   := dsListaProdutos.DataSet.FieldByName('produto_sq').Value;
    dblcProdutoClick(dblcProduto);
  end;
  selecionaEstoque(pedidoItem.numero_estoque);
  listBoxNumerosSerie.Items.Clear;
  With pedidoItem.listaSerie do
    for i := 0 to Count -1 do
      listBoxNumerosSerie.Items.AddObject(TPedidoItemSerie(Items[i]).produto_numero_serie_sq.numero_serie + ' (' +
        FormatDateTime('dd/mm/yyyy', TPedidoItemSerie(Items[i]).produto_numero_serie_sq.data_ultima_entrada) + ')',
        TPedidoItemSerie(Items[i]).produto_numero_serie_sq);
end;

procedure TFEditarPedidosItens.AtualizaRegistro;
var
  i: Integer;
  itemSerie: TPedidoItemSerie;
begin
  pedidoItem.qtde_pedido_item  := edQtde.IntValue;
  pedidoItem.preco_unit        := edPreco.Value;
  pedidoItem.vlr_desc          := edVlrDesc.Value;
  pedidoItem.pct_desc          := edPctDesc.Value;
  pedidoItem.aliq_icms_item    := edAliqICMS.Value;
  pedidoItem.vlr_icms_item     := edVlrIcms.Value;
  pedidoItem.aliq_ipi_item     := edAliqIPI.Value;
  pedidoItem.vlr_ipi_item      := edVlrIpi.Value;
  pedidoItem.vlr_total_item    := edVlrTotal.Value;
  pedidoItem.peso_bruto        := edPesoBruto.Value;
  pedidoItem.peso_liquido      := edPesoLiquido.Value;
  pedidoItem.vlr_juros         := edVlrJuros.Value;
  pedidoItem.pct_juros         := edPctJuros.Value;
  pedidoItem.base_icms_subst_item := edBaseIcmsSubst.Value;
  pedidoItem.vlr_icms_subst_item  := edVlrIcmsSubst.Value;
  pedidoItem.nr_serie_item        := memoNumeroSerie.Text;
  pedidoItem.produto_sq              := TProduto.Create(dsListaProdutos.DataSet.FieldByName('PRODUTO_SQ').AsInteger);
  pedidoItem.numero_estoque := retornaNumeroEstoque;
  pedidoItem.listaSerie.Clear;
  With listBoxNumerosSerie.Items do
    for i := 0 to Count -1 do
    begin
      itemSerie := TPedidoItemSerie.Create;
      itemSerie.produto_numero_serie_sq := TProdutoNumeroSerie(listBoxNumerosSerie.Items.Objects[i]);
      pedidoItem.listaSerie.Add(itemSerie);
    end;
end;

end.

