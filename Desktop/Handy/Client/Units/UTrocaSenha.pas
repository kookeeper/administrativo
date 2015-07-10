unit UTrocaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit;

type
  TfTrocaSenha = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    OKBtn: TButton;
    CancelBtn: TButton;
    Password2: TRzEdit;
    Password1: TRzEdit;
    procedure OKBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTrocaSenha: TfTrocaSenha;

implementation

{$R *.dfm}

procedure TfTrocaSenha.OKBtnClick(Sender: TObject);
begin
  if Password1.Text <> Password2.Text then
  begin
    ModalResult := mrNone;
    Showmessage ('Senha não confere!'); 
  end;
end;

end.
