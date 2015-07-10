unit UCadastrarListaNaturezas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaNaturezas = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNaturezas: TFCadastrarListaNaturezas;

implementation

uses UDM, UCadastrarFormNaturezas, Natureza;

{$R *.DFM}

procedure TFCadastrarListaNaturezas.FormCreate(Sender: TObject);
begin
  registro := TNatureza.Create;
  inherited;
end;

procedure TFCadastrarListaNaturezas.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormNaturezas := TFCadastrarFormNaturezas.Create(Self);
    FCadastrarFormNaturezas.ShowModal;
  finally
    FreeAndNil(FCadastrarFormNaturezas);
  end;
end;

end.
