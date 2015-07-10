unit URegistrarVenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzTabs, ExtCtrls, RzButton, DBCtrls, RzDBCmbo, DB, StdCtrls,
  RzPanel, Grids, RzGrids, Produto, ComCtrls, RzTreeVw, Contnrs, Buttons,
  RzEdit, Mask, jpeg, Menus, RzLabel, RzTrkBar, RzLstBox, ImgList, Pedido;

type
  PMyRec = ^TMyRec;
  TMyRec = record
    modelo_sq: Integer;
  end;

type
  TProdutoDisponivel = class
    imagem: TStream;
    codigo_produto: String;
    descricao_produto: String;
    produto_sq: Integer;
    modelo_sq: Integer;
    qtdeProdutoRetorno: Integer;
    preco_unitario: double;
  end;

type
  TFRegistrarVenda = class(TForm)
    RzPageControl1: TRzPageControl;
    dsListaVendedores: TDataSource;
    tree: TRzCheckTree;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    Label54: TLabel;
    dblVendedor: TRzDBLookupComboBox;
    Label1: TLabel;
    dblCondPagto: TRzDBLookupComboBox;
    dsListaCondPagto: TDataSource;
    Label2: TLabel;
    btnRegistrar: TBitBtn;
    edCpf: TRzEdit;
    Label3: TLabel;
    Label4: TLabel;
    edValorDesconto: TRzNumericEdit;
    edValorTotal: TRzNumericEdit;
    Label5: TLabel;
    edComprovanteCartao: TRzNumericEdit;
    PopupMenu1: TPopupMenu;
    Retornarprodutos1: TMenuItem;
    Removerdosselecionados1: TMenuItem;
    sbEstoque: TScrollBox;
    Panel1: TPanel;
    trackTamanho: TRzTrackBar;
    RzLabel1: TRzLabel;
    edTamanho: TRzNumericEdit;
    edCodigoProduto: TRzEdit;
    sbSelecionado: TScrollBox;
    lbSelecionados: TRzListBox;
    btnShow: TRzBitBtn;
    btnHide: TRzBitBtn;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
    procedure treeCascadeComplete(Sender: TObject; Node: TTreeNode);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Retornarprodutos1Click(Sender: TObject);
    procedure Removerdosselecionados1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbEstoqueResize(Sender: TObject);
    procedure edTamanhoChange(Sender: TObject);
    procedure trackTamanhoChange(Sender: TObject);
    procedure edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure btnShowClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
  private
    listaProdutoDisponivel: TList;
    listaProdutoSelecionado: TList;
    listaProdutoVenda: TList;
    listaModeloDisponivel: TStringList;
    listaModeloSelecionado: TStringList;
    vendedorMaster, pctDescontoMaximo, larguraImagem, alturaImagem: Integer;
    Fpedido_sq: TPedido;

    procedure carregarListaProdutoSelecionado;
    function recuperarLinha(sheet: TWinControl): Integer;
    function recuperarColuna(sheet: TWinControl): Integer;
    procedure AdicionarVenda(Sender: TObject);
    procedure AdicionarVendaProdutoSq(produto_sq: Integer);
    procedure RemoverVenda(Sender: TObject);
    procedure AdicionarImagemSheet(imagem: TStream; descricao_produto: String; vIndice: Integer; destino: TWinControl);
    procedure carregarTreeView();
    procedure adicionarListaFilho(pai: TTreeNode; indice: Integer);
    procedure calcularTotal();
    function buscarListaProduto(modelo_sq: Integer): TList;
    procedure mostrarListaProdutoSelecionado;
    function buscarProduto(produto_sq, modelo_sq: Integer; codigo_produto, descricao_produto: String; preco_unitario: double): TProdutoDisponivel;
    procedure mostrarCodigoProduto(codigo_produto: String);
    procedure atualizarListBox();
    procedure limparTela;
    procedure Setpedido_sq(const Value: TPedido);
    { Private declarations }
  public
    property pedido_sq: TPedido read Fpedido_sq write Setpedido_sq;
    { Public declarations }
  end;

var
  FRegistrarVenda: TFRegistrarVenda;

implementation

uses Modelo, DBClient, Math, Vendedor, Cadastro, Kardex, UDM, Usuario,
  CondPagto, Natureza, Transportadora, Cliente, WaitForm,
  uRegistrarVendaSenha;

