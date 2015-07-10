unit UDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBTable, IBDatabase, IBQuery, IBStoredProc,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage, IBUpdateSQL, DBClient, MConnect, SConnect,
  ExtCtrls, Variants, ScktComp, IdUDPBase, IdUDPClient, IdTrivialFTP,
  OleServer, ExcelXP, StdCtrls, Sockets;

type
  TDuplicataRecord = record
     Numero: String;
     Valor: Double;
     Data: TDate;
  end;

  TNotaDefault = class(TObject)
    codigo_cliente: String;
    cotacao_dolar: double;
    condicao_pagamento: Integer;
    codigo_vendedor: Integer;
    cfop: Integer;
    codigo_transportadora: String;
  end;

  TDM = class(TDataModule)
    Msg: TIdMessage;
    IdSMTP1: TIdSMTP;
    SCServer: TSocketConnection;
    cdsImprClientesUF: TClientDataSet;
    cdsImprHistClientes3: TClientDataSet;
    cdsImprHistClientes2: TClientDataSet;
    cdsImprHistClientes1: TClientDataSet;
    cdsImprDemPrev: TClientDataSet;
    cdsImprDemPrevNUMERO_NFISCAL: TIntegerField;
    cdsImprDemPrevNOME_CLIENTE: TStringField;
    cdsImprDemPrevDTEMISSAO_NFISCAL: TDateTimeField;
    cdsImprDemPrevDIAS_DEMONSTRACAO: TIntegerField;
    cdsImprDemPrevDT_NFISCAL_RETORNO: TDateTimeField;
    cdsImprAssist: TClientDataSet;
    cdsImprAssistItem: TClientDataSet;
    cdsImprAssistItemASSISTENCIA_ITEM_SQ: TIntegerField;
    cdsImprAssistItemPRODUTO_SQ: TIntegerField;
    cdsImprAssistItemQTDE_ASSISTENCIA_ITEM: TIntegerField;
    cdsImprAssistItemPRECO_UNIT: TBCDField;
    cdsImprAssistItemCODIGO_PRODUTO: TStringField;
    cdsImprAssistItemDESCRICAO_PRODUTO: TStringField;
    cdsImprAssistItemCODIGO_NBM: TStringField;
    cdsImprAssistEquip: TClientDataSet;
    cdsImprAssistEquipASSISTENCIA_EQUIP_SQ: TIntegerField;
    cdsImprAssistEquipASSISTENCIA_SQ: TIntegerField;
    cdsImprAssistEquipPRODUTO_SQ: TIntegerField;
    cdsImprAssistEquipNR_SERIE_EQUIP: TMemoField;
    cdsImprAssistEquipDEFEITO: TBlobField;
    cdsImprAssistEquipCODIGO_PRODUTO: TStringField;
    cdsImprAssistEquipDESCRICAO_PRODUTO: TStringField;
    cdsImprAssistEquipCODIGO_NBM: TStringField;
    cdsImprClientesNovos: TClientDataSet;
    cdsImprRMA: TClientDataSet;
    cdsImprAssistEquipservicos: TMemoField;
    cdsImprAssistItemassistencia_equip_sq: TIntegerField;
    cdsImprRMAassistencia_sq: TIntegerField;
    cdsImprRMARMANO: TIntegerField;
    cdsImprRMAReceiveDate: TDateTimeField;
    cdsImprRMAProcessDate: TDateTimeField;
    cdsImprRMARepairCenter: TStringField;
    cdsImprRMACustomerName: TStringField;
    cdsImprRMAPhone: TStringField;
    cdsImprRMAModel: TStringField;
    cdsImprRMASerialnumber: TMemoField;
    cdsImprRMAInOutofWarranty: TStringField;
    cdsImprRMAQuantity: TFloatField;
    cdsImprRMADefectedreason: TMemoField;
    cdsImprRMAHowtorepair: TMemoField;
    cdsImprRMAChangecomponent: TStringField;
    cdsImprRMAPartsnumber: TStringField;
    cdsImprRMATechnician: TStringField;
    cdsImprRMAResult: TStringField;
    IdTrivialFTP1: TIdTrivialFTP;
    cdsImprAssistASSISTENCIA_SQ: TIntegerField;
    cdsImprAssistNUMERO_ASSISTENCIA: TIntegerField;
    cdsImprAssistDATA_CHAMADO: TDateTimeField;
    cdsImprAssistDATA_ASSISTENCIA: TDateTimeField;
    cdsImprAssistCOTACAO_DOLAR: TBCDField;
    cdsImprAssistCLIENTE_SQ: TIntegerField;
    cdsImprAssistCOND_PAGTO_SQ: TIntegerField;
    cdsImprAssistDESP_CHAMADO: TBCDField;
    cdsImprAssistDESP_HTEC_AD: TBCDField;
    cdsImprAssistDESP_DESLOC: TBCDField;
    cdsImprAssistVLR_PECAS: TBCDField;
    cdsImprAssistVLR_TOTAL: TBCDField;
    cdsImprAssistHORA_INICIO: TTimeField;
    cdsImprAssistHORA_FIM: TTimeField;
    cdsImprAssistGARANTIA: TStringField;
    cdsImprAssistCONTRATO: TStringField;
    cdsImprAssistvendedor_sq: TIntegerField;
    cdsImprAssistDDD_FONE1: TStringField;
    cdsImprAssistNUMERO_FONE1: TStringField;
    cdsImprAssistCOMPL_FONE1: TStringField;
    cdsImprAssistDDD_CELULAR: TStringField;
    cdsImprAssistNUMERO_CELULAR: TStringField;
    cdsImprAssistCOMPL_CELULAR: TStringField;
    cdsImprAssistENDERECO: TStringField;
    cdsImprAssistNUMERO: TStringField;
    cdsImprAssistCOMPL_ENDERECO: TStringField;
    cdsImprAssistDDD_FONE2: TStringField;
    cdsImprAssistNUMERO_FONE2: TStringField;
    cdsImprAssistCOMPL_FONE2: TStringField;
    cdsImprAssistDDD_FONE3: TStringField;
    cdsImprAssistNUMERO_FONE3: TStringField;
    cdsImprAssistCOMPL_FONE3: TStringField;
    cdsImprAssistDDD_FAX: TStringField;
    cdsImprAssistNUMERO_FAX: TStringField;
    cdsImprAssistCOMPL_FAX: TStringField;
    cdsImprAssistCODIGO_CLIENTE: TStringField;
    cdsImprAssistNOME_CLIENTE: TStringField;
    cdsImprAssistCONTATO: TStringField;
    cdsImprAssistINSCR_ESTADUAL: TStringField;
    cdsImprAssistBAIRRO: TStringField;
    cdsImprAssistCIDADE: TStringField;
    cdsImprAssistESTADO: TStringField;
    cdsImprAssistPAIS: TStringField;
    cdsImprAssistCEP: TStringField;
    cdsImprAssistD00: TIntegerField;
    cdsImprAssistD01: TIntegerField;
    cdsImprAssistD02: TIntegerField;
    cdsImprAssistD03: TIntegerField;
    cdsImprAssistD04: TIntegerField;
    cdsImprAssistD05: TIntegerField;
    cdsImprAssistD06: TIntegerField;
    cdsImprAssistD07: TIntegerField;
    cdsImprAssistD08: TIntegerField;
    cdsImprAssistD09: TIntegerField;
    cdsImprAssistP00: TIntegerField;
    cdsImprAssistP01: TIntegerField;
    cdsImprAssistP02: TIntegerField;
    cdsImprAssistP03: TIntegerField;
    cdsImprAssistP04: TIntegerField;
    cdsImprAssistP05: TIntegerField;
    cdsImprAssistP06: TIntegerField;
    cdsImprAssistP07: TIntegerField;
    cdsImprAssistP08: TIntegerField;
    cdsImprAssistP09: TIntegerField;
    cdsImprAssistDESCRICAO_COND_PAGTO: TStringField;
    cdsImprAssistPARCELAS: TIntegerField;
    ClientSocket1: TClientSocket;
    Excel: TExcelApplication;
    cdsImprResVendMes: TClientDataSet;
    cdsImprResVendMestotal: TBCDField;
    cdsImprResVendMesano_mes: TStringField;
    cdsImprResVendMesnome_vendedor: TStringField;
    cdsImprDemPrevVLR_TOTAL: TBCDField;
    verificaNFe: TTimer;
    cdsImprRMAFreight: TStringField;
    cdsImprRMAWarraty: TStringField;
    cdsImprRMAassistencia_equip_sq: TIntegerField;
    cdsImprRMAreferencia: TStringField;
    cdsImprRMA2: TClientDataSet;
    cdsImprRMA2Item: TClientDataSet;
    TcpClient1: TTcpClient;
    verificaCCe: TTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure verificaNFeTimer(Sender: TObject);
    procedure cdsImprRMARMANOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure verificaCCeTimer(Sender: TObject);
  private
    procedure LimpaDuplicatas;
    function Acentos(Str: String): String;
    function SoNumeros(str: String): String;
//    procedure verificaValoresAntigos();
//    function carregaNCM: String;
  public
    programas: TStringList;
    ucod, unom, err_email_from, err_nome_from, err_email_to, err_nome_to,
      err_smtp, err_username, err_password, verinfo, ip_email, host_email,
      host, DefaultSchema: string;
    useq, uvend: Integer;
    dtsenha: TDatetime;
    MStream: TMemoryStream;
    tamanho: Integer;
    Duplicatas: array[0..9] of TDuplicataRecord;
//    cdsNat: TClientDataSet;

    function TestaCPF(Text : string) : Boolean;
    function TestaCNPJ(Text : string) : Boolean;
    procedure EnviarEmail (_Tabela, _Operacao, _Erro: String; _Novo: Boolean);
    procedure EnviarEmail2 (_Mensagem: String);
    procedure gravarNotificacao(nome_usuario,ip_usuario,versao_software,
      nome_software,titulo_notificacao,mensagem: String);
    procedure Login;
    function TempDir : String;
    function PegaLetraColuna(IntNumber : Integer) : String;
    function estadoValido(uf: String): Boolean;

    procedure CriaDuplicatas(NFiscal_sq: Integer; Grava: Boolean = False; numeroNFe: Integer = 0);
    procedure AtualizaCondPagto (NFiscal: String; ValorTot: Real; DtEmissao: TDate;
      CondPagto, tipo_nfiscal, Demonstracao: Integer);
    procedure AtualizaItem(cliente_sq, produto_sq, natureza_sq: Integer; condpagto_sq: Variant;
      VlrUnit, VlrDesc, Dolar, Qtde: Real; var AliqICMS, AliqIPI, VlrIpi,
      VlrUnitSIpi, VlrTot, VlrTotSIpi, PctDesc, VlrICMS, PctJuros,
      BaseICMSSub, VlrICMSSub, BaseICMS: Real; VlrJuros, VlrFrete, VlrSeguro,
      VlrDespAcess: Real);
    procedure ExpExcel(Dataset : TDataSet; ArqNome : String);
    procedure VisualizaObservacoes(cdsCliente: TDataSet);
    procedure geraNFe(numero_nfiscal: Integer; arquivo: String; motivoCancelamento: String);
    procedure VerificaAcesso (Form: TForm; var Visualizar, Criar, Editar, Apagar: Boolean);

    function buscaCodigoMun(estado, cidade: String): String;
    function buscaCodigoPais(pais: String): String;
    function buscaNF(nfiscal_sq: Integer): TClientDataSet;
    function buscaNF_SQ(numero_nfiscal: Integer): Integer;
    function temIndiceContaPagar(fornecedor_sq: Integer; numero_duplicata: String): Integer;
    function temNfiscal(pedido_sq: Integer): Boolean;
  end;

var
  DM: TDM;
  fs: TFormatSettings;
  nfDefault: TNotaDefault;

  procedure CloneCDS(Origem: TClientDataSet; var Destino: TClientDataSet);
  procedure ExecFileAssociado(F: String);
  procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
  function InputArea(const ACaption, APrompt: string; var Value: TStrings): Boolean;

implementation

uses uPwd, USplash, UMainMenu, Math, Winsock, USugestaoCompras, Registry,
  UCadastrarFormUsuarios, ShellApi, uImprimirNFe, EstadoIva, ncm, Produto,
  threadEmail, UCadastrarListaComum, Nfiscal, Empresa, Cliente, CondPagto,
  TypInfo, Usuario, Estado, Cadastro, Duplicata, Acesso, Natureza,
  HistoricoLogin, Transportadora, CartaCorrecao;

{$R *.DFM}

procedure CloneCDS(Origem: TClientDataSet; var Destino: TClientDataSet);
var
  i: Integer;
begin
  Destino.Close;
  Destino.CreateDataSet;
  Origem.First;
  While not Origem.Eof do
  begin
    Destino.Append;
    for i := 0 to Origem.FieldCount - 1 do
      if Destino.FindField(Origem.Fields.Fields[i].FieldName) <> nil then
        Destino.FieldByName(Origem.Fields.Fields[i].FieldName).Value := Origem.Fields.Fields[i].Value;
    Destino.Post;
    Origem.Next;
  end;
  Origem.First;
  Destino.First;
end;

// TestaCPF - validacao do CPF
Function TDM.TestaCPF(Text : string) : Boolean;
Var
  i, code : Integer;
  // D, d3 : String;
  d2 : Array[1..9] of Integer;
  DF4, DF5, DF6, RESTO1, Pridig, Segdig : Integer;
  Pridig2, Segdig2 : String;
