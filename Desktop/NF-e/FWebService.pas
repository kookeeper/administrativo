unit FWebService;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, ExtCtrls, ACBrNFe, OleCtrls, SHDocVw,
  ComCtrls, Buttons, ACBrNFeDANFEClass, ACBrNFeDANFERave, pcnNFeW,
  RpDefine, RpRave, pcnNFe;

const
  SELDIRHELP = 1000;

type
  TformWebService = class(TForm)
    Timer1: TTimer;
    ACBrNFe1: TACBrNFe;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox2: TGroupBox;
    Label25: TLabel;
    sbtnGetCert: TSpeedButton;
    edtNumSerie: TEdit;
    TabSheet2: TTabSheet;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    sbtnLogoMarca: TSpeedButton;
    edtLogoMarca: TEdit;
    rgTipoDanfe: TRadioGroup;
    rgFormaEmissao: TRadioGroup;
    TabSheet3: TTabSheet;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    ckVisualizar: TCheckBox;
    cbUF: TComboBox;
    rgTipoAmb: TRadioGroup;
    gbProxy: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edtProxyHost: TEdit;
    edtProxyPorta: TEdit;
    edtProxyUser: TEdit;
    edtProxySenha: TEdit;
    btnSalvarConfig: TBitBtn;
    Panel2: TPanel;
    PageControl2: TPageControl;
    TabSheet5: TTabSheet;
    MemoResp: TMemo;
    TabSheet6: TTabSheet;
    WBResposta: TWebBrowser;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    edDirEntrada: TEdit;
    sbtnPathSalvar: TSpeedButton;
    edDirSaida: TEdit;
    SpeedButton1: TSpeedButton;
    edDirXML: TEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    rgNomeArquivo: TRadioGroup;
    ACBrNFeDANFERave1: TACBrNFeDANFERave;
    TimerCartaCorrecao: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure sbtnGetCertClick(Sender: TObject);
    procedure ACBrNFe1StatusChange(Sender: TObject);
    procedure sbtnLogoMarcaClick(Sender: TObject);
    procedure sbtnPathSalvarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerCartaCorrecaoTimer(Sender: TObject);
  private
    Campos, Valores: TStringList;
    itens, itensAdicao, transps, reboques, dups, obsConts, volumes, recibo: Integer;
    nomeArquivoNumero, nomeArquivoChave, motivoCancelamento: String;

    function Campo(_campo: String): String;
    function CampoI(_campo: String): Integer;
    function CampoD(_campo: String): TDateTime;
    function CampoF(_campo: String): Double;
    function TemAtributo(Attr, Val: Integer): Boolean;
    procedure LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
    procedure CarregaVariaveis(nomeArquivo: String);
    procedure LerConfiguracao;
    procedure GravarConfiguracao;
    function QuebraLinha(Str: String): String;
    procedure ImprimirDANFE(xml: String);
    procedure CriaSubDir(const NomeDiretorio: string);
//    procedure GeraCCe(nomeArquivo: String);
    procedure CarregaVariaveisCCe(nomeArquivo: String);
    { Private declarations }
  public
    procedure GeraNFe(nomeArquivo: String);
    { Public declarations }
  end;

var
  formWebService: TformWebService;

implementation

uses pcnConversao, IniFiles, ufrmStatus, ACBrNFeWebServices,
  pcnLeitor, Registry, pcnAuxiliar, pcnCCeNFe, TypInfo, DateUtils;

{$R *.dfm}

function TformWebService.Campo(_campo: String): String;
begin
  if Campos.IndexOf(UpperCase(_campo))<0 then
    result := ''
  else
    result := Valores[Campos.IndexOf(UpperCase(_campo))]
end;

function TformWebService.CampoI(_campo: String): Integer;
begin
  result := StrToIntDef(Campo(_campo), 0);
end;

function TformWebService.CampoD(_campo: String): TDateTime;
begin
  result := StrToDateTimeDef(Campo(_campo), 0);
end;

function TformWebService.CampoF(_campo: String): Double;
begin
  result := StrToFloatDef(Campo(_campo), 0);
end;

procedure TformWebService.Timer1Timer(Sender: TObject);
  var
    F: TSearchRec;
    fResposta: TextFile;
    Ret: Integer;
    arqID, arqXML, arqTXT: String;
    notaEmitida, notaCancelada, criou, cancelamento: Boolean;
