unit threadNotificacao;

interface

uses
  Classes {$IFDEF MSWINDOWS} , Windows {$ENDIF}, DBTables, UDMServer, SysUtils;

type
  TenviaNotificacao = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

  TrecebeNotificacao = class(TThread)
  private
  protected
    procedure Execute; override;
  end;

implementation

uses UServer;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TenviaNotificacao.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TenviaNotificacao }

procedure TenviaNotificacao.Execute;
var
  qr1: TQuery;
  cnpj: String;
  RDM: TServer;
begin
  FreeOnTerminate := True;

  RDM := TServer.Create(nil);

  qr1 := TQuery.Create(RDM);
  qr1.DatabaseName := 'DBConn';

  qr1.SQL.Text := 'select codigo_empresa from empresas';
  qr1.Open;
  cnpj := qr1.FieldByName('codigo_empresa').AsString;
  qr1.Close;

  qr1.SQL.Text := 'select * from notificacao where status is null';
  qr1.Open;
  while not qr1.Eof do
  begin
    RDM.ExecSQL2('insert into notificacao (data_notificacao,nome_usuario,ip_usuario,versao_software,' +
    'nome_software,titulo_notificacao,mensagem,status,notificacao_base_sq,cnpj_empresa) values ('+
    QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', qr1.FieldByName('data_notificacao').AsDateTime))+','+
    QuotedStr(qr1.FieldByName('nome_usuario').AsString)+','+
    QuotedStr(qr1.FieldByName('ip_usuario').AsString)+','+
    QuotedStr(qr1.FieldByName('versao_software').AsString)+','+
    QuotedStr(qr1.FieldByName('nome_software').AsString)+','+
    QuotedStr(qr1.FieldByName('titulo_notificacao').AsString)+','+
    QuotedStr(qr1.FieldByName('mensagem').AsString)+','+
    QuotedStr(qr1.FieldByName('status').AsString)+','+
    qr1.FieldByName('notificacao_sq').AsString+','+
    cnpj+
    ')');
    RDM.ExecSQL('update notificacao set status=''A'' where notificacao_sq = ' + qr1.FieldByName('notificacao_sq').AsString);
    qr1.Next;
  end;
end;

{ TrecebeNotificacao }

procedure TrecebeNotificacao.Execute;
var
  qr1, qr2: TQuery;
  cnpj: String;
  RDM: TServer;
begin
  FreeOnTerminate := True;

  RDM := TServer.Create(nil);

  qr1 := TQuery.Create(RDM);
  qr1.DatabaseName := 'DBConn';

  qr2 := TQuery.Create(RDM);
  qr2.DatabaseName := 'DbNotif';

  qr1.SQL.Text := 'select codigo_empresa from empresas';
  qr1.Open;
  cnpj := qr1.FieldByName('codigo_empresa').AsString;
  qr1.Close;

  qr1.SQL.Text := 'select * from notificacao where status = ''A''';
  qr1.Open;
  while not qr1.Eof do
  begin
    qr2.SQL.Text := 'select status, notificacao_sq from notificacao where cnpj_empresa='+QuotedStr(cnpj)+' and notificacao_base_sq='+qr1.FieldByName('notificacao_sq').AsString;
    qr2.Open;
    if qr2.FieldByName('status').AsString='F' then
      RDM.ExecSQL('update notificacao set status=''F'' where notificacao_sq = ' + qr1.FieldByName('notificacao_sq').AsString);
    if qr2.FieldByName('status').AsString='C' then
      RDM.ExecSQL('update notificacao set status=''C'' where notificacao_sq = ' + qr1.FieldByName('notificacao_sq').AsString);
    qr1.Next;
  end;
end;

end.
