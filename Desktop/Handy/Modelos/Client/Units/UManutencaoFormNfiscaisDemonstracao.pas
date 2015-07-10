unit UManutencaoFormNfiscaisDemonstracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls;

type
  TFManutencaoFormNFiscaisDemonstracao = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    edNrPedido: TEdit;
    edNrNfiscal: TEdit;
    edDtEmissao: TEdit;
    edDtSaida: TEdit;
    edDemonstracao: TEdit;
    edDolar: TEdit;
    Label3: TLabel;
    Label6: TLabel;
    edNrNFiscalRet: TEdit;
    edDtNfiscalRet: TEdit;
    edDtPedido: TEdit;
    Label7: TLabel;
    edCliente: TEdit;
    Label5: TLabel;
    Label8: TLabel;
    edDtLimite: TEdit;
    edDtVencto: TEdit;
    Label11: TLabel;
    mmObservacao: TMemo;
    cbRetNFiscal: TCheckBox;
    cbRetProduto: TCheckBox;
    procedure Label12Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure edNrNFiscalRetChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FManutencaoFormNFiscaisDemonstracao: TFManutencaoFormNFiscaisDemonstracao;

implementation

uses UCadastrarListaNfiscais, UMainMenu, UCadastrarListaPedidos;

{$R *.dfm}

procedure TFManutencaoFormNFiscaisDemonstracao.Label12Click(
  Sender: TObject);
begin
  inherited;
  FCadastrarListaNFiscais.cbFiltro.Text := 'Número';
  FCadastrarListaNfiscais.edFiltro.Text := edNrNfiscal.Text;
  FCadastrarListaNFiscais.sbFiltro.Click;
  FCadastrarListaNFiscais.sbEditar.Click;
end;

procedure TFManutencaoFormNFiscaisDemonstracao.Label1Click(
  Sender: TObject);
begin
  inherited;
  FCadastrarListaPedidos.cbFiltro.Text := 'Número';
  FCadastrarListaPedidos.edFiltro.Text := edNrPedido.Text;
  FCadastrarListaPedidos.sbFiltro.Click;
  FCadastrarListaPedidos.sbEditar.Click;
end;

procedure TFManutencaoFormNFiscaisDemonstracao.edNrNFiscalRetChange(
  Sender: TObject);
begin
  inherited;
  if edNrNFiscalRet.Text = '' then
    cbRetNFiscal.Checked := False
  else if edNrNFiscalRet.Text = '0' then
    cbRetNFiscal.Checked := False
  else cbRetNFiscal.Checked := True;
end;

end.
