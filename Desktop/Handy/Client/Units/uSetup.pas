unit uSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, RzEdit;

type
  TFSetup = class(TForm)
    Label1: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    edIP: TRzEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSetup: TFSetup;

implementation

{$R *.DFM}

end.
