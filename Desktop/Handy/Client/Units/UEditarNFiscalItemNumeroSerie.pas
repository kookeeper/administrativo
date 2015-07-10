unit UEditarNFiscalItemNumeroSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RzCmboBx;

type
  TFEditarNFiscalItemNumeroSerie = class(TForm)
    comboNumeroEstoque: TRzComboBox;
    labelNumeroSerie: TLabel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
  private
    { Private declarations }
  public
    constructor Create(Sender: TComponent; produto_sq: Variant; numeroEstoque: Integer;
      listaItem: TStrings); overload;
  end;

var
  FEditarNFiscalItemNumeroSerie: TFEditarNFiscalItemNumeroSerie;

implementation

uses Produto, DBClient, DB;

{$R *.dfm}

{ TFEditarNFiscalItemNumeroSerie }

constructor TFEditarNFiscalItemNumeroSerie.Create(Sender: TComponent;
  produto_sq: Variant; numeroEstoque: Integer; listaItem: TStrings);
var
  i: Integer;
  lista: TStrings;
begin
  Create(Sender);

  lista := TStringList.Create;
  lista.AddStrings(listaItem);

  // carrega a lista em estoque.
  comboNumeroEstoque.Items := TProduto.Create(produto_sq).listaNumeroSerie(numeroEstoque);

  // retira o que já esta no item.
  while (lista.Count > 0) do
  begin
    i := comboNumeroEstoque.Items.IndexOfObject(lista.Objects[0]);
    if (i >= 0) then
      comboNumeroEstoque.Items.Delete(i);
    lista.Delete(0);
  end;
end;

end.
