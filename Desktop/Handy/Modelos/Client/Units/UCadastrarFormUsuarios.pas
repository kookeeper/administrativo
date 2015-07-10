unit UCadastrarFormUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask;

type
  TFCadastrarFormUsuarios = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    edSenha: TEdit;
    edDeEmail: TEdit;
    edDeNome: TEdit;
    edToEmail: TEdit;
    edToNome: TEdit;
    edSmtpHost: TEdit;
    edSmtpUser: TEdit;
    edSmtpPwd: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormUsuarios: TFCadastrarFormUsuarios;

implementation

uses UDM;

{$R *.DFM}

procedure TFCadastrarFormUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
