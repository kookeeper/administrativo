unit UImprimirPedidosRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg;

type
  TFImprimirPedidosRpt = class(TQuickRep)
    QRBand3: TQRBand;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRExpr1: TQRExpr;
    QRDBText24: TQRDBText;
    QRLabel32: TQRLabel;
    QRExpr7: TQRExpr;
    QRSubDetail1: TQRSubDetail;
    QRShape12: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRBand1: TQRBand;
    QRShape21: TQRShape;
    QRShape20: TQRShape;
    QRShape19: TQRShape;
    QRShape18: TQRShape;
    QRShape17: TQRShape;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRShape14: TQRShape;
    QRShape13: TQRShape;
    QRShape11: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel6: TQRLabel;
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
    QRLabel23: TQRLabel;
    QRDBText16: TQRDBText;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
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
    QRDBText21: TQRDBText;
    QRLabel19: TQRLabel;
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
    QRLabel41: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel13: TQRLabel;
    ChildBand7: TQRChildBand;
    QRDBText13: TQRDBText;
    qrlNrSerie: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText26: TQRDBText;
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText21Print(sender: TObject; var Value: String);
    procedure QRDBText24Print(sender: TObject; var Value: String);
    procedure QRLabel33Print(sender: TObject; var Value: String);
    procedure QRLabel35Print(sender: TObject; var Value: String);
    procedure qrdbV1Print(sender: TObject; var Value: String);
    procedure qrdbV2Print(sender: TObject; var Value: String);
    procedure qrdbV3Print(sender: TObject; var Value: String);
    procedure qrdbV4Print(sender: TObject; var Value: String);
    procedure qrdbV5Print(sender: TObject; var Value: String);
    procedure qrdbV6Print(sender: TObject; var Value: String);
    procedure qrdbV7Print(sender: TObject; var Value: String);
    procedure qrdbV8Print(sender: TObject; var Value: String);
    procedure qrdbV9Print(sender: TObject; var Value: String);
    procedure qrdbV10Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
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
    procedure QRDBText8Print(sender: TObject; var Value: String);
  private
    NrSerie: String;
  public

  end;

var
  FImprimirPedidosRpt: TFImprimirPedidosRpt;

implementation

uses UDMImpr, UDM;

{$R *.DFM}

procedure TFImprimirPedidosRpt.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlFone1.Caption := '(' + DMImpr.cdsImprPedDDD_FONE1.AsString +
                     ') ' + DMImpr.cdsImprPedNUMERO_FONE1.AsString +
                    ' - ' + DMImpr.cdsImprPedCOMPL_FONE1.AsString;
  qrlCelular.Caption := '(' + DMImpr.cdsImprPedDDD_CELULAR.AsString +
                       ') ' + DMImpr.cdsImprPedNUMERO_CELULAR.AsString +
                      ' - ' + DMImpr.cdsImprPedCOMPL_CELULAR.AsString;
  if DMImpr.cdsImprPedTIPO_NFISCAL.AsInteger = 1 then
  begin
    QRLabel18.Enabled  := False;
    QRDBText20.Enabled := False;
    qrdbV10.Enabled    := False;
    qrdbV9.Enabled     := False;
    qrdbV8.Enabled     := False;
    qrdbV7.Enabled     := False;
    qrdbV6.Enabled     := False;
    qrdbV5.Enabled     := False;
    qrdbV4.Enabled     := False;
    qrdbV3.Enabled     := False;
    qrdbV2.Enabled     := False;
    qrdbV1.Enabled     := False;
    qrLabel39.Enabled  := False;
    QRLabel41.Enabled  := True;
    QRDBText14.Enabled := True;
    QRLabel38.Enabled  := True;
    QRDBText26.Enabled := True;
  end
  else
  begin
    QRLabel18.Enabled  := True;
    QRDBText20.Enabled := True;
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
    QRLabel41.Enabled  := False;
    QRDBText14.Enabled := False;
    QRLabel38.Enabled  := False;
    QRDBText26.Enabled := False;
  end;
  DMImpr.cdsImprPedItem.First;
  NrSerie := '';
  While Not DMImpr.cdsImprPedItem.Eof do
  begin
    if DMImpr.cdsImprPedItemNR_SERIE_ITEM.AsString <> '' then
    begin
      if NrSerie <> '' then NrSerie := NrSerie + chr(13);
      NrSerie := NrSerie + 'N.Serie ' + DMImpr.cdsImprPedItemCODIGO_PECA.AsString + ': ' + DMImpr.cdsImprPedItemNR_SERIE_ITEM.Value;
    end;
    DMImpr.cdsImprPedItem.Next;
  end;
  qrlNrSerie.Caption := NrSerie;
  DMImpr.cdsImprPedItem.First;
