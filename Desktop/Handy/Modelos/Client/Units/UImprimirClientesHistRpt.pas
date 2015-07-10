unit UImprimirClientesHistRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirClientesHistRpt = class(TQuickRep)
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand4: TQRBand;
    QRLabel43: TQRLabel;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel3: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    qrlFone1: TQRLabel;
    qrlFone3: TQRLabel;
    qrlFone2: TQRLabel;
    qrlCelular: TQRLabel;
    qrlFax: TQRLabel;
    QRLabel30: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel31: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape6: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRExpr2: TQRExpr;
    QRBand5: TQRBand;
    QRLabel28: TQRLabel;
    QRLabel33: TQRLabel;
    QRDBText25: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel40: TQRLabel;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRExpr1: TQRExpr;
    QRLabel29: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRSubDetail2: TQRSubDetail;
    QRDBText19: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText20: TQRDBText;
    QRDBText22: TQRDBText;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRBand2: TQRBand;
    QRLabel19: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel24: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel41: TQRLabel;
    QRExpr4: TQRExpr;
    QRLabel42: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRLabel35Print(sender: TObject; var Value: String);
    procedure QRLabel33Print(sender: TObject; var Value: String);
    procedure QRLabel23Print(sender: TObject; var Value: String);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand5BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRLabel39Print(sender: TObject; var Value: String);
    procedure QRLabel42Print(sender: TObject; var Value: String);
  private
    TotalProdRS, TotalProdUS: Real;
    TotalItens: Integer;
  public

  end;

var
  FImprimirClientesHistRpt: TFImprimirClientesHistRpt;

implementation

uses UDM, DB, UDMImpr;

{$R *.DFM}

procedure TFImprimirClientesHistRpt.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlFone1.Caption := '(' + DMImpr.cdsImprHistClientes1DDD_FONE1.AsString +
                     ') ' + DMImpr.cdsImprHistClientes1NUMERO_FONE1.AsString +
                    ' - ' + DMImpr.cdsImprHistClientes1COMPL_FONE1.AsString;
  qrlFone2.Caption := '(' + DMImpr.cdsImprHistClientes1DDD_FONE2.AsString +
                     ') ' + DMImpr.cdsImprHistClientes1NUMERO_FONE2.AsString +
                    ' - ' + DMImpr.cdsImprHistClientes1COMPL_FONE2.AsString;
  qrlFone3.Caption := '(' + DMImpr.cdsImprHistClientes1DDD_FONE3.AsString +
                     ') ' + DMImpr.cdsImprHistClientes1NUMERO_FONE3.AsString +
                    ' - ' + DMImpr.cdsImprHistClientes1COMPL_FONE3.AsString;
  qrlCelular.Caption := '(' + DMImpr.cdsImprHistClientes1DDD_CELULAR.AsString +
                       ') ' + DMImpr.cdsImprHistClientes1NUMERO_CELULAR.AsString +
                      ' - ' + DMImpr.cdsImprHistClientes1COMPL_CELULAR.AsString;
  qrlFax.Caption := '(' + DMImpr.cdsImprHistClientes1DDD_FAX.AsString +
                   ') ' + DMImpr.cdsImprHistClientes1NUMERO_FAX.AsString +
                  ' - ' + DMImpr.cdsImprHistClientes1COMPL_FAX.AsString;
end;

procedure TFImprimirClientesHistRpt.QRDBText1Print(sender: TObject; var Value: String);
begin
  Value := Value + ' - ' + DMImpr.cdsImprHistClientes3DESCRICAO_PECA.AsString;
end;

procedure TFImprimirClientesHistRpt.QRLabel35Print(sender: TObject; var Value: String);
begin
  if DMImpr.cdsImprHistClientes2FRETE_TRANSP.Value = '1' then
    Value := Value + ' do Emitente'
  else
    Value := Value + ' do Destinatário';
end;

procedure TFImprimirClientesHistRpt.QRLabel33Print(sender: TObject; var Value: String);
begin
  if DMImpr.cdsImprHistClientes2VLR_FRETE.Value = 0 then Value := '';
end;

procedure TFImprimirClientesHistRpt.QRLabel23Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalProdRS, ffCurrency, 10, 2);
end;

procedure TFImprimirClientesHistRpt.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  TotalProdRS := 0;
  TotalProdUS := 0;
  TotalItens := 0;
end;

procedure TFImprimirClientesHistRpt.QRBand5BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalProdRS := TotalProdRS + DMImpr.cdsImprHistClientes2VLR_PRODUTOS.Value;
  TotalProdUS := TotalProdUS + DMImpr.cdsImprHistClientes2VLR_PRODUTOS.Value / DMImpr.cdsImprHistClientes2COTACAO_DOLAR.Value;
end;

procedure TFImprimirClientesHistRpt.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  TotalItens    := TotalItens    + DMImpr.cdsImprHistClientes3QTDE_ITEM.Value;
end;

procedure TFImprimirClientesHistRpt.QRLabel39Print(sender: TObject; var Value: String);
begin
  Value := FloattoStrf (TotalItens, ffNumber, 10, 0);
end;

procedure TFImprimirClientesHistRpt.QRLabel42Print(sender: TObject;
  var Value: String);
begin
  Value := 'US$ ' + FloattoStrf (TotalProdUS, ffFixed, 10, 2);
end;

end.
