unit UImprimirNfiscaisFechRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TFImprimirNFiscaisFechRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRBand1: TQRBand;
    QRBand2: TQRBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    qrlVnd1: TQRLabel;
    qrlTtNf1: TQRLabel;
    qrlEipi1: TQRLabel;
    qrlSicms1: TQRLabel;
    qrlEicms1: TQRLabel;
    qrlSipi1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRBand3: TQRBand;
    QRLabel29: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText30: TQRDBText;
    QRBand5: TQRBand;
    QRLabel48: TQRLabel;
    qrlTtNf2: TQRLabel;
    QRBand6: TQRBand;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlCFOPc2: TQRLabel;
    qrlCFOPv2: TQRLabel;
    qrlCFOPv6: TQRLabel;
    qrlCFOPvt: TQRLabel;
    qrlDevol: TQRLabel;
    qrlServicos: TQRLabel;
    qrlBase: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrlCFOPc6: TQRLabel;
    QRLabel26: TQRLabel;
    qrlBase2: TQRLabel;
    qrlAPis: TQRLabel;
    qrlACof: TQRLabel;
    qrlVPis: TQRLabel;
    qrlVCof: TQRLabel;
    qrlVIcmsPer: TQRLabel;
    qrlVIpiPer: TQRLabel;
    qrlSiss2: TQRLabel;
    qrlVIssPer: TQRLabel;
    QRBand7: TQRBand;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    QRSubDetail3: TQRSubDetail;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRBand8: TQRBand;
    QRLabel27: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel37: TQRLabel;
    QRBand9: TQRBand;
    QRLabel38: TQRLabel;
    qrlTtNf3: TQRLabel;
    qrlEipi3: TQRLabel;
    QRDBText22: TQRDBText;
    qrlDem3: TQRLabel;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRDBText26: TQRDBText;
    qrlEicms3: TQRLabel;
    qrlDev3: TQRLabel;
    QRDBText27: TQRDBText;
    QRLabel44: TQRLabel;
    qrlVIcmsAcum: TQRLabel;
    qrlVIpiAcum: TQRLabel;
    QRShape5: TQRShape;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    qrlVIcms: TQRLabel;
    qrlVIpi: TQRLabel;
    qrlVIss: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    qrlCFOPc3: TQRLabel;
    qrlCFOPv3: TQRLabel;
    qrlCFOPv5: TQRLabel;
    qrlCFOPc5: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qrlCFOPc1: TQRLabel;
    qrlCFOPv1: TQRLabel;
    qrlCFOPv4: TQRLabel;
    qrlCFOPc4: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    qrlEicms2: TQRLabel;
    qrlSicms2: TQRLabel;
    QRLabel12: TQRLabel;
    qrlVIcmsSubAcum: TQRLabel;
    qrlVIcmsSubPer: TQRLabel;
    qrlVIcmsSub: TQRLabel;
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBand6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand9BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure QRDBText22Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
  private

  public
    TtNf1, Vnd1, Dev3, Eicms1, Sicms1, Eicms2,
    Sicms2, Eipi1, Sipi1, cfop1, cfop2, cfop3, cfop4, cfop5, cfop6, TtNf2, Siss2,
    TtNf3, Dem3, Eicms3, Eipi3, Base: Real;
  end;

var
  FImprimirNFiscaisFechRpt: TFImprimirNFiscaisFechRpt;

implementation

uses UDM, UImprimirNfiscaisFech, Empresa, DB;

{$R *.DFM}

procedure TFImprimirNFiscaisFechRpt.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := 'Cancelada';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 4 then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 0 then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 5 then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 1 then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 7 then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString <> 'E' then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString <> 'S' then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString <> 'E' then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  Base   := 0;
  TtNf1  := 0;
  TtNf2  := 0;
  TtNf3  := 0;
  Vnd1   := 0;
  Dem3   := 0;
  Dev3   := 0;
  Eicms1 := 0;
  Sicms1 := 0;
  Eicms2 := 0;
  Sicms2 := 0;
  Eipi1  := 0;
  Sipi1  := 0;
  Siss2  := 0;
  Eicms3 := 0;
  Eipi3  := 0;
  cfop1  := 0;
  cfop2  := 0;
  cfop3  := 0;
  cfop4  := 0;
  cfop5  := 0;
  cfop6  := 0;
