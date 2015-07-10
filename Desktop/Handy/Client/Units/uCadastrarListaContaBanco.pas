unit uCadastrarListaContaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaContaBanco = class(TFCadastrarListaComum)
    procedure sbEditarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaContaBanco: TFCadastrarListaContaBanco;

implementation

uses ContaBanco, uCadastrarFormContaBanco;

{$R *.dfm}

procedure TFCadastrarListaContaBanco.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormContaBanco := TFCadastrarFormContaBanco.Create(Self);
    FCadastrarFormContaBanco.ShowModal;
  finally
    FreeAndNil(FCadastrarFormContaBanco);
  end;
end;

procedure TFCadastrarListaContaBanco.FormCreate(Sender: TObject);
begin
  registro := TContaBanco.Create;
  inherited;
end;

end.
