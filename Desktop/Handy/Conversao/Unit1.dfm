object Form1: TForm1
  Left = 38
  Top = 56
  Width = 918
  Height = 527
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 561
    Height = 459
    Align = alLeft
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 565
    Top = 0
    Width = 345
    Height = 459
    Align = alRight
    DataSource = DataSource2
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 459
    Width = 910
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    object Button1: TButton
      Left = 296
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button1'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Database1: TDatabase
    AliasName = 'HD'
    DatabaseName = 'DBConn1'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME='
      'ODBC DSN=HD'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE='
      'LANGDRIVER='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 96
    Top = 24
  end
  object Database2: TDatabase
    AliasName = 'Handy'
    DatabaseName = 'DBConn2'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=sergio'
      'ODBC DSN=Handy'
      'OPEN MODE=READ/WRITE'
      'BATCH COUNT=200'
      'LANGDRIVER='
      'MAX ROWS=-1'
      'SCHEMA CACHE DIR='
      'SCHEMA CACHE SIZE=8'
      'SCHEMA CACHE TIME=-1'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SQLQRYMODE=LOCAL'
      'ENABLE SCHEMA CACHE=TRUE'
      'ENABLE BCD=TRUE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=sergio')
    SessionName = 'Default'
    Left = 216
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 96
    Top = 120
  end
  object DataSource2: TDataSource
    DataSet = Query2
    Left = 216
    Top = 120
  end
  object Query1: TQuery
    DatabaseName = 'DBConn1'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CLIENTES ORDER BY NOME')
    Left = 96
    Top = 72
    object Query1CODIGOCLIE: TStringField
      FieldName = 'CODIGOCLIE'
      Origin = 'DBCONN1.CLIENTES.CODIGOCLIE'
      Size = 3
    end
    object Query1NOME: TStringField
      FieldName = 'NOME'
      Origin = 'DBCONN1.CLIENTES.NOME'
      Size = 57
    end
    object Query1ENDERECO1: TStringField
      FieldName = 'ENDERECO1'
      Origin = 'DBCONN1.CLIENTES.ENDERECO1'
      Size = 67
    end
    object Query1ENDERECO2: TStringField
      FieldName = 'ENDERECO2'
      Origin = 'DBCONN1.CLIENTES.ENDERECO2'
      Size = 76
    end
    object Query1CIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCONN1.CLIENTES.CIDADE'
      Size = 30
    end
    object Query1ESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'DBCONN1.CLIENTES.ESTADO'
      Size = 2
    end
    object Query1PAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'DBCONN1.CLIENTES.PAIS'
      Size = 19
    end
    object Query1CEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCONN1.CLIENTES.CEP'
      Size = 8
    end
    object Query1CGC: TStringField
      FieldName = 'CGC'
      Origin = 'DBCONN1.CLIENTES.CGC'
      Size = 14
    end
    object Query1INSCRICAO: TStringField
      FieldName = 'INSCRICAO'
      Origin = 'DBCONN1.CLIENTES.INSCRICAO'
    end
    object Query1CONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DBCONN1.CLIENTES.CONTATO'
      Size = 67
    end
    object Query1FONE: TStringField
      FieldName = 'FONE'
      Origin = 'DBCONN1.CLIENTES.FONE'
      Size = 67
    end
    object Query1FAX: TStringField
      FieldName = 'FAX'
      Origin = 'DBCONN1.CLIENTES.FAX'
      Size = 67
    end
    object Query1OBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN1.CLIENTES.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object Query1SELECIONAD: TBooleanField
      FieldName = 'SELECIONAD'
      Origin = 'DBCONN1.CLIENTES.SELECIONAD'
    end
  end
  object Query2: TQuery
    DatabaseName = 'DBConn2'
    SQL.Strings = (
      'SELECT * FROM CLIENTES ORDER BY NOME_CLIENTE')
    Left = 216
    Top = 72
    object Query2CLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN2.CLIENTES.CLIENTE_SQ'
    end
    object Query2CODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'DBCONN2.CLIENTES.CODIGO_CLIENTE'
      Size = 15
    end
    object Query2NOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN2.CLIENTES.NOME_CLIENTE'
      Size = 50
    end
    object Query2INSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN2.CLIENTES.INSCR_ESTADUAL'
    end
    object Query2ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DBCONN2.CLIENTES.ENDERECO'
      Size = 50
    end
    object Query2NUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'DBCONN2.CLIENTES.NUMERO'
    end
    object Query2BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'DBCONN2.CLIENTES.BAIRRO'
      Size = 30
    end
    object Query2COMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'DBCONN2.CLIENTES.COMPL_ENDERECO'
      Size = 50
    end
    object Query2CIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCONN2.CLIENTES.CIDADE'
      Size = 30
    end
    object Query2ESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'DBCONN2.CLIENTES.ESTADO'
      Size = 2
    end
    object Query2CEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCONN2.CLIENTES.CEP'
      Size = 8
    end
    object Query2DDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE1'
      Size = 4
    end
    object Query2NUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE1'
      Size = 15
    end
    object Query2COMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE1'
      Size = 10
    end
    object Query2DDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE2'
      Size = 4
    end
    object Query2NUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE2'
      Size = 15
    end
    object Query2COMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE2'
      Size = 10
    end
    object Query2DDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE3'
      Size = 4
    end
    object Query2NUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE3'
      Size = 15
    end
    object Query2COMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE3'
      Size = 10
    end
    object Query2DDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'DBCONN2.CLIENTES.DDD_CELULAR'
      Size = 4
    end
    object Query2NUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'DBCONN2.CLIENTES.NUMERO_CELULAR'
      Size = 15
    end
    object Query2COMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'DBCONN2.CLIENTES.COMPL_CELULAR'
      Size = 10
    end
    object Query2DDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Origin = 'DBCONN2.CLIENTES.DDD_FAX'
      Size = 4
    end
    object Query2NUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FAX'
      Size = 15
    end
    object Query2COMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Origin = 'DBCONN2.CLIENTES.COMPL_FAX'
      Size = 10
    end
    object Query2E_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'DBCONN2.CLIENTES.E_MAIL'
      Size = 100
    end
    object Query2WEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Origin = 'DBCONN2.CLIENTES.WEB_SITE'
      Size = 100
    end
    object Query2CONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DBCONN2.CLIENTES.CONTATO'
      Size = 50
    end
    object Query2PAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'DBCONN2.CLIENTES.PAIS'
    end
    object Query2OBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN2.CLIENTES.OBSERVACAO'
      Size = 1
    end
    object Query2REVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'DBCONN2.CLIENTES.REVENDA'
      Size = 1
    end
    object Query2BIRO: TStringField
      FieldName = 'BIRO'
      Origin = 'DBCONN2.CLIENTES.BIRO'
      Size = 1
    end
    object Query2CAPITAL_ATUAL: TBCDField
      FieldName = 'CAPITAL_ATUAL'
      Origin = 'DBCONN2.CLIENTES.CAPITAL_ATUAL'
      Precision = 9
      Size = 2
    end
    object Query2NOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'DBCONN2.CLIENTES.NOME_FANTASIA'
      Size = 50
    end
    object Query2RAMO_ATIVIDADE_SQ: TIntegerField
      FieldName = 'RAMO_ATIVIDADE_SQ'
      Origin = 'DBCONN2.CLIENTES.RAMO_ATIVIDADE_SQ'
    end
    object Query2FATURAMENTO_MENSAL: TBCDField
      FieldName = 'FATURAMENTO_MENSAL'
      Origin = 'DBCONN2.CLIENTES.FATURAMENTO_MENSAL'
      Precision = 9
      Size = 2
    end
    object Query2DATA_FUNDACAO: TDateTimeField
      FieldName = 'DATA_FUNDACAO'
      Origin = 'DBCONN2.CLIENTES.DATA_FUNDACAO'
    end
    object Query2INSCR_MUNICIPAL: TStringField
      FieldName = 'INSCR_MUNICIPAL'
      Origin = 'DBCONN2.CLIENTES.INSCR_MUNICIPAL'
    end
    object Query2CNPJ_ENTREGA: TStringField
      FieldName = 'CNPJ_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.CNPJ_ENTREGA'
    end
    object Query2INSCR_ESTADUAL_ENTREGA: TStringField
      FieldName = 'INSCR_ESTADUAL_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.INSCR_ESTADUAL_ENTREGA'
    end
    object Query2INSCR_MUNICIPAL_ENTREGA: TStringField
      FieldName = 'INSCR_MUNICIPAL_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.INSCR_MUNICIPAL_ENTREGA'
    end
    object Query2ENDERECO_ENTREGA: TStringField
      FieldName = 'ENDERECO_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.ENDERECO_ENTREGA'
      Size = 50
    end
    object Query2NUMERO_ENTREGA: TStringField
      FieldName = 'NUMERO_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.NUMERO_ENTREGA'
    end
    object Query2BAIRRO_ENTREGA: TStringField
      FieldName = 'BAIRRO_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.BAIRRO_ENTREGA'
      Size = 30
    end
    object Query2COMPL_ENDERECO_ENTREGA: TStringField
      FieldName = 'COMPL_ENDERECO_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.COMPL_ENDERECO_ENTREGA'
      Size = 50
    end
    object Query2CIDADE_ENTREGA: TStringField
      FieldName = 'CIDADE_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.CIDADE_ENTREGA'
      Size = 30
    end
    object Query2ESTADO_ENTREGA: TStringField
      FieldName = 'ESTADO_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.ESTADO_ENTREGA'
      Size = 2
    end
    object Query2CEP_ENTREGA: TStringField
      FieldName = 'CEP_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.CEP_ENTREGA'
      Size = 8
    end
    object Query2DDD_FONE_ENTREGA: TStringField
      FieldName = 'DDD_FONE_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_ENTREGA'
      Size = 4
    end
    object Query2NUMERO_FONE_ENTREGA: TStringField
      FieldName = 'NUMERO_FONE_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_ENTREGA'
      Size = 15
    end
    object Query2COMPL_FONE_ENTREGA: TStringField
      FieldName = 'COMPL_FONE_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_ENTREGA'
      Size = 10
    end
    object Query2E_MAIL_ENTREGA: TStringField
      FieldName = 'E_MAIL_ENTREGA'
      Origin = 'DBCONN2.CLIENTES.E_MAIL_ENTREGA'
      Size = 100
    end
    object Query2CNPJ_COBRANCA: TStringField
      FieldName = 'CNPJ_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.CNPJ_COBRANCA'
    end
    object Query2INSCR_ESTADUAL_COBRANCA: TStringField
      FieldName = 'INSCR_ESTADUAL_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.INSCR_ESTADUAL_COBRANCA'
    end
    object Query2INSCR_MUNICIPAL_COBRANCA: TStringField
      FieldName = 'INSCR_MUNICIPAL_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.INSCR_MUNICIPAL_COBRANCA'
    end
    object Query2ENDERECO_COBRANCA: TStringField
      FieldName = 'ENDERECO_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.ENDERECO_COBRANCA'
      Size = 50
    end
    object Query2NUMERO_COBRANCA: TStringField
      FieldName = 'NUMERO_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.NUMERO_COBRANCA'
    end
    object Query2BAIRRO_COBRANCA: TStringField
      FieldName = 'BAIRRO_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.BAIRRO_COBRANCA'
      Size = 30
    end
    object Query2COMPL_ENDERECO_COBRANCA: TStringField
      FieldName = 'COMPL_ENDERECO_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.COMPL_ENDERECO_COBRANCA'
      Size = 50
    end
    object Query2CIDADE_COBRANCA: TStringField
      FieldName = 'CIDADE_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.CIDADE_COBRANCA'
      Size = 30
    end
    object Query2ESTADO_COBRANCA: TStringField
      FieldName = 'ESTADO_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.ESTADO_COBRANCA'
      Size = 2
    end
    object Query2CEP_COBRANCA: TStringField
      FieldName = 'CEP_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.CEP_COBRANCA'
      Size = 8
    end
    object Query2DDD_FONE_COBRANCA: TStringField
      FieldName = 'DDD_FONE_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_COBRANCA'
      Size = 4
    end
    object Query2NUMERO_FONE_COBRANCA: TStringField
      FieldName = 'NUMERO_FONE_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_COBRANCA'
      Size = 15
    end
    object Query2COMPL_FONE_COBRANCA: TStringField
      FieldName = 'COMPL_FONE_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_COBRANCA'
      Size = 10
    end
    object Query2E_MAIL_COBRANCA: TStringField
      FieldName = 'E_MAIL_COBRANCA'
      Origin = 'DBCONN2.CLIENTES.E_MAIL_COBRANCA'
      Size = 100
    end
    object Query2NOME_PART1: TStringField
      FieldName = 'NOME_PART1'
      Origin = 'DBCONN2.CLIENTES.NOME_PART1'
      Size = 50
    end
    object Query2EMPRESA_PART1: TStringField
      FieldName = 'EMPRESA_PART1'
      Origin = 'DBCONN2.CLIENTES.EMPRESA_PART1'
      Size = 50
    end
    object Query2CNPJ_PART1: TStringField
      FieldName = 'CNPJ_PART1'
      Origin = 'DBCONN2.CLIENTES.CNPJ_PART1'
    end
    object Query2CAPITAL_PART1: TBCDField
      FieldName = 'CAPITAL_PART1'
      Origin = 'DBCONN2.CLIENTES.CAPITAL_PART1'
      Precision = 9
      Size = 2
    end
    object Query2PORCENTAGEM_PART1: TBCDField
      FieldName = 'PORCENTAGEM_PART1'
      Origin = 'DBCONN2.CLIENTES.PORCENTAGEM_PART1'
      Precision = 4
      Size = 2
    end
    object Query2NOME_PART2: TStringField
      FieldName = 'NOME_PART2'
      Origin = 'DBCONN2.CLIENTES.NOME_PART2'
      Size = 50
    end
    object Query2EMPRESA_PART2: TStringField
      FieldName = 'EMPRESA_PART2'
      Origin = 'DBCONN2.CLIENTES.EMPRESA_PART2'
      Size = 50
    end
    object Query2CNPJ_PART2: TStringField
      FieldName = 'CNPJ_PART2'
      Origin = 'DBCONN2.CLIENTES.CNPJ_PART2'
    end
    object Query2CAPITAL_PART2: TBCDField
      FieldName = 'CAPITAL_PART2'
      Origin = 'DBCONN2.CLIENTES.CAPITAL_PART2'
      Precision = 9
      Size = 2
    end
    object Query2PORCENTAGEM_PART2: TBCDField
      FieldName = 'PORCENTAGEM_PART2'
      Origin = 'DBCONN2.CLIENTES.PORCENTAGEM_PART2'
      Precision = 4
      Size = 2
    end
    object Query2NOME_PART3: TStringField
      FieldName = 'NOME_PART3'
      Origin = 'DBCONN2.CLIENTES.NOME_PART3'
      Size = 50
    end
    object Query2EMPRESA_PART3: TStringField
      FieldName = 'EMPRESA_PART3'
      Origin = 'DBCONN2.CLIENTES.EMPRESA_PART3'
      Size = 50
    end
    object Query2CNPJ_PART3: TStringField
      FieldName = 'CNPJ_PART3'
      Origin = 'DBCONN2.CLIENTES.CNPJ_PART3'
    end
    object Query2CAPITAL_PART3: TBCDField
      FieldName = 'CAPITAL_PART3'
      Origin = 'DBCONN2.CLIENTES.CAPITAL_PART3'
      Precision = 9
      Size = 2
    end
    object Query2PORCENTAGEM_PART3: TBCDField
      FieldName = 'PORCENTAGEM_PART3'
      Origin = 'DBCONN2.CLIENTES.PORCENTAGEM_PART3'
      Precision = 4
      Size = 2
    end
    object Query2BANCO1: TStringField
      FieldName = 'BANCO1'
      Origin = 'DBCONN2.CLIENTES.BANCO1'
      Size = 10
    end
    object Query2AGENCIA1: TStringField
      FieldName = 'AGENCIA1'
      Origin = 'DBCONN2.CLIENTES.AGENCIA1'
      Size = 10
    end
    object Query2CC1: TStringField
      FieldName = 'CC1'
      Origin = 'DBCONN2.CLIENTES.CC1'
      Size = 10
    end
    object Query2DDD_FONE_BCO1: TStringField
      FieldName = 'DDD_FONE_BCO1'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_BCO1'
      Size = 4
    end
    object Query2NUMERO_FONE_BCO1: TStringField
      FieldName = 'NUMERO_FONE_BCO1'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_BCO1'
      Size = 15
    end
    object Query2COMPL_FONE_BCO1: TStringField
      FieldName = 'COMPL_FONE_BCO1'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_BCO1'
      Size = 10
    end
    object Query2CONTATO_BCO1: TStringField
      FieldName = 'CONTATO_BCO1'
      Origin = 'DBCONN2.CLIENTES.CONTATO_BCO1'
      Size = 50
    end
    object Query2BANCO2: TStringField
      FieldName = 'BANCO2'
      Origin = 'DBCONN2.CLIENTES.BANCO2'
      Size = 10
    end
    object Query2AGENCIA2: TStringField
      FieldName = 'AGENCIA2'
      Origin = 'DBCONN2.CLIENTES.AGENCIA2'
      Size = 10
    end
    object Query2CC2: TStringField
      FieldName = 'CC2'
      Origin = 'DBCONN2.CLIENTES.CC2'
      Size = 10
    end
    object Query2DDD_FONE_BCO2: TStringField
      FieldName = 'DDD_FONE_BCO2'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_BCO2'
      Size = 4
    end
    object Query2NUMERO_FONE_BCO2: TStringField
      FieldName = 'NUMERO_FONE_BCO2'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_BCO2'
      Size = 15
    end
    object Query2COMPL_FONE_BCO2: TStringField
      FieldName = 'COMPL_FONE_BCO2'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_BCO2'
      Size = 10
    end
    object Query2CONTATO_BCO2: TStringField
      FieldName = 'CONTATO_BCO2'
      Origin = 'DBCONN2.CLIENTES.CONTATO_BCO2'
      Size = 50
    end
    object Query2BANCO3: TStringField
      FieldName = 'BANCO3'
      Origin = 'DBCONN2.CLIENTES.BANCO3'
      Size = 10
    end
    object Query2AGENCIA3: TStringField
      FieldName = 'AGENCIA3'
      Origin = 'DBCONN2.CLIENTES.AGENCIA3'
      Size = 10
    end
    object Query2CC3: TStringField
      FieldName = 'CC3'
      Origin = 'DBCONN2.CLIENTES.CC3'
      Size = 10
    end
    object Query2DDD_FONE_BCO3: TStringField
      FieldName = 'DDD_FONE_BCO3'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_BCO3'
      Size = 4
    end
    object Query2NUMERO_FONE_BCO3: TStringField
      FieldName = 'NUMERO_FONE_BCO3'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_BCO3'
      Size = 15
    end
    object Query2COMPL_FONE_BCO3: TStringField
      FieldName = 'COMPL_FONE_BCO3'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_BCO3'
      Size = 10
    end
    object Query2CONTATO_BCO3: TStringField
      FieldName = 'CONTATO_BCO3'
      Origin = 'DBCONN2.CLIENTES.CONTATO_BCO3'
      Size = 50
    end
    object Query2NOME_REF_COM1: TStringField
      FieldName = 'NOME_REF_COM1'
      Origin = 'DBCONN2.CLIENTES.NOME_REF_COM1'
      Size = 50
    end
    object Query2DDD_FONE_REF_COM1: TStringField
      FieldName = 'DDD_FONE_REF_COM1'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_REF_COM1'
      Size = 4
    end
    object Query2NUMERO_FONE_REF_COM1: TStringField
      FieldName = 'NUMERO_FONE_REF_COM1'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_REF_COM1'
      Size = 15
    end
    object Query2COMPL_FONE_REF_COM1: TStringField
      FieldName = 'COMPL_FONE_REF_COM1'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_REF_COM1'
      Size = 10
    end
    object Query2CONTATO_REF_COM1: TStringField
      FieldName = 'CONTATO_REF_COM1'
      Origin = 'DBCONN2.CLIENTES.CONTATO_REF_COM1'
      Size = 50
    end
    object Query2NOME_REF_COM2: TStringField
      FieldName = 'NOME_REF_COM2'
      Origin = 'DBCONN2.CLIENTES.NOME_REF_COM2'
      Size = 50
    end
    object Query2DDD_FONE_REF_COM2: TStringField
      FieldName = 'DDD_FONE_REF_COM2'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_REF_COM2'
      Size = 4
    end
    object Query2NUMERO_FONE_REF_COM2: TStringField
      FieldName = 'NUMERO_FONE_REF_COM2'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_REF_COM2'
      Size = 15
    end
    object Query2COMPL_FONE_REF_COM2: TStringField
      FieldName = 'COMPL_FONE_REF_COM2'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_REF_COM2'
      Size = 10
    end
    object Query2CONTATO_REF_COM2: TStringField
      FieldName = 'CONTATO_REF_COM2'
      Origin = 'DBCONN2.CLIENTES.CONTATO_REF_COM2'
      Size = 50
    end
    object Query2NOME_REF_COM3: TStringField
      FieldName = 'NOME_REF_COM3'
      Origin = 'DBCONN2.CLIENTES.NOME_REF_COM3'
      Size = 50
    end
    object Query2DDD_FONE_REF_COM3: TStringField
      FieldName = 'DDD_FONE_REF_COM3'
      Origin = 'DBCONN2.CLIENTES.DDD_FONE_REF_COM3'
      Size = 4
    end
    object Query2NUMERO_FONE_REF_COM3: TStringField
      FieldName = 'NUMERO_FONE_REF_COM3'
      Origin = 'DBCONN2.CLIENTES.NUMERO_FONE_REF_COM3'
      Size = 15
    end
    object Query2COMPL_FONE_REF_COM3: TStringField
      FieldName = 'COMPL_FONE_REF_COM3'
      Origin = 'DBCONN2.CLIENTES.COMPL_FONE_REF_COM3'
      Size = 10
    end
    object Query2CONTATO_REF_COM3: TStringField
      FieldName = 'CONTATO_REF_COM3'
      Origin = 'DBCONN2.CLIENTES.CONTATO_REF_COM3'
      Size = 50
    end
    object Query2DATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DBCONN2.CLIENTES.DATA_CADASTRO'
    end
    object Query2DATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      Origin = 'DBCONN2.CLIENTES.DATA_ALT'
    end
    object Query2USUARIO_SQ_ALT: TIntegerField
      FieldName = 'USUARIO_SQ_ALT'
      Origin = 'DBCONN2.CLIENTES.USUARIO_SQ_ALT'
    end
    object Query2TRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN2.CLIENTES.TRANSPORTADORA_SQ'
    end
  end
end
