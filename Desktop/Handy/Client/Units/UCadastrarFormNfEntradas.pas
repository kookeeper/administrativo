unit UCadastrarFormNfEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, Grids,
  ToolWin, ComCtrls, DBCtrls, Mask, RzEdit, DBClient, DBGrids, RzDBGrid,
  NfEntrada;

type
  TFCadastrarFormNfEntradas = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dblCodCliente: TDBLookupComboBox;
    dblNomeCliente: TDBLookupComboBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    dsListaClientes: TDataSource;
    mmObservacao: TMemo;
    Label9: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    dblcNatureza: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    dbldNatureza: TDBLookupComboBox;
    dsListaNatEnt: TDataSource;
    bbTransfere: TBitBtn;
    Label11: TLabel;
    bbCancelaTransferencia: TBitBtn;
    edNrNfEnt: TRzEdit;
    edDtNfEnt: TRzEdit;
    edDtEntrada: TRzEdit;
    cdsItems: TClientDataSet;
    cdsItemsproduto_sq: TIntegerField;
    cdsItemscodigo_produto: TStringField;
    cdsItemsdescricao_produto: TStringField;
    cdsItemsqtde: TIntegerField;
    cdsItemspreco: TBCDField;
    cdsItemsaliqIcms: TBCDField;
    cdsItemsaliqIpi: TBCDField;
    cdsItemsvlrIcms: TBCDField;
    cdsItemsvlrIpi: TBCDField;
    cdsItemsvlrTotal: TBCDField;
    cdsItemsqtde_estoque: TIntegerField;
    cdsItemscodigo_nbm: TStringField;
    gridItems: TRzDBGrid;
    dsItems: TDataSource;
    cdsItemsnumero_serie: TStringField;
    cdsItemsnf_entrada_item_sq: TIntegerField;
    cdsItemsnumero_estoque: TIntegerField;
    TabSheet2: TTabSheet;
    Label15: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    Label16: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edBaseIcmsSubst: TRzNumericEdit;
    edVlrIcmsSubst: TRzNumericEdit;
    edBaseIcms: TRzNumericEdit;
    edVlrIcms: TRzNumericEdit;
    edVlrSeguro: TRzNumericEdit;
    edVlrFrete: TRzNumericEdit;
    edVlrTotal: TRzNumericEdit;
    edVlrIpi: TRzNumericEdit;
    edVlrDesp: TRzNumericEdit;
    edVlrProdutos: TRzNumericEdit;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure dblCodClienteClick(Sender: TObject);
    procedure dblNomeClienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblcNaturezaClick(Sender: TObject);
    procedure dbldNaturezaClick(Sender: TObject);
    procedure bbCancelaTransferenciaClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbTransfereClick(Sender: TObject);
  private
    registro: TNfEntrada;
    procedure GravaRegistro;
    procedure TransfereNotaFiscal;
  public
    notaTransferida: String;
    AliqICMS: Real;

    procedure TotalizaNfEntrada ();
    procedure AtualizaItens ();
    function verificaCampos(): Integer;
  end;

var
  FCadastrarFormNfEntradas: TFCadastrarFormNfEntradas;

implementation

uses UEditarNfEntradasItens, UDM, UCadastrarListaNfEntradas, Produto, Cadastro,
  UCadastrarListaComum, Cliente, Natureza, ncm;

{$R *.dfm}

procedure TFCadastrarFormNfEntradas.TotalizaNfEntrada ();
var
  base_icms, vlr_icms, vlr_ipi, vlr_prod: Real;
