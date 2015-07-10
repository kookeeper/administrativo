unit UImprimirAssistenciasRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TFImprimirAssistenciasRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand1: TQRBand;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel26: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText18: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel20: TQRLabel;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRDBText15: TQRDBText;
    ChildBand3: TQRChildBand;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    qrlFone1: TQRLabel;
    qrlCelular: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel31: TQRLabel;
    ChildBand4: TQRChildBand;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    qrlFone2: TQRLabel;
    qrlFax: TQRLabel;
    ChildBand5: TQRChildBand;
    QRLabel29: TQRLabel;
    qrlFone3: TQRLabel;
    ChildBand6: TQRChildBand;
    QRLabel18: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel39: TQRLabel;
    qrdbV1: TQRDBText;
    qrdbV10: TQRDBText;
    qrdbV9: TQRDBText;
    qrdbV8: TQRDBText;
    qrdbV7: TQRDBText;
    qrdbV6: TQRDBText;
    qrdbV5: TQRDBText;
    qrdbV4: TQRDBText;
    qrdbV3: TQRDBText;
    qrdbV2: TQRDBText;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRSubDetail3: TQRSubDetail;
    QRDBText8: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRBand3: TQRBand;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape8: TQRShape;
    QRLabel25: TQRLabel;
    QRDBText24: TQRDBText;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape15: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText16: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel44: TQRLabel;
    QRDBText13: TQRDBText;
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure ChildBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel12Print(sender: TObject; var Value: String);
    procedure qrlFone2Print(sender: TObject; var Value: String);
    procedure QRLabel15Print(sender: TObject; var Value: String);
    procedure qrlFaxPrint(sender: TObject; var Value: String);
    procedure QRLabel29Print(sender: TObject; var Value: String);
    procedure qrlFone3Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure ChildBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  FImprimirAssistenciasRpt: TFImprimirAssistenciasRpt;

implementation

uses UDMImpr;

{$R *.DFM}

procedure TFImprimirAssistenciasRpt.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlFone1.Caption := '(' + DMImpr.cdsImprPedDDD_FONE1.AsString +
                     ') ' + DMImpr.cdsImprPedNUMERO_FONE1.AsString +
                    ' - ' + DMImpr.cdsImprPedCOMPL_FONE1.AsString;
  qrlCelular.Caption := '(' + DMImpr.cdsImprPedDDD_CELULAR.AsString +
                       ') ' + DMImpr.cdsImprPedNUMERO_CELULAR.AsString +
                      ' - ' + DMImpr.cdsImprPedCOMPL_CELULAR.AsString;
  qrdbV10.Enabled   := DMImpr.cdsImprPedPARCELAS.Value >= 10;
  qrdbV9.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 9;
  qrdbV8.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 8;
  qrdbV7.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 7;
  qrdbV6.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 6;
  qrdbV5.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 5;
  qrdbV4.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 4;
  qrdbV3.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 3;
  qrdbV2.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 2;
  qrdbV1.Enabled    := DMImpr.cdsImprPedPARCELAS.Value >= 1;
  qrLabel39.Enabled := DMImpr.cdsImprPedPARCELAS.Value > 0;
end;

procedure TFImprimirAssistenciasRpt.ChildBand4BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := (DMImpr.cdsImprAssistNUMERO_FONE2.AsString <> '') or (DMImpr.cdsImprAssistNUMERO_FAX.AsString <> '');
end;

procedure TFImprimirAssistenciasRpt.ChildBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  PrintBand := DMImpr.cdsImprAssistNUMERO_FONE3.AsString <> '';
end;

procedure TFImprimirAssistenciasRpt.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprAssistNUMERO_FONE2.AsString = '' then
    Value := '';
end;

procedure TFImprimirAssistenciasRpt.qrlFone2Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprAssistNUMERO_FONE2.AsString = '' then
    Value := '' else
  Value := '(' + DMImpr.cdsImprAssistDDD_FONE2.AsString + ') ' +
                 DMImpr.cdsImprAssistNUMERO_FONE2.AsString + ' - ' +
                 DMImpr.cdsImprAssistCOMPL_FONE2.AsString;
end;

procedure TFImprimirAssistenciasRpt.QRLabel15Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprAssistNUMERO_FAX.AsString = '' then
    Value := '';
end;

procedure TFImprimirAssistenciasRpt.qrlFaxPrint(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprAssistNUMERO_FAX.AsString = '' then
    Value := '' else
  Value := '(' + DMImpr.cdsImprAssistDDD_FAX.AsString + ') ' +
                 DMImpr.cdsImprAssistNUMERO_FAX.AsString + ' - ' +
                 DMImpr.cdsImprAssistCOMPL_FAX.AsString;
end;

procedure TFImprimirAssistenciasRpt.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprAssistNUMERO_FONE3.AsString = '' then
    Value := '';
end;

procedure TFImprimirAssistenciasRpt.qrlFone3Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprAssistNUMERO_FONE3.AsString = '' then
    Value := '' else
  Value := '(' + DMImpr.cdsImprAssistDDD_FONE3.AsString + ') ' +
                 DMImpr.cdsImprAssistNUMERO_FONE3.AsString + ' - ' +
                 DMImpr.cdsImprAssistCOMPL_FONE3.AsString;
end;

procedure TFImprimirAssistenciasRpt.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  Insert ('-', Value, 6);
end;

procedure TFImprimirAssistenciasRpt.ChildBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrdbV1.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD00.Value);
  qrdbV2.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD01.Value);
  qrdbV3.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD02.Value);
  qrdbV4.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD03.Value);
  qrdbV5.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD04.Value);
  qrdbV6.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD05.Value);
  qrdbV7.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD06.Value);
  qrdbV8.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD07.Value);
  qrdbV9.Caption  := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD08.Value);
  qrdbV10.Caption := DatetoStr (DMImpr.cdsImprAssistDATA_ASSISTENCIA.Value + DMImpr.cdsImprAssistD09.Value);

  if DMImpr.cdsImprAssistPARCELAS.Value < 1 then qrdbV1.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 2 then qrdbV2.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 3 then qrdbV3.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 4 then qrdbV4.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 5 then qrdbV5.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 6 then qrdbV6.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 7 then qrdbV7.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 8 then qrdbV8.Caption := '';
  if DMImpr.cdsImprAssistPARCELAS.Value < 9 then qrdbV9.Caption := '';
end;

procedure TFImprimirAssistenciasRpt.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel28.Caption := FloattoStrf (DMImpr.cdsImprAssistItemQTDE_ASSISTENCIA_ITEM.Value *
                                    DMImpr.cdsImprAssistItemPRECO_UNIT.Value,
                                    ffFixed, 10, 2);
  QRLabel32.Caption := FloattoStrf (DMImpr.cdsImprAssistItemQTDE_ASSISTENCIA_ITEM.Value *
                                    DMImpr.cdsImprAssistItemPRECO_UNIT.Value *
                                    DMImpr.cdsImprAssistCOTACAO_DOLAR.Value,
                                    ffFixed, 10, 2);
end;

procedure TFImprimirAssistenciasRpt.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  QRLabel41.Caption := FormatDateTime ('hh:nn', DMImpr.cdsImprAssistHORA_FIM.Value - DMImpr.cdsImprAssistHORA_INICIO.Value);
end;

end.
