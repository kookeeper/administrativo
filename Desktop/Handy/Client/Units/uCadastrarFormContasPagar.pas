unit uCadastrarFormContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, DBClient,
  RzEdit, Grids, DBGrids, RzDBGrid, ToolWin, ComCtrls, RzPanel, Mask,
  DBCtrls;

type
  TFCadastrarFormContasPagar = class(TFCadastrarFormComum)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edValor: TRzNumericEdit;
    Label1: TLabel;
    mmObservacao: TRzMemo;
    edDtEmissao: TRzDateTimeEdit;
    edDtVencto: TRzDateTimeEdit;
    dblFornecedor: TDBLookupComboBox;
    lblCliente: TLabel;
    dsListaFornecedor: TDataSource;
    Label2: TLabel;
    edDtPagamento: TRzDateTimeEdit;
    Label3: TLabel;
    edDesconto: TRzNumericEdit;
    Label8: TLabel;
    edJuros: TRzNumericEdit;
    Label9: TLabel;
    edValorPago: TRzNumericEdit;
    Label10: TLabel;
    edForma: TRzEdit;
    Label11: TLabel;
    dblContaBanco: TDBLookupComboBox;
    dsListaContaBanco: TDataSource;
    edNumero: TRzEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormContasPagar: TFCadastrarFormContasPagar;

implementation

uses UDM, uCadastrarListaContasPagar, uEditarMemo, Fornecedor,
  UCadastrarListaComum, ContaPagar, ContaBanco;

{$R *.dfm}

procedure TFCadastrarFormContasPagar.bbOkClick(Sender: TObject);
begin
  inherited;
  if edValorPago.Value > (edValor.Value + edJuros.Value - edDesconto.Value) then
    raise Exception.Create('O valor pago está maior que o valor devido.');

  with (Owner as TFCadastrarListaComum).registro as TContaPagar do
  begin
    fornecedor_sq := TFornecedor.Create(dblFornecedor.KeyValue);
    numero_duplicata := edNumero.Text;
    valor_duplicata := edValor.Value;
    dtcadastro_duplicata := edDtEmissao.Date;
    dtvencimento_duplicata := edDtVencto.Date;
    dt_pgto := edDtPagamento.Date;
    valor_desconto := edDesconto.Value;
    valor_juros := edJuros.Value;
    valor_pgto := edValorPago.Value;
    forma_pgto := edForma.Text;
    conta_banco_sq := dblContaBanco.KeyValue;
    observacao := mmObservacao.Lines.Text;
    salvar;
  end;
end;

procedure TFCadastrarFormContasPagar.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaFornecedor.DataSet := TFornecedor.listaRegistros(' order by nome_fornecedor');
  dsListaContaBanco.DataSet := TContaBanco.listaContaBancoPagar;

  with Owner as TFCadastrarListaComum do
  if not novo then
  with registro as TContaPagar do
  begin
    dblFornecedor.KeyValue  := fornecedor_sq.vIndice;
    edNumero.Text           := numero_duplicata;
    edValor.Value           := valor_duplicata;
    edDtEmissao.Date        := dtcadastro_duplicata;
    edDtVencto.Date         := dtvencimento_duplicata;
    edDtPagamento.Date      := dt_pgto;
    edDesconto.Value        := valor_desconto;
    edJuros.Value           := valor_juros;
    edValorPago.Value       := valor_pgto;
    edForma.Text            := forma_pgto;
    mmObservacao.Lines.Text := observacao;
    dblContaBanco.KeyValue  := conta_banco_sq;

    if edValorPago.Value = 0 then
    begin
      edValorPago.Value := edValor.Value + edJuros.Value - edDesconto.Value;
      edDtPagamento.Date := Date;
    end;
  end;
end;

end.