begin
  //Só calcula o item se nao deu entrada na nota.
  if registro.dt_entrada <> null then
    Exit;

  AliqICMS  := 0;
  base_icms := 0;
  vlr_icms  := 0;
  vlr_ipi   := 0;
  vlr_prod  := 0;
  cdsItems.First;
  While not cdsItems.Eof do
  begin
    if cdsItemsaliqIcms.Value > AliqICMS then
      AliqICMS := cdsItemsaliqIcms.Value;
    base_icms := base_icms + cdsItemsvlrTotal.Value;
    vlr_icms  := vlr_icms  + cdsItemsvlrIcms.Value;
    vlr_ipi   := vlr_ipi   + cdsItemsvlrIpi.Value;
    vlr_prod  := vlr_prod  + cdsItemsvlrTotal.Value;

    cdsItems.Next;
  end;
  cdsItems.First;

  edBaseIcms.Value    := base_icms;
  edVlrIcms.Value     := vlr_icms;
  edVlrIpi.Value      := vlr_ipi;
  edVlrProdutos.Value := vlr_prod;
  edVlrTotal.Value    := vlr_prod+vlr_ipi+edVlrFrete.Value+edVlrSeguro.Value+edVlrDesp.Value;
end;

procedure TFCadastrarFormNfEntradas.AtualizaItens ();
var
  VlrUnit, VlrTot, VlrTotSIpi, PctDesc, AliqICMS, AliqIPI, VlrUnitSIpi,
  VlrICMS, VlrIPI, PctJuros, VlrJuros, BaseICMSSub, VlrICMSSub, BaseICMS: Real;
  Qtde: Integer;
  produto: TProduto;
begin
  //Só calcula o item se nao deu entrada na nota.
  if registro.dt_entrada <> null then
    Exit;

  cdsItems.First;
  While not cdsItems.Eof do
  begin
    produto := TProduto.Create(cdsItemsproduto_sq.Value);
    VlrUnit  := cdsItemspreco.Value;
    Qtde     := cdsItemsqtde.Value;
    VlrJuros := 0;
    DM.AtualizaItem (dblCodCliente.KeyValue, produto.vIndice,
      dblcNatureza.KeyValue, 0, VlrUnit, 0, 1, Qtde, AliqICMS, AliqIPI, VlrIpi,
      VlrUnitSIpi, VlrTot, VlrTotSIpi, PctDesc, VlrICMS, PctJuros,
      BaseICMSSub, VlrICMSSub, BaseICMS, VlrJuros, 0, 0, 0);

    cdsItemsqtde.AsInteger := Qtde;
    cdsItemspreco.Value    := VlrUnit;
    cdsItemsaliqIcms.Value := AliqICMS;
    cdsItemsvlrIcms.Value  := VlrIcms;
    cdsItemsaliqIpi.Value  := AliqIPI;
    cdsItemsvlrIpi.Value   := VlrIpi;
    cdsItemsvlrTotal.Value := VlrTotSIpi;
    cdsItems.Next;
  end;
  TotalizaNfEntrada;
end;

procedure TFCadastrarFormNfEntradas.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormNfEntradas.sbEditarItemClick(Sender: TObject);
var
  produto: TProduto;
