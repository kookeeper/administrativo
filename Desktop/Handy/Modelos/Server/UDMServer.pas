unit UDMServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, PrServer_TLB, StdVcl, DB, IBStoredProc, IBQuery, Dialogs,
  IBCustomDataSet, IBTable, IBDatabase, Provider, Registry, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdBaseComponent,
  IdMessage, Variants, DBTables, MConnect, SConnect, ScktComp, ExtCtrls;

type
  TServer = class(TRemoteDataModule, IServer)
    Msg: TIdMessage;
    IdSMTP1: TIdSMTP;
    DBConn: TDatabase;
    Session1: TSession;
    qrVerIndice: TQuery;
    Query1: TQuery;
    procedure RemoteDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function VerificaSenha: TDateTime; safecall;
    function CriaRegistro(const TABELA: WideString; Novo: Byte; Chave: Integer; CAMPOS: OleVariant): WideString; safecall;
    function VerificaIndice(const TABELA: WideString; const CAMPO: WideString; const VALOR: WideString): Integer; safecall;
    function ApagaRegistro(Campos: OleVariant): WideString; safecall;
    function CancelaNFiscal(VALOR: Integer): WideString; safecall;
    function FinalizaNfiscal(Nfiscal: Integer): WideString; safecall;
    function Classificacao(Cliente_sq: Integer; AnoMes: Integer): Integer; safecall;
    function RegistraLogin(Usuario: Integer; Data: TDateTime; const IP: WideString): WideString; safecall;
  public
    { Public declarations }
  end;

implementation

uses UDMServerLista, uSetup;

{$R *.DFM}

class procedure TServer.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TServer.VerificaSenha: TDateTime;
var
  i1: integer;
  s1, s2: string;
  r1: Real;
begin
  try
    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE EMPRESAS SET');
    Query1.SQL.Add('ACESSOS = ACESSOS + 1');
    Query1.ExecSQL;

    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT * FROM EMPRESAS');
    Query1.Open;

    s1 := '';
    for i1 := 1 to 14 do
    begin
      s2 := InttoStr (Pos (Copy (Query1.FieldByName('SENHA').AsString, i1, 1), 'SergioPaulo'));
      if s2 = '10' then s2 := '0';
      s1 := Concat (s1, s2);
    end;
    r1 := StrToFloat (s1);
    r1 := r1-Query1.FieldByName('CODIGO_EMPRESA').AsFloat;
    r1 := Sqrt (r1);
    Result := r1;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := 0;
    end;
  end;
end;

function TServer.CriaRegistro(const TABELA: WideString; Novo: Byte; Chave: Integer;
  CAMPOS: OleVariant): WideString;
var
  Valor: array of Variant;
  i, i2: Integer;
  dtsenha: TDateTime;
  s: String;