Begin
  if (Length(Text) <> 11) then
  begin
    result := false;
    Exit;
  end;

  For i := 1 to 9 do Val(Copy (Text, i, 1),D2[i],Code);

  DF4 := 10 * D2[1] + 9 * D2[2] + 8 * D2[3] + 7 * D2[4] + 6 * D2[5] + 5 * D2[6] + 4 * D2[7] + 3 * D2[8] + 2 * D2[9];
  DF5 := DF4 div 11;
  DF6 := DF5 * 11;
  Resto1 := Df4 - DF6;

  If (Resto1=0) or (Resto1=1) then
    Pridig:=0
  else
    Pridig:=11 - Resto1;

  For i := 1 to 9 do Val(Copy (Text, i, 1),D2[i],Code);

  DF4 := 11 * D2[1] + 10 * D2[2] + 9 * D2[3] + 8 * D2[4] + 7 * D2[5] + 6 * D2[6] + 5 * D2[7] + 4 * D2[8] + 3 *
  D2[9] + 2 * Pridig;
  DF5 := DF4 div 11;
  DF6 := DF5 * 11;
  Resto1 := Df4 - DF6;
  If (Resto1=0) or (Resto1=1) then
    Segdig:=0
  else
    Segdig:=11 - Resto1;

  Str(Pridig, Pridig2);
  Str(Segdig, Segdig2);

  If not (Pridig2=Text[10]) or not (SegDig2=Text[11]) then
    Result := False
  else
    Result := True;
End;

// TestaCGC - validacao do CGC
Function TDM.TestaCNPJ(Text : string) : Boolean;
Var
  i, code : Integer;
  // D, d3 : String;
  d2 : Array[1..12] of Integer;
  DF4, DF5, DF6, RESTO1, Pridig, Segdig : Integer;
  Pridig2, Segdig2 : String;
Begin
  For i := 1 to 12 do Val(Copy (Text, i, 1),D2[i],Code);

  DF4 := 5 * D2[1] + 4 * D2[2] + 3 * D2[3] + 2 * D2[4] + 9 * D2[5] + 8 * D2[6] + 7 * D2[7]
  + 6 * D2[8] + 5 * D2[9] + 4 * D2[10] + 3 * D2[11] + 2 * D2[12];
  DF5 := DF4 div 11;
  DF6 := DF5 * 11;
  Resto1 := Df4 - DF6;

  If (Resto1=0) or (Resto1=1) then
    Pridig:=0
  else
    Pridig:=11 - Resto1;

  For i := 1 to 12 do Val(Copy (Text, i, 1),D2[i],Code);

  DF4 := 6 * D2[1] + 5 * D2[2] + 4 * D2[3] + 3 * D2[4] + 2 * D2[5]
  + 9 * D2[6] + 8 * D2[7] + 7 * D2[8] + 6 * D2[9] + 5 * D2[10] +4 * D2[11]
  + 3 * D2[12] + 2 * Pridig;
  DF5 := DF4 div 11;
  DF6 := DF5 * 11;
  Resto1 := Df4 - DF6;

  If (Resto1=0) or (Resto1=1) then
    Segdig:=0
  else
    Segdig:=11 - Resto1;

  Str(Pridig, Pridig2);
  Str(Segdig, Segdig2);
  If not (Pridig2=Text[13]) or not (SegDig2=Text[14]) then
    Result := False
  else
    Result := True;
End;

procedure TDM.EnviarEmail (_Tabela, _Operacao, _Erro: String; _Novo: Boolean);
begin
  with TEnviaEmail.Create(True) do
  begin
    tipoMensagem := 1;
    Tabela := _Tabela;
    Operacao := _Operacao;
    Mensagem := _Erro;
    Novo := _Novo;
    FreeOnTerminate := True;
    Resume;
  end;
end;

procedure TDM.EnviarEmail2 (_Mensagem: String);
begin
  with TEnviaEmail.Create(True) do
  begin
    tipoMensagem := 2;
    Mensagem := _Mensagem;
    FreeOnTerminate := True;
    Resume;
  end;
end;

procedure TDM.Login;
var
  cdsUsuario: TClientDataSet;
begin
  PasswordDlg := TPasswordDlg.Create(Self);
  while true do
  try
    if PasswordDlg.ShowModal <> mrOk then
    begin
      Application.Terminate();
      Exit;
    end;

    if PasswordDlg.edUsuario.Text = '' then
      raise Exception.Create('Usuário não Cadastrado!');
    if PasswordDlg.edPassword.Text = '' then
      raise Exception.Create('Senha inválida!');

    cdsUsuario := TUsuario.listaRegistros('where codigo_usuario = ' + QuotedStr(PasswordDlg.edUsuario.Text) +
    ' and senha_usuario = ' + QuotedStr(PasswordDlg.edPassword.Text));

    if (cdsUsuario.RecordCount = 0) then
      raise Exception.Create('Usuário / Senha Inválido!');

    tag := 1;
    ucod := cdsUsuario.FieldByName('CODIGO_USUARIO').AsString;
    useq := cdsUsuario.FieldByName('USUARIO_SQ').AsInteger;
    unom := cdsUsuario.FieldByName('NOME_USUARIO').AsString;
    uvend := cdsUsuario.FieldByName('VENDEDOR_SQ').AsInteger;
    cdsUsuario.Close;

    err_email_from := 'spsamaan@terra.com.br';
    err_nome_from  := 'Sistema PrHandy';
    err_email_to   := 'msystem@terra.com.br';
    err_nome_to    := 'MultiSystem Informatica';
    err_smtp       := 'smtp.sao.terra.com.br';
    err_username   := 'spsamaan';
    err_password   := 'meuneto';

    With (THistoricoLogin.Create) do
    begin
      usuario_sq := TUsuario.Create(useq);
      data_login := Date;
      ip_login   := TcpClient1.LocalHostAddr;
      salvar;
    end;

    if dtsenha < (date + 10) then
      EnviarEmail2 ('Senha Vence em ' + FormatDateTime ('dd/mm/yyyy', dtsenha));
    Exit;
  except on E: Exception do
    ShowMessage(e.Message);
  end;
  FreeAndNil(PasswordDlg);
end;

{
function TDM.buscaResultado(): Real;
var
  sugestao, resultado: Real;
begin
  sugestao := cdsImprSugCompraqtde_aberto.AsInteger;
  if sugestao < 0 then
    sugestao := 0;
  if FSugestaoCompras.rgMeses.ItemIndex >= 0  then sugestao := sugestao + cdsImprSugCompraqtde1.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 1  then sugestao := sugestao + cdsImprSugCompraqtde2.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 2  then sugestao := sugestao + cdsImprSugCompraqtde3.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 3  then sugestao := sugestao + cdsImprSugCompraqtde4.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 4  then sugestao := sugestao + cdsImprSugCompraqtde5.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 5  then sugestao := sugestao + cdsImprSugCompraqtde6.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 6  then sugestao := sugestao + cdsImprSugCompraqtde7.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 7  then sugestao := sugestao + cdsImprSugCompraqtde8.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 8  then sugestao := sugestao + cdsImprSugCompraqtde9.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 9  then sugestao := sugestao + cdsImprSugCompraqtde10.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 10 then sugestao := sugestao + cdsImprSugCompraqtde11.AsInteger;
  if FSugestaoCompras.rgMeses.ItemIndex >= 11 then sugestao := sugestao + cdsImprSugCompraqtde12.AsInteger;
  sugestao := sugestao / (FSugestaoCompras.rgMeses.ItemIndex + 1);
  if FSugestaoCompras.rgSugestao.ItemIndex = 0 then sugestao := sugestao / 4;
  if FSugestaoCompras.rgSugestao.ItemIndex = 1 then sugestao := sugestao / 2;
  if FSugestaoCompras.rgSugestao.ItemIndex = 2 then sugestao := sugestao / 1;
  if FSugestaoCompras.rgSugestao.ItemIndex = 3 then sugestao := sugestao * 2;
  resultado := int(sugestao);
  if resultado <> sugestao then resultado := resultado + 1;
  Result := resultado - cdsImprSugCompraestoque_total.AsInteger;
end;
}

function TDM.TempDir : String;
{Retorna o Diretorio Temp do Windows}
Var
  Buffer : Array[0..144] of Char;
Begin
GetTempPath(144,Buffer);
Result := StrPas(Buffer);
end;

{
procedure TDM.AtualizaVariaveis(var cds: TClientDataSet);
var
  Sql: String;
begin
  Sql := 'SELECT * FROM empresas';
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  SCServer.AppServer.CriaLista (Sql);
  cds.Open;

  estado          := cds.FieldByName('ESTADO').Value;
  alt_dtped       := cds.FieldByName('ALT_DATA_PEDIDO').Value;
  alt_dtnf        := cds.FieldByName('ALT_DTEMISSAO_NFISCAL').Value;
  alt_nrped       := cds.FieldByName('ALT_NR_PEDIDO').Value;
  alt_nrnf        := cds.FieldByName('ALT_NR_NFISCAL').Value;
  aliq_icms_prod1 := cds.FieldByName('ALIQ_ICMS_PROD1').Value;
  aliq_icms_pec1  := cds.FieldByName('ALIQ_ICMS_PEC1').Value;
  strib           := cds.FieldByName('STRIBUT').Value;
  dias_dem        := cds.FieldByName('DIAS_DEMONSTRACAO').Value;
  aliq_pis        := cds.FieldByName('ALIQ_PIS').AsCurrency;
  aliq_cofins     := cds.FieldByName('ALIQ_COFINS').AsCurrency;
  aliq_iss        := cds.FieldByName('ALIQ_ISS').AsCurrency;
  margem_esq_nf   := cds.FieldByName('MARGEM_ESQ_NF').AsFloat;
  margem_sup_nf   := cds.FieldByName('MARGEM_SUP_NF').AsFloat;
  baixa_estoque_pedido := cds.FieldByName('baixa_estoque_pedido').AsString;
  cnpj            := cds.FieldByName ('CODIGO_EMPRESA').AsString;
  jurosReceber    := cds.FieldByName('juros_receber').AsFloat / 100;

  avision := cnpj = '53908778000160';
  cosmo   := not avision;
end;
}

function TDM.PegaLetraColuna(IntNumber : Integer) : String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 256 then
      Result:='IV'
    else
    begin
      if IntNumber > 26 then
      begin
        Result:=Chr(64 + (IntNumber div 26));
        Result:=Result+Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;

procedure TDM.LimpaDuplicatas;
var
  i: Integer;
begin
  for i := Low(Duplicatas) to High(Duplicatas) do
  begin
    Duplicatas[i].Numero := '';
    Duplicatas[i].Valor := 0;
    Duplicatas[i].Data := 0
  end;
end;

procedure TDM.CriaDuplicatas;
var
  cdsDuplicatas: TClientDataSet;
  i, tipo_nfiscal, numeroDup: Integer;
  dup: TDuplicata;
  nfiscal: TNfiscal;
begin
  LimpaDuplicatas;

  nfiscal := TNfiscal.Create(nfiscal_sq);

  if ((nfiscal.numero_nfe <> null) and (nfiscal.numero_nfe <> 0)) then
    numeroDup := nfiscal.numero_nfe
  else if numeroNFe <> 0 then
    numeroDup := numeroNFe
  else
    numeroDup := nfiscal.numero_nfiscal;

  tipo_nfiscal := nfiscal.natureza_sq.tipo_nfiscal;

  cdsDuplicatas := TDuplicata.listaRegistros('where nfiscal_sq = ' + IntToStr(Nfiscal_sq));

  cdsDuplicatas.First;
  if not cdsDuplicatas.Eof then
  begin
    While not cdsDuplicatas.Eof do
    begin
      Duplicatas[cdsDuplicatas.RecNo-1].Numero := cdsDuplicatas.FieldByName('NUMERO_DUPLICATA').AsString + ' ' + cdsDuplicatas.FieldByName('ITEM_DUPLICATA').AsString + '/' + IntToStr(nfiscal.cond_pagto_sq.parcelas);
      Duplicatas[cdsDuplicatas.RecNo-1].Valor  := cdsDuplicatas.FieldByName('VALOR_DUPLICATA').Value;
      Duplicatas[cdsDuplicatas.RecNo-1].Data   := cdsDuplicatas.FieldByName('DTVENCTO_DUPLICATA').Value;
      cdsDuplicatas.Next;
    end;
  end else
  begin
    AtualizaCondPagto (IntToStr(numeroDup), nfiscal.vlr_total, nfiscal.dtemissao_nfiscal,
      nfiscal.cond_pagto_sq.vIndice, tipo_nfiscal, nfiscal.dias_demonstracao);
    if tipo_nfiscal = 0 then
    begin
      for i := Low(Duplicatas) to High(Duplicatas) do
      if (Grava) and (Duplicatas[i].Valor <> 0) then
      begin
        dup := TDuplicata.Create;
        dup.numero_duplicata := numeroDup;
        dup.item_duplicata := i+1;
        dup.nfiscal_sq := nfiscal.vIndice;
        dup.valor_duplicata := Duplicatas[i].Valor;
        dup.dtemissao_duplicata := nfiscal.dtemissao_nfiscal;
        dup.dtvencto_duplicata := Duplicatas[i].Data;
        dup.juros_duplicata := Duplicatas[i].Valor * empresaSelecionada.juros_receber / 100;
        dup.salvar;
      end;
    end;
  end;
  cdsDuplicatas.Close;