begin
  FEditarNfEntradasItens := TFEditarNfEntradasItens.Create(Self);
  FEditarNfEntradasItens.lbNfEntrada.Caption := 'NFiscal - ' + edNrNfEnt.Text;
  if Sender <> sbNovoItem then
  begin
    FEditarNfEntradasItens.edQtde.IntValue    := cdsItemsqtde.AsInteger;
    FEditarNfEntradasItens.edPreco.Value      := cdsItemspreco.Value;
    FEditarNfEntradasItens.edAliqICMS.Value   := cdsItemsaliqIcms.Value;
    FEditarNfEntradasItens.edVlrIcms.Value    := cdsItemsvlrIcms.Value;
    FEditarNfEntradasItens.edAliqIPI.Value    := cdsItemsaliqIpi.Value;
    FEditarNfEntradasItens.edVlrIpi.Value     := cdsItemsvlrIpi.Value;
    FEditarNfEntradasItens.edVlrTotal.Value   := cdsItemsvlrTotal.Value;
    FEditarNfEntradasItens.dblcProduto.KeyValue := cdsItemsproduto_sq.Value;
    FEditarNfEntradasItens.dblcProdutoClick(nil);

    FEditarNfEntradasItens.SelecionaEstoque(cdsItemsnumero_estoque.Value);

    produto := TProduto.Create(cdsItemsproduto_sq.Value);
    if (produto.controle_numero_serie = 0) then
      FEditarNfEntradasItens.memoNumeroSerie.Text := cdsItemsnumero_serie.Value
    else
    begin
      FEditarNfEntradasItens.listBoxNumerosSerie.Items.Delimiter := ',';
      FEditarNfEntradasItens.listBoxNumerosSerie.Items.DelimitedText := cdsItemsnumero_serie.Value;
    end;

  end;
  if FEditarNfEntradasItens.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
      cdsItems.Append
    else
      cdsItems.Edit;

    produto := TProduto.Create(FEditarNfEntradasItens.dsListaProdutos.DataSet.FieldByName('PRODUTO_SQ').AsInteger);

    cdsItemscodigo_produto.Value    := produto.codigo_produto;
    cdsItemsdescricao_produto.Value := produto.descricao_produto;
    cdsItemsqtde.AsInteger  := FEditarNfEntradasItens.edQtde.intValue;
    cdsItemspreco.Value     := FEditarNfEntradasItens.edPreco.Value;
    cdsItemsaliqIcms.Value  := FEditarNfEntradasItens.edAliqICMS.Value;
    cdsItemsvlrIcms.Value   := FEditarNfEntradasItens.edVlrIcms.Value;
    cdsItemsaliqIpi.Value   := FEditarNfEntradasItens.edAliqIPI.Value;
    cdsItemsvlrIpi.Value    := FEditarNfEntradasItens.edVlrIpi.Value;
    cdsItemsvlrTotal.Value  := FEditarNfEntradasItens.edVlrTotal.Value;
    cdsItemsqtde_estoque.Value :=
      produto.qtde_estoque1 +
      produto.qtde_estoque2 +
      produto.qtde_estoque3 +
      produto.qtde_estoque4 +
      produto.qtde_estoque5 +
      produto.qtde_estoque6 +
      produto.qtde_estoque7 +
      produto.qtde_estoque8 +
      produto.qtde_estoque9 +
      produto.qtde_estoque10;
    cdsItemscodigo_nbm.Value := produto.nbm_sq.codigo_nbm;
    cdsItemsproduto_sq.Value := produto.vIndice;
    cdsItemsnumero_estoque.Value := FEditarNfEntradasItens.retornaNumeroEstoque;

    if (produto.controle_numero_serie = 0) then
      cdsItemsnumero_serie.Value := FEditarNfEntradasItens.memoNumeroSerie.Text
    else
      cdsItemsnumero_serie.Value := FEditarNfEntradasItens.listBoxNumerosSerie.Items.CommaText;

    cdsItems.Post;
  end;
  TotalizaNfEntrada;
  inherited;
  FEditarNfEntradasItens.Free;
end;

procedure TFCadastrarFormNfEntradas.sbApagarItemClick(Sender: TObject);
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    cdsItems.Delete;
    TotalizaNfEntrada;
  end;
end;

procedure TFCadastrarFormNfEntradas.bbOkClick(Sender: TObject);
begin
  inherited;
  verificaCampos;
  GravaRegistro;
end;

procedure TFCadastrarFormNfEntradas.dblCodClienteClick(
  Sender: TObject);
begin
  inherited;
  dblNomeCliente.KeyValue := dblCodCliente.KeyValue;
  AtualizaItens;
end;

procedure TFCadastrarFormNfEntradas.dblNomeClienteClick(
  Sender: TObject);
begin
  inherited;
  dblCodCliente.KeyValue := dblNomeCliente.KeyValue;
  AtualizaItens;
end;

procedure TFCadastrarFormNfEntradas.FormCreate(Sender: TObject);
var
  produto: TProduto;
  itens: TClientDataSet;