end;

procedure TFImprimirPedidosRpt.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  Insert ('-', Value, 6);
end;

procedure TFImprimirPedidosRpt.QRDBText5Print(sender: TObject;
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

procedure TFImprimirPedidosRpt.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' - ' + DMImpr.cdsImprPedItemDESCRICAO_PECA.AsString;
end;

procedure TFImprimirPedidosRpt.QRDBText21Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' - ' + DMImpr.cdsImprPedDESCRICAO_NATUREZA.AsString;
end;

procedure TFImprimirPedidosRpt.QRDBText24Print(sender: TObject;
  var Value: String);
begin
  Insert (DMImpr.cdsImprPedCODIGO_TRANSPORTADORA.Value + ' - ', Value, 1);
end;

procedure TFImprimirPedidosRpt.QRLabel33Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedVLR_FRETE.Value = 0 then Value := '';
end;

procedure TFImprimirPedidosRpt.QRLabel35Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedFRETE_TRANSP.Value = '1' then
    Value := Value + ' do Emitente'
  else
    Value := Value + ' do Destinatário';
end;

procedure TFImprimirPedidosRpt.qrdbV1Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD00.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 1 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV2Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD01.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 2 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV3Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD02.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 3 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV4Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD03.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 4 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV5Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD04.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 5 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV6Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD05.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 6 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV7Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD06.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 7 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV8Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD07.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 8 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV9Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD08.Value);
  if DMImpr.cdsImprPedPARCELAS.Value < 9 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrdbV10Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (StrtoDate (Value) + DMImpr.cdsImprPedD09.Value);
end;

procedure TFImprimirPedidosRpt.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  Value := DatetoStr (DMImpr.cdsImprPedDIAS_DEMONSTRACAO.AsInteger + DMImpr.cdsImprPedDATA_PEDIDO.Value);
  QRLabel41.Enabled :=  DMImpr.cdsImprPedDIAS_DEMONSTRACAO.AsInteger <> 0;
  if DMImpr.cdsImprPedDIAS_DEMONSTRACAO.AsInteger = 0 then
    Value := '';
end;

procedure TFImprimirPedidosRpt.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO.AsString <> '' then
    Value := Value + ', ' + DMImpr.cdsImprPedNUMERO.Value;
  if DMImpr.cdsImprPedCOMPL_ENDERECO.AsString <> '' then
    Value := Value + ', ' + DMImpr.cdsImprPedCOMPL_ENDERECO.Value;
end;

procedure TFImprimirPedidosRpt.ChildBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := (DMImpr.cdsImprPedNUMERO_FONE2.AsString <> '') or (DMImpr.cdsImprPedNUMERO_FAX.AsString <> '');
end;

procedure TFImprimirPedidosRpt.ChildBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := DMImpr.cdsImprPedNUMERO_FONE3.AsString <> '';
end;

procedure TFImprimirPedidosRpt.QRLabel12Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO_FONE2.AsString = '' then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrlFone2Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO_FONE2.AsString = '' then
    Value := '' else
  Value := '(' + DMImpr.cdsImprPedDDD_FONE2.AsString + ') ' +
                 DMImpr.cdsImprPedNUMERO_FONE2.AsString + ' - ' +
                 DMImpr.cdsImprPedCOMPL_FONE2.AsString;
end;

procedure TFImprimirPedidosRpt.QRLabel15Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO_FAX.AsString = '' then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrlFaxPrint(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO_FAX.AsString = '' then
    Value := '' else
  Value := '(' + DMImpr.cdsImprPedDDD_FAX.AsString + ') ' +
                 DMImpr.cdsImprPedNUMERO_FAX.AsString + ' - ' +
                 DMImpr.cdsImprPedCOMPL_FAX.AsString;
end;

procedure TFImprimirPedidosRpt.QRLabel29Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO_FONE3.AsString = '' then
    Value := '';
end;

procedure TFImprimirPedidosRpt.qrlFone3Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprPedNUMERO_FONE3.AsString = '' then
    Value := '' else
  Value := '(' + DMImpr.cdsImprPedDDD_FONE3.AsString + ') ' +
                 DMImpr.cdsImprPedNUMERO_FONE3.AsString + ' - ' +
                 DMImpr.cdsImprPedCOMPL_FONE3.AsString;
end;

procedure TFImprimirPedidosRpt.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ' - ' + DMImpr.cdsImprPedNOME_VENDEDOR.AsString;
end;

end.
