unit UCadastrarFormProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Variants,
  RzEdit, RzPanel, RzRadGrp, RzLabel, RzDBLbl, RzTabs, UCadastrarListaMovimentacoes,
  DBClient, Grids, DBGrids, RzDBGrid, RzButton, RzRadChk, RzLstBox, Produto,
  ExtDlgs, RzSpnEdt;

type
  TFCadastrarFormProdutos = class(TFCadastrarFormComum)
    dsListaNCM: TDataSource;
    dsListaModelos: TDataSource;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    GroupBox3: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edAlturaLiq: TRzNumericEdit;
    edLarguraLiq: TRzNumericEdit;
    edProfundidadeLiq: TRzNumericEdit;
    edAlturaBru: TRzNumericEdit;
    edLarguraBru: TRzNumericEdit;
    edProfundidadeBru: TRzNumericEdit;
    Label10: TLabel;
    mmDescricao: TRzMemo;
    Label18: TLabel;
    Label19: TLabel;
    edCodigoUpc: TRzEdit;
    edCodigoDun: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    dblNCM: TDBLookupComboBox;
    rgTipoProduto: TRadioGroup;
    dblModelo: TDBLookupComboBox;
    edCodigo: TRzEdit;
    edDescricao: TRzEdit;
    edMarca: TRzEdit;
    edUnidade: TRzEdit;
    rgOrigemMercadoria: TRzRadioGroup;
    edPreco: TRzNumericEdit;
    edPesoBruto: TRzNumericEdit;
    edPesoLiquido: TRzNumericEdit;
    edPrecoSugerido: TRzNumericEdit;
    lblIPI_NCM: TLabel;
    lblSemIPI: TLabel;
    TabSheet3: TRzTabSheet;
    listBoxNumerosSerie: TRzListBox;
    checkControleNumeroSerie: TRzCheckBox;
    edMascaraNumeroSerie: TRzEdit;
    Label3: TLabel;
    listBoxEstoques: TRzListBox;
    checkProdutoAtivo: TRzCheckBox;
    TabSheet4: TRzTabSheet;
    OpenPictureDialog1: TOpenPictureDialog;
    dsProdutoImagem: TDataSource;
    DBImage1: TDBImage;
    Label12: TLabel;
    dblProdutoRetorno: TDBLookupComboBox;
    dsListaProdutoRetorno: TDataSource;
    btnAlterarEstoque: TBitBtn;
    Panel2: TPanel;
    Label9: TLabel;
    Label11: TLabel;
    btnCarregarImagemInternet: TBitBtn;
    btnCarregarImagemDiretorio: TBitBtn;
    btnLimpar: TBitBtn;
    RzLabel4: TRzLabel;
    edGrupoBalanco: TRzSpinner;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edPrecoChange(Sender: TObject);
    procedure dblNCMClick(Sender: TObject);
    procedure btnAlterarEstoqueClick(Sender: TObject);
    procedure listBoxEstoquesClick(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure btnCarregarImagemInternetClick(Sender: TObject);
    procedure btnCarregarImagemDiretorioClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    listaKardex : TFCadastrarListaMovimentacoes;
    procedure carregaListaEstoque();
    { Private declarations }
  public
    produto: TProduto;
    procedure SalvarImagem();
    { Public declarations }
  end;

var
  FCadastrarFormProdutos: TFCadastrarFormProdutos;

implementation

uses UDM, UCadastrarListaComum, ncm, Cadastro, Modelo, clipbrd,
  Kardex, Acesso, Empresa, UCadastrarFormEstoque, Math, StrUtils, AxCtrls,
  ActiveX, UrlMon, Jpeg, Util, WaitForm;

{$R *.DFM}

procedure TFCadastrarFormProdutos.bbOkClick(Sender: TObject);
begin
  inherited;
  if dblModelo.KeyValue = Null then
  begin
    ModalResult := mrNone;
    ShowMessage('Escolha um Modelo!');
    dblModelo.SetFocus;
    exit;
  end;
  if dblNCM.KeyValue = Null then
  begin
    ModalResult := mrNone;
    ShowMessage('Escolha um N.C.M.!');
    dblNCM.SetFocus;
    exit;
  end;

  produto := TProduto.Create(TProduto(TFCadastrarListaComum(Owner).registro).vIndice);

  With produto do
  begin
    codigo_produto        := edCodigo.Text;
    descricao_produto     := edDescricao.Text;
    nbm_sq                := TNCM.Create(dblNCM.KeyValue);
    un_produto            := edUnidade.Text;
    marca_produto         := edMarca.Text;
    preco_unit            := edPreco.Value;
    tipo_produto          := rgTipoProduto.ItemIndex + 1;
    modelo_sq             := TModelo.Create(dblModelo.KeyValue);
    produto_sq_retorno    := dblProdutoRetorno.KeyValue;
    peso_bruto            := edPesoBruto.Value;
    peso_liquido          := edPesoLiquido.Value;
    origem_mercadoria     := rgOrigemMercadoria.ItemIndex;
    descricao_completa    := mmDescricao.Lines.Text;
    codigo_upc            := edCodigoUpc.Text;
    codigo_dun            := edCodigoDun.Text;
    largura_liquida       := edLarguraLiq.Value;
    altura_liquida        := edAlturaLiq.Value;
    profundidade_liquida  := edProfundidadeLiq.Value;
    largura_bruta         := edLarguraBru.Value;
    altura_bruta          := edAlturaBru.Value;
    profundidade_bruta    := edProfundidadeBru.Value;
    controle_numero_serie := IfThen(checkControleNumeroSerie.Checked, 1, 0);
    mascara_numero_serie  := edMascaraNumeroSerie.Text;
    produto_ativo         := IfThen(checkProdutoAtivo.Checked, 'S', 'N');
    grupo_balanco         := edGrupoBalanco.Value;
    salvar;
    salvarImagem();
  end;
end;

procedure TFCadastrarFormProdutos.SalvarImagem();
begin
  if (dsProdutoImagem.DataSet.FieldByName('produto_imagem').IsNull) then
    dsProdutoImagem.DataSet.Delete
  else
  begin
    dsProdutoImagem.DataSet.Edit;
    dsProdutoImagem.DataSet.FieldByName('produto_sq').Value := produto.vIndice;
    dsProdutoImagem.DataSet.Post;
  end;
  TClientDataSet(dsProdutoImagem.DataSet).ApplyUpdates(0);
end;

procedure TFCadastrarFormProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaNCM.DataSet := TNCM.listaRegistros('order by codigo_nbm');
  dsListaModelos.DataSet := TModelo.listaRegistros('order by descricao_modelo');
  dsListaProdutoRetorno.DataSet := TProduto.listaProdutoAtivo();

  listaKardex := TFCadastrarListaMovimentacoes.Create(Self);
  btnAlterarEstoque.Enabled := TAcesso.VerificaAcesso(listaKardex.Name, 'criar');

  produto := TProduto(TFCadastrarListaComum(Owner).registro);

  if not TFCadastrarListaComum(Owner).novo then
  With produto do
  begin
    edCodigo.Text          := codigo_produto;
    edDescricao.Text       := descricao_produto;
    edMarca.Text           := marca_produto;
    edPreco.Value          := PRECO_UNIT;
    edUnidade.Text         := UN_PRODUTO;
    edPesoBruto.Value      := PESO_BRUTO;
    edPesoLiquido.Value    := PESO_LIQUIDO;
    mmDescricao.Lines.Text := descricao_completa;
    edCodigoUpc.Text       := codigo_upc;
    edCodigoDun.Text       := codigo_dun;
    edLarguraLiq.Value     := largura_liquida;
    edAlturaLiq.Value      := altura_liquida;
    edProfundidadeLiq.Value:= profundidade_liquida;
    edLarguraBru.Value     := largura_bruta;
    edAlturaBru.Value      := altura_bruta;
    edProfundidadeBru.Value:= profundidade_bruta;
    edMascaraNumeroSerie.Text := mascara_numero_serie;

    rgTipoProduto.ItemIndex      := TIPO_PRODUTO-1;
    rgOrigemMercadoria.ItemIndex := origem_mercadoria;
    checkControleNumeroSerie.Checked := controle_numero_serie = 1;
    checkProdutoAtivo.Checked := produto_ativo <> 'N';

    dblNCM.KeyValue    := nbm_sq.vIndice;
    dblModelo.KeyValue := modelo_sq.vIndice;
    dblProdutoRetorno.KeyValue := produto_sq_retorno;
    dblNCMClick(nil);
    checkControleNumeroSerie.Enabled :=  not produto.possuiNumeroSerie;
    edGrupoBalanco.Value := grupo_balanco;
  end;
  carregaListaEstoque;

  dsProdutoImagem.DataSet := TProduto.buscarImagemProduto(produto.vIndice);
end;

procedure TFCadastrarFormProdutos.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaModelos.DataSet.Close;
  dsListaNCM.DataSet.Close;
  dsListaProdutoRetorno.DataSet.Close;
  dsProdutoImagem.DataSet.Close;
end;

procedure TFCadastrarFormProdutos.edPrecoChange(Sender: TObject);
begin
  inherited;
  edPrecoSugerido.Value := edPreco.Value / 0.7;
  dblNCMClick(Sender);
end;

procedure TFCadastrarFormProdutos.dblNCMClick(Sender: TObject);
begin
  inherited;
  lblIPI_NCM.Caption := 'I.P.I. do N.C.M.: ' + FloatToStrF(dsListaNCM.DataSet.FieldByName('ALIQ_IPI').Value, ffFixed, 10, 2);
  lblSemIPI.Caption := 'Preço sem IPI: ' + FloatToStrF(edPreco.Value - Round(100 * edPreco.Value * dsListaNCM.DataSet.FieldByName('ALIQ_IPI').Value / (100+dsListaNCM.DataSet.FieldByName('ALIQ_IPI').Value)) / 100, ffFixed, 10, 2);

end;

procedure TFCadastrarFormProdutos.btnAlterarEstoqueClick(Sender: TObject);
begin
  if produto.controle_numero_serie = 0 then
  begin
    listaKardex.Criar := True;
    listaKardex.sbNovo.Enabled := True;
    listaKardex.sbNovo.Click;
  end
  else
  begin
    try
      FCadastrarFormEstoque := TFCadastrarFormEstoque.Create(Self);
      FCadastrarFormEstoque.produto := produto;
      FCadastrarFormEstoque.ShowModal;
      produto := TProduto.Create(produto.vIndice);
    finally
      FreeAndNil(FCadastrarFormEstoque);
    end;
  end;

  carregaListaEstoque;
end;

procedure TFCadastrarFormProdutos.carregaListaEstoque;
begin
  listBoxEstoques.Items := produto.listaEstoques;
end;

procedure TFCadastrarFormProdutos.listBoxEstoquesClick(Sender: TObject);
var
  StringItem: String;
  itemIndex: Integer;
  item: Integer;
begin
  StringItem := TRzListBox(Sender).SelectedItem;
  itemIndex := TRzListBox(Sender).Items.IndexOf(StringItem);
  item := Integer(TRzListBox(Sender).Items.Objects[itemIndex]);

  listBoxNumerosSerie.Items := produto.listaNumeroSerie(item);
end;

procedure TFCadastrarFormProdutos.RzPageControl1Change(Sender: TObject);
begin
  btnAlterarEstoque.Visible := RzPageControl1.ActivePage = TabSheet3;
  btnCarregarImagemInternet.Visible := RzPageControl1.ActivePage = TabSheet4;
  btnCarregarImagemDiretorio.Visible := RzPageControl1.ActivePage = TabSheet4;
  btnLimpar.Visible := RzPageControl1.ActivePage = TabSheet4;
end;

procedure TFCadastrarFormProdutos.btnCarregarImagemInternetClick(Sender: TObject);
var
  status: TStatusWindowHandle;
begin
  status := CreateStatusWindow('Por favor, aguarde enquanto a imagem é carregada...', Self.Handle);
  try
    TProduto.CarregarImagem(produto.vIndice, produto.codigo_produto);
    dsProdutoImagem.DataSet := TProduto.BuscarImagemProduto(produto.vIndice);
  finally
    RemoveStatusWindow(status);
  end;
end;

procedure TFCadastrarFormProdutos.btnCarregarImagemDiretorioClick(
  Sender: TObject);
Var
  imagem: TPicture;
  size: Longint;
  f: file of Byte;
begin
  inherited;
  if OpenPictureDialog1.Execute then
  begin
    AssignFile(f, OpenPictureDialog1.FileName);
    Reset(f);
    try
      imagem := TPicture.Create();
      size := FileSize(f);
      if (size > 50000) Then//Aqui determinados um limite do tamanho da imagem, no caso, 50k é o limite
      Begin
        showmessage('A imagem selecionado é maior que 50 kb');
        exit;
      End;
    Finally
      CloseFile(f);
    end;
    imagem.LoadFromFile(OpenPictureDialog1.FileName);
    clipboard.Assign(imagem);
    DBImage1.PasteFromClipboard;
  end;
end;

procedure TFCadastrarFormProdutos.btnLimparClick(Sender: TObject);
begin
  dsProdutoImagem.DataSet.Edit;
  dsProdutoImagem.DataSet.FieldByName('produto_imagem').Clear;
end;

end.
