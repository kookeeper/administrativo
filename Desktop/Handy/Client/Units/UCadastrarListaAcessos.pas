unit UCadastrarListaAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit;

type
  TFCadastrarListaAcessos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaAcessos: TFCadastrarListaAcessos;

implementation

uses UCadastrarFormAcessos, UDM;

{$R *.dfm}

procedure TFCadastrarListaAcessos.FormCreate(Sender: TObject);
begin
  Tabela := 'Usuarios';
  Sql := 'SELECT * FROM usuarios';
  SetLength (cLista, 1);
  SetLength (nLista, 1);
  SetLength (cIndice, 1);

  cIndice := 'USUARIO_SQ';

  cLista[0]  := 'NOME_USUARIO';

  nLista[0]  := 'Usuário';
  inherited;
end;

procedure TFCadastrarListaAcessos.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormAcessos := TFCadastrarFormAcessos.Create(Self);
    FCadastrarFormAcessos.ShowModal;
  finally
    FreeAndNil(FCadastrarFormAcessos);
  end;
end;

end.
