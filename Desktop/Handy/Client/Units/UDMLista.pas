unit UDMLista;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect;

type
  TDMLista = class(TDataModule)
    SCServerLista: TSocketConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMLista: TDMLista;

implementation

uses UDM;

{$R *.dfm}

end.
