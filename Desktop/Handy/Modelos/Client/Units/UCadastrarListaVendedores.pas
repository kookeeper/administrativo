unit UCadastrarListaVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids;

type
  TFCadastrarListaVendedores = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaVendedores: TFCadastrarListaVendedores;

implementation

uses UCadastrarFormVendedores, UDM;

{$R *.dfm}

procedure TFCadastrarListaVendedores.FormCreate(Sender: TObject);
begin
  Tabela := 'tbVendedores';
  Sql := 'SELECT * FROM VENDEDORES';

  SetLength (cLista, 2);
  SetLength (nLista, 2);
  SetLength (cIndice, 1);

  cIndice := 'VENDEDOR_SQ';

  cLista[0] := 'CODIGO_VENDEDOR';
  cLista[1] := 'NOME_VENDEDOR';

  nLista[0] := 'Código';
  nLista[1] := 'Nome';
  inherited;
end;

procedure TFCadastrarListaVendedores.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormVendedores, FCadastrarFormVendedores);
  if not novo then
  begin
    FCadastrarFormVendedores.edCodigo.Text := cdsLista.FieldByName('CODIGO_VENDEDOR').AsString;
    FCadastrarFormVendedores.edNome.Text   := cdsLista.FieldByName('NOME_VENDEDOR').AsString;
  end;
  if FCadastrarFormVendedores.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('VENDEDORES', Novo, Valores,
      VarArrayOf ([
        StrtoInt (FCadastrarFormVendedores.edCodigo.Text),
        FCadastrarFormVendedores.edNome.Text]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
