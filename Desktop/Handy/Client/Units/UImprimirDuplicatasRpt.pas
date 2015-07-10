unit UImprimirDuplicatasRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, Nfiscal, DBClient;

type
  TFImprimirDuplicatasRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText18: TQRDBText;
    qrlExtenso: TQRLabel;
    qrInscricaoEstadual: TQRLabel;
    qrEstado: TQRLabel;
    qrCep: TQRLabel;
    qrCodigoCliente: TQRLabel;
    qrCidade: TQRLabel;
    qrEndereco: TQRLabel;
    qrNomeCliente: TQRLabel;
    qrNumeroNfe: TQRLabel;
    qrNomeTransportadora: TQRLabel;
    qrDescricaoNatureza: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrCodigoClientePrint(sender: TObject; var Value: String);
    procedure qrCepPrint(sender: TObject; var Value: String);
  private

  public
    nfiscal: TNfiscal;
    cdsDuplicatas: TClientDataSet;
  end;

var
  FImprimirDuplicatasRpt: TFImprimirDuplicatasRpt;

implementation

uses UDM, Extensos, Natureza, Variants;

{$R *.DFM}

procedure TFImprimirDuplicatasRpt.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrCep.Caption := nfiscal.cliente_sq.cep;

  qrEstado.Caption := nfiscal.cliente_sq.estado;
  qrInscricaoEstadual.Caption := nfiscal.cliente_sq.inscr_estadual;

  qrNomeCliente.Caption := nfiscal.cliente_sq.nome_cliente;
  qrCodigoCliente.Caption := nfiscal.cliente_sq.codigo_cliente;

  qrCidade.Caption := nfiscal.cliente_sq.cidade;

  qrEndereco.Caption := nfiscal.cliente_sq.endereco;
  if nfiscal.cliente_sq.numero <> '' then
    qrEndereco.Caption := qrEndereco.Caption + ', ' + nfiscal.cliente_sq.numero;
  if nfiscal.cliente_sq.compl_endereco <> '' then
    qrEndereco.Caption := qrEndereco.Caption + ', ' + nfiscal.cliente_sq.compl_endereco;

  qrNomeTransportadora.Caption := nfiscal.transportadora_sq.NOME_TRANSPORTADORA;
  if (nfiscal.natureza_sq.descricao_natureza_nfiscal = '') then
    qrDescricaoNatureza.Caption := nfiscal.natureza_sq.descricao_natureza
  else
    qrDescricaoNatureza.Caption := nfiscal.natureza_sq.descricao_natureza_nfiscal;

  qrNumeroNfe.Caption := VarToStr(nfiscal.numero_nfe);

  qrlExtenso.Caption := '(' + Extenso(cdsDuplicatas.FieldByName('VALOR_DUPLICATA').AsFloat) + ')';
end;

procedure TFImprimirDuplicatasRpt.qrCodigoClientePrint(sender: TObject;
  var Value: String);
begin
  if DM.TestaCNPJ(Value) then
  begin
    Insert ('-', Value, 13);
    Insert ('/', Value, 9);
    Insert ('.', Value, 6);
    Insert ('.', Value, 3);
  end
  else if DM.TestaCPF(Value) then
  begin
    Insert ('-', Value, 10);
    Insert ('.', Value, 7);
    Insert ('.', Value, 4);
  end;
end;

procedure TFImprimirDuplicatasRpt.qrCepPrint(sender: TObject;
  var Value: String);
begin
  if Length (Value) = 8 then
    Insert ('-', Value, 6);
end;

end.