end;

procedure TFImprimirNFiscaisFechRpt.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString <> 'S' then
  begin
    TtNf1 := TtNf1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 0 then
      Vnd1 := Vnd1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_PRODUTOS').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'S' then
      Sicms1 := Sicms1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'E' then
      Eicms1 := Eicms1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'S' then
      Sicms2 := Sicms2 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'E' then
      Eicms2 := Eicms2 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'S' then
      Sipi1 := Sipi1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsFloat;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'E' then
      Eipi1 := Eipi1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsFloat;
  end;

  if (FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '5102') or (FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '5109') or (FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '5403') then
  begin
    QRSubDetail1.Font.Color := clBlue;
//    QRDBText2.Font.Color  := clBlue;
//    QRDBText6.Font.Color  := clBlue;
//    QRDBText14.Font.Color := clBlue;
  end else
  if (FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '6102') or (FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '6109') or (FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '6403') then
  begin
    QRSubDetail1.Font.Color := clGreen;
//    QRDBText2.Font.Color  := clGreen;
//    QRDBText6.Font.Color  := clGreen;
//    QRDBText14.Font.Color := clGreen;
  end else
  begin
    QRSubDetail1.Font.Color := clWindowText;
//    QRDBText2.Font.Color := clWindowText;
//    QRDBText6.Font.Color := clWindowText;
//    QRDBText14.Font.Color := clWindowText;
  end;
end;

procedure TFImprimirNFiscaisFechRpt.QRBand2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTtNf1.Caption  := FloatToStrF(TtNf1,  ffFixed, 10, 2);
  qrlVnd1.Caption   := FloatToStrF(Vnd1,   ffFixed, 10, 2);
  qrlEicms1.Caption := FloatToStrF(Eicms1, ffFixed, 10, 2);
  qrlSicms1.Caption := FloatToStrF(Sicms1, ffFixed, 10, 2);
  qrlEicms2.Caption := FloatToStrF(Eicms2, ffFixed, 10, 2);
  qrlSicms2.Caption := FloatToStrF(Sicms2, ffFixed, 10, 2);
  qrlEipi1.Caption  := FloatToStrF(Eipi1,  ffFixed, 10, 2);
  qrlSipi1.Caption  := FloatToStrF(Sipi1,  ffFixed, 10, 2);
end;

procedure TFImprimirNFiscaisFechRpt.QRSubDetail1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString <> 'S' then
  begin
    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '5102' then
      cfop1 := cfop1 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsCurrency;
    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '5109' then
      cfop2 := cfop2 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsCurrency;
    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '5403' then
      cfop3 := cfop3 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsCurrency;

    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '6102' then
      cfop4 := cfop4 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsCurrency;
    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '6109' then
      cfop5 := cfop5 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsCurrency;
    if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CFO').AsString = '6403' then
      cfop6 := cfop6 + FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_IPI').AsCurrency - FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').AsCurrency;
  end;
end;

