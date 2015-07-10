unit uPwd;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Messages, Registry, Dialogs, Mask, RzEdit;

type
  TPasswordDlg = class(TForm)
    Label1: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    Button1: TButton;
    edPassword: TRzEdit;
    edUsuario: TRzEdit;
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PasswordDlg: TPasswordDlg;

implementation

uses UDM, USplash, uSetup, UTrocaSenha, Variants, DBClient, Usuario,
  Cadastro;

{$R *.DFM}

procedure TPasswordDlg.SpeedButton1Click(Sender: TObject);
var
  reg: TRegistry;
begin
  Application.CreateForm(TFSetup, FSetup);
  FSetup.edIP.Text := DM.host;
  if FSetup.ShowModal = mrOk then
  begin
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\MSystem', True);
    Reg.WriteString ('HostIP',    FSetup.edIP.Text);
    Reg.CloseKey;
    Reg.Free;
    DM.host := FSetup.edIP.Text;
  end;
  FSetup.Free;

  DM.SCServer.Connected := False;
  DM.SCServer.Host      := DM.host;
  DM.SCServer.Connected := True;
end;

procedure TPasswordDlg.Button1Click(Sender: TObject);
var
  cdsUsuarios: TClientDataSet;
  usuario: TUsuario;
begin
  cdsUsuarios := TUsuario.listaRegistros('where codigo_usuario = ' + QuotedStr(edUsuario.Text) +
    ' and senha_usuario = ' + QuotedStr(edPassword.Text));

  if (cdsUsuarios.RecordCount = 0) then
    showmessage('Usuário / Senha inválido!') else
  try
    fTrocaSenha := TfTrocaSenha.Create(Self);
    if fTrocaSenha.ShowModal = mrOk then
    begin
      usuario := TUsuario.Create(cdsUsuarios.FieldByName('usuario_sq').AsInteger);
      usuario.senha_usuario := fTrocaSenha.Password1.Text;
      usuario.salvar;
    end;
    cdsUsuarios.Close;
  finally
    FreeAndNil(fTrocaSenha);
  end;
end;

procedure TPasswordDlg.FormActivate(Sender: TObject);
begin
  DeleteFile('Update.exe');
end;

end.

