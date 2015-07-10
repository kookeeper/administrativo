unit UConsultarFormClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormClientes, DB, DBClient, Buttons, ToolWin,
  ComCtrls, Grids, StdCtrls, DBCtrls, ExtCtrls;

type
  TFConsultarFormClientes = class(TFCadastrarFormClientes)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultarFormClientes: TFConsultarFormClientes;

implementation

{$R *.dfm}

end.
