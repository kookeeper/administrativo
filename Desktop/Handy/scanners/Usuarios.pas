unit Usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzDBEdit, ExtCtrls, Grids, DBGrids,
  RzDBGrid, DB, RzButton;

type
  TFCadastroUsuarios = class(TForm)
    dsUsuarios: TDataSource;
    RzDBGrid1: TRzDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    edtCodigo: TRzDBEdit;
    btnConfirmar: TRzBitBtn;
    btnInserir: TRzBitBtn;
    btnExcluir: TRzBitBtn;
    btnEditar: TRzBitBtn;
    Label1: TLabel;
    edtNome: TRzDBEdit;
    Label2: TLabel;
    btnCancelar: TRzBitBtn;
    Label3: TLabel;
    edtSaldo: TRzDBEdit;
    Label4: TLabel;
    edtEmail: TRzDBEdit;
    procedure RzDBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnInserirClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure FechaPanel2;
  public
    { Public declarations }
  end;

var
  FCadastroUsuarios: TFCadastroUsuarios;

implementation

uses Principal;

{$R *.dfm}

procedure TFCadastroUsuarios.RzDBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then
    Key := 0;
end;

procedure TFCadastroUsuarios.btnConfirmarClick(Sender: TObject);

  function VerificaCampos: Boolean;
  begin
    Result := False;
    if FPrincipal.ibUsuarioscodigoUsuario.AsString = '' then
    begin
      MessageDlg('Código do usuário não informado!', mtError, [mbOk], 0);
      edtCodigo.SetFocus;
      Exit;
    end;
    if FPrincipal.ibUsuariosnomeUsuario.AsString = '' then
    begin
      MessageDlg('Nome do usuário não informado!', mtError, [mbOk], 0);
      edtNome.SetFocus;
      Exit;
    end;
    Result := True;
  end;

begin
  btnConfirmar.SetFocus;
  if VerificaCampos then
  begin
    if FPrincipal.ibUsuarios.State in [dsInsert, dsEdit] then
      FPrincipal.ibUsuarios.Post;
    FPrincipal.IBTransaction1.Commit;
    FPrincipal.ibUsuarios.Open;
    FechaPanel2;
  end;
end;

procedure TFCadastroUsuarios.btnInserirClick(Sender: TObject);
begin
  FPrincipal.ibUsuarios.Append;
  btnEditar.Click;
end;

procedure TFCadastroUsuarios.btnEditarClick(Sender: TObject);
begin
  Height := 403;
  Panel2.Visible := True;
  RzDBGrid1.Enabled := False;
  Panel1.Enabled := False;
  edtCodigo.SetFocus;
end;

procedure TFCadastroUsuarios.btnExcluirClick(Sender: TObject);
begin
  if MessageDlg('Confirma a exclusão deste usuário?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    FPrincipal.ibUsuarios.Delete;
  FPrincipal.IBTransaction1.Commit;
  FPrincipal.ibUsuarios.Open;
end;

procedure TFCadastroUsuarios.FormActivate(Sender: TObject);
begin
  FPrincipal.ibUsuarios.Open;
  FechaPanel2;
end;

procedure TFCadastroUsuarios.FechaPanel2;
begin
  Panel2.Visible := False;
  Height := 192;
  RzDBGrid1.Enabled := True;
  Panel1.Enabled := True;
end;

procedure TFCadastroUsuarios.btnCancelarClick(Sender: TObject);
begin
  FPrincipal.ibUsuarios.Cancel;
  FPrincipal.IBTransaction1.Rollback;
  FechaPanel2;
end;

end.