{$R *.dfm}

procedure TFRegistrarVenda.AdicionarImagemSheet;
var
  sheet: TWinControl;
begin
  sheet := destino;

  With (TImage.Create(sheet)) do
  begin
    imagem.Seek(0, soFromBeginning);
    Picture.Bitmap.LoadFromStream(imagem);

    Left := recuperarColuna(sheet) * larguraImagem;//Width;
    Top := recuperarLinha(sheet) * alturaImagem;//Height;
    Width := larguraImagem;
    Height := alturaImagem;
    Parent := sheet;
    Proportional := True;
    Visible := True;
    Update;
    ShowHint := True;
    Tag := vIndice;

    if (destino <> sbSelecionado) then
    begin
      Cursor := crHandPoint;
      OnClick := AdicionarVenda;
      Hint := descricao_produto;
    end
    else
    begin
      Hint := descricao_produto;
      PopupMenu := PopupMenu1;
    end;
  end;
end;

procedure TFRegistrarVenda.carregarListaProdutoSelecionado;
var
  i: Integer;
begin
  //limpa a lista de produtos selecionados
  listaProdutoSelecionado.Clear;

  for i := 0 to listaModeloSelecionado.Count - 1 do
  begin
    listaProdutoSelecionado.Assign(buscarListaProduto(StrToInt(listaModeloSelecionado.Strings[i])), laOr);
  end;
end;

procedure TFRegistrarVenda.mostrarListaProdutoSelecionado;
var
  i: Integer;
  produtoDisponivel: TProdutoDisponivel;
begin
  while (sbEstoque.ControlCount > 0) do
    sbEstoque.Controls[0].Destroy;

  for i := 0 to listaProdutoSelecionado.Count - 1 do
  try
    produtoDisponivel := TProdutoDisponivel(listaProdutoSelecionado.Items[i]);
    AdicionarImagemSheet(produtoDisponivel.imagem, produtoDisponivel.descricao_produto, produtoDisponivel.produto_sq, sbEstoque);
  except on E: Exception do
    begin
      showmessage(produtoDisponivel.codigo_produto);
      raise E;
    end;
  end;
end;

function TFRegistrarVenda.buscarListaProduto(modelo_sq: Integer): TList;
var
  i: Integer;
  cds: TClientDataSet;
  produtoDisponivel: TProdutoDisponivel;
begin
  result := TList.Create;

  //se o modelo ainda nao foi carregado em memoria, carrega.
  if (listaModeloDisponivel.IndexOf(IntToStr(modelo_sq)) < 0) then
  begin
    cds := TProduto.listarDescricao(' where p.modelo_sq = ' + IntToStr(modelo_sq) + ' and preco_unit > 0');
    while (not cds.Eof) do
    begin
      produtoDisponivel := buscarProduto(cds.FieldByName('produto_sq').AsInteger, modelo_sq, cds.FieldByName('codigo_produto').AsString, cds.FieldByName('descricao_produto').AsString, cds.FieldByName('preco_unit').Value);
      if (produtoDisponivel <> nil) then
        listaProdutoDisponivel.Add(produtoDisponivel);
      cds.Next;
    end;
    FreeAndNil(cds);
    listaModeloDisponivel.add(IntToStr(modelo_sq));
  end;

  //monta a lista de retorno
  for i := 0 to listaProdutoDisponivel.Count - 1 do
  begin
    if (TProdutoDisponivel(listaProdutoDisponivel.Items[i]).modelo_sq = modelo_sq) then
      result.Add(listaProdutoDisponivel.Items[i]);
  end;

end;

function TFRegistrarVenda.buscarProduto(produto_sq, modelo_sq: Integer; codigo_produto, descricao_produto: String; preco_unitario: double): TProdutoDisponivel;
var
  i: Integer;
  imagem: TStream;
  produtoDisponivel: TProdutoDisponivel;
