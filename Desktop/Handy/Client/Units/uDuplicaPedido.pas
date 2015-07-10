unit uDuplicaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RzEdit;

type
  TFDuplicaPedido = class(TForm)
    Label1: TLabel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    edPedido: TRzEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDuplicaPedido: TFDuplicaPedido;

implementation

{$R *.dfm}

end.
