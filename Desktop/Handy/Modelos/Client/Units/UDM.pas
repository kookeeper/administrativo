unit UDM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBTable, IBDatabase, IBQuery, IBStoredProc,
  IdComponent, IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP,
  IdBaseComponent, IdMessage, IBUpdateSQL, DBClient, MConnect, SConnect,
  ExtCtrls;

type
  TDM = class(TDataModule)
    Msg: TIdMessage;
    IdSMTP1: TIdSMTP;
    SCServer: TSocketConnection;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    programas, captions: array[1..255] of string;
    estados, estado, ucod, unom, err_email_from, err_nome_from, err_email_to,
    err_nome_to, err_smtp, err_username, err_password, alt_dtped, alt_dtnf,
    alt_nrped, alt_nrnf, verinfo, ip, host: string;
    useq, strib, dias_dem: Integer;
    dtsenha: TDate;
    aliq_icms_prod1, aliq_icms_pec1, aliq_pis, aliq_cofins, aliq_iss: Real;

    function TestaCPF(Text : string) : Boolean;
    function TestaCNPJ(Text : string) : Boolean;
    function EnviarEmail (Tabela, Operacao, Erro: String; Novo: Boolean): Boolean;
    function EnviarEmail2 (Mensagem: String): Boolean;
    function Login (nivel:integer): Boolean;
    function GetIPFromHost (var HostName, IPaddr, WSAErr: string): Boolean;

    procedure AtualizaCondPagto (NFiscal: String; ValorTot: Real; DtEmissao: TDate;
      CondPagto, Natureza, Demonstracao: Integer; var Numero1, Numero2, Numero3,
      Data1, Data2, Data3, Valor1, Valor2, Valor3: String);
    procedure AtualizaItem (VlrUnit, VlrDesc, Dolar, Qtde: Real; var AliqICMS,
      AliqIPI, VlrIpi, VlrUnitSIpi, VlrTot, VlrTotSIpi, PctDesc, VlrICMS: Real);
  end;

var
  DM: TDM;

implementation

uses uPwd, UDMLista, UDMImpr, USplash, UMainMenu, Math, Winsock;

{$R *.DFM}

// TestaCPF - validacao do CPF
Function TDM.TestaCPF(Text : string) : Boolean;
Var i, code : Integer;
// D, d3 : String;
d2 : Array[1..9] of Integer;
DF4, DF5, DF6, RESTO1, Pridig, Segdig : Integer;
Pridig2, Segdig2 : String;

Begin
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
Var i, code : Integer;
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

If (Resto1=0) or (Resto1=1) then Pridig:=0 else Pridig:=11 - Resto1;

For i := 1 to 12 do Val(Copy (Text, i, 1),D2[i],Code);

DF4 := 6 * D2[1] + 5 * D2[2] + 4 * D2[3] + 3 * D2[4] + 2 * D2[5]
+ 9 * D2[6] + 8 * D2[7] + 7 * D2[8] + 6 * D2[9] + 5 * D2[10] +4 * D2[11]
+ 3 * D2[12] + 2 * Pridig;
DF5 := DF4 div 11;
DF6 := DF5 * 11;
Resto1 := Df4 - DF6;

If (Resto1=0) or (Resto1=1) then Segdig:=0 else Segdig:=11 - Resto1;

Str(Pridig, Pridig2);
Str(Segdig, Segdig2);
If not (Pridig2=Text[13]) or not (SegDig2=Text[14]) then
Result := False
else
Result := True;
End;

function TDM.EnviarEmail (Tabela, Operacao, Erro: String; Novo: Boolean): Boolean;
var
  Err: string;
