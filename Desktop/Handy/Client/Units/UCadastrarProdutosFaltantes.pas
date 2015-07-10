unit UCadastrarProdutosFaltantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, RzEdit;

type
  TFCadastrarProdutosFaltantes = class(TForm)
    dblProduto: TDBLookupListBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label3: TLabel;
    edData: TRzEdit;
    edCliente: TRzEdit;
    edQtde: TRzNumericEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarProdutosFaltantes: TFCadastrarProdutosFaltantes;

implementation

uses UBuscaProdutos, UDM;

{$R *.dfm}

procedure TFCadastrarProdutosFaltantes.FormCreate(Sender: TObject);
begin
  edData.Text := FormatDateTime ('dd/mm/yyyy hh:nn', Date + Time);
end;

end.
