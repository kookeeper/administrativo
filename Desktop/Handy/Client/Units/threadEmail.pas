unit threadEmail;

interface

uses
  Classes;

type
  TEnviaEmail = class(TThread)
  private
    function GetIPFromHost(var HostName, IPaddr, WSAErr: string): Boolean;
    { Private declarations }
  protected
    procedure Execute; override;
  public
    tipoMensagem: Integer;
    Tabela, Operacao, Mensagem: String;
    Novo: Boolean;
  end;

implementation

uses SysUtils, UDM, Forms, WinSock;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TEnviaEmail.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TEnviaEmail }

procedure TEnviaEmail.Execute;
var
  Err, titulo: string;
begin
{
  if Trim(Mensagem) <> '' then
  try
    if not GetIPFromHost(DM.host_email, DM.IP_email, Err) then
    begin
      DM.IP_email   := '';
      DM.Host_email := '';
    end;

    DM.Msg.Body.Clear;

    if tipoMensagem = 1 then
    begin
      titulo := 'Tentando ' + Operacao + ' registro ';
      if Novo then
        titulo := titulo + 'Novo'
      else
        titulo := titulo + 'Existente';
      titulo := titulo +  ' na Tabela ' + Tabela;

      DM.gravarNotificacao(DM.unom, DM.ip_email, DM.verinfo, Application.Title, titulo, Mensagem);

      if Novo then DM.Msg.Body.Add ('Tentando ' + Operacao + ' registro Novo na Tabela ' + Tabela + '.')
      else         DM.Msg.Body.Add ('Tentando ' + Operacao + ' registro Existente na Tabela ' + Tabela + '.');
    end;

    DM.Msg.Body.Add ('Operacao realizada por: ' + DM.unom + '. Via IP: ' + DM.IP_email + ' Host: ' + DM.Host_email);
    DM.Msg.Body.Add ('Versão do Programa: ' + DM.verinfo);
    DM.Msg.Body.Add ('Mensagem de Erro: ' + Mensagem + '.');

    if DM.IdSMTP1.Connected then
     DM.IdSMTP1.Disconnect;
    DM.Msg.From.Address := DM.err_email_from;
    DM.Msg.From.Name    := DM.err_nome_from;
    DM.Msg.Recipients.Clear;
    DM.Msg.Recipients.Add;
    DM.Msg.Recipients.Items[0].Address := DM.err_email_to;
    DM.Msg.Recipients.Items[0].Name    := DM.err_nome_to;
    DM.IdSMTP1.Host := DM.err_smtp;
    DM.IdSMTP1.Username := DM.err_username;
    DM.IdSMTP1.Password := DM.err_password;
    DM.IdSMTP1.Connect();
    if DM.IdSMTP1.Connected then
    begin
      DM.Msg.Date := Date;
      DM.Msg.Subject := 'Erro no Programa ' + Application.Title;
      DM.IdSMTP1.Send(DM.Msg);
      DM.IdSMTP1.Disconnect;
    end;
  except
  end;
}
end;

function TEnviaEmail.GetIPFromHost (var HostName, IPaddr, WSAErr: string): Boolean;
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

end.
 