unit UImprimirDuplicatasRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirDuplicatasRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    qrlExtenso: TQRLabel;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText11Print(sender: TObject; var Value: String);
  private

  public

  end;

var
  FImprimirDuplicatasRpt: TFImprimirDuplicatasRpt;

implementation

uses UDMImpr, Extensos, UDM;

{$R *.DFM}

procedure TFImprimirDuplicatasRpt.QRSubDetail1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  qrlExtenso.Caption := '(' + Extenso(DMImpr.cdsImprNfDupsVALOR_DUPLICATA.Value) + ')';
end;

procedure TFImprimirDuplicatasRpt.QRDBText8Print(sender: TObject;
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

procedure TFImprimirDuplicatasRpt.QRDBText5Print(sender: TObject;
  var Value: String);
begin
  if Length (Value) = 8 then
    Insert ('-', Value, 6);
end;

procedure TFImprimirDuplicatasRpt.QRDBText11Print(sender: TObject;
  var Value: String);
begin
  if DMImpr.cdsImprNfNUMERO.AsString <> '' then
    Value := Value + ', ' + DMImpr.cdsImprNfNUMERO.AsString;
  if DMImpr.cdsImprNfCOMPL_ENDERECO.AsString <> '' then
    Value := Value + ', ' + DMImpr.cdsImprNfCOMPL_ENDERECO.AsString;
end;

end.