begin
  Result := True;
  if Erro <> '' then
  try
    if not GetIPFromHost(Host, IP, Err) then
    begin
      IP   := '';
      Host := '';
    end;

    if IdSMTP1.Connected then
     IdSMTP1.Disconnect;
    Msg.From.Address := err_email_from;
    Msg.From.Name    := err_nome_from;
    Msg.Recipients.Clear;
    Msg.Recipients.Add;
    Msg.Recipients.Items[0].Address := err_email_to;
    Msg.Recipients.Items[0].Name    := err_nome_to;
    IdSMTP1.Host := err_smtp;
    IdSMTP1.Username := err_username;
    IdSMTP1.Password := err_password;
    IdSMTP1.Connect();
    if IdSMTP1.Connected then
    begin
      Msg.Date := Date;
      Msg.Body.Clear;
      Msg.Subject := 'Erro no Programa ' + Application.Title;
      Msg.Body.Add ('Mensagem de Erro!!!');
      if Novo then Msg.Body.Add ('Tentando ' + Operacao + ' registro Novo na Tabela ' + Tabela + '.')
      else         Msg.Body.Add ('Tentando ' + Operacao + ' registro Existente na Tabela ' + Tabela + '.');
      Msg.Body.Add ('Mensagem de Erro: ' + Erro + '.');
      Msg.Body.Add ('Operacao realizada por: ' + unom + '. Via IP: ' + IP + ' Host: ' + Host);
      Msg.Body.Add ('Versão do Programa: ' + verinfo);
      IdSMTP1.Send(Msg);
      IdSMTP1.Disconnect;
    end;
  except
    Result := False;
  end;
end;

function TDM.EnviarEmail2 (Mensagem: String): Boolean;
var
  Err: string;
begin
  Result := True;
  try
    if not GetIPFromHost(Host, IP, Err) then
    begin
      IP   := '';
      Host := '';
    end;

    if IdSMTP1.Connected then
     IdSMTP1.Disconnect;
    Msg.From.Address := err_email_from;
    Msg.From.Name    := err_nome_from;
    Msg.Recipients.Clear;
    Msg.Recipients.Add;
    Msg.Recipients.Items[0].Address := err_email_to;
    Msg.Recipients.Items[0].Name    := err_nome_to;
    IdSMTP1.Host := err_smtp;
    IdSMTP1.Username := err_username;
    IdSMTP1.Password := err_password;
    IdSMTP1.Connect();
    if IdSMTP1.Connected then
    begin
      Msg.Date := Date;
      Msg.Body.Clear;
      Msg.Subject := 'Erro no Programa ' + Application.Title;
      Msg.Body.Add (Mensagem);
      Msg.Body.Add ('Operacao realizada por: ' + unom + '. Via IP: ' + IP + ' Host: ' + Host);
      Msg.Body.Add ('Versão do Programa: ' + verinfo);
      IdSMTP1.Send(Msg);
      IdSMTP1.Disconnect;
    end;
  except
    Result := False;
  end;
end;

function TDM.Login (nivel:integer): Boolean;
var
  Mensagem: String;
begin
  Result := False;
  try
    Application.CreateForm(TPasswordDlg, PasswordDlg);
    tag := 0;
    While tag = 0 do
    if PasswordDlg.ShowModal = mrOk then
    begin
      if PasswordDlg.Usuario.Text = '' then
        Showmessage ('Usuário não Cadastrado!');
      DMLista.cdsListaUsuarios.Open;
//      DMLista.SCServerLista.Close;
      if not DMLista.cdsListaUsuarios.Locate('CODIGO_USUARIO', PasswordDlg.Usuario.Text, []) then
        Showmessage ('Usuário não Cadastrado!')
      else if DMLista.cdsListaUsuariosSENHA_USUARIO.Value <> PasswordDlg.Password.Text then
        Showmessage ('Senha Inválida!') else
        tag := 1;
    end
    else raise Exception.Create ('Operação Abortada!');
    ucod := DMLista.cdsListaUsuariosCODIGO_USUARIO.AsString;
    useq := DMLista.cdsListaUsuariosUSUARIO_SQ.AsInteger;
    unom := DMLista.cdsListaUsuariosNOME_USUARIO.AsString;
    err_email_from := DMLista.cdsListaUsuariosERRO_EMAIL_FROM.AsString;
    err_nome_from  := DMLista.cdsListaUsuariosERRO_NOME_FROM.AsString;
    err_email_to   := DMLista.cdsListaUsuariosERRO_EMAIL_TO.AsString;
    err_nome_to    := DMLista.cdsListaUsuariosERRO_NOME_TO.AsString;
    err_smtp       := DMLista.cdsListaUsuariosERRO_SMTP.AsString;
    err_username   := DMLista.cdsListaUsuariosERRO_USERNAME.AsString;
    err_password   := DMLista.cdsListaUsuariosERRO_PASSWORD.AsString;

    Mensagem := SCServer.AppServer.RegistraLogin (useq, Date, '');
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    EnviarEmail ('HISTORICO_LOGIN', 'GRAVAR', Mensagem, True);

    if dtsenha < (date + 10) then
      EnviarEmail2 ('Senha Vence em ' + FormatDateTime ('dd/mm/yyyy', dtsenha));
    Result := True;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Halt;
    end;
  end;
  PasswordDlg.Free;
  DMLista.cdsListaUsuarios.Close;
