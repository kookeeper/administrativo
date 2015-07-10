unit UCadastrarFormAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB,
  ComCtrls;

type
  TFCadastrarFormAgenda = class(TFCadastrarFormComum)
    dsListaVendedores: TDataSource;
    dblVendedores: TDBLookupComboBox;
    Label2: TLabel;
    mmObservacao: TMemo;
    Label3: TLabel;
    dblClientes: TDBLookupComboBox;
    dsListaClientes: TDataSource;
    cbRealizado: TCheckBox;
    dtpHora: TDateTimePicker;
    MonthCalendar1: TMonthCalendar;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    lblPai: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormAgenda: TFCadastrarFormAgenda;

implementation

uses UDM, ShellApi, UCadastrarListaComum, Agenda, UCadastrarListaAgenda,
  StrUtils, Vendedor, Cadastro, Cliente;

{$R *.dfm}

procedure TFCadastrarFormAgenda.BitBtn1Click(Sender: TObject);
begin
  inherited;
  ShellExecute(Handle,'open', PAnsiChar('mailto: ' + dsListaClientes.DataSet.FieldByName('E_MAIL').AsString), nil, nil, SW_SHOWNORMAL);
end;

procedure TFCadastrarFormAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');

  MonthCalendar1.Date    := Date;
  dtpHora.Time           := Time;
  if DM.uvend > 0 then
    dblVendedores.KeyValue := DM.uvend;

  if not FCadastrarListaAgenda.novo then
  With (FCadastrarListaAgenda.registro as TAgenda) do
  begin
    MonthCalendar1.Date    := data_agenda;
    dtpHora.DateTime       := data_agenda;
    dblVendedores.KeyValue := vendedor_sq.vIndice;
    dblClientes.KeyValue   := cliente_sq.vIndice;
    mmObservacao.Text      := observacao;
    cbRealizado.Checked    := realizado='S';
    lblPai.Caption         := 'Quem cadastrou: ' + usuario_pai_sq.nome_usuario;

  end;
end;

procedure TFCadastrarFormAgenda.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet.Close;
  dsListaVendedores.DataSet.Close;
end;

procedure TFCadastrarFormAgenda.bbOkClick(Sender: TObject);
begin
  inherited;
  dtpHora.Date := MonthCalendar1.Date;
  With ((Owner as TFCadastrarListaComum).registro as TAgenda) do
  begin
    data_agenda    := dtpHora.Time;
    vendedor_sq    := TVendedor.Create(dblVendedores.KeyValue);
    cliente_sq     := TCliente.Create(dblClientes.KeyValue);
    observacao     := mmObservacao.Text;
    realizado      := IfThen(cbRealizado.Checked, 'S', 'N');
    salvar;
  end;
end;

end.
