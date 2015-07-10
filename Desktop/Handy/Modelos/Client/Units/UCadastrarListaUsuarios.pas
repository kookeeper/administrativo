unit UCadastrarListaUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaUsuarios = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaUsuarios: TFCadastrarListaUsuarios;

implementation

uses UDM, UCadastrarFormUsuarios, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaUsuarios.FormCreate(Sender: TObject);
begin
  Tabela := 'tbUsuarios';
  Sql := 'SELECT * FROM USUARIOS';
  SetLength (cLista, 2);
  SetLength (nLista, 2);
  SetLength (cIndice, 1);

  cIndice := 'USUARIO_SQ';

  cLista[0] := 'CODIGO_USUARIO';
  cLista[1] := 'NOME_USUARIO';

  nLista[0] := 'Código';
  nLista[1] := 'Nome';
  inherited;
end;

procedure TFCadastrarListaUsuarios.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormUsuarios, FCadastrarFormUsuarios);
  if not novo then
  begin
    FCadastrarFormUsuarios.edCodigo.Text     := cdsLista.FieldByName('CODIGO_USUARIO').Text;
    FCadastrarFormUsuarios.edNome.Text       := cdsLista.FieldByName('NOME_USUARIO').Text;
    FCadastrarFormUsuarios.edSenha.Text      := cdsLista.FieldByName('SENHA_USUARIO').Text;
    FCadastrarFormUsuarios.edDeEmail.Text    := cdsLista.FieldByName('ERRO_EMAIL_FROM').Text;
    FCadastrarFormUsuarios.edDeNome.Text     := cdsLista.FieldByName('ERRO_NOME_FROM').Text;
    FCadastrarFormUsuarios.edToEmail.Text    := cdsLista.FieldByName('ERRO_EMAIL_TO').Text;
    FCadastrarFormUsuarios.edToNome.Text     := cdsLista.FieldByName('ERRO_NOME_TO').Text;
    FCadastrarFormUsuarios.edSmtpHost.Text   := cdsLista.FieldByName('ERRO_SMTP').Text;
    FCadastrarFormUsuarios.edSmtpUser.Text   := cdsLista.FieldByName('ERRO_USERNAME').Text;
    FCadastrarFormUsuarios.edSmtpPwd.Text    := cdsLista.FieldByName('ERRO_PASSWORd').Text;
  end;
  if FCadastrarFormUsuarios.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('USUARIOS', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormUsuarios.edCodigo.Text,
        FCadastrarFormUsuarios.edNome.Text,
        FCadastrarFormUsuarios.edSenha.Text,
        FCadastrarFormUsuarios.edDeEmail.Text,
        FCadastrarFormUsuarios.edDeNome.Text,
        FCadastrarFormUsuarios.edToEmail.Text,
        FCadastrarFormUsuarios.edToNome.Text,
        FCadastrarFormUsuarios.edSmtpHost.Text,
        FCadastrarFormUsuarios.edSmtpUser.Text,
        FCadastrarFormUsuarios.edSmtpPwd.Text]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