end;

procedure TDM.AtualizaCondPagto (NFiscal: String; ValorTot: Real; DtEmissao: TDate;
    CondPagto, tipo_nfiscal, Demonstracao: Integer);
var
  i: integer;
  condicao: TCondPagto;
begin
  LimpaDuplicatas;

  if (tipo_nfiscal < 0) then
    Exit;

  try
    condicao := TCondPagto.Create(CondPagto);

    if condicao.parcelas = 0 then
    begin
    // nao faz nada... nao tem duplicatas.
    end
    else if tipo_nfiscal = 1 then
    begin
      Duplicatas[0].Numero := NFiscal + ' 1/1';
      Duplicatas[0].Valor  := ValorTot;
      Duplicatas[0].Data   := DtEmissao + Demonstracao;
    end
    else
    begin
      for i := 1 to condicao.parcelas do
      begin
        Duplicatas[i-1].Numero := NFiscal + ' ' + IntToStr(i) + '/' + IntToStr(condicao.parcelas);

        if condicao.p00 = 0 then //significa que vai dividir igualmente e arredondar no final
        begin
          if i < condicao.parcelas then
            Duplicatas[i-1].Valor := StrToFloat(FloatToStrF (ValorTot / condicao.parcelas, ffFixed, 10, 2))
          else
            Duplicatas[i-1].Valor := ValorTot - (Duplicatas[i-2].Valor * (condicao.parcelas - 1));
        end
        else
          Duplicatas[i-1].Valor := Round(ValorTot * GetPropValue(condicao, 'p' + FormatFloat('00', i-1), false)) / 100;

        Duplicatas[i-1].Data   := DtEmissao + GetPropValue(condicao, 'd' + FormatFloat('00', i-1), false);
      end;
    end;
  finally
    FreeAndNil(condicao);
  end;
end;

procedure TDM.AtualizaItem;
var
  AliqIVA, BaseIPI, VlrIpiUnit, VlrUnitReal, VlrIPIProd, VlrIPIOutros: Real;
  estado: TEstado;
  produto: TProduto;
  cliente: TCliente;
  natureza: TNatureza;
  condPagto: TCondPagto;
  tipoNfiscalEnum: TipoNfiscal;
begin
  natureza := TNatureza.Create(natureza_sq);
  produto := TProduto.Create(produto_sq);
  cliente := TCliente.Create(cliente_sq);
  estado := TEstado.CreateFiltro('codigo_estado = ' + QuotedStr(cliente.estado));
  condPagto := TCondPagto.Create(condpagto_sq);

  try
    AliqIPI := produto.nbm_sq.aliq_ipi;
    AliqICMS := produto.nbm_sq.aliq_icms;
    AliqIVA := TEstadoIva.pesquisa(cliente.estado, produto.nbm_sq.vIndice);
    if AliqIVA = 0 then
      AliqIVA  := produto.nbm_sq.aliq_iva;
    VlrIpi      := 0;
    VlrICMS     := 0;
    VlrICMSSub  := 0;
    VlrTot      := 0;
    PctDesc     := 0;
    PctJuros    := 0;
    VlrIpiUnit  := 0;
    VlrUnitSIpi := 0;
    VlrTotSIpi  := 0;
    VlrUnitReal := Round(VlrUnit * Dolar * 100) / 100;
    BaseICMS    := 0;
    BaseIPI     := 0;
    BaseICMSSub := 0;

    if VlrUnitReal * Qtde = 0 then
      Exit;

    PctDesc := VlrDesc * 100 / (VlrUnitReal * Qtde);
    PctJuros := VlrJuros * 100 / (VlrUnitReal * Qtde);

    if natureza.tipo_nfiscal <> 4 then // só vale para as notas que não são de importação
    begin
      if (cliente.inscr_estadual = '') or
         (cliente.tipo_cliente_sq.vIndice = 1) or // cliente final
         (Pos ('ISENT', cliente.inscr_estadual) <> 0) then
      begin
  // A Mei disse que tanto CNPF quanto CPF devem ser conforme ISENTO (11/09/09)
  //      if DM.TestaCNPJ(cdsCliente.FieldByName('CODIGO_CLIENTE').AsString) then
  //      begin
  //        if cdsCliente.FieldByName('ESTADO').AsString <> DM.estado then
  //          AliqICMS := cdsNat.FieldByName('ALIQ_ICMS').Value else // P.J. ISENTO FORA DO ESTADO
  //          AliqICMS := DM.aliq_icms_prod1;                           // P.J. ISENTO DO ESTADO
  //      end
  //      else begin
          if produto.tipo_produto = 1 then
              AliqICMS := empresaSelecionada.aliq_icms_prod1 else                     // P.F. ISENTO (PRODUTO)
          if produto.tipo_produto = 2 then
              AliqICMS := empresaSelecionada.aliq_icms_pec1;                          // P.F. ISENTO (PECA)
  //      end;
      end
      else begin
        if cliente.estado = empresaSelecionada.estado then
          AliqICMS := produto.nbm_sq.aliq_icms else    // P.F./J. DO ESTADO
          AliqICMS := natureza.aliq_icms;       // P.F./J. FORA DO ESTADO
      end;
    end;
    if natureza.isencao_ipi  = 'S' then AliqIPI  := 0;
    if natureza.isencao_icms = 'S' then AliqICMS := 0;

    VlrTot := VlrUnitReal * Qtde + VlrJuros - VlrDesc;

    BaseIPI  := VlrTot;

    VlrIPIProd := Round(100 * BaseIPI * AliqIpi / (100+AliqIpi)) / 100;

    VlrIPIOutros := Round((VlrFrete + VlrSeguro + VlrDespAcess) * AliqIPI) / 100;

    //DECRETO Nº 7.212, DE 15 DE JUNHO DE 2010
    //Frete, Seguro e Desp Acess entram na base de calculo no IPI
    BaseIPI := BaseIPI + VlrFrete + VlrSeguro + VlrDespAcess;

    VlrIpi := VlrIPIProd + VlrIPIOutros;

    if empresaSelecionada.codigo_regime_tributario < 3 then
      BaseICMS := 0
    else
    begin
      if cliente.tipo_cliente_sq.vIndice = 1 then
        BaseICMS := BaseIPI + VlrIPIOutros
      else
        BaseICMS := BaseIPI - VlrIPIProd;
    end;

    //solicitação da Mei: - Base de Calculo do ICMS deve ser 0 (zero) para
    // os isentos de pagamento que abrangem: Simples remessa, retorno de
    // armazem, remessa de armazem, demonstraçao e outras saidas. Tanto de SP
    // como para outros Estados. 12/08/2011
    if (condPagto.parcelas = 0) then // isento de pagamentos
    begin
      tipoNfiscalEnum := TipoNfiscal(natureza.tipo_nfiscal);

      if tipoNfiscalEnum = SimplesRemessa then
        BaseICMS := 0;
      if tipoNfiscalEnum = Retorno then
        BaseICMS := 0;
      if tipoNfiscalEnum = Remessa then
        BaseICMS := 0;
      if tipoNfiscalEnum = Demonstracao then
        BaseICMS := 0;
      if tipoNfiscalEnum = Outros then
        BaseICMS := 0;
    end;

    VlrICMS := Round(BaseICMS * AliqICMS) / 100;

    VlrIpiUnit := Round(100 * VlrIPIProd / Qtde) / 100;
    VlrUnitSIpi := VlrUnitReal - (VlrDesc/Qtde) + (VlrJuros/Qtde) - VlrIpiUnit;
    VlrTotSIpi := VlrTot - VlrIPIProd;

    if (natureza.cfo_subst <> '') and
       (AliqIVA > 0) then
    begin
  //conforme a MEY, se o cliente nao destaca ICMS, mesmo assim deve descontar do IVA.
  //a mey voltou atras na sua decisao. - 07/09/2009
  //    if cdsNat.fieldByNAme('ISENCAO_ICMS').AsString = 'S' then
  //      DeduzIVA := BaseICMS
  //    else
  //      DeduzIVA := 0;

    //solicitação do adriano: remover o frete da base de calculo. 18/05/2011
//      BaseICMSSub := (VlrTot + VlrDespAcess) * (1 + (AliqIVA/100));
      BaseICMSSub := (VlrTot + VlrFrete + VlrSeguro + VlrDespAcess + VlrIPIOutros) * (1 + (AliqIVA/100));
      VlrICMSSub  := BaseICMSSub * estado.aliq_icms_intra / 100 - VlrICMS;
  //    VlrICMSSub  := BaseICMSSub * ncm.aliq_icms / 100 - VlrICMS;
  //    VlrICMSSub  := (BaseICMSSub-DeduzIVA) * DM.cdsListaProdutos.FieldByName('ALIQ_ICMS').Value / 100 - VlrICMS;
      if VlrICMSSub < 0 then
        VlrICMSSub := 0;
    end;
  finally
    FreeAndNil(natureza);
    FreeAndNil(produto);
    FreeAndNil(cliente);
    FreeAndNil(estado);
  end;
end;

procedure TDM.ExpExcel(Dataset : TDataSet; ArqNome : String);
var
  NumLinha, NumColuna, LCID, NumCampo : Integer;
  StrCell                          : String;
  FileName                         : OleVariant;
//  exporta                          : Boolean;
//  AdtoMru, CreateBck, ROREcommended : OleVariant;
begin
  LCID := GetUserDefaultLCID;
  with Excel do
  begin
    Connect;
    try
      Visible[LCID] := True;
      Workbooks.Add(EmptyParam, LCID);
      NumLinha := 1;
      NumColuna := 1;

      // cabecalho
      with Dataset do
      for NumCampo := 1 to Fields.Count do
      begin
        StrCell := PegaLetraColuna(NumColuna) + IntToStr(NumLinha);

        Range[StrCell,StrCell].Font.Bold := True;
        if Fields[NumCampo - 1].DisplayLabel <> '' then
          Range[StrCell,StrCell].Value2 := Fields[NumCampo - 1].DisplayLabel
        else
          Range[StrCell,StrCell].Value2 := Fields[NumCampo - 1].FieldName;
        Inc (NumColuna);
      end;

      NumLinha := 2;

      //registros
      with Dataset do
      begin
        First;
        while not Eof do
        begin
          NumColuna := 1;
          for NumCampo := 1 to Fields.Count do
          begin
            StrCell := PegaLetraColuna(NumColuna) + IntToStr(NumLinha);
            if (Fields.Fields[NumCampo - 1].DataType = ftDateTime) then
              Range[StrCell, StrCell].Value2 := FormatDateTime('dd/mm/yyyy hh:nn:ss', Fields.Fields[NumCampo - 1].AsDateTime)
            else
              Range[StrCell, StrCell].Value2 := Fields.Fields[NumCampo - 1].Value;
            Inc (NumColuna);
          end;
          Next;
          Inc(NumLinha);
        end;
      end;
      Range['A1', StrCell].EntireColumn.Autofit;
      if ArqNome <> '' then
      begin
        FileName := ArqNome;
        ActiveWorkbook.SaveAs(FileName, xlNormal, '', '', False, False, xlNoChange,
                              xlUserResolution, False, EmptyParam, EmptyParam, EmptyParam, LCID);
        Quit;
      end;
    finally
      Disconnect;
    end;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
//  estados := 'AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO';
  DefaultSchema := 'handy';
//  DefaultSchema := 'qsqchampion';
  if (SCServer.ServerName = 'PrServer.ServerTeste') then
    DefaultSchema := 'avision_teste';

  GetLocaleFormatSettings(1046, fs);
  fs.DecimalSeparator := '.';
  fs.ThousandSeparator := #0;

  FSplash := TFSplash.Create (nil);
  FSplash.Show;
  FSplash.Login;
  FSplash.Hide;
  FSplash.Free;
  FMainMenu.VerificaMenu;
  verificaNFe.Enabled := True;
  verificaCCe.Enabled := True;
//  verificaValoresAntigos;

  nfDefault := TNotaDefault.Create;
  nfDefault.codigo_cliente := '1';
  nfDefault.cotacao_dolar := 1;
  nfDefault.condicao_pagamento := 1;
  nfDefault.codigo_vendedor := 1;
  nfDefault.cfop := 5102;
  nfDefault.codigo_transportadora := '';
end;

