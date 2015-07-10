object Server: TServer
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 389
  Top = 94
  Height = 342
  Width = 194
  object Msg: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 56
    Top = 232
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atLogin
    Left = 56
    Top = 184
  end
  object DBConn: TDatabase
    AliasName = 'HD'
    DatabaseName = 'DBConn'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=root'
      'ODBC DSN=HD'
      'OPEN MODE=READ/WRITE'
      'BATCH COUNT=200'
      'LANGDRIVER='
      'MAX ROWS=-1'
      'SCHEMA CACHE DIR='
      'SCHEMA CACHE SIZE=8'
      'SCHEMA CACHE TIME=-1'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SQLQRYMODE='
      'ENABLE SCHEMA CACHE=FALSE'
      'ENABLE BCD=TRUE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=nestle')
    SessionName = 'Session1_2'
    Left = 56
    Top = 80
  end
  object Session1: TSession
    AutoSessionName = True
    Left = 56
    Top = 32
  end
  object qrVerIndice: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    Left = 56
    Top = 128
  end
  object Query1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    Left = 112
    Top = 32
  end
end
