unit USelecionarNumeroSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RzCmboBx, RzLstBox, RzChkLst, Mask,
  RzEdit;

type
  TFSelecionarNumeroSerie = class(TForm)
    labelNumeroSerie: TLabel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    checkListNumeroSerie: TRzCheckList;
    Label1: TLabel;
    edFiltro: TRzEdit;
    procedure edFiltroChange(Sender: TObject);
  private
    produto_sq: Variant;
    numeroEstoque: Integer;
    listaItem: TStrings;
    emEstoque: Boolean;
    procedure carregaLista;
    { Private declarations }
  public
    constructor Create(Sender: TComponent; produto_sq_: Variant; numeroEstoque_: Integer;
      listaItem_: TStrings; emEstoque_: Boolean); overload;
  end;

var
  FSelecionarNumeroSerie: TFSelecionarNumeroSerie;

implementation

uses Produto, DBClient, DB;

{$R *.dfm}

{ TFEditarNFiscalItemNumeroSerie }

constructor TFSelecionarNumeroSerie.Create(Sender: TComponent;
  produto_sq_: Variant; numeroEstoque_: Integer; listaItem_: TStrings;
  emEstoque_: Boolean);
begin
  Create(Sender);

  produto_sq := produto_sq_;
  numeroEstoque := numeroEstoque_;
  listaItem := listaItem_;
  emEstoque := emEstoque_;

  carregaLista;
end;

procedure TFSelecionarNumeroSerie.carregaLista();
var
  i, j: Integer;
begin
  // carrega a lista em estoque.
  checkListNumeroSerie.Items := TProduto.Create(produto_sq).listaNumeroSerie(numeroEstoque, edFiltro.Text, emEstoque);

  // retira o que já esta no item.
  for i := 0 to listaItem.Count -1 do
  begin
    for j := 0 to checkListNumeroSerie.Items.Count - 1 do
    begin
      if (TProdutoNumeroSerie(checkListNumeroSerie.Items.Objects[j]).vIndice = TProdutoNumeroSerie(listaItem.Objects[i]).vIndice) then
      begin
        checkListNumeroSerie.Items.Delete(j);
        break;
      end;
    end;
  end;
end;

procedure TFSelecionarNumeroSerie.edFiltroChange(Sender: TObject);
begin
  carregaLista;
end;

end.
