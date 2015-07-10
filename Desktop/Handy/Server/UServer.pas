unit UServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ScktComp, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPServer, IdTrivialFTPServer, IdTCPServer, UDMServer, DB, ExtCtrls,
  threadNotificacao;

type
  TFServer = class(TForm)
    IdTrivialFTPServer1: TIdTrivialFTPServer;
    ServerSocket1: TServerSocket;
    timerNotificacao: TTimer;
    procedure IdTrivialFTPServer1ReadFile(Sender: TObject;
      var FileName: String; const PeerInfo: TPeerInfo;
      var GrantAccess: Boolean; var AStream: TStream;
      var FreeStreamOnComplete: Boolean);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure timerNotificacaoTimer(Sender: TObject);
  private
    usuario_sq, tamanho: Integer;
    download, upload: Boolean;
    RDM: TServer;
    MStream: TMemoryStream;
    threadEnvia: TenviaNotificacao;
    threadRecebe: TrecebeNotificacao;
    procedure OnTerminateEnvia(Sender:TObject);
    procedure OnTerminateRecebe(Sender: TObject);
    { Private declarations }
  public
    idThreadEnvia, idThreadRecebe: Integer;
    { Public declarations }
  end;

var
  FServer: TFServer;

implementation

uses DataBkr;

{$R *.dfm}

procedure TFServer.IdTrivialFTPServer1ReadFile(Sender: TObject;
  var FileName: String; const PeerInfo: TPeerInfo;
  var GrantAccess: Boolean; var AStream: TStream;
  var FreeStreamOnComplete: Boolean);
begin
  FileName := ExtractFilePath(Application.ExeName) + FileName;
end;

procedure TFServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RDM := TServer.Create(nil);
  download := false;
  upload   := false;
  usuario_sq := 0;
  tamanho := 0;
end;

procedure TFServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  iLen: Integer;
  Bfr: Pointer;
  texto: String;
begin
  try
    if (not download) and (not upload) then
      texto := socket.ReceiveText;

    if Pos ('download', texto) > 0  then
    begin
      download := true;
      usuario_sq := StrtoInt(Copy(texto, 9, 5));

      try
        RDM.Query1.SQL.Clear;
        RDM.Query1.SQL.Add('SELECT FOTO FROM USUARIOS WHERE USUARIO_SQ = ' + InttoStr(usuario_sq));
        RDM.Query1.RequestLive := True;
        RDM.Query1.Open;
        MStream := TMemoryStream.Create;
        (RDM.Query1.FieldByName('FOTO') as TBlobField).SaveToStream(MStream);
        MStream.Position := 0;
      except
        Socket.SendText('fim');
      end;

      Socket.SendText(InttoStr(MStream.Size));
      RDM.Query1.Close;
      RDM.Query1.RequestLive := False;
    end else
    if download and (socket.ReceiveText = 'arquivo') then
      Socket.SendStream(MStream);

    if Pos ('upload', texto) > 0  then
    begin
      upload := true;
      usuario_sq := StrtoInt(Copy(texto, 7, Pos('/', texto)-1-6));
      tamanho    := StrtoInt(Copy(texto, Pos('/', texto)+1, 9));
      MStream := TMemoryStream.Create;
      Socket.SendText('arquivo');
    end else
    if upload then
    begin
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
        RDM.Query1.SQL.Clear;
        RDM.Query1.SQL.Add('SELECT FOTO FROM USUARIOS WHERE USUARIO_SQ = ' + InttoStr(usuario_sq));
        RDM.Query1.RequestLive := True;
        RDM.Query1.Open;
        RDM.Query1.Edit;
        (RDM.Query1.FieldByName('FOTO') as TBlobField).LoadFromStream(MStream);
        RDM.Query1.Post;
        RDM.Query1.Close;
        RDM.Query1.RequestLive := False;
        MStream.Free;
        MStream := nil;
        Socket.SendText('fim');
      end;
    end;
  except
    Socket.SendText('fim');
  end;
end;

procedure TFServer.timerNotificacaoTimer(Sender: TObject);
begin
  if idThreadEnvia = 0 then
  begin
    threadEnvia := TenviaNotificacao.Create(False);
    threadEnvia.OnTerminate := OnTerminateEnvia;
    idThreadEnvia := threadEnvia.ThreadID;
  end;

  if idThreadRecebe = 0 then
  begin
    threadRecebe := TrecebeNotificacao.Create(False);
    threadRecebe.OnTerminate := OnTerminateRecebe;
    idThreadRecebe := threadRecebe.ThreadID;
  end;
end;

procedure TFServer.OnTerminateEnvia(Sender: TObject);
begin
  idThreadEnvia := 0;
end;

procedure TFServer.OnTerminateRecebe(Sender: TObject);
begin
  idThreadRecebe := 0;
end;

end.
