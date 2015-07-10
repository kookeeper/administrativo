unit uCadastrarFormContaBanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFCadastrarFormContaBanco = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    edNome_banco: TRzEdit;
    edNome_agencia: TRzEdit;
    edNumero_conta: TRzEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormContaBanco: TFCadastrarFormContaBanco;

implementation

uses ContaBanco, UCadastrarListaComum, uCadastrarListaContaBanco;

{$R *.dfm}

procedure TFCadastrarFormContaBanco.bbOkClick(Sender: TObject);
begin
  inherited;
  With ((Owner as TFCadastrarListaComum).registro as TContaBanco) do
  begin
    nome_banco   := edNome_banco.Text;
    nome_agencia := edNome_agencia.Text;
    numero_conta := edNumero_conta.Text;
    salvar;
  end;
end;

procedure TFCadastrarFormContaBanco.FormCreate(Sender: TObject);
begin
  inherited;
  if not FCadastrarListaContaBanco.novo then
  With (FCadastrarListaContaBanco.registro as TContaBanco) do
  begin
    edNome_banco.Text   := nome_banco;
    edNome_agencia.Text := nome_agencia;
    edNumero_conta.Text := numero_conta;
  end;
end;

end.
