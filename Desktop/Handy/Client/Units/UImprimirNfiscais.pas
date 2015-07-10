unit UImprimirNfiscais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, QuickRpt, Qrctrls, Variants,
  QRPrntr, Mask, RzEdit;

type
  TFImprimirNfiscais = class(TForm)
    Panel1: TPanel;
    bbPreview: TBitBtn;
    QuickRepAvision: TQuickRep;
    QRSubDetail1: TQRSubDetail;
    QRSubDetail2: TQRSubDetail;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText21: TQRDBText;
    qrlFone1: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrlSaida: TQRLabel;
    qrlEntrada: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText33: TQRDBText;
    QRDBText34: TQRDBText;
    QRBand1: TQRBand;
    ChildBand1: TQRChildBand;
    QRDBText57: TQRDBText;
    ChildBand2: TQRChildBand;
    qrlnfat1: TQRLabel;
    qrldfat3: TQRLabel;
    qrlvfat3: TQRLabel;
    qrlnfat3: TQRLabel;
    qrldfat2: TQRLabel;
    qrlvfat2: TQRLabel;
    qrlnfat2: TQRLabel;
    qrldfat1: TQRLabel;
    qrlvfat1: TQRLabel;
    qrlNSerie: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRDBText32: TQRDBText;
    QRDBText35: TQRDBText;
    QRDBText36: TQRDBText;
    QRDBText37: TQRDBText;
    QRDBText38: TQRDBText;
    QRDBText39: TQRDBText;
    QRDBText40: TQRDBText;
    QRDBText41: TQRDBText;
    QRDBText42: TQRDBText;
    QRDBText43: TQRDBText;
    QRDBText44: TQRDBText;
    QRDBText45: TQRDBText;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRDBText49: TQRDBText;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRDBText56: TQRDBText;
    QRPreview1: TQRPreview;
    Label1: TLabel;
    PrintDialog1: TPrintDialog;
    Panel2: TPanel;
    sbPrinter: TSpeedButton;
    sbClose: TSpeedButton;
    sbPrint: TSpeedButton;
    sbZoomIn: TSpeedButton;
    sbZoomOut: TSpeedButton;
    QRDBText14: TQRDBText;
    QRDBText58: TQRDBText;
    Margens: TLabel;
    QRDBText59: TQRDBText;
    QRLabel1: TQRLabel;
    Edit1: TRzEdit;
    QuickRepCosmo: TQuickRep;
    QRSubDetail3: TQRSubDetail;
    QRDBText22: TQRDBText;
    QRDBText60: TQRDBText;
    QRDBText61: TQRDBText;
    QRDBText62: TQRDBText;
    QRDBText63: TQRDBText;
    QRDBText64: TQRDBText;
    QRDBText65: TQRDBText;
    QRDBText66: TQRDBText;
    QRDBText67: TQRDBText;
    QRLabel2: TQRLabel;
    QRSubDetail4: TQRSubDetail;
    QRDBText68: TQRDBText;
    QRDBText69: TQRDBText;
    QRDBText70: TQRDBText;
    QRDBText71: TQRDBText;
    QRDBText72: TQRDBText;
    QRDBText73: TQRDBText;
    QRDBText74: TQRDBText;
    QRDBText75: TQRDBText;
    QRDBText76: TQRDBText;
    QRDBText77: TQRDBText;
    QRDBText78: TQRDBText;
    QRDBText79: TQRDBText;
    qrlFoneCosmo: TQRLabel;
    qrlSaidaCosmo: TQRLabel;
    qrlEntradaCosmo: TQRLabel;
    qrldfat3Cosmo: TQRLabel;
    qrlvfat3Cosmo: TQRLabel;
    qrldfat2Cosmo: TQRLabel;
    qrlvfat2Cosmo: TQRLabel;
    qrldfat1Cosmo: TQRLabel;
    qrlvfat1Cosmo: TQRLabel;
    QRDBText81: TQRDBText;
    QRBand2: TQRBand;
    QRDBText83: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRDBText84: TQRDBText;
    QRDBText85: TQRDBText;
    QRDBText86: TQRDBText;
    QRDBText87: TQRDBText;
    QRDBText88: TQRDBText;
    QRDBText89: TQRDBText;
    QRDBText90: TQRDBText;
    QRDBText91: TQRDBText;
    QRDBText92: TQRDBText;
    QRDBText93: TQRDBText;
    QRDBText94: TQRDBText;
    QRDBText95: TQRDBText;
    QRDBText96: TQRDBText;
    QRDBText97: TQRDBText;
    QRDBText98: TQRDBText;
    QRDBText99: TQRDBText;
    QRDBText100: TQRDBText;
    QRDBText101: TQRDBText;
    QRDBText102: TQRDBText;
    QRDBText103: TQRDBText;
    QRDBText104: TQRDBText;
    QRDBText105: TQRDBText;
    QRDBText106: TQRDBText;
    QRDBText107: TQRDBText;
    QRDBText108: TQRDBText;
    QRChildBand2: TQRChildBand;
    qrlNrSerieCosmo: TQRLabel;
    QRDBText82: TQRDBText;
    QRDBText117: TQRDBText;
    QRDBText112: TQRDBText;
    QRDBText114: TQRDBText;
    qrlCFO2: TQRLabel;
    procedure bbPreviewClick(Sender: TObject);
    procedure QRSubDetail2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRDBText12Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText19Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure qrlSaidaPrint(sender: TObject; var Value: String);
    procedure qrlEntradaPrint(sender: TObject; var Value: String);
    procedure QRDBText3Print(sender: TObject; var Value: String);
    procedure QRDBText15Print(sender: TObject; var Value: String);
    procedure QRDBText16Print(sender: TObject; var Value: String);
    procedure QuickRepAvisionPreview(Sender: TObject);
    procedure sbPrinterClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbZoomInClick(Sender: TObject);
    procedure sbZoomOutClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QRDBText20Print(sender: TObject; var Value: String);
    procedure QRDBText46Print(sender: TObject; var Value: String);
    procedure QRDBText13Print(sender: TObject; var Value: String);
    procedure QRDBText25Print(sender: TObject; var Value: String);
    procedure QRDBText28Print(sender: TObject; var Value: String);
    procedure QRDBText29Print(sender: TObject; var Value: String);
    procedure QRDBText32Print(sender: TObject; var Value: String);
    procedure QRDBText31Print(sender: TObject; var Value: String);
    procedure QRDBText30Print(sender: TObject; var Value: String);
    procedure QRDBText17Print(sender: TObject; var Value: String);
    procedure QRDBText34Print(sender: TObject; var Value: String);
    procedure QRDBText33Print(sender: TObject; var Value: String);
    procedure QRDBText27Print(sender: TObject; var Value: String);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure QRDBText1Print(sender: TObject; var Value: String);
    procedure QRDBText50Print(sender: TObject; var Value: String);
    procedure QRDBText56Print(sender: TObject; var Value: String);
    procedure QRDBText55Print(sender: TObject; var Value: String);
    procedure QRDBText54Print(sender: TObject; var Value: String);
    procedure QRDBText53Print(sender: TObject; var Value: String);
    procedure QRDBText52Print(sender: TObject; var Value: String);
    procedure QRDBText51Print(sender: TObject; var Value: String);
    procedure QRDBText14Print(sender: TObject; var Value: String);
    procedure QRDBText58Print(sender: TObject; var Value: String);
    procedure FormActivate(Sender: TObject);
    procedure QRLabel1Print(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure QRDBText109Print(sender: TObject; var Value: String);
    procedure QRDBText115Print(sender: TObject; var Value: String);
    procedure QRDBText114Print(sender: TObject; var Value: String);
    procedure QRDBText113Print(sender: TObject; var Value: String);
    procedure QRDBText112Print(sender: TObject; var Value: String);
    procedure QRDBText111Print(sender: TObject; var Value: String);
    procedure QRDBText110Print(sender: TObject; var Value: String);
  private
    NrSerie: String;
    qr: TQuickRep;

    procedure CriaDuplicatas (Grava: Boolean);
  public
    { Public declarations }
  end;

var
  FImprimirNfiscais: TFImprimirNfiscais;

implementation

uses UDM, Nfiscal, Empresa;

{$R *.DFM}

procedure TFImprimirNfiscais.CriaDuplicatas;
var
  vfat1,  nfat1,  dfat1,  vfat2,  nfat2,  dfat2,  vfat3,  nfat3,  dfat3: String;
begin
  DM.CriaDuplicatas(DM.cdsImprNfNFISCAL_SQ.AsInteger, Grava);

  nfat1 := DM.Duplicatas[0].Numero;
  vfat1 := FloattoStrf (DM.Duplicatas[0].Valor, ffNumber, 10, 2);
  dfat1 := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[0].Data);

  nfat2 := DM.Duplicatas[1].Numero;
  vfat2 := FloattoStrf (DM.Duplicatas[1].Valor, ffNumber, 10, 2);
  dfat2 := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[1].Data);

  nfat3 := DM.Duplicatas[2].Numero;
  vfat3 := FloattoStrf (DM.Duplicatas[2].Valor, ffNumber, 10, 2);
  dfat3 := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[2].Data);

  if DM.Duplicatas[0].Valor = 0 then vfat1 := '';
  if DM.Duplicatas[0].Valor = 0 then nfat1 := '';
  if DM.Duplicatas[0].Valor = 0 then dfat1 := '';

  if DM.Duplicatas[1].Valor = 0 then vfat2 := '';
  if DM.Duplicatas[1].Valor = 0 then nfat2 := '';
  if DM.Duplicatas[1].Valor = 0 then dfat2 := '';

  if DM.Duplicatas[2].Valor = 0 then vfat3 := '';
  if DM.Duplicatas[2].Valor = 0 then nfat3 := '';
  if DM.Duplicatas[2].Valor = 0 then dfat3 := '';

  qrlnfat1.Caption := nfat1;
  qrlvfat1.Caption := vfat1;
  qrldfat1.Caption := dfat1;

  qrlnfat2.Caption := nfat2;
  qrlvfat2.Caption := vfat2;
  qrldfat2.Caption := dfat2;

  qrlnfat3.Caption := nfat3;
  qrlvfat3.Caption := vfat3;
  qrldfat3.Caption := dfat3;

  qrlvfat1Cosmo.Caption := vfat1;
  qrldfat1Cosmo.Caption := dfat1;

  qrlvfat2Cosmo.Caption := vfat2;
  qrldfat2Cosmo.Caption := dfat2;

  qrlvfat3Cosmo.Caption := vfat3;
  qrldfat3Cosmo.Caption := dfat3;
