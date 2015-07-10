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
    QuickRep1: TQuickRep;
    sdItens: TQRSubDetail;
    sdCabecalho: TQRSubDetail;
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
    qbMensagem: TQRBand;
    cbRodape: TQRChildBand;
    QRDBText57: TQRDBText;
    cbNrSerie: TQRChildBand;
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
    procedure sdCabecalhoBeforePrint(Sender: TQRCustomBand;
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
    procedure sbPrinterClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
    procedure sbPrintClick(Sender: TObject);
    procedure sbZoomInClick(Sender: TObject);
    procedure sbZoomOutClick(Sender: TObject);
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbPreviewClick(Sender: TObject);
    procedure QuickRep1Preview(Sender: TObject);
  private
    NrSerie: String;

    procedure CriaDuplicatas (Grava: Boolean);
  public
    function PreparaImpressao(NrNota: Integer): Boolean;
    { Public declarations }
  end;

var
  FImprimirNfiscais: TFImprimirNfiscais;

implementation

uses UDM;

{$R *.DFM}

procedure TFImprimirNfiscais.CriaDuplicatas;
begin
  DM.CriaDuplicatas(Grava, DM.cdsImprNfNFISCAL_SQ.AsInteger);

  qrlnfat1.Caption := DM.Numero1;
  qrlvfat1.Caption := FloattoStrf (StrtoFloat (DM.Valor1), ffNumber, 10, 2);
  qrldfat1.Caption := DM.Data1;

  qrlnfat2.Caption := DM.Numero2;
  qrlvfat2.Caption := FloattoStrf (StrtoFloat (DM.Valor2), ffNumber, 10, 2);
  qrldfat2.Caption := DM.Data2;

  qrlnfat3.Caption := DM.Numero3;
  qrlvfat3.Caption := FloattoStrf (StrtoFloat (DM.Valor3), ffNumber, 10, 2);
  qrldfat3.Caption := DM.Data3;

  if DM.Valor1 = '0' then qrlvfat1.Caption := '';
  if DM.Valor1 = ''  then qrlnfat1.Caption := '';
  if DM.Valor1 = ''  then qrldfat1.Caption := '';

  if DM.Valor2 = '0' then qrlvfat2.Caption := '';
  if DM.Valor2 = ''  then qrlnfat2.Caption := '';
  if DM.Valor2 = ''  then qrldfat2.Caption := '';

  if DM.Valor3 = '0' then qrlvfat3.Caption := '';
  if DM.Valor3 = ''  then qrlnfat3.Caption := '';
  if DM.Valor3 = ''  then qrldfat3.Caption := '';
end;

procedure TFImprimirNfiscais.sdCabecalhoBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  qrlFone1.Caption := '(' + DM.cdsImprNfDDD_FONE1.AsString +
                     ') ' + DM.cdsImprNfNUMERO_FONE1.AsString +
                    ' - ' + DM.cdsImprNfCOMPL_FONE1.AsString;
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
  Close;
end;

procedure TFImprimirNfiscais.sbPrintClick(Sender: TObject);
var
  Mensagem: String;
begin
  CriaDuplicatas (True);
  Mensagem := DM.SCServer.AppServer.FinalizaNfiscal(DM.cdsImprNfNFISCAL_SQ.AsInteger, DM.useq);
  if Mensagem <> '' then
  begin
    Showmessage ('Nota Fiscal não finalizada: ' + Mensagem);
    DM.EnviarEmail ('NFISCAL', 'Finalizar', Mensagem, False);
  end;

  QuickRep1.Print;
end;

procedure TFImprimirNfiscais.sbZoomInClick(Sender: TObject);
begin
  QRPreview1.Zoom := QRPreview1.Zoom + 10;
end;

procedure TFImprimirNfiscais.sbZoomOutClick(Sender: TObject);
begin
  QRPreview1.Zoom := QRPreview1.Zoom - 10;
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
  Qtde := DM.cdsImprNfItemQTDE_ITEM_LOJA.Value+DM.cdsImprNfItemQTDE_ITEM_ARMAZEM.Value+DM.cdsImprNfItemQTDE_ITEM_DEMO.Value;

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
  Margens.Caption := 'Margem esquerda (' + FloattoStrf(DM.margem_esq_nf, ffFixed, 2, 2) + ') Margem superior (' + FloattoStrf(DM.margem_sup_nf, ffFixed, 2, 2) + ')';
  if Edit1.Text <> '' then
    bbPreviewClick(Self);
end;

procedure TFImprimirNfiscais.QRLabel1Print(sender: TObject;
  var Value: String);
var
  Qtde: Integer;
begin
  Qtde := DM.cdsImprNfItemQTDE_ITEM_LOJA.Value+DM.cdsImprNfItemQTDE_ITEM_ARMAZEM.Value+DM.cdsImprNfItemQTDE_ITEM_DEMO.Value;
  if Qtde = 0 then
    Value := ''
  else
    Value := IntToStr(Qtde);
end;

procedure TFImprimirNfiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tag = 1 then
    QRPreview1.QRPrinter.ClosePreview (FImprimirNfiscais);
  tag := 0;
  DM.cdsImprNf.Close;
  DM.cdsImprNfItem.Close;
end;

procedure TFImprimirNfiscais.bbPreviewClick(Sender: TObject);
begin
  if PreparaImpressao(StrtoInt(Edit1.Text)) then
    QuickRep1.Preview;
end;

function TFImprimirNfiscais.PreparaImpressao;
begin
  if tag = 1 then
  begin
    tag := 0;
    QRPreview1.QRPrinter.ClosePreview (FImprimirNfiscais);
  end;

  DM.cdsImprNf.Close;
  DM.cdsImprNf.Params.ParamByName ('NUMERO_NFISCAL').Value :=NrNota;
  DM.cdsImprNf.Open;
  DM.cdsImprNfItem.Close;
  DM.cdsImprNfItem.Params.ParamByName ('NFISCAL_SQ').Value := DM.cdsImprNfNFISCAL_SQ.Value;
  DM.cdsImprNfItem.Open;

  CriaDuplicatas (False);

  DM.cdsImprNfItem.First;
  NrSerie := '';
  While Not DM.cdsImprNfItem.Eof do
  begin
    if DM.cdsImprNfItemNR_SERIE_ITEM.AsString <> '' then
    begin
      if NrSerie <> '' then NrSerie := NrSerie + chr(13);
      NrSerie := NrSerie + 'N.Serie ' + DM.cdsImprNfItemCODIGO_PRODUTO.AsString + ': ' + DM.cdsImprNfItemNR_SERIE_ITEM.Value;
    end;
    DM.cdsImprNfItem.Next;
  end;
  qrlNSerie.Caption := NrSerie;
  DM.cdsImprNfItem.First;

  QuickRep1.Page.LeftMargin := DM.margem_esq_nf;
  QuickRep1.Page.TopMargin  := DM.margem_sup_nf;
{
  QuickRep1.Prepare;
  Result := QuickRep1.QRPrinter.PageCount = 1;
  QuickRep1.QRPrinter.Free;
  QuickRep1.QRPrinter := nil;
}

  result := true;
  if not Result then
    ShowMessage('Esta nota ultrapassou o limite da pagina, por favor, altera-a antes de imprimir.')
  else
    sbPrint.Enabled := True;
end;

procedure TFImprimirNfiscais.QuickRep1Preview(Sender: TObject);
begin
  tag := 1;
  QRPreview1.QRPrinter := TQRPrinter(Sender);
end;

end.
