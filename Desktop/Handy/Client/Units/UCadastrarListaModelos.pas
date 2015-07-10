unit UCadastrarListaModelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaModelos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaModelos: TFCadastrarListaModelos;

implementation

uses UCadastrarFormModelos, Modelo;

{$R *.dfm}

procedure TFCadastrarListaModelos.FormCreate(Sender: TObject);
begin
  registro := TModelo.Create;
  inherited;
end;

procedure TFCadastrarListaModelos.sbEditarClick(Sender: TObject);
begin
  try
    inherited;
    FCadastrarFormModelos := TFCadastrarFormModelos.Create(Self);
    FCadastrarFormModelos.ShowModal;
  finally
    FreeAndnil(FCadastrarFormModelos);
  end;
end;

end.
