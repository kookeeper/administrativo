unit uImprimirNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit, RzLabel,
  ACBrNFeDANFEClass, ACBrNFeDANFERave, ACBrNFe, Registry;

type
  TfImprimirNFe = class(TForm)
    RzLabel1: TRzLabel;
    edNFe: TRzNumericEdit;
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    ACBrNFe1: TACBrNFe;
    OpenDialog1: TOpenDialog;
    ACBrNFeDANFERave1: TACBrNFeDANFERave;
    procedure bbFecharClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    logoMarca, dirEntrada, dirSaida: String;
    nomeArquivo: Integer;
    procedure LerConfiguracao;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImprimirNFe: TfImprimirNFe;

implementation

uses UDM, DBClient, FWebService;

{$R *.dfm}

procedure TfImprimirNFe.bbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfImprimirNFe.bbImprimirClick(Sender: TObject);
var
  nomeArquivoNumero, nomeArquivoChave, arqXML, arqID, arqPDF: String;
  F: TSearchRec;
  Ret: Integer;
  cds: TClientDataSet;
begin
  try
    arqPDF := dirSaida + '\' + FormatFloat('000000000', edNFe.IntValue) + '.pdf';
    arqXML := dirSaida + '\' + FormatFloat('000000000', edNFe.IntValue) + '.xml';

    if FileExists(arqPDF) then
    begin
      ExecFileAssociado(arqPDF);
      Exit;
    end;

    Ret := FindFirst(dirSaida + '\*.pdf', faAnyFile, F);
    While Ret = 0 do
    begin
      if Copy(F.Name, 26, 9) <> FormatFloat('000000000', edNFe.IntValue) then
      begin
        Ret := FindNext(F);
        Continue;
      end;
      arqPDF := dirSaida + '\' + F.Name;
      ExecFileAssociado(arqPDF);
      Exit;
    end;

    if not FileExists(arqXML) then
    begin
      Ret := FindFirst(dirSaida + '\*.xml', faAnyFile, F);
      While Ret = 0 do
      begin
        if Copy(F.Name, 26, 9) <> FormatFloat('000000000', edNFe.IntValue) then
        begin
          Ret := FindNext(F);
          Continue;
        end;
        arqXML := dirSaida + '\' + F.Name;
        Break;
      end;
      FindClose(F);
    end;

    if not FileExists(arqXML) then
    begin
      cds := TClientDataSet.Create(DM);
      cds.RemoteServer := DM.SCServer;
      cds.ProviderName := 'dspLista';
      cds.Close;
      DM.SCServer.AppServer.CriaLista ('select numero_nfiscal, nfiscal_sq from nfiscais where numero_nfe = ' + IntToStr(edNFe.IntValue));
      cds.Open;

      if (not cds.Eof) then
      begin
        DM.geraNFe(cds.FieldByName('numero_nfiscal').AsInteger, 'arquivo', '');
        formWebService := TformWebService.Create(Self);
        formWebService.ACBrNFe1.NotasFiscais.Clear;
        formWebService.GeraNFe('arquivo');
        formWebService.ACBrNFe1.NotasFiscais.Valida;
        formWebService.ACBrNFe1.NotasFiscais.SaveToFile(dirSaida);
        DeleteFile('arquivo');

        nomeArquivoNumero := dirSaida + '\' + FormatFloat('000000000', formWebService.ACBrNFe1.NotasFiscais.Items[0].NFe.Ide.nNF);
        nomeArquivoChave  := dirSaida + '\' + copy(formWebService.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, (length(formWebService.ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)-44)+1, 44);

        arqID := nomeArquivoChave;

        if nomeArquivo = 1 then
          arqXML := nomeArquivoNumero + '.xml'
        else
          arqXML := nomeArquivoChave + '.xml';

        RenameFile(arqID + '-NFe.xml', arqXML);

      end;
      cds.Close;
    end;

    OpenDialog1.InitialDir := dirSaida;
    if (not FileExists(arqXML)) and
    (MessageDlg('arquivo XML não encontrado, deseja procurar?', mtInformation, [mbYes, mbNo], 0) = mrYes) and
    (OpenDialog1.Execute) then
      arqXML := OpenDialog1.FileName;

    if (arqXML <> '') and (FileExists(arqXML)) then
    begin
      ACBrNFeDANFERave1.RavFile := ExtractFilePath(Application.ExeName) + '\Report\NotaFiscalEletronica.rav';

      ACBrNFe1.NotasFiscais.Clear;
      ACBrNFe1.NotasFiscais.LoadFromFile(arqXML);
      ACBrNFeDANFERave1.Logo    := LogoMarca;
      ACBrNFeDANFERave1.PathPDF := dirSaida;
      ACBrNFeDANFERave1.ImprimirDANFEPDF();

      arqID := dirSaida + '\' + copy(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID, (length(ACBrNFe1.NotasFiscais.Items[0].NFe.infNFe.ID)-44)+1, 44) + '.pdf';

      if nomeArquivo = 1 then
        RenameFile(arqID, arqPDF)
      else
        arqPDF := arqID;

      ExecFileAssociado(arqPDF);
    end;
  finally
    FreeAndNil(cds);
    FreeAndNil(formWebService);
  end;
end;

procedure TfImprimirNFe.LerConfiguracao;
var
  reg: TRegistry;
begin
  try
    try
      Reg := TRegistry.Create;
      Reg.RootKey := HKEY_CURRENT_USER;
      Reg.OpenKey('\Software\MSystem', True);

      dirSaida    := Reg.ReadString('GeralPathSalvar');
      dirEntrada  := Reg.ReadString('GeralPathLer');
      nomeArquivo := Reg.ReadInteger('GeralNomeArquivo');
      logoMarca   := Reg.ReadString('GeralLogoMarca');
    except
      dirSaida := '';
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TfImprimirNFe.FormCreate(Sender: TObject);
begin
  ACBrNFeDANFERave1.ACBrNFe := ACBrNFe1;
  ACBrNFeDANFERave1.Email := 'samaan_filho@hotmail.com';
  ACBrNFeDANFERave1.ImprimirDescPorc := True;
  ACBrNFeDANFERave1.PathPDF := 'C:\Program Files\Borland\Delphi7\Bin\';
  ACBrNFeDANFERave1.RavFile := 'Report\NotaFiscalEletronica.rav';
  ACBrNFeDANFERave1.Sistema := 'Msystem informática';

  LerConfiguracao;
end;

end.
