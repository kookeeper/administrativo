unit UCadastrarListaBalanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaBalanco = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaBalanco: TFCadastrarListaBalanco;

implementation

uses Balanco, UCadastrarFormBalanco;

{$R *.dfm}

procedure TFCadastrarListaBalanco.FormCreate(Sender: TObject);
begin
  registro := TBalanco.Create;
  inherited;
  CriaOrdem('data_inicio_balanco', true);
end;

procedure TFCadastrarListaBalanco.sbEditarClick(Sender: TObject);
begin
  registro := TBalanco.Create;
  inherited;
  try
    FCadastrarFormBalanco := TFCadastrarFormBalanco.Create(Self);
    FCadastrarFormBalanco.ShowModal;
  finally
    FreeAndNil(FCadastrarFormBalanco);
    AtualizaLista;
  end;
end;

end.
