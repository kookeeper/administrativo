unit uSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TFSetup = class(TForm)
    Label1: TLabel;
    edBanco: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label2: TLabel;
    edBancoCep: TEdit;
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