procedure TFImprimirNFiscaisFechRpt.QRBand6BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  Base := cfop1 + cfop2 + cfop3 + cfop4 + cfop5 + cfop6 - dev3 + TtNf2;

  qrlCFOPc1.Caption   := '5102';
  qrlCFOPc2.Caption   := '5109';
  qrlCFOPc3.Caption   := '5403';
  qrlCFOPc4.Caption   := '6102';
  qrlCFOPc5.Caption   := '6109';
  qrlCFOPc6.Caption   := '6403';

  qrlCFOPv1.Caption   := FloatToStrF(cfop1, ffCurrency, 10, 2);
  qrlCFOPv2.Caption   := FloatToStrF(cfop2, ffCurrency, 10, 2);
  qrlCFOPv3.Caption   := FloatToStrF(cfop3, ffCurrency, 10, 2);
  qrlCFOPv4.Caption   := FloatToStrF(cfop4, ffCurrency, 10, 2);
  qrlCFOPv5.Caption   := FloatToStrF(cfop5, ffCurrency, 10, 2);
  qrlCFOPv6.Caption   := FloatToStrF(cfop6, ffCurrency, 10, 2);
  qrlCFOPvt.Caption   := FloatToStrF(cfop1 + cfop2 + cfop3 + cfop4 + cfop5 + cfop6, ffCurrency, 10, 2);
  qrlDevol.Caption    := FloatToStrF((Dev3)*-1, ffCurrency, 10, 2);
  qrlServicos.Caption := FloatToStrF(TtNf2, ffCurrency, 10, 2);
  qrlBase.Caption     := FloatToStrF(Base, ffCurrency, 10, 2);

  if cfop1 < 0           then qrlCFOPv1.Font.Color   := clRed;
  if cfop2 < 0           then qrlCFOPv2.Font.Color   := clRed;
  if cfop3 < 0           then qrlCFOPv3.Font.Color   := clRed;
  if cfop4 < 0           then qrlCFOPv4.Font.Color   := clRed;
  if cfop5 < 0           then qrlCFOPv5.Font.Color   := clRed;
  if cfop6 < 0           then qrlCFOPv6.Font.Color   := clRed;
  if (cfop1 + cfop2 + cfop3 + cfop4 + cfop5 + cfop6) < 0 then qrlCFOPvt.Font.Color   := clRed;
  if (dev3) < 0     then qrlDevol.Font.Color    := clRed;
  if TtNf2 < 0           then qrlServicos.Font.Color := clRed;
  if Base < 0            then qrlBase.Font.Color     := clRed;

  qrlBase2.Caption       := qrlBase.Caption;
  qrlAPis.Caption        := 'Pis x ' + FloattoStrf (empresaSelecionada.aliq_pis, ffFixed, 2, 2) + '% =';
  qrlACof.Caption        := 'Cofins x ' + FloattoStrf (empresaSelecionada.aliq_cofins, ffFixed, 2, 2) + '% =';
  qrlVPis.Caption        := FloattoStrf (((Base) * empresaSelecionada.aliq_pis / 100), ffCurrency, 10, 2);
  qrlVCof.Caption        := FloattoStrf (((Base) * empresaSelecionada.aliq_cofins / 100), ffCurrency, 10, 2);
  qrlVIcmsAcum.Caption   := FloattoStrf (FImprimirNFiscaisFech.icms[0], ffCurrency, 10, 2);
  qrlVIcmsPer.Caption    := FloattoStrf (Eicms1+Eicms3-Sicms1, ffCurrency, 10, 2);
  qrlVIcms.Caption       := FloattoStrf (FImprimirNFiscaisFech.icms[0]+Eicms1+Eicms3-Sicms1, ffCurrency, 10, 2);
  qrlVIcmsSubAcum.Caption   := FloattoStrf (FImprimirNFiscaisFech.icmssub[0], ffCurrency, 10, 2);
  qrlVIcmsSubPer.Caption    := FloattoStrf (Eicms2-Sicms2, ffCurrency, 10, 2);
  qrlVIcmsSub.Caption       := FloattoStrf (FImprimirNFiscaisFech.icmssub[0]+Eicms2-Sicms2, ffCurrency, 10, 2);
  qrlVIpiAcum.Caption    := FloattoStrf (FImprimirNFiscaisFech.ipi[0], ffCurrency, 10, 2);
  qrlVIpiPer.Caption     := FloattoStrf (Eipi1+Eipi3-Sipi1, ffCurrency, 10, 2);
  qrlVIpi.Caption        := FloattoStrf (FImprimirNFiscaisFech.ipi[0]+Eipi1+Eipi3-Sipi1, ffCurrency, 10, 2);
  qrlVIssPer.Caption     := FloattoStrf (Siss2, ffCurrency, 10, 2);
  qrlVIss.Caption        := FloattoStrf (Siss2, ffCurrency, 10, 2);

  if Base < 0                   then qrlBase2.Font.Color     := clRed;
  if Base < 0                   then qrlVPis.Font.Color      := clRed;
  if Base < 0                   then qrlVCof.Font.Color      := clRed;
  if (Eicms1+Eicms3-Sicms1) < 0 then qrlVIcmsPer.Font.Color  := clRed;
  if (FImprimirNFiscaisFech.icms[0]+Eicms1+Eicms3-Sicms1) < 0 then qrlVIcms.Font.Color     := clRed;
  if (Eicms2-Sicms2) < 0        then qrlVIcmsSubPer.Font.Color  := clRed;
  if (FImprimirNFiscaisFech.icmssub[0]+Eicms2-Sicms2) < 0 then qrlVIcmsSub.Font.Color     := clRed;
  if (Eipi1+Eipi3-Sipi1) < 0    then qrlVIpiPer.Font.Color   := clRed;
  if (FImprimirNFiscaisFech.ipi[0]+Eipi1+Eipi3-Sipi1) < 0     then qrlVIpi.Font.Color      := clRed;
  if Siss2 < 0                  then qrlVIssPer.Font.Color   := clRed;
  if Siss2 < 0                  then qrlVIss.Font.Color      := clRed;
