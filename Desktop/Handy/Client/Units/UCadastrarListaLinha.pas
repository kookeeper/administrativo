unit UCadastrarListaLinha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaLinha = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaLinha: TFCadastrarListaLinha;

implementation

uses UCadastrarFormLinha, UDM, Linha;

{$R *.dfm}

procedure TFCadastrarListaLinha.FormCreate(Sender: TObject);
begin
  registro := TLinha.Create;
  inherited;
end;

procedure TFCadastrarListaLinha.sbEditarClick(Sender: TObject);
begin
  inherited;
  FCadastrarFormLinha := TFCadastrarFormLinha.Create(Self);
  FCadastrarFormLinha.ShowModal;
end;

end.