begin
  result := nil;

  //verificar se o produto realmente nao esta na lista de produtos disponiveis
  for i := 0 to listaProdutoDisponivel.Count - 1 do
  begin
    if (TProdutoDisponivel(listaProdutoDisponivel.Items[i]).produto_sq = produto_sq) then
      Exit;
  end;

  imagem := TProduto.recuperarImagem(produto_sq, codigo_produto);

  if (imagem <> nil) then
  begin
    produtoDisponivel := TProdutoDisponivel.Create;
    produtoDisponivel.imagem := imagem;
    produtoDisponivel.descricao_produto := descricao_produto;
    produtoDisponivel.produto_sq := produto_sq;
    produtoDisponivel.modelo_sq := modelo_sq;
    produtoDisponivel.preco_unitario := preco_unitario;
    result := produtoDisponivel;
  end;
end;

procedure TFRegistrarVenda.FormCreate(Sender: TObject);
begin
  trackTamanho.Position := 200;

  carregarTreeView;

  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  dsListaCondPagto.DataSet  := TCondPagto.listaRegistros('order by descricao_cond_pagto');

  dblVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName(dblVendedor.KeyField).Value;
  dblCondPagto.KeyValue := dsListaCondPagto.DataSet.FieldByName(dblCondPagto.KeyField).Value;

  listaModeloSelecionado := TStringList.Create;
  listaModeloDisponivel := TStringList.Create;
  listaProdutoDisponivel := TList.Create;
  listaProdutoSelecionado := TList.Create;
  listaProdutoVenda := TList.Create;
  edCpf.Clear;
  edValorDesconto.Clear;
  edValorTotal.Clear;
  edComprovanteCartao.Clear;
  RzPageControl1.ActivePageIndex := 0;
end;

procedure TFRegistrarVenda.AdicionarVenda(Sender: TObject);
var
  produto_sq: Integer;
begin
  produto_sq := TImage(Sender).Tag;
  AdicionarVendaProdutoSq(produto_sq);
end;

procedure TFRegistrarVenda.btnRegistrarClick(Sender: TObject);
var
  i: Integer;
  pedido: TPedido;
  itemPedido: TPedidoItem;
  valor_desconto_unitario: Double;
  cliente: TCliente;
  produtoVendido: TProdutoDisponivel;
  cpf: String;
begin
  try
    if (edCpf.Text <> '') then
    begin
      if not (DM.TestaCPF(edCpf.Text)) then
      begin
        cpf := edCpf.Text;
        InputQuery('C.P.F. inválido', 'Por favor, corriga o C.P.F. informado.', cpf);
        if (not (DM.TestaCPF(cpf))) then
        begin
          ShowMessage('O C.P.F. informádo não é válido. Nenhum C.P.F. será utilizado.');
          edCpf.Clear;
        end
        else
          edCpf.Text := cpf;
      end;
    end;
    cliente := TCliente.buscaPorCodigo(edCpf.Text);
  except
    on E: Exception do
    begin
      if Copy(E.Message, 0, 16) = 'Não foi possível' then
      begin
//        resposta := MessageDlg(E.Message + '. Deseja cadastrá-lo?', mtError, [mbYes, mbCancel], 0);

