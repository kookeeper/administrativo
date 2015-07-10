object ServerImpr: TServerImpr
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 350
  Top = 182
  Height = 515
  Width = 726
  object Session1: TSession
    AutoSessionName = True
    Left = 24
    Top = 16
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
    Left = 24
    Top = 64
  end
end
