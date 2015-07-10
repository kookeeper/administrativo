object ServerLista: TServerLista
  OldCreateOrder = False
  Left = 313
  Top = 153
  Height = 299
  Width = 215
  object Session1: TSession
    AutoSessionName = True
    Left = 16
    Top = 32
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
      'SCHEMA CACHE DIR=E:\DELPHI\TMP'
      'SCHEMA CACHE SIZE=8'
      'SCHEMA CACHE TIME=-1'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SQLQRYMODE=SERVER'
      'ENABLE SCHEMA CACHE=TRUE'
      'ENABLE BCD=TRUE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=640'
      'BLOB SIZE=320'
      'PASSWORD=nestle')
    SessionName = 'Session1_4'
    Left = 16
    Top = 80
  end
  object Query1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_4'
    Left = 16
    Top = 128
  end
end