//        if (resposta = mrCancel) then
//          raise E;

        With TCliente.Create do
        begin
          codigo_cliente := edCpf.Text;
          nome_cliente   := 'CONSUMIDOR - ' + edCpf.Text;
          transportadora_sq := TTransportadora.CreateFiltro('codigo_transportadora = ' + QuotedStr(nfDefault.codigo_transportadora));
          salvar;
        end;
        cliente := TCliente.buscaPorCodigo(edCpf.Text);

      end
      else raise E;
    end;
  end;

  pedido := TPedido.Create;
  pedido.data_pedido   := Date + Time;
  pedido.vendedor_sq   := TVendedor.CreateFiltro('codigo_vendedor = ' + IntToStr(dblVendedor.KeyValue));
  pedido.cond_pagto_sq := TCondPagto.CreateFiltro('codigo_cond_pagto = ' + IntToStr(dblCondPagto.KeyValue));

  pedido.natureza_sq   := TNatureza.CreateFiltro('codigo_natureza = ' + IntToStr(nfDefault.cfop));
  pedido.transportadora_sq := cliente.transportadora_sq;

  pedido.cliente_sq    := cliente;
  pedido.vlr_desc      := edValorDesconto.Value;
  pedido.vlr_total     := edValorTotal.Value;
  pedido.numero_comprovante_cartao := edComprovanteCartao.IntValue;
  pedido.cotacao_dolar := 1;
  pedido.listaItem     := TList.Create;

  if (pedido.vendedor_sq.validarDesconto(pedido.vlr_total, pedido.vlr_desc, pctDescontoMaximo)) then // desconto master liberado
    pedido.vendedor_sq_desconto := vendedorMaster
  else
    pedido.vendedor_sq_desconto := null;

  valor_desconto_unitario := Floor(pedido.vlr_desc/sbSelecionado.ControlCount);

  for i := 0 to listaProdutoVenda.Count - 1 do
  begin
    produtoVendido := TProdutoDisponivel(listaProdutoVenda.Items[i]);
    itemPedido := TPedidoItem(pedido.pesquisaProduto(produtoVendido.produto_sq));

    if (itemPedido = nil) then
    begin
      itemPedido := TPedidoItem.Create;
      itemPedido.produto_sq       := TProduto.Create(produtoVendido.produto_sq);
      itemPedido.qtde_pedido_item := 1;
      itemPedido.qtde_produto_retorno := produtoVendido.qtdeProdutoRetorno;
      itemPedido.preco_unit       := itemPedido.produto_sq.preco_unit;
      itemPedido.vlr_total_item   := itemPedido.preco_unit * itemPedido.qtde_pedido_item;

      if (i = 0) then
        itemPedido.vlr_desc := (pedido.vlr_desc - (valor_desconto_unitario * (listaProdutoVenda.Count - 1))) * itemPedido.qtde_pedido_item
      else
        itemPedido.vlr_desc         := valor_desconto_unitario * itemPedido.qtde_pedido_item;

      pedido.listaItem.Add(itemPedido);
    end
    else
    begin
      itemPedido.qtde_pedido_item := itemPedido.qtde_pedido_item + 1;
      itemPedido.qtde_produto_retorno := itemPedido.qtde_produto_retorno + produtoVendido.qtdeProdutoRetorno;
      itemPedido.vlr_total_item   := itemPedido.preco_unit * itemPedido.qtde_pedido_item;
      itemPedido.vlr_desc         := valor_desconto_unitario * itemPedido.qtde_pedido_item;
    end;
  end;

  pedido.salvar;
  pedido.Finalizar;

  while sbSelecionado.ControlCount > 0 do
    sbSelecionado.Controls[0].Destroy;

  ShowMessage('Venda registrada com sucesso.');

  limparTela;
end;

procedure TFRegistrarVenda.limparTela();
var
  i: Integer;
begin
  edCpf.Clear;
  edValorDesconto.Clear;
  edValorTotal.Clear;
  edComprovanteCartao.Clear;
  edCodigoProduto.Clear;
  RzPageControl1.ActivePageIndex := 0;
  listaProdutoVenda.Clear;
  atualizarListBox;
  pctDescontoMaximo := 0;
  vendedorMaster := 0;

  //varre todos os itens da arvore
  for i := 0 to tree.Items.Count - 1 do
  begin
    if (tree.ItemState[i] = csChecked) then
      tree.ItemState[i] := csUnchecked;
  end;
  treeCascadeComplete(nil, nil);
end;

procedure TFRegistrarVenda.treeCascadeComplete(Sender: TObject;
  Node: TTreeNode);
var
  i: Integer;
  modelo_sq: Integer;
  status: TStatusWindowHandle;
begin
  status := CreateStatusWindow('Por favor, aguarde enquanto as imagens são carregadas...', Self.Handle);
  try
    //esconde a lista de produtos vendidos
    btnHideClick(nil);

    //limpa a lista de modelos selecionados
    listaModeloSelecionado.Clear;

    //varre todos os itens da arvore
    for i := 0 to tree.Items.Count - 1 do
    begin
      //captura o modelo do item da arvore
      modelo_sq := PMyRec(tree.Items.Item[i].Data)^.modelo_sq;

      //inclui modelo na lista
      if (tree.ItemState[i] = csChecked) then
      begin
        listaModeloSelecionado.Add(IntToStr(modelo_sq));
      end;
    end;

    carregarListaProdutoSelecionado;
    mostrarListaProdutoSelecionado;
  finally
    RemoveStatusWindow(status);
  end;
end;

procedure TFRegistrarVenda.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    Close;
end;

procedure TFRegistrarVenda.RemoverVenda(Sender: TObject);
var
  i, produto_sq: Integer;
