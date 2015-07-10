unit UCadastrarFormClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  ComCtrls;

type
  TFCadastrarFormClientes = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    edEndereco: TEdit;
    edNumero: TEdit;
    edComplemento: TEdit;
    edBairro: TEdit;
    edCep: TEdit;
    edCidade: TEdit;
    edInscricao: TEdit;
    edPais: TEdit;
    cbEstado: TComboBox;
    cbRevenda: TCheckBox;
    cbBiro: TCheckBox;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    edContato: TEdit;
    edDDDFone1: TEdit;
    edFone1: TEdit;
    edComplFone1: TEdit;
    edDDDFone2: TEdit;
    edFone2: TEdit;
    edComplFone2: TEdit;
    edDDDFone3: TEdit;
    edFone3: TEdit;
    edComplFone3: TEdit;
    edDDDCelular: TEdit;
    edCelular: TEdit;
    edComplCelular: TEdit;
    edDDDFax: TEdit;
    edFax: TEdit;
    edComplFax: TEdit;
    edEmail: TEdit;
    edSite: TEdit;
    Label20: TLabel;
    Label21: TLabel;
    edCadastro: TEdit;
    edAlteracao: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    edMenorVenda: TEdit;
    edUltimaVenda: TEdit;
    edPrimeiraVenda: TEdit;
    edMaiorVenda: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    mmObservacao: TMemo;
    Label27: TLabel;
    edTotalVendas: TEdit;
    Label28: TLabel;
    edMediaVendas: TEdit;
    Label29: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    Label30: TLabel;
    edClassificacao: TEdit;
    procedure bbOkClick(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edPaisExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormClientes: TFCadastrarFormClientes;

implementation

uses UDM, UDMLista, UCadastrarListaClientes;

{$R *.DFM}

procedure TFCadastrarFormClientes.bbOkClick(Sender: TObject);
begin
  inherited;
  if (edPais.Text = 'BRASIL') and (cbEstado.Text = '') then
    raise Exception.Create ('Escolha um estado!');
  cbEstado.Text := UpperCase (cbEstado.Text);
  edPais.Text   := UpperCase (edPais.Text);
  if edPais.Text <> 'BRASIL' then
    cbEstado.Text := '';
  if edPais.Text = '' then
  begin
    ModalResult := mrNone;
    raise Exception.Create ('País Inválido!');
  end
  else if (Pos (cbEstado.Text, DM.estados) = 0) and (edPais.Text = 'BRASIL') then
  begin
    ModalResult := mrNone;
    raise Exception.Create ('Estado Inválido!');
  end
  else if DBLookupComboBox1.KeyValue = 0 then
  begin
    ModalResult := mrNone;
    PageControl1.ActivePage := TabSheet1;
    DBLookupComboBox1.SetFocus;
    raise Exception.Create ('Selecionar uma Transportadora Padrão!');
  end
  else if ((Length(edCodigo.Text) = 14) or (Length(edCodigo.Text) = 11)) and
      ((DM.TestaCNPJ(edCodigo.Text)) or (not DM.TestaCPF(edCodigo.Text))) then
  begin
    if MessageDlg('CPF/CNPJ Inválido, Deseja continuar mesmo assim?', mtConfirmation, mbOKCancel, 0) = mrCancel then
      ModalResult := mrNone;
  end;
  if FCadastrarListaClientes.novo then
  begin
    DM.SCServer.Open;
    if DM.SCServer.AppServer.VerificaIndice ('CLIENTES', 'CODIGO_CLIENTE', edCodigo.Text) = 1 then
    begin
      edCodigo.SetFocus;
      ModalResult := mrNone;
      raise Exception.Create ('Cliente já Cadastrado!');
    end;
//    DM.SCServer.Close;
  end;
end;

procedure TFCadastrarFormClientes.edCepExit(Sender: TObject);
begin
  inherited;
  DMLista.cdsCep.Params.ParamByName ('CEP').AsString := edCep.Text;
  DMLista.cdsCep.Open;
  DMLista.cdsCep.Last;
  if DMLista.cdsCep.RecordCount = 1 then
  begin
    edEndereco.Text := UpperCase (DMLista.cdsCepLOGRADOURO.AsString);
    edBairro.Text   := UpperCase (DMLista.cdsCepBAIRRO.AsString);
    edCidade.Text   := UpperCase (DMLista.cdsCepCIDADE.AsString);
    cbEstado.Text   := UpperCase (DMLista.cdsCepUF.AsString);
    edPais.Text     := 'BRASIL';
  end
  else Showmessage ('C.E.P. Não Encontrado!');
  DMLista.cdsCep.Close;
//  DMLista.SCServerLista.Close;
end;

procedure TFCadastrarFormClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFCadastrarFormClientes.edPaisExit(Sender: TObject);
begin
  inherited;
  cbEstado.Enabled := edPais.Text = 'BRASIL';
  if edPais.Text <> 'BRASIL' then
    cbEstado.Text := '';
end;

end.