end;

procedure TFImprimirNfiscais.bbPreviewClick(Sender: TObject);
var
  cfo: String;
  cfo1, cfo2: Boolean;
begin
  if tag = 1 then
  begin
    tag := 0;
    QRPreview1.QRPrinter.ClosePreview (FImprimirNfiscais);
  end;

  DM.cdsImprNf.Close;
  DM.cdsImprNf.Params.ParamByName ('NUMERO_NFISCAL').Value := StrtoInt (Edit1.Text);
  DM.cdsImprNf.Open;
  DM.cdsImprNfItem.Close;
  DM.cdsImprNfItem.Params.ParamByName ('NFISCAL_SQ').Value := DM.cdsImprNfNFISCAL_SQ.Value;
  DM.cdsImprNfItem.Open;

  CriaDuplicatas (False);
  cfo1 := false;
  cfo2 := false;

  DM.cdsImprNfItem.First;
  NrSerie := '';
  While Not DM.cdsImprNfItem.Eof do
  begin
    if DM.cdsImprNfItemNR_SERIE_ITEM.AsString <> '' then
    begin
      if NrSerie <> '' then NrSerie := NrSerie + chr(13);
      NrSerie := NrSerie + 'N.Serie ' + DM.cdsImprNfItemCODIGO_PRODUTO.AsString + ': ' + DM.cdsImprNfItemNR_SERIE_ITEM.Value;
    end;
    if DM.cdsImprNfItemVLR_ICMS_SUBST_ITEM.Value = 0 then
      cfo1 := True;
    if DM.cdsImprNfItemVLR_ICMS_SUBST_ITEM.Value > 0 then
      cfo2 := True;
    DM.cdsImprNfItem.Next;
  end;
  qrlNSerie.Caption := NrSerie;
  qrlNrSerieCosmo.Caption := NrSerie;

  cfo := '';
  if cfo1 then
    cfo := DM.cdsImprNfCFO.Text;
  if cfo1 and cfo2 then
    cfo := cfo + '/';
  if cfo2 then
    cfo := cfo + DM.cdsImprNfCFO_SUBST.Text;

  qrlCFO2.Caption := cfo;
    
  DM.cdsImprNfItem.First;

  qr.Page.LeftMargin := empresaSelecionada.margem_esq_nf;
  qr.Page.TopMargin  := empresaSelecionada.margem_sup_nf;
  qr.Prepare;

  sbPrint.Enabled := qr.QRPrinter.PageCount = 1;

  if (qr.QRPrinter.PageCount <> 1)
  and (MessageDlg('Esta nota ULTRAPASSA uma pagina. Deseja imprimir a nota?', mtWarning, [mbYes, mbNo], 0) = mrYes) then
    sbPrint.Enabled := True;

  qr.Preview;
