unit UCadastrarListaVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaVendedores = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaVendedores: TFCadastrarListaVendedores;

implementation

uses Vendedor;

{$R *.dfm}

procedure TFCadastrarListaVendedores.FormCreate(Sender: TObject);
begin
  registro := TVendedor.Create;
  inherited;
end;

end.
