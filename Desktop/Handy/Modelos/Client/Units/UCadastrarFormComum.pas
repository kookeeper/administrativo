unit UCadastrarFormComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBTables, DB, IBTable;

type
  TFCadastrarFormComum = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Function GravaItem   (Query: TIBTable): Boolean;
    Function CancelaItem (Query: TIBTable): Boolean;
    function ApagarItem  (Query: TIBTable): Boolean;
  end;

var
  FCadastrarFormComum: TFCadastrarFormComum;

implementation

{$R *.DFM}

Function TFCadastrarFormComum.GravaItem (Query: TIBTable): Boolean;
begin
Result := False;
try
  if Query.Modified then Query.Post;
  Query.Close;
  Query.Open;
  Result := True;
except
  on E : Exception do
    begin
      MessageDlg('Erro ao Gravar Registro: ' + chr(13) + E.Message, mtInformation, [mbOK], 0);
      Query.Cancel;
    end;
  end;
end;

Function TFCadastrarFormComum.CancelaItem (Query: TIBTable): Boolean;
begin
Result := False;
try
  Query.Cancel;
  Query.Close;
  Query.Open;
  Result := True;
except
  on E : Exception do
    MessageDlg('Erro ao Cancelar Registro: ' + chr(13) + E.Message, mtInformation, [mbOK], 0);
  end;
end;

function TFCadastrarFormComum.ApagarItem (Query: TIBTable): Boolean;
begin
  inherited;
  Result := True;
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    try
      Query.Delete;
    except
      on E : Exception do begin
        Result := False;
        ShowMessage ('Houve um erro ao tentar apagar este registro!' + chr(13) + E.Message);
        end;
      end;
  end;
end;

procedure TFCadastrarFormComum.bbOkClick(Sender: TObject);
begin
  if bbOk.Enabled then bbOk.SetFocus;
end;

procedure TFCadastrarFormComum.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
{
  if Key = #13 then
  begin
    SendMessage(GetParentForm(Self).Handle, WM_NEXTDLGCTL, 0, 0);
    key := #0;
  end;
}
end;

end.
