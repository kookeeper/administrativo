unit UDMImpr;

interface

uses
  SysUtils, Classes, DB, DBClient, MConnect, SConnect;

type
  TDMImpr = class(TDataModule)
    SCServerImpr: TSocketConnection;
  private
    { Private declarations }
  public
  end;

var
  DMImpr: TDMImpr;

implementation

uses UImprimirClientesHist, USugestaoCompras, Math;

{$R *.dfm}

end.
