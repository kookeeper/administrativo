unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBClient, StdCtrls, RzButton, IBCustomDataSet,
  IBDatabase, IBTable, DelphiTwain, RzShellDialogs, IdMessage,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP;

type
  TFPrincipal = class(TForm)
    imgEmail: TImage;
    imgImp: TImage;
    imgPen: TImage;
    btnUsuarios: TRzBitBtn;
    btnParametros: TRzBitBtn;
    IBDatabase1: TIBDatabase;
    ibParametros: TIBTable;
    ibUsuarios: TIBTable;
    IBTransaction1: TIBTransaction;
    ibUsuariosCODIGOUSUARIO: TIBStringField;
    ibUsuariosNOMEUSUARIO: TIBStringField;
    ibUsuariosSALDOATUAL: TIBBCDField;
    ibUsuariosEMAIL: TIBStringField;
    Twain: TDelphiTwain;
    btnSair: TRzBitBtn;
    IdSMTP1: TIdSMTP;
    Msg: TIdMessage;
    ibParametrosemailHost: TIBStringField;
    ibParametrosemailPorta: TIntegerField;
    ibParametrosEMAILUSUARIO: TIBStringField;
    ibParametrosEMAILSENHA: TIBStringField;
    ibParametrosIMPRESSORAPADRAO: TIBStringField;
    ibParametrosEMAILNOME: TIBStringField;
    ibParametrosEMAILENDERECO: TIBStringField;
    ibParametrosEMAILASSUNTO: TIBStringField;
    ibParametrosEMAILCORPO: TIBStringField;
    ibParametrosScannerPadrao: TStringField;
    ibParametrossequenciaArquivo: TIntegerField;
    RzSaveDialog1: TRzSaveDialog;
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnParametrosClick(Sender: TObject);
    procedure imgPenClick(Sender: TObject);
    procedure imgImpClick(Sender: TObject);
    procedure imgEmailClick(Sender: TObject);
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure EnviarEmail;
    procedure Imprimir;
    procedure GerarPDF;
    procedure ProximoArquivo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrincipal: TFPrincipal;
  arquivoBMP, arquivoPDF, arquivoZIP, FTipo: String;

  procedure Scanear;

implementation

uses Parametros, Usuarios, printers, ZipaArquivo, Scanner, tnpdf;

{$R *.dfm}

procedure Scanear;
var
  i, SelectedSource: Integer;
begin
  {It is always recommended to load library dynamically, never forcing}
  {final user to have twain installed}
  if FPrincipal.Twain.LoadLibrary then
  begin
    {Load source manager}
    FPrincipal.Twain.SourceManagerLoaded := TRUE;

//    {Allow user to select source}
//    SelectedSource := FPrincipal.Twain.SelectSource;

    FPrincipal.ibParametros.Open;

    for i := 0 to FPrincipal.Twain.SourceCount - 1 do
      if FPrincipal.TWain.Source[i].ProductName = FPrincipal.ibParametrosScannerPadrao.AsString then
        Break;

    SelectedSource := i;

    if SelectedSource <> -1 then
    begin
      {Load source, select transference method and enable (display interface)}
      FPrincipal.Twain.Source[SelectedSource].Loaded := TRUE;
      FPrincipal.Twain.Source[SelectedSource].TransferMode := ttmMemory;
      FPrincipal.Twain.Source[SelectedSource].Enabled := TRUE;
    end {if SelectedSource <> -1}

  end
  else
    showmessage('Twain is not installed.');
end;

{Image acquired}
procedure TFPrincipal.TwainTwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
  ProximoArquivo;
  Image.SaveToFile(arquivoBMP);
  GerarPDF;
  if (FTipo = 'pen') and
     (RzSaveDialog1.Execute) then
    if (not FileExists(RzSaveDialog1.FileName)) or
       (MessageDlg(RzSaveDialog1.FileName + ' ja existe.' + chr(13) + 'deseja substitui-lo?', mtConfirmation, mbOKCancel, 0) = mrOk) then
        CopyFile(PAnsiChar(arquivoPDF), PAnsiChar(RzSaveDialog1.FileName), False);

  if FTipo = 'imp' then
    Imprimir;

  if FTipo = 'email' then
    EnviarEmail;

