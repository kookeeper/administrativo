unit UImprimirNfiscaisVendRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DBClient;

type
  TFImprimirNFiscaisVendRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRShape2: TQRShape;
    QRDBText1: TQRDBText;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel37: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRShape3: TQRShape;
    QRDBText3: TQRDBText;
    qrs1Dup1: TQRShape;
    qrvDup1: TQRDBText;
    qrs2Dup1: TQRShape;
    qrdDup1: TQRDBText;
    QRBand2: TQRBand;
    QRLabel8: TQRLabel;
    lbTotal: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    lbMedia2: TQRLabel;
    lbMedia1: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape10: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    qrs1Dup2: TQRShape;
    qrs2Dup2: TQRShape;
    qrdDup2: TQRDBText;
    qrvDup2: TQRDBText;
    qrs1Dup3: TQRShape;
    qrs2Dup3: TQRShape;
    qrdDup3: TQRDBText;
    qrvDup3: TQRDBText;
    qrs1Dup4: TQRShape;
    qrs2Dup4: TQRShape;
    qrdDup4: TQRDBText;
    qrvDup4: TQRDBText;
    qrs1Dup5: TQRShape;
    qrs2Dup5: TQRShape;
    qrdDup5: TQRDBText;
    qrvDup5: TQRDBText;
    procedure lbTotalPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure qrvDup1Print(sender: TObject; var Value: String);
    procedure lbMedia1Print(sender: TObject; var Value: String);
    procedure lbMedia2Print(sender: TObject; var Value: String);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure QRLabel22Print(sender: TObject; var Value: String);
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRLabel8Print(sender: TObject; var Value: String);
    procedure QRLabel6Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrvDup2Print(sender: TObject; var Value: String);
    procedure qrvDup3Print(sender: TObject; var Value: String);
    procedure qrvDup4Print(sender: TObject; var Value: String);
    procedure qrvDup5Print(sender: TObject; var Value: String);
  private

  public
    cds: TClientDataSet;
  end;

var
  FImprimirNFiscaisVendRpt: TFImprimirNFiscaisVendRpt;

implementation

uses UDM, UImprimirNfiscaisVend, DB;

{$R *.DFM}

procedure TFImprimirNFiscaisVendRpt.lbTotalPrint(sender: TObject;
  var Value: String);
begin
  Value := FImprimirNFiscaisVend.lbValor.Caption;
end;

