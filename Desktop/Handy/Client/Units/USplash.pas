unit USplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, DBTables, IBTable, StdCtrls, ComCtrls, jpeg, ExtCtrls,
  DB, DBClient;

type
  TFSplash = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cds: TClientDataSet;
  private
    { Private declarations }
  public
    procedure Login;
  end;

var
  FSplash: TFSplash;

implementation

uses UMainMenu, UDM, UCadastrarListaComum,
  UCadastrarFormComum, uSetup, Empresa, Classificacao;

{$R *.dfm}

procedure TFSplash.Login();
var
  reg: TRegistry;
  mm, aa: integer;
begin
  try
    Application.CreateForm(TFMainMenu, FMainMenu);

    StatusBar1.Panels[0].Text := 'Conectando ao Banco de Dados!';
    Application.ProcessMessages;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey('\Software\MSystem', True) then
      begin
        DM.host := Reg.ReadString ('HostIP');
      end;
//      DM.host := 'serpa.ddns.com.br';
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
    While DM.SCServer.Connected = False do
    try
      DM.SCServer.Host := DM.host;
      DM.SCServer.Connected := True;
      DM.ClientSocket1.Host := DM.host;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
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
        end
        else raise Exception.Create('Operação Cancelada.');
        FSetup.Free;
      end;
    end;
    StatusBar1.Panels[0].Text := 'Validando o Sistema!';
    Application.ProcessMessages;

    empresaSelecionada := TEmpresa.Create(1);
    empresaSelecionada.VerificaSenha;

    DM.Login;

    FCadastrarListaComum := TFCadastrarListaComum.Create(Application);
    FCadastrarFormComum := TFCadastrarFormComum.Create(Application);

    aa := StrtoInt (FormatDateTime('yyyy', Date));
    mm := StrtoInt (FormatDateTime('mm', Date));
    if mm = 1 then
    begin
      aa := aa-1;
      mm := 12;
    end else
      dec (mm);
    cds.Close;
    DM.SCServer.AppServer.CriaLista ('SELECT AAMM_CLASSIFICACAO FROM empresas');
    cds.Open;
    if cds.FieldByName('AAMM_CLASSIFICACAO').AsInteger <> (aa*100+mm) then
    begin
      StatusBar1.Panels[0].Text := 'Classificando os Clientes...';
      Application.ProcessMessages;
      TClassificacao.AtualizaClassificacao;

      cds.Close;
      DM.SCServer.AppServer.CriaLista ('UPDATE empresas SET AAMM_CLASSIFICACAO = ' + InttoStr (aa*100+mm));
      cds.Execute;
    end;

  FMainMenu.sbAgenda.Click;
  except
    on E: Exception do
    begin
      Showmessage (E.Message);
      Application.Terminate;
    end;
  end;
end;

end.
