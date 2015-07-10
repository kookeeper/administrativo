unit UEditarRMAEquip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask;

type
  TFEditarRMAEquip = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    dblcProduto: TDBLookupComboBox;
    dbldProduto: TDBLookupComboBox;
    dsListaProdutos: TDataSource;
    mmSerie: TMemo;
    Label1: TLabel;
    mmDefeito: TMemo;
    mmServicos: TMemo;
    Label2: TLabel;
    procedure Label5Click(Sender: TObject);
    procedure dblcProdutoClick(Sender: TObject);
    procedure dbldProdutoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  FEditarRMAEquip: TFEditarRMAEquip;

implementation

uses UDM, UBuscaProdutos, Produto, UCadastrarFormRMA1, Cliente;

{$R *.DFM}

procedure TFEditarRMAEquip.Label5Click(Sender: TObject);
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

procedure TFEditarRMAEquip.dblcProdutoClick(Sender: TObject);
begin
  dbldProduto.KeyValue := dblcProduto.KeyValue;
end;

procedure TFEditarRMAEquip.dbldProdutoClick(Sender: TObject);
begin
  dblcProduto.KeyValue := dbldProduto.KeyValue;
end;

procedure TFEditarRMAEquip.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.listaProdutoAtivo('order by descricao_produto');
end;

end.