begin
  inherited;
  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
  dsListaNatEnt.DataSet := TNatureza.entradas;

  registro := TNfEntrada(TFCadastrarListaComum(Owner).registro);
  sbNovoItem.Enabled := registro.dt_entrada = null;
  sbApagarItem.Enabled := registro.dt_entrada = null;

  with TFCadastrarListaComum(Owner) do
  begin
    cdsItems.Close;
    cdsItems.CreateDataSet;

    if not novo then
    begin
      itens := TNfEntrada.Create(registro.vIndice).listaItens;
      with (registro as TNfEntrada) do
      begin
        edNrNfEnt.Text       := IntToStr(numero_nf_ent);
        edDtNfEnt.Text       := DateTimeToStr(dtemissao_nf_ent);
        edBaseIcms.Value     := base_icms;
        edVlrIcms.Value      := vlr_icms;
        edBaseIcmsSubst.Value:= base_icms_subst;
        edVlrIcmsSubst.Value := vlr_icms_subst;
        edVlrIpi.Value       := vlr_ipi;
        edVlrFrete.Value     := vlr_frete;
        edVlrSeguro.Value    := vlr_seguro;
        edVlrDesp.Value      := vlr_desp_acess;
        edVlrProdutos.Value  := vlr_produtos;
        edVlrTotal.Value     := vlr_total;
        if dt_entrada <> null then
          edDtEntrada.Text     := FormatDatetime ('dd/mm/yyyy hh:nn:ss', dt_entrada);
        mmObservacao.Lines.Text := observacao;
        dblCodCliente.KeyValue := cliente_sq.vIndice;
        dblNomeCliente.KeyValue := cliente_sq.vIndice;
        if natureza_sq <> nil then
        begin
          dblcNatureza.KeyValue := natureza_sq.vIndice;
          dbldNatureza.KeyValue := natureza_sq.vIndice;
        end;
        notaTransferida      := transferida;
        bbOk.Enabled         := transferida <> 'S';
        bbTransfere.Enabled  := transferida <> 'S';
        bbCancelaTransferencia.Enabled := transferida = 'S';
      end;

      itens.First;

      While not itens.Eof do
      begin
        produto := TProduto.Create(itens.FieldByName('PRODUTO_SQ').AsInteger);

        cdsItems.Append;
        cdsItemsnf_entrada_item_sq.Value := itens.FieldByName('nf_entrada_item_sq').Value;
        cdsItemsproduto_sq.Value := itens.FieldByName('produto_sq').Value;
        cdsItemscodigo_produto.Value    := produto.codigo_produto;
        cdsItemsdescricao_produto.Value := produto.descricao_produto;
        cdsItemsqtde.AsInteger := itens.FieldByName('QTDE_ITEM').AsInteger;
        cdsItemspreco.Value    := itens.FieldByName('VLR_UNIT_ITEM').Value;
        cdsItemsaliqIcms.Value := itens.FieldByName('ALIQ_ICMS_ITEM').Value;
        cdsItemsvlrIcms.Value  := itens.FieldByName('VLR_ICMS_ITEM').Value;
        cdsItemsaliqIpi.Value  := itens.FieldByName('ALIQ_IPI_ITEM').Value;
        cdsItemsvlrIpi.Value   := itens.FieldByName('VLR_IPI_ITEM').Value;
        cdsItemsvlrTotal.Value := itens.FieldByName('VLR_TOTAL_ITEM').Value;
        cdsItemsnumero_serie.Value := itens.FieldByName('NR_SERIE_ITEM').AsString;
        cdsItemsqtde_estoque.Value :=
          produto.qtde_estoque1 +
          produto.qtde_estoque2 +
          produto.qtde_estoque3 +
          produto.qtde_estoque4 +
          produto.qtde_estoque5 +
          produto.qtde_estoque6 +
          produto.qtde_estoque7 +
          produto.qtde_estoque8 +
          produto.qtde_estoque9 +
          produto.qtde_estoque10;
        cdsItemscodigo_nbm.Value := itens.FieldByName('CODIGO_NBM').AsString;
        cdsItemsnumero_estoque.Value := itens.FieldByName('numero_estoque').AsInteger;
        cdsItems.Post;

        itens.Next;
      end;
    end
    else
    begin
      edNrNfEnt.Text := '0';
      edDtNfEnt.Text := DatetoStr (Date);
      notaTransferida := 'N';
    end;
  end;
end;

procedure TFCadastrarFormNfEntradas.dblcNaturezaClick(
  Sender: TObject);
begin
  inherited;
  if Sender <> dbldNatureza then
    dbldNatureza.KeyValue := dblcNatureza.KeyValue;
end;

