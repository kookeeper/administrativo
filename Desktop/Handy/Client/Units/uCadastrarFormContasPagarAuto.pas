unit uCadastrarFormContasPagarAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls,
  RzEdit, Mask;

type
  TFCadastrarFormContasPagarAuto = class(TFCadastrarFormComum)
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    edValor: TRzNumericEdit;
    mmObservacao: TRzMemo;
    dblnFornecedor: TDBLookupComboBox;
    lblCliente: TLabel;
    dsListaFornecedor: TDataSource;
    edParcelas: TRzNumericEdit;
    edDtInicial: TRzDateTimeEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormContasPagarAuto: TFCadastrarFormContasPagarAuto;

implementation

uses uCadastrarListaContasPagarAuto, UDM, DateUtils, Fornecedor,
  UCadastrarListaComum, ContaPagar;

{$R *.dfm}

procedure TFCadastrarFormContasPagarAuto.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaFornecedor.DataSet := TFornecedor.listaRegistros('order by nome_fornecedor');

  with Owner as TFCadastrarListaComum do
  if not novo then
  with registro as TContaPagarAuto do
  begin
    dblnFornecedor.KeyValue := fornecedor_sq.vIndice;
    edValor.Value           := valor;
    edParcelas.IntValue     := parcelas;
    edDtInicial.Date        := data_inicial;
    mmObservacao.Lines.Text := observacao;
  end;
end;

procedure TFCadastrarFormContasPagarAuto.bbOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;

  with Owner as TFCadastrarListaComum do
  with registro as TContaPagarAuto do
  begin
    fornecedor_sq := TFornecedor.Create(dblnFornecedor.KeyValue);
    valor         := edValor.Value;
    data_inicial  := edDtInicial.Date;
    parcelas      := edParcelas.IntValue;
    observacao    := mmObservacao.Lines.Text;
    salvar;
  end;
  ModalResult := mrOk;
end;

end.