begin
  if (Sender is TImage) then
    produto_sq := TImage(Sender).Tag
{
  else
  if (Sender is TRzListBox) then
  begin
    produto_sq := TProdutoDisponivel(TRzListBox(Sender).Items.Objects[TRzListBox(Sender).ItemIndex]).produto_sq;
  end
}
  else
    raise Exception.Create('Origem não definida');

  for i := 0 to listaProdutoVenda.Count - 1 do
  begin
    if (TProdutoDisponivel(listaProdutoVenda.Items[i]).produto_sq = produto_sq) then
    begin
      listaProdutoVenda.Delete(i);
      break;
    end;
  end;

  if (Sender is TImage) then
  begin
    TImage(Sender).Parent := nil;
    TImage(Sender).Free;
  end;
  
  sbEstoqueResize(sbSelecionado);
  calcularTotal;
  atualizarListBox;
end;

procedure TFRegistrarVenda.calcularTotal;
var
  i: Integer;
begin
  edValorTotal.Value := 0;
  for i := 0 to listaProdutoVenda.Count - 1 do
    edValorTotal.Value := edValorTotal.Value + TProdutoDisponivel(listaProdutoVenda.Items[i]).preco_unitario;
end;

procedure TFRegistrarVenda.Retornarprodutos1Click(Sender: TObject);
var
  i, produto_sq: Integer;
  produtoSelecionado: TProdutoDisponivel;
begin
  produto_sq := TImage(PopupMenu1.PopupComponent).Tag;

  produtoSelecionado := nil;
  for i := 0 to listaProdutoSelecionado.Count - 1 do
  begin
    if (TProdutoDisponivel(listaProdutoSelecionado.Items[i]).produto_sq = produto_sq) then
    begin
      produtoSelecionado := TProdutoDisponivel(listaProdutoSelecionado.Items[i]);
      break;
    end;
  end;

  try
    produtoSelecionado.qtdeProdutoRetorno := StrToInt(InputBox('Retorno ao estoque', 'Digite a quantidade: ', IntToStr(produtoSelecionado.qtdeProdutoRetorno)));
  except on E: EConvertError do
    begin
      ShowMessage('O número informado não é válido.');
    end;
  end;
end;

procedure TFRegistrarVenda.Removerdosselecionados1Click(Sender: TObject);
begin
  RemoverVenda(PopupMenu1.PopupComponent);
end;

function TFRegistrarVenda.recuperarColuna(sheet: TWinControl): Integer;
var
  qtdeLinha: Integer;
begin
  qtdeLinha := sheet.Height div alturaImagem;

  if (qtdeLinha = 0) then
    result := sheet.ControlCount
  else
    result := sheet.ControlCount div qtdeLinha;
end;

function TFRegistrarVenda.recuperarLinha(sheet: TWinControl): Integer;
var
  qtdeLinha: Integer;
begin
  qtdeLinha := sheet.Height div alturaImagem;

  //0 é a primeira linha disponivel
  if (qtdeLinha = 0) then
    result := sheet.ControlCount
  else
    result := sheet.ControlCount mod qtdeLinha;
end;

procedure TFRegistrarVenda.carregarTreeView;
begin
  adicionarListaFilho(nil, 0);
end;

procedure TFRegistrarVenda.adicionarListaFilho(pai: TTreeNode; indice: Integer);
var
  cds: TClientDataSet;
  item: TTreeNode;
  MyRecPtr: PMyRec;
begin
  if (indice = 0) then
    cds := TModelo.listaRegistros('where modelo_sq_pai is null')
  else
    cds := TModelo.listaRegistros('where modelo_sq_pai = ' + IntToStr(indice));

  while (not cds.Eof) do
  begin
    New(MyRecPtr);
    MyRecPtr^.modelo_sq := cds.FieldByName('modelo_sq').AsInteger;

    item := tree.Items.AddChild(pai, cds.FieldByName('descricao_modelo').AsString);
    item.Data := MyRecPtr;
    adicionarListaFilho(item, cds.FieldByName('modelo_sq').AsInteger);
    cds.Next;
  end;
end;

