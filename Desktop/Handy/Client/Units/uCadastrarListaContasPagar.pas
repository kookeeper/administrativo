unit uCadastrarListaContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaContasPagar = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaContasPagar: TFCadastrarListaContasPagar;

implementation

uses uCadastrarFormContasPagar, UDM, ContaPagar;

{$R *.dfm}

procedure TFCadastrarListaContasPagar.FormCreate(Sender: TObject);
begin
  registro := TContaPagar.Create;
  inherited;
end;

procedure TFCadastrarListaContasPagar.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormContasPagar := TFCadastrarFormContasPagar.Create(Self);
    FCadastrarFormContasPagar.ShowModal;
  finally
    FreeAndNil(FCadastrarFormContasPagar);
  end;
end;

end.
