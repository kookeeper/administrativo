unit UCadastrarListaCondPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaCondPagto = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaCondPagto: TFCadastrarListaCondPagto;

implementation

uses UDM, UCadastrarFormCondPagto, CondPagto;

{$R *.DFM}

procedure TFCadastrarListaCondPagto.FormCreate(Sender: TObject);
begin
  registro := TCondPagto.Create;
  inherited;
end;

procedure TFCadastrarListaCondPagto.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormCondPagto := TFCadastrarFormCondPagto.Create(Self);
    FCadastrarFormCondPagto.ShowModal;
  finally
    FreeAndNil(FCadastrarFormCondPagto);
  end;
end;

end.