end;

procedure TFImprimirNFiscaisFechRpt.QRBand5BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTtNf2.Caption  := FloatToStrF(TtNf2,  ffFixed, 10, 2);
  qrlSiss2.Caption  := FloatToStrF(Siss2,  ffFixed, 10, 2);
end;

procedure TFImprimirNFiscaisFechRpt.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TtNf2 := TtNf2 + FImprimirNfiscaisFech.dsImprNFServicos.DataSet.FieldByName('TTL_NF_SERVICO').AsFloat;
  Siss2 := Siss2 + FImprimirNfiscaisFech.dsImprNFServicos.DataSet.FieldByName('VLR_ISS_NF_SERVICO').AsFloat;
end;

procedure TFImprimirNFiscaisFechRpt.QRBand9BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlTtNf3.Caption  := FloatToStrF(TtNf3,  ffFixed, 10, 2);
  qrlDem3.Caption   := FloatToStrF(Dem3,   ffFixed, 10, 2);
  qrlDev3.Caption   := FloatToStrF((Dev3*-1), ffFixed, 10, 2);
  qrlEicms3.Caption := FloatToStrF(Eicms3, ffFixed, 10, 2);
  qrlEipi3.Caption  := FloatToStrF(Eipi3,  ffFixed, 10, 2);
end;

procedure TFImprimirNFiscaisFechRpt.QRSubDetail3BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TtNf3  := TtNf3  + FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('VLR_TOTAL').AsFloat;
  if FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 1 then
    Dem3   := Dem3   + FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('VLR_PRODUTOS').AsFloat;
  if FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('TIPO_NFISCAL').AsInteger = 7 then
    Dev3   := Dev3   + FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('VLR_PRODUTOS').AsFloat;
  Eicms3 := Eicms3 + FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('VLR_ICMS').AsFloat;
  Eipi3  := Eipi3  + FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('VLR_IPI').AsFloat;
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 7 then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText22Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNFClientes.DataSet.FieldByName('TIPO_NFISCAL').AsInteger <> 1 then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText6Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

procedure TFImprimirNFiscaisFechRpt.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString <> 'S' then
    Value := '';
  if FImprimirNfiscaisFech.dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString = 'S' then
    Value := '';
end;

end.