//  Cancel := TRUE;  {Only want one image}
end;

procedure TFPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  try
    IBDatabase1.Connected := True;
  except
    try
      IBDatabase1.DatabaseName := ExtractFilePath(Application.ExeName) + 'SCANNERS.FDB';
      IBDatabase1.Connected := True;
    except on e: exception do
      begin
        showmessage(e.message);
        Halt;
      end;
    end;
  end;

  ibParametros.Open;
  ibUsuarios.Open;
  if ibParametros.Eof then
    ibParametros.Append;
end;

procedure TFPrincipal.EnviarEmail;

  procedure Troca(var s1: String; s2, s3: String);
  begin
    if Pos (s2, UpperCase(s1)) > 0 then
    begin
      Insert(s3, s1, Pos (s2, UpperCase(s1)));
      Delete(s1, Pos (s2, UpperCase(s1)), length(s2));
    end;
  end;

var
  assunto, corpo: String;
  anexos: TStringList;
begin
  With IdSMTP1 do
  try
    if Connected then
     Disconnect;
    Host     := FPrincipal.ibParametrosemailHost.AsString;
    Port     := FPrincipal.ibParametrosemailPorta.AsInteger;
    Username := FPrincipal.ibParametrosemailUsuario.AsString;
    Password := FPrincipal.ibParametrosemailSenha.AsString;
    Connect();
    if Connected then
    begin
      assunto := FPrincipal.ibParametrosemailAssunto.AsString;
      Troca(assunto, '%NOME%', FPrincipal.ibUsuariosnomeUsuario.AsString);
      Troca(assunto, '%CODIGO%', FPrincipal.ibUsuarioscodigoUsuario.AsString);

      corpo := FPrincipal.ibParametrosemailCorpo.AsString;
      Troca(corpo, '%NOME%', FPrincipal.ibUsuariosnomeUsuario.AsString);
      Troca(corpo, '%CODIGO%', FPrincipal.ibUsuarioscodigoUsuario.AsString);

      Msg.From.Address := FPrincipal.ibParametrosemailEndereco.AsString;
      Msg.From.Name    := FPrincipal.ibParametrosemailNome.AsString;
      Msg.Recipients.Clear;
      Msg.Recipients.Add;
      Msg.Recipients.Items[0].Address := FPrincipal.ibUsuariosemail.AsString;
      Msg.Recipients.Items[0].Name    := FPrincipal.ibUsuariosnomeUsuario.AsString;
      Msg.Body.Clear;
      Msg.Subject := assunto;
      Msg.Body.Add (corpo);
      anexos := TStringList.Create;
      anexos.Add(arquivoPDF);
      ZipFiles(arquivoZIP, anexos, Self);
      FreeAndNil(Memo);

      TIdAttachment.Create(Msg.MessageParts, arquivoZIP);
      FreeAndNil(anexos);

      Send(Msg);
      MessageDlg('E-mail enviado!', mtInformation, [mbOk], 0);
      Disconnect;
    end
    else
      MessageDlg('Não foi possível conectar com o servidor de email!', mtInformation, [mbOK], 0);
  except
    MessageDlg('Erro ao tentar enviar email!', mtWarning, [mbOK], 0);
  end;
end;

procedure TFPrincipal.Imprimir;
var
  bmp: TBitmap;
  x, y{, WDPI, HDPI}: Integer;
begin
  try
    Printer.PrinterIndex := Printer.Printers.IndexOf(FPrincipal.ibParametrosimpressoraPadrao.AsString);
  except
    Showmessage('Por favor, selecione uma impressora!');
    Exit;
  end;

  try
    bmp := TBitmap.Create;
    bmp.LoadFromFile(arquivoBMP);

    Printer.BeginDoc;

    x := bmp.Width * 6;
    y := bmp.Height * 6;

{
    HDPI := Printer.PageHeight div 8;
    WDPI := Printer.PageWidth div 8;
    x := Printer.PageWidth - Round(WDPI * 0.4); //0.4" margem direita
    y := Printer.PageHeight - Round(HDPI * 0.5); //0.5" Altura do rodapé
}

    Printer.Canvas.StretchDraw(Rect(0,0,x,y), bmp);
  finally
    Printer.EndDoc;
  end;