end;

function TDM.GetIPFromHost (var HostName, IPaddr, WSAErr: string): Boolean;
type
  Name = array[0..100] of Char;
  PName = ^Name;
var
  HEnt: pHostEnt;
  HName: PName;
  WSAData: TWSAData;
  i: Integer;
begin
  Result := False;
  if WSAStartup($0101, WSAData) <> 0 then begin
    WSAErr := 'Winsock is not responding."';
    Exit;
  end;
  IPaddr := '';
  New(HName);
  if GetHostName(HName^, SizeOf(Name)) = 0 then
  begin 
    HostName := StrPas(HName^); 
    HEnt := GetHostByName(HName^); 
    for i := 0 to HEnt^.h_length - 1 do 
     IPaddr :=
      Concat(IPaddr,
      IntToStr(Ord(HEnt^.h_addr_list^[i])) + '.');
    SetLength(IPaddr, Length(IPaddr) - 1); 
    Result := True; 
  end
  else begin 
   case WSAGetLastError of
    WSANOTINITIALISED:WSAErr:='WSANotInitialised'; 
    WSAENETDOWN      :WSAErr:='WSAENetDown'; 
    WSAEINPROGRESS   :WSAErr:='WSAEInProgress'; 
   end; 
  end; 
  Dispose(HName);
  WSACleanup; 
end; 

procedure TDM.AtualizaCondPagto (NFiscal: String; ValorTot: Real; DtEmissao: TDate;
    CondPagto, Natureza, Demonstracao: Integer; var Numero1, Numero2, Numero3,
    Data1, Data2, Data3, Valor1, Valor2, Valor3: String);
var
  v1, v2: real;
  i: integer;
begin
  Numero1 := '';
  Valor1  := '0';
  Data1   := '';
  Numero2 := '';
  Valor2  := '0';
  Data2   := '';
  Numero3 := '';
  Valor3  := '0';
  Data3   := '';

  if not DMLista.cdsListaCondPagto.Locate('COND_PAGTO_SQ', CondPagto, []) then
    Abort;

  if not DMLista.cdsListaNaturezas.Locate('NATUREZA_SQ', Natureza, []) then
    Abort;

  if DMLista.cdsListaNaturezasTIPO_NFISCAL.AsInteger = 1 then
  begin
    Numero1 := '';
    Valor1  := '0';
    Data1   := FormatDateTime ('dd/mm/yyyy', DtEmissao + Demonstracao);
  end
  else begin
    V1 := StrtoFloat (FloattoStrf (ValorTot / DMLista.cdsListaCondPagtoPARCELAS.Value, ffFixed, 10, 2));
    V2 := ValorTot - (V1*(DMLista.cdsListaCondPagtoPARCELAS.Value-1));
    for i := 1 to DMLista.cdsListaCondPagtoPARCELAS.Value do
    begin
      if i = DMLista.cdsListaCondPagtoPARCELAS.Value then
        V1 := V2;
      if i = 1 then
      begin
        Numero1 := NFiscal + ' ' + InttoStr (i) + '/' + DMLista.cdsListaCondPagtoPARCELAS.AsString;
        Valor1  := FloattoStrf (V1, ffFixed, 10, 2);
        Data1   := FormatDateTime ('dd/mm/yyyy', DtEmissao + DMLista.cdsListaCondPagtoD00.Value);
      end;
      if i = 2 then
      begin
        Numero2 := NFiscal + ' ' + InttoStr (i) + '/' + DMLista.cdsListaCondPagtoPARCELAS.AsString;
        Valor2  := FloattoStrf (V1, ffFixed, 10, 2);
        Data2   := FormatDateTime ('dd/mm/yyyy', DtEmissao + DMLista.cdsListaCondPagtoD01.Value);
      end;
      if i = 3 then
      begin
        Numero3 := NFiscal + ' ' + InttoStr (i) + '/' + DMLista.cdsListaCondPagtoPARCELAS.AsString;
        Valor3  := FloattoStrf (V2, ffFixed, 10, 2);
        Data3   := FormatDateTime ('dd/mm/yyyy', DtEmissao + DMLista.cdsListaCondPagtoD02.Value);
      end;
    end;
  end;
