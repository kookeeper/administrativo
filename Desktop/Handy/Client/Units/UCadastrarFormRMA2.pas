unit UCadastrarFormRMA2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls,
  Grids, ToolWin, ComCtrls, RzEdit, RzTabs, DBGrids, RzDBGrid, DBClient;

type
  TFCadastrarFormRMA2 = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    DataSource1: TDataSource;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ToolBar2: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    Label3: TLabel;
    edDataEntradaNf: TRzDateTimeEdit;
    RzPageControl1: TRzPageControl;
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    Label4: TLabel;
    edNumeroNFCliente: TRzNumericEdit;
    Label5: TLabel;
    edDataEmissaoNF: TRzDateTimeEdit;
    Label17: TLabel;
    edDataCompra: TRzDateTimeEdit;
    Label1: TLabel;
    edLojaCliente: TRzEdit;
    Label2: TLabel;
    edFormaEnvio: TRzEdit;
    Label10: TLabel;
    edNFCompra: TRzNumericEdit;
    TabSheet1: TRzTabSheet;
    Label6: TLabel;
    edNome: TRzEdit;
    Label7: TLabel;
    edEndereco: TRzEdit;
    Label8: TLabel;
    edTelefoneCliente: TRzEdit;
    Label19: TLabel;
    edEmailCliente: TRzEdit;
    Label9: TLabel;
    edResponsavelCliente: TRzEdit;
    RzDBGrid1: TRzDBGrid;
    cdsItens: TClientDataSet;
    dsItens: TDataSource;
    cdsItensrma_item_sq: TIntegerField;
    cdsItensrma_sq: TIntegerField;
    cdsItensproduto_sq: TIntegerField;
    cdsItensnr_serie_produto: TStringField;
    cdsItensqtde_produto: TIntegerField;
    cdsItensacessorio_produto: TStringField;
    cdsItensvlr_unit_produto: TBCDField;
    cdsItensdefeito_produto: TStringField;
    cdsItensdata_retorno_produto: TDateTimeField;
    cdsItensnf_devolucao_produto: TIntegerField;
    cdsItensfinalizacao_produto: TStringField;
    cdsItensdescricao_produto: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormRMA2: TFCadastrarFormRMA2;

implementation

uses UDM, RMA, UEditarRMA2Item, UCadastrarListaComum, UCadastrarListaRMA,
  Produto, Cadastro, Variants;

{$R *.DFM}

procedure TFCadastrarFormRMA2.FormCreate(Sender: TObject);
begin
  inherited;
  cdsItens.CreateDataSet;
  cdsItens.Filter := 'rma_item_sq >= 0';
  cdsItens.Filtered := True;
end;

procedure TFCadastrarFormRMA2.sbEditarItemClick(Sender: TObject);
begin
  FEditarRMA2Item := TFEditarRMA2Item.Create(Self);

  if Sender <> sbNovoItem then
  with FEditarRMA2Item do
  begin
    edQuantidadeProduto.IntValue := cdsItensqtde_produto.Value;
    edValorUnitario.Value        := cdsItensvlr_unit_produto.Value;
    edNFDevolucao.IntValue       := cdsItensnf_devolucao_produto.Value;
    edSerieProduto.Text          := cdsItensnr_serie_produto.Value;
    edAcessorios.Text            := cdsItensacessorio_produto.Value;
    edDefeito.Text               := cdsItensdefeito_produto.Value;
    edFinalizacao.Text           := cdsItensfinalizacao_produto.Value;
    if cdsItensdata_retorno_produto.Value > 0 then
      edDataRetornoProduto.Date    := cdsItensdata_retorno_produto.Value;
    dblcProduto.KeyValue := cdsItensproduto_sq.AsInteger;
    dbldProduto.KeyValue := cdsItensproduto_sq.AsInteger;
  end;

  if FEditarRMA2Item.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
      cdsItens.Append
    else
      cdsItens.Edit;

    cdsItensrma_sq.Value               := ((Owner as TFCadastrarListaComum).registro as TRMA).vIndice;
    cdsItensproduto_sq.Value           := FEditarRMA2Item.dsListaProdutos.DataSet.FieldByName('PRODUTO_SQ').Value;
    cdsItensnr_serie_produto.Value     := FEditarRMA2Item.edSerieProduto.Text;
    cdsItensqtde_produto.Value         := FEditarRMA2Item.edQuantidadeProduto.IntValue;
    cdsItensacessorio_produto.Value    := FEditarRMA2Item.edAcessorios.Text;
    cdsItensvlr_unit_produto.Value     := FEditarRMA2Item.edValorUnitario.Value;
    cdsItensdefeito_produto.Value      := FEditarRMA2Item.edDefeito.Text;
    cdsItensdata_retorno_produto.Value := FEditarRMA2Item.edDataRetornoProduto.Date;
    cdsItensnf_devolucao_produto.Value := FEditarRMA2Item.edNFDevolucao.IntValue;
    cdsItensfinalizacao_produto.Value  := FEditarRMA2Item.edFinalizacao.Text;
    cdsItensdescricao_produto.Value    := FEditarRMA2Item.dsListaProdutos.DataSet.FieldByName('DESCRICAO_PRODUTO').AsString;
    cdsItens.Post;
  end;
  inherited;
  FEditarRMA2Item.Free;
end;

procedure TFCadastrarFormRMA2.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormRMA2.sbApagarItemClick(Sender: TObject);
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
    cdsItens.Delete;
end;

procedure TFCadastrarFormRMA2.bbOkClick(Sender: TObject);
var
  item: TRMAItem;
begin
  inherited;

  With ((Owner as TFCadastrarListaComum).registro as TRMA) do
  begin
    data_entrada_nf     := edDataEntradaNf.Date;
    data_emissao_nf     := edDataEmissaoNF.Date;
    numero_nf_cliente   := edNumeroNFCliente.IntValue;
    nome_cliente        := edNome.Text;
    endereco_cliente    := edEndereco.Text;
    email_cliente       := edEmailCliente.Text;
    telefone_cliente    := edTelefoneCliente.Text;
    responsavel_cliente := edResponsavelCliente.Text;
    nf_compra           := edNFCompra.IntValue;
    data_compra         := edDataCompra.Date;
    loja_cliente        := edLojaCliente.Text;
    forma_envio         := edFormaEnvio.Text;
    rma_item.Clear;

    cdsItens.First;
    rma_item.Clear;
    while not cdsItens.Eof do
    begin
      item := TRMAItem.Create(cdsItensrma_item_sq.Value);
      item.rma_sq               := cdsItensrma_sq.Value;
      item.produto_sq           := TProduto.Create(cdsItensproduto_sq.Value);
      item.nr_serie_produto     := cdsItensnr_serie_produto.Value;
      item.qtde_produto         := cdsItensqtde_produto.Value;
      item.acessorio_produto    := cdsItensacessorio_produto.Value;
      item.vlr_unit_produto     := cdsItensvlr_unit_produto.Value;
      item.defeito_produto      := cdsItensdefeito_produto.Value;
      item.data_retorno_produto := cdsItensdata_retorno_produto.Value;
      item.nf_devolucao_produto := cdsItensnf_devolucao_produto.Value;
      item.finalizacao_produto  := cdsItensfinalizacao_produto.Value;
      rma_item.Add(item);
      cdsItens.Next;
    end;
    cdsItens.First;

    salvar;
  end;

end;

end.
