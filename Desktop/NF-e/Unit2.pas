unit Unit2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls, DB, DBClient, QrAngLbl, pcnConversao;

type
  TQuickReport2 = class(TQuickRep)
    QRBand1: TQRBand;
    qrSubItens: TQRSubDetail;
    cdsItens: TClientDataSet;
    i02: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRAngledLabel2: TQRAngledLabel;
    QRAngledLabel3: TQRAngledLabel;
    QRAngledLabel4: TQRAngledLabel;
    QRAngledLabel5: TQRAngledLabel;
    QRAngledLabel6: TQRAngledLabel;
    QRAngledLabel7: TQRAngledLabel;
    QRAngledLabel8: TQRAngledLabel;
    QRAngledLabel9: TQRAngledLabel;
    QRShape1: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    x28: TQRLabel;
    w10: TQRLabel;
    w15: TQRLabel;
    w11: TQRLabel;
    x21: TQRLabel;
    x09: TQRLabel;
    x02: TQRLabel;
    w09: TQRLabel;
    w04: TQRLabel;
    e16: TQRLabel;
    e09: TQRLabel;
    e02: TQRLabel;
    c18: TQRLabel;
    QRLabel73: TQRLabel;
    w05: TQRLabel;
    e12: TQRLabel;
    e13: TQRLabel;
    e17: TQRLabel;
    c02: TQRLabel;
    w06: TQRLabel;
    x27: TQRLabel;
    x08: TQRLabel;
    x06: TQRLabel;
    w08: TQRLabel;
    w03: TQRLabel;
    e11: TQRLabel;
    e06: TQRLabel;
    e04: TQRLabel;
    c17: TQRLabel;
    b04: TQRLabel;
    x31: TQRLabel;
    x04: TQRLabel;
    w16: TQRLabel;
    QRLabel93: TQRLabel;
    w07: TQRLabel;
    b10: TQRLabel;
    b09: TQRLabel;
    x32: TQRLabel;
    x20: TQRLabel;
    x30: TQRLabel;
    x07: TQRLabel;
    x19: TQRLabel;
    x29: TQRLabel;
    x10: TQRLabel;
    QRLabel45: TQRLabel;
    n16: TQRLabel;
    o14: TQRLabel;
    n17: TQRLabel;
    n23: TQRLabel;
    n21: TQRLabel;
    n15: TQRLabel;
    i11: TQRLabel;
    i10a: TQRLabel;
    i10: TQRLabel;
    i09: TQRLabel;
    i08: TQRLabel;
    n12: TQRLabel;
    i05: TQRLabel;
    i04: TQRLabel;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRLabel71: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel86: TQRLabel;
    QRLabel87: TQRLabel;
    QRLabel97: TQRLabel;
    QRAngledLabel14: TQRAngledLabel;
    QRAngledLabel15: TQRAngledLabel;
    QRAngledLabel16: TQRAngledLabel;
    w18: TQRLabel;
    z09: TQRLabel;
    w19: TQRLabel;
    z06: TQRLabel;
    c19: TQRLabel;
    w20: TQRLabel;
    QRShape3: TQRShape;
    cdsItensitem: TIntegerField;
    cdsItenscProd: TStringField;
    cdsItensxProd: TStringField;
    cdsItensNCM: TStringField;
    cdsItensCFOP: TStringField;
    cdsItensuCom: TStringField;
    cdsItensqCom: TStringField;
    cdsItensvUnCom: TStringField;
    cdsItensvProd: TStringField;
    cdsItensICMS_CST: TStringField;
    cdsItensICMS_vBC: TStringField;
    cdsItensICMS_pICMS: TStringField;
    cdsItensICMS_vICMS: TStringField;
    cdsItensICMS_pICMSST: TStringField;
    cdsItensICMS_vICMSST: TStringField;
    cdsItensIPI_CST: TStringField;
    procedure qrSubItensBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  QuickReport2: TQuickReport2;

implementation

uses Unit1, pcnNFe;

{$R *.DFM}