end;

procedure TDM.AtualizaItem (VlrUnit, VlrDesc, Dolar, Qtde: Real; var AliqICMS,
          AliqIPI, VlrIpi, VlrUnitSIpi, VlrTot, VlrTotSIpi, PctDesc, VlrICMS: Real);
var
  VlrIpiUnit, VlrUnitReal: Real;
begin
  AliqICMS    := 0;
  AliqIPI     := 0;
  VlrIpi      := 0;
  VlrTot      := 0;
  PctDesc     := 0;
  VlrICMS     := 0;
  VlrUnitSIpi := 0;
  if (VlrUnit * Qtde) <> 0 then
  begin
    PctDesc := VlrDesc * 100 / (VlrUnit * Qtde);
    AliqIPI := DMLista.cdsListaPecasALIQ_IPI.Value;
    if (DMLista.cdsListaClientesINSCR_ESTADUAL.AsString = '') or (Pos ('ISENT', DMLista.cdsListaClientesINSCR_ESTADUAL.AsString) <> 0) then
    begin
      if DM.TestaCNPJ(DMLista.cdsListaClientesCODIGO_CLIENTE.AsString) then
      begin
        if DMLista.cdsListaClientesESTADO.AsString <> DM.estado then
          AliqICMS := DMLista.cdsListaNaturezasALIQ_ICMS.Value else // P.J. ISENTO FORA DO ESTADO
          AliqICMS := DM.aliq_icms_prod1;                           // P.J. ISENTO DO ESTADO
      end
      else begin
        if DMLista.cdsListaPecasTIPO_PECA.AsInteger = 1 then
            AliqICMS := DM.aliq_icms_prod1 else                     // P.F. ISENTO (PRODUTO)
        if DMLista.cdsListaPecasTIPO_PECA.AsInteger = 2 then
            AliqICMS := DM.aliq_icms_pec1;                          // P.F. ISENTO (PECA)
      end;
    end
    else begin
      if DMLista.cdsListaClientesESTADO.AsString = DM.estado then
        AliqICMS := DMLista.cdsListaPecasALIQ_ICMS.Value else    // P.F./J. DO ESTADO
        AliqICMS := DMLista.cdsListaNaturezasALIQ_ICMS.Value;       // P.F./J. FORA DO ESTADO
    end;
    if DMLista.cdsListaNaturezasISENCAO_IPI.AsString  = 'S' then AliqIPI  := 0;
    if DMLista.cdsListaNaturezasISENCAO_ICMS.AsString = 'S' then AliqICMS := 0;

    VlrUnitReal := Int (100 * (VlrUnit - VlrDesc) * Dolar + 0.5);
    VlrUnitReal := VlrUnitReal / 100;

    VlrIpiUnit := Int (100 * VlrUnitReal * (AliqIPI / (100 + AliqIPI)) + 0.5);
    VlrIpiUnit := VlrIpiUnit / 100;

    VlrUnitSIpi := VlrUnitReal - VlrIpiUnit;

    VlrTotSIpi := Int (100 * (VlrUnitReal - VlrIpiUnit) * Qtde);
    VlrTotSIpi := VlrTotSIpi / 100;

    VlrIpi := Int (VlrTotSIpi * AliqIPI);
    VlrIpi := VlrIpi / 100;

    VlrTot := VlrTotSIpi + VlrIpi;

    VlrICMS := Int (VlrTotSIpi * AliqICMS + 0.5);
    VlrICMS := VlrICMS / 100;
  end;
end;

procedure TDM.DataModuleCreate(Sender: TObject);
var
  cdsLista: TClientDataSet;
begin
  if FileExists('prAtRec.exe') then
  begin
    DeleteFile('Update.exe');
    RenameFile('prAtRec.exe', 'Update.exe');
  end;
//  WinExec ('Update Automatico', 0);
  estados := 'AC AL AM AP BA CE DF ES GO MA MG MS MT PA PB PE PI PR RJ RN RO RR RS SC SE SP TO';
  FSplash := TFSplash.Create (nil);
  FSplash.Show;
  FSplash.Hide;
  FSplash.Free;
  FMainMenu.VerificaMenu;
  DMLista.AtualizaVariaveis (cdsLista);
  SCServer.Close;
end;

end.
