unit uSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFSetup = class(TForm)
    Label1: TLabel;
    edIP: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
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
