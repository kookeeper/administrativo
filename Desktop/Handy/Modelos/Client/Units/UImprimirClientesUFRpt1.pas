unit UImprimirClientesUFRpt1;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirClientesUFRpt1 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel39Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    TotalProdutos: Real;
    TotalItens: Integer;
  public

  end;

var
  FImprimirClientesUFRpt1: TFImprimirClientesUFRpt1;

implementation

uses UDM, DB, UDMImpr;

{$R *.DFM}

procedure TFImprimirClientesUFRpt1.QRLabel23Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalProdutos, ffCurrency, 10, 2);
end;

procedure TFImprimirClientesUFRpt1.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TotalProdutos := 0;
  TotalItens := 0;
end;

procedure TFImprimirClientesUFRpt1.QRLabel39Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalItens, ffNumber, 10, 0);
end;

procedure TFImprimirClientesUFRpt1.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value := FloattoStrf (StrtoFloat (Value), ffNumber, 10, 0);
end;

procedure TFImprimirClientesUFRpt1.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalProdutos := TotalProdutos + DMImpr.cdsImprClientesUFVALOR.Value;
  TotalItens    := TotalItens    + DMImpr.cdsImprClientesUF.FieldByName ('QTDE').AsInteger;
end;

procedure TFImprimirClientesUFRpt1.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprClientesUFDATA.IsNull then
    Value := '';
end;

end.
