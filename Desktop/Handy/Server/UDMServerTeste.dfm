object ServerTeste: TServerTeste
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 420
  Top = 114
  Height = 670
  Width = 672
  object Msg: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 48
    Top = 176
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atLogin
    Left = 48
    Top = 128
  end
  object DBConn: TDatabase
    AliasName = 'HD_Teste'
    DatabaseName = 'DBConn'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=avision'
      'ODBC DSN=HD_Teste'
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
      'PASSWORD=avision')
    SessionName = 'Session1_1'
    Left = 48
    Top = 72
  end
  object Session1: TSession
    Active = True
    AutoSessionName = True
    Left = 48
    Top = 24
  end
  object qrVerIndice: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    Left = 104
    Top = 24
  end
  object Query1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    Left = 104
    Top = 72
  end
  object dspLista: TDataSetProvider
    DataSet = qrLista
    Options = [poReadOnly]
    Left = 96
    Top = 280
  end
  object dspCep: TDataSetProvider
    DataSet = qrCep
    Left = 96
    Top = 472
  end
  object dspBuscaProdutos: TDataSetProvider
    DataSet = qrBuscaProdutos
    Options = [poReadOnly]
    Left = 96
    Top = 328
  end
  object dspBuscaClientes: TDataSetProvider
    DataSet = qrBuscaClientes
    Options = [poReadOnly]
    Left = 95
    Top = 376
  end
  object qrLista: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    Left = 40
    Top = 280
  end
  object qrBuscaProdutos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT * FROM produtos')
    Left = 40
    Top = 328
  end
  object qrBuscaClientes: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT * FROM clientes')
    Left = 40
    Top = 376
  end
  object DBCep: TDatabase
    AliasName = 'CEP'
    DatabaseName = 'DBCep'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=root'
      'ODBC DSN=CEP'
      'OPEN MODE=READ/WRITE'
      'BATCH COUNT=200'
      'LANGDRIVER='
      'MAX ROWS=-1'
      'SCHEMA CACHE DIR='
      'SCHEMA CACHE SIZE=8'
      'SCHEMA CACHE TIME=-1'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SQLQRYMODE=SERVER'
      'ENABLE SCHEMA CACHE=FALSE'
      'ENABLE BCD=TRUE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'BLOB SIZE=32'
      'PASSWORD=nestle')
    SessionName = 'Session1_1'
    Left = 40
    Top = 424
  end
  object qrCep: TQuery
    DatabaseName = 'DBCep'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT *'
      'FROM enderecos'
      'WHERE CEP = :CEP')
    Left = 40
    Top = 472
    ParamData = <
      item
        DataType = ftString
        Name = 'CEP'
        ParamType = ptUnknown
      end>
    object qrCepCEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCEP.enderecos.CEP'
      Size = 8
    end
    object qrCepLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'DBCEP.enderecos.LOGRADOURO'
      Size = 242
    end
    object qrCepBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'DBCEP.enderecos.BAIRRO'
      Size = 72
    end
    object qrCepCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCEP.enderecos.CIDADE'
      Size = 60
    end
    object qrCepUF: TStringField
      FieldName = 'UF'
      Origin = 'DBCEP.enderecos.UF'
      Size = 2
    end
  end
  object dspImprPed: TDataSetProvider
    DataSet = qrImprPed
    Left = 240
    Top = 24
  end
  object dspImprNfDups: TDataSetProvider
    DataSet = qrImprNfDups
    Left = 240
    Top = 216
  end
  object dspImprNfItem: TDataSetProvider
    DataSet = qrImprNfItem
    Left = 240
    Top = 168
  end
  object dspImprNf: TDataSetProvider
    DataSet = qrImprNf
    Left = 240
    Top = 120
  end
  object dspImprPedItem: TDataSetProvider
    DataSet = qrImprPedItem
    Left = 240
    Top = 72
  end
  object dspImprEst: TDataSetProvider
    DataSet = qrImprEst
    Left = 240
    Top = 360
  end
  object dspImprHistClientes1: TDataSetProvider
    DataSet = qrImprHistClientes1
    Left = 240
    Top = 408
  end
  object dspImprHistClientes2: TDataSetProvider
    DataSet = qrImprHistClientes2
    Left = 240
    Top = 456
  end
  object dspImprHistClientes3: TDataSetProvider
    DataSet = qrImprHistClientes3
    Left = 400
    Top = 24
  end
  object dspImprClientesUF: TDataSetProvider
    DataSet = qrImprClientesUF
    Left = 400
    Top = 72
  end
  object dspImprDemPrev: TDataSetProvider
    DataSet = qrImprDemPrev
    Left = 400
    Top = 216
  end
  object dspImprNfVend: TDataSetProvider
    DataSet = qrImprNfVend
    Left = 240
    Top = 264
  end
  object dspImprNfSerie: TDataSetProvider
    DataSet = qrImprNfSerie
    Left = 400
    Top = 264
  end
  object qrImprPed: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT PEDIDO_SQ, DDD_FONE1, NUMERO_FONE1, COMPL_FONE1, DDD_CELU' +
        'LAR,'
      
        'NUMERO_CELULAR, COMPL_CELULAR, ENDERECO, NUMERO, COMPL_ENDERECO,' +
        ' DDD_FONE2,'
      
        'NUMERO_FONE2, COMPL_FONE2, DDD_FONE3, NUMERO_FONE3, COMPL_FONE3,' +
        ' DDD_FAX,'
      
        'NUMERO_FAX, COMPL_FAX, CODIGO_CLIENTE, NOME_CLIENTE, CONTATO, C.' +
        'INSCR_ESTADUAL,'
      
        'BAIRRO, CIDADE, ESTADO, PAIS, CEP, NOME_VENDEDOR, CODIGO_VENDEDO' +
        'R, TIPO_NFISCAL,'
      
        'DESCRICAO_NATUREZA, CFO, CODIGO_TRANSPORTADORA, NOME_TRANSPORTAD' +
        'ORA,'
      
        'N.OBSERVACAO AS OBSERVACAO_NAT, VLR_FRETE, VLR_SEGURO, FRETE_TRA' +
        'NSP,'
      
        'DIAS_DEMONSTRACAO, DATA_PEDIDO, NUMERO_PEDIDO, COTACAO_DOLAR, OB' +
        'SERVACAO_PED,'
      
        'OBSERVACAO_NF, VLR_PRODUTOS, VLR_IPI, VLR_ICMS, D00, D01, D02, D' +
        '03, D04, D05,'
      
        'D06, D07, D08, D09, P00, P01, P02, P03, P04, P05, P06, P07, P08,' +
        ' P09, PARCELAS,'
      'DESCRICAO_COND_PAGTO'
      'FROM pedidos P'
      
        'LEFT OUTER JOIN clientes                     C ON (C.CLIENTE_SQ ' +
        '= P.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN cond_pagto           CP ON (CP.COND_PAGTO_SQ = P' +
        '.COND_PAGTO_SQ)'
      
        'LEFT OUTER JOIN naturezas                N ON (N.NATUREZA_SQ = P' +
        '.NATUREZA_SQ)'
      
        'LEFT OUTER JOIN transportadoras T ON (T.TRANSPORTADORA_SQ = P.TR' +
        'ANSPORTADORA_SQ)'
      
        'LEFT OUTER JOIN vendedores             V ON (V.VENDEDOR_SQ = P.V' +
        'ENDEDOR_SQ)'
      'WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO')
    Left = 184
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_PEDIDO'
        ParamType = ptUnknown
      end>
    object qrImprPedPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object qrImprPedDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object qrImprPedNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object qrImprPedCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object qrImprPedDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object qrImprPedNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object qrImprPedCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object qrImprPedENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qrImprPedNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qrImprPedCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object qrImprPedDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object qrImprPedNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object qrImprPedCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object qrImprPedDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object qrImprPedNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object qrImprPedCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object qrImprPedDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object qrImprPedNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object qrImprPedCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object qrImprPedCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object qrImprPedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprPedCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qrImprPedINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object qrImprPedBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrImprPedCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qrImprPedESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qrImprPedPAIS: TStringField
      FieldName = 'PAIS'
    end
    object qrImprPedCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrImprPedNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 100
    end
    object qrImprPedCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
    end
    object qrImprPedTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
    end
    object qrImprPedDESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Size = 50
    end
    object qrImprPedCFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object qrImprPedCODIGO_TRANSPORTADORA: TStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object qrImprPedNOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object qrImprPedOBSERVACAO_NAT: TMemoField
      FieldName = 'OBSERVACAO_NAT'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprPedVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object qrImprPedVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object qrImprPedFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object qrImprPedDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object qrImprPedDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
    end
    object qrImprPedNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object qrImprPedCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object qrImprPedOBSERVACAO_PED: TMemoField
      FieldName = 'OBSERVACAO_PED'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprPedOBSERVACAO_NF: TMemoField
      FieldName = 'OBSERVACAO_NF'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprPedVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrImprPedVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrImprPedVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprPedD00: TIntegerField
      FieldName = 'D00'
    end
    object qrImprPedD01: TIntegerField
      FieldName = 'D01'
    end
    object qrImprPedD02: TIntegerField
      FieldName = 'D02'
    end
    object qrImprPedD03: TIntegerField
      FieldName = 'D03'
    end
    object qrImprPedD04: TIntegerField
      FieldName = 'D04'
    end
    object qrImprPedD05: TIntegerField
      FieldName = 'D05'
    end
    object qrImprPedD06: TIntegerField
      FieldName = 'D06'
    end
    object qrImprPedD07: TIntegerField
      FieldName = 'D07'
    end
    object qrImprPedD08: TIntegerField
      FieldName = 'D08'
    end
    object qrImprPedD09: TIntegerField
      FieldName = 'D09'
    end
    object qrImprPedP00: TIntegerField
      FieldName = 'P00'
    end
    object qrImprPedP01: TIntegerField
      FieldName = 'P01'
    end
    object qrImprPedP02: TIntegerField
      FieldName = 'P02'
    end
    object qrImprPedP03: TIntegerField
      FieldName = 'P03'
    end
    object qrImprPedP04: TIntegerField
      FieldName = 'P04'
    end
    object qrImprPedP05: TIntegerField
      FieldName = 'P05'
    end
    object qrImprPedP06: TIntegerField
      FieldName = 'P06'
    end
    object qrImprPedP07: TIntegerField
      FieldName = 'P07'
    end
    object qrImprPedP08: TIntegerField
      FieldName = 'P08'
    end
    object qrImprPedP09: TIntegerField
      FieldName = 'P09'
    end
    object qrImprPedDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object qrImprPedPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
  end
  object qrImprPedItem: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT NR_SERIE_ITEM, CODIGO_PRODUTO, DESCRICAO_PRODUTO, QTDE_PE' +
        'DIDO_ITEM,'
      
        'CODIGO_NBM, PI.PRECO_UNIT, VLR_DESC, VLR_IPI_ITEM, ALIQ_ICMS_ITE' +
        'M,'
      'ALIQ_IPI_ITEM, VLR_TOTAL_ITEM'
      'FROM pedidos_itens PI'
      'LEFT OUTER JOIN produtos PR ON (PR.PRODUTO_SQ = PI.PRODUTO_SQ)'
      'LEFT OUTER JOIN nbm N ON (N.NBM_SQ = PR.NBM_SQ)'
      'LEFT OUTER JOIN modelos M ON (M.MODELO_SQ = PR.MODELO_SQ)'
      'WHERE PEDIDO_SQ = :PEDIDO_SQ')
    Left = 184
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
      end>
    object qrImprPedItemNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprPedItemCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object qrImprPedItemDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 50
    end
    object qrImprPedItemQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
    end
    object qrImprPedItemCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object qrImprPedItemPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object qrImprPedItemVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object qrImprPedItemVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprPedItemALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object qrImprPedItemALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object qrImprPedItemVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
  end
  object qrImprNfItem: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT NFI.PRODUTO_SQ, CODIGO_PRODUTO, DESCRICAO_PRODUTO, CLASS_' +
        'FISCAL,'
      'VLR_TOTAL_ITEM, VLR_UNIT_ITEM, qtde_item,'
      
        'UN_PRODUTO, STRIBUT, VLR_IPI_ITEM, ALIQ_IPI_ITEM, ALIQ_ICMS_ITEM' +
        ', NR_SERIE_ITEM,'
      
        'BASE_ICMS_SUBST_ITEM, VLR_ICMS_SUBST_ITEM, ITEM, VLR_ICMS_ITEM, ' +
        'NFI.ORIGEM_MERCADORIA'
      'FROM nfiscais_itens NFI'
      'LEFT OUTER JOIN produtos PR ON (PR.PRODUTO_SQ = NFI.PRODUTO_SQ)'
      'LEFT OUTER JOIN nbm N ON (N.NBM_SQ = PR.NBM_SQ)'
      'LEFT OUTER JOIN modelos M ON (M.MODELO_SQ = PR.MODELO_SQ)'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ')
    Left = 184
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    object qrImprNfItemPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object qrImprNfItemCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object qrImprNfItemDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 50
    end
    object qrImprNfItemCLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object qrImprNfItemVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprNfItemVLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprNfItemqtde_item: TIntegerField
      FieldName = 'qtde_item'
    end
    object qrImprNfItemUN_PRODUTO: TStringField
      FieldName = 'UN_PRODUTO'
      Size = 2
    end
    object qrImprNfItemSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object qrImprNfItemVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprNfItemALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object qrImprNfItemALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object qrImprNfItemNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprNfItemBASE_ICMS_SUBST_ITEM: TBCDField
      FieldName = 'BASE_ICMS_SUBST_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprNfItemVLR_ICMS_SUBST_ITEM: TBCDField
      FieldName = 'VLR_ICMS_SUBST_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprNfItemITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object qrImprNfItemVLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprNfItemORIGEM_MERCADORIA: TIntegerField
      FieldName = 'ORIGEM_MERCADORIA'
    end
  end
  object qrImprNf: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT NF.NFISCAL_SQ, NF.CLIENTE_SQ, NOME_CLIENTE, CODIGO_CLIENT' +
        'E, C.INSCR_ESTADUAL, ENDERECO,'
      
        'COMPL_ENDERECO, NUMERO, ENT_SAI, BAIRRO, CIDADE, ESTADO, CEP, DT' +
        'EMISSAO_NFISCAL,'
      
        'DTSAIDA_NFISCAL, DESCRICAO_NATUREZA_NFISCAL, CFO, CFO_SUBST, MEN' +
        'SAGEM, NF.BASE_ICMS,'
      
        'NF.COTACAO_DOLAR, NF.VLR_FRETE, NF.VLR_ICMS, NF.BASE_ICMS_SUBST,' +
        ' NF.VLR_SEGURO,'
      
        'NF.VLR_DESP_ACESS, NF.VLR_ICMS_SUBST, NF.VLR_TOTAL, NF.VLR_PRODU' +
        'TOS, NF.VLR_IPI, NF.VLR_II,'
      
        'NOME_TRANSPORTADORA, ENDERECO_TRANSPORTADORA, T.INSCR_ESTADUAL a' +
        's INSCR_ESTADUAL_TRANSP,'
      
        'QTDE_TRANSP, ESTADO_TRANSPORTADORA, MUNICIPIO_TRANSPORTADORA, PL' +
        'IQUIDO_TRANSP,'
      'PBRUTO_TRANSP, NUMERO_TRANSP,  MARCA_TRANSP, ESPECIE_TRANSP,'
      
        'CODIGO_TRANSPORTADORA, UF_PLACA_TRANSP,  PLACA_TRANSP, NF.FRETE_' +
        'TRANSP,'
      
        'CLASS_FISCAL1, CLASS_FISCAL2,  CLASS_FISCAL3,  CLASS_FISCAL4,  C' +
        'LASS_FISCAL5,'
      
        'CLASS_FISCAL6, CLASS_FISCAL7,  DDD_FONE1,  NUMERO_FONE1,  COMPL_' +
        'FONE1,'
      
        'NUMERO_NFISCAL, PARCELAS, CP.COND_PAGTO_SQ, NF.NATUREZA_SQ, NF.D' +
        'IAS_DEMONSTRACAO,'
      
        'P.NUMERO_PEDIDO, CLASS_FISCAL8, CLASS_FISCAL9, CLASS_FISCAL10, C' +
        'LASS_FISCAL11, CLASS_FISCAL12,'
      
        'CLASS_FISCAL13, CLASS_FISCAL14, CLASS_FISCAL15, CLASS_FISCAL16, ' +
        'CLASS_FISCAL17, CLASS_FISCAL18,'
      
        'CLASS_FISCAL19, CLASS_FISCAL20, CLASS_FISCAL21, CLASS_FISCAL22, ' +
        'CLASS_FISCAL23, CLASS_FISCAL24,'
      
        'INF_ADICIONAL, CANCELADA, NF.NUMERO_NFE, NF.NFISCAL_SQ_REFERENCI' +
        'A, RECIBO_NFE, uf_embarque, local_embarque '
      'FROM nfiscais NF'
      
        'LEFT OUTER JOIN clientes        C  ON (C.CLIENTE_SQ        = NF.' +
        'CLIENTE_SQ)'
      
        'LEFT OUTER JOIN cond_pagto      CP ON (CP.COND_PAGTO_SQ    = NF.' +
        'COND_PAGTO_SQ)'
      
        'LEFT OUTER JOIN naturezas       N  ON (N.NATUREZA_SQ       = NF.' +
        'NATUREZA_SQ)'
      
        'LEFT OUTER JOIN transportadoras T  ON (T.TRANSPORTADORA_SQ = NF.' +
        'TRANSPORTADORA_SQ)'
      
        'LEFT OUTER JOIN vendedores      V  ON (V.VENDEDOR_SQ       = NF.' +
        'VENDEDOR_SQ)'
      
        'LEFT OUTER JOIN pedidos         P  ON (P.PEDIDO_SQ         = NF.' +
        'PEDIDO_SQ)'
      
        'LEFT OUTER JOIN nbm             N1 ON (N1.NBM_SQ           = NF.' +
        'CLASS_FISCAL1)'
      
        'LEFT OUTER JOIN nbm             N2 ON (N2.NBM_SQ           = NF.' +
        'CLASS_FISCAL2)'
      
        'LEFT OUTER JOIN nbm             N3 ON (N3.NBM_SQ           = NF.' +
        'CLASS_FISCAL3)'
      
        'LEFT OUTER JOIN nbm             N4 ON (N4.NBM_SQ           = NF.' +
        'CLASS_FISCAL4)'
      
        'LEFT OUTER JOIN nbm             N5 ON (N5.NBM_SQ           = NF.' +
        'CLASS_FISCAL5)'
      
        'LEFT OUTER JOIN nbm             N6 ON (N6.NBM_SQ           = NF.' +
        'CLASS_FISCAL6)'
      
        'LEFT OUTER JOIN nbm             N7 ON (N7.NBM_SQ           = NF.' +
        'CLASS_FISCAL7)'
      'WHERE NUMERO_NFISCAL = :NUMERO_NFISCAL')
    Left = 184
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_NFISCAL'
        ParamType = ptUnknown
      end>
    object qrImprNfNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object qrImprNfCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object qrImprNfNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprNfCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object qrImprNfINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object qrImprNfENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qrImprNfCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object qrImprNfNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qrImprNfENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Size = 1
    end
    object qrImprNfBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrImprNfCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qrImprNfESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qrImprNfCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrImprNfDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
    end
    object qrImprNfDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
    end
    object qrImprNfDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object qrImprNfCFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object qrImprNfCFO_SUBST: TStringField
      FieldName = 'CFO_SUBST'
      Size = 4
    end
    object qrImprNfMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprNfBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprNfBASE_ICMS_SUBST: TBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_DESP_ACESS: TBCDField
      FieldName = 'VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_ICMS_SUBST: TBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrImprNfVLR_II: TBCDField
      FieldName = 'VLR_II'
      Precision = 9
      Size = 2
    end
    object qrImprNfNOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object qrImprNfENDERECO_TRANSPORTADORA: TStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object qrImprNfINSCR_ESTADUAL_TRANSP: TStringField
      FieldName = 'INSCR_ESTADUAL_TRANSP'
    end
    object qrImprNfQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
    end
    object qrImprNfESTADO_TRANSPORTADORA: TStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object qrImprNfMUNICIPIO_TRANSPORTADORA: TStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object qrImprNfPLIQUIDO_TRANSP: TStringField
      FieldName = 'PLIQUIDO_TRANSP'
    end
    object qrImprNfPBRUTO_TRANSP: TStringField
      FieldName = 'PBRUTO_TRANSP'
    end
    object qrImprNfNUMERO_TRANSP: TStringField
      FieldName = 'NUMERO_TRANSP'
      Size = 10
    end
    object qrImprNfMARCA_TRANSP: TStringField
      FieldName = 'MARCA_TRANSP'
      Size = 30
    end
    object qrImprNfESPECIE_TRANSP: TStringField
      FieldName = 'ESPECIE_TRANSP'
    end
    object qrImprNfCODIGO_TRANSPORTADORA: TStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object qrImprNfUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Size = 2
    end
    object qrImprNfPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Size = 7
    end
    object qrImprNfFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object qrImprNfCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
    end
    object qrImprNfCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
    end
    object qrImprNfCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
    end
    object qrImprNfCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
    end
    object qrImprNfCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
    end
    object qrImprNfCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
    end
    object qrImprNfCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
    end
    object qrImprNfDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object qrImprNfNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object qrImprNfCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object qrImprNfNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object qrImprNfPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object qrImprNfCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object qrImprNfNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
    end
    object qrImprNfDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object qrImprNfCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object qrImprNfNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object qrImprNfCLASS_FISCAL8: TIntegerField
      FieldName = 'CLASS_FISCAL8'
    end
    object qrImprNfCLASS_FISCAL9: TIntegerField
      FieldName = 'CLASS_FISCAL9'
    end
    object qrImprNfCLASS_FISCAL10: TIntegerField
      FieldName = 'CLASS_FISCAL10'
    end
    object qrImprNfCLASS_FISCAL11: TIntegerField
      FieldName = 'CLASS_FISCAL11'
    end
    object qrImprNfCLASS_FISCAL12: TIntegerField
      FieldName = 'CLASS_FISCAL12'
    end
    object qrImprNfCLASS_FISCAL13: TIntegerField
      FieldName = 'CLASS_FISCAL13'
    end
    object qrImprNfCLASS_FISCAL14: TIntegerField
      FieldName = 'CLASS_FISCAL14'
    end
    object qrImprNfCLASS_FISCAL15: TIntegerField
      FieldName = 'CLASS_FISCAL15'
    end
    object qrImprNfCLASS_FISCAL16: TIntegerField
      FieldName = 'CLASS_FISCAL16'
    end
    object qrImprNfCLASS_FISCAL17: TIntegerField
      FieldName = 'CLASS_FISCAL17'
    end
    object qrImprNfCLASS_FISCAL18: TIntegerField
      FieldName = 'CLASS_FISCAL18'
    end
    object qrImprNfCLASS_FISCAL19: TIntegerField
      FieldName = 'CLASS_FISCAL19'
    end
    object qrImprNfCLASS_FISCAL20: TIntegerField
      FieldName = 'CLASS_FISCAL20'
    end
    object qrImprNfCLASS_FISCAL21: TIntegerField
      FieldName = 'CLASS_FISCAL21'
    end
    object qrImprNfCLASS_FISCAL22: TIntegerField
      FieldName = 'CLASS_FISCAL22'
    end
    object qrImprNfCLASS_FISCAL23: TIntegerField
      FieldName = 'CLASS_FISCAL23'
    end
    object qrImprNfCLASS_FISCAL24: TIntegerField
      FieldName = 'CLASS_FISCAL24'
    end
    object qrImprNfINF_ADICIONAL: TStringField
      FieldName = 'INF_ADICIONAL'
      Size = 100
    end
    object qrImprNfCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object qrImprNfNUMERO_NFE: TIntegerField
      FieldName = 'NUMERO_NFE'
    end
    object qrImprNfNFISCAL_SQ_REFERENCIA: TIntegerField
      FieldName = 'NFISCAL_SQ_REFERENCIA'
    end
    object qrImprNfRECIBO_NFE: TStringField
      FieldName = 'RECIBO_NFE'
      Size = 15
    end
    object qrImprNfuf_embarque: TStringField
      FieldName = 'uf_embarque'
      Size = 2
    end
    object qrImprNflocal_embarque: TStringField
      FieldName = 'local_embarque'
      Size = 60
    end
  end
  object qrImprNfVend: TQuery
    BeforeOpen = qrImprNfVendBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'select n.nfiscal_sq, n.numero_nfiscal, n.numero_nfe, n.dtemissao' +
        '_nfiscal, n.vlr_total,'
      
        'd1.numero_duplicata as dup1, d1.item_duplicata as it1, d1.valor_' +
        'duplicata as vlr1, d1.dtvencto_duplicata as vct1,'
      
        'd2.numero_duplicata as dup2, d2.item_duplicata as it2, d2.valor_' +
        'duplicata as vlr2, d2.dtvencto_duplicata as vct2,'
      
        'd3.numero_duplicata as dup3, d3.item_duplicata as it3, d3.valor_' +
        'duplicata as vlr3, d3.dtvencto_duplicata as vct3,'
      
        'd4.numero_duplicata as dup4, d4.item_duplicata as it4, d4.valor_' +
        'duplicata as vlr4, d4.dtvencto_duplicata as vct4,'
      
        'd5.numero_duplicata as dup5, d5.item_duplicata as it5, d5.valor_' +
        'duplicata as vlr5, d5.dtvencto_duplicata as vct5,'
      'n.linha_sq, v.*, codigo_cliente, nome_cliente'
      'from nfiscais n'
      'left outer join naturezas na on (na.natureza_sq = n.natureza_sq)'
      
        'left outer join duplicatas d1 on (d1.nfiscal_sq = n.nfiscal_sq a' +
        'nd d1.item_duplicata = 1)'
      
        'left outer join duplicatas d2 on (d2.nfiscal_sq = n.nfiscal_sq a' +
        'nd d2.item_duplicata = 2)'
      
        'left outer join duplicatas d3 on (d3.nfiscal_sq = n.nfiscal_sq a' +
        'nd d3.item_duplicata = 3)'
      
        'left outer join duplicatas d4 on (d4.nfiscal_sq = n.nfiscal_sq a' +
        'nd d4.item_duplicata = 4)'
      
        'left outer join duplicatas d5 on (d5.nfiscal_sq = n.nfiscal_sq a' +
        'nd d5.item_duplicata = 5)'
      'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq)'
      'left outer join clientes c on (c.cliente_sq = n.cliente_sq)'
      
        'inner join (select nfiscal_sq, count(*) itens from nfiscais_iten' +
        's ni'
      
        '  where (:produto_sq is null or ni.produto_sq = :produto_sq) gro' +
        'up by nfiscal_sq) it on (it.nfiscal_sq=n.nfiscal_sq and it.itens' +
        ' > 0)'
      'where na.tipo_nfiscal = 0'
      'and n.cancelada <> '#39'S'#39
      'and n.dtemissao_nfiscal >= :dt_inicio'
      'and n.dtemissao_nfiscal <= :dt_termino'
      'order by numero_nfiscal')
    Left = 184
    Top = 264
    ParamData = <
      item
        DataType = ftInteger
        Name = 'produto_sq'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'produto_sq'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
      end>
    object qrImprNfVendnfiscal_sq: TIntegerField
      FieldName = 'nfiscal_sq'
    end
    object qrImprNfVendnumero_nfiscal: TIntegerField
      FieldName = 'numero_nfiscal'
    end
    object qrImprNfVenddtemissao_nfiscal: TDateTimeField
      FieldName = 'dtemissao_nfiscal'
    end
    object qrImprNfVendvlr_total: TBCDField
      FieldName = 'vlr_total'
      Precision = 9
      Size = 2
    end
    object qrImprNfVenddup1: TIntegerField
      FieldName = 'dup1'
    end
    object qrImprNfVendit1: TIntegerField
      FieldName = 'it1'
    end
    object qrImprNfVendvlr1: TBCDField
      FieldName = 'vlr1'
      Precision = 9
      Size = 2
    end
    object qrImprNfVendvct1: TDateTimeField
      FieldName = 'vct1'
    end
    object qrImprNfVenddup2: TIntegerField
      FieldName = 'dup2'
    end
    object qrImprNfVendit2: TIntegerField
      FieldName = 'it2'
    end
    object qrImprNfVendvlr2: TBCDField
      FieldName = 'vlr2'
      Precision = 9
      Size = 2
    end
    object qrImprNfVendvct2: TDateTimeField
      FieldName = 'vct2'
    end
    object qrImprNfVenddup3: TIntegerField
      FieldName = 'dup3'
    end
    object qrImprNfVendit3: TIntegerField
      FieldName = 'it3'
    end
    object qrImprNfVendvlr3: TBCDField
      FieldName = 'vlr3'
      Precision = 9
      Size = 2
    end
    object qrImprNfVendvct3: TDateTimeField
      FieldName = 'vct3'
    end
    object qrImprNfVenddup4: TIntegerField
      FieldName = 'dup4'
    end
    object qrImprNfVendit4: TIntegerField
      FieldName = 'it4'
    end
    object qrImprNfVendvlr4: TBCDField
      FieldName = 'vlr4'
      Precision = 9
      Size = 2
    end
    object qrImprNfVendvct4: TDateTimeField
      FieldName = 'vct4'
    end
    object qrImprNfVenddup5: TIntegerField
      FieldName = 'dup5'
    end
    object qrImprNfVendit5: TIntegerField
      FieldName = 'it5'
    end
    object qrImprNfVendvlr5: TBCDField
      FieldName = 'vlr5'
      Precision = 9
      Size = 2
    end
    object qrImprNfVendvct5: TDateTimeField
      FieldName = 'vct5'
    end
    object qrImprNfVendlinha_sq: TIntegerField
      FieldName = 'linha_sq'
    end
    object qrImprNfVendVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
    end
    object qrImprNfVendCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
    end
    object qrImprNfVendNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 100
    end
    object qrImprNfVendpct_comissao_propria: TBCDField
      FieldName = 'pct_comissao_propria'
      Precision = 4
      Size = 2
    end
    object qrImprNfVendbase_comissao: TStringField
      FieldName = 'base_comissao'
      Size = 1
    end
    object qrImprNfVendpct_comissao_desconto: TBCDField
      FieldName = 'pct_comissao_desconto'
      Precision = 4
      Size = 2
    end
    object qrImprNfVendpct_comissao_parceria: TBCDField
      FieldName = 'pct_comissao_parceria'
      Precision = 4
      Size = 2
    end
    object qrImprNfVendobs_comissao_desconto: TStringField
      FieldName = 'obs_comissao_desconto'
      Size = 100
    end
    object qrImprNfVendcodigo_cliente: TStringField
      FieldName = 'codigo_cliente'
      Size = 15
    end
    object qrImprNfVendnome_cliente: TStringField
      FieldName = 'nome_cliente'
      Size = 50
    end
    object qrImprNfVendnumero_nfe: TIntegerField
      FieldName = 'numero_nfe'
    end
    object qrImprNfVendtipo_vendedor: TStringField
      FieldName = 'tipo_vendedor'
      FixedChar = True
      Size = 1
    end
    object qrImprNfVenddata_cadastro: TDateField
      FieldName = 'data_cadastro'
    end
    object qrImprNfVenddata_inativacao: TDateField
      FieldName = 'data_inativacao'
    end
  end
  object qrImprNfDups: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT * FROM duplicatas'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ')
    Left = 184
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
  end
  object qrImprEst: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT P.*, DESCRICAO_MODELO, CODIGO_NBM,'
      
        '(qtde_estoque1+qtde_estoque2+qtde_estoque3+qtde_estoque4+qtde_es' +
        'toque5'
      
        '+qtde_estoque6+qtde_estoque7+qtde_estoque8+qtde_estoque9+qtde_es' +
        'toque10)*P.PRECO_UNIT as PRECO_TOTAL'
      'FROM produtos P'
      'LEFT JOIN nbm N ON (N.NBM_SQ = P.NBM_SQ)'
      'LEFT JOIN modelos M ON (M.MODELO_SQ = P.MODELO_SQ)'
      'WHERE TIPO_PRODUTO = :TIPO_PRODUTO'
      'ORDER BY :ORDEM')
    Left = 184
    Top = 360
    ParamData = <
      item
        DataType = ftString
        Name = 'TIPO_PRODUTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ORDEM'
        ParamType = ptUnknown
      end>
  end
  object qrImprHistClientes1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT distinct C.CLIENTE_SQ, C.CODIGO_CLIENTE, C.NOME_CLIENTE, ' +
        'C.INSCR_ESTADUAL, C.ENDERECO,'
      
        'C.NUMERO, C.BAIRRO, C.COMPL_ENDERECO, C.CIDADE, C.ESTADO, C.CEP,' +
        ' C.DDD_FONE1, '
      
        'C.NUMERO_FONE1, C.COMPL_FONE1, C.DDD_FONE2, C.NUMERO_FONE2, C.CO' +
        'MPL_FONE2, '
      
        'C.DDD_FONE3, C.NUMERO_FONE3, C.COMPL_FONE3, C.DDD_CELULAR, C.NUM' +
        'ERO_CELULAR, '
      
        'C.COMPL_CELULAR, C.DDD_FAX, C.NUMERO_FAX, C.COMPL_FAX, C.E_MAIL,' +
        ' C.WEB_SITE, '
      'C.CONTATO, C.PAIS, tc.descricao_tipo, C.BIRO'
      'FROM nfiscais NF'
      'LEFT JOIN clientes C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)'
      
        'left join tipo_cliente tc on (tc.tipo_cliente_sq = c.tipo_client' +
        'e_sq)'
      'LEFT JOIN naturezas NA ON (NA.NATUREZA_SQ = NF.NATUREZA_SQ)'
      'WHERE NF.CANCELADA <> '#39'S'#39' AND NA.TIPO_NFISCAL = 0'
      'AND CODIGO_CLIENTE LIKE :CODIGO_CLIENTE'
      'AND NOME_CLIENTE LIKE :NOME_CLIENTE'
      '')
    Left = 184
    Top = 408
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOME_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object qrImprHistClientes3: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT NI.*, (qtde_item)'
      
        '  as QTDE_ITEM, CODIGO_PRODUTO, DESCRICAO_PRODUTO, CODIGO_NBM, D' +
        'ESCRICAO_MODELO'
      'FROM nfiscais_itens NI'
      'LEFT OUTER JOIN produtos PR ON (PR.PRODUTO_SQ = NI.PRODUTO_SQ)'
      'LEFT OUTER JOIN nbm N ON (N.NBM_SQ = PR.NBM_SQ)'
      'LEFT OUTER JOIN modelos M ON (M.MODELO_SQ = PR.MODELO_SQ)'
      'WHERE NI.NFISCAL_SQ = :NFISCAL_SQ'
      'ORDER BY CODIGO_PRODUTO')
    Left = 344
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
  end
  object qrImprHistClientes2: TQuery
    BeforeOpen = qrImprHistClientes2BeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT NF.CLIENTE_SQ, NF.NFISCAL_SQ, NF.NUMERO_NFE, NF.DTEMISSAO' +
        '_NFISCAL, NF.COTACAO_DOLAR, '
      
        'NF.VLR_ICMS, NF.VLR_IPI, NF.VLR_FRETE, NF.FRETE_TRANSP, NF.VLR_P' +
        'RODUTOS, NF.VLR_TOTAL,'
      
        'DESCRICAO_COND_PAGTO, NA.DESCRICAO_NATUREZA, NA.CFO, TR.NOME_TRA' +
        'NSPORTADORA, V.NOME_VENDEDOR'
      'FROM nfiscais NF'
      
        'LEFT OUTER JOIN clientes         C ON (C.CLIENTE_SQ = NF.CLIENTE' +
        '_SQ)'
      
        'LEFT OUTER JOIN cond_pagto      CP ON (CP.COND_PAGTO_SQ = NF.CON' +
        'D_PAGTO_SQ)'
      
        'LEFT OUTER JOIN naturezas       NA ON (NA.NATUREZA_SQ = NF.NATUR' +
        'EZA_SQ)'
      
        'LEFT OUTER JOIN transportadoras TR ON (TR.TRANSPORTADORA_SQ = NF' +
        '.TRANSPORTADORA_SQ)'
      
        'LEFT OUTER JOIN vendedores             V ON (V.VENDEDOR_SQ = NF.' +
        'VENDEDOR_SQ)'
      'WHERE NF.DTEMISSAO_NFISCAL >= :DT_INICIO'
      'AND NF.DTEMISSAO_NFISCAL <= :DT_TERMINO'
      'AND NF.CANCELADA <> '#39'S'#39
      'AND NA.TIPO_NFISCAL = 0'
      'ORDER BY NF.NUMERO_NFISCAL')
    Left = 184
    Top = 456
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptUnknown
        Value = '01/01/01'
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
        Value = '01/01/01'
      end>
  end
  object qrImprDemPrev: TQuery
    BeforeOpen = qrImprDemPrevBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT NUMERO_NFISCAL, NOME_CLIENTE, DTEMISSAO_NFISCAL, DIAS_DEM' +
        'ONSTRACAO,'
      'DT_NFISCAL_RETORNO, VLR_TOTAL'
      'FROM nfiscais NF'
      
        'LEFT OUTER JOIN clientes        C  ON (C.CLIENTE_SQ        = NF.' +
        'CLIENTE_SQ)'
      
        'LEFT OUTER JOIN naturezas       N  ON (N.NATUREZA_SQ       = NF.' +
        'NATUREZA_SQ)'
      'WHERE TIPO_NFISCAL = 1'
      'AND CANCELADA <> '#39'S'#39
      
        'AND (INTERVAL DIAS_DEMONSTRACAO DAY + DTEMISSAO_NFISCAL) >= :INI' +
        'CIO'
      'AND (INTERVAL DIAS_DEMONSTRACAO DAY + DTEMISSAO_NFISCAL) <= :FIM'
      '')
    Left = 344
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FIM'
        ParamType = ptUnknown
      end>
    object qrImprDemPrevNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object qrImprDemPrevNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprDemPrevDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
    end
    object qrImprDemPrevDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object qrImprDemPrevDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
    end
    object qrImprDemPrevVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
  end
  object qrImprClientesUF: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT C.CLIENTE_SQ, C.CODIGO_CLIENTE, C.NOME_CLIENTE, C.INSCR_E' +
        'STADUAL,'
      
        '  C.ENDERECO, C.NUMERO, C.BAIRRO, C.COMPL_ENDERECO, C.CIDADE, C.' +
        'ESTADO,'
      
        '  C.CEP, C.DDD_FONE1, C.NUMERO_FONE1, C.COMPL_FONE1, C.DDD_FONE2' +
        ', C.NUMERO_FONE2,'
      
        '  C.COMPL_FONE2, C.DDD_FONE3, C.NUMERO_FONE3, C.COMPL_FONE3, C.D' +
        'DD_CELULAR,'
      
        '  C.NUMERO_CELULAR, C.COMPL_CELULAR, C.DDD_FAX, C.NUMERO_FAX, C.' +
        'COMPL_FAX,'
      
        '  C.E_MAIL, C.WEB_SITE, C.CONTATO, C.PAIS, tc.descricao_tipo, C.' +
        'BIRO, C.DATA_CADASTRO,'
      '  SUM(ni.qtde_item) AS QTDE,'
      
        '  SUM(NI.VLR_TOTAL_ITEM) AS VALOR, MAX(N.DTEMISSAO_NFISCAL) AS D' +
        'ATA'
      'FROM clientes C'
      
        'LEFT OUTER JOIN nfiscais N ON (N.CLIENTE_SQ = C.CLIENTE_SQ AND N' +
        '.CANCELADA <> '#39'S'#39')'
      'LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ)'
      
        'LEFT OUTER JOIN nfiscais_itens NI ON (NI.NFISCAL_SQ = N.NFISCAL_' +
        'SQ AND NA.TIPO_NFISCAL = 0)'
      
        'left join tipo_cliente tc on (tc.tipo_cliente_sq = c.tipo_client' +
        'e_sq)'
      
        'GROUP BY C.CLIENTE_SQ, C.CODIGO_CLIENTE, C.NOME_CLIENTE, C.INSCR' +
        '_ESTADUAL,'
      
        '  C.ENDERECO, C.NUMERO, C.BAIRRO, C.COMPL_ENDERECO, C.CIDADE, C.' +
        'ESTADO,'
      
        '  C.CEP, C.DDD_FONE1, C.NUMERO_FONE1, C.COMPL_FONE1, C.DDD_FONE2' +
        ', C.NUMERO_FONE2,'
      
        '  C.COMPL_FONE2, C.DDD_FONE3, C.NUMERO_FONE3, C.COMPL_FONE3, C.D' +
        'DD_CELULAR,'
      
        '  C.NUMERO_CELULAR, C.COMPL_CELULAR, C.DDD_FAX, C.NUMERO_FAX, C.' +
        'COMPL_FAX,'
      
        '  C.E_MAIL, C.WEB_SITE, C.CONTATO, C.PAIS, tc.descricao_tipo, C.' +
        'BIRO, C.DATA_CADASTRO'
      'ORDER BY SUM(NI.VLR_TOTAL_ITEM) DESC')
    Left = 344
    Top = 72
  end
  object qrImprNfSerie: TQuery
    BeforeOpen = qrImprNfSerieBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT NR_SERIE_ITEM, N.*, NOME_CLIENTE, DESCRICAO_COND_PAGTO, D' +
        'ESCRICAO_NATUREZA, NOME_VENDEDOR'
      'FROM nfiscais_itens NI'
      'LEFT OUTER JOIN nfiscais N ON (N.NFISCAL_SQ = NI.NFISCAL_SQ)'
      'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = N.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN cond_pagto CP ON (CP.COND_PAGTO_SQ = N.COND_PAGT' +
        'O_SQ)'
      'LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ)'
      'LEFT OUTER JOIN vendedores V ON (V.VENDEDOR_SQ = N.VENDEDOR_SQ)'
      'WHERE NI.NR_SERIE_ITEM LIKE :NR_SERIE_ITEM')
    Left = 344
    Top = 264
    ParamData = <
      item
        DataType = ftString
        Name = 'NR_SERIE_ITEM'
        ParamType = ptUnknown
      end>
    object qrImprNfSerieNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprNfSerieNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object qrImprNfSerieNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object qrImprNfSerieDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
    end
    object qrImprNfSerieDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
    end
    object qrImprNfSeriePEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object qrImprNfSerieCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object qrImprNfSerieCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object qrImprNfSerieNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
    end
    object qrImprNfSerieTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
    end
    object qrImprNfSerieBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieBASE_ICMS_SUBST: TBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_ICMS_SUBST: TBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_DESP_ACESS: TBCDField
      FieldName = 'VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrImprNfSerieFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object qrImprNfSeriePLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Size = 7
    end
    object qrImprNfSerieUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Size = 2
    end
    object qrImprNfSerieQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
    end
    object qrImprNfSerieESPECIE_TRANSP: TStringField
      FieldName = 'ESPECIE_TRANSP'
    end
    object qrImprNfSerieMARCA_TRANSP: TStringField
      FieldName = 'MARCA_TRANSP'
      Size = 30
    end
    object qrImprNfSerieNUMERO_TRANSP: TStringField
      FieldName = 'NUMERO_TRANSP'
      Size = 10
    end
    object qrImprNfSeriePBRUTO_TRANSP: TStringField
      FieldName = 'PBRUTO_TRANSP'
    end
    object qrImprNfSeriePLIQUIDO_TRANSP: TStringField
      FieldName = 'PLIQUIDO_TRANSP'
    end
    object qrImprNfSerieCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
    end
    object qrImprNfSerieCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
    end
    object qrImprNfSerieCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
    end
    object qrImprNfSerieCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
    end
    object qrImprNfSerieCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
    end
    object qrImprNfSerieCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
    end
    object qrImprNfSerieCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
    end
    object qrImprNfSerieMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprNfSerieCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object qrImprNfSerieDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object qrImprNfSerieCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object qrImprNfSerieNR_NFISCAL_RETORNO: TIntegerField
      FieldName = 'NR_NFISCAL_RETORNO'
    end
    object qrImprNfSerieDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
    end
    object qrImprNfSerieCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      Size = 1
    end
    object qrImprNfSerieVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
    end
    object qrImprNfSerieNF_MANUAL: TStringField
      FieldName = 'NF_MANUAL'
      Size = 1
    end
    object qrImprNfSerieRETORNO_PRODUTO: TStringField
      FieldName = 'RETORNO_PRODUTO'
      Size = 1
    end
    object qrImprNfSerieRETORNO_OBSERVACAO: TMemoField
      FieldName = 'RETORNO_OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprNfSerieNATUREZA_RET_DEM: TIntegerField
      FieldName = 'NATUREZA_RET_DEM'
    end
    object qrImprNfSerieNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprNfSerieDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object qrImprNfSerieDESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Size = 50
    end
    object qrImprNfSerieNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 100
    end
  end
  object dspImprNfFech: TDataSetProvider
    DataSet = qrImprNfFech
    Left = 240
    Top = 312
  end
  object qrImprNfFech: TQuery
    BeforeOpen = qrImprNfFechBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'select nf.dtemissao_nfiscal, nf.numero_nfiscal, na.cfo, na.descr' +
        'icao_natureza_nfiscal,'
      
        ' nf.vlr_produtos, nf.vlr_total, nf.vlr_icms, nf.vlr_ipi, c.nome_' +
        'cliente, na.ent_sai,'
      
        ' na.tipo_nfiscal, nf.cancelada, nf.linha_sq, nf.vlr_icms_subst, ' +
        'nf.numero_nfe'
      'from nfiscais NF'
      
        'left outer join naturezas NA on (NA.natureza_sq = NF.natureza_sq' +
        ')'
      'left outer join clientes C on (C.cliente_sq = NF.cliente_sq)'
      'where NF.dtemissao_nfiscal >= :dt_inicio'
      'and NF.dtemissao_nfiscal <= :dt_termino'
      'order by NF.numero_nfiscal')
    Left = 184
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
      end>
  end
  object dspImprAssist: TDataSetProvider
    DataSet = qrImprAssist
    Left = 400
    Top = 312
  end
  object dspImprAssistItem: TDataSetProvider
    DataSet = qrAssistItem
    Left = 400
    Top = 408
  end
  object dspImprAssistEquip: TDataSetProvider
    DataSet = qrImprAssistEquip
    Left = 400
    Top = 360
  end
  object qrImprAssist: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT A.*, DDD_FONE1, NUMERO_FONE1, COMPL_FONE1, DDD_CELULAR, N' +
        'UMERO_CELULAR,'
      
        'COMPL_CELULAR, ENDERECO, NUMERO, COMPL_ENDERECO, DDD_FONE2, NUME' +
        'RO_FONE2,'
      
        'COMPL_FONE2, DDD_FONE3, NUMERO_FONE3, COMPL_FONE3, DDD_FAX, NUME' +
        'RO_FAX,'
      
        'COMPL_FAX, CODIGO_CLIENTE, NOME_CLIENTE, CONTATO, C.INSCR_ESTADU' +
        'AL, BAIRRO,'
      
        'CIDADE, ESTADO, PAIS, CEP, D00, D01, D02, D03, D04, D05, D06, D0' +
        '7, D08,'
      
        'D09, P00, P01, P02, P03, P04, P05, P06, P07, P08, P09, PARCELAS,' +
        ' DESCRICAO_COND_PAGTO'
      'FROM assistencias A'
      
        'LEFT OUTER JOIN clientes              C ON (C.CLIENTE_SQ     = A' +
        '.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN cond_pagto           CP ON (CP.COND_PAGTO_SQ = A' +
        '.COND_PAGTO_SQ)'
      'WHERE NUMERO_ASSISTENCIA = :NUMERO_ASSISTENCIA')
    Left = 344
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_ASSISTENCIA'
        ParamType = ptUnknown
      end>
    object qrImprAssistASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object qrImprAssistNUMERO_ASSISTENCIA: TIntegerField
      FieldName = 'NUMERO_ASSISTENCIA'
    end
    object qrImprAssistDATA_CHAMADO: TDateTimeField
      FieldName = 'DATA_CHAMADO'
    end
    object qrImprAssistDATA_ASSISTENCIA: TDateTimeField
      FieldName = 'DATA_ASSISTENCIA'
    end
    object qrImprAssistCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
      Size = 2
    end
    object qrImprAssistCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object qrImprAssistCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object qrImprAssistDESP_CHAMADO: TBCDField
      FieldName = 'DESP_CHAMADO'
      Precision = 9
      Size = 2
    end
    object qrImprAssistDESP_HTEC_AD: TBCDField
      FieldName = 'DESP_HTEC_AD'
      Precision = 9
      Size = 2
    end
    object qrImprAssistDESP_DESLOC: TBCDField
      FieldName = 'DESP_DESLOC'
      Precision = 9
      Size = 2
    end
    object qrImprAssistVLR_PECAS: TBCDField
      FieldName = 'VLR_PECAS'
      Precision = 9
      Size = 2
    end
    object qrImprAssistVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrImprAssistHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
    end
    object qrImprAssistHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
    end
    object qrImprAssistGARANTIA: TStringField
      FieldName = 'GARANTIA'
      Size = 1
    end
    object qrImprAssistCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 1
    end
    object qrImprAssistvendedor_sq: TIntegerField
      FieldName = 'vendedor_sq'
    end
    object qrImprAssistDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object qrImprAssistNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object qrImprAssistCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object qrImprAssistDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object qrImprAssistNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object qrImprAssistCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object qrImprAssistENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qrImprAssistNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qrImprAssistCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object qrImprAssistDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object qrImprAssistNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object qrImprAssistCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object qrImprAssistDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object qrImprAssistNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object qrImprAssistCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object qrImprAssistDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object qrImprAssistNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object qrImprAssistCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object qrImprAssistCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object qrImprAssistNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprAssistCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qrImprAssistINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object qrImprAssistBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrImprAssistCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qrImprAssistESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qrImprAssistPAIS: TStringField
      FieldName = 'PAIS'
    end
    object qrImprAssistCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrImprAssistD00: TIntegerField
      FieldName = 'D00'
    end
    object qrImprAssistD01: TIntegerField
      FieldName = 'D01'
    end
    object qrImprAssistD02: TIntegerField
      FieldName = 'D02'
    end
    object qrImprAssistD03: TIntegerField
      FieldName = 'D03'
    end
    object qrImprAssistD04: TIntegerField
      FieldName = 'D04'
    end
    object qrImprAssistD05: TIntegerField
      FieldName = 'D05'
    end
    object qrImprAssistD06: TIntegerField
      FieldName = 'D06'
    end
    object qrImprAssistD07: TIntegerField
      FieldName = 'D07'
    end
    object qrImprAssistD08: TIntegerField
      FieldName = 'D08'
    end
    object qrImprAssistD09: TIntegerField
      FieldName = 'D09'
    end
    object qrImprAssistP00: TIntegerField
      FieldName = 'P00'
    end
    object qrImprAssistP01: TIntegerField
      FieldName = 'P01'
    end
    object qrImprAssistP02: TIntegerField
      FieldName = 'P02'
    end
    object qrImprAssistP03: TIntegerField
      FieldName = 'P03'
    end
    object qrImprAssistP04: TIntegerField
      FieldName = 'P04'
    end
    object qrImprAssistP05: TIntegerField
      FieldName = 'P05'
    end
    object qrImprAssistP06: TIntegerField
      FieldName = 'P06'
    end
    object qrImprAssistP07: TIntegerField
      FieldName = 'P07'
    end
    object qrImprAssistP08: TIntegerField
      FieldName = 'P08'
    end
    object qrImprAssistP09: TIntegerField
      FieldName = 'P09'
    end
    object qrImprAssistDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object qrImprAssistPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
  end
  object qrImprAssistEquip: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT AE.*, CODIGO_PRODUTO, DESCRICAO_PRODUTO, CODIGO_NBM'
      'FROM assistencias_equips AE'
      'LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = AE.PRODUTO_SQ)'
      'LEFT OUTER JOIN nbm      N ON (N.NBM_SQ     = P.NBM_SQ)'
      'WHERE ASSISTENCIA_SQ = :ASSISTENCIA_SQ')
    Left = 344
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    object qrImprAssistEquipASSISTENCIA_EQUIP_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_EQUIP_SQ'
    end
    object qrImprAssistEquipASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object qrImprAssistEquipPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object qrImprAssistEquipNR_SERIE_EQUIP: TMemoField
      FieldName = 'NR_SERIE_EQUIP'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprAssistEquipDEFEITO: TBlobField
      FieldName = 'DEFEITO'
      Size = 1
    end
    object qrImprAssistEquipservicos: TMemoField
      FieldName = 'servicos'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprAssistEquipCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object qrImprAssistEquipDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 50
    end
    object qrImprAssistEquipCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object qrAssistItem: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT AI.*, CODIGO_PRODUTO, DESCRICAO_PRODUTO, CODIGO_NBM'
      'FROM assistencias_itens AI'
      'LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = AI.PRODUTO_SQ)'
      'LEFT OUTER JOIN nbm      N ON (N.NBM_SQ     = P.NBM_SQ)'
      
        'LEFT OUTER JOIN assistencias_equips AE ON (AE.ASSISTENCIA_EQUIP_' +
        'SQ = AI.ASSISTENCIA_EQUIP_SQ)'
      'WHERE ASSISTENCIA_SQ = :ASSISTENCIA_SQ')
    Left = 344
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    object qrAssistItemASSISTENCIA_ITEM_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_ITEM_SQ'
    end
    object qrAssistItemassistencia_equip_sq: TIntegerField
      FieldName = 'assistencia_equip_sq'
    end
    object qrAssistItemPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object qrAssistItemQTDE_ASSISTENCIA_ITEM: TIntegerField
      FieldName = 'QTDE_ASSISTENCIA_ITEM'
    end
    object qrAssistItemPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object qrAssistItemCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object qrAssistItemDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 50
    end
    object qrAssistItemCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object dspImprNFServicos: TDataSetProvider
    DataSet = qrImprNFServicos
    Left = 576
    Top = 24
  end
  object qrImprNFServicos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT NF.*, C.NOME_CLIENTE'
      'FROM nf_servicos NF'
      'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)'
      'WHERE NF.DATA_NF_SERVICO >= :DT_INICIO'
      'AND NF.DATA_NF_SERVICO <= :DT_TERMINO'
      'ORDER BY NF.NUMERO_NF_SERVICO')
    Left = 520
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
      end>
    object qrImprNFServicosNF_SERVICO_SQ: TIntegerField
      FieldName = 'NF_SERVICO_SQ'
      Origin = 'DBCONN.nf_servicos.NF_SERVICO_SQ'
    end
    object qrImprNFServicosNUMERO_NF_SERVICO: TIntegerField
      FieldName = 'NUMERO_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.NUMERO_NF_SERVICO'
    end
    object qrImprNFServicosDATA_NF_SERVICO: TDateTimeField
      FieldName = 'DATA_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.DATA_NF_SERVICO'
    end
    object qrImprNFServicosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.nf_servicos.CLIENTE_SQ'
    end
    object qrImprNFServicosTTL_NF_SERVICO: TBCDField
      FieldName = 'TTL_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.TTL_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object qrImprNFServicosALIQ_ISS_NF_SERVICO: TBCDField
      FieldName = 'ALIQ_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.ALIQ_ISS_NF_SERVICO'
      Precision = 4
      Size = 2
    end
    object qrImprNFServicosVLR_ISS_NF_SERVICO: TBCDField
      FieldName = 'VLR_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.VLR_ISS_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object qrImprNFServicosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Size = 50
    end
  end
  object dspImprNFClientes: TDataSetProvider
    DataSet = qrImprNFClientes
    Left = 576
    Top = 72
  end
  object qrImprNFClientes: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        '(SELECT NF.DT_NFISCAL_RETORNO as DTEMISSAO, NF.NR_NFISCAL_RETORN' +
        'O as NFISCAL, NA.CFO, NA.DESCRICAO_NATUREZA_NFISCAL, NF.VLR_PROD' +
        'UTOS, NF.VLR_TOTAL, NF.VLR_ICMS, NF.VLR_IPI, C.NOME_CLIENTE, NA.' +
        'ENT_SAI, NA.TIPO_NFISCAL, NF.CANCELADA'
      'FROM nfiscais NF'
      
        'LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = NF.NATUREZA_RE' +
        'T_DEM)'
      'LEFT OUTER JOIN clientes  C  ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)'
      'WHERE NF.NR_NFISCAL_RETORNO <> '#39#39' AND'
      '      (SELECT N2.NUMERO_NFISCAL'
      '       FROM nfiscais N2'
      '       WHERE NF.NR_NFISCAL_RETORNO=N2.NUMERO_NFISCAL AND'
      '             NF.DT_NFISCAL_RETORNO=N2.DTEMISSAO_NFISCAL) IS NULL'
      'AND NF.DT_NFISCAL_RETORNO >= :DT_INICIO1'
      'AND NF.DT_NFISCAL_RETORNO <= :DT_TERMINO1'
      'ORDER BY NF.NUMERO_NFISCAL)'
      'UNION'
      
        '(SELECT NFE.DTEMISSAO_NF_ENT as DTEMISSAO, NUMERO_NF_ENT, NA.CFO' +
        ', NA.DESCRICAO_NATUREZA_NFISCAL, VLR_PRODUTOS, VLR_TOTAL, VLR_IC' +
        'MS, VLR_IPI, C.NOME_CLIENTE, NA.ENT_SAI, NA.TIPO_NFISCAL, "N"'
      'FROM nf_entradas NFE'
      'LEFT OUTER JOIN clientes  C  ON (C.CLIENTE_SQ = NFE.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = NFE.NATUREZA_S' +
        'Q)'
      'WHERE NFE.DTEMISSAO_NF_ENT >= :DT_INICIO2'
      '  AND NFE.DTEMISSAO_NF_ENT <= :DT_TERMINO2'
      'ORDER BY NFE.NUMERO_NF_ENT)')
    Left = 520
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'DT_INICIO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_INICIO2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO2'
        ParamType = ptUnknown
      end>
    object qrImprNFClientesDTEMISSAO: TDateTimeField
      FieldName = 'DTEMISSAO'
    end
    object qrImprNFClientesNFISCAL: TIntegerField
      FieldName = 'NFISCAL'
    end
    object qrImprNFClientesCFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object qrImprNFClientesDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object qrImprNFClientesVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrImprNFClientesVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrImprNFClientesVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprNFClientesVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrImprNFClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprNFClientesENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Size = 1
    end
    object qrImprNFClientesTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
    end
    object qrImprNFClientesCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
  end
  object dspImprResVend: TDataSetProvider
    DataSet = qrImprResVend
    Left = 576
    Top = 120
  end
  object qrImprResVend: TQuery
    BeforeOpen = qrImprResVendBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select nome_vendedor, sum(n.vlr_total) as total'
      'from nfiscais n'
      'left outer join naturezas na on (na.natureza_sq = n.natureza_sq)'
      'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq)'
      'where na.tipo_nfiscal = 0'
      'and n.cancelada <> '#39'S'#39
      'and n.dtemissao_nfiscal >= :dt_inicio'
      'and n.dtemissao_nfiscal <= :dt_termino'
      'group by nome_vendedor'
      'order by total')
    Left = 520
    Top = 120
    ParamData = <
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
      end>
    object qrImprResVendnome_vendedor: TStringField
      FieldName = 'nome_vendedor'
      Size = 100
    end
    object qrImprResVendtotal: TBCDField
      FieldName = 'total'
      Precision = 31
      Size = 2
    end
  end
  object dspImprResVendProd: TDataSetProvider
    DataSet = qrImprResVendProd
    Left = 576
    Top = 168
  end
  object qrImprResVendProd: TQuery
    BeforeOpen = qrImprResVendProdBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select descricao_produto, sum(ni.qtde_item) as total'
      'from nfiscais_itens ni'
      'left outer join nfiscais n on (n.nfiscal_sq = ni.nfiscal_sq)'
      'left outer join naturezas na on (na.natureza_sq = n.natureza_sq)'
      'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq)'
      'left outer join produtos p on (p.produto_sq = ni.produto_sq)'
      'left outer join clientes c on (c.cliente_sq=n.cliente_sq)'
      'where na.tipo_nfiscal = 0'
      'and p.tipo_produto = 1'
      'and n.cancelada <> '#39'S'#39
      'and n.dtemissao_nfiscal >= :dt_inicio'
      'and n.dtemissao_nfiscal <= :dt_termino'
      'and c.codigo_cliente like :codigo_cliente'
      'group by descricao_produto'
      'order by total')
    Left = 520
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'codigo_cliente'
        ParamType = ptUnknown
      end>
    object qrImprResVendProddescricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 50
    end
    object qrImprResVendProdtotal: TBCDField
      FieldName = 'total'
      Precision = 32
      Size = 0
    end
  end
  object dspImprSugCompra: TDataSetProvider
    DataSet = qrImprSugCompra
    Left = 576
    Top = 216
  end
  object qrImprSugCompra: TQuery
    BeforeOpen = qrImprSugCompraBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'select codigo_produto, descricao_produto, qtde_estoque1, qtde_es' +
        'toque2, qtde_estoque3, qtde_estoque4, qtde_estoque5, qtde_estoqu' +
        'e6, qtde_estoque7, qtde_estoque8, qtde_estoque9, qtde_estoque10,'
      
        '(qtde_estoque1+qtde_estoque2+qtde_estoque3+qtde_estoque4+qtde_es' +
        'toque5+qtde_estoque6+qtde_estoque7+qtde_estoque8+qtde_estoque9+q' +
        'tde_estoque10) as estoque_total, tipo_produto, p.linha_sq, pa.qt' +
        'de_aberto,'
      'sum(ni1.qtde_item) as qtde1,'
      'sum(ni2.qtde_item) as qtde2,'
      'sum(ni3.qtde_item) as qtde3,'
      'sum(ni4.qtde_item) as qtde4,'
      'sum(ni5.qtde_item) as qtde5,'
      'sum(ni6.qtde_item) as qtde6,'
      'sum(ni7.qtde_item) as qtde7,'
      'sum(ni8.qtde_item) as qtde8,'
      'sum(ni9.qtde_item) as qtde9,'
      'sum(ni10.qtde_item) as qtde10,'
      'sum(ni11.qtde_item) as qtde11,'
      'sum(ni12.qtde_item) as qtde12'
      'from nfiscais n'
      
        'inner join naturezas nat on (nat.natureza_sq = n.natureza_sq and' +
        ' nat.tipo_nfiscal = 0)'
      
        'left outer join nfiscais_itens ni   on (ni.nfiscal_sq = n.nfisca' +
        'l_sq)'
      
        'left outer join nfiscais_itens ni1  on (ni1.nfiscal_sq = n.nfisc' +
        'al_sq  and ni1.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti1  and n.dtemissao_nfiscal < :dtf1)'
      
        'left outer join nfiscais_itens ni2  on (ni2.nfiscal_sq = n.nfisc' +
        'al_sq  and ni2.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti2  and n.dtemissao_nfiscal < :dtf2)'
      
        'left outer join nfiscais_itens ni3  on (ni3.nfiscal_sq = n.nfisc' +
        'al_sq  and ni3.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti3  and n.dtemissao_nfiscal < :dtf3)'
      
        'left outer join nfiscais_itens ni4  on (ni4.nfiscal_sq = n.nfisc' +
        'al_sq  and ni4.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti4  and n.dtemissao_nfiscal < :dtf4)'
      
        'left outer join nfiscais_itens ni5  on (ni5.nfiscal_sq = n.nfisc' +
        'al_sq  and ni5.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti5  and n.dtemissao_nfiscal < :dtf5)'
      
        'left outer join nfiscais_itens ni6  on (ni6.nfiscal_sq = n.nfisc' +
        'al_sq  and ni6.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti6  and n.dtemissao_nfiscal < :dtf6)'
      
        'left outer join nfiscais_itens ni7  on (ni7.nfiscal_sq = n.nfisc' +
        'al_sq  and ni7.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti7  and n.dtemissao_nfiscal < :dtf7)'
      
        'left outer join nfiscais_itens ni8  on (ni8.nfiscal_sq = n.nfisc' +
        'al_sq  and ni8.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti8  and n.dtemissao_nfiscal < :dtf8)'
      
        'left outer join nfiscais_itens ni9  on (ni9.nfiscal_sq = n.nfisc' +
        'al_sq  and ni9.nfiscal_item_sq = ni.nfiscal_item_sq  and n.dtemi' +
        'ssao_nfiscal >= :dti9  and n.dtemissao_nfiscal < :dtf9)'
      
        'left outer join nfiscais_itens ni10 on (ni10.nfiscal_sq = n.nfis' +
        'cal_sq and ni10.nfiscal_item_sq = ni.nfiscal_item_sq and n.dtemi' +
        'ssao_nfiscal >= :dti10 and n.dtemissao_nfiscal < :dtf10)'
      
        'left outer join nfiscais_itens ni11 on (ni11.nfiscal_sq = n.nfis' +
        'cal_sq and ni11.nfiscal_item_sq = ni.nfiscal_item_sq and n.dtemi' +
        'ssao_nfiscal >= :dti11 and n.dtemissao_nfiscal < :dtf11)'
      
        'left outer join nfiscais_itens ni12 on (ni12.nfiscal_sq = n.nfis' +
        'cal_sq and ni12.nfiscal_item_sq = ni.nfiscal_item_sq and n.dtemi' +
        'ssao_nfiscal >= :dti12 and n.dtemissao_nfiscal < :dtf12)'
      'inner join produtos p          on (p.produto_sq = ni.produto_sq)'
      'left outer join ('
      
        '  select pi.produto_sq, sum(pi.qtde_pedido_item-COALESCE(ni.qtde' +
        '_faturado,0)) as qtde_aberto'
      '  from pedidos_itens pi'
      '  left outer join ('
      
        '    select ni.produto_sq, n.pedido_sq, sum(ni.qtde_item) as qtde' +
        '_faturado'
      '    from nfiscais_itens ni'
      '    inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq)'
      
        '    group by ni.produto_sq, n.pedido_sq) ni on (ni.pedido_sq=pi.' +
        'pedido_sq and pi.produto_sq=ni.produto_sq)'
      '  group by pi.produto_sq) pa on (pa.produto_sq=p.produto_sq)'
      'where n.cancelada <> '#39'S'#39
      
        'group by codigo_produto, descricao_produto, qtde_estoque1, qtde_' +
        'estoque2, qtde_estoque3, qtde_estoque4, qtde_estoque5, qtde_esto' +
        'que6, qtde_estoque7, qtde_estoque8, qtde_estoque9, qtde_estoque1' +
        '0, (qtde_estoque1+qtde_estoque2+qtde_estoque3+qtde_estoque4+qtde' +
        '_estoque5+qtde_estoque6+qtde_estoque7+qtde_estoque8+qtde_estoque' +
        '9+qtde_estoque10), p.linha_sq'
      'order by descricao_produto')
    Left = 520
    Top = 216
    ParamData = <
      item
        DataType = ftString
        Name = 'dti1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf1'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf2'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti3'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf3'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti4'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf4'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti5'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf5'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti6'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf6'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti7'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf7'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti8'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf8'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti9'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf9'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti10'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf10'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti11'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf11'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dti12'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dtf12'
        ParamType = ptUnknown
      end>
  end
  object dspImprClientesNovos: TDataSetProvider
    DataSet = qrImprClientesNovos
    Left = 400
    Top = 120
  end
  object qrImprClientesNovos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'SELECT *, CONCAT("(", DDD_FONE1, ") ", NUMERO_FONE1, " - ", COMP' +
        'L_FONE1) AS TELEFONE1,'
      
        'CONCAT("(", DDD_FONE2, ") ", NUMERO_FONE2, " - ", COMPL_FONE2) A' +
        'S TELEFONE2,'
      
        'CONCAT("(", DDD_FONE3, ") ", NUMERO_FONE3, " - ", COMPL_FONE3) A' +
        'S TELEFONE3,'
      
        'CONCAT("(", DDD_CELULAR, ") ", NUMERO_CELULAR, " - ", COMPL_CELU' +
        'LAR) AS CELULAR,'
      'CONCAT("(", DDD_FAX, ") ", NUMERO_FAX, " - ", COMPL_FAX) AS FAX'
      'FROM clientes'
      'ORDER BY NOME_CLIENTE')
    Left = 344
    Top = 120
  end
  object dspImprRMA1: TDataSetProvider
    DataSet = qrImprRMA1
    Left = 576
    Top = 264
  end
  object qrImprRMA1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'select a.assistencia_sq, ae.assistencia_equip_sq, a.numero_assis' +
        'tencia as "RMA NO",'
      
        ' a.data_chamado as "Receive Date", date_format(data_chamado, '#39'%m' +
        '/%Y'#39') as referencia,'
      
        ' a.data_assistencia as "Process Date", '#39'Avision - Brasil'#39' as "Re' +
        'pair Center",'
      ' c.nome_cliente as "Customer Name",'
      
        ' concat("(",c.ddd_fone1,") ", c.numero_fone1, " - ", c.compl_fon' +
        'e1) as Phone,'
      
        ' m.descricao_modelo as "Model", ae.nr_serie_equip as "Serial num' +
        'ber",'
      
        ' "         N/A           " as "In/Out of Warranty", 1 as "Quanti' +
        'ty",'
      ' ae.defeito as "Defected reason",'
      ' ae.servicos as "How to repair", "" as "Change component",'
      
        ' "" as "Parts number", v.nome_vendedor as "Technician", "OK" as ' +
        '"Result", frete as Freight, garantia as Warraty'
      'from assistencias_equips ae'
      
        ' left outer join assistencias a on (a.assistencia_sq = ae.assist' +
        'encia_sq)'
      ' left outer join clientes c on (c.cliente_sq = a.cliente_sq)'
      ' left outer join produtos p1 on (p1.produto_sq = ae.produto_sq)'
      ' left outer join modelos m on (m.modelo_sq = p1.modelo_sq)'
      ' left outer join vendedores v on (v.vendedor_sq = a.vendedor_sq)')
    Left = 520
    Top = 264
    object qrImprRMA1assistencia_sq: TIntegerField
      FieldName = 'assistencia_sq'
    end
    object qrImprRMA1assistencia_equip_sq: TIntegerField
      FieldName = 'assistencia_equip_sq'
    end
    object qrImprRMA1RMANO: TIntegerField
      FieldName = 'RMA NO'
    end
    object qrImprRMA1ReceiveDate: TDateTimeField
      FieldName = 'Receive Date'
    end
    object qrImprRMA1ProcessDate: TDateTimeField
      FieldName = 'Process Date'
    end
    object qrImprRMA1RepairCenter: TStringField
      FieldName = 'Repair Center'
      Size = 16
    end
    object qrImprRMA1CustomerName: TStringField
      FieldName = 'Customer Name'
      Size = 50
    end
    object qrImprRMA1Phone: TStringField
      FieldName = 'Phone'
      Size = 35
    end
    object qrImprRMA1Model: TStringField
      FieldName = 'Model'
      Size = 200
    end
    object qrImprRMA1Serialnumber: TMemoField
      FieldName = 'Serial number'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprRMA1InOutofWarranty: TStringField
      FieldName = 'In/Out of Warranty'
      Size = 23
    end
    object qrImprRMA1Quantity: TFloatField
      FieldName = 'Quantity'
    end
    object qrImprRMA1Defectedreason: TMemoField
      FieldName = 'Defected reason'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprRMA1Howtorepair: TMemoField
      FieldName = 'How to repair'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprRMA1Changecomponent: TStringField
      FieldKind = fkCalculated
      FieldName = 'Change component'
      Size = 128
      Calculated = True
    end
    object qrImprRMA1Partsnumber: TStringField
      FieldKind = fkCalculated
      FieldName = 'Parts number'
      Size = 128
      Calculated = True
    end
    object qrImprRMA1Technician: TStringField
      FieldName = 'Technician'
      Size = 100
    end
    object qrImprRMA1Result: TStringField
      FieldName = 'Result'
      Size = 10
    end
    object qrImprRMA1Freight: TStringField
      FieldName = 'Freight'
      Size = 1
    end
    object qrImprRMA1Warraty: TStringField
      FieldName = 'Warraty'
      Size = 1
    end
    object qrImprRMA1referencia: TStringField
      FieldName = 'referencia'
      Size = 7
    end
  end
  object PJVersionInfo1: TPJVersionInfo
    FileName = 'prHandy.exe'
    Left = 48
    Top = 224
  end
  object dspBuscaCep: TDataSetProvider
    DataSet = qrBuscaCep
    Options = [poReadOnly]
    Left = 96
    Top = 520
  end
  object qrBuscaCep: TQuery
    DatabaseName = 'DBCep'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'SELECT *'
      'FROM enderecos'
      'WHERE LOGRADOURO LIKE :LOGRADOURO'
      'LIMIT 10')
    Left = 40
    Top = 520
    ParamData = <
      item
        DataType = ftString
        Name = 'LOGRADOURO'
        ParamType = ptUnknown
      end>
    object qrBuscaCepCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrBuscaCepLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 242
    end
    object qrBuscaCepBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 72
    end
    object qrBuscaCepCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object qrBuscaCepUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object dspImprResVendMes: TDataSetProvider
    DataSet = qrImprResVendMes
    Left = 576
    Top = 312
  end
  object qrImprResVendMes: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select nome_vendedor, sum(n.vlr_total) as total,'
      
        'concat(year(dtemissao_nfiscal), '#39'/'#39', month(dtemissao_nfiscal)) a' +
        's ano_mes'
      'from nfiscais n'
      'left outer join naturezas na on (na.natureza_sq = n.natureza_sq)'
      'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq)'
      'where na.tipo_nfiscal = 0'
      'and n.cancelada <> '#39'S'#39
      'and year(dtemissao_nfiscal) >= :ano_inicio'
      'and year(dtemissao_nfiscal) <= :ano_termino'
      'and n.vendedor_sq = :vendedor_sq'
      'group by nome_vendedor, ano_mes'
      'order by nome_vendedor, ano_mes')
    Left = 520
    Top = 312
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ano_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'ano_termino'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'vendedor_sq'
        ParamType = ptUnknown
      end>
    object qrImprResVendMesnome_vendedor: TStringField
      FieldName = 'nome_vendedor'
      Size = 100
    end
    object qrImprResVendMestotal: TBCDField
      FieldName = 'total'
      Precision = 31
      Size = 2
    end
    object qrImprResVendMesano_mes: TStringField
      FieldName = 'ano_mes'
      Size = 7
    end
  end
  object Query2: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    Left = 104
    Top = 128
  end
  object qrImprComissao: TQuery
    BeforeOpen = qrImprComissaoBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select'
      'v.vendedor_sq, v.nome_vendedor, n.numero_nfiscal,'
      'origem, base, n.vlr_total,'
      
        'if (n.origem='#39'P'#39', v.pct_comissao_propria*n.vlr_total/100, v.pct_' +
        'comissao_parceria*n.vlr_total/100) as comissao'
      '  from vendedores v'
      '  inner join ('
      
        '    select _latin1 '#39'P'#39' as origem, _latin1 '#39'F'#39' as base, v.vendedo' +
        'r_sq, n.numero_nfiscal, n.dtemissao_nfiscal, n.vlr_total'
      '    from vendedores v'
      
        '    inner join nfiscais n on (n.vendedor_sq=v.vendedor_sq and ca' +
        'ncelada <> '#39'S'#39' and concluida = '#39'S'#39')'
      '  union'
      
        '    select _latin1 '#39'T'#39' as origem, _latin1 '#39'F'#39' as base, v.vendedo' +
        'r_sq, n.numero_nfiscal, n.dtemissao_nfiscal, n.vlr_total'
      '    from vendedores v'
      '    inner join clientes c on (c.vendedor_sq=v.vendedor_sq)'
      
        '    inner join nfiscais n on (n.cliente_sq=c.cliente_sq and n.ve' +
        'ndedor_sq<>v.vendedor_sq and cancelada <> '#39'S'#39' and concluida = '#39'S' +
        #39')'
      '  union'
      
        '    select _latin1 '#39'P'#39' as origem, _latin1 '#39'V'#39' as base, v.vendedo' +
        'r_sq, d.numero_duplicata, d.dtvencto_duplicata, d.valor_duplicat' +
        'a'
      '    from vendedores v'
      
        '    inner join nfiscais n on (n.vendedor_sq=v.vendedor_sq and ca' +
        'ncelada <> '#39'S'#39' and concluida = '#39'S'#39')'
      '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq)'
      '  union'
      
        '    select _latin1 '#39'T'#39' as origem, _latin1 '#39'V'#39' as base, v.vendedo' +
        'r_sq, d.numero_duplicata, d.dtvencto_duplicata, d.valor_duplicat' +
        'a'
      '    from vendedores v'
      '    inner join clientes c on (c.vendedor_sq=v.vendedor_sq)'
      
        '    inner join nfiscais n on (n.cliente_sq=c.cliente_sq and n.ve' +
        'ndedor_sq<>v.vendedor_sq and cancelada <> '#39'S'#39' and concluida = '#39'S' +
        #39')'
      '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq)'
      '  union'
      
        '    select _latin1 '#39'P'#39' as origem, _latin1 '#39'R'#39' as base, v.vendedo' +
        'r_sq, d.numero_duplicata, dp.dt_pgto, dp.valor_pgto'
      '    from vendedores v'
      
        '    inner join nfiscais n on (n.vendedor_sq=v.vendedor_sq and ca' +
        'ncelada <> '#39'S'#39' and concluida = '#39'S'#39')'
      '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq)'
      
        '    inner join duplicatas_pgto dp on (dp.duplicata_sq=d.duplicat' +
        'a_sq)'
      '  union'
      
        '    select _latin1 '#39'T'#39' as origem, _latin1 '#39'R'#39' as base, v.vendedo' +
        'r_sq, d.numero_duplicata, dp.dt_pgto, dp.valor_pgto'
      '    from vendedores v'
      '    inner join clientes c on (c.vendedor_sq=v.vendedor_sq)'
      
        '    inner join nfiscais n on (n.cliente_sq=c.cliente_sq and n.ve' +
        'ndedor_sq<>v.vendedor_sq and cancelada <> '#39'S'#39' and concluida = '#39'S' +
        #39')'
      '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq)'
      
        '    inner join duplicatas_pgto dp on (dp.duplicata_sq=d.duplicat' +
        'a_sq)'
      
        ') n on (n.vendedor_sq=v.vendedor_sq and n.dtemissao_nfiscal >= :' +
        'dt_inicio and n.dtemissao_nfiscal <= :dt_termino)'
      'where n.base=v.base_comissao')
    Left = 344
    Top = 168
    ParamData = <
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
      end>
  end
  object dspImprComissao: TDataSetProvider
    DataSet = qrImprComissao
    Left = 400
    Top = 168
  end
  object dspImprRMA2: TDataSetProvider
    DataSet = qrImprRMA2
    Left = 576
    Top = 360
  end
  object qrImprRMA2: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      'select * from rma where numero_rma = :numero_rma')
    Left = 520
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'numero_rma'
        ParamType = ptUnknown
      end>
  end
  object dspImprRMA2Item: TDataSetProvider
    DataSet = qrImprRMA2Item
    Left = 576
    Top = 408
  end
  object qrImprRMA2Item: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_1'
    SQL.Strings = (
      
        'select i.*, p.descricao_produto, m.descricao_modelo, l.descricao' +
        '_linha'
      'from rma_item i'
      'left join produtos p on (p.produto_sq=i.produto_sq)'
      'left join modelos m on (m.modelo_sq=p.modelo_sq)'
      'left join linha l on (l.linha_sq=p.linha_sq)'
      'where rma_sq = :rma_sq')
    Left = 520
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'rma_sq'
        ParamType = ptUnknown
      end>
  end
  object DbNotif: TDatabase
    AliasName = 'db.host.sk'
    DatabaseName = 'DbNotif'
    HandleShared = True
    KeepConnection = False
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=avision'
      'ODBC DSN=db.host.sk'
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
      'PASSWORD=avision')
    SessionName = 'Session1_1'
    Left = 40
    Top = 576
  end
end
