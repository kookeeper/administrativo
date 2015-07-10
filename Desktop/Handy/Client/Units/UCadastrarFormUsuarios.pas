unit UCadastrarFormUsuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask,
  ExtDlgs, RzEdit, DBClient;

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
    cmbVendedor: TDBLookupComboBox;
    dsListaVendedores: TDataSource;
    cbVendedor: TCheckBox;
    edDeEmail: TRzEdit;
    edDeNome: TRzEdit;
    edToEmail: TRzEdit;
    edToNome: TRzEdit;
    edSmtpHost: TRzEdit;
    edSmtpUser: TRzEdit;
    edSmtpPwd: TRzEdit;
    edCodigo: TRzEdit;
    edNome: TRzEdit;
    edSenha: TRzEdit;
    procedure cbVendedorClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    cds: TClientDataSet;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormUsuarios: TFCadastrarFormUsuarios;

implementation

uses UDM, Variants, UCadastrarListaComum, Usuario, Vendedor;

{$R *.DFM}

procedure TFCadastrarFormUsuarios.cbVendedorClick(Sender: TObject);
begin
  inherited;
  cmbVendedor.Enabled := cbVendedor.Checked;
  if cmbVendedor.Enabled then
    cmbVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName('VENDEDOR_SQ').AsInteger
  else
    cmbVendedor.KeyValue := null;
end;

procedure TFCadastrarFormUsuarios.bbOkClick(Sender: TObject);
begin
  inherited;
  With TUsuario(TFCadastrarListaComum(Owner).registro) do
  begin
    codigo_usuario := edCodigo.Text;
    nome_usuario   := edNome.Text;
    senha_usuario  := edSenha.Text;
    if cmbVendedor.Enabled then
      vendedor_sq := TVendedor.Create(cmbVendedor.KeyValue)
    else
      vendedor_sq := nil;
    salvar;
  end;
end;

procedure TFCadastrarFormUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  cds := TVendedor.listaRegistros('order by nome_vendedor');
  dsListaVendedores.DataSet := cds;
  if not FListaUsuarios.novo then
  begin
    edCodigo.Text        := (FListaUsuarios.registro as TUsuario).codigo_usuario;
    edNome.Text          := (FListaUsuarios.registro as TUsuario).nome_usuario;
    edSenha.Text         := (FListaUsuarios.registro as TUsuario).senha_usuario;
    cbVendedor.Checked   := (FListaUsuarios.registro as TUsuario).vendedor_sq.vIndice <> Null;
    if cbVendedor.Checked then
      cmbVendedor.KeyValue := (FListaUsuarios.registro as TUsuario).vendedor_sq.vIndice;
  end;
end;

procedure TFCadastrarFormUsuarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  cds.Close;
end;

end.
