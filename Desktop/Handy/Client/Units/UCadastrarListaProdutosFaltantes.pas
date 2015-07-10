unit UCadastrarListaProdutosFaltantes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit;

type
  TFCadastrarListaProdutosFaltantes = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaProdutosFaltantes: TFCadastrarListaProdutosFaltantes;

implementation

uses UCadastrarFormProdutosFaltantes, UDM, ProdutoFaltante;

{$R *.dfm}

procedure TFCadastrarListaProdutosFaltantes.FormCreate(Sender: TObject);
begin
  registro := TProdutoFaltante.Create;
  inherited;
end;

procedure TFCadastrarListaProdutosFaltantes.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormProdutosFaltantes := TFCadastrarFormProdutosFaltantes.Create(Self);
    FCadastrarFormProdutosFaltantes.ShowModal;
  finally
    FreeAndNil(FCadastrarFormProdutosFaltantes);
  end;
end;

end.
