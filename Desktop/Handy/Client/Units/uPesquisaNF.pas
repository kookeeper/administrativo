unit uPesquisaNF;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RzEdit;

type
  TFPesquisaNF = class(TForm)
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    edNf: TRzNumericEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPesquisaNF: TFPesquisaNF;

implementation

{$R *.dfm}

end.
