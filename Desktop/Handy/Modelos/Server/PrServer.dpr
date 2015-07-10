program PrServer;

uses
  Forms,
  PrServer_TLB in 'PrServer_TLB.pas',
  UDMServer in 'UDMServer.pas' {Server: TRemoteDataModule},
  UServer in 'UServer.pas' {FServer},
  UDMServerLista in 'UDMServerLista.pas' {ServerLista: TRemoteDataModule},
  UDMServerImpr in 'UDMServerImpr.pas' {ServerImpr: TRemoteDataModule};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Conexão com o Banco de Dados';
  Application.CreateForm(TFServer, FServer);
  Application.Run;
end.
