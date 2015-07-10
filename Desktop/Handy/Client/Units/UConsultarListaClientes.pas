unit UConsultarListaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaClientes, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit;

type
  TFConsultarListaClientes = class(TFCadastrarListaClientes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultarListaClientes: TFConsultarListaClientes;

implementation

{$R *.dfm}

end.
