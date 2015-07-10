unit UImprimirEstoqueRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirEstoqueRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText29: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRBand2: TQRBand;
    QRLabel43: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText9: TQRDBText;
    QRLabel37: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRBand3: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel12: TQRLabel;
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRLabel11Print(sender: TObject; var Value: String);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
  private
    SubTotal, Total: Real;
  public

  end;

var
  FImprimirEstoqueRpt: TFImprimirEstoqueRpt;

implementation

uses UDM, UImprimirEstoque;

{$R *.DFM}

procedure TFImprimirEstoqueRpt.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' - ' + FImprimirEstoque.cdsImprEst.FieldByName('DESCRICAO_PRODUTO').AsString;
end;

procedure TFImprimirEstoqueRpt.QRLabel11Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('$ ##,###,##0.00', SubTotal);
  Total := Total + SubTotal;
  SubTotal := 0;
end;

procedure TFImprimirEstoqueRpt.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  SubTotal := SubTotal + (FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque1').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque2').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque3').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque4').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque5').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque6').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque7').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque8').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque9').AsInteger +
                  FImprimirEstoque.cdsImprEst.FieldByName('qtde_estoque10').AsInteger
                  ) * FImprimirEstoque.cdsImprEst.FieldByName('PRECO_UNIT').AsCurrency;
end;

procedure TFImprimirEstoqueRpt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  SubTotal := 0;
  Total := 0;
end;

procedure TFImprimirEstoqueRpt.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  Value := FormatFloat('$ ##,###,##0.00', Total);
end;

end.
