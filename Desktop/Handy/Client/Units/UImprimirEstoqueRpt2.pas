unit UImprimirEstoqueRpt2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirEstoqueRpt2 = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRLabel43: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText1: TQRDBText;
    QRGroup1: TQRGroup;
    QRDBText2: TQRDBText;
    QRLabel21: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  FImprimirEstoqueRpt2: TFImprimirEstoqueRpt2;

implementation

uses UDM, UImprimirEstoque;

{$R *.DFM}

procedure TFImprimirEstoqueRpt2.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque1').AsInteger <= 0 then
    QRDBText15.Font.Color := clRed else
    QRDBText15.Font.Color := clWindowText;
  if FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque2').AsInteger <= 0 then
    QRDBText16.Font.Color := clRed else
    QRDBText16.Font.Color := clWindowText;
end;

procedure TFImprimirEstoqueRpt2.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value := InttoStr (FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque1').AsInteger +
                     FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque2').AsInteger);
end;

end.