procedure TFRegistrarVenda.FormDestroy(Sender: TObject);
begin
  while (listaProdutoDisponivel.Count > 0) do
  begin
    FreeAndNil(TProdutoDisponivel(listaProdutoDisponivel.Items[0]).imagem);
    TProdutoDisponivel(listaProdutoDisponivel.Items[0]).Free;
    listaProdutoDisponivel.Delete(0);
  end;
  listaProdutoDisponivel.Free;

  listaProdutoSelecionado.Clear;
  listaProdutoSelecionado.Free;

  listaProdutoVenda.Clear;
  listaProdutoVenda.Free;

  listaModeloDisponivel.Clear;
  listaModeloDisponivel.Free;

  listaModeloSelecionado.Clear;
  listaModeloSelecionado.Free;
end;

procedure TFRegistrarVenda.sbEstoqueResize(Sender: TObject);
var
  x, y: Integer;
  limbo: TWinControl;
begin
  limbo := TWinControl.Create(Self);
  while TWinControl(Sender).ControlCount > 0 do
    TWinControl(Sender).Controls[0].Parent := limbo;

  while limbo.ControlCount > 0 do
  begin
    x := recuperarColuna(TWinControl(Sender)) * larguraImagem;//Width;
    y := recuperarLinha(TWinControl(Sender)) * alturaImagem;//Height;

    limbo.Controls[0].Width := larguraImagem;
    limbo.Controls[0].Height := alturaImagem;

    limbo.Controls[0].Parent := TWinControl(Sender);

    TWinControl(Sender).Controls[TWinControl(Sender).ControlCount - 1].Left := x;
    TWinControl(Sender).Controls[TWinControl(Sender).ControlCount - 1].Top  := y;
  end;
end;

procedure TFRegistrarVenda.edTamanhoChange(Sender: TObject);
begin
  trackTamanho.Position := edTamanho.IntValue;
end;

procedure TFRegistrarVenda.trackTamanhoChange(Sender: TObject);
begin
  edTamanho.IntValue := trackTamanho.Position;
  larguraImagem := edTamanho.IntValue;
  alturaImagem := edTamanho.IntValue;
  sbEstoqueResize(sbEstoque);
  sbEstoqueResize(sbSelecionado);
end;

procedure TFRegistrarVenda.edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
var
  status: TStatusWindowHandle;
