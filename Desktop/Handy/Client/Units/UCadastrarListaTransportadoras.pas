unit UCadastrarListaTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaTransportadoras = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaTransportadoras: TFCadastrarListaTransportadoras;

implementation

uses UDM, UCadastrarFormTransportadoras, Transportadora;

{$R *.DFM}

procedure TFCadastrarListaTransportadoras.FormCreate(Sender: TObject);
begin
  registro := TTransportadora.Create;
  inherited;
end;

end.
