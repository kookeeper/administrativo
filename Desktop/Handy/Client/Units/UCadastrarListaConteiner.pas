unit UCadastrarListaConteiner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaConteiner = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaConteiner: TFCadastrarListaConteiner;

implementation

uses UCadastrarFormConteiner, UDM, Produto, Conteiner;

{$R *.dfm}

procedure TFCadastrarListaConteiner.FormCreate(Sender: TObject);
begin
  registro := TConteiner.Create;
  inherited;
end;

procedure TFCadastrarListaConteiner.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormConteiner := TFCadastrarFormConteiner.Create(Self);
    FCadastrarFormConteiner.ShowModal;
  finally
    FreeAndNil(FCadastrarFormConteiner);
  end;
end;

end.