procedure TFImprimirNFiscaisVendRpt.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF (cds.FieldByName('vlr_total').Value, ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.qrvDup1Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF (cds.FieldByName('vlr1').Value, ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.lbMedia1Print(sender: TObject;
  var Value: String);
begin
  Value := FloattoStrf (FImprimirNFiscaisVend.Valor/FImprimirNFiscaisVend.Qtde, ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.lbMedia2Print(sender: TObject;
  var Value: String);
begin
  Value := FloattoStrf (FImprimirNFiscaisVend.Valor/(1+FImprimirNFiscaisVend.dtpFim.Date-FImprimirNFiscaisVend.dtpInicio.Date), ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.QRLabel1Print(sender: TObject;
  var Value: String);
begin
  if FImprimirNFiscaisVend.cbVendedor.Checked then
    Value := 'Relação de Vendas por Vendedor' else
    Value := 'Relação de Vendas por Período';
end;

procedure TFImprimirNFiscaisVendRpt.QRLabel22Print(sender: TObject;
  var Value: String);
begin
  if not FImprimirNFiscaisVend.cbVendedor.Checked then
    Value := '';
end;

procedure TFImprimirNFiscaisVendRpt.QRDBText4Print(sender: TObject;
  var Value: String);
begin
  if not FImprimirNFiscaisVend.cbVendedor.Checked then
    Value := '';
end;

procedure TFImprimirNFiscaisVendRpt.QRLabel8Print(sender: TObject;
  var Value: String);
begin
  if not FImprimirNFiscaisVend.cbVendedor.Checked then
    Value := 'Total do Período';
end;

procedure TFImprimirNFiscaisVendRpt.QRLabel6Print(sender: TObject;
  var Value: String);
begin
  Value := 'Período de ' + FormatDateTime ('dd/mm/yyyy', FImprimirNFiscaisVend.dtpInicio.Date) +
           ' até ' + FormatDateTime ('dd/mm/yyyy', FImprimirNFiscaisVend.dtpFim.Date);
end;

procedure TFImprimirNFiscaisVendRpt.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  Value := cds.FieldByName('CODIGO_CLIENTE').AsString + ' - ' + cds.FieldByName('NOME_CLIENTE').AsString;
end;

procedure TFImprimirNFiscaisVendRpt.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrdDup2.Enabled  := cds.FieldByName('VLR2').AsCurrency <> 0;
  qrvDup2.Enabled  := cds.FieldByName('VLR2').AsCurrency <> 0;
  qrs1Dup2.Enabled := cds.FieldByName('VLR2').AsCurrency <> 0;
  qrs2Dup2.Enabled := cds.FieldByName('VLR2').AsCurrency <> 0;

  qrdDup3.Enabled  := cds.FieldByName('VLR3').AsCurrency <> 0;
  qrvDup3.Enabled  := cds.FieldByName('VLR3').AsCurrency <> 0;
  qrs1Dup3.Enabled := cds.FieldByName('VLR3').AsCurrency <> 0;
  qrs2Dup3.Enabled := cds.FieldByName('VLR3').AsCurrency <> 0;

  qrdDup4.Enabled  := cds.FieldByName('VLR4').AsCurrency <> 0;
  qrvDup4.Enabled  := cds.FieldByName('VLR4').AsCurrency <> 0;
  qrs1Dup4.Enabled := cds.FieldByName('VLR4').AsCurrency <> 0;
  qrs2Dup4.Enabled := cds.FieldByName('VLR4').AsCurrency <> 0;

  qrdDup5.Enabled  := cds.FieldByName('VLR5').AsCurrency <> 0;
  qrvDup5.Enabled  := cds.FieldByName('VLR5').AsCurrency <> 0;
  qrs1Dup5.Enabled := cds.FieldByName('VLR5').AsCurrency <> 0;
  qrs2Dup5.Enabled := cds.FieldByName('VLR5').AsCurrency <> 0;

  if cds.FieldByName('VLR5').AsCurrency <> 0 then
  begin
    QRSubDetail1.Height := (22*5);
    QRDBText1.Height  := (17+(20*4));
    QRDBText2.Height  := (17+(20*4));
    QRDBText3.Height  := (17+(20*4));
    QRDBText11.Height := (17+(20*4));
    QRShape1.Height   := (23+(22*4));
    QRShape2.Height   := (23+(22*4));
    QRShape3.Height   := (23+(22*4));
    QRShape10.Height  := (23+(22*4));
  end
  else if cds.FieldByName('VLR4').AsCurrency <> 0 then
  begin
    QRSubDetail1.Height := (22*4);
    QRDBText1.Height  := (17+(20*3));
    QRDBText2.Height  := (17+(20*3));
    QRDBText3.Height  := (17+(20*3));
    QRDBText11.Height := (17+(20*3));
    QRShape1.Height   := (23+(22*3));
    QRShape2.Height   := (23+(22*3));
    QRShape3.Height   := (23+(22*3));
    QRShape10.Height  := (23+(22*3));
  end
  else if cds.FieldByName('VLR3').AsCurrency <> 0 then
  begin
    QRSubDetail1.Height := (22*3);
    QRDBText1.Height  := (17+(20*2));
    QRDBText2.Height  := (17+(20*2));
    QRDBText3.Height  := (17+(20*2));
    QRDBText11.Height := (17+(20*2));
    QRShape1.Height   := (23+(22*2));
    QRShape2.Height   := (23+(22*2));
    QRShape3.Height   := (23+(22*2));
    QRShape10.Height  := (23+(22*2));
  end
  else if cds.FieldByName('VLR2').AsCurrency <> 0 then
  begin
    QRSubDetail1.Height := (22*2);
    QRDBText1.Height  := (17+(20*1));
    QRDBText2.Height  := (17+(20*1));
    QRDBText3.Height  := (17+(20*1));
    QRDBText11.Height := (17+(20*1));
    QRShape1.Height   := (23+(22*1));
    QRShape2.Height   := (23+(22*1));
    QRShape3.Height   := (23+(22*1));
    QRShape10.Height  := (23+(22*1));
  end
  else begin
    QRSubDetail1.Height := (22*1);
    QRDBText1.Height  := 17;
    QRDBText2.Height  := 17;
    QRDBText3.Height  := 17;
    QRDBText11.Height := 17;
    QRShape1.Height   := 23;
    QRShape2.Height   := 23;
    QRShape3.Height   := 23;
    QRShape10.Height  := 23;
  end;
end;

procedure TFImprimirNFiscaisVendRpt.qrvDup2Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF (cds.FieldByName('VLR2').Value, ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.qrvDup3Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF (cds.FieldByName('VLR3').Value, ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.qrvDup4Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF (cds.FieldByName('VLR4').Value, ffCurrency, 10, 2);
end;

procedure TFImprimirNFiscaisVendRpt.qrvDup5Print(sender: TObject;
  var Value: String);
begin
  Value := FloatToStrF (cds.FieldByName('VLR5').Value, ffCurrency, 10, 2);
end;

end.
