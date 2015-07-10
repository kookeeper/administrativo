unit UImprimirClientesNovosRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirClientesNovosRpt = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel14: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRDBText2: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape1: TQRShape;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRExpr1: TQRExpr;
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  FImprimirClientesNovosRpt: TFImprimirClientesNovosRpt;

implementation

uses UDM, DB;

{$R *.DFM}

procedure TFImprimirClientesNovosRpt.QRSubDetail2BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if DM.cdsImprClientesNovos.FieldByName('DATA_CADASTRO').AsDateTime > Date-30 then
  QRSubDetail2.Font.Color := clGreen else
  QRSubDetail2.Font.Color := clWindowText;
end;

end.
