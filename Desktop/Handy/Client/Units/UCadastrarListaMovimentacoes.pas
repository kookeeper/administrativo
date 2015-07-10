unit UCadastrarListaMovimentacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, StdCtrls, Buttons, ToolWin, ComCtrls,
  Grids, DBGrids, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaMovimentacoes = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaMovimentacoes: TFCadastrarListaMovimentacoes;

implementation

uses UDM, UCadastrarFormMovimentacoes, UImportaEntradas, Kardex, Produto,
  UCadastrarFormProdutos, UCadastrarListaProdutos;

{$R *.dfm}

procedure TFCadastrarListaMovimentacoes.FormCreate(Sender: TObject);
begin
  registro := TKardex.Create;
  inherited;
end;

procedure TFCadastrarListaMovimentacoes.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormMovimentacoes := TFCadastrarFormMovimentacoes.Create(Self);

    if ((Sender = sbNovo) and (Owner is TFCadastrarFormProdutos)) then
      FCadastrarFormMovimentacoes.produto := TProduto(TFCadastrarListaProdutos(Owner.Owner).registro);

    FCadastrarFormMovimentacoes.ShowModal;
  finally
    FreeAndNil(FCadastrarFormMovimentacoes);
  end;
end;

procedure TFCadastrarListaMovimentacoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 112 then // F1
    Key := 0;
  inherited;
end;

procedure TFCadastrarListaMovimentacoes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try
    FImportaEntradas := TFImportaEntradas.Create(Self);
    FImportaEntradas.ShowModal;
  finally
    FreeAndNil(FImportaEntradas);
  end;
end;

end.
