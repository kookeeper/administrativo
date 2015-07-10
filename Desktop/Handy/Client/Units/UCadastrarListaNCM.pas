unit UCadastrarListaNCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaNCM = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNCM: TFCadastrarListaNCM;

implementation

uses UDM, UCadastrarFormNCM, ncm;

{$R *.DFM}

procedure TFCadastrarListaNCM.FormCreate(Sender: TObject);
begin
  registro := TNCM.Create;
  inherited;
end;

procedure TFCadastrarListaNCM.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormNCM := TFCadastrarFormNCM.Create(Self);
    FCadastrarFormNCM.ShowModal;
  finally
    FreeAndNil(FCadastrarFormNCM);
  end;
end;

end.

