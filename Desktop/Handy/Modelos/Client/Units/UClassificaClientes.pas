unit UClassificaClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons;

type
  TFClassificaClientes = class(TForm)
    bbClassifica: TBitBtn;
    bbFechar: TBitBtn;
    procedure bbClassificaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FClassificaClientes: TFClassificaClientes;

implementation

uses UDM, UDMLista;

{$R *.dfm}

procedure TFClassificaClientes.bbClassificaClick(Sender: TObject);
var
  mm, aa: integer;
begin
  aa := StrtoInt (FormatDateTime('yyyy', Date));
  mm := StrtoInt (FormatDateTime('mm', Date));
  if mm = 1 then
  begin
    aa := aa-1;
    mm := 12;
  end else
    dec (mm);
  DM.SCServer.Connected := True;
  DM.SCServer.AppServer.Classificacao (0, aa*100+mm);
  Showmessage ('Classificação Concluída!');
end;

end.
