unit UEditarNfEntradasItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask, RzEdit, RzLstBox,
  RzCmboBx, RzPanel;

type
  TFEditarNfEntradasItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    dsListaProdutos: TDataSource;
    RzPanel1: TRzPanel;
    lbNfEntrada: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    labelNumeroSerie: TLabel;
    Label4: TLabel;
    dblcProduto: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    edPreco: TRzNumericEdit;
    edQtde: TRzNumericEdit;
    edVlrTotal: TRzNumericEdit;
    edVlrIcms: TRzNumericEdit;
    edVlrIpi: TRzNumericEdit;
    edAliqICMS: TRzNumericEdit;
    edAliqIPI: TRzNumericEdit;
    listBoxNumerosSerie: TRzListBox;
    comboNumeroEstoque: TRzComboBox;
    memoNumeroSerie: TRzMemo;
    procedure bbOkClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure dblcProdutoClick(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
  private
    function AtualizaItem (): Boolean;
    procedure listaEstoque ();
  public
    procedure selecionaEstoque(numero_estoque: Integer);
    function retornaNumeroEstoque(): Integer;
  end;

var
  FEditarNfEntradasItens: TFEditarNfEntradasItens;

implementation

uses UDM, UBuscaProdutos, UCadastrarFormNfEntradas, Produto, Variants,
  Cliente, Empresa, UCadastrarListaComum, NfEntrada;

{$R *.DFM}

function TFEditarNfEntradasItens.AtualizaItem (): Boolean;
var
  VlrUnit, Qtde, VlrTot, VlrTotSIpi, PctDesc, AliqICMS, AliqIPI, VlrUnitSIpi,
  VlrICMS, VlrIPI, PctJuros, BaseICMSSub, VlrICMSSub, BaseICMS: Real;
begin
  result := False;
  //Só calcula o item se nao deu entrada na nota.
  if TNfEntrada(TFCadastrarListaComum(FCadastrarFormNfEntradas.Owner).registro).dt_entrada <> null then
    Exit;

  try
    VlrUnit  := edPreco.Value;
    Qtde     := edQtde.Value;

    if FCadastrarFormNfEntradas.dblcNatureza.KeyValue = null then
      raise Exception.Create('Por favor, selecione uma natureza de operação.');

    if FCadastrarFormNfEntradas.dblCodCliente.KeyValue = null then
      raise Exception.Create('Por favor, selecione um fornecedor.');

    DM.AtualizaItem (FCadastrarFormNfEntradas.dblCodCliente.KeyValue,
      dblcProduto.KeyValue, FCadastrarFormNfEntradas.dblcNatureza.KeyValue, 0,
      VlrUnit, 0, 1, Qtde, AliqICMS, AliqIPI, VlrIpi, VlrUnitSIpi, VlrTot,
      VlrTotSIpi, PctDesc, VlrICMS, PctJuros, BaseICMSSub, VlrICMSSub, BaseICMS,
      0, 0, 0, 0);

    edQtde.Value     := Qtde;
    edPreco.Value    := VlrUnit;
    edVlrIcms.Value  := VlrIcms;
    edVlrIpi.Value   := VlrIpi;
    edVlrTotal.Value := VlrTotSIpi;
    edAliqICMS.Value := AliqICMS;
    edAliqIPI.Value  := AliqIPI;
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := False;
    end;
  end;
end;

procedure TFEditarNfEntradasItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;

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
end;

procedure TFEditarNfEntradasItens.Label5Click(Sender: TObject);
begin
  FBuscaProdutos := TFBuscaProdutos.Create(Self);
  FBuscaProdutos.cliente := TCliente.Create(FCadastrarFormNfEntradas.dblCodCliente.KeyValue);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    dblcProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName ('PRODUTO_SQ').Value;
    dblcProdutoClick(nil);
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarNfEntradasItens.dblcProdutoClick(Sender: TObject);
begin
  if Sender = dblcProduto then
  begin
    DBLookupComboBox2.KeyValue := dblcProduto.KeyValue;
    if TNfEntrada(TFCadastrarListaComum(FCadastrarFormNfEntradas.Owner).registro).dt_entrada = null then
      edPreco.Text := dsListaProdutos.DataSet.FieldByName('PRECO_UNIT').AsString;
  end;

  if Sender = DBLookupComboBox2 then
  begin
    dblcProduto.KeyValue := DBLookupComboBox2.KeyValue;
    if TNfEntrada(TFCadastrarListaComum(FCadastrarFormNfEntradas.Owner).registro).dt_entrada = null then
      edPreco.Text := dsListaProdutos.DataSet.FieldByName('PRECO_UNIT').AsString;
  end;

  listaEstoque;
  AtualizaItem;
end;

procedure TFEditarNfEntradasItens.edQtdeExit(Sender: TObject);
begin
  AtualizaItem;
end;

procedure TFEditarNfEntradasItens.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.montaLista('where produto_ativo = ''S'' order by descricao_produto');

  //Só calcula o item se nao deu entrada na nota.
  if TNfEntrada(TFCadastrarListaComum(FCadastrarFormNfEntradas.Owner).registro).dt_entrada <> null then
    RzPanel1.Enabled := False
  else
  begin
    dblcProduto.KeyValue := dsListaProdutos.DataSet.FieldByName('produto_sq').Value;
    DBLookupComboBox2.KeyValue := dblcProduto.KeyValue;
    dblcProdutoClick(nil);
  end;
end;

procedure TFEditarNfEntradasItens.listaEstoque;
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

procedure TFEditarNfEntradasItens.sbExcluirClick(Sender: TObject);
begin
  if (listBoxNumerosSerie.SelectedItem = '') then
    raise Exception.Create('Selectione um número de série para excluir.');

  listBoxNumerosSerie.Items.Delete(listBoxNumerosSerie.ItemIndex);
end;

procedure TFEditarNfEntradasItens.sbIncluirClick(Sender: TObject);
var
  i: Integer;
  listaNumeroSerie: TStrings;
begin
  listaNumeroSerie := TStringList.Create;
  InputArea('Número de série', 'Digite os números de série que deseja incluir (um por linha)', listaNumeroSerie);
  for i := 0 to listaNumeroSerie.Count - 1 do
  begin
    if (Trim(listaNumeroSerie.Strings[i]) = '') then
      continue;

    listBoxNumerosSerie.Items.Add(Trim(listaNumeroSerie.Strings[i]));
  end;

  edQtde.IntValue := listBoxNumerosSerie.Items.Count;
  listBoxNumerosSerie.Sorted := True;
  listBoxNumerosSerie.SetFocus;
end;

procedure TFEditarNfEntradasItens.selecionaEstoque(
  numero_estoque: Integer);
begin
  comboNumeroEstoque.ItemIndex := comboNumeroEstoque.Items.IndexOfObject(TObject(numero_estoque));
end;

function TFEditarNfEntradasItens.retornaNumeroEstoque: Integer;
begin
  result := Integer(comboNumeroEstoque.Items.Objects[comboNumeroEstoque.ItemIndex]);
end;

end.
