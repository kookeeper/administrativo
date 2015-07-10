unit UCadastrarFormVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls;

type
  TFCadastrarFormVendedores = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormVendedores: TFCadastrarFormVendedores;

implementation

{$R *.dfm}

procedure TFCadastrarFormVendedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
