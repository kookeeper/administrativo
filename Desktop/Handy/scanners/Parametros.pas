unit Parametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, ExtCtrls, RzPanel, DB, RzDBEdit,
  RzCmboBx, RzDBCmbo, RzButton;

type
  TFParametros = class(TForm)
    RzGroupBox1: TRzGroupBox;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtHost: TRzDBEdit;
    dsParametros: TDataSource;
    edtUsuario: TRzDBEdit;
    edtPorta: TRzDBEdit;
    edtSenha: TRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    Label6: TLabel;
    cmbImpressoras: TRzDBComboBox;
    Label7: TLabel;
    Label8: TLabel;
    edtNome: TRzDBEdit;
    edtEndereco: TRzDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtAssuntoEmail: TRzDBEdit;
    edtCorpoEmail: TRzDBEdit;
    RzPanel1: TRzPanel;
    btnConfirmar: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    RzGroupBox3: TRzGroupBox;
    Label5: TLabel;
    cmbScanners: TRzDBComboBox;
    Label11: TLabel;
    edtSequencia: TRzDBEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FParametros: TFParametros;

implementation

uses printers, Principal;

{$R *.dfm}

procedure TFParametros.btnCancelarClick(Sender: TObject);
begin
  FPrincipal.ibParametros.Cancel;
  Close;
end;

procedure TFParametros.btnConfirmarClick(Sender: TObject);
begin
  if not cmbImpressoras.FindItem(cmbImpressoras.Text) then
  begin
    ShowMessage('A impressora selecionada e invalida!');
    Exit;
  end;

  if not cmbScanners.FindItem(cmbScanners.Text) then
  begin
    ShowMessage('O scanner selecionado e invalido!');
    Exit;
  end;

  if FPrincipal.ibParametros.State in [dsEdit, dsInsert] then
    FPrincipal.ibParametros.Post;
  FPrincipal.IBTransaction1.Commit;
  FPrincipal.ibParametros.Open;
  Close;
end;

procedure TFParametros.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  cmbImpressoras.Items.Clear;
  cmbImpressoras.Items.AddStrings(Printer.Printers);

  cmbScanners.Items.Clear;
  {It is always recommended to load library dynamically, never forcing}
  {final user to have twain installed}
  if FPrincipal.Twain.LoadLibrary then
  begin

    {Load source manager}
    FPrincipal.Twain.SourceManagerLoaded := TRUE;

    for i := 0 to FPrincipal.Twain.SourceCount - 1 do
      cmbScanners.Items.Add(FPrincipal.Twain.Source[i].ProductName);
  end
  else
    showmessage('Twain is not installed.');
end;

end.
