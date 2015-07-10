unit UImprimirRMARpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, jpeg, DBClient;

type
  TFImprimirRMARpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    QRLabel17: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel20: TQRLabel;
    QRImage1: TQRImage;
    QRSubDetail2: TQRSubDetail;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    mmEmpresa: TQRMemo;
    QRLabel1: TQRLabel;
    QRShape11: TQRShape;
    QRLabel12: TQRLabel;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel29: TQRLabel;
    QRDBText20: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel42: TQRLabel;
    QRDBText31: TQRDBText;
    QRLabel6: TQRLabel;
    QRBand2: TQRBand;
    QRDBText14: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText10: TQRDBText;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  FImprimirRMARpt: TFImprimirRMARpt;

implementation

uses UDM;

{$R *.DFM}

procedure TFImprimirRMARpt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  cdsEmpresa: TClientDataSet;
  endereco: String;
begin
  cdsEmpresa := TClientDataSet.Create(DM);
  cdsEmpresa.RemoteServer := DM.SCServer;
  cdsEmpresa.ProviderName := 'dspLista';
  cdsEmpresa.Close;
  DM.SCServer.AppServer.CriaLista ('select c.* from clientes c inner join empresas e on (e.codigo_empresa=c.codigo_cliente)');
  cdsEmpresa.Open;

  endereco := cdsEmpresa.FieldByName('endereco').Value;
  if cdsEmpresa.FieldByName('numero').Value <> '' then
    endereco := endereco + ', ' + cdsEmpresa.FieldByName('numero').Value;
  if cdsEmpresa.FieldByName('compl_endereco').Value <> '' then
    endereco := endereco + ', ' + cdsEmpresa.FieldByName('compl_endereco').Value;
  if cdsEmpresa.FieldByName('bairro').Value <> '' then
    endereco := endereco + ' - ' + cdsEmpresa.FieldByName('bairro').Value;
  if cdsEmpresa.FieldByName('estado').Value <> '' then
    endereco := endereco + ' - ' + cdsEmpresa.FieldByName('estado').Value;
  if cdsEmpresa.FieldByName('cep').Value <> '' then
    endereco := endereco + ' CEP: ' + cdsEmpresa.FieldByName('cep').Value;

  mmEmpresa.Lines.Clear;
  mmEmpresa.Lines.Add(cdsEmpresa.FieldByName('nome_cliente').Value);
  mmEmpresa.Lines.Add(endereco);
end;

end.
