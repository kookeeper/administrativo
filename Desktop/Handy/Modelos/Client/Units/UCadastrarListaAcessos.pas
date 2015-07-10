unit UCadastrarListaAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids;

type
  TFCadastrarListaAcessos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaAcessos: TFCadastrarListaAcessos;

implementation

uses UCadastrarFormAcessos, UDM, UDMLista, ULiberarAcessos;

{$R *.dfm}

procedure TFCadastrarListaAcessos.FormCreate(Sender: TObject);
begin
  Tabela := 'tbAcessos';
  Sql := 'SELECT A.*, U.NOME_USUARIO ' +
         'FROM ACESSOS A ' +
         'LEFT OUTER JOIN USUARIOS U ON (U.USUARIO_SQ = A.USUARIO_SQ)';
  SetLength (cLista, 3);
  SetLength (nLista, 3);
  SetLength (cIndice, 1);

  cIndice := 'ACESSO_SQ';

  cLista[0]  := 'NOME_PROGRAMA';
  cLista[1]  := 'NOME_USUARIO';
  cLista[2]  := 'VISUALIZAR';

  nLista[0]  := 'Programa';
  nLista[1]  := 'Usuário';
  nLista[2]  := 'Tipo de Acesso';
  inherited;
end;

procedure TFCadastrarListaAcessos.sbEditarClick(Sender: TObject);
var
  i1: integer;
  s1, s2, s3, s4: String;
begin
  inherited;
  Application.CreateForm (TFCadastrarFormAcessos, FCadastrarFormAcessos);
  FCadastrarFormAcessos.lbPrograma.Clear;
  FCadastrarFormAcessos.lbCaptions.Clear;
  FCadastrarFormAcessos.lbCodUsuario.Clear;
  FCadastrarFormAcessos.lbUsuario.Clear;

  for i1 := 1 to 255 do
    if DM.captions[i1] <> '' then
    begin
      FCadastrarFormAcessos.lbPrograma.Items.Add(DM.programas[i1]);
      FCadastrarFormAcessos.lbCaptions.Items.Add(DM.captions[i1]);
      if (not novo) and (DM.programas[i1] = cdsLista.FieldByName('NOME_PROGRAMA').AsString) then
      begin
        FCadastrarFormAcessos.lbPrograma.ItemIndex := FCadastrarFormAcessos.lbPrograma.Count-1;
        FCadastrarFormAcessos.lbCaptions.ItemIndex := FCadastrarFormAcessos.lbCaptions.Count-1;
      end;
    end;

  if not novo then
  begin
    FCadastrarFormAcessos.cbVisualizar.Checked := cdsLista.FieldByName('VISUALIZAR').AsString = 'S';
    FCadastrarFormAcessos.cbCriar.Checked      := cdsLista.FieldByName('CRIAR').AsString      = 'S';
    FCadastrarFormAcessos.cbEditar.Checked     := cdsLista.FieldByName('EDITAR').AsString     = 'S';
    FCadastrarFormAcessos.cbApagar.Checked     := cdsLista.FieldByName('APAGAR').AsString     = 'S';
  end;

  DMLista.cdsListaUsuarios.Open;
  While not DMLista.cdsListaUsuarios.Eof do
  begin
    FCadastrarFormAcessos.lbCodUsuario.Items.Add(DMLista.cdsListaUsuariosUSUARIO_SQ.AsString);
    FCadastrarFormAcessos.lbUsuario.Items.Add(DMLista.cdsListaUsuariosNOME_USUARIO.AsString);
    if (not novo) and (DMLista.cdsListaUsuariosUSUARIO_SQ.AsInteger = cdsLista.FieldByName('USUARIO_SQ').AsInteger) then
    begin
      FCadastrarFormAcessos.lbCodUsuario.ItemIndex := FCadastrarFormAcessos.lbCodUsuario.Count-1;
      FCadastrarFormAcessos.lbUsuario.ItemIndex    := FCadastrarFormAcessos.lbUsuario.Count-1;
    end;
    DMLista.cdsListaUsuarios.Next;
  end;
  DMLista.cdsListaUsuarios.Close;

  if FCadastrarFormAcessos.ShowModal = mrOk then
  try
    s1 := 'N';
    s2 := 'N';
    s3 := 'N';
    s4 := 'N';
    if FCadastrarFormAcessos.cbVisualizar.Checked then s1 := 'S';
    if FCadastrarFormAcessos.cbCriar.Checked      then s2 := 'S';
    if FCadastrarFormAcessos.cbEditar.Checked     then s3 := 'S';
    if FCadastrarFormAcessos.cbApagar.Checked     then s4 := 'S';
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('ACESSOS', Novo, Valores,
      VarArrayOf ([
      FCadastrarFormAcessos.lbPrograma.Items.Strings[FCadastrarFormAcessos.lbCaptions.ItemIndex],
      FCadastrarFormAcessos.lbCodUsuario.Items.Strings[FCadastrarFormAcessos.lbUsuario.ItemIndex],
      s1, s2, s3, s4]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

procedure TFCadastrarListaAcessos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  DMLista.cdsListaUsuarios.Open;
  DMLista.cdsListaAcessos.Open;
//  DMLista.SCServerLista.Close;
  FLiberarAcessos.ShowModal;
  DMLista.cdsListaUsuarios.Close;
  DMLista.cdsListaAcessos.Close;
end;

end.
