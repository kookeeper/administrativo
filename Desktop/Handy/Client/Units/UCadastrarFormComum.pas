unit UCadastrarFormComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBTables, DB, IBTable, Cadastro;

type
  TFCadastrarFormComum = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  protected
    registro: TCadastro;
  public
    { Public declarations }
  end;

var
  FCadastrarFormComum: TFCadastrarFormComum;

implementation

uses UCadastrarListaComum;

{$R *.DFM}

procedure TFCadastrarFormComum.bbOkClick(Sender: TObject);
begin
  if bbOk.Enabled then bbOk.SetFocus;
end;

procedure TFCadastrarFormComum.FormCreate(Sender: TObject);
begin
  if (Owner is TFCadastrarListaComum) then
    bbOk.Enabled := (Owner as TFCadastrarListaComum).Criar or (Owner as TFCadastrarListaComum).Editar;
end;

procedure TFCadastrarFormComum.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if (Owner is TFCadastrarListaComum) then
    TFCadastrarListaComum(Owner).AtualizaLista;
end;

end.