begin
  Timer1.Enabled := False;

  try
    if edtNumSerie.Text = '' then
      Exit;

    if edDirEntrada.Text = '' then
      Exit;

    if edDirSaida.Text = '' then
      Exit;

    CriaSubDir(edDirEntrada.Text + '\backup');
    CriaSubDir(edDirSaida.Text + '\backup');
{
    if not DirectoryExists(edDirEntrada.Text + '\backup') then
    begin
      criou := CreateDir(edDirEntrada.Text+'\backup');
      if not criou then
        Showmessage('não foi possível criar o diretorio "' + edDirEntrada.Text + '\backup"');
    end;
}
    try
      Ret := FindFirst(edDirEntrada.Text+'\*.txt', faAnyFile, F);
      while Ret = 0 do
      begin
        if not TemAtributo(F.Attr, faDirectory) then
        begin
          ACBrNFe1.NotasFiscais.Clear;
          geraNFe(edDirEntrada.Text+'\'+F.Name);
          cancelamento := motivoCancelamento <> '';

          ACBrNFe1.NotasFiscais.Assinar;

          nomeArquivoNumero := edDirSaida.Text + '\' + FormatFloat('000000000', ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
          nomeArquivoChave  := edDirSaida.Text + '\' + copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, (length(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)-44)+1, 44);

          if rgNomeArquivo.ItemIndex = 0 then
            arqTXT := nomeArquivoChave
          else
            arqTXT := nomeArquivoNumero;

          if not DirectoryExists(edDirSaida.Text) then
          begin
            criou := CreateDir(edDirSaida.Text);
            if not criou then
              Showmessage('não foi possível criar o diretorio "' + edDirSaida.Text);
          end;

          ACBrNFe1.Consultar;

          notaEmitida := ACBrNFe1.WebServices.Consulta.cStat = 100;
          notaCancelada := ACBrNFe1.WebServices.Consulta.cStat = 101;

          if (cancelamento and notaCancelada) or ((not cancelamento) and notaEmitida) then
          try
            // nota fiscal ja cancelada na SEFAZ ou nota fiscal já emitida na SEFAZ.

            DeleteFile(edDirEntrada.Text+'\backup\'+F.Name);
            MoveFile(PAnsiChar(edDirEntrada.Text+'\'+F.Name), pAnsiChar(edDirEntrada.Text+'\backup\'+F.Name));

            AssignFile(fResposta, arqTXT);
            Rewrite(fResposta);
            Writeln(fResposta, ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cNF); // numero da nota
            Writeln(fResposta, ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID); //chave da nota
            Writeln(fResposta, ''); // recibo do lote

            if ACBrNFe1.WebServices.Consulta.NFeChave <> ACBrNFe1.WebServices.Consulta.protNFe.chNFe then
              raise Exception.Create('Falha: A chave informada (' + ACBrNFe1.WebServices.Consulta.NFeChave +
                ') é diferente da chave na SEFAZ (' + ACBrNFe1.WebServices.Consulta.protNFe.chNFe + ')');

            Writeln(fResposta, ACBrNFe1.WebServices.Consulta.xMotivo);
            Writeln(fResposta, UTF8Encode(ACBrNFe1.WebServices.Consulta.Protocolo));

            MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.Consulta.xMotivo);
            MemoResp.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Consulta.Protocolo));

            ACBrNFe1.NotasFiscais.SaveToFile(edDirSaida.Text + '\');

            arqID := nomeArquivoChave;

            if rgNomeArquivo.ItemIndex = 1 then
              arqXML := nomeArquivoNumero + '.xml'
            else
              arqXML := nomeArquivoChave + '.xml';

            DeleteFile(arqXml);
            RenameFile(arqID + '-NFe.xml', arqXML);

            LoadXML(MemoResp, WBResposta);
            CloseFile(fResposta);

            DeleteFile(arqTXT + '.txt');
            RenameFile(arqTXT, arqTXT + '.txt');

            if ACBrNFe1.NotasFiscais.Items[0].Confirmada then
              ImprimirDANFE(arqXML);

            Ret := FindNext(F);
            continue;
          except on E: Exception do
            begin
              Writeln(fResposta, E.Message);
              CloseFile(fResposta);
              DeleteFile(arqTXT + '.txt');
              RenameFile(arqTXT, arqTXT + '.txt');

              Ret := FindNext(F);
              continue;
            end;
          end;

          ACBrNFe1.NotasFiscais.Clear;
          geraNFe(edDirEntrada.Text+'\'+F.Name);

          DeleteFile(edDirEntrada.Text+'\backup\'+F.Name);
          MoveFile(PAnsiChar(edDirEntrada.Text+'\'+F.Name), pAnsiChar(edDirEntrada.Text+'\backup\'+F.Name));

          if recibo <> 0 then
          begin
            ACBrNFe1.WebServices.Recibo.Recibo := IntToStr(recibo);
            ACBrNFe1.WebServices.Recibo.Executar;
          end
          else
          if ACBrNFe1.NotasFiscais.Count > 0 then
          try
            ACBrNFe1.NotasFiscais.GerarNFe;

            AssignFile(fResposta, arqTXT);
            Rewrite(fResposta);
            Writeln(fResposta, ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.cNF); // numero da nota
            Writeln(fResposta, ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID); //chave da nota
            Writeln(fResposta, ACBrNFe1.WebServices.Recibo.Recibo); // recibo do lote

            if motivoCancelamento = '' then
            begin
              ACBrNFe1.Enviar(0, False);

              Writeln(fResposta, ACBrNFe1.WebServices.Retorno.xMotivo);
              Writeln(fResposta, UTF8Encode(ACBrNFe1.WebServices.Retorno.Protocolo));

              MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.Retorno.xMotivo);
              MemoResp.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Retorno.Protocolo));
            end
            else
            begin
              ACBrNFe1.Cancelamento(motivoCancelamento);

              Writeln(fResposta, ACBrNFe1.WebServices.Cancelamento.xMotivo);
              Writeln(fResposta, ACBrNFe1.WebServices.Cancelamento.Protocolo);

              MemoResp.Lines.Text :=  UTF8Encode(ACBrNFe1.WebServices.Cancelamento.xMotivo);
              MemoResp.Lines.Add(UTF8Encode(ACBrNFe1.WebServices.Cancelamento.Protocolo));
            end;

            ACBrNFe1.NotasFiscais.SaveToFile(edDirSaida.Text + '\');

            arqID := nomeArquivoChave;

            if rgNomeArquivo.ItemIndex = 1 then
              arqXML := nomeArquivoNumero + '.xml'
            else
              arqXML := nomeArquivoChave + '.xml';

            DeleteFile(arqXML);
            RenameFile(arqID + '-NFe.xml', arqXML);

            LoadXML(MemoResp, WBResposta);
            CloseFile(fResposta);

            DeleteFile(arqTXT + '.txt');
            RenameFile(arqTXT, arqTXT + '.txt');

            if ACBrNFe1.NotasFiscais.Items[0].Confirmada then
              ImprimirDANFE(arqXML);
          except on E: Exception do
            begin
              ACBrNFe1.NotasFiscais.SaveToFile(edDirSaida.Text + '\');
              Writeln(fResposta, E.Message);
              CloseFile(fResposta);
              DeleteFile(arqTXT + '.txt');
              RenameFile(arqTXT, arqTXT + '.txt');
            end;
          end;
        end;
        Ret := FindNext(F);
      end;
    except on e: exception do
      showmessage(e.message);
    end;
  finally
    FindClose(F);
    Timer1.Enabled := True;
  end;
end;

function TformWebService.TemAtributo(Attr, Val: Integer): Boolean;
begin
  Result := Attr and Val = Val;
end;

procedure TformWebService.LoadXML(MyMemo: TMemo; MyWebBrowser: TWebBrowser);
begin
  MyMemo.Lines.SaveToFile(ExtractFileDir(application.ExeName)+'\temp.xml');
  MyWebBrowser.Navigate(ExtractFileDir(application.ExeName)+'\temp.xml');
end;

procedure TformWebService.CarregaVariaveis(nomeArquivo: String);
var
  arquivo: TextFile;
  linha, campo, valor: String;
begin
  Campos   := TStringList.Create;
  Valores  := TStringList.Create;

  itens := 0;
  itensAdicao := 0;
  transps := 0;
  reboques := 0;
  dups := 0;
  obsConts := 0;
  volumes := 0;

  try
    AssignFile(arquivo, nomeArquivo);
    Reset(arquivo);

    While not Eof(arquivo) do
    begin
      Readln(arquivo, linha);

      campo := Trim(UpperCase(Copy(linha, 1, 5)));
      valor := Trim(Copy(linha, 6, 2000));

      if UpperCase(Copy(linha, 1, 3)) = 'H02' then
      begin
        inc(itens);
        itensAdicao := 0;
      end;
      if Pos(UpperCase(Copy(linha, 1, 1)), 'HIJKLMNOPQRSTUV') > 0 then
        insert(FormatFloat('000', itens), campo, 1);

      if UpperCase(Copy(linha, 1, 3)) = 'I25' then
        inc(itensAdicao);
      if Pos(UpperCase(Copy(linha, 1, 3)), 'I26 I27 I28 I29') > 0 then
        insert(FormatFloat('000', itensAdicao), campo, 4);

      if Trim(UpperCase(linha)) = 'X22' then
        inc(reboques);
      if Pos(UpperCase(Copy(linha, 1, 3)), 'X23 X24 X25') > 0 then
        insert(FormatFloat('000', reboques), campo, 1);

      if Trim(UpperCase(linha)) = 'X26' then
        inc(volumes);
      if Pos(UpperCase(Copy(linha, 1, 3)), 'X27 X28 X29 X30 X31 X32') > 0 then
        insert(FormatFloat('000', volumes), campo, 1);

      if Trim(UpperCase(linha)) = 'Y07' then
        inc(dups);
      if Pos(UpperCase(Copy(linha, 1, 3)), 'Y08 Y09 Y10') > 0 then
        insert(FormatFloat('000', dups), campo, 1);

      if UpperCase(Copy(linha, 1, 3)) = 'Z05' then
        inc(obsConts);
      if Pos(UpperCase(Copy(linha, 1, 3)), 'Z05 Z06') > 0 then
        insert(FormatFloat('000', obsConts), campo, 1);

      Campos.Add(campo);
      Valores.Add(valor);
    end;
  finally
    CloseFile(arquivo);
  end;
end;

procedure TformWebService.CarregaVariaveisCCe(nomeArquivo: String);
var
  arquivo: TextFile;
  linha, campo, valor: String;
begin
  Campos   := TStringList.Create;
  Valores  := TStringList.Create;

  try
    AssignFile(arquivo, nomeArquivo);
    Reset(arquivo);

    While not Eof(arquivo) do
    begin
      Readln(arquivo, linha);

      campo := Trim(UpperCase(Copy(linha, 1, Pos(' ', linha))));
      valor := Trim(Copy(linha, Pos(' ', linha) + 1, 2000));

      Campos.Add(campo);
      Valores.Add(valor);
    end;
  finally
    CloseFile(arquivo);
  end;
end;

function TformWebService.QuebraLinha(Str: String): String;
Var
  x : Integer;
Begin
  result := '';
  For x := 1 to Length(Str) do
  Begin
    if Str[x] = '|' Then
      result := result + chr(13) + chr(10)
    else
      result := result + Str[x];
  end;
end;

procedure TformWebService.GeraNFe(nomeArquivo: String);
var
  i, i1, indice: Integer;
  s, s1: String;
begin
  CarregaVariaveis(nomeArquivo);

  recibo := CampoI('recib');

  if recibo <> 0 then
    exit;

  motivoCancelamento := Campo('cp09');

  with ACBrNFe1.NotasFiscais.Add.NFe do
  begin
    infNFe.ID := Campo('a03');

    Ide.cUF       := CampoI('b02');
    Ide.cNF       := CampoI('b03');
    Ide.natOp     := Campo('b04');
    Ide.indPag    := TpcnIndicadorPagamento(CampoI('b05'));
    Ide.modelo    := CampoI('b06');
    Ide.serie     := CampoI('b07');
    Ide.nNF       := CampoI('b08');
    Ide.dEmi      := CampoD('b09');
    Ide.dSaiEnt   := CampoD('b10');
    Ide.hSaiEnt   := CampoD('b10a');
    Ide.tpNF      := TpcnTipoNFe(CampoI('b11'));
    Ide.cMunFG    := CampoI('b12');

    if (Campo('b13') <> '') or (Campo('b20') <> '') then
    With Ide.NFref.Add do
    begin
      refNFe       := Campo('b13');
      RefNF.cUF    := CampoI('b15');
      RefNF.AAMM   := Campo('b16');
      RefNF.CNPJ   := Campo('b17');
      RefNF.modelo := CampoI('b18');
      RefNF.serie  := CampoI('b19');
      RefNF.nNF    := CampoI('b20');
    end;

    Ide.tpImp     := TpcnTipoImpressao(CampoI('b21')-1);
    Ide.tpEmis    := TpcnTipoEmissao(CampoI('b22')-1);
    Ide.cDV       := CampoI('b23');
    Ide.tpAmb     := TpcnTipoAmbiente(CampoI('b24')-1);
    Ide.finNFe    := TpcnFinalidadeNFe(CampoI('b25')-1);
    Ide.procEmi   := TpcnProcessoEmissao(CampoI('b26'));
    Ide.verProc   := Campo('b27');

    Emit.CNPJCPF           := Campo('c02');
    Emit.xNome             := Campo('c03');
    Emit.xFant             := Campo('c04');
    Emit.EnderEmit.xLgr    := Campo('c06');
    Emit.EnderEmit.nro     := Campo('c07');
    Emit.EnderEmit.xCpl    := Campo('c08');
    Emit.EnderEmit.xBairro := Campo('c09');
    Emit.EnderEmit.cMun    := CampoI('c10');
    Emit.EnderEmit.xMun    := Campo('c11');
    Emit.EnderEmit.UF      := Campo('c12');
    Emit.EnderEmit.CEP     := CampoI('c13');
    if CampoI('c14') > 0 then
    begin
      Emit.enderEmit.cPais   := CampoI('c14');
      Emit.enderEmit.xPais   := Campo('c15');
    end;
    Emit.EnderEmit.fone    := Campo('c16');
    Emit.IE                := Campo('c17');
    Emit.IEST              := Campo('c18');
    Emit.IM                := Campo('c19');
    Emit.CNAE              := Campo('c20');

    if CampoI('c21') = 0 then
      Emit.CRT := crtRegimeNormal
    else
      Emit.CRT := TpcnCRT(CampoI('c21') - 1);

    if Trim(Campo('e02')) <> '' then
      Dest.CNPJCPF := Campo('e02')
    else
    if Trim(Campo('e03')) <> '' then
      Dest.CNPJCPF := Campo('e03');
    Dest.xNome             := Campo('e04');
    Dest.EnderDest.xLgr    := Campo('e06');
    Dest.EnderDest.nro     := Campo('e07');
    Dest.EnderDest.xCpl    := Campo('e08');
    Dest.EnderDest.xBairro := Campo('e09');
    Dest.EnderDest.cMun    := CampoI('e10');
    Dest.EnderDest.xMun    := Campo('e11');
    Dest.EnderDest.UF      := Campo('e12');
    Dest.EnderDest.CEP     := CampoI('e13');
    if CampoI('e14') > 0 then
      Dest.EnderDest.cPais   := CampoI('e14');
    Dest.EnderDest.xPais   := Campo('e15');
    Dest.EnderDest.Fone    := Campo('e16');
    Dest.IE                := Campo('e17');
    Dest.ISUF              := Campo('e18');

    Retirada.CNPJCPF := Campo('f02');
//    Retirada.CNPJ    := Campo('f02');
    Retirada.xLgr    := Campo('f03');
    Retirada.nro     := Campo('f04');
    Retirada.xCpl    := Campo('f05');
    Retirada.xBairro := Campo('f06');
    Retirada.cMun    := CampoI('f07');
    Retirada.xMun    := Campo('f08');
    Retirada.UF      := Campo('f09');

    Entrega.CNPJCPF := Campo('g02');
//    Entrega.CNPJ    := Campo('g02');
    Entrega.xLgr    := Campo('g03');
    Entrega.nro     := Campo('g04');
    Entrega.xCpl    := Campo('g05');
    Entrega.xBairro := Campo('g06');
    Entrega.cMun    := CampoI('g07');
    Entrega.xMun    := Campo('g08');
    Entrega.UF      := Campo('g09');

    for i := 1 to itens do
    with Det.Add do
    begin
      s := FormatFloat('000', i);
      infAdProd     := QuebraLinha(Campo(s+'v01'));

      with Prod do
      begin
        cProd    := Campo (s+'i02');
        nItem    := CampoI(s+'h02');
        cEAN     := Campo (s+'i03');
        xProd    := Campo (s+'i04');
        NCM      := Campo (s+'i05');
        EXTIPI   := Campo (s+'i06');
//        genero   := CampoI(s+'i07');
        CFOP     := Campo (s+'i08');
        uCom     := Campo (s+'i09');
        qCom     := CampoF(s+'i10');
        vUnCom   := CampoF(s+'i10a');
        vProd    := CampoF(s+'i11');
        cEANTrib := Campo (s+'i12');
        uTrib    := Campo (s+'i13');
        qTrib    := CampoF(s+'i14');
        vUnTrib  := CampoF(s+'i14a');
        vFrete   := CampoF(s+'i15');
        vSeg     := CampoF(s+'i16');
        vDesc    := CampoF(s+'i17');
        vOutro   := CampoF(s+'i17a');
        if Campo(s+'i17b') <> '' then
        begin
          if CampoF(s+'i17b') = 0 then
            IndTot := itNaoSomaTotalNFe
          else
            IndTot := itSomaTotalNFe;
        end;

        if (Campo(s+'i19') <> '') then
        With DI.Add do
        begin
          nDi         := Campo(s+'i19');
          dDi         := CampoD(s+'i20');
          xLocDesemb  := Campo(s+'i21');
          UFDesemb    := Campo(s+'i22');
          dDesemb     := CampoD(s+'i23');
          cExportador := Campo(s+'i24');

          for i1 := 1 to itensAdicao do
          With adi.Add do
          begin
            s1 := FormatFloat('000', i1);
            nAdicao     := CampoI(s+s1+'i26');
            nSeqAdi     := CampoI(s+s1+'i27');
            cFabricante := Campo (s+s1+'i28');
            vDescDI     := CampoF(s+s1+'i29');
          end;
        end;

        with veicProd do
        begin
          if CampoI(s+'j02') = 0 then
            tpOP   := toOutros
          else
            tpOP   := TpcnTipoOperacao(CampoI(s+'j02')-1);
          chassi   := Campo (s+'j03');
          cCor     := Campo (s+'j04');
          xCor     := Campo (s+'j05');
          pot      := Campo (s+'j06');
          Cilin    := Campo (s+'j07');
//          CM3      := Campo (s+'j07');
          pesoL    := Campo (s+'j08');
          pesoB    := Campo (s+'j09');
          nSerie   := Campo (s+'j10');
          tpComb   := Campo (s+'j11');
          nMotor   := Campo (s+'j12');
          CMT      := Campo (s+'j13');
//          CMKG     := Campo (s+'j13');
          dist     := Campo (s+'j14');
//          RENAVAM  := Campo (s+'j15');
          anoMod   := CampoI(s+'j16');
          anoFab   := CampoI(s+'j17');
          tpPint   := Campo (s+'j18');
          tpVeic   := CampoI(s+'j19');
          espVeic  := CampoI(s+'j20');
          VIN      := Campo (s+'j21');
          condVeic := TpcnCondicaoVeiculo(CampoI(s+'j22')-1);
          cMod     := Campo (s+'j23');
        end;
      end;

      with Imposto do
      begin
        with ICMS do
        begin
          orig     := TpcnOrigemMercadoria(CampoI(s+'n11'));

          if Campo(s+'n12') <> '' then
          begin
            indice := StrToInt(Campo(s+'n12'));
            indice := Pos(IntToStr(indice), '0010203040415051607090');
            indice := indice - 1;
            indice := round(indice / 2);
            CST      := TpcnCSTIcms(indice);
          end;

          CSOSN := TpcnCSOSNIcms(GetEnumValue(TypeInfo(TpcnCSOSNIcms), 'csosn' + Campo(s+'n12a')));

          modBC    := TpcnDeterminacaoBaseIcms(CampoI(s+'n13'));
          pRedBC   := CampoF(s+'n14');
          vBC      := CampoF(s+'n15');
          pICMS    := CampoF(s+'n16');
          vICMS    := CampoF(s+'n17');
          modBCST  := TpcnDeterminacaoBaseIcmsST(CampoI(s+'n18'));
          pMVAST   := CampoF(s+'n19');
          pRedBCST := CampoF(s+'n20');
          vBCST    := CampoF(s+'n21');
          pICMSST  := CampoF(s+'n22');
          vICMSST  := CampoF(s+'n23');
        end;
        with IPI do
        begin
          clEnq    := Campo (s+'o02');
          CNPJProd := Campo (s+'o03');
          cSelo    := Campo (s+'o04');
          qSelo    := CampoI(s+'o05');
          cEnq     := Campo (s+'o06');
          indice := round(Pos(Campo(s+'o09'), '0049509901020304055152535455')/2);
          CST      := TpcnCstIpi(indice);
          vBC      := CampoF(s+'o10');
          qUnid    := CampoF(s+'o11');
          vUnid    := CampoF(s+'o12');
          pIPI     := CampoF(s+'o13');
          vIPI     := CampoF(s+'o14');
        end;
        with II do
        begin
          vBc      := CampoF(s+'p02');
          vDespAdu := CampoF(s+'p03');
          vII      := CampoF(s+'p04');
          vIOF     := CampoF(s+'p05');
        end;

        with PIS do
        begin
          CST       := TpcnCstPis(GetEnumValue(TypeInfo(TpcnCstPis), 'pis' + Campo(s+'q06')));
          vBC       := CampoF(s+'q07');
          pPIS      := CampoF(s+'q08');
          vPIS      := CampoF(s+'q09');
          qBCProd   := CampoF(s+'q10');
          vAliqProd := CampoF(s+'q11');
        end;

        with PISST do
        begin
          vBc       := CampoF(s+'r02');
          pPis      := CampoF(s+'r03');
          qBCProd   := CampoF(s+'r04');
          vAliqProd := CampoF(s+'r05');
          vPIS      := CampoF(s+'r06');
        end;

        with COFINS do
        begin
          CST       := TpcnCstCofins(GetEnumValue(TypeInfo(TpcnCstCofins), 'cof' + Campo(s+'s06')));
          vBC       := CampoF(s+'s07');
          pCOFINS   := CampoF(s+'s08');
          qBCProd   := CampoF(s+'s09');
          vAliqProd := CampoF(s+'s10');
          vCOFINS   := CampoF(s+'s11');
        end;

        with COFINSST do
        begin
          vBC       := CampoF(s+'t02');
          pCOFINS   := CampoF(s+'t03');
          qBCProd   := CampoF(s+'t04');
          vAliqProd := CampoF(s+'t05');
          vCOFINS   := CampoF(s+'t06');
        end;

        with ISSQN do
        begin
          vBC       := CampoF(s+'u02');
          vAliq     := CampoF(s+'u03');
          vISSQN    := CampoF(s+'u04');
          cMunFG    := CampoI(s+'u05');
          cListServ := CampoI(s+'u06');
        end;
      end;
    end;

    with Total do
    begin
      with ICMSTot do
      begin
        vBC     := CampoF('w03');
        vICMS   := CampoF('w04');
        vBCST   := CampoF('w05');
        vST     := CampoF('w06');
        vProd   := CampoF('w07');
        vFrete  := CampoF('w08');
        vSeg    := CampoF('w09');
        vDesc   := CampoF('w10');
        vII     := CampoF('w11');
        vIPI    := CampoF('w12');
        vPIS    := CampoF('w13');
        vCOFINS := CampoF('w14');
        vOutro  := CampoF('w15');
        vNF     := CampoF('w16');
      end;

      with ISSQNtot do
      begin
        vServ   := CampoF('w18');
        vBC     := CampoF('w19');
        vISS    := CampoF('w20');
        vPIS    := CampoF('w21');
        vCOFINS := CampoF('w22');
      end;

      with retTrib do
      begin
        vRetPIS    := CampoF('w24');
        vRetCOFINS := CampoF('w25');
        vRetCSLL   := CampoF('w26');
        vBCIRRF    := CampoF('w27');
        vIRRF      := CampoF('w28');
        vBCRetPrev := CampoF('w29');
        vRetPrev   := CampoF('w30');
      end;
    end;

    with Transp do
    begin
      modFrete := TpcnModalidadeFrete(CampoI('x02'));

      with Transporta do
      begin
        CNPJCPF := Campo('x04');
        xNome   := Campo('x06');
        IE      := Campo('x07');
        xEnder  := Campo('x08');
        xMun    := Campo('x09');
        UF      := Campo('x10');
      end;

      with retTransp do
      begin
        vServ    := CampoF('x12');
        vBCRet   := CampoF('x13');
        pICMSRet := CampoF('x14');
        vICMSRet := CampoF('x15');
        CFOP     := Campo ('x16');
        cMunFG   := CampoI('x17');
      end;

      with veicTransp do
      begin
        placa := Campo('x19');
        UF    := Campo('x20');
        RNTC  := Campo('x21');
      end;

      for i := 1 to reboques do
      With Reboque.Add do
      begin
        s := FormatFloat('000', i);
        placa := Campo(s+'x23');
        UF    := Campo(s+'x24');
        RNTC  := Campo(s+'x25');
      end;

      for i := 1 to volumes do
      With Vol.Add do
      begin
        s := FormatFloat('000', i);
        qVol  := CampoI(s+'x27');
        esp   := Campo (s+'x28');
        marca := Campo (s+'x29');
        nVol  := Campo (s+'x30');
        pesoL := CampoF(s+'x31');
        pesoB := CampoF(s+'x32');
      end;
    end;

    with Cobr do
    begin
      with Fat do
      begin
        nFat  := Campo ('y03');
        vOrig := CampoF('y04');
        vDesc := CampoF('y05');
        vLiq  := CampoF('y06');
      end;

      for i := 1 to dups do
      With Dup.Add do
      begin
        s := FormatFloat('000', i);
        nDup  := Campo (s+'y08');
        dVenc := CampoD(s+'y09');
        vDup  := CampoF(s+'y10');
      end;
    end;

    with InfAdic do
    begin
      infAdFisco := Campo('z02');
      infCpl     := StringReplace(Campo('z03'), '|', chr(13)+chr(10), [rfReplaceAll]);

      for i := 1 to obsConts do
      With obsCont.Add do
      begin
        s := FormatFloat('000', i);
        xCampo := Campo(s+'z05');
        xTexto := StringReplace(Campo(s+'z06'), '|', chr(13)+chr(10), [rfReplaceAll]);
      end;
      With exporta do
      begin
        UFembarq   := Campo('za02');
        xLocEmbarq := Campo('za03');
      end;
    end;

    with compra do
    begin
      xNEmp := Campo('zb02');
      xPed  := Campo('zb03');
      xCont := Campo('zb04');
    end;
  end;
end;

procedure TformWebService.GravarConfiguracao;
var
  reg: TRegistry;
  StreamMemo : TMemoryStream;
begin
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    begin
      reg.WriteString('CertificadoNumSerie',edtNumSerie.Text) ;
      reg.WriteInteger('GeralDANFE'       ,rgTipoDanfe.ItemIndex) ;
      reg.WriteInteger('GeralFormaEmissao',rgFormaEmissao.ItemIndex) ;
      reg.WriteString('GeralLogoMarca'   ,edtLogoMarca.Text) ;
      reg.WriteString('GeralPathLer'     ,edDirEntrada.Text) ;
      reg.WriteString('GeralPathSalvar'  ,edDirSaida.Text) ;
      reg.WriteString('GeralPathXML'     ,edDirXML.Text) ;
      reg.WriteInteger('GeralNomeArquivo',rgNomeArquivo.ItemIndex) ;

      reg.WriteString('WebServiceUF'        ,cbUF.Text) ;
      reg.WriteInteger('WebServiceAmbiente'  ,rgTipoAmb.ItemIndex) ;
      reg.WriteBool('WebServiceVisualizar',ckVisualizar.Checked) ;

      reg.WriteString('ProxyHost'   ,edtProxyHost.Text) ;
      reg.WriteString('ProxyPorta'  ,edtProxyPorta.Text) ;
      reg.WriteString('ProxyUser'   ,edtProxyUser.Text) ;
      reg.WriteString('ProxyPass'   ,edtProxySenha.Text) ;

      StreamMemo := TMemoryStream.Create;
      StreamMemo.Seek(0,soFromBeginning);
      reg.WriteBinaryData('EmailMensagem',StreamMemo, StreamMemo.Size) ;
      StreamMemo.Free;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TformWebService.LerConfiguracao;
var
  reg: TRegistry;
  OK: Boolean;
begin
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    try
      edtNumSerie.Text          := Reg.ReadString('CertificadoNumSerie');
      rgFormaEmissao.ItemIndex  := Reg.ReadInteger('GeralFormaEmissao');
      edDirEntrada.Text         := Reg.ReadString('GeralPathLer');
      edDirSaida.Text           := Reg.ReadString('GeralPathSalvar');
      edDirXML.Text             := Reg.ReadString('GeralPathXML');
      rgNomeArquivo.ItemIndex   := Reg.ReadInteger('GeralNomeArquivo');

      cbUF.ItemIndex            := cbUF.Items.IndexOf(Reg.ReadString('WebServiceUF'));
      rgTipoAmb.ItemIndex       := Reg.ReadInteger('WebServiceAmbiente');
      ckVisualizar.Checked      := Reg.ReadBool('WebServiceVisualizar');
      rgTipoDanfe.ItemIndex     := Reg.ReadInteger('GeralDANFE');
      edtLogoMarca.Text         := Reg.ReadString('GeralLogoMarca');
    except
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  ACBrNFe1.Configuracoes.Geral.FormaEmissao := StrToTpEmis(OK,IntToStr(rgFormaEmissao.ItemIndex+1));
  ACBrNFe1.Configuracoes.Geral.Salvar       := DirectoryExists(edDirXML.Text);
  ACBrNFe1.Configuracoes.Geral.PathSalvar   := edDirXML.Text;
  ACBrNFe1.Configuracoes.Geral.PathSchemas  := 'Schemas';
  ACBrNFe1.Configuracoes.Certificados.NumeroSerie := edtNumSerie.Text;
  ACBrNFe1.Configuracoes.WebServices.UF         := cbUF.Text;
  ACBrNFe1.Configuracoes.WebServices.Ambiente   := StrToTpAmb(Ok,IntToStr(rgTipoAmb.ItemIndex+1));
  ACBrNFe1.Configuracoes.WebServices.Visualizar := ckVisualizar.Checked;

  edtNumSerie.Text := ACBrNFe1.Configuracoes.Certificados.NumeroSerie;

  gbProxy.Visible := False;

  if ACBrNFe1.DANFE <> nil then
  begin
    ACBrNFe1.DANFE.TipoDANFE  := StrToTpImp(OK,IntToStr(rgTipoDanfe.ItemIndex+1));
    ACBrNFe1.DANFE.Logo       := edtLogoMarca.Text;
  end;
end;

procedure TformWebService.btnSalvarConfigClick(Sender: TObject);
begin
 GravarConfiguracao;
 LerConfiguracao;
 Timer1.Enabled := True;
end;

procedure TformWebService.sbtnGetCertClick(Sender: TObject);
begin
   edtNumSerie.Text := ACBrNFe1.Configuracoes.Certificados.SelecionarCertificado;
end;

procedure TformWebService.ACBrNFe1StatusChange(Sender: TObject);
begin
  case ACBrNFe1.Status of
    stIdle :
    begin
      if ( frmStatus <> nil ) then
        frmStatus.Hide;
    end;
    stNFeStatusServico :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Verificando Status do servico...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeRetRecepcao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Recebendo dados da NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeConsulta :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeCancelamento :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando cancelamento de NFe...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNfeInutilizacao :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando pedido de Inutilização...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeRecibo :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Recibo de Lote...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeCadastro :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Consultando Cadastro...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
    stNFeEmail :
    begin
      if ( frmStatus = nil ) then
        frmStatus := TfrmStatus.Create(Application);
      frmStatus.lblStatus.Caption := 'Enviando Email...';
      frmStatus.Show;
      frmStatus.BringToFront;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TformWebService.sbtnLogoMarcaClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Selecione o Logo';
  OpenDialog1.DefaultExt := '*.bmp';
  OpenDialog1.Filter := 'Arquivos BMP (*.bmp)|*.bmp|Todos os Arquivos (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFileDir(application.ExeName);
  if OpenDialog1.Execute then
  begin
    edtLogoMarca.Text := OpenDialog1.FileName;
  end;
end;

procedure TformWebService.sbtnPathSalvarClick(Sender: TObject);
var
  Dir: string;
begin
  if Length(edDirEntrada.Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := edDirEntrada.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    edDirEntrada.Text := Dir;
end;

procedure TformWebService.SpeedButton1Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(edDirSaida.Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := edDirSaida.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    edDirSaida.Text := Dir;
end;

procedure TformWebService.SpeedButton2Click(Sender: TObject);
var
  Dir: string;
begin
  if Length(edDirXML.Text) <= 0 then
     Dir := ExtractFileDir(application.ExeName)
  else
     Dir := edDirXML.Text;

  if SelectDirectory(Dir, [sdAllowCreate, sdPerformCreate, sdPrompt],SELDIRHELP) then
    edDirXML.Text := Dir;
end;

procedure TformWebService.FormCreate(Sender: TObject);
begin
  ACBrNFeDANFERave1.ACBrNFe := ACBrNFe1;
  ACBrNFeDANFERave1.Email := 'samaan_filho@hotmail.com';
  ACBrNFeDANFERave1.ImprimirDescPorc := True;
  ACBrNFeDANFERave1.PathPDF := 'C:\Program Files\Borland\Delphi7\Bin\';
  ACBrNFeDANFERave1.RavFile := 'Report\NotaFiscalEletronica.rav';
  ACBrNFeDANFERave1.Sistema := 'Msystem informática';

  LerConfiguracao;
end;

procedure TformWebService.ImprimirDANFE(xml: String);
var
  arqID, arqPDF: String;
begin
  ACBrNFe1.NotasFiscais.Clear;
  ACBrNFe1.NotasFiscais.LoadFromFile(xml);
  ACBrNFeDANFERave1.PathPDF := edDirSaida.Text;
  ACBrNFeDANFERave1.ImprimirDANFEPDF();

  if rgNomeArquivo.ItemIndex = 0 then
    Exit;

  nomeArquivoNumero := edDirSaida.Text + '\' + FormatFloat('000000000', ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
  nomeArquivoChave  := edDirSaida.Text + '\' + copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, (length(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)-44)+1, 44);

  arqID := nomeArquivoChave + '.pdf';
  arqPDF := nomeArquivoNumero + '.pdf';

  RenameFile(arqID, arqPDF);
end;

procedure TformWebService.CriaSubDir(const NomeDiretorio: string);
var
  Caminho: string;
begin
  Caminho := ExtractFileDir(NomeDiretorio);

  if not DirectoryExists(Caminho) then
    CriaSubDir(Caminho);

  CreateDir(NomeDiretorio);
end;

procedure TformWebService.TimerCartaCorrecaoTimer(Sender: TObject);
  var
    F: TSearchRec;
    fResposta: TextFile;
    Ret: Integer;
    {arqID, arqXML, }arqTXT: String;
    {notaEmitida, notaCancelada, }criou{, cancelamento}: Boolean;
//    carta: TCartaCorrecao;
//    cce: TCCeNFe;
begin
  TimerCartaCorrecao.Enabled := False;

  try
    if edtNumSerie.Text = '' then
      Exit;

    if edDirEntrada.Text = '' then
      Exit;

    if edDirSaida.Text = '' then
      Exit;

    CriaSubDir(edDirEntrada.Text + '\backup');
    CriaSubDir(edDirSaida.Text + '\backup');

    try
      Ret := FindFirst(edDirEntrada.Text+'\*.cce', faAnyFile, F);
      while Ret = 0 do
      begin
        if not TemAtributo(F.Attr, faDirectory) then
        try
          if not DirectoryExists(edDirSaida.Text) then
          begin
            criou := CreateDir(edDirSaida.Text);
            if not criou then
              Showmessage('não foi possível criar o diretorio "' + edDirSaida.Text);
          end;

          CarregaVariaveisCCe(edDirEntrada.Text+'\'+F.Name);

          arqTXT := edDirSaida.Text + '\' + Campo('nSeqEvento');
          AssignFile(fResposta, arqTXT);
          Rewrite(fResposta);
          Writeln(fResposta, Campo('nSeqEvento'));

          DeleteFile(edDirEntrada.Text+'\backup\'+F.Name);
          MoveFile(PAnsiChar(edDirEntrada.Text+'\'+F.Name), pAnsiChar(edDirEntrada.Text+'\backup\'+F.Name));

          ACBrNFe1.CartaCorrecao.CCe.Evento.Clear;
          ACBrNFe1.CartaCorrecao.CCe.idLote := CampoI('idLote');
          with ACBrNFe1.CartaCorrecao.CCe.Evento.Add do
          begin
            infEvento.chNFe := Campo('Chave');
            infEvento.cOrgao := CampoI('codOrgao');
            infEvento.CNPJ   := Campo('CNPJ');
            infEvento.dhEvento := IncHour(Date + Time, -1);
            infEvento.tpEvento := 110110;
            infEvento.nSeqEvento := CampoI('nSeqEvento');
            infEvento.versaoEvento := '1.00';
            infEvento.detEvento.descEvento := 'Carta de Correção';
            infEvento.detEvento.xCorrecao := StringReplace(Campo('Correcao'), '\n', char(13) + char(10), [rfReplaceAll]);
            infEvento.detEvento.xCondUso := ''; //Texto fixo conforme NT 2011.003 -  http://www.nfe.fazenda.gov.br/portal/exibirArquivo.aspx?conteudo=tsiloeZ6vBw=
          end;

          ACBrNFe1.EnviarCartaCorrecao(CampoI('idLote'));

          Writeln(fResposta, DateTimeToStr(ACBrNFe1.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento));
          Writeln(fResposta, ACBrNFe1.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.xMotivo);

          MemoResp.Lines.Text := UTF8Encode(ACBrNFe1.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.xMotivo);
          MemoResp.Lines.Add(UTF8Encode(DateTimeToStr(ACBrNFe1.WebServices.CartaCorrecao.CCeRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento)));

          CloseFile(fResposta);

          DeleteFile(arqTXT + '.cce');
          RenameFile(arqTXT, arqTXT + '.cce');
        except on E: Exception do
          begin
            Writeln(fResposta, ''); //Data do evento
            Writeln(fResposta, 'Falha: ' + E.Message);
            CloseFile(fResposta);
            DeleteFile(arqTXT + '.cce');
            RenameFile(arqTXT, arqTXT + '.cce');
          end;
        end;
        Ret := FindNext(F);
      end;
    except on e: exception do
      showmessage(e.message);
    end;
  finally
    FindClose(F);
    TimerCartaCorrecao.Enabled := True;
  end;
end;
{
procedure TformWebService.GeraCCe(nomeArquivo: String);
begin
end;
}

{
  idLote := '1';
  if not(InputQuery('WebServices Carta de Correção', 'Identificador de controle do Lote de envio do Evento', idLote)) then
     exit;
  codOrgao := copy(Chave,1,2);
  if not(InputQuery('WebServices Carta de Correção', 'Código do órgão de recepção do Evento', codOrgao)) then
     exit;
  CNPJ := copy(Chave,7,14);
  if not(InputQuery('WebServices Carta de Correção', 'CNPJ ou o CPF do autor do Evento', CNPJ)) then
     exit;
  nSeqEvento := '1';
  if not(InputQuery('WebServices Carta de Correção', 'Sequencial do evento para o mesmo tipo de evento', nSeqEvento)) then
     exit;
  Correcao := 'Correção a ser considerada, texto livre. A correção mais recente substitui as anteriores.';
  if not(InputQuery('WebServices Carta de Correção', 'Correção a ser considerada', Correcao)) then
     exit;
}
end.