procedure TQuickReport2.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
    b04.Caption := Form1.nfe.Ide.natOp;
    b09.Caption := FormatDateTime('dd/mm/yyyy', Form1.nfe.Ide.dEmi);
    b10.Caption := FormatDateTime('dd/mm/yyyy', Form1.nfe.Ide.dSaiEnt);
    c02.Caption := Form1.nfe.Emit.CNPJCPF;
    c17.Caption := Form1.nfe.Emit.IE;
    c18.Caption := Form1.nfe.Emit.IEST;
    e02.Caption := Form1.nfe.Dest.CNPJCPF;
    e04.Caption := Form1.nfe.Dest.xNome;
    e06.Caption := Form1.nfe.Dest.EnderDest.xLgr + ', ' + Form1.nfe.Dest.EnderDest.nro;
    e09.Caption := Form1.nfe.Dest.EnderDest.xBairro;
    e11.Caption := Form1.nfe.Dest.EnderDest.xMun;
    e12.Caption := Form1.nfe.Dest.EnderDest.UF;
    e13.Caption := IntToStr(Form1.nfe.Dest.EnderDest.CEP);
    e16.Caption := Form1.nfe.Dest.EnderDest.fone;
    e17.Caption := Form1.nfe.Dest.IE;
    w03.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vBC);
    w04.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vICMS);
    w05.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vBCST);
    w06.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vST);
    w07.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vProd);
    w08.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vFrete);
    w09.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vSeg);
    w10.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vDesc);
    w11.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vII);
    w15.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vOutro);
    w16.Caption := FloatToStr(Form1.nfe.Total.ICMSTot.vNF);

    if Form1.nfe.Transp.modFrete = mfContaEmitente then
      x02.Caption := 'Emitente'
    else
      x02.Caption := 'Destinatário';

    x04.Caption := Form1.nfe.Transp.Transporta.CNPJCPF;
    x06.Caption := Form1.nfe.Transp.Transporta.xNome;
    x07.Caption := Form1.nfe.Transp.Transporta.IE;
    x08.Caption := Form1.nfe.Transp.Transporta.xEnder;
    x09.Caption := Form1.nfe.Transp.Transporta.xMun;
    x10.Caption := Form1.nfe.Transp.Transporta.UF;
    x19.Caption := Form1.nfe.Transp.veicTransp.placa;
    x20.Caption := Form1.nfe.Transp.veicTransp.UF;
    x21.Caption := Form1.nfe.Transp.veicTransp.RNTC;
    if Form1.nfe.Transp.Vol.Count > 0 then
    begin
      x27.Caption := IntToStr(Form1.nfe.Transp.Vol[0].qVol);
      x28.Caption := Form1.nfe.Transp.Vol[0].esp;
      x29.Caption := Form1.nfe.Transp.Vol[0].marca;
      x30.Caption := Form1.nfe.Transp.Vol[0].nVol;
      x31.Caption := FloatToStr(Form1.nfe.Transp.Vol[0].pesoL);
      x32.Caption := FloatToStr(Form1.nfe.Transp.Vol[0].pesoB);
    end;
}
end;

procedure TQuickReport2.qrSubItensBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
    i02.Caption := cdsItenscProd.Value;
    i04.Caption := cdsItensxProd.Value;
    i05.Caption := cdsItensNCM.Value;
    i08.Caption := cdsItensCFOP.Value;
    i09.Caption := cdsItensuCom.Value;
    i10.Caption := cdsItensqCom.Value;
    i10a.Caption := cdsItensvUnCom.Value;
    i11.Caption := cdsItensvProd.Value;
    n12.Caption := cdsItensICMS_CST.Value;
    n15.Caption := cdsItensICMS_vBC.Value;
    n16.Caption := cdsItensICMS_pICMS.Value;
    n17.Caption := cdsItensICMS_vICMS.Value;
    n21.Caption := cdsItensICMS_pICMSST.Value;
    n23.Caption := cdsItensICMS_vICMSST.Value;
    o14.Caption := cdsItensIPI_CST.Value;
}
end;

procedure TQuickReport2.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{
    c19.Caption := Form1.nfe.Emit.IM;
    w18.Caption := FloatToStr(Form1.nfe.Total.ISSQNtot.vServ);
    w19.Caption := FloatToStr(Form1.nfe.Total.ISSQNtot.vBC);
    w20.Caption := FloatToStr(Form1.nfe.Total.ISSQNtot.vISS);

    if Form1.nfe.infAdic.obsCont.Count > 0 then
      z06.Caption := Form1.nfe.InfAdic.obsCont[0].xTexto;

    if Form1.nfe.infAdic.obsFisco.Count > 0 then
      z09.Caption := Form1.nfe.InfAdic.obsFisco[0].xTexto;
}
end;

end.
