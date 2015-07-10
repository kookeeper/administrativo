unit SimpleExampleForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, DelphiTwain;

type
  TForm1 = class(TForm)
    Title: TPanel;
    ImageHolder: TImage;
    GoAcquire: TButton;
    Twain: TDelphiTwain;
    procedure GoAcquireClick(Sender: TObject);
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{Acquire into image}
procedure TForm1.GoAcquireClick(Sender: TObject);
var
  SelectedSource: Integer;
begin
  {It is always recommended to load library dynamically, never forcing}
  {final user to have twain installed}
  if Twain.LoadLibrary then
  begin

    {Load source manager}
    Twain.SourceManagerLoaded := TRUE;
    {Allow user to select source}
    SelectedSource := Twain.SelectSource;
    if SelectedSource <> -1 then
    begin
      {Load source, select transference method and enable (display interface)}
      Twain.Source[SelectedSource].Loaded := TRUE;
      Twain.Source[SelectedSource].TransferMode := ttmMemory;
      Twain.Source[SelectedSource].Enabled := TRUE;
    end {if SelectedSource <> -1}

  end
  else
    showmessage('Twain is not installed.');
end;

{Image acquired}
procedure TForm1.TwainTwainAcquire(Sender: TObject; const Index: Integer;
  Image: TBitmap; var Cancel: Boolean);
begin
  ImageHolder.Picture.Assign(Image);
  Cancel := TRUE;  {Only want one image}
end;

end.
