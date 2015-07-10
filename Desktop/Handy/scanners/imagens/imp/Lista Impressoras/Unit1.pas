Unit Unit1;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
StdCtrls, printers, ShellApi;

type
TForm1 = class(TForm)
Button1: TButton;
ListBox1: TListBox;
procedure Button1Click(Sender: TObject);
private
{ Private declarations }
public
{ Public declarations }
end;

var
Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.Button1Click(Sender: TObject);
begin
//Usa a Unit Printers
ListBox1.Items.Assign(Printer.Printers)
end;


end.