procedure TFCadastrarFormNfEntradas.dbldNaturezaClick(
  Sender: TObject);
begin
  inherited;
  dblcNatureza.KeyValue := dbldNatureza.KeyValue;
end;

function TFCadastrarFormNfEntradas.verificaCampos(): Integer;
//var
//  regs: Integer;
begin
  Result := mrNone;

  try
    if dblCodCliente.KeyValue = Null then
      raise Exception.Create('Cliente não selecionado!');

    if TNatureza.Create(dblcNatureza.KeyValue).ent_sai <> 'E' then
      raise Exception.Create('Selecione uma natureza de entrada!');
      
    Result := mrOk;
  except
  end;
end;

procedure TFCadastrarFormNfEntradas.bbCancelaTransferenciaClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que deseja Cancelar a Transferência desta Nota Fiscal para o Estoque?', mtWarning, mbOKCancel, 0) = mrOk then
    registro.cancelaEntrada;
end;

procedure TFCadastrarFormNfEntradas.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet.Close;
  dsListaNatEnt.DataSet.Close;
end;

procedure TFCadastrarFormNfEntradas.GravaRegistro;
var
  achou: Boolean;
  cds: TClientDataSet;
begin
  with registro do
  begin
    numero_nf_ent     := StrtoInt (edNrNfEnt.Text);
    dtemissao_nf_ent  := StrToDateTime (edDtNfEnt.Text);
    cliente_sq        := TCliente.Create(dblCodCliente.KeyValue);
    base_icms         := edBaseIcms.Value;
    vlr_icms          := edVlrIcms.Value;
    base_icms_subst   := edBaseIcmsSubst.Value;
    vlr_icms_subst    := edVlrIcmsSubst.Value;
    vlr_produtos      := edVlrProdutos.Value;
    vlr_frete         := edVlrFrete.Value;
    vlr_seguro        := edVlrSeguro.Value;
    vlr_desp_acess    := edVlrDesp.Value;
    vlr_ipi           := edVlrIpi.Value;
    vlr_total         := edVlrTotal.Value;
    observacao        := mmObservacao.Lines.Text;
    transferida       := notaTransferida;
    natureza_sq       := TNatureza.Create(dblcNatureza.KeyValue);
    salvar;
  end;

  dsItems.Enabled := False;

  cds := registro.listaItens;

  cdsItems.First;
  While not cdsItems.Eof do
  with TNfEntradaItem.Create(cdsItemsnf_entrada_item_sq.Value) do
  begin
    nf_entrada_sq   := registro;
    produto_sq      := TProduto.Create(cdsItemsproduto_sq.Value);
    qtde_item       := cdsItemsqtde.AsInteger;
    vlr_unit_item   := cdsItemspreco.Value;
    aliq_icms_item  := cdsItemsaliqIcms.Value;
    vlr_icms_item   := cdsItemsvlrIcms.Value;
    aliq_ipi_item   := cdsItemsaliqIpi.Value;
    vlr_ipi_item    := cdsItemsvlrIpi.Value;
    vlr_total_item  := cdsItemsvlrTotal.Value;
    nr_serie_item   := cdsItemsnumero_serie.Value;
    numero_estoque  := cdsItemsnumero_estoque.Value;
    salvar;
    cdsItems.Next;
  end;

  while not cds.Eof do
  begin
    cdsItems.First;
    achou := False;
    While not cdsItems.Eof do
    begin
      if (cdsItemsnf_entrada_item_sq.Value = cds.FieldByName('nf_entrada_item_sq').Value) then
        achou := True;
      cdsItems.Next;
    end;
    if (not achou) then
      TNfEntradaItem.Create(cds.FieldByName('nf_entrada_item_sq').Value).excluirRegistro(false);

    cds.Next;
  end;

  dsItems.Enabled := True;

end;

procedure TFCadastrarFormNfEntradas.TransfereNotaFiscal;
begin
  registro.entradaEstoque;
end;

procedure TFCadastrarFormNfEntradas.bbTransfereClick(Sender: TObject);
begin
  inherited;
  verificaCampos;
  GravaRegistro;
  TransfereNotaFiscal;
end;

end.
