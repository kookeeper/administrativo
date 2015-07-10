unit UCadastrarFormNFServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB,
  Mask, RzEdit;

type
  TFCadastrarFormNFServicos = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dsListaClientes: TDataSource;
    dblCliente: TDBLookupComboBox;
    edNumero: TRzEdit;
    edData: TRzEdit;
    edTotal: TRzNumericEdit;
    edAliqISS: TRzNumericEdit;
    edVlrISS: TRzNumericEdit;
    procedure edAliqISSExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormNFServicos: TFCadastrarFormNFServicos;

implementation

uses UDM, Cliente, UCadastrarListaComum, NfServico, Empresa;

{$R *.dfm}

procedure TFCadastrarFormNFServicos.edAliqISSExit(Sender: TObject);
begin
  inherited;
  edVlrISS.Value := edTotal.Value * edAliqISS.Value / 100;
end;

procedure TFCadastrarFormNFServicos.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');

  with Owner as TFCadastrarListaComum do
  if not novo then
  with registro as TNfServico do
  begin
    edNumero.Text  := IntToStr(numero_nf_servico);
    edData.Text    := DateToStr(data_nf_servico);
    edTotal.Value  := ttl_nf_servico;
    edAliqISS.Value:= aliq_iss_nf_servico;
    edVlrISS.Value := vlr_iss_nf_servico;
    dblCliente.KeyValue := cliente_sq.vIndice;
  end else
  begin
     edAliqISS.Value := empresaSelecionada.aliq_iss;
  end;
end;

procedure TFCadastrarFormNFServicos.bbOkClick(Sender: TObject);
begin
  inherited;
  with Owner as TFCadastrarListaComum do
  with registro as TNfServico do
  begin
    numero_nf_servico   := StrToInt(edNumero.Text);
    data_nf_servico     := StrToDate(edData.Text);
    cliente_sq          := TCliente.Create(dblCliente.KeyValue);
    ttl_nf_servico      := edTotal.Value;
    aliq_iss_nf_servico := edAliqISS.Value;
    vlr_iss_nf_servico  := edVlrISS.Value;
    salvar;
  end;
end;

end.
