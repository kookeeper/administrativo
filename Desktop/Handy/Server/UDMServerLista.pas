unit UDMServerLista;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, PrServer_TLB, StdVcl, DB, IBDatabase, IBCustomDataSet, IBQuery,
  Provider, IBStoredProc, Registry, Dialogs, DBTables, ScktComp, DBXpress,
  SqlExpr;

type
  TServerLista = class(TRemoteDataModule, IServerLista)
    Session1: TSession;
    DBConn: TDatabase;
    Query1: TQuery;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    procedure CriaLista(const Sql: WideString); safecall;
    function Maximo(const Tabela: WideString; const Campo: WideString): Integer; safecall;
    procedure BuscaProdutos(const Sql: WideString); safecall;
    procedure BuscaClientes(const Sql: WideString); safecall;
  public
    { Public declarations }
  end;

implementation

uses uSetup;

{$R *.DFM}

class procedure TServerLista.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TServerLista.CriaLista(const Sql: WideString);
begin
end;

procedure TServerLista.BuscaProdutos(const Sql: WideString);
begin
end;

procedure TServerLista.BuscaClientes(const Sql: WideString);
begin
end;

function TServerLista.Maximo(const Tabela: WideString; const Campo: WideString): Integer;
begin
  Query1.SQL.Clear;
  Query1.SQL.Add('SELECT MAX(' + Campo + ') as MAXIMO FROM ' + TABELA);
  Query1.Open;
  Result := Query1.FieldByName ('MAXIMO').AsInteger;
end;

initialization
  TComponentFactory.Create(ComServer, TServerLista,
    Class_ServerLista, ciMultiInstance, tmApartment);
end.