end;

procedure TFImprimirNfiscais.QRSubDetail2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlFone1.Caption := '(' + DM.cdsImprNfDDD_FONE1.AsString +
                     ') ' + DM.cdsImprNfNUMERO_FONE1.AsString +
                    ' - ' + DM.cdsImprNfCOMPL_FONE1.AsString;
  qrlFoneCosmo.Caption := qrlFone1.Caption;

{
    qrdbtext80
  Value := '';
  if DM.cdsImprNfVLR_ICMS.Value <> 0 then
    Value := DM.cdsImprNfCFO.Text;

  if DM.cdsImprNfVLR_ICMS_SUBST.Value <> 0 then
  begin
    if Value <> '' then
      Value := Value + '/';
    Value := Value + DM.cdsImprNfCFO_SUBST.Text;
  end;
              }
end;

procedure TFImprimirNfiscais.QRDBText12Print(sender: TObject;
  var Value: String);
begin
  Insert ('-', Value, 6);
end;

procedure TFImprimirNfiscais.QRDBText5Print(sender: TObject;
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

procedure TFImprimirNfiscais.QRDBText19Print(sender: TObject;
  var Value: String);
begin
//  Value := FormatDateTime ('hh:nn', StrToDateTime(Value))
  Value := '';
end;

procedure TFImprimirNfiscais.QRDBText7Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfNUMERO.AsString <> '' then
    Value := Value + ', ' + DM.cdsImprNfNUMERO.AsString;
  if DM.cdsImprNfCOMPL_ENDERECO.AsString <> '' then
    Value := Value + ', ' + DM.cdsImprNfCOMPL_ENDERECO.AsString;
end;

procedure TFImprimirNfiscais.qrlSaidaPrint(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfENT_SAI.Value = 'E' then
    Value := '';
end;

procedure TFImprimirNfiscais.qrlEntradaPrint(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfENT_SAI.Value = 'S' then
    Value := '';
end;

procedure TFImprimirNfiscais.QRDBText3Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfBASE_ICMS.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText15Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_ICMS.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText16Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfBASE_ICMS_SUBST.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QuickRepAvisionPreview(Sender: TObject);
begin
  tag := 1;
  QRPreview1.QRPrinter := TQRPrinter(Sender);
end;

procedure TFImprimirNfiscais.sbPrinterClick(Sender: TObject);
begin
  QRPreview1.QRPrinter.PrintSetup;
end;

procedure TFImprimirNfiscais.Edit1Change(Sender: TObject);
begin
  sbPrint.Enabled := False;
end;

procedure TFImprimirNfiscais.sbCloseClick(Sender: TObject);
begin
  if tag = 1 then
    QRPreview1.QRPrinter.ClosePreview (FImprimirNfiscais);
  Close;
end;

procedure TFImprimirNfiscais.sbPrintClick(Sender: TObject);
var
  Mensagem: String;
begin
  CriaDuplicatas (True);
  TNfiscal.Create(DM.cdsImprNfNFISCAL_SQ.AsInteger).finalizar;
  if Mensagem <> '' then
  begin
    Showmessage ('Nota Fiscal não finalizada: ' + Mensagem);
    DM.EnviarEmail ('NFISCAL', 'Finalizar', Mensagem, False);
  end;

  qr.Print;
end;

procedure TFImprimirNfiscais.sbZoomInClick(Sender: TObject);
begin
  QRPreview1.Zoom := QRPreview1.Zoom + 10;
end;

procedure TFImprimirNfiscais.sbZoomOutClick(Sender: TObject);
begin
  QRPreview1.Zoom := QRPreview1.Zoom - 10;
end;

procedure TFImprimirNfiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tag := 0;
  DM.cdsImprNf.Close;
  DM.cdsImprNfItem.Close;
end;

procedure TFImprimirNfiscais.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfDTSAIDA_NFISCAL.IsNull then
    Value := '';
end;

procedure TFImprimirNfiscais.QRDBText20Print(sender: TObject;
  var Value: String);
var
  Qtde: Integer;
begin
  Qtde := DM.cdsImprNfItemqtde_item.Value;

  if (Qtde > 0) and
  (DM.cdsImprNfItemVLR_UNIT_ITEM.Value * DM.cdsImprNfCOTACAO_DOLAR.Value - DM.cdsImprNfItemVLR_IPI_ITEM.Value/Qtde <> 0) then
    Value := FloatToStrF (DM.cdsImprNfItemVLR_UNIT_ITEM.Value * DM.cdsImprNfCOTACAO_DOLAR.Value - DM.cdsImprNfItemVLR_IPI_ITEM.Value/Qtde, ffNumber, 10, 2)
    else Value := '';
end;

procedure TFImprimirNfiscais.QRDBText46Print(sender: TObject;
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

procedure TFImprimirNfiscais.QRDBText13Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_FRETE.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText25Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_SEGURO.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText28Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_DESP_ACESS.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText29Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_ICMS_SUBST.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText32Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_IPI.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText31Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_PRODUTOS.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText30Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfVLR_TOTAL.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText17Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfItemVLR_TOTAL_ITEM.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText34Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfItemALIQ_ICMS_ITEM.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText33Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfItemALIQ_IPI_ITEM.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText27Print(sender: TObject;
  var Value: String);
begin
  if DM.cdsImprNfItemVLR_IPI_ITEM.Value = 0
    then Value := '';
end;

procedure TFImprimirNfiscais.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    sbClose.Click;
  end;
end;

procedure TFImprimirNfiscais.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  Value := DM.cdsImprNfItemCODIGO_PRODUTO.Value + ' - ' +
           DM.cdsImprNfItemDESCRICAO_PRODUTO.Value;
end;

procedure TFImprimirNfiscais.QRDBText50Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText56Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText55Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText54Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText53Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText52Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText51Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := '';
end;

procedure TFImprimirNfiscais.QRDBText14Print(sender: TObject;
  var Value: String);
begin
  if StrtoInt (Value) < 3001 then
    Value := '';
end;

procedure TFImprimirNfiscais.QRDBText58Print(sender: TObject;
  var Value: String);
begin
  if StrtoInt (Value) < 3001 then
    Value := '';
end;

procedure TFImprimirNfiscais.FormActivate(Sender: TObject);
begin
  Margens.Caption := 'Margem esquerda (' + FloattoStrf(empresaSelecionada.margem_esq_nf, ffFixed, 2, 2) + ') Margem superior (' + FloattoStrf(empresaSelecionada.margem_sup_nf, ffFixed, 2, 2) + ')';
end;

procedure TFImprimirNfiscais.QRLabel1Print(sender: TObject;
  var Value: String);
var
  Qtde: Integer;
begin
  Qtde := DM.cdsImprNfItemqtde_item.Value;

  if Qtde = 0 then
    Value := ''
  else
    Value := IntToStr(Qtde);
end;

procedure TFImprimirNfiscais.FormCreate(Sender: TObject);
begin
  qr := QuickRepAvision;

  QRPreview1.BringToFront;
  QuickRepAvision.SendToBack;
  QuickRepCosmo.SendToBack;
end;

procedure TFImprimirNfiscais.QRDBText109Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := ''
  else Value := 'A - ' + Value;
end;

procedure TFImprimirNfiscais.QRDBText115Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := ''
  else Value := 'B - ' + Value;
end;

procedure TFImprimirNfiscais.QRDBText114Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := ''
  else Value := 'C - ' + Value;
end;

procedure TFImprimirNfiscais.QRDBText113Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := ''
  else Value := 'D - ' + Value;
end;

procedure TFImprimirNfiscais.QRDBText112Print(sender: TObject;
  var Value: String);
begin
  Value := '';

  if DM.cdsImprNfCLASS_FISCAL1.Value  <> 0 then Value := 'A-' + DM.cdsImprNfClass_FISCAL1.AsString;
  if DM.cdsImprNfCLASS_FISCAL2.Value  <> 0 then Value := Value + '; B-' + DM.cdsImprNfClass_FISCAL2.AsString;
  if DM.cdsImprNfCLASS_FISCAL3.Value  <> 0 then Value := Value + '; C-' + DM.cdsImprNfClass_FISCAL3.AsString;
  if DM.cdsImprNfCLASS_FISCAL4.Value  <> 0 then Value := Value + '; D-' + DM.cdsImprNfClass_FISCAL4.AsString;
  if DM.cdsImprNfCLASS_FISCAL5.Value  <> 0 then Value := Value + '; E-' + DM.cdsImprNfClass_FISCAL5.AsString;
  if DM.cdsImprNfCLASS_FISCAL6.Value  <> 0 then Value := Value + '; F-' + DM.cdsImprNfClass_FISCAL6.AsString;
  if DM.cdsImprNfCLASS_FISCAL7.Value  <> 0 then Value := Value + '; G-' + DM.cdsImprNfClass_FISCAL7.AsString;
  if DM.cdsImprNfCLASS_FISCAL8.Value  <> 0 then Value := Value + '; H-' + DM.cdsImprNfClass_FISCAL8.AsString;
  if DM.cdsImprNfCLASS_FISCAL9.Value  <> 0 then Value := Value + '; I-' + DM.cdsImprNfClass_FISCAL9.AsString;
  if DM.cdsImprNfCLASS_FISCAL10.Value <> 0 then Value := Value + '; J-' + DM.cdsImprNfClass_FISCAL10.AsString;
  if DM.cdsImprNfCLASS_FISCAL11.Value <> 0 then Value := Value + '; K-' + DM.cdsImprNfClass_FISCAL11.AsString;
  if DM.cdsImprNfCLASS_FISCAL12.Value <> 0 then Value := Value + '; L-' + DM.cdsImprNfClass_FISCAL12.AsString;
  if DM.cdsImprNfCLASS_FISCAL13.Value <> 0 then Value := Value + '; M-' + DM.cdsImprNfClass_FISCAL13.AsString;
  if DM.cdsImprNfCLASS_FISCAL14.Value <> 0 then Value := Value + '; N-' + DM.cdsImprNfClass_FISCAL14.AsString;
  if DM.cdsImprNfCLASS_FISCAL15.Value <> 0 then Value := Value + '; O-' + DM.cdsImprNfClass_FISCAL15.AsString;
  if DM.cdsImprNfCLASS_FISCAL16.Value <> 0 then Value := Value + '; P-' + DM.cdsImprNfClass_FISCAL16.AsString;
  if DM.cdsImprNfCLASS_FISCAL17.Value <> 0 then Value := Value + '; Q-' + DM.cdsImprNfClass_FISCAL17.AsString;
  if DM.cdsImprNfCLASS_FISCAL18.Value <> 0 then Value := Value + '; R-' + DM.cdsImprNfClass_FISCAL18.AsString;
  if DM.cdsImprNfCLASS_FISCAL19.Value <> 0 then Value := Value + '; S-' + DM.cdsImprNfClass_FISCAL19.AsString;
  if DM.cdsImprNfCLASS_FISCAL20.Value <> 0 then Value := Value + '; T-' + DM.cdsImprNfClass_FISCAL20.AsString;
  if DM.cdsImprNfCLASS_FISCAL21.Value <> 0 then Value := Value + '; U-' + DM.cdsImprNfClass_FISCAL21.AsString;
  if DM.cdsImprNfCLASS_FISCAL22.Value <> 0 then Value := Value + '; V-' + DM.cdsImprNfClass_FISCAL22.AsString;
  if DM.cdsImprNfCLASS_FISCAL23.Value <> 0 then Value := Value + '; X-' + DM.cdsImprNfClass_FISCAL23.AsString;
  if DM.cdsImprNfCLASS_FISCAL24.Value <> 0 then Value := Value + '; Z-' + DM.cdsImprNfClass_FISCAL24.AsString;
end;

procedure TFImprimirNfiscais.QRDBText111Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := ''
  else Value := 'F - ' + Value;
end;

procedure TFImprimirNfiscais.QRDBText110Print(sender: TObject;
  var Value: String);
begin
  if Value = '0' then Value := ''
  else Value := 'G - ' + Value;
end;

end.
