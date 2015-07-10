unit uEditarMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RzEdit;

type
  TfrmEditarMemo = class(TForm)
    mmObservacao: TRzMemo;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  function EditarMemo(texto: String): String;

var
  frmEditarMemo: TfrmEditarMemo;

implementation

{$R *.dfm}

function EditarMemo(texto: String): String;
begin
  frmEditarMemo := TfrmEditarMemo.Create(nil);
  frmEditarMemo.mmObservacao.Lines.Text := texto;
  if frmEditarMemo.ShowModal = mrOk then
    result := frmEditarMemo.mmObservacao.Lines.Text
  else
    result := texto;
end;

end.