end;

procedure TFPrincipal.GerarPDF;
var
  PDF : TPrintPDF; //Componente PRINTPDF
//  N,L : Integer;
  {aDest, }imagem: TBitmap;
  aDest: TImage;
begin
  Try
    try
      PDF:=TPrintPDF.Create(self);
      If ArquivoBMP <> '' then
      begin
{
        imagem := TBitmap.Create;
        imagem.LoadFromFile(ArquivoBMP);
}

        aDest := TImage.Create(Self);
        aDest.Picture.LoadFromFile(ArquivoBMP);
{
        aDest:= tbitmap.create;
        aDest.Width := 612;
        aDest.Height := 792;
        aDest.Canvas.StretchDraw(Rect(0, 0, aDest.width, aDest.Height), imagem);
}
        //Cria o componente TPrintPDF
        PDF:=TPrintPDF.Create(self);

        //Define um título ao Documento PDF
//        PDF.TITLE := 'Geração de Arquivos PDF com Delphi';

        //Define o tamanho da página do Documento PDF
        PDF.PageWidth:= 612;
        PDF.PageHeight:= 792;

        //Define o Nome do Documento PDF
        PDF.FileName := arquivoPDF;

        //Inicia o Documento
        PDF.BeginDoc;

        PDF.Draw(0,0,aDest);

        //Encerra o documento PDF
        PDF.EndDoc;

//        Application.MessageBox('Documento PDF gerado com sucesso!','ActiveDelphi -          PDF',Mb_OK + Mb_IconInformation); //Em uma só linha
      end;
    Except //Se ocorrer algum erro ao gerar o PDF
      Application.MessageBox('Ocorreu um erro ao gerar Documento PDF!','ActiveDelphi -       PDF ',Mb_OK + Mb_IconHand); //Em uma só linha
    end;
  finally
    //Libera o componente PDF
    FreeAndNil(PDF);
    FreeAndNil(aDesT);
    FreeAndNil(imagem);
  end;
end; 

procedure TFPrincipal.btnUsuariosClick(Sender: TObject);
begin
  try
    FCadastroUsuarios := TFCadastroUsuarios.Create(Self);
    FCadastroUsuarios.ShowModal;
  finally
    FreeAndNil(FCadastroUsuarios);
  end;
end;

procedure TFPrincipal.btnParametrosClick(Sender: TObject);
begin
  try
    FParametros := TFParametros.Create(Self);
    FParametros.ShowModal;
  finally
    FreeAndNil(FParametros);
  end;
end;

procedure TFPrincipal.imgPenClick(Sender: TObject);
begin
  FTipo := 'pen';
  try
    FScanner := TFScanner.Create(Self);
    FScanner.ShowModal;
  finally
    FreeAndNil(FScanner);
  end;
end;

procedure TFPrincipal.imgImpClick(Sender: TObject);
begin
  FTipo := 'imp';
  try
    FScanner := TFScanner.Create(Self);
    FScanner.ShowModal;
  finally
    FreeAndNil(FScanner);
  end;
end;

procedure TFPrincipal.imgEmailClick(Sender: TObject);
begin
  FTipo := 'email';
  try
    FScanner := TFScanner.Create(Self);
    FScanner.ShowModal;
  finally
    FreeAndNil(FScanner);
  end;
end;

procedure TFPrincipal.ProximoArquivo;
begin
  arquivoBMP := ExtractFilePath(Application.ExeName) + 'img' + FormatFloat('000', ibParametrossequenciaArquivo.AsInteger + 1) + '.bmp';
  arquivoPDF := ExtractFilePath(Application.ExeName) + 'img' + FormatFloat('000', ibParametrossequenciaArquivo.AsInteger + 1) + '.pdf';
  arquivoZIP := ExtractFilePath(Application.ExeName) + 'img' + FormatFloat('000', ibParametrossequenciaArquivo.AsInteger + 1) + '.zip';

  ibParametros.Edit;
  ibParametrossequenciaArquivo.AsInteger := ibParametrossequenciaArquivo.AsInteger + 1;
  ibParametros.Post;
end;

end.

