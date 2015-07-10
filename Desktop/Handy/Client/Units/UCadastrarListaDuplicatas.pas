unit UCadastrarListaDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, StdCtrls, Buttons, ToolWin, ComCtrls,
  Grids, DBGrids, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaDuplicatas = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaDuplicatas: TFCadastrarListaDuplicatas;

implementation

uses UDM, UCadastrarFormDuplicatas, Duplicata;

{$R *.dfm}

procedure TFCadastrarListaDuplicatas.FormCreate(Sender: TObject);
begin
  registro := TDuplicata.Create;
  inherited;
end;

procedure TFCadastrarListaDuplicatas.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormDuplicatas := TFCadastrarFormDuplicatas.Create(Self);
    FCadastrarFormDuplicatas.ShowModal;
  finally
    FreeAndNil(FCadastrarFormDuplicatas);
  end;
end;

end.
