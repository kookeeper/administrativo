unit UEditarRMAItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask, RzEdit;

type
  TFEditarRMAItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    dblcProduto: TDBLookupComboBox;
    dbldProduto: TDBLookupComboBox;
    dsListaProdutos: TDataSource;
    Label1: TLabel;
    cbEquipamento: TComboBox;
    edQtde: TRzNumericEdit;
    procedure bbOkClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure dblcProdutoClick(Sender: TObject);
    procedure dbldProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FEditarRMAItens: TFEditarRMAItens;

implementation

uses UDM, UBuscaProdutos, Produto, Cadastro, UCadastrarFormRMA1, Cliente;

{$R *.DFM}

procedure TFEditarRMAItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if edQtde.IntValue <= 0 then
  begin
    Showmessage ('Informe a Quantidade!');
    edQtde.SetFocus;
  end
  else
  ModalResult := mrOk;
end;

procedure TFEditarRMAItens.Label5Click(Sender: TObject);
begin
  FBuscaProdutos := TFBuscaProdutos.Create(Self);
  FBuscaProdutos.cliente := TCliente.Create(FCadastrarFormRMA1.dblcCliente.KeyValue);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    dblcProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName('produto_sq').Value;
    dbldProduto.KeyValue := FBuscaProdutos.dsBuscaProdutos.DataSet.FieldByName('produto_sq').Value;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarRMAItens.dblcProdutoClick(Sender: TObject);
begin
  dbldProduto.KeyValue := dblcProduto.KeyValue;
end;

procedure TFEditarRMAItens.dbldProdutoClick(Sender: TObject);
begin
  dblcProduto.KeyValue := dbldProduto.KeyValue;
end;

procedure TFEditarRMAItens.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.listaProdutoAtivo('order by descricao_produto');
end;

end.
