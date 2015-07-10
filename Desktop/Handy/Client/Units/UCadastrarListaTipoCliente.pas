unit UCadastrarListaTipoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaTipoCliente = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaTipoCliente: TFCadastrarListaTipoCliente;

implementation

uses UCadastrarFormTipoCliente, UDM, TipoCliente;

{$R *.dfm}

procedure TFCadastrarListaTipoCliente.FormCreate(Sender: TObject);
begin
  registro := TTipoCliente.Create;
  inherited;
end;

procedure TFCadastrarListaTipoCliente.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormTipoCliente := TFCadastrarFormTipoCliente.Create(Self);
    FCadastrarFormTipoCliente.ShowModal;
  finally
    FreeAndNil(FCadastrarFormTipoCliente);
  end;
end;

end.
