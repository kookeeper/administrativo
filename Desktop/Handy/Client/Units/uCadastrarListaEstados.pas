unit uCadastrarListaEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaEstados = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaEstados: TFCadastrarListaEstados;

implementation

uses UCadastrarFormEstados, UDM, Estado;

{$R *.dfm}

procedure TFCadastrarListaEstados.FormCreate(Sender: TObject);
begin
  registro := TEstado.Create;
  inherited;
end;

procedure TFCadastrarListaEstados.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormEstados := TFCadastrarFormEstados.Create(Self);
    FCadastrarFormEstados.ShowModal;
  finally
    FreeAndNil(FCadastrarFormEstados);
  end;
end;

end.