procedure TDM.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
{
var
  texto: String;
  iLen: Integer;
  Bfr: Pointer;
}
begin
{
  if ClientSocket1.Tag = 0 then  // download
  try
    if tamanho = 0 then
    begin
      texto := Socket.ReceiveText;
      if texto = 'fim' then
        raise Exception.Create('');
      tamanho := StrtoInt(texto);
      if tamanho = 0 then
        raise Exception.Create('');
      MStream := TMemoryStream.Create;
      Socket.SendText('arquivo');
    end
    else begin
      iLen := Socket.ReceiveLength;
      GetMem(Bfr, iLen);
      try
        Socket.ReceiveBuf(Bfr^, iLen);
        MStream.Write(Bfr^, iLen);
      finally
        FreeMem(Bfr);
      end;
      if MStream.Size >= tamanho then
      begin
        ClientSocket1.Active := False;
        MStream.SaveToFile(TempDir + '\' + '$fig.jpg');
        FCadastrarFormUsuarios.Imagem.Picture.LoadFromFile(TempDir + '\' + '$fig.jpg');
        MStream.Free;
      end;
    end;
  except
    ClientSocket1.Active := False;
  end;  // download

  if ClientSocket1.Tag = 1 then  // upload
  try
    texto := Socket.ReceiveText;
    if texto = 'arquivo' then
      Socket.SendStream(FCadastrarListaUsuarios.FStream)
    else ClientSocket1.Active := False;
  except
    ClientSocket1.Active := False;
  end;
}
end;

procedure TDM.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
{
  if ClientSocket1.Tag = 0 then
    Socket.SendText('download' + InttoStr(FCadastrarListaUsuarios.usuario_sq));
  if ClientSocket1.Tag = 1 then
    Socket.SendText('upload' + InttoStr(FCadastrarListaUsuarios.usuario_sq) + '/' + InttoStr(FCadastrarListaUsuarios.FStream.Size));
  tamanho := 0;
}
end;

procedure TDM.VisualizaObservacoes;
var
  observacao: String;
  contatos: TClientDataSet;
begin
  contatos := TContato.buscaContatosCliente(cdsCliente.FieldByName('CLIENTE_SQ').AsInteger, True);
  observacao := Trim(cdsCliente.FieldByName('OBSERVACAO').AsString);

  while not contatos.Eof do
  begin
    if observacao <> '' then
      observacao := observacao + chr(13) + chr(13);
    observacao := observacao + Trim(contatos.FieldByName('OBSERVACAO').AsString);
    contatos.Next;
  end;

  contatos.Close;

  if observacao <> '' then
      MessageDlg(observacao, mtInformation, [mbOK], 0);
end;

procedure TDM.geraNFe(numero_nfiscal: Integer; arquivo: String; motivoCancelamento: String);
var
  f: TextFile;
  reg: TRegistry;
  rodape, diretorio: String;
  {infAdic, }numeroNFe, formaEmissao, ambiente, tipoDanfe, cDV: Integer;
  cdsDuplicatas, cdsNFe, cdsEmpresa, cdsNCM, cdsEstados: TClientDataSet;
  produto: TProduto;
  cliente, clienteEmpresa: TCliente;
  item: TNfiscalItem;
  nfiscal: TNfiscal;
  //infNFe
//  a03,
  //ide
  b02, b03, b04, b05, b06, b07, b08, b09, b10, b10a, b11, b12, b21, b22, b23, b24, b25, b26, b27,
  //ideNFref
  b13, b15, b16, b17, b18, b19, b20,
  //emit
  c02, c02a, c03, c04, c06, c07, c08, c09, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21,
  //avulso
//  d02, d03, d04, d05, d06, d07, d08, d09, d10, d11, d12,
  //dest
  e02, e03, e04, e06, e07, e08, e09, e10, e11, e12, e13, e14, e15, e16, e17, e18,
  //retirada
//  f02, f03, f04, f05, f06, f07, f08, f09,
  //entrega
//  g02, g03, g04, g05, g06, g07, g08, g09,
  //totais
  w03, w04, w05, w06, w07, w08, w09, w10, w11, w12, w13, w14, w15, w16, w18, w19, w20, w21, w22, w24, w25, w26, w27, w28, w29, w30,
  //transporte
  x02, x04, x05, x06, x07, x08, x09, x10, x12, x13, x14, x15, x16, x17, x19, x20, x21,
  //transporte reboque
//  x23, x24, x25,
  //transporte volume
  {x26, }x27, x28, x29, x30, x31, x32,
  //transporte lacre
//  x34,
  //cobranca
  y03, y04, y05, y06,
  //inf adic
  {z02, z03, z05, }z06{, z08, z09, z11, z12}, za02, za03: String;

      procedure adicionaItem();
      var
        //det
        h02,
        //prod
        i02, i03, i04, i05, i06, i07, i08, i09, i10, i10a, i11, i12, i13, i14, i14a, i15, i16, i17, i17a,
        //prod declaracao de importacao
        i19, i20, i21, i22, i23, i24,
        //prod adi
//        i26, i27, i28, i29,
        //prod veic
//        j02, j03, j04, j05, j06, j07, j08, j09, j10, j11, j12, j13, j14, j15, j16, j17, j18, j19, j20, j21, j22, j23,
        //prod imp icms
        n11, n12, n12a, n13, {n14, }n15, n16, n17, {n18, n19, n20, }n21, {n22, }n23,
        //prod imp ipi
        o02, o03, o04, o05, o06, o09, o10, o11, o12, o13, o14,
        //prod imp ii
        p02, p03, p04, p05,
        //prod imp pis
        {q02, }q06, {q07, q08, q09, q10, q11,}
        //prod imp pisst
//        r02, r03, r04, r05, r06,
        //prod imp cofins
        s06, {s07, s08, s09, s10, s11,}
        //prod imp cofinsst
//        t02, t03, t04, t05, t06,
        //prod imp issqn
//        u02, u03, u04, u05, u06,
        //informacoes adicionais
        v01: String;
//        baseICMS: Real;
        i: Integer;

        procedure adicionaItemAdicao(itemAdicao: TNfiscalItemAdicao);
        var
          //prod adi
          i26, i27, i28, i29: String;
        begin
          i26 := IntToStr(itemAdicao.numero_adicao);
          i27 := IntToStr(itemAdicao.numero_sequencial_adicao);
          i28 := itemAdicao.codigo_fabricante;
          i29 := FloatToStr(itemAdicao.vlr_desc_adicao);

          Writeln(f, 'i25  ', '');
          Writeln(f, 'i26  ', i26);
          Writeln(f, 'i27  ', i27);
          Writeln(f, 'i28  ', i28);
          Writeln(f, 'i29  ', i29);
        end;
      begin
//        if length(cdsNCM.FieldByName('CODIGO_NBM').AsString) <> 8 then
//          raise Exception.Create('o NCM do item ' + cdsImprNfItemDESCRICAO_PRODUTO.AsString + ' deve ter 8 digitos.');

//        try
//          StrToInt(cdsNCM.FieldByName('CODIGO_NBM').AsString);
//        except
//          raise Exception.Create('o NCM do item ' + cdsImprNfItemDESCRICAO_PRODUTO.AsString + ' deve ter apenas números.');
//        end;

        //det
        h02 := IntToStr(item.item);// cdsImprNfItemITEM.AsString;
        Writeln(f, 'h02  ', h02);

        //prod
        i02 := item.produto_sq.codigo_produto;// cdsImprNfItemCODIGO_PRODUTO.AsString;
        i03 := '';
        i04 := item.produto_sq.descricao_produto;// cdsImprNfItemDESCRICAO_PRODUTO.AsString;
        i05 := item.produto_sq.nbm_sq.codigo_nbm;// cdsNCM.FieldByName('CODIGO_NBM').AsString;
        i06 := ''; // verificar se tem EX_TIPI
        i07 := ''; // verificar se tem genero no NCM
        i08 := nfiscal.natureza_sq.cfo;
        i09 := 'UN';
        i10 := IntToStr(item.qtde_item);// IntToStr(cdsImprNfItemqtde_item.Value);
        if i10 <> '0' then
        begin
          i10a := FloatToStrF(item.vlr_total_item/item.qtde_item, ffFixed, 10, 10);
        end;
        i11 := FloatToStr(item.vlr_total_item);// cdsImprNfItemVLR_TOTAL_ITEM.AsString;
        i12 := '';
        i13 := 'UN';
        i14 := IntToStr(item.qtde_item);// IntToStr(cdsImprNfItemqtde_item.Value);
        if i10 <> '0' then
        begin
          i14a := FloatToStrF(item.vlr_total_item/item.qtde_item, ffFixed, 10, 10);
        end;
        i15 := FloatToStr(item.vlr_frete_item);
        i16 := FloatToStr(item.vlr_seguro_item);
        i17 := '0';
        i17a := FloatToStr(item.vlr_desp_acess_item);

        //declaração de importação
        i19 := item.numero_di;
        i20 := DateToStr(item.data_di);
        i21 := item.local_desemb;
        i22 := item.uf_desemb;
        i23 := DateToStr(item.data_desemb);
        i24 := item.codigo_exportador;

        for i := 0 to item.listaAdicao.Count - 1 do
          adicionaItemAdicao(item.listaAdicao.Items[i]);

        //prod imp icms
        n11 := IntToStr(item.origem_mercadoria);
        n13 := '0';
//        n14 :=
        n15 := FloatToStr(item.base_icms_item);
        n16 := FloatToStr(item.aliq_icms_item);
        n17 := FloatToStr(item.vlr_icms_item);

        n21 := FloatToStr(item.base_icms_subst_item);
        n23 := FloatToStr(item.vlr_icms_subst_item);

        q06 := '01';
        s06 := '01';

        if empresaSelecionada.codigo_regime_tributario = 1 then
        begin
          n12a := IntToStr(empresaSelecionada.codigo_situacao_operacao);
          q06 := '99';
          s06 := '99';
        end else
        if (item.vlr_icms_subst_item = 0) and (item.vlr_icms_item > 0) then
        begin
          n12 := '00';
        end else
        if (item.vlr_icms_subst_item > 0) and (item.vlr_icms_item > 0) then
        begin
          n12 := '10';
        end else
        if (item.vlr_icms_subst_item > 0) and (item.vlr_icms_item = 0) then
        begin
          n12 := '60';
        end else
        if (item.vlr_icms_subst_item = 0) and (item.vlr_icms_item = 0) then
        begin
          if nfiscal.natureza_sq.tipo_nfiscal = 5 then
            n12 := '41'
          else
            n12 := '40';
        end;

        //prod imp ipi
//        if cdsImprNfItemVLR_IPI_ITEM.AsCurrency > 0 then
        if item.vlr_ipi_item > 0 then
        begin
          o02 := '';
          o03 := '';
          o04 := '';
          o05 := '';
          o06 := '999';
          o09 := '00';
          o10 := FloatToStr(item.vlr_total_item);// cdsImprNfItemVLR_TOTAL_ITEM.AsString;
          o11 := '';
          o12 := '';
          o13 := FloatToStr(item.aliq_ipi_item);// cdsImprNfItemALIQ_IPI_ITEM.AsString;
          o14 := FloatToStr(item.vlr_ipi_item);// cdsImprNfItemVLR_IPI_ITEM.AsString;
        end;

        //prod imp ii
        if item.vlr_ii_item > 0 then
        begin
          p02 := FloatToStr(item.base_ii_item);
          p03 := FloatToStr(item.vlr_desp_adu_item);
          p04 := FloatToStr(item.vlr_ii_item);
          p05 := FloatToStr(item.vlr_iof_item);
        end;

        //informacoes adicionais
        v01 := item.nr_serie_item;// cdsImprNfItemNR_SERIE_ITEM.AsString;
        for i := 0 to item.listaSerie.Count -1 do
        begin
          if (v01 <> '') then
            v01 := v01 + chr(13) + chr(10);
          v01 := v01 + TNfiscalItemSerie(item.listaSerie.Items[i]).produto_numero_serie_sq.numero_serie;
        end;
        v01 := StringReplace(v01, chr(13)+chr(10), ', ', [rfReplaceAll]);

        Writeln(f, 'i02  ', i02);
        Writeln(f, 'i03  ', i03);
        Writeln(f, 'i04  ', i04);
        Writeln(f, 'i05  ', i05);
        Writeln(f, 'i06  ', i06);
        Writeln(f, 'i07  ', i07);
        Writeln(f, 'i08  ', i08);
        Writeln(f, 'i09  ', i09);
        Writeln(f, 'i10  ', i10);
        Writeln(f, 'i10a ', i10a);
        Writeln(f, 'i11  ', i11);
        Writeln(f, 'i12  ', i12);
        Writeln(f, 'i13  ', i13);
        Writeln(f, 'i14  ', i14);
        Writeln(f, 'i14a ', i14a);
        Writeln(f, 'i15  ', i15);
        Writeln(f, 'i16  ', i16);
        Writeln(f, 'i17  ', i17);
        Writeln(f, 'i17a ', i17a);
        Writeln(f, 'i19  ', i19);
        Writeln(f, 'i20  ', i20);
        Writeln(f, 'i21  ', i21);
        Writeln(f, 'i22  ', i22);
        Writeln(f, 'i23  ', i23);
        Writeln(f, 'i24  ', i24);
        Writeln(f, 'n11  ', n11);
        Writeln(f, 'n12  ', n12);
        Writeln(f, 'n12a ', n12a);
        Writeln(f, 'n13  ', n13);
        Writeln(f, 'n15  ', n15);
        Writeln(f, 'n16  ', n16);
        Writeln(f, 'n17  ', n17);
        Writeln(f, 'n21  ', n21);
        Writeln(f, 'n23  ', n23);
        Writeln(f, 'o02  ', o02);
        Writeln(f, 'o03  ', o03);
        Writeln(f, 'o04  ', o04);
        Writeln(f, 'o05  ', o05);
        Writeln(f, 'o06  ', o06);
        Writeln(f, 'o09  ', o09);
        Writeln(f, 'o10  ', o10);
        Writeln(f, 'o11  ', o11);
        Writeln(f, 'o12  ', o12);
        Writeln(f, 'o13  ', o13);
        Writeln(f, 'o14  ', o14);
        Writeln(f, 'p02  ', p02);
        Writeln(f, 'p03  ', p03);
        Writeln(f, 'p04  ', p04);
        Writeln(f, 'p05  ', p05);
        Writeln(f, 'q06  ', q06);
        Writeln(f, 's06  ', s06);
        Writeln(f, 'v01  ', v01);
      end;

      procedure adicionaDuplicatas();
      var
        //cobrancadup
        y08, y09, y10: String;
        i: Integer;
      begin
        CriaDuplicatas(nfiscal.vIndice, True, numeroNFe);

        for i := Low (Duplicatas) to High(Duplicatas) do
        if Duplicatas[i].Valor <> 0 then
        begin
          y08 := Duplicatas[i].Numero;
          y09 := FormatDateTime('dd/mm/yyyy', DM.Duplicatas[i].Data);
          y10 := FloattoStrF(DM.Duplicatas[i].Valor, ffFixed, 10, 2);

          Writeln(f, 'y07');
          Writeln(f, 'y08  ', y08);
          Writeln(f, 'y09  ', y09);
          Writeln(f, 'y10  ', y10);
        end;
      end;

      procedure adicionaDuplicata();
      var
        //cobrancadup
        y08, y09, y10: String;
      begin
        //cobrancadup
        y08 := cdsDuplicatas.FieldByName('NUMERO_DUPLICATA').AsString + '\' + cdsDuplicatas.FieldByName('ITEM_DUPLICATA').AsString;
        y09 := cdsDuplicatas.FieldByName('DTVENCTO_DUPLICATA').AsString;
        y10 := cdsDuplicatas.FieldByName('VALOR_DUPLICATA').AsString;

        Writeln(f, 'y07');
        Writeln(f, 'y08  ', y08);
        Writeln(f, 'y09  ', y09);
        Writeln(f, 'y10  ', y10);
      end;

begin
  try
    cdsNFe := TClientDataSet.Create(DM);
    cdsNFe.RemoteServer := SCServer;
    cdsNFe.ProviderName := 'dspLista';
    cdsNFe.Close;
    SCServer.AppServer.CriaLista ('select max(numero_nfe) as numero_nfe from nfiscais');
    cdsNFe.Open;
    if cdsNFe.Eof then
      numeroNFe := 1
    else
      numeroNFe := cdsNFe.FieldByName('numero_nfe').AsInteger + 1;
    cdsNFe.Close;
    FreeAndNil(cdsNFe);

    cdsEmpresa := TClientDataSet.Create(DM);
    cdsEmpresa.RemoteServer := SCServer;
    cdsEmpresa.ProviderName := 'dspLista';
    cdsEmpresa.Close;
    SCServer.AppServer.CriaLista ('select * from empresas');
    cdsEmpresa.Open;

    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    begin
      diretorio := reg.ReadString('GeralPathLer');
      formaEmissao := Reg.ReadInteger('GeralFormaEmissao') + 1;
      ambiente := Reg.ReadInteger('WebServiceAmbiente') + 1;
      tipoDanfe := Reg.ReadInteger('GeralDANFE') + 1;
      if reg.ReadString('CertificadoNumSerie') = '' then
        raise Exception.Create('Não há um certificado configurado.');
    end
    else
      Exit;

    nfiscal := TNfiscal.CreateNumero(numero_nfiscal);

    if nfiscal.vIndice = null then
      raise Exception.Create('Nota fiscal não encontrada.');

    nfiscal.dtemissao_nfiscal := Date + Time;
    nfiscal.salvar;

    cdsNCM := TNCM.listaRegistros('order by codigo_nbm');
    cdsDuplicatas := nfiscal.listaDuplicatas;
    cdsEstados := TEstado.listaRegistros('order by codigo_estado');

    cdsNCM.Filtered := True;
    try
      if not DirectoryExists(diretorio) then
        raise Exception.Create('Diretorio não existe (' + diretorio + ').');

      if arquivo = '' then
        arquivo := diretorio + '\' + IntToStr(numero_nfiscal);

      AssignFile(f, arquivo);
      Rewrite(f);

      if nfiscal.numero_nfe > 0 then
        numeroNFe := nfiscal.numero_nfe;

      if nfiscal.dtemissao_nfiscal < StrToDate('01/09/2009') then
        numeroNFe := nfiscal.numero_nfiscal;

      if nfiscal.motivo_cancelamento <> '' then
        Writeln(f, 'cp09 ', nfiscal.motivo_cancelamento);

      if nfiscal.recibo_nfe <> '' then
        Writeln(f, 'recib', nfiscal.recibo_nfe);

      cDv := 0;

      clienteEmpresa := TCliente.buscaPorCodigo(cdsEmpresa.FieldByName('CODIGO_EMPRESA').AsString);

      cdsEstados.Locate('CODIGO_ESTADO', clienteEmpresa.estado, []);

      b02 := cdsEstados.FieldByName('codigo_ibge').AsString;
      b03 := IntToStr(nfiscal.numero_nfiscal);

      if (nfiscal.natureza_sq.descricao_natureza_nfiscal = '') then
        b04 := nfiscal.natureza_sq.descricao_natureza
      else
        b04 := nfiscal.natureza_sq.descricao_natureza_nfiscal;

      cdsDuplicatas.First;

      if (cdsDuplicatas.RecordCount = 0) then
        b05 := '2' // outros
      else if (cdsDuplicatas.RecordCount = 1) and (cdsDuplicatas.FieldByName('DTVENCTO_DUPLICATA').AsDateTime = Date) then
        b05 := '0' // a vista
      else
        b05 := '1'; // a prazo

      b06 := '55';
      b07 := '0';
      b08 := IntToStr(numeroNFe);
      b09 := DateToStr(nfiscal.dtemissao_nfiscal);
      if (nfiscal.dtsaida_nfiscal <> null) then
      begin
        b10 := DateToStr(nfiscal.dtsaida_nfiscal);
        b10a := DateTimeToStr(nfiscal.dtsaida_nfiscal);
      end;
      b11 := IntToStr(Pos (nfiscal.natureza_sq.ent_sai, 'ES')-1);
      b12 := buscaCodigoMun(clienteEmpresa.estado, clienteEmpresa.cidade);
      b21 := IntToStr(tipoDanfe);
      b22 := IntToStr(formaEmissao);
      b23 := IntToStr(cDV);
      b24 := IntToStr(ambiente);
      b25 := '1'; //finalidade.
      if nfiscal.natureza_sq.tipo_nfiscal = 8 then
      begin
        With buscaNF(nfiscal.nfiscal_sq_referencia) do
        begin
          if FieldByName('numero_nfe').AsInteger <> 0 then
            b13 := FieldByName('nfe_chave').AsString
          else
          begin
            b15 := b02;
            b16 := FormatDateTime('yymm', FieldByName('dtemissao_nfiscal').AsDateTime);
            b17 := clienteEmpresa.codigo_cliente;
            b18 := '01';
            b19 := '0';
            b20 := FieldByName('numero_nfiscal').AsString;
          end;
        end;
        b25 := '2' // nota fiscal complementar
     end;

      b26 := '0';
      b27 := '1';

      Writeln(f, 'b02  ', b02);
      Writeln(f, 'b03  ', b03);
      Writeln(f, 'b04  ', b04);
      Writeln(f, 'b05  ', b05);
      Writeln(f, 'b06  ', b06);
      Writeln(f, 'b07  ', b07);
      Writeln(f, 'b08  ', b08);
      Writeln(f, 'b09  ', b09);
      Writeln(f, 'b10  ', b10);
      Writeln(f, 'b10a ', b10a);
      Writeln(f, 'b11  ', b11);
      Writeln(f, 'b12  ', b12);
      Writeln(f, 'b13  ', b13);
      Writeln(f, 'b15  ', b15);
      Writeln(f, 'b16  ', b16);
      Writeln(f, 'b17  ', b17);
      Writeln(f, 'b18  ', b18);
      Writeln(f, 'b19  ', b19);
      Writeln(f, 'b20  ', b20);
      Writeln(f, 'b21  ', b21);
      Writeln(f, 'b22  ', b22);
      Writeln(f, 'b23  ', b23);
      Writeln(f, 'b24  ', b24);
      Writeln(f, 'b25  ', b25);
      Writeln(f, 'b26  ', b26);
      Writeln(f, 'b27  ', b27);

      c02 := clienteEmpresa.codigo_cliente;
      c02a := '';
      c03 := clienteEmpresa.nome_cliente;
      c04 := clienteEmpresa.nome_fantasia;
      c06 := clienteEmpresa.endereco;
      c07 := clienteEmpresa.numero;
      c08 := clienteEmpresa.compl_endereco;
      c09 := clienteEmpresa.bairro;
      c10 := buscaCodigoMun(clienteEmpresa.estado, clienteEmpresa.cidade);
      c11 := clienteEmpresa.cidade;
      c12 := clienteEmpresa.estado;
      c13 := clienteEmpresa.cep;
      c14 := '1058';
      c15 := 'Brasil';
      c16 := clienteEmpresa.ddd_fone1 + clienteEmpresa.numero_fone1;
      c17 := SoNumeros(clienteEmpresa.inscr_estadual);
      c18 := '';
      c19 := clienteEmpresa.inscr_municipal;
      c20 := clienteEmpresa.cnae;
      c21 := IntToStr(empresaSelecionada.codigo_regime_tributario); {1 – Simples Nacional; 2 – Simples Nacional – excesso de sublimite de receita bruta; 3 – Regime Normal. (v2.0).}

      Writeln(f, 'c02  ', c02);
      Writeln(f, 'c02a ', c02a);
      Writeln(f, 'c03  ', c03);
      Writeln(f, 'c04  ', c04);
      Writeln(f, 'c06  ', c06);
      Writeln(f, 'c07  ', c07);
      Writeln(f, 'c08  ', c08);
      Writeln(f, 'c09  ', c09);
      Writeln(f, 'c10  ', c10);
      Writeln(f, 'c11  ', c11);
      Writeln(f, 'c12  ', c12);
      Writeln(f, 'c13  ', c13);
      Writeln(f, 'c14  ', c14);
      Writeln(f, 'c15  ', c15);
      Writeln(f, 'c16  ', c16);
      Writeln(f, 'c17  ', c17);
      Writeln(f, 'c18  ', c18);
      Writeln(f, 'c19  ', c19);
      Writeln(f, 'c20  ', c20);
      Writeln(f, 'c21  ', c21);

      //dest
      cliente := TCliente.buscaPorCodigo(nfiscal.cliente_sq.codigo_cliente);

//      if clçiente.codigo_cliente = '' then
//        raise Exception.Create('O CPF/CNPJ do destinatário deve ser informado.');

//      if cliente.numero = '' then
//        raise Exception.Create('O número do endereço do destinatário deve ser informado.');

//      if cliente.bairro = '' then
//        raise Exception.Create('O bairro do destinatário deve ser informado.');

//      if length(cliente.ddd_fone1 + cliente.numero_fone1) > 10 then
//        raise Exception.Create('O telefone do destinatário deve ter no máximo 10 digitos (' + cliente.ddd_fone1 + cliente.numero_fone1 + ').');

      e04 := cliente.nome_cliente;
      if (cliente.endereco <> '') then
      begin
        e06 := cliente.endereco;
        e07 := cliente.numero;
        e08 := cliente.compl_endereco;
        e09 := cliente.bairro;
        e11 := cliente.cidade;
        e12 := cliente.estado;
        e13 := cliente.cep;
        e14 := buscaCodigoPais(cliente.pais);
        e15 := cliente.pais;
      end
      else
      begin
        e06 := clienteEmpresa.endereco;
        e07 := clienteEmpresa.numero;
        e08 := clienteEmpresa.compl_endereco;
        e09 := clienteEmpresa.bairro;
        e11 := clienteEmpresa.cidade;
        e12 := clienteEmpresa.estado;
        e13 := clienteEmpresa.cep;
        e14 := buscaCodigoPais(clienteEmpresa.pais);
        e15 := clienteEmpresa.pais;
      end;
      e16 := cliente.ddd_fone1 + cliente.numero_fone1;
      e17 := SoNumeros(cliente.inscr_estadual);
      e18 := cliente.codigo_suframa;
      if (e14 <> '1058') then
      begin
        e02 := '';
        e03 := '';
      end
      else
      begin
        e02 := cliente.codigo_cliente;
        e03 := cliente.codigo_cliente;
        if (cliente.endereco <> '') then
          e10 := buscaCodigoMun(cliente.estado, cliente.cidade)
        else
          e10 := buscaCodigoMun(clienteEmpresa.estado, clienteEmpresa.cidade);
      end;

      Writeln(f, 'e02  ', e02);
      Writeln(f, 'e03  ', e03);
      Writeln(f, 'e04  ', e04);
      Writeln(f, 'e06  ', e06);
      Writeln(f, 'e07  ', e07);
      Writeln(f, 'e08  ', e08);
      Writeln(f, 'e09  ', e09);
      Writeln(f, 'e10  ', e10);
      Writeln(f, 'e11  ', e11);
      Writeln(f, 'e12  ', e12);
      Writeln(f, 'e13  ', e13);
      Writeln(f, 'e14  ', e14);
      Writeln(f, 'e15  ', e15);
      Writeln(f, 'e16  ', e16);
      Writeln(f, 'e17  ', e17);
      Writeln(f, 'e18  ', e18);

      With nfiscal.listaItens do
      While not Eof do
      begin
        item := TNfiscalItem.Create(FieldByName('nfiscal_item_sq').Value);
        produto := item.produto_sq;
        cdsNCM.Filter := 'nbm_sq = ' + VarToStr(produto.nbm_sq.vIndice);
        adicionaItem();
        Next;
      end;
{
      While not cdsImprNfItem.Eof do
      begin
        produto := TProduto.Create(cdsImprNfItemPRODUTO_SQ.Value);
        cdsNCM.Filter := 'nbm_sq = ' + VarToStr(produto.nbm_sq.vIndice);

        adicionaItem();

        cdsImprNfItem.Next;
      end;
}
      //totais
      w03 := FloatToStr(nfiscal.base_icms);
      w04 := FloatToStr(nfiscal.vlr_icms);
      w05 := FloatToStr(nfiscal.base_icms_subst);
      w06 := FloatToStr(nfiscal.vlr_icms_subst);
      w07 := FloatToStr(nfiscal.vlr_produtos);
      w08 := FloatToStr(nfiscal.vlr_frete);
      w09 := FloatToStr(nfiscal.vlr_seguro);
      w10 := '';
      w11 := FloatToStr(nfiscal.vlr_ii);
      w12 := FloatToStr(nfiscal.vlr_ipi);
      w13 := '';
      w14 := '';
      w15 := FloatToStr(nfiscal.vlr_desp_acess);
      w16 := FloatToStr(nfiscal.vlr_total);
      w18 := '';
      w19 := '';
      w20 := '';
      w21 := '';
      w22 := '';
      w24 := '';
      w25 := '';
      w26 := '';
      w27 := '';
      w28 := '';
      w29 := '';
      w30 := '';

      Writeln(f, 'w03  ', w03);
      Writeln(f, 'w04  ', w04);
      Writeln(f, 'w05  ', w05);
      Writeln(f, 'w06  ', w06);
      Writeln(f, 'w07  ', w07);
      Writeln(f, 'w08  ', w08);
      Writeln(f, 'w09  ', w09);
      Writeln(f, 'w10  ', w10);
      Writeln(f, 'w11  ', w11);
      Writeln(f, 'w12  ', w12);
      Writeln(f, 'w13  ', w13);
      Writeln(f, 'w14  ', w14);
      Writeln(f, 'w15  ', w15);
      Writeln(f, 'w16  ', w16);
      Writeln(f, 'w18  ', w18);
      Writeln(f, 'w19  ', w19);
      Writeln(f, 'w20  ', w20);
      Writeln(f, 'w21  ', w21);
      Writeln(f, 'w22  ', w22);
      Writeln(f, 'w24  ', w24);
      Writeln(f, 'w25  ', w25);
      Writeln(f, 'w26  ', w26);
      Writeln(f, 'w27  ', w27);
      Writeln(f, 'w28  ', w28);
      Writeln(f, 'w29  ', w29);
      Writeln(f, 'w30  ', w30);

      if Trim(nfiscal.transportadora_sq.CODIGO_TRANSPORTADORA) <> '' then
      begin
        //transporte
        x02 := IntToStr(StrToInt(nfiscal.frete_transp)-1);
        if x02 = '-1' then
          x02 := '0';

        x04 := nfiscal.transportadora_sq.CODIGO_TRANSPORTADORA;
        if (length(x04) <> 11) and (length(x04) <> 14) then
          x04 := '00000000000';

        x05 := '';
        x06 := nfiscal.transportadora_sq.NOME_TRANSPORTADORA;
        x07 := SoNumeros(nfiscal.transportadora_sq.INSCR_ESTADUAL);
        x08 := nfiscal.transportadora_sq.ENDERECO_TRANSPORTADORA;
        x09 := nfiscal.transportadora_sq.MUNICIPIO_TRANSPORTADORA;
        x10 := nfiscal.transportadora_sq.ESTADO_TRANSPORTADORA;
        x12 := '';
        x13 := '';
        x14 := '';
        x15 := '';
        x16 := '';
        x17 := '';
        x19 := nfiscal.placa_transp;
        x20 := nfiscal.uf_placa_transp;
        x21 := '';

        //transporte volume
        x27 := IntToStr(nfiscal.qtde_transp);
        x28 := nfiscal.especie_transp;
        x29 := nfiscal.marca_transp;
        x30 := nfiscal.numero_transp;
        x31 := nfiscal.pliquido_transp;
        x32 := nfiscal.pbruto_transp;

        Writeln(f, 'x02  ', x02);
        Writeln(f, 'x04  ', x04);
        Writeln(f, 'x05  ', x05);
        Writeln(f, 'x06  ', x06);
        Writeln(f, 'x07  ', x07);
        Writeln(f, 'x08  ', x08);
        Writeln(f, 'x09  ', x09);
        Writeln(f, 'x10  ', x10);
        Writeln(f, 'x12  ', x12);
        Writeln(f, 'x13  ', x13);
        Writeln(f, 'x14  ', x14);
        Writeln(f, 'x15  ', x15);
        Writeln(f, 'x16  ', x16);
        Writeln(f, 'x17  ', x17);
        Writeln(f, 'x19  ', x19);
        Writeln(f, 'x20  ', x20);
        Writeln(f, 'x21  ', x21);
        if x27 <> '' then
          Writeln(f, 'x26  ', '');

        Writeln(f, 'x27  ', x27);
        Writeln(f, 'x28  ', x28);
        Writeln(f, 'x29  ', x29);
        Writeln(f, 'x30  ', x30);
        Writeln(f, 'x31  ', x31);
        Writeln(f, 'x32  ', x32);
      end;

      //cobranca
      y03 := VarToStr(nfiscal.numero_nfe);
      y04 := FloatToStr(nfiscal.vlr_total);
      y05 := '';
      y06 := FloatToStr(nfiscal.vlr_total);

      Writeln(f, 'y03  ', y03);
      Writeln(f, 'y04  ', y04);
      Writeln(f, 'y05  ', y05);
      Writeln(f, 'y06  ', y06);

      adicionaDuplicatas();

      {
      While not cdsDuplicatas.Eof do
      begin
        adicionaDuplicata();
        cdsDuplicatas.Next;
      end;
}

      //inf adic
      rodape := Trim(nfiscal.inf_adicional);
      if Trim(nfiscal.mensagem) <> '' then
      begin
        if rodape <> '' then
          rodape := rodape + chr(13)+chr(10);
        rodape := rodape + Trim(nfiscal.mensagem);
      end;
      rodape := rodape + chr(13);

      While rodape <> '' do
      begin
        z06 := Copy(rodape, 1, Pos(chr(13), rodape)-1);
        if length(z06) > 60 then
        begin
          z06 := Copy(z06, 1, 60);
          rodape := Copy(rodape, 61, 1000);
        end
        else
          rodape := Copy(rodape, length(z06)+3, 1000);

        if Trim(z06) <> '' then
        begin
          Writeln(f, 'z05  ', '*');
          Writeln(f, 'z06  ', z06);
        end;
      end;

      za02 := nfiscal.uf_embarque;
      za03 := nfiscal.local_embarque;

      Writeln(f, 'za02 ', za02);
      Writeln(f, 'za03 ', za03);

      CloseFile(f);

      MoveFileEx(PAnsiChar(diretorio + '\' + IntToStr(numero_nfiscal)), PAnsiChar(diretorio + '\' + IntToStr(numero_nfiscal) + '.txt'), MOVEFILE_REPLACE_EXISTING);
    except on E: Exception do
      begin
        CloseFile(f);
        DeleteFile(diretorio + '\' + IntToStr(numero_nfiscal));
        ShowMessage(e.Message);
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;

    FreeAndNil(cdsNCM);
    FreeAndNil(cdsDuplicatas);
    FreeAndNil(cdsEstados);
  end;
end;

function TDM.buscaCodigoMun(estado, cidade: String): String;
var
  mun: TextFile;
  nomeArquivo, linha: String;
  cdsEstado: TClientDataSet;
begin
  cdsEstado := TEstado.listaRegistros('where codigo_estado = ' + QuotedStr(estado));

  if cdsEstado.RecordCount = 0 then
    raise Exception.Create('Não foi possível encontrar o estado "'+estado+'"');

  if cdsEstado.FieldByName('codigo_ibge').AsInteger = 0 then
    raise Exception.Create('O código IBGE do estado "' + estado + '" não pode ser 0.');

  cidade := Trim(Acentos(cidade));

  if (not DirectoryExists(ExtractFilePath(Application.ExeName) + 'MunIBGE')) then
    raise Exception.Create('O diretório "' + ExtractFilePath(Application.ExeName) + 'MunIBGE" não existe.');

  nomeArquivo := ExtractFilePath(Application.ExeName) + 'MunIBGE\MunIBGE-UF' + cdsEstado.FieldByName('codigo_ibge').AsString + '.txt';

  if (not FileExists(nomeArquivo)) then
    raise Exception.Create('O arquivo "MunIBGE-UF' + cdsEstado.FieldByName('codigo_ibge').AsString + '.txt" não existe.');

  AssignFile(mun, nomeArquivo);
  Reset(mun);
  cdsEstado.Close;
  
  result := '';
  While not Eof(mun) do
  begin
    Readln(mun, linha);
    if cidade = Trim(Acentos(Copy(linha, 9, 200))) then
      result := Copy(linha, 1, 7);
  end;
  if result = '' then
    raise Exception.Create('Não foi possível encontrar o código da cidade "' + cidade + '". Arquivo: ' + nomeArquivo);
end;

function TDM.buscaCodigoPais(pais: String): String;
begin
  pais := Acentos(pais);

  if pais = Acentos('Afeganistão') then result := '132';
  if pais = Acentos('África do Sul') then result := '7560';
  if pais = Acentos('Albânia, República da') then result := '175';
  if pais = Acentos('Alemanha') then result := '230';
  if pais = Acentos('Andorra') then result := '370';
  if pais = Acentos('Angola') then result := '400';
  if pais = Acentos('Anguilla') then result := '418';
  if pais = Acentos('Antigua e Barbuda') then result := '434';
  if pais = Acentos('Antilhas Holandesas') then result := '477';
  if pais = Acentos('Arábia Saudita') then result := '531';
  if pais = Acentos('Argélia') then result := '590';
  if pais = Acentos('Argentina') then result := '639';
  if pais = Acentos('Armênia, República da') then result := '647';
  if pais = Acentos('Aruba') then result := '655';
  if pais = Acentos('Austrália') then result := '698';
  if pais = Acentos('Áustria') then result := '728';
  if pais = Acentos('Azerbaijão, República do') then result := '736';
  if pais = Acentos('Bahamas, Ilhas') then result := '779';
  if pais = Acentos('Bahrein, Ilhas') then result := '809';
  if pais = Acentos('Bangladesh') then result := '817';
  if pais = Acentos('Barbados') then result := '833';
  if pais = Acentos('Belarus') then result := '850';
  if pais = Acentos('Bélgica') then result := '876';
  if pais = Acentos('Belize') then result := '884';
  if pais = Acentos('Benin') then result := '2291';
  if pais = Acentos('Bermudas') then result := '906';
  if pais = Acentos('Bolívia') then result := '973';
  if pais = Acentos('Bósnia-Herzegovina') then result := '981';
  if pais = Acentos('Botsuana') then result := '1015';
  if pais = Acentos('Brasil') then result := '1058';
  if pais = Acentos('Brunei') then result := '1082';
  if pais = Acentos('Bulgária, República da') then result := '1112';
  if pais = Acentos('Burkina Faso') then result := '310';
  if pais = Acentos('Burundi') then result := '1155';
  if pais = Acentos('Butão') then result := '1198';
  if pais = Acentos('Cabo Verde, República de') then result := '1279';
  if pais = Acentos('Camarões') then result := '1457';
  if pais = Acentos('Camboja') then result := '1414';
  if pais = Acentos('Canadá') then result := '1490';
  if pais = Acentos('Canal, Ilhas do (Jersey e Guernsey)') then result := '1504';
  if pais = Acentos('Canárias, Ilhas') then result := '1511';
  if pais = Acentos('Catar') then result := '1546';
  if pais = Acentos('Cayman, Ilhas') then result := '1376';
  if pais = Acentos('Cazaquistão, República do') then result := '1538';
  if pais = Acentos('Chade') then result := '7889';
  if pais = Acentos('Chile') then result := '1589';
  if pais = Acentos('China, República Popular da') then result := '1600';
  if pais = Acentos('Chipre') then result := '1635';
  if pais = Acentos('Christmas, Ilha (Navidad)') then result := '5118';
  if pais = Acentos('Cingapura') then result := '7412';
  if pais = Acentos('Cocos (Keeling), Ilhas') then result := '1651';
  if pais = Acentos('Colômbia') then result := '1694';
  if pais = Acentos('Comores, Ilhas') then result := '1732';
  if pais = Acentos('Congo, República Democrática do') then result := '8885';
  if pais = Acentos('Congo, República do') then result := '1775';
  if pais = Acentos('Cook, Ilhas') then result := '1830';
  if pais = Acentos('Coréia, Rep. Pop. Democrática da') then result := '1872';
  if pais = Acentos('Coréia, República da') then result := '1902';
  if pais = Acentos('Costa do Marfim') then result := '1937';
  if pais = Acentos('Costa Rica') then result := '1961';
  if pais = Acentos('Coveite') then result := '1988';
  if pais = Acentos('Croácia, República da') then result := '1953';
  if pais = Acentos('Cuba') then result := '1996';
  if pais = Acentos('Dinamarca') then result := '2321';
  if pais = Acentos('Djibuti') then result := '7838';
  if pais = Acentos('Dominica, Ilha') then result := '2356';
  if pais = Acentos('Egito') then result := '2402';
  if pais = Acentos('El Salvador') then result := '6874';
  if pais = Acentos('Emirados Árabes Unidos') then result := '2445';
  if pais = Acentos('Equador') then result := '2399';
  if pais = Acentos('Eritréia') then result := '2437';
  if pais = Acentos('Escócia') then result := '6289';
  if pais = Acentos('Eslovaca, República') then result := '2470';
  if pais = Acentos('Eslovênia, República da') then result := '2461';
  if pais = Acentos('Espanha') then result := '2453';
  if pais = Acentos('Estados Unidos') then result := '2496';
  if pais = Acentos('Estônia, República da') then result := '2518';
  if pais = Acentos('Etiópia') then result := '2534';
  if pais = Acentos('Falkland (Ilhas Malvinas)') then result := '2550';
  if pais = Acentos('Feroe, Ilhas') then result := '2593';
  if pais = Acentos('Fiji') then result := '8702';
  if pais = Acentos('Filipinas') then result := '2674';
  if pais = Acentos('Finlândia') then result := '2712';
  if pais = Acentos('Formosa (Taiwan)') then result := '1619';
  if pais = Acentos('França') then result := '2755';
  if pais = Acentos('Gabão') then result := '2810';
  if pais = Acentos('Gales, País de') then result := '6289';
  if pais = Acentos('Gâmbia') then result := '2852';
  if pais = Acentos('Gana') then result := '2895';
  if pais = Acentos('Geórgia, República da') then result := '2917';
  if pais = Acentos('Gibraltar') then result := '2933';
  if pais = Acentos('Grã-Bretanha') then result := '6289';
  if pais = Acentos('Granada') then result := '2976';
  if pais = Acentos('Grécia') then result := '3018';
  if pais = Acentos('Groenlândia') then result := '3050';
  if pais = Acentos('Guadalupe') then result := '3093';
  if pais = Acentos('Guam') then result := '3131';
  if pais = Acentos('Guatemala') then result := '3174';
  if pais = Acentos('Guiana') then result := '3379';
  if pais = Acentos('Guiana Francesa') then result := '3255';
  if pais = Acentos('Guiné') then result := '3298';
  if pais = Acentos('Guiné-Bissau') then result := '3344';
  if pais = Acentos('Guiné-Equatorial') then result := '3310';
  if pais = Acentos('Haiti') then result := '3417';
  if pais = Acentos('Holanda (Países Baixos)') then result := '5738';
  if pais = Acentos('Honduras') then result := '3450';
  if pais = Acentos('Hong Kong, Região Adm. Especial') then result := '3514';
  if pais = Acentos('Hong Kong') then result := '3514';
  if pais = Acentos('Hungria, República da') then result := '3557';
  if pais = Acentos('Iêmen') then result := '3573';
  if pais = Acentos('Índia') then result := '3611';
  if pais = Acentos('Indonésia') then result := '3654';
  if pais = Acentos('Inglaterra') then result := '6289';
  if pais = Acentos('Irã, República Islâmica do') then result := '3727';
  if pais = Acentos('Iraque') then result := '3697';
  if pais = Acentos('Irlanda') then result := '3751';
  if pais = Acentos('Irlanda do Norte') then result := '6289';
  if pais = Acentos('Islândia') then result := '3794';
  if pais = Acentos('Israel') then result := '3832';
  if pais = Acentos('Itália') then result := '3867';
  if pais = Acentos('Iugoslávia, República Fed. da') then result := '3883';
  if pais = Acentos('Jamaica') then result := '3913';
  if pais = Acentos('Japão') then result := '3999';
  if pais = Acentos('Johnston, Ilhas') then result := '3964';
  if pais = Acentos('Jordânia') then result := '4030';
  if pais = Acentos('Kiribati') then result := '4111';
  if pais = Acentos('Laos, Rep. Pop. Democrática do') then result := '4200';
  if pais = Acentos('Lebuan') then result := '4235';
  if pais = Acentos('Lesoto') then result := '4260';
  if pais = Acentos('Letônia, República da') then result := '4278';
  if pais = Acentos('Líbano') then result := '4316';
  if pais = Acentos('Libéria') then result := '4340';
  if pais = Acentos('Líbia') then result := '4383';
  if pais = Acentos('Liechtenstein') then result := '4405';
  if pais = Acentos('Lituânia, República da') then result := '4421';
  if pais = Acentos('Luxemburgo') then result := '4456';
  if pais = Acentos('Macau') then result := '4472';
  if pais = Acentos('Macedônia') then result := '4499';
  if pais = Acentos('Madagascar') then result := '4502';
  if pais = Acentos('Madeira, Ilha da') then result := '4525';
  if pais = Acentos('Malásia') then result := '4553';
  if pais = Acentos('Malavi') then result := '4588';
  if pais = Acentos('Maldivas') then result := '4618';
  if pais = Acentos('Máli') then result := '4642';
  if pais = Acentos('Malta') then result := '4677';
  if pais = Acentos('Man, Ilhas') then result := '3595';
  if pais = Acentos('Marianas do Norte') then result := '4723';
  if pais = Acentos('Marrocos') then result := '4740';
  if pais = Acentos('Marshall, Ilhas') then result := '4766';
  if pais = Acentos('Martinica') then result := '4774';
  if pais = Acentos('Maurício') then result := '4855';
  if pais = Acentos('Mauritânia') then result := '4880';
  if pais = Acentos('Mayotte') then result := '4885';
  if pais = Acentos('Ilhas Francesas') then result := '4885';
  if pais = Acentos('México') then result := '4936';
  if pais = Acentos('Mianmar (Birmânia)') then result := '930';
  if pais = Acentos('Micronésia') then result := '4995';
  if pais = Acentos('Midway, Ilhas') then result := '4901';
  if pais = Acentos('Moçambique') then result := '5053';
  if pais = Acentos('Moldávia, República da') then result := '4944';
  if pais = Acentos('Mônaco') then result := '4952';
  if pais = Acentos('Mongólia') then result := '4979';
  if pais = Acentos('Montserrat, Ilhas') then result := '5010';
  if pais = Acentos('Namíbia') then result := '5070';
  if pais = Acentos('Nauru') then result := '5088';
  if pais = Acentos('Nepal') then result := '5177';
  if pais = Acentos('Nicarágua') then result := '5215';
  if pais = Acentos('Niger') then result := '5258';
  if pais = Acentos('Nigéria') then result := '5282';
  if pais = Acentos('Niue, Ilha') then result := '5312';
  if pais = Acentos('Norfolk, Ilha') then result := '5355';
  if pais = Acentos('Noruega') then result := '5380';
  if pais = Acentos('Nova Caledônia') then result := '5428';
  if pais = Acentos('Nova Zelândia') then result := '5487';
  if pais = Acentos('Omã') then result := '5568';
  if pais = Acentos('Países Baixos (Holanda)') then result := '5738';
  if pais = Acentos('Palau') then result := '5754';
  if pais = Acentos('Panamá') then result := '5800';
  if pais = Acentos('Papua Nova Guiné') then result := '5452';
  if pais = Acentos('Paquistão') then result := '5762';
  if pais = Acentos('Paraguai') then result := '5860';
  if pais = Acentos('Peru') then result := '5894';
  if pais = Acentos('Pitcairn, Ilha') then result := '5932';
  if pais = Acentos('Polinésia Francesa') then result := '5991';
  if pais = Acentos('Polônia, República da') then result := '6033';
  if pais = Acentos('Porto Rico') then result := '6114';
  if pais = Acentos('Portugal') then result := '6076';
  if pais = Acentos('Quênia') then result := '6238';
  if pais = Acentos('Quirguiz, República') then result := '6254';
  if pais = Acentos('Reino Unido') then result := '6289';
  if pais = Acentos('República Centro-Africana') then result := '6408';
  if pais = Acentos('República Dominicana') then result := '6475';
  if pais = Acentos('Reunião, Ilha') then result := '6602';
  if pais = Acentos('Romênia') then result := '6700';
  if pais = Acentos('Ruanda') then result := '6750';
  if pais = Acentos('Rússia') then result := '6769';
  if pais = Acentos('Saara Ocidental') then result := '6858';
  if pais = Acentos('Salomão, Ilhas') then result := '6777';
  if pais = Acentos('Samoa') then result := '6904';
  if pais = Acentos('Samoa Americana') then result := '6912';
  if pais = Acentos('San Marino') then result := '6971';
  if pais = Acentos('Santa Helena') then result := '7102';
  if pais = Acentos('Santa Lúcia') then result := '7153';
  if pais = Acentos('São Cristóvão e Neves') then result := '6955';
  if pais = Acentos('São Pedro e Miquelon') then result := '7005';
  if pais = Acentos('São Tomé e Príncipe, Ilhas') then result := '7200';
  if pais = Acentos('São Vicente e Granadinas') then result := '7056';
  if pais = Acentos('Senegal') then result := '7285';
  if pais = Acentos('Serra Leoa') then result := '7358';
  if pais = Acentos('Seychelles') then result := '7315';
  if pais = Acentos('Síria, República Árabe da') then result := '7447';
  if pais = Acentos('Somália') then result := '7480';
  if pais = Acentos('Sri Lanka') then result := '7501';
  if pais = Acentos('Suazilândia') then result := '7544';
  if pais = Acentos('Sudão') then result := '7595';
  if pais = Acentos('Suécia') then result := '7641';
  if pais = Acentos('Suíça') then result := '7676';
  if pais = Acentos('Suriname') then result := '7706';
  if pais = Acentos('Tadjiquistão') then result := '7722';
  if pais = Acentos('Tailândia') then result := '7765';
  if pais = Acentos('Tanzânia, República Unida da') then result := '7803';
  if pais = Acentos('Tcheca, República') then result := '7919';
  if pais = Acentos('Território Britânico Oc. Índico') then result := '7820';
  if pais = Acentos('Timor Leste') then result := '7951';
  if pais = Acentos('Togo') then result := '8001';
  if pais = Acentos('Tonga') then result := '8109';
  if pais = Acentos('Toquelau, Ilhas') then result := '8052';
  if pais = Acentos('Trinidad e Tobago') then result := '8150';
  if pais = Acentos('Tunísia') then result := '8206';
  if pais = Acentos('Turcas e Caicos, Ilhas') then result := '8230';
  if pais = Acentos('Turcomenistão, República do') then result := '8249';
  if pais = Acentos('Turquia') then result := '8273';
  if pais = Acentos('Tuvalu') then result := '8281';
  if pais = Acentos('Ucrânia') then result := '8311';
  if pais = Acentos('Uganda') then result := '8338';
  if pais = Acentos('Uruguai') then result := '8451';
  if pais = Acentos('Uzbequistão, República do') then result := '8478';
  if pais = Acentos('Vanuatu') then result := '5517';
  if pais = Acentos('Vaticano, Estado da Cidade do') then result := '8486';
  if pais = Acentos('Venezuela') then result := '8508';
  if pais = Acentos('Vietnã') then result := '8583';
  if pais = Acentos('Virgens, Ilhas (Britânicas)') then result := '8630';
  if pais = Acentos('Virgens, Ilhas (E.U.A.)') then result := '8664';
  if pais = Acentos('Wake, Ilha') then result := '8737';
  if pais = Acentos('Wallis e Futuna, Ilhas') then result := '8753';
  if pais = Acentos('Zâmbia') then result := '8907';
  if pais = Acentos('Zimbábue') then result := '6653';
  if pais = Acentos('Zona do Canal do Panamá') then result := '8958';
  if result = '' then
    raise Exception.Create('País não encontrado: ' + pais);
end;

function TDM.Acentos(Str:String): String;
Const
  ComAcento = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
  x : Integer;
Begin
  For x := 1 to Length(Str) do
  Begin
    if Pos(Str[x],ComAcento)<>0 Then
      Str[x] := SemAcento[Pos(Str[x],ComAcento)]
  end;
  Result := Trim(UpperCase(Str));
end;

function TDM.SoNumeros(str: String): String;
Var
  x : Integer;
Begin
  result := '';
  For x := 1 to Length(Str) do
    if Pos(Str[x],'0123456789')<>0 Then
      result := result + Str[x];
end;

procedure TDM.verificaNFeTimer(Sender: TObject);
var
  reg: TRegistry;
  chaveNFe, diretorio, recibo, linha: String;
  F: TSearchRec;
  fResposta: TextFile;
  numeroNFe, numero_nota, Ret: Integer;
  motivo: TStringList;
  cdsNota: TClientDataSet;
  notaCancelada, notaEmitida: Boolean;
  notaFiscal: TNfiscal;
begin
  verificaNFe.Enabled := False;

  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\MSystem', True);

    diretorio := reg.ReadString('GeralPathSalvar');

    CreateDir(diretorio+'\backup');
    Ret := FindFirst(diretorio+'\*.txt', faAnyFile, F);
    while Ret = 0 do
    try
      try
        motivo := TStringList.Create;
        AssignFile(fResposta, diretorio + '\' + F.Name);
        Reset(fResposta);
        Readln(fResposta, numero_nota);
        Readln(fResposta, chaveNFe);
        Readln(fResposta, recibo);
        numeroNFe := StrToInt(Copy(chaveNFe, 29, 9));

        While not Eof(fResposta) do
        begin
          Readln(fResposta, linha);
          motivo.Add(linha);
        end;

        notaCancelada := Pos('Cancelamento de NF-e homologado', motivo.Text) = 1;
        notaEmitida := Pos('Autorizado o uso da NF-e', motivo.Text) = 1;

        if (not notaCancelada) and (not notaEmitida) then
          chaveNFe := '';

        if Pos ('Nota(s) não confirmadas', motivo.Text) > 0 then
          raise Exception.Create(motivo.Text);

        if Pos ('Falha', motivo.Text) > 0 then
          raise Exception.Create(motivo.Text);

        if Pos ('Rejeição:', motivo.Text) > 0 then
          raise Exception.Create(motivo.Text);

        if Pos ('Lote em processamento', motivo.Text) > 0 then
          chaveNFe := '';

        if (notaCancelada or notaEmitida) then
        begin
          if (notaEmitida) then
          begin
            cdsNota := TClientDataSet.Create(DM);
            cdsNota.RemoteServer := SCServer;
            cdsNota.ProviderName := 'dspLista';

            cdsNota.Close;
            SCServer.AppServer.CriaLista ('SELECT nfiscal_sq, nfe_chave FROM nfiscais WHERE numero_nfiscal = ' + InttoStr (numero_nota));
            cdsNota.Open;

            if cdsNota.FieldByName('nfe_chave').AsString <> '' then
              raise Exception.Create('Nota fiscal eletrônica já existe.');

          end;

          notaFiscal := TNfiscal.CreateNumero(numero_nota);

          notaFiscal.finalizarNfe(numeroNFe, chaveNFe, motivo.Text, recibo);

          if notaCancelada then
            notaFiscal.cancelar;

          if notaEmitida then
            notaFiscal.finalizar;
        end;

        if Pos ('Lote em processamento', motivo.Text) > 0 then
          ShowMessage('NFe em processamento, aguarde alguns minutos e tente novamente.')
        else
        begin
          ShowMessage('NFe processada. Mensagem de retorno:' + chr(13) + motivo.Text);
          if notaEmitida then
          begin
            fImprimirNFe := TfImprimirNFe.Create(Self);
            fImprimirNFe.edNFe.IntValue := numeroNFe;
            fImprimirNFe.bbImprimir.Click;
            fImprimirNFe.bbFechar.Click;
            FreeAndNil(fImprimirNFe);
          end;
        end;
      except
        on E: Exception do
        begin
          Showmessage ('Erro ao finalizar NFe: ' + E.Message);
          EnviarEmail ('NFISCAL', 'Finalizar', E.Message, False);
        end;
      end;
    finally
      CloseFile(fResposta);
      DeleteFile(diretorio+'\backup\'+F.Name);
      MoveFile(PAnsiChar(diretorio+'\'+F.Name), pAnsiChar(diretorio+'\backup\'+F.Name));

      Ret := FindNext(F);
      FreeAndNil(motivo);
    end;
  finally
    FindClose(F);
    Reg.CloseKey;
    Reg.Free;
    verificaNFe.Enabled := True;
  end;
end;

procedure Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;

procedure ExecFileAssociado(F: String);
var
  r: String;
begin
  case ShellExecute(0{Handle}, nil, PChar(F), nil, nil, SW_SHOWNORMAL) of
    ERROR_FILE_NOT_FOUND: r := 'The specified file was not found.';
    ERROR_PATH_NOT_FOUND: r := 'The specified path was not found.';
    ERROR_BAD_FORMAT: r := 'The .EXE file is invalid (non-Win32 .EXE or error in .EXE image).';
    SE_ERR_ACCESSDENIED: r := 'Windows 95 only: The operating system denied access to the specified file.';
    SE_ERR_ASSOCINCOMPLETE: r := 'The filename association is incomplete or invalid.';
    SE_ERR_DDEBUSY: r := 'The DDE transaction could not be completed because other DDE transactions were being processed.';
    SE_ERR_DDEFAIL: r := 'The DDE transaction failed.';
    SE_ERR_DDETIMEOUT: r := 'The DDE transaction could not be completed because the request timed out.';
    SE_ERR_DLLNOTFOUND: r := 'Windows 95 only: The specified dynamic-link library was not found.';
    SE_ERR_NOASSOC: r := 'There is no application associated with the given filename extension.';
    SE_ERR_OOM: r := 'Windows 95 only: There was not enough memory to complete the operation.';
    SE_ERR_SHARE: r := 'A sharing violation occurred.';
  else
    Exit;
  end;

  Application.MessageBox(PChar(r),'Anexos',MB_OK or MB_APPLMODAL or MB_ICONERROR);
end;

{
function TDM.carregaNCM(): String;
var
  Value: String;
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
  result := Value;
end;
}

function TDM.buscaNF(nfiscal_sq: Integer): TClientDataSet;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  SCServer.AppServer.CriaLista ('SELECT * FROM nfiscais WHERE NFISCAL_SQ = ' + IntToStr(nfiscal_sq));
  cds.Open;
  result := cds;
end;

function TDM.buscaNF_SQ(numero_nfiscal: Integer): Integer;
var
  cds: TClientDataSet;
begin
  result := 0;
  if numero_nfiscal = 0 then
    exit;
    
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  SCServer.AppServer.CriaLista ('SELECT nfiscal_sq FROM nfiscais WHERE numero_nfiscal = ' + IntToStr(numero_nfiscal));
  cds.Open;
  result := cds.FieldByName('nfiscal_sq').AsInteger;
  cds.Close;
  FreeAndNil(cds);
end;

function TDM.estadoValido(uf: String): Boolean;
begin
  result := TEstado.listaRegistros('where codigo_estado = ' + QuotedStr(uf)).RecordCount > 0;
end;

procedure TDM.VerificaAcesso(Form: TForm; var Visualizar, Criar,
  Editar, Apagar: Boolean);
var
  acesso: TAcesso;
begin
  Visualizar := False;
  Criar      := False;
  Editar     := False;
  Apagar     := False;

  acesso := TAcesso.CreateFiltro('lower(nome_programa) = lower(' + QuotedStr(Form.Name) + ') and usuario_sq = ' + IntToStr(useq));

  if acesso.vIndice <> Null then
  begin
    Visualizar := acesso.visualizar = 'S';
    Criar      := acesso.criar = 'S';
    Editar     := acesso.editar = 'S';
    Apagar     := acesso.apagar = 'S';
  end;

  if (Form is TFCadastrarListaComum) then
  begin
    Editar := Editar and TFCadastrarListaComum(Form).sbEditar.Enabled;
    Criar  := Criar  and TFCadastrarListaComum(Form).sbNovo.Enabled;
    Apagar := Apagar and TFCadastrarListaComum(Form).sbApagar.Enabled;
  end;
end;

procedure TDM.cdsImprRMARMANOGetText(Sender: TField; var Text: String;
  DisplayText: Boolean);
begin
  if cdsImprRMA.RecordCount = 0 then
    Exit;
    
  if Sender = cdsImprRMARMANO then
    Text := 'BR' + FormatFloat('0000000', Sender.AsInteger);
  if Sender = cdsImprRMAReceiveDate then
    Text := FormatDateTime('m/d/yyyy', Sender.AsDateTime);
  if Sender = cdsImprRMAProcessDate then
    Text := FormatDateTime('m/d/yyyy', Sender.AsDateTime);
  if Sender = cdsImprRMAPhone then
    Text := '00 55 ' + Sender.AsString;
  if Sender = cdsImprRMASerialnumber then
    Text := Copy (Sender.AsString, 1, 500);
  if Sender = cdsImprRMADefectedreason then
    Text := Copy (Sender.AsString, 1, 500);
  if Sender = cdsImprRMAHowtorepair then
    Text := Copy (Sender.AsString, 1, 500);
  if Sender = cdsImprRMAFreight then
  begin
    if Sender.AsString = 'S' then
      Text := 'Customer paid'
    else
      Text := 'No';
  end;
  if Sender = cdsImprRMAWarraty then
  begin
    if Sender.AsString = 'S' then
      Text := 'Yes'
    else
      Text := 'No';
  end;
end;

function TDM.temIndiceContaPagar(fornecedor_sq: Integer; numero_duplicata: String): Integer;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(Self);
  cds.RemoteServer := SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  SCServer.AppServer.CriaLista ('select conta_pagar_sq from contas_pagar where fornecedor_sq = ' + IntToStr(fornecedor_sq) + ' and numero_duplicata = ' + QuotedStr(numero_duplicata));
  cds.Open;

  if cds.Eof then
    result := 0
  else
    result := cds.FieldByName('conta_pagar_sq').AsInteger;
end;

function TDM.temNfiscal(pedido_sq: Integer): Boolean;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(Self);
  cds.RemoteServer := SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  SCServer.AppServer.CriaLista ('select count(*) from nfiscais where pedido_sq = ' + IntToStr(pedido_sq));
  cds.Open;

  result := cds.Fields.Fields[0].AsInteger > 0;
end;

procedure TDM.gravarNotificacao(nome_usuario,ip_usuario,versao_software,
      nome_software,titulo_notificacao,mensagem: String);
var
  sql: String;
begin
  sql := 'insert into `notificacao` (`nome_usuario`,`ip_usuario`,`versao_software`,' +
    '`nome_software`,`titulo_notificacao`,`mensagem`,`status`) values ('+
    QuotedStr(nome_usuario)+','+QuotedStr(ip_usuario)+','+QuotedStr(versao_software)+
    ','+QuotedStr(nome_software)+','+QuotedStr(titulo_notificacao)+','+QuotedStr(mensagem)+',null)';

  SCServer.AppServer.ExecSQL(sql);
end;

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

function InputArea(const ACaption, APrompt: string;
  var Value: TStrings): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Memo: TMemo;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        Caption := APrompt;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Constraints.MaxWidth := MulDiv(164, DialogUnits.X, 4);
        WordWrap := True;
      end;
      Memo := TMemo.Create(Form);
      with Memo do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := Prompt.Top + Prompt.Height + 5;
        Width := MulDiv(164, DialogUnits.X, 4);
        Height := MulDiv(164, DialogUnits.X, 8);
        MaxLength := 255;
        Lines.AddStrings(Value);
        SelectAll;
      end;
      ButtonTop := Memo.Top + Memo.Height + 15;
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'OK';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancel';
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), Memo.Top + Memo.Height + 15,
          ButtonWidth, ButtonHeight);
        Form.ClientHeight := Top + Height + 13;
      end;
      if ShowModal = mrOk then
      begin
        Value := TStringList.Create;
        Value.AddStrings(Memo.Lines);
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

{
procedure TDM.verificaValoresAntigos;
var
  lista: TClientDataSet;
  nfiscal: TNfiscal;
  i: Integer;
  item: TNfiscalItem;
  soma: Double;
begin
  lista := TNfiscal.listaRegistros(' where vlr_frete > 0');
  while not lista.Eof do
  begin
    nfiscal := TNfiscal.Create(lista.FieldByName('nfiscal_sq').AsInteger);
    if (nfiscal.listaItem.Count > 0) then
    begin
      soma := 0;
      for i := 0 to nfiscal.listaItem.Count - 1 do
      begin
        item := TNfiscalItem(nfiscal.listaItem[i]);
        soma := soma + item.vlr_frete_item;
      end;
      if (soma = 0) then
      begin
        TNfiscalItem(nfiscal.listaItem[0]).vlr_frete_item := nfiscal.vlr_frete;
        nfiscal.salvar;
      end;
    end;
    FreeAndNil(nfiscal);
    lista.Next;
  end;
end;
}

procedure TDM.verificaCCeTimer(Sender: TObject);
var
  reg: TRegistry;
  dhEvento, diretorio, linha: String;
  F: TSearchRec;
  fResposta: TextFile;
  numero_cce, Ret: Integer;
  motivo: TStringList;
  cartaEmitida: Boolean;
  cce: TCartaCorrecao;
begin
  verificaCCe.Enabled := False;

  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    Reg.OpenKey('\Software\MSystem', True);

    diretorio := reg.ReadString('GeralPathSalvar');

    CreateDir(diretorio+'\backup');
    Ret := FindFirst(diretorio+'\*.cce', faAnyFile, F);
    while Ret = 0 do
    try
      try
        motivo := TStringList.Create;
        AssignFile(fResposta, diretorio + '\' + F.Name);
        Reset(fResposta);
        Readln(fResposta, numero_cce);
        Readln(fResposta, dhEvento);

        While not Eof(fResposta) do
        begin
          Readln(fResposta, linha);
          motivo.Add(linha);
        end;

        cartaEmitida := Pos('Falha', motivo.Text) = 0;

        if not cartaEmitida then
          raise Exception.Create(motivo.Text);

        cce := TCartaCorrecao.CreateFiltro('n_seq_evento = ' + IntToStr(numero_cce));
        cce.dh_evento := StrToDateTime(dhEvento);
        cce.salvar;

        ShowMessage('Carta de correção ' + IntToStr(numero_cce) + ' vinculada à nota fiscal.');

      except
        on E: Exception do
        begin
          Showmessage ('Erro ao finalizar CCe: ' + E.Message);
          EnviarEmail ('CARTA_CORRECAO', 'Finalizar', E.Message, False);
        end;
      end;
    finally
      CloseFile(fResposta);
      DeleteFile(diretorio+'\backup\'+F.Name);
      MoveFile(PAnsiChar(diretorio+'\'+F.Name), pAnsiChar(diretorio+'\backup\'+F.Name));

      Ret := FindNext(F);
      FreeAndNil(motivo);
    end;
  finally
    FindClose(F);
    Reg.CloseKey;
    Reg.Free;
    verificaCCe.Enabled := True;
  end;
end;

end.
