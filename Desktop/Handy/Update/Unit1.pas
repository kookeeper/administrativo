unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient,
  IdTrivialFTP, DB, DBClient, MConnect, SConnect, ExtCtrls;

type
  TForm2 = class(TForm)
    IdTrivialFTP1: TIdTrivialFTP;
    SCServer: TSocketConnection;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Registry;

{$R *.dfm}

procedure TForm2.Timer1Timer(Sender: TObject);
var
  host: String;
  reg: TRegistry;
begin
  Timer1.Enabled := False;
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
      host := Reg.ReadString ('HostIP');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  SCServer.Host := host;
  SCServer.Connected := True;
  IdTrivialFTP1.Host := host;
  IdTrivialFTP1.Active := True;
  IdTrivialFTP1.Get('PrHandy.exe', 'PrHandy.exe');
  IdTrivialFTP1.Active := False;
  SCServer.Connected := False;
  Close;
  WinExec ('prHandy', 0);
end;

end.