begin
  SetLength (Valor, 255);
  DecimalSeparator := '.';
  for i := 0 to 255 do
  try
    Valor[i] := Campos[i];
    for i2 := Length (Valor[i]) downto 1 do
    begin
      if Copy (Valor[i], i2, 1) = '''' then
      begin
        s := Valor[i];
        Insert ('''', s, i2);
        Valor[i] := s;
      end;
    end;
  except
  end;

  Result := '';
  DBConn.Open;
  DBConn.StartTransaction;
  try
    if TABELA = 'PECAS' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO PECAS (' +
                       'CODIGO_PECA, DESCRICAO_PECA, ' +
                       'QTDE_PECA_LOJA, QTDE_PECA_ARMAZEM, ' +
                       'NBM_SQ, MODELO_SQ, ' +
                       'UN_PECA, MARCA_PECA, ' +
                       'PRECO_UNIT, TIPO_PECA, ' +
                       'QTDE_PECA_DEMO, QTDE_PECA_DEFEITO, ' +
                       'QTDE_PECA_EM_USO, QTDE_PECA_BACKUP, ' +
                       'QTDE_PECA_DEMO_CLI, QTDE_PECA_HLC) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + InttoStr (Valor[2])  + ''', ' +
                       '''' + InttoStr (Valor[3])  + ''', ' +
                       '''' + InttoStr (Valor[4])  + ''', ' +
                       '''' + InttoStr (Valor[5])  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + FloattoStr (Valor[8])  + ''', ' +
                       '''' + InttoStr (Valor[9])  + ''', ' +
                       '''' + InttoStr (Valor[10]) + ''', ' +
                       '''' + InttoStr (Valor[11]) + ''', ' +
                       '''' + InttoStr (Valor[12]) + ''', ' +
                       '''' + InttoStr (Valor[13]) + ''', ' +
                       '''' + InttoStr (Valor[14]) + ''', ' +
                       '''' + InttoStr (Valor[15]) + ''')' );
      end
      else begin
        Query1.SQL.Add ('UPDATE PECAS set ');
        Query1.SQL.Add ('CODIGO_PECA = '''        +             Valor[0]   + ''', ');
        Query1.SQL.Add ('DESCRICAO_PECA = '''     +             Valor[1]   + ''', ');
        Query1.SQL.Add ('QTDE_PECA_LOJA = '''     + InttoStr (  Valor[2] ) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_ARMAZEM = '''  + InttoStr (  Valor[3] ) + ''', ');
        Query1.SQL.Add ('NBM_SQ = '''             + InttoStr (  Valor[4] ) + ''', ');
        Query1.SQL.Add ('MODELO_SQ = '''          + InttoStr (  Valor[5] ) + ''', ');
        Query1.SQL.Add ('UN_PECA = '''            +             Valor[6]   + ''', ');
        Query1.SQL.Add ('MARCA_PECA = '''         +             Valor[7]   + ''', ');
        Query1.SQL.Add ('PRECO_UNIT = '''         + FloattoStr (Valor[8] ) + ''', ');
        Query1.SQL.Add ('TIPO_PECA = '''          + InttoStr (  Valor[9] ) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_DEMO = '''     + InttoStr (  Valor[10]) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_DEFEITO = '''  + InttoStr (  Valor[11]) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_EM_USO = '''   + InttoStr (  Valor[12]) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_BACKUP = '''   + InttoStr (  Valor[13]) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_DEMO_CLI = ''' + InttoStr (  Valor[14]) + ''', ');
        Query1.SQL.Add ('QTDE_PECA_HLC = '''      + InttoStr (  Valor[15]) + ''' ');
        Query1.SQL.Add ('WHERE PECA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'TRANSPORTADORAS' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO TRANSPORTADORAS (' +
                       'CODIGO_TRANSPORTADORA, NOME_TRANSPORTADORA, ' +
                       'ENDERECO_TRANSPORTADORA, MUNICIPIO_TRANSPORTADORA, ' +
                       'INSCR_ESTADUAL, ESTADO_TRANSPORTADORA, ' +
                       'DDD_FONE, NUMERO_FONE, COMPL_FONE) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + Valor[4]  + ''', ' +
                       '''' + Valor[5]  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + Valor[8]  + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE TRANSPORTADORAS SET ');
        Query1.SQL.Add ('CODIGO_TRANSPORTADORA = '''    + Valor[0] + ''', ');
        Query1.SQL.Add ('NOME_TRANSPORTADORA = '''      + Valor[1] + ''', ');
        Query1.SQL.Add ('ENDERECO_TRANSPORTADORA = '''  + Valor[2] + ''', ');
        Query1.SQL.Add ('MUNICIPIO_TRANSPORTADORA = ''' + Valor[3] + ''', ');
        Query1.SQL.Add ('INSCR_ESTADUAL = '''           + Valor[4] + ''', ');
        Query1.SQL.Add ('ESTADO_TRANSPORTADORA = '''    + Valor[5] + ''', ');
        Query1.SQL.Add ('DDD_FONE = '''                 + Valor[6] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE = '''              + Valor[7] + ''', ');
        Query1.SQL.Add ('COMPL_FONE = '''               + Valor[8] + ''' ');
        Query1.SQL.Add ('WHERE TRANSPORTADORA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'USUARIOS' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO USUARIOS (' +
                       'CODIGO_USUARIO, NOME_USUARIO, ' +
                       'SENHA_USUARIO, ERRO_EMAIL_FROM, ' +
                       'ERRO_NOME_FROM, ERRO_EMAIL_TO, ' +
                       'ERRO_NOME_TO, ERRO_SMTP, ' +
                       'ERRO_USERNAME, ERRO_PASSWORD) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + Valor[4]  + ''', ' +
                       '''' + Valor[5]  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + Valor[8]  + ''', ' +
                       '''' + Valor[9]  + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE USUARIOS SET ');
        Query1.SQL.Add ('CODIGO_USUARIO = '''  + Valor[0] + ''', ');
        Query1.SQL.Add ('NOME_USUARIO = '''    + Valor[1] + ''', ');
        Query1.SQL.Add ('SENHA_USUARIO = '''   + Valor[2] + ''', ');
        Query1.SQL.Add ('ERRO_EMAIL_FROM = ''' + Valor[3] + ''', ');
        Query1.SQL.Add ('ERRO_NOME_FROM = '''  + Valor[4] + ''', ');
        Query1.SQL.Add ('ERRO_EMAIL_TO = '''   + Valor[5] + ''', ');
        Query1.SQL.Add ('ERRO_NOME_TO = '''    + Valor[6] + ''', ');
        Query1.SQL.Add ('ERRO_SMTP = '''       + Valor[7] + ''', ');
        Query1.SQL.Add ('ERRO_USERNAME = '''   + Valor[8] + ''', ');
        Query1.SQL.Add ('ERRO_PASSWORD = '''   + Valor[9] + ''' ');
        Query1.SQL.Add ('WHERE USUARIO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'NBM' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO NBM (' +
                       'CODIGO_NBM, ALIQ_ICMS, ' +
                       'ALIQ_IPI) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + FloattoStr (Valor[1]) + ''', ' +
                       '''' + FloattoStr (Valor[2]) + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE NBM SET ');
        Query1.SQL.Add ('CODIGO_NBM = ''' + Valor[0] + ''', ');
        Query1.SQL.Add ('ALIQ_ICMS = '''    + FloattoStr(Valor[1]) + ''', ');
        Query1.SQL.Add ('ALIQ_IPI = '''     + FloattoStr(Valor[2]) + ''' ');
        Query1.SQL.Add ('WHERE NBM_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'NATUREZAS' then
    begin
      if Valor[7] = 0 then
        Valor[7] := 'E' else
        Valor[7] := 'S';

      if Valor[9] then
        Valor[9] := 'S' else
        Valor[9] := 'N';

      if Valor[10] then
        Valor[10] := 'S' else
        Valor[10] := 'N';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO NATUREZAS (' +
                       'CODIGO_NATUREZA, DESCRICAO_NATUREZA, ' +
                       'DESCRICAO_NATUREZA_NFISCAL, CFO, ' +
                       'ALIQ_ICMS, ALIQ_IPI, ' +
                       'TIPO_NFISCAL, ' +
                       'ENT_SAI, OBSERVACAO, ' +
                       'ISENCAO_ICMS, ISENCAO_IPI, ' +
                       'UF01, UF02, UF03, UF04, UF05, ' +
                       'UF06, UF07, UF08, UF09, UF10, ' +
                       'UF11, UF12, UF13, UF14, UF15, ' +
                       'UF16, UF17, UF18, UF19, UF20, ' +
                       'UF21, UF22, UF23, UF24, UF25, ' +
                       'UF26, UF27, UF28, UF29, UF30) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + FloattoStr(Valor[4]) + ''', ' +
                       '''' + FloattoStr(Valor[5]) + ''', ' +
                       '''' + InttoStr(Valor[6]) + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + Valor[8]  + ''', ' +
                       '''' + Valor[9]  + ''', ' +
                       '''' + Valor[10] + ''', ' +
                       '''' + Valor[11][0]   + ''', ' +
                       '''' + Valor[11][1]   + ''', ' +
                       '''' + Valor[11][2]   + ''', ' +
                       '''' + Valor[11][3]   + ''', ' +
                       '''' + Valor[11][4]   + ''', ' +
                       '''' + Valor[11][5]   + ''', ' +
                       '''' + Valor[11][6]   + ''', ' +
                       '''' + Valor[11][7]   + ''', ' +
                       '''' + Valor[11][8]   + ''', ' +
                       '''' + Valor[11][9]   + ''', ' +
                       '''' + Valor[11][10]  + ''', ' +
                       '''' + Valor[11][11]  + ''', ' +
                       '''' + Valor[11][12]  + ''', ' +
                       '''' + Valor[11][13]  + ''', ' +
                       '''' + Valor[11][14]  + ''', ' +
                       '''' + Valor[11][15]  + ''', ' +
                       '''' + Valor[11][16]  + ''', ' +
                       '''' + Valor[11][17]  + ''', ' +
                       '''' + Valor[11][18]  + ''', ' +
                       '''' + Valor[11][19]  + ''', ' +
                       '''' + Valor[11][20]  + ''', ' +
                       '''' + Valor[11][21]  + ''', ' +
                       '''' + Valor[11][22]  + ''', ' +
                       '''' + Valor[11][23]  + ''', ' +
                       '''' + Valor[11][24]  + ''', ' +
                       '''' + Valor[11][25]  + ''', ' +
                       '''' + Valor[11][26]  + ''', ' +
                       '''' + Valor[11][27]  + ''', ' +
                       '''' + Valor[11][28]  + ''', ' +
                       '''' + Valor[11][29]  + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE NATUREZAS SET ');
        Query1.SQL.Add ('CODIGO_NATUREZA = '''            + Valor[0]  + ''', ');
        Query1.SQL.Add ('DESCRICAO_NATUREZA = '''         + Valor[1]  + ''', ');
        Query1.SQL.Add ('DESCRICAO_NATUREZA_NFISCAL = ''' + Valor[2]  + ''', ');
        Query1.SQL.Add ('CFO = '''                        + Valor[3]  + ''', ');
        Query1.SQL.Add ('ALIQ_ICMS = '''                  + FloattoStr (Valor[4]) + ''', ');
        Query1.SQL.Add ('ALIQ_IPI = '''                   + FloattoStr (Valor[5]) + ''', ');
        Query1.SQL.Add ('TIPO_NFISCAL = '''               + InttoStr (Valor[6]) + ''', ');
        Query1.SQL.Add ('ENT_SAI = '''                    + Valor[7]   + ''', ');
        Query1.SQL.Add ('OBSERVACAO = '''                 + Valor[8]  + ''', ');
        Query1.SQL.Add ('ISENCAO_ICMS = '''               + Valor[9]   + ''', ');
        Query1.SQL.Add ('ISENCAO_IPI = '''                + Valor[10]  + ''', ');
        Query1.SQL.Add ('UF01 = '''                       + Valor[11][00] + ''', ');
        Query1.SQL.Add ('UF02 = '''                       + Valor[11][01] + ''', ');
        Query1.SQL.Add ('UF03 = '''                       + Valor[11][02] + ''', ');
        Query1.SQL.Add ('UF04 = '''                       + Valor[11][03] + ''', ');
        Query1.SQL.Add ('UF05 = '''                       + Valor[11][04] + ''', ');
        Query1.SQL.Add ('UF06 = '''                       + Valor[11][05] + ''', ');
        Query1.SQL.Add ('UF07 = '''                       + Valor[11][06] + ''', ');
        Query1.SQL.Add ('UF08 = '''                       + Valor[11][07] + ''', ');
        Query1.SQL.Add ('UF09 = '''                       + Valor[11][08] + ''', ');
        Query1.SQL.Add ('UF10 = '''                       + Valor[11][09] + ''', ');
        Query1.SQL.Add ('UF11 = '''                       + Valor[11][10] + ''', ');
        Query1.SQL.Add ('UF12 = '''                       + Valor[11][11] + ''', ');
        Query1.SQL.Add ('UF13 = '''                       + Valor[11][12] + ''', ');
        Query1.SQL.Add ('UF14 = '''                       + Valor[11][13] + ''', ');
        Query1.SQL.Add ('UF15 = '''                       + Valor[11][14] + ''', ');
        Query1.SQL.Add ('UF16 = '''                       + Valor[11][15] + ''', ');
        Query1.SQL.Add ('UF17 = '''                       + Valor[11][16] + ''', ');
        Query1.SQL.Add ('UF18 = '''                       + Valor[11][17] + ''', ');
        Query1.SQL.Add ('UF19 = '''                       + Valor[11][18] + ''', ');
        Query1.SQL.Add ('UF20 = '''                       + Valor[11][19] + ''', ');
        Query1.SQL.Add ('UF21 = '''                       + Valor[11][20] + ''', ');
        Query1.SQL.Add ('UF22 = '''                       + Valor[11][21] + ''', ');
        Query1.SQL.Add ('UF23 = '''                       + Valor[11][22] + ''', ');
        Query1.SQL.Add ('UF24 = '''                       + Valor[11][23] + ''', ');
        Query1.SQL.Add ('UF25 = '''                       + Valor[11][24] + ''', ');
        Query1.SQL.Add ('UF26 = '''                       + Valor[11][25] + ''', ');
        Query1.SQL.Add ('UF27 = '''                       + Valor[11][26] + ''', ');
        Query1.SQL.Add ('UF28 = '''                       + Valor[11][27] + ''', ');
        Query1.SQL.Add ('UF29 = '''                       + Valor[11][28] + ''', ');
        Query1.SQL.Add ('UF30 = '''                       + Valor[11][29] + ''' ');
        Query1.SQL.Add ('WHERE NATUREZA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'DUPLICATAS' then
    begin
      if Valor[6] <> Null then
        Valor[6] := '''' + FormatDateTime  ('yyyy-mm-dd', Valor[6]) + '''' else
        Valor[6] := 'Null';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO DUPLICATAS (' +
                       'NUMERO_DUPLICATA, ITEM_DUPLICATA, ' +
                       'SEQ_DUPLICATA, NFISCAL_SQ, ' +
                       'VALOR_DUPLICATA, DTEMISSAO_DUPLICATA, ' +
                       'DTVENCTO_DUPLICATA, DTPGTO_DUPLICATA, ' +
                       'VALORPG_DUPLICATA) ' +
                       'VALUES (' +
                       '''' + InttoStr   (Valor[0]) + ''', ' +
                       '''' + InttoStr   (Valor[1]) + ''', ' +
                       '''0'', ' +
                       '''' + InttoStr   (Valor[2]) + ''', ' +
                       '''' + FloattoStr (Valor[3]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[4]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[5]) + ''', ' +
                       Valor[6] + ', ' +
                       '''' + FloattoStr (Valor[7]) + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE DUPLICATAS SET ');
        Query1.SQL.Add ('NUMERO_DUPLICATA = '''    + Valor[0] + ''', ');
        Query1.SQL.Add ('ITEM_DUPLICATA = '''      + Valor[1] + ''', ');
        Query1.SQL.Add ('SEQ_DUPLICATA = 0, ');
        Query1.SQL.Add ('NFISCAL_SQ = '''          + InttoStr  (Valor[2]) + ''', ');
        Query1.SQL.Add ('VALOR_DUPLICATA = '''     + FloattoStr(Valor[3]) + ''', ');
        Query1.SQL.Add ('DTEMISSAO_DUPLICATA = ''' + FormatDateTime  ('yyyy-mm-dd', Valor[4]) + ''', ');
        Query1.SQL.Add ('DTVENCTO_DUPLICATA = '''  + FormatDateTime  ('yyyy-mm-dd', Valor[5]) + ''', ');
        Query1.SQL.Add ('DTPGTO_DUPLICATA = '      + Valor[6] + ', ');
        Query1.SQL.Add ('VALORPG_DUPLICATA = '''   + FloattoStr(Valor[7]) + ''' ');
        Query1.SQL.Add ('WHERE DUPLICATA_SQ = '    + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'KARDEX' then
    begin
      if Valor[0] = '0' then
        Valor[0] := '1' else
        Valor[0] := '2';
      if Valor[2] = '1' then
        Valor[2] := 'E' else
        Valor[2] := 'S';

      if Valor[0] = 1 then
      begin
        Valor[1] := InttoStr (Valor[1]);
        Valor[99] := null;
      end
      else begin
        Valor[99] := InttoStr (Valor[1]);
        Valor[1] := null;
      end;

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO KARDEX (' +
                       'TIPO_ITEM, PECA_SQ, ' +
                       'MODELO_SQ, TIPO_MOV, ' +
                       'QTDE, DATA, ' +
                       'NFISCAL, VALOR, ' +
                       'USUARIO_SQ, NR_SERIE) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[99] + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + InttoStr  (Valor[3]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[4]) + ''', ' +
                       '''' + InttoStr  (Valor[5]) + ''', ' +
                       '''' + FloattoStr(Valor[6]) + ''', ' +
                       '''' + InttoStr  (Valor[7]) + ''', ' +
                       '''' + Valor[8] + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE KARDEX SET ');
        Query1.SQL.Add ('TIPO_ITEM = '''  +            Valor[0] + ''', ');
        Query1.SQL.Add ('PECA_SQ = '''    +            Valor[1] + ''', ');
        Query1.SQL.Add ('MODELO_SQ = '''  +            Valor[99] + ''', ');
        Query1.SQL.Add ('TIPO_MOV = '''   +            Valor[2] + ''', ');
        Query1.SQL.Add ('QTDE = '''       + InttoStr  (Valor[3]) + ''', ');
        Query1.SQL.Add ('DATA = '''       + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[4]) + ''', ');
        Query1.SQL.Add ('NFISCAL = '''    +            Valor[5] + ''', ');
        Query1.SQL.Add ('VALOR = '''      + FloattoStr(Valor[6]) + ''', ');
        Query1.SQL.Add ('USUARIO_SQ = ''' + InttoStr  (Valor[7]) + ''', ');
        Query1.SQL.Add ('NR_SERIE = '''   +            Valor[8] + ''' ');
        Query1.SQL.Add ('WHERE KARDEX_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      if novo = 255 then
      begin
        i := Valor[3];
        if Valor[2] = 'S' then i := i * (-1);

        if Valor[0] = 1 then
        begin
          Query1.SQL.Clear;
          Query1.SQL.Add('select TIPO_NFISCAL from kardex k');
          Query1.SQL.Add('left outer join nfiscais n on (N.NUMERO_NFISCAL = K.NFISCAL)');
          Query1.SQL.Add('left outer join naturezas na on (NA.NATUREZA_SQ = N.NATUREZA_SQ)');
          Query1.SQL.Add('where KARDEX_SQ = ' + InttoStr (chave));
          Query1.Open;
          Valor[100] := Query1.FieldByName ('TIPO_NFISCAL').AsInteger;

          if (Valor[100] = 0) or (Valor[100] = 1) or (Valor[100] = 3) or (Valor[100] = 5)
          or (Valor[100] = 6) then
          begin
            Query1.SQL.Clear;
            Query1.SQL.Add('UPDATE PECAS SET');
            case Valor[100] of
              0: Query1.SQL.Add('QTDE_PECA_LOJA = QTDE_PECA_LOJA + ' + InttoStr (i));
              1: Query1.SQL.Add('QTDE_PECA_DEMO = QTDE_PECA_DEMO + ' + InttoStr (i));
              3: Query1.SQL.Add('QTDE_PECA_LOJA = QTDE_PECA_LOJA + ' + InttoStr (i));
              5: Query1.SQL.Add('QTDE_PECA_LOJA = QTDE_PECA_LOJA + ' + InttoStr (i));
              6: Query1.SQL.Add('QTDE_PECA_LOJA = QTDE_PECA_LOJA + ' + InttoStr (i));
            end;
            Query1.SQL.Add('WHERE PECA_SQ = ' + InttoStr (Valor[1]));
            Query1.ExecSQL;
          end;
        end;
      end;
    end;
    if TABELA = 'NFDEMONSTRACAO' then
    begin
      if Valor[2] then
        Valor[2] := 'S' else
        Valor[2] := 'N';

      Query1.SQL.Clear;
      Query1.SQL.Add('UPDATE NFISCAIS SET');
      Query1.SQL.Add('NR_NFISCAL_RETORNO = ''' + InttoStr (Valor[0]) + ''', ');
      Query1.SQL.Add('DT_NFISCAL_RETORNO = ''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
      Query1.SQL.Add('RETORNO_PRODUTO    = ''' + Valor[2] + ''', ');
      Query1.SQL.Add('RETORNO_OBSERVACAO = ''' + Valor[3] + ''' ');
      Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Chave));
      Query1.ExecSQL;
    end;
    if TABELA = 'COND_PAGTO' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO COND_PAGTO (' +
                       'CODIGO_COND_PAGTO, DESCRICAO_COND_PAGTO, ' +
                       'PARCELAS, D00, ' +
                       'D01, D02, ' +
                       'D03, D04, ' +
                       'D05, D06, ' +
                       'D07, D08, ' +
                       'D09) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + InttoStr  (Valor[2]) + ''', ' +
                       '''' + InttoStr  (Valor[3]) + ''', ' +
                       '''' + InttoStr  (Valor[4]) + ''', ' +
                       '''' + InttoStr  (Valor[5]) + ''', ' +
                       '''' + InttoStr  (Valor[6]) + ''', ' +
                       '''' + InttoStr  (Valor[7]) + ''', ' +
                       '''' + InttoStr  (Valor[8]) + ''', ' +
                       '''' + InttoStr  (Valor[9]) + ''', ' +
                       '''' + InttoStr  (Valor[10]) + ''', ' +
                       '''' + InttoStr  (Valor[11]) + ''', ' +
                       '''' + InttoStr  (Valor[12]) + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE COND_PAGTO SET ');
        Query1.SQL.Add ('CODIGO_COND_PAGTO = '''    +           Valor[0] + ''', ');
        Query1.SQL.Add ('DESCRICAO_COND_PAGTO = ''' +           Valor[1] + ''', ');
        Query1.SQL.Add ('PARCELAS = '''               + InttoStr (Valor[2]) + ''', ');
        Query1.SQL.Add ('D00 = '''                    + InttoStr (Valor[3]) + ''', ');
        Query1.SQL.Add ('D01 = '''                    + InttoStr (Valor[4]) + ''', ');
        Query1.SQL.Add ('D02 = '''                    + InttoStr (Valor[5]) + ''', ');
        Query1.SQL.Add ('D03 = '''                    + InttoStr (Valor[6]) + ''', ');
        Query1.SQL.Add ('D04 = '''                    + InttoStr (Valor[7]) + ''', ');
        Query1.SQL.Add ('D05 = '''                    + InttoStr (Valor[8]) + ''', ');
        Query1.SQL.Add ('D06 = '''                    + InttoStr (Valor[9]) + ''', ');
        Query1.SQL.Add ('D07 = '''                    + InttoStr (Valor[10]) + ''', ');
        Query1.SQL.Add ('D08 = '''                    + InttoStr (Valor[11]) + ''', ');
        Query1.SQL.Add ('D09 = '''                    + InttoStr (Valor[12]) + ''' ');
        Query1.SQL.Add ('WHERE COND_PAGTO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'CLIENTES' then
    begin
      if Valor[29] then
        Valor[29] := 'S' else
        Valor[29] := 'N';
      if Valor[30] then
        Valor[30] := 'S' else
        Valor[30] := 'N';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO CLIENTES (' +
                       'CODIGO_CLIENTE, NOME_CLIENTE, ' +
                       'INSCR_ESTADUAL, ENDERECO, ' +
                       'NUMERO, BAIRRO, ' +
                       'COMPL_ENDERECO, CIDADE, ' +
                       'ESTADO, CEP, ' +
                       'DDD_FONE1, NUMERO_FONE1, ' +
                       'COMPL_FONE1, DDD_FONE2, ' +
                       'NUMERO_FONE2, COMPL_FONE2, ' +
                       'DDD_FONE3, NUMERO_FONE3, ' +
                       'COMPL_FONE3, DDD_CELULAR, ' +
                       'NUMERO_CELULAR, COMPL_CELULAR, ' +
                       'DDD_FAX, NUMERO_FAX, ' +
                       'COMPL_FAX, E_MAIL, ' +
                       'WEB_SITE, CONTATO, ' +
                       'PAIS, REVENDA, ' +
                       'BIRO, DATA_ALT, ' +
                       'USUARIO_SQ_ALT, TRANSPORTADORA_SQ) ' +
                       'VALUES (' +
                       '''' + Valor[0]  + ''', ' +
                       '''' + Valor[1]  + ''', ' +
                       '''' + Valor[2]  + ''', ' +
                       '''' + Valor[3]  + ''', ' +
                       '''' + Valor[4]  + ''', ' +
                       '''' + Valor[5]  + ''', ' +
                       '''' + Valor[6]  + ''', ' +
                       '''' + Valor[7]  + ''', ' +
                       '''' + Valor[8]  + ''', ' +
                       '''' + Valor[9]  + ''', ' +
                       '''' + Valor[10]  + ''', ' +
                       '''' + Valor[11]  + ''', ' +
                       '''' + Valor[12]  + ''', ' +
                       '''' + Valor[13]  + ''', ' +
                       '''' + Valor[14]  + ''', ' +
                       '''' + Valor[15]  + ''', ' +
                       '''' + Valor[16]  + ''', ' +
                       '''' + Valor[17]  + ''', ' +
                       '''' + Valor[18]  + ''', ' +
                       '''' + Valor[19]  + ''', ' +
                       '''' + Valor[20]  + ''', ' +
                       '''' + Valor[21]  + ''', ' +
                       '''' + Valor[22]  + ''', ' +
                       '''' + Valor[23]  + ''', ' +
                       '''' + Valor[24]  + ''', ' +
                       '''' + Valor[25]  + ''', ' +
                       '''' + Valor[26]  + ''', ' +
                       '''' + Valor[27]  + ''', ' +
                       '''' + Valor[28]  + ''', ' +
                       '''' + Valor[29]  + ''', ' +
                       '''' + Valor[30]  + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[31])  + ''', ' +
                       '''' + InttoStr (Valor[32])  + ''', ' +
                       '''' + InttoStr (Valor[33]) + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE CLIENTES SET ');
        Query1.SQL.Add ('CODIGO_CLIENTE = '''    +           Valor[0] + ''', ');
        Query1.SQL.Add ('NOME_CLIENTE = '''      +           Valor[1] + ''', ');
        Query1.SQL.Add ('INSCR_ESTADUAL = '''    +           Valor[2] + ''', ');
        Query1.SQL.Add ('ENDERECO = '''          +           Valor[3] + ''', ');
        Query1.SQL.Add ('NUMERO = '''            +           Valor[4] + ''', ');
        Query1.SQL.Add ('BAIRRO = '''            +           Valor[5] + ''', ');
        Query1.SQL.Add ('COMPL_ENDERECO = '''    +           Valor[6] + ''', ');
        Query1.SQL.Add ('CIDADE = '''            +           Valor[7] + ''', ');
        Query1.SQL.Add ('ESTADO = '''            +           Valor[8] + ''', ');
        Query1.SQL.Add ('CEP = '''               +           Valor[9] + ''', ');
        Query1.SQL.Add ('DDD_FONE1 = '''         +           Valor[10] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE1 = '''      +           Valor[11] + ''', ');
        Query1.SQL.Add ('COMPL_FONE1 = '''       +           Valor[12] + ''', ');
        Query1.SQL.Add ('DDD_FONE2 = '''         +           Valor[13] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE2 = '''      +           Valor[14] + ''', ');
        Query1.SQL.Add ('COMPL_FONE2 = '''       +           Valor[15] + ''', ');
        Query1.SQL.Add ('DDD_FONE3 = '''         +           Valor[16] + ''', ');
        Query1.SQL.Add ('NUMERO_FONE3 = '''      +           Valor[17] + ''', ');
        Query1.SQL.Add ('COMPL_FONE3 = '''       +           Valor[18] + ''', ');
        Query1.SQL.Add ('DDD_CELULAR = '''       +           Valor[19] + ''', ');
        Query1.SQL.Add ('NUMERO_CELULAR = '''    +           Valor[20] + ''', ');
        Query1.SQL.Add ('COMPL_CELULAR = '''     +           Valor[21] + ''', ');
        Query1.SQL.Add ('DDD_FAX = '''           +           Valor[22] + ''', ');
        Query1.SQL.Add ('NUMERO_FAX = '''        +           Valor[23] + ''', ');
        Query1.SQL.Add ('COMPL_FAX = '''         +           Valor[24] + ''', ');
        Query1.SQL.Add ('E_MAIL = '''            +           Valor[25] + ''', ');
        Query1.SQL.Add ('WEB_SITE = '''          +           Valor[26] + ''', ');
        Query1.SQL.Add ('CONTATO = '''           +           Valor[27] + ''', ');
        Query1.SQL.Add ('PAIS = '''              +           Valor[28] + ''', ');
        Query1.SQL.Add ('REVENDA = '''           +           Valor[29] + ''', ');
        Query1.SQL.Add ('BIRO = '''              +           Valor[30] + ''', ');
        Query1.SQL.Add ('DATA_ALT = '''          + FormatDateTime  ('yyyy-mm-dd', Valor[31]) + ''', ');
        Query1.SQL.Add ('USUARIO_SQ_ALT = '''      + InttoStr (Valor[32]) + ''', ');
        Query1.SQL.Add ('TRANSPORTADORA_SQ = '''   + InttoStr (Valor[33]) + ''' ');
        Query1.SQL.Add ('WHERE CLIENTE_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'PEDIDOS' then
    begin
      Valor[7] := Valor[7] + 1;
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO PEDIDOS (' +
                       'NUMERO_PEDIDO, DATA_PEDIDO, ' +
                       'COTACAO_DOLAR, DIAS_DEMONSTRACAO, ' +
                       'VLR_FRETE, PCT_JUROS, ' +
                       'VLR_JUROS, FRETE_TRANSP, ' +
                       'VLR_DESC, BASE_ICMS, ' +
                       'VLR_ICMS, VLR_IPI, ' +
                       'VLR_PRODUTOS, PCT_DESC, ' +
                       'OBSERVACAO_PED, OBSERVACAO_NF, ' +
                       'CLIENTE_SQ, COND_PAGTO_SQ, ' +
                       'NATUREZA_SQ, TRANSPORTADORA_SQ, ' +
                       'VENDEDOR_SQ) ' +
                       'VALUES (' +
                       '''' + InttoStr   (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[1]) + ''', ' +
                       '''' + FloattoStr (Valor[2]) + ''', ' +
                       '''' + InttoStr   (Valor[3]) + ''', ' +
                       '''' + FloattoStr (Valor[4]) + ''', ' +
                       '''' + FloattoStr (Valor[5]) + ''', ' +
                       '''' + FloattoStr (Valor[6]) + ''', ' +
                       '''' + InttoStr   (Valor[7]) + ''', ' +
                       '''' + FloattoStr (Valor[8]) + ''', ' +
                       '''' + FloattoStr (Valor[9]) + ''', ' +
                       '''' + FloattoStr (Valor[10]) + ''', ' +
                       '''' + FloattoStr (Valor[11]) + ''', ' +
                       '''' + FloattoStr (Valor[12]) + ''', ' +
                       '''' + FloattoStr (Valor[13]) + ''', ' +
                       ''''     + Valor[14]  + ''', ' +
                       ''''     + Valor[15]  + ''', ' +
                       '''' + InttoStr   (Valor[16]) + ''', ' +
                       '''' + InttoStr   (Valor[17]) + ''', ' +
                       '''' + InttoStr   (Valor[18]) + ''', ' +
                       '''' + InttoStr   (Valor[19]) + ''', ' +
                       '''' + InttoStr   (Valor[20]) + ''')');
      end
      else begin
        Query1.SQL.Add('UPDATE PEDIDOS SET ');
        Query1.SQL.Add ('NUMERO_PEDIDO = '''        + InttoStr  (Valor[0]) + ''', ');
        Query1.SQL.Add ('DATA_PEDIDO = '''        + FormatDateTime  ('yyyy-mm-dd hh:nn:ss', Valor[1]) + ''', ');
        Query1.SQL.Add ('COTACAO_DOLAR = '''        + FloattoStr(Valor[2]) + ''', ');
        Query1.SQL.Add ('DIAS_DEMONSTRACAO = '''    + InttoStr  (Valor[3]) + ''', ');
        Query1.SQL.Add ('VLR_FRETE = '''            + FloattoStr(Valor[4]) + ''', ');
        Query1.SQL.Add ('PCT_JUROS = '''            + FloattoStr(Valor[5]) + ''', ');
        Query1.SQL.Add ('VLR_JUROS = '''            + FloattoStr(Valor[6]) + ''', ');
        Query1.SQL.Add ('FRETE_TRANSP = '''         + InttoStr  (Valor[7]) + ''', ');
        Query1.SQL.Add ('VLR_DESC = '''             + FloattoStr(Valor[8]) + ''', ');
        Query1.SQL.Add ('BASE_ICMS = '''            + FloattoStr(Valor[9]) + ''', ');
        Query1.SQL.Add ('VLR_ICMS = '''             + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add ('VLR_IPI = '''              + FloattoStr(Valor[11]) + ''', ');
        Query1.SQL.Add ('VLR_PRODUTOS = '''         + FloattoStr(Valor[12]) + ''', ');
        Query1.SQL.Add ('PCT_DESC = '''             + FloattoStr(Valor[13]) + ''', ');
        Query1.SQL.Add ('OBSERVACAO_PED = '''       +            Valor[14]  + ''', ');
        Query1.SQL.Add ('OBSERVACAO_NF = '''        +            Valor[15]  + ''', ');
        Query1.SQL.Add ('CLIENTE_SQ = '''           + InttoStr  (Valor[16]) + ''', ');
        Query1.SQL.Add ('COND_PAGTO_SQ = '''        + InttoStr  (Valor[17]) + ''', ');
        Query1.SQL.Add ('NATUREZA_SQ = '''          + InttoStr  (Valor[18]) + ''', ');
        Query1.SQL.Add ('TRANSPORTADORA_SQ = '''    + InttoStr  (Valor[19]) + ''', ');
        Query1.SQL.Add ('VENDEDOR_SQ = '''          + InttoStr  (Valor[20]) + ''' ');
        Query1.SQL.Add ('WHERE PEDIDO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[21] do
      if Valor[22][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM PEDIDOS_ITENS WHERE PEDIDO_ITEM_SQ = ' + InttoStr (Valor[22][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[23] do
      if (Valor[25] >= 0) and (Valor[26][0] <> 0) then
      begin
        Query1.SQL.Clear;
        if Valor[27][i] <> '0' then
        begin
          Query1.SQL.Add('UPDATE PEDIDOS_ITENS SET ');
          Query1.SQL.Add ('PECA_SQ = '''          + InttoStr  (Valor[26][i]) + ''', ');
          Query1.SQL.Add ('QTDE_PEDIDO_ITEM = ''' + InttoStr  (Valor[24][i][3]) + ''', ');
          Query1.SQL.Add ('NR_SERIE_ITEM = '''    +            Valor[24][i][12] + ''', ');
          Query1.SQL.Add ('PRECO_UNIT = '''       + FloattoStr(Valor[24][i][4]) + ''', ');
          Query1.SQL.Add ('VLR_DESC = '''         + FloattoStr(Valor[24][i][5]) + ''', ');
          Query1.SQL.Add ('PCT_DESC = '''         + FloattoStr(Valor[24][i][6]) + ''', ');
          Query1.SQL.Add ('ALIQ_ICMS_ITEM = '''   + FloattoStr(Valor[24][i][7]) + ''', ');
          Query1.SQL.Add ('ALIQ_IPI_ITEM = '''    + FloattoStr(Valor[24][i][9]) + ''', ');
          Query1.SQL.Add ('VLR_ICMS_ITEM = '''    + FloattoStr(Valor[24][i][8]) + ''', ');
          Query1.SQL.Add ('VLR_IPI_ITEM = '''     + FloattoStr(Valor[24][i][10]) + ''', ');
          Query1.SQL.Add ('VLR_TOTAL_ITEM = '''   + FloattoStr(Valor[24][i][11]) + ''' ');
          Query1.SQL.Add ('WHERE PEDIDO_ITEM_SQ = ' + InttoStr (Valor[27][i]));
        end
        else begin
        Query1.SQL.Add('INSERT INTO PEDIDOS_ITENS (' +
                       'PEDIDO_SQ, PECA_SQ, ' +
                       'QTDE_PEDIDO_ITEM, NR_SERIE_ITEM, ' +
                       'PRECO_UNIT, VLR_DESC, ' +
                       'PCT_DESC, ALIQ_ICMS_ITEM, ' +
                       'ALIQ_IPI_ITEM, VLR_ICMS_ITEM, ' +
                       'VLR_IPI_ITEM, VLR_TOTAL_ITEM) ' +
                       'VALUES (' +
                       '''' + InttoStr (Chave) + ''', ' +
                       '''' + InttoStr (Valor[26][i])  + ''', ' +
                       '''' + InttoStr (Valor[24][i][3])  + ''', ' +
                       '''' + Valor[24][i][12]  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][4])  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][5])  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][6])  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][7])  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][9])  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][8])  + ''', ' +
                       '''' + FloattoStr (Valor[24][i][10]) + ''', ' +
                       '''' + FloattoStr (Valor[24][i][11]) + ''')');
        end;
        Query1.ExecSQL;
      end;


      if (novo = 255) and (Valor[0] = 0) then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE EMPRESAS SET NUMERO_PEDIDO = NUMERO_PEDIDO + 1');
        Query1.ExecSQL;

        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT NUMERO_PEDIDO FROM EMPRESAS');
        Query1.Open;
        Valor[0] := Query1.FieldByName ('NUMERO_PEDIDO').AsInteger;

        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE PEDIDOS SET');
        Query1.SQL.Add('NUMERO_PEDIDO = ''' + InttoStr (Valor[0]) + '''');
        Query1.SQL.Add('WHERE PEDIDO_SQ = ' + InttoStr (Chave));
        Query1.ExecSQL;
      end;

    end;
    if TABELA = 'EMPRESAS' then
    begin
      if Valor[11] then
        Valor[11] := 'S' else
        Valor[11] := 'N';
      if Valor[12] then
        Valor[12] := 'S' else
        Valor[12] := 'N';
      if Valor[13] then
        Valor[13] := 'S' else
        Valor[13] := 'N';
      if Valor[14] then
        Valor[14] := 'S' else
        Valor[14] := 'N';


      Query1.SQL.Clear;
      Query1.SQL.Add('UPDATE EMPRESAS SET');
      Query1.SQL.Add('CODIGO_EMPRESA = '''        + Valor[0] + ''', ');
      Query1.SQL.Add('NOME_EMPRESA = '''          + Valor[1] + ''', ');
      Query1.SQL.Add('SENHA = '''                 + Valor[2] + ''', ');
      Query1.SQL.Add('ESTADO = '''                + Valor[3] + ''', ');
      Query1.SQL.Add('NUMERO_NFISCAL = '''        + InttoStr (Valor[4]) + ''', ');
      Query1.SQL.Add('NUMERO_PEDIDO = '''         + InttoStr (Valor[5]) + ''', ');
      Query1.SQL.Add('NUMERO_ASSISTENCIA = '''    + InttoStr (Valor[6]) + ''', ');
      Query1.SQL.Add('ALIQ_ICMS_PROD1 = '''       + FloattoStr (Valor[7]) + ''', ');
      Query1.SQL.Add('ALIQ_ICMS_PEC1 = '''        + FloattoStr (Valor[8]) + ''', ');
      Query1.SQL.Add('STRIBUT = '''               + InttoStr (Valor[9]) + ''', ');
      Query1.SQL.Add('DIAS_DEMONSTRACAO = '''     + InttoStr (Valor[10]) + ''', ');
      Query1.SQL.Add('ALT_DATA_PEDIDO = '''       + Valor[11] + ''', ');
      Query1.SQL.Add('ALT_DTEMISSAO_NFISCAL = ''' + Valor[12] + ''', ');
      Query1.SQL.Add('ALT_NR_PEDIDO = '''         + Valor[13] + ''', ');
      Query1.SQL.Add('ALT_NR_NFISCAL = '''        + Valor[14] + ''', ');
      Query1.SQL.Add('ALIQ_PIS = '''              + FloattoStr (Valor[15]) + ''', ');
      Query1.SQL.Add('ALIQ_COFINS = '''           + FloattoStr (Valor[16]) + ''', ');
      Query1.SQL.Add('ALIQ_ISS = '''              + FloattoStr (Valor[17]) + ''' ');
      Query1.ExecSQL;

      dtsenha := VerificaSenha;
      if (dtsenha < Date) or (dtsenha > Date + 90) then
        raise Exception.Create ('Senha Inválida!');
    end;
    if TABELA = 'NFISCAIS' then
    begin
      if Valor[2] <> Null then
        Valor[2] := FormatDateTime  ('yyyy-mm-dd', Valor[2]) else
        Valor[2] := 'Null';

      Valor[19] := Valor[19] + 1;

      if Valor[22] = '' then Valor[22] := '0';

      if Valor[28] = '' then Valor[28] := '0';
      if Valor[29] = '' then Valor[29] := '0';
      if Valor[30] = '' then Valor[30] := '0';
      if Valor[31] = '' then Valor[31] := '0';
      if Valor[32] = '' then Valor[32] := '0';
      if Valor[33] = '' then Valor[33] := '0';
      if Valor[34] = '' then Valor[34] := '0';

      if Valor[47] then
        Valor[47] := 'S' else
        Valor[47] := 'N';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO NFISCAIS (' +
                       'NUMERO_NFISCAL, DTEMISSAO_NFISCAL, ' +
                       'DTSAIDA_NFISCAL, PEDIDO_SQ, ' +
                       'COTACAO_DOLAR, CLIENTE_SQ, ' +
                       'COND_PAGTO_SQ, NATUREZA_SQ, ' +
                       'TRANSPORTADORA_SQ, BASE_ICMS, ' +
                       'VLR_ICMS, BASE_ICMS_SUBST, ' +
                       'VLR_ICMS_SUBST, VLR_PRODUTOS, ' +
                       'VLR_FRETE, VLR_SEGURO, ' +
                       'VLR_DESP_ACESS, VLR_IPI, ' +
                       'VLR_TOTAL, FRETE_TRANSP, ' +
                       'PLACA_TRANSP, UF_PLACA_TRANSP, ' +
                       'QTDE_TRANSP, ESPECIE_TRANSP, ' +
                       'MARCA_TRANSP, NUMERO_TRANSP, ' +
                       'PBRUTO_TRANSP, PLIQUIDO_TRANSP, ' +
                       'CLASS_FISCAL1, CLASS_FISCAL2, ' +
                       'CLASS_FISCAL3, CLASS_FISCAL4, ' +
                       'CLASS_FISCAL5, CLASS_FISCAL6, ' +
                       'CLASS_FISCAL7, MENSAGEM, ' +
                       'CANCELADA, DIAS_DEMONSTRACAO, ' +
                       'VENDEDOR_SQ, NF_MANUAL) ');
        Query1.SQL.Add('VALUES (' +
                       '''' + InttoStr  (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + Valor[2] + ''', ' +
                       '''' + InttoStr  (Valor[3]) + ''', ' +
                       '''' + FloattoStr(Valor[4]) + ''', ' +
                       '''' + InttoStr  (Valor[5]) + ''', ' +
                       '''' + InttoStr  (Valor[6]) + ''', ' +
                       '''' + InttoStr  (Valor[7]) + ''', ' +
                       '''' + InttoStr  (Valor[8]) + ''', ' +
                       '''' + FloattoStr(Valor[9]) + ''', ' +
                       '''' + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('''' + FloattoStr(Valor[11]) + ''', ' +
                       '''' + FloattoStr(Valor[12]) + ''', ' +
                       '''' + FloattoStr(Valor[13]) + ''', ' +
                       '''' + FloattoStr(Valor[14]) + ''', ' +
                       '''' + FloattoStr(Valor[15]) + ''', ' +
                       '''' + FloattoStr(Valor[16]) + ''', ' +
                       '''' + FloattoStr(Valor[17]) + ''', ' +
                       '''' + FloattoStr(Valor[18]) + ''', ' +
                       '''' + InttoStr  (Valor[19]) + ''', ' +
                       '''' + Valor[20]  + ''', ');
        Query1.SQL.Add('''' + Valor[21]  + ''', ' +
                       '''' + InttoStr  (Valor[22]) + ''', ' +
                       '''' + Valor[23]  + ''', ' +
                       '''' + Valor[24]  + ''', ' +
                       '''' + Valor[25]  + ''', ' +
                       '''' + Valor[26]  + ''', ' +
                       '''' + Valor[27]  + ''', ' +
                       '''' + InttoStr  (Valor[28]) + ''', ' +
                       '''' + InttoStr  (Valor[29]) + ''', ' +
                       '''' + InttoStr  (Valor[30]) + ''', ');
        Query1.SQL.Add('''' + InttoStr  (Valor[31]) + ''', ' +
                       '''' + InttoStr  (Valor[32]) + ''', ' +
                       '''' + InttoStr  (Valor[33]) + ''', ' +
                       '''' + InttoStr  (Valor[34]) + ''', ' +
                       '''' + Valor[35]  + ''', ' +
                       '''' + Valor[36]  + ''', ' +
                       '''' + InttoStr  (Valor[37]) + ''', ' +
                       '''' + InttoStr  (Valor[38]) + ''', ' +
                       '''' + Valor[47]   + ''') ');

      end
      else begin
        Query1.SQL.Add('UPDATE NFISCAIS SET ');
        Query1.SQL.Add('NUMERO_NFISCAL = '''      + InttoStr  (Valor[0]) + ''', ');
        Query1.SQL.Add('DTEMISSAO_NFISCAL = ''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add('DTSAIDA_NFISCAL = '''   + Valor[2] + ''', ');
        Query1.SQL.Add('PEDIDO_SQ = '''           + InttoStr  (Valor[3]) + ''', ');
        Query1.SQL.Add('COTACAO_DOLAR = '''       + FloattoStr(Valor[4]) + ''', ');
        Query1.SQL.Add('CLIENTE_SQ = '''          + InttoStr  (Valor[5]) + ''', ');
        Query1.SQL.Add('COND_PAGTO_SQ = '''       + InttoStr  (Valor[6]) + ''', ');
        Query1.SQL.Add('NATUREZA_SQ = '''         + InttoStr  (Valor[7]) + ''', ');
        Query1.SQL.Add('TRANSPORTADORA_SQ = '''   + InttoStr  (Valor[8]) + ''', ');
        Query1.SQL.Add('BASE_ICMS = '''           + FloattoStr(Valor[9]) + ''', ');
        Query1.SQL.Add('VLR_ICMS = '''            + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('BASE_ICMS_SUBST = '''     + FloattoStr(Valor[11]) + ''', ');
        Query1.SQL.Add('VLR_ICMS_SUBST = '''      + FloattoStr(Valor[12]) + ''', ');
        Query1.SQL.Add('VLR_PRODUTOS = '''        + FloattoStr(Valor[13]) + ''', ');
        Query1.SQL.Add('VLR_FRETE = '''           + FloattoStr(Valor[14]) + ''', ');
        Query1.SQL.Add('VLR_SEGURO = '''          + FloattoStr(Valor[15]) + ''', ');
        Query1.SQL.Add('VLR_DESP_ACESS = '''      + FloattoStr(Valor[16]) + ''', ');
        Query1.SQL.Add('VLR_IPI = '''             + FloattoStr(Valor[17]) + ''', ');
        Query1.SQL.Add('VLR_TOTAL = '''           + FloattoStr(Valor[18]) + ''', ');
        Query1.SQL.Add('FRETE_TRANSP = '''        + InttoStr  (Valor[19]) + ''', ');
        Query1.SQL.Add('PLACA_TRANSP = '''      +            Valor[20] + ''', ');
        Query1.SQL.Add('UF_PLACA_TRANSP = '''   +            Valor[21] + ''', ');
        Query1.SQL.Add('QTDE_TRANSP = '''         + InttoStr  (Valor[22]) + ''', ');
        Query1.SQL.Add('ESPECIE_TRANSP = '''    +            Valor[23] + ''', ');
        Query1.SQL.Add('MARCA_TRANSP = '''      +            Valor[24] + ''', ');
        Query1.SQL.Add('NUMERO_TRANSP = '''     +            Valor[25] + ''', ');
        Query1.SQL.Add('PBRUTO_TRANSP = '''     +            Valor[26] + ''', ');
        Query1.SQL.Add('PLIQUIDO_TRANSP = '''   +            Valor[27] + ''', ');
        Query1.SQL.Add('CLASS_FISCAL1 = '''       + InttoStr  (Valor[28]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL2 = '''       + InttoStr  (Valor[29]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL3 = '''       + InttoStr  (Valor[30]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL4 = '''       + InttoStr  (Valor[31]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL5 = '''       + InttoStr  (Valor[32]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL6 = '''       + InttoStr  (Valor[33]) + ''', ');
        Query1.SQL.Add('CLASS_FISCAL7 = '''       + InttoStr  (Valor[34]) + ''', ');
        Query1.SQL.Add('MENSAGEM = '''          +            Valor[35] + ''', ');
        Query1.SQL.Add('CANCELADA = '''         +            Valor[36] + ''', ');
        Query1.SQL.Add('DIAS_DEMONSTRACAO = '''   + InttoStr  (Valor[37]) + ''', ');
        Query1.SQL.Add('VENDEDOR_SQ = '''         + InttoStr  (Valor[38]) + ''', ');
        Query1.SQL.Add('NF_MANUAL = '''         +            Valor[47] + ''' ');
        Query1.SQL.Add ('WHERE NFISCAL_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[39] do
      if Valor[40][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM NFISCAIS_ITENS WHERE NFISCAL_ITEM_SQ = ' + InttoStr (Valor[40][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[41] do
      if (Valor[43] >= 0) and (Valor[44][0] <> 0) then
      begin
        Query1.SQL.Clear;
        if Valor[45][i] <> '0' then
        begin
          Query1.SQL.Add('UPDATE NFISCAIS_ITENS SET ');
          Query1.SQL.Add ('PECA_SQ = '''         + InttoStr  (Valor[44][i]) + ''', ');
          Query1.SQL.Add ('QTDE_ITEM = '''       + InttoStr  (Valor[42][i][3]) + ''', ');
          Query1.SQL.Add ('NR_SERIE_ITEM = '''   +            Valor[42][i][12] + ''', ');
          Query1.SQL.Add ('VLR_UNIT_ITEM = '''   + FloattoStr(Valor[42][i][4]) + ''', ');
          Query1.SQL.Add ('CLASS_FISCAL = '''    +            Valor[42][i][5] + ''', ');
          Query1.SQL.Add ('STRIBUT = '''         + InttoStr  (Valor[42][i][6]) + ''', ');
          Query1.SQL.Add ('ALIQ_ICMS_ITEM = '''  + FloattoStr(Valor[42][i][7]) + ''', ');
          Query1.SQL.Add ('ALIQ_IPI_ITEM = '''   + FloattoStr(Valor[42][i][9]) + ''', ');
          Query1.SQL.Add ('VLR_ICMS_ITEM = '''   + FloattoStr(Valor[42][i][8]) + ''', ');
          Query1.SQL.Add ('VLR_IPI_ITEM = '''    + FloattoStr(Valor[42][i][10]) + ''', ');
          Query1.SQL.Add ('VLR_TOTAL_ITEM = '''  + FloattoStr(Valor[42][i][11]) + ''' ');
          Query1.SQL.Add ('WHERE NFISCAL_ITEM_SQ = ' + InttoStr (Valor[45][i]));
        end
        else begin
          Query1.SQL.Add('INSERT INTO NFISCAIS_ITENS (' +
                         'NFISCAL_SQ, ITEM, PECA_SQ, ' +
                         'QTDE_ITEM, NR_SERIE_ITEM, ' +
                         'VLR_UNIT_ITEM, CLASS_FISCAL, ' +
                         'STRIBUT, ALIQ_ICMS_ITEM, ' +
                         'ALIQ_IPI_ITEM, VLR_ICMS_ITEM, ' +
                         'VLR_IPI_ITEM, VLR_TOTAL_ITEM) ' +
                         'VALUES (' +
                         '''' + InttoStr (Chave) + ''', ' +
                         '''' + InttoStr (i+1) + ''', ' +
                         '''' + InttoStr (Valor[44][i])  + ''', ' +
                         '''' + InttoStr (Valor[42][i][3])  + ''', ' +
                         '''' + Valor[42][i][12]  + ''', ' +
                         '''' + FloattoStr (Valor[42][i][4])  + ''', ' +
                         '''' + Valor[42][i][5]  + ''', ' +
                         '''' + InttoStr (Valor[42][i][6])  + ''', ' +
                         '''' + FloattoStr (Valor[42][i][7])  + ''', ' +
                         '''' + FloattoStr (Valor[42][i][9])  + ''', ' +
                         '''' + FloattoStr (Valor[42][i][8])  + ''', ' +
                         '''' + FloattoStr (Valor[42][i][10]) + ''', ' +
                         '''' + FloattoStr (Valor[42][i][11]) + ''')');
        end;
        Query1.ExecSQL;
      end;


      if novo = 255 then
      begin
        if Valor[3] <> 0 then
        begin
          Query1.SQL.Clear;
          Query1.SQL.Add('UPDATE PEDIDOS SET');
          Query1.SQL.Add('NFISCAL_SQ = ''' + InttoStr (Chave) + '''');
          Query1.SQL.Add('WHERE PEDIDO_SQ = ' + InttoStr (Valor[3]));
          Query1.ExecSQL;
        end;

        if (novo = 255) and (Valor[0] = 0) then
        begin
          Query1.SQL.Clear;
          Query1.SQL.Add('UPDATE EMPRESAS SET NUMERO_NFISCAL = NUMERO_NFISCAL + 1');
          Query1.ExecSQL;
          Query1.SQL.Clear;
          Query1.SQL.Add('SELECT NUMERO_NFISCAL FROM EMPRESAS');
          Query1.Open;
          Valor[0] := Query1.FieldByName ('NUMERO_NFISCAL').AsInteger;

          Query1.SQL.Clear;
          Query1.SQL.Add('UPDATE NFISCAIS SET');
          Query1.SQL.Add('NUMERO_NFISCAL = ''' + InttoStr (Valor[0]) + '''');
          Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Chave));
          Query1.ExecSQL;
        end;
      end;
    end;
    if TABELA = 'ASSISTENCIAS' then
    begin
      if Valor[13] then
        Valor[13] := 'S' else
        Valor[13] := 'N';
      if Valor[14] then
        Valor[14] := 'S' else
        Valor[14] := 'N';

      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO ASSISTENCIAS (' +
                       'NUMERO_ASSISTENCIA, DATA_CHAMADO, ' +
                       'DATA_ASSISTENCIA, COTACAO_DOLAR, ' +
                       'CLIENTE_SQ, COND_PAGTO_SQ, ' +
                       'DESP_CHAMADO, DESP_HTEC_AD, ' +
                       'DESP_DESLOC, VLR_PECAS, ' +
                       'VLR_TOTAL, HORA_INICIO, ' +
                       'HORA_FIM, GARANTIA, ' +
                       'CONTRATO, SERVICOS) ' +
                       'VALUES (' +
                       '''' + InttoStr  (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[2]) + ''', ' +
                       '''' + FloattoStr (Valor[3])  + ''', ' +
                       '''' + InttoStr  (Valor[4]) + ''', ' +
                       '''' + InttoStr  (Valor[5]) + ''', ' +
                       '''' + FloattoStr (Valor[6])  + ''', ' +
                       '''' + FloattoStr (Valor[7])  + ''', ' +
                       '''' + FloattoStr (Valor[8])  + ''', ' +
                       '''' + FloattoStr (Valor[9])  + ''', ' +
                       '''' + FloattoStr (Valor[10])  + ''', ' +
                       '''' + TimetoStr (Valor[11]) + ''', ' +
                       '''' + TimetoStr (Valor[12]) + ''', ' +
                       '''' + Valor[13]  + ''', ' +
                       '''' + Valor[14]  + ''', ' +
                       '''' + Valor[15]  + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE ASSISTENCIAS SET ');
        Query1.SQL.Add('NUMERO_ASSISTENCIA = ''' + InttoStr  (Valor[0]) + ''', ');
        Query1.SQL.Add('DATA_CHAMADO = '''     + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add('DATA_ASSISTENCIA = ''' + FormatDateTime  ('yyyy-mm-dd', Valor[2]) + ''', ');
        Query1.SQL.Add('COTACAO_DOLAR = '''      + FloattoStr(Valor[3]) + ''', ');
        Query1.SQL.Add('CLIENTE_SQ = '''         + InttoStr  (Valor[4]) + ''', ');
        Query1.SQL.Add('COND_PAGTO_SQ = '''      + InttoStr  (Valor[5]) + ''', ');
        Query1.SQL.Add('DESP_CHAMADO = '''       + FloattoStr(Valor[6]) + ''', ');
        Query1.SQL.Add('DESP_HTEC_AD = '''       + FloattoStr(Valor[7]) + ''', ');
        Query1.SQL.Add('DESP_DESLOC = '''        + FloattoStr(Valor[8]) + ''', ');
        Query1.SQL.Add('VLR_PECAS = '''          + FloattoStr(Valor[9]) + ''', ');
        Query1.SQL.Add('VLR_TOTAL = '''          + FloattoStr(Valor[10]) + ''', ');
        Query1.SQL.Add('HORA_INICIO = '''      + TimetoStr (Valor[11]) + ''', ');
        Query1.SQL.Add('HORA_FIM = '''         + TimetoStr (Valor[12]) + ''', ');
        Query1.SQL.Add('GARANTIA = '''         +            Valor[13] + ''', ');
        Query1.SQL.Add('CONTRATO = '''         +            Valor[14] + ''', ');
        Query1.SQL.Add('SERVICOS = '''         +            Valor[15] + ''' ');
        Query1.SQL.Add ('WHERE ASSISTENCIA_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;

      if novo = 255 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT LAST_INSERT_ID() as CHAVE');
        Query1.Open;
        Chave := Query1.FieldByName('CHAVE').AsInteger;
      end;

      for i := 0 to Valor[16] do
      if Valor[17][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM ASSISTENCIAS_EQUIPS WHERE ASSISTENCIA_EQUIP_SQ = ' + InttoStr (Valor[17][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[18] do
      if (Valor[20] >= 0) and (Valor[21][0] <> 0) then
      begin
        Query1.SQL.Clear;
        if Valor[22][i] <> '0' then
        begin
          Query1.SQL.Add('UPDATE ASSISTENCIAS_EQUIPS SET ');
          Query1.SQL.Add ('MODELO_SQ = '''      + InttoStr  (Valor[21][i]) + ''', ');
          Query1.SQL.Add ('NR_SERIE_EQUIP = ''' +            Valor[19][i][1] + ''', ');
          Query1.SQL.Add ('DEFEITO = '''        +            Valor[19][i][2] + ''' ');
          Query1.SQL.Add ('WHERE ASSISTENCIA_EQUIP_SQ = ' + InttoStr (Valor[22][i]));
        end
        else begin
          Query1.SQL.Add('INSERT INTO ASSISTENCIAS_EQUIPS (' +
                         'ASSISTENCIA_SQ, MODELO_SQ, ' +
                         'NR_SERIE_EQUIP, DEFEITO) ' +
                         'VALUES (' +
                         '''' + InttoStr (Chave) + ''', ' +
                         '''' + InttoStr (Valor[21][i])  + ''', ' +
                         '''' + Valor[19][i][1]  + ''', ' +
                         '''' + Valor[19][i][2] + ''')');
        end;
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[23] do
      if Valor[24][i] <> 0 then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('DELETE FROM ASSISTENCIAS_ITEMS WHERE ASSISTENCIA_ITEM_SQ = ' + InttoStr (Valor[24][i]));
        Query1.ExecSQL;
      end;

      for i := 0 to Valor[25] do
      if (Valor[27] >= 0) and (Valor[28][0] <> 0) then
      begin
        Query1.SQL.Clear;
        if Valor[29][i] <> '0' then
        begin
          Query1.SQL.Add('UPDATE ASSISTENCIAS_ITENS SET ');
          Query1.SQL.Add ('PECA_SQ = '''            + InttoStr  (Valor[28][i]) + ''', ');
          Query1.SQL.Add ('QTDE_ASSISTENCIA_ITEM = ''' + InttoStr  (Valor[26][i][1]) + ''', ');
          Query1.SQL.Add ('PRECO_UNIT = '''            + FloattoStr(Valor[26][i][2]) + ''' ');
          Query1.SQL.Add ('WHERE ASSISTENCIA_ITEM_SQ = ' + InttoStr (Valor[29][i]));
        end
        else begin
          Query1.SQL.Add('INSERT INTO ASSISTENCIAS_ITENS (' +
                         'ASSISTENCIA_SQ, PECA_SQ, ' +
                         'QTDE_ASSISTENCIA_ITEM, PRECO_UNIT) ' +
                         'VALUES (' +
                         '''' + InttoStr (Chave) + ''', ' +
                         '''' + InttoStr (Valor[28][i])  + ''', ' +
                         '''' + InttoStr (Valor[26][i][1])  + ''', ' +
                         '''' + FloattoStr(Valor[26][i][2]) + ''')');
        end;
        Query1.ExecSQL;
      end;

      if (novo = 255) and (Valor[0] = 0) then
      begin
        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE EMPRESAS SET NUMERO_ASSISTENCIA = NUMERO_ASSISTENCIA + 1');
        Query1.ExecSQL;

        Query1.SQL.Clear;
        Query1.SQL.Add('SELECT NUMERO_ASSISTENCIA FROM EMPRESAS');
        Query1.Open;
        Valor[0] := Query1.FieldByName ('NUMERO_ASSISTENCIA').AsInteger;

        Query1.SQL.Clear;
        Query1.SQL.Add('UPDATE ASSISTENCIAS SET');
        Query1.SQL.Add('NUMERO_ASSISTENCIA = ''' + InttoStr (Valor[0]) + '''');
        Query1.SQL.Add('WHERE ASSISTENCIA_SQ = ' + InttoStr (Chave));
        Query1.ExecSQL;
      end;
    end;
    if TABELA = 'MODELOS' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO MODELOS (' +
                       'CODIGO_MODELO, DESCRICAO_MODELO, ' +
                       'MARCA_MODELO, PRECO_UNIT_MODELO, ' +
                       'UN_MODELO, NBM_SQ) ' +
                       'VALUES (' +
                       '''' + Valor[0] + ''', ' +
                       '''' + Valor[1] + ''', ' +
                       '''' + Valor[2] + ''', ' +
                       '''' + FloattoStr(Valor[3]) + ''', ' +
                       '''' + Valor[4] + ''', ' +
                       '''' + InttoStr(Valor[5]) + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE MODELOS SET ');
        Query1.SQL.Add ('CODIGO_MODELO = '''     + Valor[0] + ''', ');
        Query1.SQL.Add ('DESCRICAO_MODELO = '''  + Valor[1] + ''', ');
        Query1.SQL.Add ('MARCA_MODELO = '''      + Valor[2] + ''', ');
        Query1.SQL.Add ('PRECO_UNIT_MODELO = ''' + FloattoStr(Valor[3]) + ''', ');
        Query1.SQL.Add ('UN_MODELO = '''         + Valor[4] + ''', ');
        Query1.SQL.Add ('NBM_SQ = '''            + InttoStr(Valor[5]) + ''' ');
        Query1.SQL.Add ('WHERE MODELO_SQ = '     + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'VENDEDORES' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO VENDEDORES (' +
                       'CODIGO_VENDEDOR, NOME_VENDEDOR) ' +
                       'VALUES (' +
                       '''' + InttoStr(Valor[0]) + ''', ' +
                       '''' + Valor[1] + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE VENDEDORES SET ');
        Query1.SQL.Add ('CODIGO_VENDEDOR = ''' + InttoStr (Valor[0]) + ''', ');
        Query1.SQL.Add ('NOME_VENDEDOR = '''   +           Valor[1] + ''' ');
        Query1.SQL.Add ('WHERE VENDEDOR_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'ACESSOS' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO ACESSOS (' +
                       'NOME_PROGRAMA, USUARIO_SQ, ' +
                       'VISUALIZAR, CRIAR, ' +
                       'EDITAR, APAGAR) ' +
                       'VALUES (' +
                       '''' + Valor[0] + ''', ' +
                       '''' + InttoStr (Valor[1]) + ''', ' +
                       '''' + Valor[2] + ''', ' +
                       '''' + Valor[3] + ''', ' +
                       '''' + Valor[4] + ''', ' +
                       '''' + Valor[5] + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE ACESSOS SET ');
        Query1.SQL.Add ('NOME_PROGRAMA = ''' +           Valor[0] + ''', ');
        Query1.SQL.Add ('USUARIO_SQ = '''    + InttoStr (Valor[1]) + ''', ');
        Query1.SQL.Add ('VISUALIZAR = '''    +           Valor[2] + ''', ');
        Query1.SQL.Add ('CRIAR = '''         +           Valor[3] + ''', ');
        Query1.SQL.Add ('EDITAR = '''        +           Valor[4] + ''', ');
        Query1.SQL.Add ('APAGAR = '''        +           Valor[5] + ''' ');
        Query1.SQL.Add ('WHERE ACESSO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'CLASSIFICACAO' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO CLASSIFICACAO (' +
                       'CODIGO_CLASSIFICACAO, LIMITE_MINIMO, ' +
                       'LIMITE_MAXIMO, MESES_BONUS) ' +
                       'VALUES (' +
                       '''' + Valor[0] + ''', ' +
                       '''' + FloattoStr (Valor[1]) + ''', ' +
                       '''' + FloattoStr (Valor[2]) + ''', ' +
                       '''' + InttoStr (Valor[3]) + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE CLASSIFICACAO SET ');
        Query1.SQL.Add ('CODIGO_CLASSIFICACAO = ''' +             Valor[0] + ''', ');
        Query1.SQL.Add ('LIMITE_MINIMO = '''        + FloattoStr (Valor[1]) + ''', ');
        Query1.SQL.Add ('LIMITE_MAXIMO = '''        + FloattoStr (Valor[2]) + ''', ');
        Query1.SQL.Add ('MESES_BONUS = '''          + InttoStr   (Valor[3]) + ''' ');
        Query1.SQL.Add ('WHERE CLASSIFICACAO_SQ = ' + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    if TABELA = 'NF_SERVICOS' then
    begin
      Query1.SQL.Clear;
      if novo = 255 then
      begin
        Query1.SQL.Add('INSERT INTO NF_SERVICOS (' +
                       'NUMERO_NF_SERVICO, DATA_NF_SERVICO, ' +
                       'CLIENTE_SQ, TTL_NF_SERVICO, ' +
                       'ALIQ_ISS_NF_SERVICO, VLR_ISS_NF_SERVICO) ' +
                       'VALUES (' +
                       '''' + InttoStr   (Valor[0]) + ''', ' +
                       '''' + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ' +
                       '''' + InttoStr   (Valor[2]) + ''', ' +
                       '''' + FloattoStr (Valor[3]) + ''', ' +
                       '''' + FloattoStr (Valor[4]) + ''', ' +
                       '''' + FloattoStr (Valor[5]) + ''') ');
      end
      else begin
        Query1.SQL.Add('UPDATE NF_SERVICOS SET ');
        Query1.SQL.Add ('NUMERO_NF_SERVICO = '''   + InttoStr   (Valor[0]) + ''', ');
        Query1.SQL.Add ('DATA_NF_SERVICO = '''     + FormatDateTime  ('yyyy-mm-dd', Valor[1]) + ''', ');
        Query1.SQL.Add ('CLIENTE_SQ = '''          + InttoStr   (Valor[2]) + ''', ');
        Query1.SQL.Add ('TTL_NF_SERVICO = '''      + FloattoStr (Valor[3]) + ''', ');
        Query1.SQL.Add ('ALIQ_ISS_NF_SERVICO = ''' + FloattoStr (Valor[4]) + ''', ');
        Query1.SQL.Add ('VLR_ISS_NF_SERVICO = '''  + FloattoStr (Valor[5]) + ''' ');
        Query1.SQL.Add ('WHERE NF_SERVICO_SQ = '   + InttoStr (Chave));
      end;
      Query1.ExecSQL;
    end;
    DBConn.Commit;
    DBConn.Close;
  except
    on E: Exception do
    begin
      Result := E.Message + ' ' + Query1.SQL.Text;
      DBConn.Rollback;
    end;
  end;
end;

function TServer.ApagaRegistro(Campos: OleVariant): WideString;
var
  s: string;
begin
  try
    s := Copy (Campos[0], 3, 100); // remover o 'tb' do inicio.
    Result := '';
    Query1.SQL.Clear;
    Query1.SQL.Add('DELETE FROM ' + s + ' WHERE ' + Campos[1] + ' = ' + Campos[2]);
    Query1.ExecSQL;
  except
    Result := 'Este Registro Não Pode ser Apagado!' + chr(13) + 'Verifique os vinculos deste registro com outras tabelas!';
  end;
end;

function TServer.VerificaIndice(const TABELA: WideString; const CAMPO: WideString; const VALOR: WideString): Integer;
var
  s: String;
begin
  try
    Result := 1;
    qrVerIndice.Close;
    qrVerIndice.Sql.Clear;
    s :=  'SELECT ' + CAMPO + ' FROM ' + TABELA + ' WHERE ' + CAMPO + ' = ' + VALOR;
    qrVerIndice.Sql.Add (s);
    qrVerIndice.Open;
    if qrVerIndice.Eof then
      Result := 0;
  finally
  end;
end;

function TServer.CancelaNFiscal(VALOR: Integer): WideString;
begin
  Result := '';
  Query1.SQL.Clear;
  Query1.SQL.Add('UPDATE NFISCAIS SET');
  Query1.SQL.Add('CANCELADA = ''S''');
  Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Valor));
  Query1.ExecSQL;

  Query1.SQL.Clear;
  Query1.SQL.Add('DELETE FROM DUPLICATAS');
  Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Valor));
  Query1.ExecSQL;
  DBConn.Close;
end;

function TServer.FinalizaNfiscal(Nfiscal: Integer): WideString;
begin
  try
    Result := '';
    Query1.SQL.Clear;
    Query1.SQL.Add('UPDATE NFISCAIS SET');
    Query1.SQL.Add('CONCLUIDA = ''S''');
    Query1.SQL.Add('WHERE NFISCAL_SQ = ' + InttoStr (Nfiscal));
    Query1.ExecSQL;
    DBConn.Close;
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

function TServer.Classificacao(Cliente_sq: Integer; AnoMes: Integer): Integer;
var
  Faturamento: Real;
  i1, i2, aa, mm, Meses: Integer;
  Muda: Boolean;
  qr1, qr2: TQuery;
begin
  Muda := False;
  qr2 := TQuery.Create(self);
  qr2.DatabaseName := 'DBConn';

  qr1 := TQuery.Create(self);
  qr1.DatabaseName := 'DBConn';
  qr1.SQL.Clear;
  qr1.SQL.Add('SELECT CLIENTE_SQ FROM CLIENTES');
  if Cliente_sq <> 0 then
    qr1.SQL.Add('WHERE CLIENTE_SQ = ' + InttoStr (Cliente_sq));
  qr1.Open;

  While not qr1.Eof do
  begin
    qr2.SQL.Clear;
    qr2.SQL.Add('select EXTRACT(YEAR_MONTH FROM n.dtemissao_nfiscal) as anomes, n.cliente_sq, sum(n.vlr_produtos) as faturamento, cl.limite_minimo, cl.limite_maximo, cl.meses_bonus');
    qr2.SQL.Add('from nfiscais n');
    qr2.SQL.Add('left outer join naturezas     na on (na.natureza_sq      = n.natureza_sq)');
    qr2.SQL.Add('left outer join clientes      c  on (c.cliente_sq        = n.cliente_sq)');
    qr2.SQL.Add('left outer join classificacao cl on (cl.classificacao_sq = c.classificacao_sq)');
    qr2.SQL.Add('where na.tipo_nfiscal = 0');
    qr2.SQL.Add('and n.cancelada <> ''S''');
    qr2.SQL.Add('and n.cliente_sq = ' + qr1.FieldByName ('CLIENTE_SQ').AsString);
    qr2.SQL.Add('group by anomes');
    qr2.Open;
    if qr2.Locate('ANOMES', AnoMes, []) then
      Faturamento := Int (qr2.FieldByName('FATURAMENTO').AsFloat) else
      Faturamento := 0;
    if qr2.FieldByName('LIMITE_MAXIMO').AsFloat < Faturamento then
      Muda := True
    else if qr2.FieldByName('LIMITE_MINIMO').AsFloat > Faturamento then
    begin
      Meses := qr2.FieldByName('MESES_BONUS').AsInteger;
      Muda := True;
      aa := StrtoInt (FloatToStr (Int (AnoMes/100)));
      mm := AnoMes - aa * 100;
      for i1 := 1 to Meses do
      begin
        i2 := mm - i1;
        if i2 <= 0 then
          i2 := (aa - 1) * 100 + i2 + 12
        else
          i2 := aa * 100 + i2;
        if qr2.Locate('ANOMES', i2, []) then
        begin
          if qr2.FieldByName('LIMITE_MINIMO').AsFloat < qr2.FieldByName('FATURAMENTO').AsFloat then
            Muda := False;
          if Faturamento < qr2.FieldByName('FATURAMENTO').AsFloat then
            Faturamento := Int (qr2.FieldByName('FATURAMENTO').AsFloat);
        end;
      end;
    end;
    if Muda then
    begin
      qr2.SQL.Clear;
      qr2.SQL.Add('update clientes, classificacao set');
      qr2.SQL.Add('clientes.classificacao_sq = classificacao.classificacao_sq');
      qr2.SQL.Add('where classificacao.limite_minimo <= ' + FloattoStr (Faturamento));
      qr2.SQL.Add('and classificacao.limite_maximo >= ' + FloattoStr (Faturamento));
      qr2.SQL.Add('and clientes.cliente_sq = ' + qr1.FieldByName ('CLIENTE_SQ').AsString);
      qr2.ExecSQL;
    end;
  qr1.Next;
  end;
  if Cliente_sq = 0 then
  begin
    qr2.SQL.Clear;
    qr2.SQL.Add('update empresas set');
    qr2.SQL.Add('ultima_classificacao = now()');
    qr2.ExecSQL;
  end;
end;

function TServer.RegistraLogin(Usuario: Integer; Data: TDateTime; const IP: WideString): WideString;
begin
  try
    Result := '';
    Query1.SQL.Clear;
    Query1.SQL.Add('INSERT INTO HISTORICO_LOGIN (' +
                         'USUARIO_SQ, DATA_LOGIN, ' +
                         'IP_LOGIN) ' +
                         'VALUES (' +
                         InttoStr (Usuario) + ', ' +
                         '''' + FormatDateTime  ('yyyy-mm-dd', Data) + ''', ' +
                         '''' + IP + ''') ');
    Query1.ExecSQL;
  except
    on E: Exception do
      Result := E.Message;
  end;
end;

procedure TServer.RemoteDataModuleCreate(Sender: TObject);
var
  Reg: TRegistry;
  banco: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    begin
      banco    := Reg.ReadString ('FBBanco');
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  try
    DBConn.Connected    := True;
  except
    Exception.Create('Nao foi possível conectar-se ao banco de dados!');
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TServer,
    Class_Server, ciMultiInstance, tmApartment);
end.
