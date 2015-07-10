unit UCadastrarListaUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, JPeg, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaUsuarios = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaUsuarios: TFCadastrarListaUsuarios;

implementation

uses Usuario;

{$R *.DFM}

procedure TFCadastrarListaUsuarios.FormCreate(Sender: TObject);
begin
  registro := TUsuario.Create;
  inherited;
end;

end.
