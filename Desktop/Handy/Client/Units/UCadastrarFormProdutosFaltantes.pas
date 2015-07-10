unit UCadastrarFormProdutosFaltantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFCadastrarFormProdutosFaltantes = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edCliente: TRzEdit;
    edQtde: TRzEdit;
    edData: TRzEdit;
    edNfEntrada: TRzEdit;
    edProduto: TRzEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormProdutosFaltantes: TFCadastrarFormProdutosFaltantes;

implementation

uses UDM, UCadastrarListaComum, ProdutoFaltante;

{$R *.dfm}

procedure TFCadastrarFormProdutosFaltantes.FormCreate(Sender: TObject);
begin
  inherited;
  with (Owner as TFCadastrarListaComum) do
  if not novo then
  with (registro as TProdutoFaltante) do
  begin
    edProduto.Text   := produto_sq.descricao_produto;
    edCliente.Text   := cliente_sq.nome_cliente;
    edCliente.Tag    := cliente_sq.vIndice;
    edQtde.Text      := IntToStr(qtde_produto_faltante);
    edData.Text      := DateToStr(data_produto_faltante);
    edNfEntrada.Text := nf_entrada_sq;
  end;
end;

end.
