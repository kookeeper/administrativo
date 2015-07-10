unit UCadastrarListaRMA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaRMA = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    procedure editarRMA1;
//    procedure editarRMA2;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaRMA: TFCadastrarListaRMA;

implementation

uses UCadastrarFormRMA1, Assistencias;

{$R *.DFM}

procedure TFCadastrarListaRMA.FormCreate(Sender: TObject);
begin
  registro := TAssistencias.Create;
//  registro := TRMA.Create;
  inherited;
end;

procedure TFCadastrarListaRMA.sbEditarClick(Sender: TObject);
begin
  inherited;
  editarRMA1;
//  editarRMA2;
end;

procedure TFCadastrarListaRMA.editarRMA1;
begin
  try
    FCadastrarFormRMA1 := TFCadastrarFormRMA1.Create(Self);

    if not novo then
      FCadastrarFormRMA1.assistencia := TAssistencias(registro);

    FCadastrarFormRMA1.ShowModal;
  finally
    FreeAndNil(FCadastrarFormRMA1);
    AtualizaLista;
  end;
end;
{
procedure TFCadastrarListaRMA.editarRMA2;
var
  i: integer;
  item: TRMAItem;
begin
  FCadastrarFormRMA2 := TFCadastrarFormRMA2.Create(Self);

  if not novo then
  With (registro as TRMA) do
  begin
    FCadastrarFormRMA2.edDataEntradaNf.Date       := data_entrada_nf;
    FCadastrarFormRMA2.edNumeroNFCliente.IntValue := numero_nf_cliente;
    if data_emissao_nf > 0 then
      FCadastrarFormRMA2.edDataEmissaoNF.Date       := data_emissao_nf;
    if data_compra > 0 then
      FCadastrarFormRMA2.edDataCompra.Date          := data_compra;
    FCadastrarFormRMA2.edLojaCliente.Text         := loja_cliente;
    FCadastrarFormRMA2.edFormaEnvio.Text          := forma_envio;
    FCadastrarFormRMA2.edNFCompra.IntValue        := nf_compra;
    FCadastrarFormRMA2.edNome.Text                := nome_cliente;
    FCadastrarFormRMA2.edEndereco.Text            := endereco_cliente;
    FCadastrarFormRMA2.edTelefoneCliente.Text     := telefone_cliente;
    FCadastrarFormRMA2.edEmailCliente.Text        := email_cliente;
    FCadastrarFormRMA2.edResponsavelCliente.Text  := responsavel_cliente;

    for i := 0 to rma_item.Count - 1 do
    begin
      item := TRMAItem(rma_item.Items[i]);
      With FCadastrarFormRMA2 do
      begin
        cdsItens.Append;
        cdsItensrma_item_sq.Value          := item.vIndice;
        cdsItensrma_sq.Value               := item.rma_sq;
        cdsItensproduto_sq.Value           := item.produto_sq.vIndice;
        cdsItensnr_serie_produto.Value     := item.nr_serie_produto;
        cdsItensqtde_produto.Value         := item.qtde_produto;
        cdsItensacessorio_produto.Value    := item.acessorio_produto;
        cdsItensvlr_unit_produto.Value     := item.vlr_unit_produto;
        cdsItensdefeito_produto.Value      := item.defeito_produto;
        cdsItensdata_retorno_produto.Value := item.data_retorno_produto;
        cdsItensnf_devolucao_produto.Value := item.nf_devolucao_produto;
        cdsItensfinalizacao_produto.Value  := item.finalizacao_produto;
        cdsItensdescricao_produto.Value    := item.produto_sq.descricao_produto;
        cdsItens.Post;
      end;
    end;
  end;
  FCadastrarFormRMA2.ShowModal;
  FreeAndNil(FCadastrarFormRMA2);
  AtualizaLista;
end;
}
end.
