unit UCadastrarListaProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaProdutos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaProdutos: TFCadastrarListaProdutos;

implementation

uses UDM, UCadastrarFormProdutos, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaProdutos.FormCreate(Sender: TObject);
begin
  Tabela := 'tbPecas';
  Sql := 'SELECT * FROM PECAS';
  SetLength (cLista, 10);
  SetLength (nLista, 10);
  SetLength (cIndice, 1);

  cIndice := 'PECA_SQ';

  cLista[0] := 'CODIGO_PRODUTO';
  cLista[1] := 'DESCRICAO_PRODUTO';
  cLista[2] := 'QTDE_PRODUTO_LOJA';
  cLista[3] := 'QTDE_PRODUTO_ARMAZEM';
  cLista[4] := 'QTDE_PRODUTO_DEMO';
  cLista[5] := 'QTDE_PRODUTO_DEFEITO';
  cLista[6] := 'QTDE_PRODUTO_EM_USO';
  cLista[7] := 'QTDE_PRODUTO_BACKUP';
  cLista[8] := 'QTDE_PRODUTO_DEMO_CLI';
  cLista[9] := 'QTDE_PRODUTO_HLC';

  nLista[0] := 'Código';
  nLista[1] := 'Descrição';
  nLista[2] := 'Estoque Loja';
  nLista[3] := 'Estoque Armazem';
  nLista[4] := 'Estoque Demonstração';
  nLista[5] := 'Estoque Defeito';
  nLista[6] := 'Estoque Em Uso';
  nLista[7] := 'Estoque Backup';
  nLista[8] := 'Estoque Demo. Cliente';
  nLista[9] := 'Estoque HLC';
  inherited;
end;

procedure TFCadastrarListaProdutos.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormProdutos, FCadastrarFormProdutos);
  DMLista.cdsListaNBM.Open;
  DMLista.cdsListaModelos.Open;
  if not novo then
  begin
    FCadastrarFormProdutos.edCodigo.Text      := cdsLista.FieldByName('CODIGO_PRODUTO').Text;
    FCadastrarFormProdutos.edDescricao.Text   := cdsLista.FieldByName('DESCRICAO_PRODUTO').Text;
    FCadastrarFormProdutos.edMarca.Text       := cdsLista.FieldByName('MARCA_PRODUTO').Text;
    FCadastrarFormProdutos.edQtdeLoja.Text    := cdsLista.FieldByName('QTDE_PRODUTO_LOJA').Text;
    FCadastrarFormProdutos.edQtdeArmazem.Text := cdsLista.FieldByName('QTDE_PRODUTO_ARMAZEM').Text;
    FCadastrarFormProdutos.edPreco.Text       := cdsLista.FieldByName('PRECO_UNIT').Text;
    FCadastrarFormProdutos.edUnidade.Text     := cdsLista.FieldByName('UN_PRODUTO').Text;
    FCadastrarFormProdutos.edQtdeDemo.Text    := cdsLista.FieldByName('QTDE_PRODUTO_DEMO').Text;
    FCadastrarFormProdutos.edQtdeDefeito.Text := cdsLista.FieldByName('QTDE_PRODUTO_DEFEITO').Text;
    FCadastrarFormProdutos.edQtdeEmUso.Text   := cdsLista.FieldByName('QTDE_PRODUTO_EM_USO').Text;
    FCadastrarFormProdutos.edQtdeBackup.Text  := cdsLista.FieldByName('QTDE_PRODUTO_BACKUP').Text;
    FCadastrarFormProdutos.edQtdeDemoCli.Text := cdsLista.FieldByName('QTDE_PRODUTO_DEMO_CLI').Text;
    FCadastrarFormProdutos.edQtdeHLC.Text     := cdsLista.FieldByName('QTDE_PRODUTO_HLC').Text;
    FCadastrarFormProdutos.rgTipoProduto.ItemIndex    := cdsLista.FieldByName('TIPO_PRODUTO').AsInteger-1;
    FCadastrarFormProdutos.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('NBM_SQ').Text;
    FCadastrarFormProdutos.DBLookupcomboBox2.KeyValue := cdsLista.FieldByName('MODELO_SQ').Text;
  end
  else begin
    FCadastrarFormProdutos.rgTipoProduto.ItemIndex := 0;
  end;
  if FCadastrarFormProdutos.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('PRODUTOS', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormProdutos.edCodigo.Text,
        FCadastrarFormProdutos.edDescricao.Text,
        FCadastrarFormProdutos.edQtdeLoja.Text,
        FCadastrarFormProdutos.edQtdeArmazem.Text,
        FCadastrarFormProdutos.DBLookupComboBox1.KeyValue,
        FCadastrarFormProdutos.DBLookupComboBox2.KeyValue,
        FCadastrarFormProdutos.edUnidade.Text,
        FCadastrarFormProdutos.edMarca.Text,
        StrtoFloat (FCadastrarFormProdutos.edPreco.Text),
        FCadastrarFormProdutos.rgTipoProduto.ItemIndex+1,
        FCadastrarFormProdutos.edQtdeDemo.Text,
        FCadastrarFormProdutos.edQtdeDefeito.Text,
        FCadastrarFormProdutos.edQtdeEmUso.Text,
        FCadastrarFormProdutos.edQtdeBackup.Text,
        FCadastrarFormProdutos.edQtdeDemoCli.Text,
        FCadastrarFormProdutos.edQtdeHLC.Text])
        );
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