begin
  if (Key = #13) then
  begin
    status := CreateStatusWindow('Por favor, aguarde enquanto as imagens são carregadas...', Self.Handle);
    try
      //esconde a lista de produtos vendidos
      btnHideClick(nil);

      //limpa a lista de produtos selecionados
      listaProdutoSelecionado.Clear;
      listaModeloSelecionado.Clear;

      mostrarCodigoProduto(edCodigoProduto.Text);
    finally
      RemoveStatusWindow(status);
    end;
    Key := #0;
  end;
end;

procedure TFRegistrarVenda.mostrarCodigoProduto(codigo_produto: String);
var
  i: Integer;
  cds: TClientDataSet;
  produtoDisponivel: TProdutoDisponivel;
begin
  cds := TProduto.listarDescricao(' where upper(p.codigo_produto) like ''%' + codigo_produto + '%''');

  //varre todos os produtos que possuem o codigo digitado
  while (not cds.Eof) do
  begin
    //verifica se o produto esta disponivel
    produtoDisponivel := buscarProduto(cds.FieldByName('produto_sq').AsInteger, cds.FieldByName('modelo_sq').AsInteger, cds.FieldByName('codigo_produto').AsString, cds.FieldByName('descricao_produto').AsString, cds.FieldByName('preco_unit').Value);
    if (produtoDisponivel <> nil) then
      listaProdutoDisponivel.Add(produtoDisponivel);

    //carrega a lista de produtos selecionados
    for i := 0 to listaProdutoDisponivel.Count - 1 do
    begin
      if (TProdutoDisponivel(listaProdutoDisponivel.Items[i]).produto_sq = cds.FieldByName('produto_sq').AsInteger) then
        listaProdutoSelecionado.Add(listaProdutoDisponivel.Items[i]);
    end;
    cds.Next;
  end;
  FreeAndNil(cds);
  mostrarListaProdutoSelecionado;
end;

procedure TFRegistrarVenda.atualizarListBox;
var
  i, largura, altura: Integer;
  linha: String;
  total: Double;
begin
  largura := 0;
  total := 0;

  lbSelecionados.Clear;
  for i := 0 to listaProdutoVenda.Count - 1 do
  begin
    linha := TProdutoDisponivel(listaProdutoVenda.Items[i]).descricao_produto;
    linha := linha + FormatFloat('" - R$" ###,##0.00', TProdutoDisponivel(listaProdutoVenda.Items[i]).preco_unitario);
    total := total + TProdutoDisponivel(listaProdutoVenda.Items[i]).preco_unitario;
    if (largura < Canvas.TextWidth(linha)) then
      largura := Canvas.TextWidth(linha);

    lbSelecionados.AddObject(linha, listaProdutoVenda.Items[i]);
  end;

  if (listaProdutoVenda.Count > 1) then
    lbSelecionados.AddObject('Valor total: ' + FormatFloat('" - R$" ###,##0.00', total), nil);

  lbSelecionados.Width := largura + 30;
  lbSelecionados.Left := Width - lbSelecionados.Width - 10;
  altura := Canvas.TextHeight(linha);

  if (lbSelecionados.Items.Count > 7) then
    lbSelecionados.Height := altura * 8
  else
    lbSelecionados.Height := altura * (listaProdutoVenda.Count + 1);

  if (lbSelecionados.Count > 0) then
    btnShowClick(nil)
  else
    btnHideClick(nil);
end;

procedure TFRegistrarVenda.btnShowClick(Sender: TObject);
begin
  lbSelecionados.Show;
  btnShow.Hide;
  btnHide.Show;
end;

procedure TFRegistrarVenda.btnHideClick(Sender: TObject);
begin
  lbSelecionados.Hide;
  btnShow.Show;
  btnHide.Hide;
end;

procedure TFRegistrarVenda.SpeedButton1Click(Sender: TObject);
begin
  try
    RegistrarVendaSenha := TRegistrarVendaSenha.Create(Self);
    if (RegistrarVendaSenha.ShowModal = mrOk) then
    begin
      pctDescontoMaximo := RegistrarVendaSenha.PctDescontoMaximo;
      vendedorMaster := RegistrarVendaSenha.VendedorMaster;
    end;
  finally
    FreeAndNil(RegistrarVendaSenha);
  end;
end;

procedure TFRegistrarVenda.Setpedido_sq(const Value: TPedido);
var
  i, qtde: Integer;
  produtoVendido: TProdutoDisponivel;
  itemPedido: TPedidoItem;
begin
  Fpedido_sq := Value;

  listaProdutoVenda.Clear;

  for i := 0 to Fpedido_Sq.listaItem.Count - 1 do
  begin
    itemPedido := Fpedido_sq.listaItem.Items[i];

    mostrarCodigoProduto(itemPedido.produto_sq.codigo_produto);
    
    for qtde := 1 to itemPedido.qtde_pedido_item do
      AdicionarVendaProdutoSq(itemPedido.produto_sq.vIndice);

  end;
  edCpf.Text := Fpedido_Sq.cliente_sq.codigo_cliente;
  edValorDesconto.Value := Fpedido_sq.vlr_desc;
  edComprovanteCartao.IntValue := Fpedido_sq.numero_comprovante_cartao;
  dblVendedor.KeyValue := Fpedido_sq.vendedor_sq.vIndice;
  dblCondPagto.KeyValue := Fpedido_sq.cond_pagto_sq.vIndice;

  calcularTotal;
  atualizarListBox;
end;

procedure TFRegistrarVenda.Edit1Exit(Sender: TObject);
begin
  if Edit1.Text = '' then
    Exit;

  pedido_sq := TPedido.CreateFiltro('numero_pedido = ' + Edit1.Text);
end;

procedure TFRegistrarVenda.AdicionarVendaProdutoSq(produto_sq: Integer);
var
  i: Integer;
  produtoDisponivel: TProdutoDisponivel;
begin
  for i := 0 to listaProdutoSelecionado.Count - 1 do
  begin
    if (TProdutoDisponivel(listaProdutoSelecionado.Items[i]).produto_sq = produto_sq) then
    begin
      produtoDisponivel := TProdutoDisponivel(listaProdutoSelecionado.Items[i]);
      listaProdutoVenda.Add(produtoDisponivel);
      AdicionarImagemSheet(produtoDisponivel.imagem, produtoDisponivel.descricao_produto, produtoDisponivel.produto_sq, sbSelecionado);
      break;
    end;
  end;

  atualizarListBox;
  calcularTotal;
end;

end.
