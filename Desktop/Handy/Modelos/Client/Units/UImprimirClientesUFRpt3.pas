unit UImprimirClientesUFRpt3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirClientesUFRpt3 = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText20: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    procedure QRDBText2Print(sender: TObject; var Value: String);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText10Print(sender: TObject; var Value: String);
  private
  public
  end;

var
  FImprimirClientesUFRpt3: TFImprimirClientesUFRpt3;

implementation

uses UDM, DB, UDMImpr;

{$R *.DFM}

procedure TFImprimirClientesUFRpt3.QRDBText2Print(sender: TObject;
  var Value: String);
begin
  Value := FloattoStrf (StrtoFloat (Value), ffNumber, 10, 0);
end;

procedure TFImprimirClientesUFRpt3.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value := Value + ', ' + DMImpr.cdsImprClientesUFNUMERO.Value + ', ' + DMImpr.cdsImprClientesUFCOMPL_ENDERECO.Value;
end;

procedure TFImprimirClientesUFRpt3.QRDBText10Print(sender: TObject;
  var Value: String);
begin
  Value := '(' + DMImpr.cdsImprClientesUFDDD_FONE1.Value + ') ' +
    DMImpr.cdsImprClientesUFNUMERO_FONE1.Value + ' - ' +
    DMImpr.cdsImprClientesUFCOMPL_FONE1.Value; 
end;

end.
