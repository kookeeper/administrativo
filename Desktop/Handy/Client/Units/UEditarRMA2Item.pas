unit UEditarRMA2Item;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask, RzEdit, RzDBCmbo;

type
  TFEditarRMA2Item = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    dsListaProdutos: TDataSource;
    edQuantidadeProduto: TRzNumericEdit;
    dblcProduto: TRzDBLookupComboBox;
    dbldProduto: TRzDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edValorUnitario: TRzNumericEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edNFDevolucao: TRzNumericEdit;
    Label9: TLabel;
    edSerieProduto: TRzEdit;
    edAcessorios: TRzEdit;
    edDefeito: TRzEdit;
    edFinalizacao: TRzEdit;
    edDataRetornoProduto: TRzDateTimeEdit;
    procedure bbOkClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure dblcProdutoClick(Sender: TObject);
    procedure dbldProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FEditarRMA2Item: TFEditarRMA2Item;

implementation

uses UDM, UBuscaProdutos, Produto, UCadastrarFormRMA2;

{$R *.DFM}

procedure TFEditarRMA2Item.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if edQuantidadeProduto.IntValue <= 0 then
  begin
    Showmessage ('Informe a Quantidade!');
    edQuantidadeProduto.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TFEditarRMA2Item.Label5Click(Sender: TObject);
begin
  FBuscaProdutos := TFBuscaProdutos.Create(Self);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    dblcProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName('produto_sq').Value;
    dbldProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName('produto_sq').Value;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarRMA2Item.dblcProdutoClick(Sender: TObject);
begin
  dbldProduto.KeyValue := dblcProduto.KeyValue;
end;

procedure TFEditarRMA2Item.dbldProdutoClick(Sender: TObject);
begin
  dblcProduto.KeyValue := dbldProduto.KeyValue;
end;

procedure TFEditarRMA2Item.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.listaProdutoAtivo('order by descricao_produto');
end;

end.
