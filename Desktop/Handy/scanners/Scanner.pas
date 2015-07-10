unit Scanner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TFScanner = class(TForm)
    Image2: TImage;
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FScanner: TFScanner;

implementation

uses Principal;

{$R *.dfm}

procedure TFScanner.Image2Click(Sender: TObject);
begin
  Scanear;
  Close;
end;

end.
