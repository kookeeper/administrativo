unit uCadastrarFormFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, RzEdit, Mask;

type
  TFCadastrarFormFornecedor = class(TFCadastrarFormComum)
    edCnpj: TRzEdit;
    Label1: TLabel;
    edNome: TRzEdit;
    Label2: TLabel;
    edInscrMunicipal: TRzEdit;
    Label3: TLabel;
    edInscrEstadual: TRzEdit;
    Label4: TLabel;
    edLogradouro: TRzEdit;
    Label5: TLabel;
    edNumero: TRzEdit;
    Label6: TLabel;
    edBairro: TRzEdit;
    Label7: TLabel;
    edComplemento: TRzEdit;
    Label8: TLabel;
    edCEP: TRzEdit;
    Label9: TLabel;
    edCidade: TRzEdit;
    Label10: TLabel;
    edEstado: TRzEdit;
    Label11: TLabel;
    edPais: TRzEdit;
    Label12: TLabel;
    edTelefone: TRzEdit;
    Label13: TLabel;
    edCelular: TRzEdit;
    Label14: TLabel;
    edEmail: TRzEdit;
    Label15: TLabel;
    edContato: TRzEdit;
    Label16: TLabel;
    Label17: TLabel;
    mmObservacao: TRzMemo;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormFornecedor: TFCadastrarFormFornecedor;

implementation

uses Fornecedor, UCadastrarListaComum, uCadastrarListaFornecedor;

{$R *.dfm}

procedure TFCadastrarFormFornecedor.bbOkClick(Sender: TObject);
begin
  inherited;
  With ((Owner as TFCadastrarListaComum).registro as TFornecedor) do
  begin
    cnpj_fornecedor := edCnpj.Text;
    nome_fornecedor := edNome.Text;
    inscr_municipal := edInscrMunicipal.Text;
    inscr_estadual  := edInscrEstadual.Text;
    logradouro      := edLogradouro.Text;
    numero          := edNumero.Text;
    bairro          := edBairro.Text;
    complemento     := edComplemento.Text;
    cep             := edCEP.Text;
    cidade          := edCidade.Text;
    estado          := edEstado.Text;
    pais            := edPais.Text;
    telefone        := edTelefone.Text;
    celular         := edCelular.Text;
    e_mail          := edEmail.Text;
    contato         := edContato.Text;
    observacao      := mmObservacao.Text;

    salvar;
  end;
end;

procedure TFCadastrarFormFornecedor.FormCreate(Sender: TObject);
begin
  inherited;
  if not FCadastrarListaFornecedor.novo then
  With (FCadastrarListaFornecedor.registro as TFornecedor) do
  begin
    edCnpj.Text           := cnpj_fornecedor;
    edNome.Text           := nome_fornecedor;
    edInscrMunicipal.Text := inscr_municipal;
    edInscrEstadual.Text  := inscr_estadual;
    edLogradouro.Text     := logradouro;
    edNumero.Text         := numero;
    edBairro.Text         := bairro;
    edComplemento.Text    := complemento;
    edCEP.Text            := cep;
    edCidade.Text         := cidade;
    edEstado.Text         := estado;
    edPais.Text           := pais;
    edTelefone.Text       := telefone;
    edCelular.Text        := celular;
    edEmail.Text          := e_mail;
    edContato.Text        := contato;
    mmObservacao.Text     := observacao;
  end;
end;

end.
