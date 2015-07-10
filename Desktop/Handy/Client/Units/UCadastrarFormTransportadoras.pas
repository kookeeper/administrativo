unit UCadastrarFormTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls,
  RzEdit, RzCmboBx;

type
  TFCadastrarFormTransportadoras = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label11: TLabel;
    edCodigo: TRzEdit;
    edNome: TRzEdit;
    edInscricao: TRzEdit;
    edEndereco: TRzEdit;
    edMunicipio: TRzEdit;
    edDDDFone: TRzEdit;
    edFone: TRzEdit;
    edComplFone: TRzEdit;
    cbEstado: TRzComboBox;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormTransportadoras: TFCadastrarFormTransportadoras;

implementation

uses UDM, UCadastrarListaComum, Transportadora;

{$R *.DFM}

procedure TFCadastrarFormTransportadoras.bbOkClick(Sender: TObject);
begin
  inherited;
  cbEstado.Text := UpperCase (cbEstado.Text);
  if not DM.estadoValido(cbEstado.Text) then
  begin
    ModalResult := mrNone;
    ShowMessage('Estado Inválido!');
    cbEstado.SetFocus;
    exit;
  end;

  With ((Owner as TFCadastrarListaComum).registro as TTransportadora) do
  begin
    CODIGO_TRANSPORTADORA    := edCodigo.Text;
    NOME_TRANSPORTADORA      := edNome.Text;
    INSCR_ESTADUAL           := edInscricao.Text;
    ENDERECO_TRANSPORTADORA  := edEndereco.Text;
    MUNICIPIO_TRANSPORTADORA := edMunicipio.Text;
    ESTADO_TRANSPORTADORA    := cbEstado.Text;
    DDD_FONE                 := edDDDFone.Text;
    NUMERO_FONE              := edFone.Text;
    COMPL_FONE               := edComplFone.Text;
    salvar;
  end;
end;

procedure TFCadastrarFormTransportadoras.FormCreate(Sender: TObject);
begin
  inherited;
  if not FListaTransportadoras.novo then
  begin
    edCodigo.Text    := (FListaTransportadoras.registro as TTransportadora).CODIGO_TRANSPORTADORA;
    edNome.Text      := (FListaTransportadoras.registro as TTransportadora).NOME_TRANSPORTADORA;
    edInscricao.Text := (FListaTransportadoras.registro as TTransportadora).INSCR_ESTADUAL;
    edEndereco.Text  := (FListaTransportadoras.registro as TTransportadora).ENDERECO_TRANSPORTADORA;
    edMunicipio.Text := (FListaTransportadoras.registro as TTransportadora).MUNICIPIO_TRANSPORTADORA;
    cbEstado.Text    := (FListaTransportadoras.registro as TTransportadora).ESTADO_TRANSPORTADORA;
    edDDDFone.Text   := (FListaTransportadoras.registro as TTransportadora).DDD_FONE;
    edFone.Text      := (FListaTransportadoras.registro as TTransportadora).NUMERO_FONE;
    edComplFone.Text := (FListaTransportadoras.registro as TTransportadora).COMPL_FONE;
  end;
end;

end.
