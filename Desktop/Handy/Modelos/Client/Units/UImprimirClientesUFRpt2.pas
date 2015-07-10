unit UImprimirClientesUFRpt2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirClientesUFRpt2 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel13: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel14: TQRLabel;
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel39Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
  private
    TotalProdutos: Real;
    TotalItens: Integer;
  public

  end;

var
  FImprimirClientesUFRpt2: TFImprimirClientesUFRpt2;

implementation

uses UDM, DB, UDMImpr;

{$R *.DFM}

procedure TFImprimirClientesUFRpt2.QRLabel23Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalProdutos, ffCurrency, 10, 2);
end;

procedure TFImprimirClientesUFRpt2.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TotalProdutos := 0;
  TotalItens := 0;
end;

procedure TFImprimirClientesUFRpt2.QRLabel39Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalItens, ffNumber, 10, 0);
end;

procedure TFImprimirClientesUFRpt2.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value := FloattoStrf (StrtoFloat (Value), ffNumber, 10, 0);
end;

procedure TFImprimirClientesUFRpt2.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalProdutos := TotalProdutos + DMImpr.cdsImprClientesUFVALOR.Value;
  TotalItens    := TotalItens    + DMImpr.cdsImprClientesUF.FieldByName ('QTDE').AsInteger;
end;

procedure TFImprimirClientesUFRpt2.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ', ' + DMImpr.cdsImprClientesUFNUMERO.Value + ', ' + DMImpr.cdsImprClientesUFCOMPL_ENDERECO.Value;
end;

procedure TFImprimirClientesUFRpt2.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value := '(' + DMImpr.cdsImprClientesUFDDD_FONE1.Value + ') ' +
    DMImpr.cdsImprClientesUFNUMERO_FONE1.Value + ' - ' +
    DMImpr.cdsImprClientesUFCOMPL_FONE1.Value; 
end;

end.
