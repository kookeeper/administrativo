unit UImprimirDemonstracaoPrevRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirDemonstracaoPrevRpt = class(TQuickRep)
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
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand2: TQRBand;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRDBText3: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRLabel39Print(sender: TObject; var Value: String);
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    TotalNotas: Integer;
  public

  end;

var
  FImprimirDemonstracaoPrevRpt: TFImprimirDemonstracaoPrevRpt;

implementation

uses UDM, DB, UDMImpr;

{$R *.DFM}

procedure TFImprimirDemonstracaoPrevRpt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TotalNotas := 0;
end;

procedure TFImprimirDemonstracaoPrevRpt.QRLabel39Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalNotas, ffNumber, 10, 0);
end;

procedure TFImprimirDemonstracaoPrevRpt.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value := FloattoStrf (StrtoFloat (Value), ffNumber, 10, 0);
end;

procedure TFImprimirDemonstracaoPrevRpt.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  TotalNotas := TotalNotas + 1;
end;

procedure TFImprimirDemonstracaoPrevRpt.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprDemPrevDT_NFISCAL_RETORNO.IsNull then
    Value := '';
end;

end.
