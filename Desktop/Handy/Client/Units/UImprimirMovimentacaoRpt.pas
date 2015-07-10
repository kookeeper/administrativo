unit UImprimirMovimentacaoRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TQRImprimirMovimentacao = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRBand2: TQRBand;
    QRLabel43: TQRLabel;
    qrlProduto: TQRLabel;
    qrlUsuario: TQRLabel;
    qrlEstoque: TQRLabel;
    qrlNfiscal: TQRLabel;
    qrlData: TQRLabel;
    qrlValor: TQRLabel;
    qrlQtde: TQRLabel;
    qrlTipo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QRImprimirMovimentacao: TQRImprimirMovimentacao;

implementation

uses Kardex;

{$R *.DFM}

procedure TQRImprimirMovimentacao.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlProduto.Caption := QRSubDetail1.DataSet.FieldByName('descricao_produto').AsString;
  qrlUsuario.Caption := QRSubDetail1.DataSet.FieldByName('nome_usuario').AsString;
  qrlEstoque.Caption := QRSubDetail1.DataSet.FieldByName('descricao_estoque').AsString;
  qrlNfiscal.Caption := QRSubDetail1.DataSet.FieldByName('nfiscal').AsString;
  qrlData.Caption    := FormatDateTime('dd/mm/yy hh:nn', QRSubDetail1.DataSet.FieldByName('data').Value);
  qrlValor.Caption   := FloatToStrF(QRSubDetail1.DataSet.FieldByName('valor').Value, ffFixed, 10, 2);
  qrlQtde.Caption    := QRSubDetail1.DataSet.FieldByName('qtde').AsString;
  qrlTipo.Caption    := QRSubDetail1.DataSet.FieldByName('tipo_mov').AsString;
end;

end.
