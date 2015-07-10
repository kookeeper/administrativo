unit UDMServerImpr;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, PrServer_TLB, StdVcl, Provider, DB, IBDatabase,
  IBCustomDataSet, IBQuery, Registry, Dialogs, DBTables;

type
  TServerImpr = class(TRemoteDataModule, IServerImpr)
    Session1: TSession;
    DBConn: TDatabase;
    procedure RemoteDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

uses uSetup;

{$R *.DFM}

class procedure TServerImpr.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TServerImpr.RemoteDataModuleCreate(Sender: TObject);
var
  Reg: TRegistry;
  banco: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    begin
      banco    := Reg.ReadString ('FBBanco');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  try
    DBConn.Connected    := True;
  except
    Exception.Create('Nao foi possível conectar-se ao banco de dados!');
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TServerImpr,
    Class_ServerImpr, ciMultiInstance, tmApartment);
end.
