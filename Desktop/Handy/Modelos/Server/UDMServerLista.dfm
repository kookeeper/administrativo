object ServerLista: TServerLista
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 313
  Top = 153
  Height = 545
  Width = 663
  object dsListaPedidos: TDataSource
    DataSet = qrListaPedidos
    Left = 96
    Top = 296
  end
  object dsListaNfiscais: TDataSource
    DataSet = qrListaNfiscais
    Left = 296
    Top = 152
  end
  object dspListaPecas: TDataSetProvider
    DataSet = qrListaPecas
    Options = [poReadOnly]
    Left = 128
    Top = 176
  end
  object dspListaClientes: TDataSetProvider
    DataSet = qrListaClientes
    Options = [poReadOnly]
    Left = 128
    Top = 32
  end
  object dspListaCondPagto: TDataSetProvider
    DataSet = qrListaCondPagto
    Options = [poReadOnly]
    Left = 128
    Top = 80
  end
  object dspListaNaturezas: TDataSetProvider
    DataSet = qrListaNaturezas
    Options = [poReadOnly]
    Left = 128
    Top = 128
  end
  object dspListaUsuarios: TDataSetProvider
    DataSet = qrListaUsuarios
    Options = [poReadOnly]
    Left = 128
    Top = 368
  end
  object dspListaNBM: TDataSetProvider
    DataSet = qrListaNBM
    Options = [poReadOnly]
    Left = 128
    Top = 224
  end
  object dspListaPedidos: TDataSetProvider
    DataSet = qrListaPedidos
    Options = [poReadOnly]
    Left = 128
    Top = 272
  end
  object dspListaPedidosItens: TDataSetProvider
    DataSet = qrListaPedidosItens
    Options = [poReadOnly]
    Left = 128
    Top = 320
  end
  object dspListaDuplicatas: TDataSetProvider
    DataSet = qrListaDuplicatas
    Options = [poReadOnly]
    Left = 328
    Top = 272
  end
  object dspListaTransportadoras: TDataSetProvider
    DataSet = qrListaTransportadoras
    Options = [poReadOnly]
    Left = 328
    Top = 32
  end
  object dspListaNfiscais: TDataSetProvider
    DataSet = qrListaNfiscais
    Options = [poReadOnly]
    Left = 328
    Top = 128
  end
  object dspListaNfiscaisItens: TDataSetProvider
    DataSet = qrListaNfiscaisItens
    Options = [poReadOnly]
    Left = 328
    Top = 176
  end
  object dspLista: TDataSetProvider
    DataSet = qrLista
    Options = [poReadOnly]
    Left = 584
    Top = 216
  end
  object dspCep: TDataSetProvider
    DataSet = qrCep
    Left = 584
    Top = 456
  end
  object dspBuscaPecas: TDataSetProvider
    DataSet = qrBuscaPecas
    Options = [poReadOnly]
    Left = 584
    Top = 264
  end
  object dspBuscaClientes: TDataSetProvider
    DataSet = qrBuscaClientes
    Options = [poReadOnly]
    Left = 583
    Top = 312
  end
  object dspListaKardexPecas: TDataSetProvider
    DataSet = qrListaKardexPecas
    Options = [poReadOnly]
    Left = 328
    Top = 224
  end
  object dspListaModelos: TDataSetProvider
    DataSet = qrListaModelos
    Options = [poReadOnly]
    Left = 328
    Top = 320
  end
  object dspListaAssistencias: TDataSetProvider
    DataSet = qrListaAssistencias
    Options = [poReadOnly]
    Left = 328
    Top = 368
  end
  object dsListaAssistencias: TDataSource
    DataSet = qrListaAssistencias
    Left = 296
    Top = 392
  end
  object dspListaAssistenciasEquip: TDataSetProvider
    DataSet = qrListaAssistenciasEquip
    Options = [poReadOnly]
    Left = 328
    Top = 416
  end
  object dspListaAssistenciasItens: TDataSetProvider
    DataSet = qrListaAssistenciasItens
    Options = [poReadOnly]
    Left = 328
    Top = 464
  end
  object dspListaVendedores: TDataSetProvider
    DataSet = qrListaVendedores
    Options = [poReadOnly]
    Left = 128
    Top = 416
  end
  object dspListaAcessos: TDataSetProvider
    DataSet = qrListaAcessos
    Options = [poReadOnly]
    Left = 128
    Top = 464
  end
  object dspListaNfiscaisTotais: TDataSetProvider
    DataSet = qrListaNfiscaisTotais
    Options = [poReadOnly]
    Left = 328
    Top = 80
  end
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
    SessionName = 'Session1_3'
    Left = 16
    Top = 80
  end
  object qrLista: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    Left = 528
    Top = 216
  end
  object qrListaClientes: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 72
    Top = 32
    object qrListaClientesCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.clientes.CLIENTE_SQ'
    end
    object qrListaClientesCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'DBCONN.clientes.CODIGO_CLIENTE'
      Size = 15
    end
    object qrListaClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Size = 50
    end
    object qrListaClientesINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN.clientes.INSCR_ESTADUAL'
    end
    object qrListaClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DBCONN.clientes.ENDERECO'
      Size = 50
    end
    object qrListaClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'DBCONN.clientes.NUMERO'
    end
    object qrListaClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'DBCONN.clientes.BAIRRO'
      Size = 30
    end
    object qrListaClientesCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'DBCONN.clientes.COMPL_ENDERECO'
      Size = 50
    end
    object qrListaClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCONN.clientes.CIDADE'
      Size = 30
    end
    object qrListaClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'DBCONN.clientes.ESTADO'
      Size = 2
    end
    object qrListaClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCONN.clientes.CEP'
      Size = 8
    end
    object qrListaClientesDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'DBCONN.clientes.DDD_FONE1'
      Size = 4
    end
    object qrListaClientesNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'DBCONN.clientes.NUMERO_FONE1'
      Size = 15
    end
    object qrListaClientesCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'DBCONN.clientes.COMPL_FONE1'
      Size = 10
    end
    object qrListaClientesDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Origin = 'DBCONN.clientes.DDD_FONE2'
      Size = 4
    end
    object qrListaClientesNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'DBCONN.clientes.NUMERO_FONE2'
      Size = 15
    end
    object qrListaClientesCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'DBCONN.clientes.COMPL_FONE2'
      Size = 10
    end
    object qrListaClientesDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Origin = 'DBCONN.clientes.DDD_FONE3'
      Size = 4
    end
    object qrListaClientesNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'DBCONN.clientes.NUMERO_FONE3'
      Size = 15
    end
    object qrListaClientesCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'DBCONN.clientes.COMPL_FONE3'
      Size = 10
    end
    object qrListaClientesDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'DBCONN.clientes.DDD_CELULAR'
      Size = 4
    end
    object qrListaClientesNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'DBCONN.clientes.NUMERO_CELULAR'
      Size = 15
    end
    object qrListaClientesCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'DBCONN.clientes.COMPL_CELULAR'
      Size = 10
    end
    object qrListaClientesDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Origin = 'DBCONN.clientes.DDD_FAX'
      Size = 4
    end
    object qrListaClientesNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'DBCONN.clientes.NUMERO_FAX'
      Size = 15
    end
    object qrListaClientesCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Origin = 'DBCONN.clientes.COMPL_FAX'
      Size = 10
    end
    object qrListaClientesE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'DBCONN.clientes.E_MAIL'
      Size = 100
    end
    object qrListaClientesWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Origin = 'DBCONN.clientes.WEB_SITE'
      Size = 100
    end
    object qrListaClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DBCONN.clientes.CONTATO'
      Size = 50
    end
    object qrListaClientesPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'DBCONN.clientes.PAIS'
    end
    object qrListaClientesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN.clientes.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaClientesREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'DBCONN.clientes.REVENDA'
      Size = 1
    end
    object qrListaClientesBIRO: TStringField
      FieldName = 'BIRO'
      Origin = 'DBCONN.clientes.BIRO'
      Size = 1
    end
    object qrListaClientesCAPITAL_ATUAL: TBCDField
      FieldName = 'CAPITAL_ATUAL'
      Origin = 'DBCONN.clientes.CAPITAL_ATUAL'
      Precision = 9
      Size = 2
    end
    object qrListaClientesNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'DBCONN.clientes.NOME_FANTASIA'
      Size = 50
    end
    object qrListaClientesRAMO_ATIVIDADE_SQ: TIntegerField
      FieldName = 'RAMO_ATIVIDADE_SQ'
      Origin = 'DBCONN.clientes.RAMO_ATIVIDADE_SQ'
    end
    object qrListaClientesFATURAMENTO_MENSAL: TBCDField
      FieldName = 'FATURAMENTO_MENSAL'
      Origin = 'DBCONN.clientes.FATURAMENTO_MENSAL'
      Precision = 9
      Size = 2
    end
    object qrListaClientesDATA_FUNDACAO: TDateTimeField
      FieldName = 'DATA_FUNDACAO'
      Origin = 'DBCONN.clientes.DATA_FUNDACAO'
    end
    object qrListaClientesINSCR_MUNICIPAL: TStringField
      FieldName = 'INSCR_MUNICIPAL'
      Origin = 'DBCONN.clientes.INSCR_MUNICIPAL'
    end
    object qrListaClientesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DBCONN.clientes.DATA_CADASTRO'
    end
    object qrListaClientesDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      Origin = 'DBCONN.clientes.DATA_ALT'
    end
    object qrListaClientesUSUARIO_SQ_ALT: TIntegerField
      FieldName = 'USUARIO_SQ_ALT'
      Origin = 'DBCONN.clientes.USUARIO_SQ_ALT'
    end
    object qrListaClientesTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.clientes.TRANSPORTADORA_SQ'
    end
    object qrListaClientesCLASSIFICACAO_SQ: TIntegerField
      FieldName = 'CLASSIFICACAO_SQ'
      Origin = 'DBCONN.clientes.CLASSIFICACAO_SQ'
    end
  end
  object qrListaCondPagto: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM COND_PAGTO')
    Left = 72
    Top = 80
    object qrListaCondPagtoCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'DBCONN.cond_pagto.COND_PAGTO_SQ'
    end
    object qrListaCondPagtoCODIGO_COND_PAGTO: TIntegerField
      FieldName = 'CODIGO_COND_PAGTO'
      Origin = 'DBCONN.cond_pagto.CODIGO_COND_PAGTO'
    end
    object qrListaCondPagtoDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Origin = 'DBCONN.cond_pagto.DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object qrListaCondPagtoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'DBCONN.cond_pagto.PARCELAS'
    end
    object qrListaCondPagtoD00: TIntegerField
      FieldName = 'D00'
      Origin = 'DBCONN.cond_pagto.D00'
    end
    object qrListaCondPagtoD01: TIntegerField
      FieldName = 'D01'
      Origin = 'DBCONN.cond_pagto.D01'
    end
    object qrListaCondPagtoD02: TIntegerField
      FieldName = 'D02'
      Origin = 'DBCONN.cond_pagto.D02'
    end
    object qrListaCondPagtoD03: TIntegerField
      FieldName = 'D03'
      Origin = 'DBCONN.cond_pagto.D03'
    end
    object qrListaCondPagtoD04: TIntegerField
      FieldName = 'D04'
      Origin = 'DBCONN.cond_pagto.D04'
    end
    object qrListaCondPagtoD05: TIntegerField
      FieldName = 'D05'
      Origin = 'DBCONN.cond_pagto.D05'
    end
    object qrListaCondPagtoD06: TIntegerField
      FieldName = 'D06'
      Origin = 'DBCONN.cond_pagto.D06'
    end
    object qrListaCondPagtoD07: TIntegerField
      FieldName = 'D07'
      Origin = 'DBCONN.cond_pagto.D07'
    end
    object qrListaCondPagtoD08: TIntegerField
      FieldName = 'D08'
      Origin = 'DBCONN.cond_pagto.D08'
    end
    object qrListaCondPagtoD09: TIntegerField
      FieldName = 'D09'
      Origin = 'DBCONN.cond_pagto.D09'
    end
  end
  object qrListaNaturezas: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM NATUREZAS')
    Left = 72
    Top = 128
    object qrListaNaturezasNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'DBCONN.naturezas.NATUREZA_SQ'
    end
    object qrListaNaturezasCODIGO_NATUREZA: TIntegerField
      FieldName = 'CODIGO_NATUREZA'
      Origin = 'DBCONN.naturezas.CODIGO_NATUREZA'
    end
    object qrListaNaturezasDESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'DBCONN.naturezas.DESCRICAO_NATUREZA'
      Size = 50
    end
    object qrListaNaturezasCFO: TStringField
      FieldName = 'CFO'
      Origin = 'DBCONN.naturezas.CFO'
      Size = 4
    end
    object qrListaNaturezasALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'DBCONN.naturezas.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object qrListaNaturezasALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'DBCONN.naturezas.ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object qrListaNaturezasENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Origin = 'DBCONN.naturezas.ENT_SAI'
      Size = 1
    end
    object qrListaNaturezasOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN.naturezas.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaNaturezasUF01: TStringField
      FieldName = 'UF01'
      Origin = 'DBCONN.naturezas.UF01'
      Size = 2
    end
    object qrListaNaturezasUF02: TStringField
      FieldName = 'UF02'
      Origin = 'DBCONN.naturezas.UF02'
      Size = 2
    end
    object qrListaNaturezasUF03: TStringField
      FieldName = 'UF03'
      Origin = 'DBCONN.naturezas.UF03'
      Size = 2
    end
    object qrListaNaturezasUF04: TStringField
      FieldName = 'UF04'
      Origin = 'DBCONN.naturezas.UF04'
      Size = 2
    end
    object qrListaNaturezasUF05: TStringField
      FieldName = 'UF05'
      Origin = 'DBCONN.naturezas.UF05'
      Size = 2
    end
    object qrListaNaturezasUF06: TStringField
      FieldName = 'UF06'
      Origin = 'DBCONN.naturezas.UF06'
      Size = 2
    end
    object qrListaNaturezasUF07: TStringField
      FieldName = 'UF07'
      Origin = 'DBCONN.naturezas.UF07'
      Size = 2
    end
    object qrListaNaturezasUF08: TStringField
      FieldName = 'UF08'
      Origin = 'DBCONN.naturezas.UF08'
      Size = 2
    end
    object qrListaNaturezasUF09: TStringField
      FieldName = 'UF09'
      Origin = 'DBCONN.naturezas.UF09'
      Size = 2
    end
    object qrListaNaturezasUF10: TStringField
      FieldName = 'UF10'
      Origin = 'DBCONN.naturezas.UF10'
      Size = 2
    end
    object qrListaNaturezasUF11: TStringField
      FieldName = 'UF11'
      Origin = 'DBCONN.naturezas.UF11'
      Size = 2
    end
    object qrListaNaturezasUF12: TStringField
      FieldName = 'UF12'
      Origin = 'DBCONN.naturezas.UF12'
      Size = 2
    end
    object qrListaNaturezasUF13: TStringField
      FieldName = 'UF13'
      Origin = 'DBCONN.naturezas.UF13'
      Size = 2
    end
    object qrListaNaturezasUF14: TStringField
      FieldName = 'UF14'
      Origin = 'DBCONN.naturezas.UF14'
      Size = 2
    end
    object qrListaNaturezasUF15: TStringField
      FieldName = 'UF15'
      Origin = 'DBCONN.naturezas.UF15'
      Size = 2
    end
    object qrListaNaturezasUF16: TStringField
      FieldName = 'UF16'
      Origin = 'DBCONN.naturezas.UF16'
      Size = 2
    end
    object qrListaNaturezasUF17: TStringField
      FieldName = 'UF17'
      Origin = 'DBCONN.naturezas.UF17'
      Size = 2
    end
    object qrListaNaturezasUF18: TStringField
      FieldName = 'UF18'
      Origin = 'DBCONN.naturezas.UF18'
      Size = 2
    end
    object qrListaNaturezasUF19: TStringField
      FieldName = 'UF19'
      Origin = 'DBCONN.naturezas.UF19'
      Size = 2
    end
    object qrListaNaturezasUF20: TStringField
      FieldName = 'UF20'
      Origin = 'DBCONN.naturezas.UF20'
      Size = 2
    end
    object qrListaNaturezasUF21: TStringField
      FieldName = 'UF21'
      Origin = 'DBCONN.naturezas.UF21'
      Size = 2
    end
    object qrListaNaturezasUF22: TStringField
      FieldName = 'UF22'
      Origin = 'DBCONN.naturezas.UF22'
      Size = 2
    end
    object qrListaNaturezasUF23: TStringField
      FieldName = 'UF23'
      Origin = 'DBCONN.naturezas.UF23'
      Size = 2
    end
    object qrListaNaturezasUF24: TStringField
      FieldName = 'UF24'
      Origin = 'DBCONN.naturezas.UF24'
      Size = 2
    end
    object qrListaNaturezasUF25: TStringField
      FieldName = 'UF25'
      Origin = 'DBCONN.naturezas.UF25'
      Size = 2
    end
    object qrListaNaturezasUF26: TStringField
      FieldName = 'UF26'
      Origin = 'DBCONN.naturezas.UF26'
      Size = 2
    end
    object qrListaNaturezasUF27: TStringField
      FieldName = 'UF27'
      Origin = 'DBCONN.naturezas.UF27'
      Size = 2
    end
    object qrListaNaturezasUF28: TStringField
      FieldName = 'UF28'
      Origin = 'DBCONN.naturezas.UF28'
      Size = 2
    end
    object qrListaNaturezasUF29: TStringField
      FieldName = 'UF29'
      Origin = 'DBCONN.naturezas.UF29'
      Size = 2
    end
    object qrListaNaturezasUF30: TStringField
      FieldName = 'UF30'
      Origin = 'DBCONN.naturezas.UF30'
      Size = 2
    end
    object qrListaNaturezasISENCAO_IPI: TStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'DBCONN.naturezas.ISENCAO_IPI'
      Size = 1
    end
    object qrListaNaturezasISENCAO_ICMS: TStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'DBCONN.naturezas.ISENCAO_ICMS'
      Size = 1
    end
    object qrListaNaturezasDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Origin = 'DBCONN.naturezas.DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object qrListaNaturezasTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
      Origin = 'DBCONN.naturezas.TIPO_NFISCAL'
    end
  end
  object qrListaPecas: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT P.*, DESCRICAO_MODELO, CODIGO_NBM, ALIQ_ICMS, ALIQ_IPI'
      'FROM PECAS P'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'LEFT OUTER JOIN MODELOS M ON (M.MODELO_SQ = P.MODELO_SQ)')
    Left = 72
    Top = 176
    object qrListaPecasPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrListaPecasCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrListaPecasDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object qrListaPecasQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object qrListaPecasQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object qrListaPecasQTDE_PECA_DEMO: TIntegerField
      FieldName = 'QTDE_PECA_DEMO'
    end
    object qrListaPecasQTDE_PECA_DEFEITO: TIntegerField
      FieldName = 'QTDE_PECA_DEFEITO'
    end
    object qrListaPecasQTDE_PECA_EM_USO: TIntegerField
      FieldName = 'QTDE_PECA_EM_USO'
    end
    object qrListaPecasQTDE_PECA_BACKUP: TIntegerField
      FieldName = 'QTDE_PECA_BACKUP'
    end
    object qrListaPecasQTDE_PECA_DEMO_CLI: TIntegerField
      FieldName = 'QTDE_PECA_DEMO_CLI'
    end
    object qrListaPecasQTDE_PECA_HLC: TIntegerField
      FieldName = 'QTDE_PECA_HLC'
    end
    object qrListaPecasNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object qrListaPecasMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object qrListaPecasUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Size = 2
    end
    object qrListaPecasMARCA_PECA: TStringField
      FieldName = 'MARCA_PECA'
    end
    object qrListaPecasPRECO_UNIT_PECA: TBCDField
      FieldName = 'PRECO_UNIT_PECA'
      Precision = 9
      Size = 2
    end
    object qrListaPecasTIPO_PECA: TIntegerField
      FieldName = 'TIPO_PECA'
    end
    object qrListaPecasDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object qrListaPecasCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object qrListaPecasALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object qrListaPecasALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object qrListaNBM: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM NBM')
    Left = 72
    Top = 224
    object qrListaNBMNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'DBCONN.nbm.NBM_SQ'
    end
    object qrListaNBMCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'DBCONN.nbm.CODIGO_NBM'
      Size = 10
    end
    object qrListaNBMALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'DBCONN.nbm.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object qrListaNBMALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'DBCONN.nbm.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object qrListaPedidos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT P.*, N.NUMERO_NFISCAL '
      'FROM PEDIDOS P'
      'LEFT OUTER JOIN NFISCAIS N ON (N.NFISCAL_SQ = P.NFISCAL_SQ)')
    Left = 72
    Top = 272
    object qrListaPedidosPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'DBCONN.pedidos.PEDIDO_SQ'
    end
    object qrListaPedidosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.pedidos.CLIENTE_SQ'
    end
    object qrListaPedidosDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
      Origin = 'DBCONN.pedidos.DATA_PEDIDO'
    end
    object qrListaPedidosCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'DBCONN.pedidos.COND_PAGTO_SQ'
    end
    object qrListaPedidosNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'DBCONN.pedidos.NATUREZA_SQ'
    end
    object qrListaPedidosCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'DBCONN.pedidos.COTACAO_DOLAR'
      Precision = 9
    end
    object qrListaPedidosOBSERVACAO_PED: TMemoField
      FieldName = 'OBSERVACAO_PED'
      Origin = 'DBCONN.pedidos.OBSERVACAO_PED'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaPedidosOBSERVACAO_NF: TMemoField
      FieldName = 'OBSERVACAO_NF'
      Origin = 'DBCONN.pedidos.OBSERVACAO_NF'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaPedidosTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.pedidos.TRANSPORTADORA_SQ'
    end
    object qrListaPedidosVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'DBCONN.pedidos.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'DBCONN.pedidos.FRETE_TRANSP'
      Size = 1
    end
    object qrListaPedidosNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DBCONN.pedidos.NFISCAL_SQ'
    end
    object qrListaPedidosVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Origin = 'DBCONN.pedidos.VLR_DESC'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosPCT_DESC: TBCDField
      FieldName = 'PCT_DESC'
      Origin = 'DBCONN.pedidos.PCT_DESC'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'DBCONN.pedidos.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Origin = 'DBCONN.pedidos.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'DBCONN.pedidos.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'DBCONN.pedidos.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
      Origin = 'DBCONN.pedidos.NUMERO_PEDIDO'
    end
    object qrListaPedidosDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'DBCONN.pedidos.DIAS_DEMONSTRACAO'
    end
    object qrListaPedidosPCT_JUROS: TBCDField
      FieldName = 'PCT_JUROS'
      Origin = 'DBCONN.pedidos.PCT_JUROS'
      Precision = 2
      Size = 2
    end
    object qrListaPedidosVLR_JUROS: TBCDField
      FieldName = 'VLR_JUROS'
      Origin = 'DBCONN.pedidos.VLR_JUROS'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
      Origin = 'DBCONN.pedidos.VENDEDOR_SQ'
    end
    object qrListaPedidosNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'DBCONN.nfiscais.NUMERO_NFISCAL'
    end
  end
  object qrListaPedidosItens: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    DataSource = dsListaPedidos
    SQL.Strings = (
      
        'SELECT PI.*, P.CODIGO_PECA, P.DESCRICAO_PECA, P.QTDE_PECA_LOJA, ' +
        'P.QTDE_PECA_ARMAZEM, N.CODIGO_NBM'
      'FROM PEDIDOS_ITENS PI'
      'LEFT OUTER JOIN PECAS P ON (P.PECA_SQ = PI.PECA_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'WHERE PI.PEDIDO_SQ = :PEDIDO_SQ')
    Left = 72
    Top = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object qrListaPedidosItensPEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
    end
    object qrListaPedidosItensPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object qrListaPedidosItensTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object qrListaPedidosItensPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrListaPedidosItensMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object qrListaPedidosItensQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
    end
    object qrListaPedidosItensNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaPedidosItensPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosItensVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosItensPCT_DESC: TBCDField
      FieldName = 'PCT_DESC'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosItensALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object qrListaPedidosItensALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object qrListaPedidosItensVLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosItensVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosItensVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaPedidosItensCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrListaPedidosItensDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object qrListaPedidosItensQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object qrListaPedidosItensQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object qrListaPedidosItensCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object qrListaUsuarios: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 72
    Top = 368
    object qrListaUsuariosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.usuarios.USUARIO_SQ'
    end
    object qrListaUsuariosCODIGO_USUARIO: TStringField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'DBCONN.usuarios.CODIGO_USUARIO'
    end
    object qrListaUsuariosNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'DBCONN.usuarios.NOME_USUARIO'
      Size = 50
    end
    object qrListaUsuariosSENHA_USUARIO: TStringField
      FieldName = 'SENHA_USUARIO'
      Origin = 'DBCONN.usuarios.SENHA_USUARIO'
      Size = 50
    end
    object qrListaUsuariosERRO_EMAIL_FROM: TStringField
      FieldName = 'ERRO_EMAIL_FROM'
      Origin = 'DBCONN.usuarios.ERRO_EMAIL_FROM'
      Size = 50
    end
    object qrListaUsuariosERRO_NOME_FROM: TStringField
      FieldName = 'ERRO_NOME_FROM'
      Origin = 'DBCONN.usuarios.ERRO_NOME_FROM'
      Size = 50
    end
    object qrListaUsuariosERRO_EMAIL_TO: TStringField
      FieldName = 'ERRO_EMAIL_TO'
      Origin = 'DBCONN.usuarios.ERRO_EMAIL_TO'
      Size = 50
    end
    object qrListaUsuariosERRO_NOME_TO: TStringField
      FieldName = 'ERRO_NOME_TO'
      Origin = 'DBCONN.usuarios.ERRO_NOME_TO'
      Size = 50
    end
    object qrListaUsuariosERRO_SMTP: TStringField
      FieldName = 'ERRO_SMTP'
      Origin = 'DBCONN.usuarios.ERRO_SMTP'
      Size = 50
    end
    object qrListaUsuariosERRO_USERNAME: TStringField
      FieldName = 'ERRO_USERNAME'
      Origin = 'DBCONN.usuarios.ERRO_USERNAME'
      Size = 50
    end
    object qrListaUsuariosERRO_PASSWORD: TStringField
      FieldName = 'ERRO_PASSWORD'
      Origin = 'DBCONN.usuarios.ERRO_PASSWORD'
      Size = 50
    end
  end
  object qrListaVendedores: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM VENDEDORES')
    Left = 72
    Top = 416
    object qrListaVendedoresVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
      Origin = 'DBCONN.vendedores.VENDEDOR_SQ'
    end
    object qrListaVendedoresCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'DBCONN.vendedores.CODIGO_VENDEDOR'
    end
    object qrListaVendedoresNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = 'DBCONN.vendedores.NOME_VENDEDOR'
      Size = 100
    end
  end
  object qrListaAcessos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM ACESSOS')
    Left = 72
    Top = 464
    object qrListaAcessosACESSO_SQ: TIntegerField
      FieldName = 'ACESSO_SQ'
      Origin = 'DBCONN.acessos.ACESSO_SQ'
    end
    object qrListaAcessosNOME_PROGRAMA: TStringField
      FieldName = 'NOME_PROGRAMA'
      Origin = 'DBCONN.acessos.NOME_PROGRAMA'
      Size = 100
    end
    object qrListaAcessosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.acessos.USUARIO_SQ'
    end
    object qrListaAcessosVISUALIZAR: TStringField
      FieldName = 'VISUALIZAR'
      Origin = 'DBCONN.acessos.VISUALIZAR'
      Size = 1
    end
    object qrListaAcessosCRIAR: TStringField
      FieldName = 'CRIAR'
      Origin = 'DBCONN.acessos.CRIAR'
      Size = 1
    end
    object qrListaAcessosEDITAR: TStringField
      FieldName = 'EDITAR'
      Origin = 'DBCONN.acessos.EDITAR'
      Size = 1
    end
    object qrListaAcessosAPAGAR: TStringField
      FieldName = 'APAGAR'
      Origin = 'DBCONN.acessos.APAGAR'
      Size = 1
    end
  end
  object qrListaTransportadoras: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM TRANSPORTADORAS')
    Left = 272
    Top = 32
    object qrListaTransportadorasTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.transportadoras.TRANSPORTADORA_SQ'
    end
    object qrListaTransportadorasCODIGO_TRANSPORTADORA: TStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object qrListaTransportadorasNOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.NOME_TRANSPORTADORA'
      Size = 50
    end
    object qrListaTransportadorasENDERECO_TRANSPORTADORA: TStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object qrListaTransportadorasMUNICIPIO_TRANSPORTADORA: TStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object qrListaTransportadorasESTADO_TRANSPORTADORA: TStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object qrListaTransportadorasINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN.transportadoras.INSCR_ESTADUAL'
    end
    object qrListaTransportadorasDDD_FONE: TStringField
      FieldName = 'DDD_FONE'
      Origin = 'DBCONN.transportadoras.DDD_FONE'
      Size = 4
    end
    object qrListaTransportadorasNUMERO_FONE: TStringField
      FieldName = 'NUMERO_FONE'
      Origin = 'DBCONN.transportadoras.NUMERO_FONE'
      Size = 15
    end
    object qrListaTransportadorasCOMPL_FONE: TStringField
      FieldName = 'COMPL_FONE'
      Origin = 'DBCONN.transportadoras.COMPL_FONE'
      Size = 10
    end
  end
  object qrListaNfiscaisTotais: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT MAX(DTEMISSAO_NFISCAL) as ULTIMA_VENDA'
      '     , MIN(DTEMISSAO_NFISCAL) as PRIMEIRA_VENDA'
      '     , MAX(VLR_TOTAL) as MAIOR_VENDA'
      '     , MIN(VLR_TOTAL) as MENOR_VENDA'
      '     , SUM(VLR_TOTAL) as TOTAL_VENDA'
      'FROM NFISCAIS N'
      'WHERE N.CLIENTE_SQ = :CLIENTE_SQ')
    Left = 272
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CLIENTE_SQ'
        ParamType = ptUnknown
      end>
    object qrListaNfiscaisTotaisULTIMA_VENDA: TDateTimeField
      FieldName = 'ULTIMA_VENDA'
      Origin = 'DBCONN.nfiscais.DTEMISSAO_NFISCAL'
    end
    object qrListaNfiscaisTotaisPRIMEIRA_VENDA: TDateTimeField
      FieldName = 'PRIMEIRA_VENDA'
      Origin = 'DBCONN.nfiscais.DTEMISSAO_NFISCAL'
    end
    object qrListaNfiscaisTotaisMAIOR_VENDA: TBCDField
      FieldName = 'MAIOR_VENDA'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisTotaisMENOR_VENDA: TBCDField
      FieldName = 'MENOR_VENDA'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisTotaisTOTAL_VENDA: TBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 31
      Size = 2
    end
  end
  object qrListaNfiscais: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM NFISCAIS')
    Left = 272
    Top = 128
    object qrListaNfiscaisNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DBCONN.nfiscais.NFISCAL_SQ'
    end
    object qrListaNfiscaisNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'DBCONN.nfiscais.NUMERO_NFISCAL'
    end
    object qrListaNfiscaisDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'DBCONN.nfiscais.DTEMISSAO_NFISCAL'
    end
    object qrListaNfiscaisDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
      Origin = 'DBCONN.nfiscais.DTSAIDA_NFISCAL'
    end
    object qrListaNfiscaisPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'DBCONN.nfiscais.PEDIDO_SQ'
    end
    object qrListaNfiscaisCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.nfiscais.CLIENTE_SQ'
    end
    object qrListaNfiscaisCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'DBCONN.nfiscais.COND_PAGTO_SQ'
    end
    object qrListaNfiscaisNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'DBCONN.nfiscais.NATUREZA_SQ'
    end
    object qrListaNfiscaisTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.nfiscais.TRANSPORTADORA_SQ'
    end
    object qrListaNfiscaisBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'DBCONN.nfiscais.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'DBCONN.nfiscais.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisBASE_ICMS_SUBST: TBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = 'DBCONN.nfiscais.BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_ICMS_SUBST: TBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Origin = 'DBCONN.nfiscais.VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'DBCONN.nfiscais.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'DBCONN.nfiscais.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Origin = 'DBCONN.nfiscais.VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_DESP_ACESS: TBCDField
      FieldName = 'VLR_DESP_ACESS'
      Origin = 'DBCONN.nfiscais.VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Origin = 'DBCONN.nfiscais.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'DBCONN.nfiscais.FRETE_TRANSP'
      Size = 1
    end
    object qrListaNfiscaisPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'DBCONN.nfiscais.PLACA_TRANSP'
      Size = 7
    end
    object qrListaNfiscaisUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'DBCONN.nfiscais.UF_PLACA_TRANSP'
      Size = 2
    end
    object qrListaNfiscaisQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
      Origin = 'DBCONN.nfiscais.QTDE_TRANSP'
    end
    object qrListaNfiscaisESPECIE_TRANSP: TStringField
      FieldName = 'ESPECIE_TRANSP'
      Origin = 'DBCONN.nfiscais.ESPECIE_TRANSP'
    end
    object qrListaNfiscaisMARCA_TRANSP: TStringField
      FieldName = 'MARCA_TRANSP'
      Origin = 'DBCONN.nfiscais.MARCA_TRANSP'
      Size = 30
    end
    object qrListaNfiscaisNUMERO_TRANSP: TStringField
      FieldName = 'NUMERO_TRANSP'
      Origin = 'DBCONN.nfiscais.NUMERO_TRANSP'
      Size = 10
    end
    object qrListaNfiscaisPBRUTO_TRANSP: TStringField
      FieldName = 'PBRUTO_TRANSP'
      Origin = 'DBCONN.nfiscais.PBRUTO_TRANSP'
    end
    object qrListaNfiscaisPLIQUIDO_TRANSP: TStringField
      FieldName = 'PLIQUIDO_TRANSP'
      Origin = 'DBCONN.nfiscais.PLIQUIDO_TRANSP'
    end
    object qrListaNfiscaisCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL1'
    end
    object qrListaNfiscaisCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL2'
    end
    object qrListaNfiscaisCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL3'
    end
    object qrListaNfiscaisCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL4'
    end
    object qrListaNfiscaisCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL5'
    end
    object qrListaNfiscaisCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL6'
    end
    object qrListaNfiscaisCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
      Origin = 'DBCONN.nfiscais.CLASS_FISCAL7'
    end
    object qrListaNfiscaisMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      Origin = 'DBCONN.nfiscais.MENSAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaNfiscaisCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'DBCONN.nfiscais.CANCELADA'
      Size = 1
    end
    object qrListaNfiscaisDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'DBCONN.nfiscais.DIAS_DEMONSTRACAO'
    end
    object qrListaNfiscaisCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'DBCONN.nfiscais.COTACAO_DOLAR'
      Precision = 9
    end
    object qrListaNfiscaisNR_NFISCAL_RETORNO: TIntegerField
      FieldName = 'NR_NFISCAL_RETORNO'
      Origin = 'DBCONN.nfiscais.NR_NFISCAL_RETORNO'
    end
    object qrListaNfiscaisDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
      Origin = 'DBCONN.nfiscais.DT_NFISCAL_RETORNO'
    end
    object qrListaNfiscaisCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      Origin = 'DBCONN.nfiscais.CONCLUIDA'
      Size = 1
    end
    object qrListaNfiscaisVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
      Origin = 'DBCONN.nfiscais.VENDEDOR_SQ'
    end
    object qrListaNfiscaisNF_MANUAL: TStringField
      FieldName = 'NF_MANUAL'
      Origin = 'DBCONN.nfiscais.NF_MANUAL'
      Size = 1
    end
    object qrListaNfiscaisRETORNO_PRODUTO: TStringField
      FieldName = 'RETORNO_PRODUTO'
      Origin = 'DBCONN.nfiscais.RETORNO_PRODUTO'
      Size = 1
    end
    object qrListaNfiscaisRETORNO_OBSERVACAO: TMemoField
      FieldName = 'RETORNO_OBSERVACAO'
      Origin = 'DBCONN.nfiscais.RETORNO_OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
  end
  object qrListaNfiscaisItens: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    DataSource = dsListaNfiscais
    SQL.Strings = (
      
        'SELECT NI.*, P.CODIGO_PECA, P.DESCRICAO_PECA, P.QTDE_PECA_LOJA, ' +
        'P.QTDE_PECA_ARMAZEM, N.CODIGO_NBM'
      'FROM NFISCAIS_ITENS NI'
      'LEFT OUTER JOIN PECAS P ON (P.PECA_SQ = NI.PECA_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'WHERE NI.NFISCAL_SQ = :NFISCAL_SQ')
    Left = 272
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object qrListaNfiscaisItensNFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
    end
    object qrListaNfiscaisItensNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object qrListaNfiscaisItensITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object qrListaNfiscaisItensTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object qrListaNfiscaisItensPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrListaNfiscaisItensMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object qrListaNfiscaisItensNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaNfiscaisItensCLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object qrListaNfiscaisItensSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object qrListaNfiscaisItensQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object qrListaNfiscaisItensVLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisItensVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisItensALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object qrListaNfiscaisItensALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object qrListaNfiscaisItensVLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisItensVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object qrListaNfiscaisItensCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrListaNfiscaisItensDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object qrListaNfiscaisItensQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object qrListaNfiscaisItensQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object qrListaNfiscaisItensCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object qrListaKardexPecas: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM KARDEX_PECAS')
    Left = 272
    Top = 224
    object qrListaKardexPecasKARDEX_PECA_SQ: TIntegerField
      FieldName = 'KARDEX_PECA_SQ'
      Origin = 'DBCONN.kardex_pecas.KARDEX_PECA_SQ'
    end
    object qrListaKardexPecasPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
      Origin = 'DBCONN.kardex_pecas.PECA_SQ'
    end
    object qrListaKardexPecasTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Origin = 'DBCONN.kardex_pecas.TIPO_MOV'
      Size = 1
    end
    object qrListaKardexPecasQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'DBCONN.kardex_pecas.QTDE'
    end
    object qrListaKardexPecasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'DBCONN.kardex_pecas.VALOR'
      Precision = 9
      Size = 2
    end
    object qrListaKardexPecasDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DBCONN.kardex_pecas.DATA'
    end
    object qrListaKardexPecasNFISCAL: TIntegerField
      FieldName = 'NFISCAL'
      Origin = 'DBCONN.kardex_pecas.NFISCAL'
    end
    object qrListaKardexPecasUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.kardex_pecas.USUARIO_SQ'
    end
    object qrListaKardexPecasNR_SERIE: TMemoField
      FieldName = 'NR_SERIE'
      Origin = 'DBCONN.kardex_pecas.NR_SERIE'
      BlobType = ftMemo
      Size = 1
    end
  end
  object qrListaDuplicatas: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM DUPLICATAS')
    Left = 272
    Top = 272
    object qrListaDuplicatasDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Origin = 'DBCONN.duplicatas.DUPLICATA_SQ'
    end
    object qrListaDuplicatasNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.NUMERO_DUPLICATA'
    end
    object qrListaDuplicatasITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Origin = 'DBCONN.duplicatas.ITEM_DUPLICATA'
    end
    object qrListaDuplicatasSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
      Origin = 'DBCONN.duplicatas.SEQ_DUPLICATA'
    end
    object qrListaDuplicatasNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DBCONN.duplicatas.NFISCAL_SQ'
    end
    object qrListaDuplicatasVALOR_DUPLICATA: TBCDField
      FieldName = 'VALOR_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object qrListaDuplicatasDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTEMISSAO_DUPLICATA'
    end
    object qrListaDuplicatasDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTVENCTO_DUPLICATA'
    end
    object qrListaDuplicatasDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTPGTO_DUPLICATA'
    end
    object qrListaDuplicatasVALORPG_DUPLICATA: TBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object qrListaModelos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM MODELOS'
      'ORDER BY DESCRICAO_MODELO')
    Left = 272
    Top = 320
    object qrListaModelosMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
      Origin = 'DBCONN.modelos.MODELO_SQ'
    end
    object qrListaModelosCODIGO_MODELO: TStringField
      FieldName = 'CODIGO_MODELO'
      Origin = 'DBCONN.modelos.CODIGO_MODELO'
      Size = 30
    end
    object qrListaModelosDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Origin = 'DBCONN.modelos.DESCRICAO_MODELO'
      Size = 200
    end
    object qrListaModelosNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'DBCONN.modelos.NBM_SQ'
    end
    object qrListaModelosUN_MODELO: TStringField
      FieldName = 'UN_MODELO'
      Origin = 'DBCONN.modelos.UN_MODELO'
      Size = 2
    end
    object qrListaModelosMARCA_MODELO: TStringField
      FieldName = 'MARCA_MODELO'
      Origin = 'DBCONN.modelos.MARCA_MODELO'
    end
    object qrListaModelosPRECO_UNIT_MODELO: TBCDField
      FieldName = 'PRECO_UNIT_MODELO'
      Origin = 'DBCONN.modelos.PRECO_UNIT_MODELO'
      Precision = 9
      Size = 2
    end
  end
  object qrListaAssistencias: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM ASSISTENCIAS')
    Left = 272
    Top = 368
    object qrListaAssistenciasASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
      Origin = 'DBCONN.assistencias.ASSISTENCIA_SQ'
    end
    object qrListaAssistenciasNUMERO_ASSISTENCIA: TIntegerField
      FieldName = 'NUMERO_ASSISTENCIA'
      Origin = 'DBCONN.assistencias.NUMERO_ASSISTENCIA'
    end
    object qrListaAssistenciasDATA_CHAMADO: TDateTimeField
      FieldName = 'DATA_CHAMADO'
      Origin = 'DBCONN.assistencias.DATA_CHAMADO'
    end
    object qrListaAssistenciasDATA_ASSISTENCIA: TDateTimeField
      FieldName = 'DATA_ASSISTENCIA'
      Origin = 'DBCONN.assistencias.DATA_ASSISTENCIA'
    end
    object qrListaAssistenciasCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'DBCONN.assistencias.COTACAO_DOLAR'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.assistencias.CLIENTE_SQ'
    end
    object qrListaAssistenciasCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'DBCONN.assistencias.COND_PAGTO_SQ'
    end
    object qrListaAssistenciasDESP_CHAMADO: TBCDField
      FieldName = 'DESP_CHAMADO'
      Origin = 'DBCONN.assistencias.DESP_CHAMADO'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasDESP_HTEC_AD: TBCDField
      FieldName = 'DESP_HTEC_AD'
      Origin = 'DBCONN.assistencias.DESP_HTEC_AD'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasDESP_DESLOC: TBCDField
      FieldName = 'DESP_DESLOC'
      Origin = 'DBCONN.assistencias.DESP_DESLOC'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasVLR_PECAS: TBCDField
      FieldName = 'VLR_PECAS'
      Origin = 'DBCONN.assistencias.VLR_PECAS'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'DBCONN.assistencias.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'DBCONN.assistencias.HORA_INICIO'
    end
    object qrListaAssistenciasHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
      Origin = 'DBCONN.assistencias.HORA_FIM'
    end
    object qrListaAssistenciasGARANTIA: TStringField
      FieldName = 'GARANTIA'
      Origin = 'DBCONN.assistencias.GARANTIA'
      Size = 1
    end
    object qrListaAssistenciasCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Origin = 'DBCONN.assistencias.CONTRATO'
      Size = 1
    end
    object qrListaAssistenciasSERVICOS: TMemoField
      FieldName = 'SERVICOS'
      Origin = 'DBCONN.assistencias.SERVICOS'
      BlobType = ftMemo
      Size = 1
    end
  end
  object qrListaAssistenciasEquip: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    DataSource = dsListaAssistencias
    SQL.Strings = (
      'SELECT AE.*, M.DESCRICAO_MODELO'
      'FROM ASSISTENCIAS_EQUIPS AE'
      'LEFT OUTER JOIN MODELOS M ON (M.MODELO_SQ = AE.MODELO_SQ)'
      'WHERE ASSISTENCIA_SQ = :ASSISTENCIA_SQ')
    Left = 272
    Top = 416
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object qrListaAssistenciasEquipASSISTENCIA_EQUIP_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_EQUIP_SQ'
      Origin = 'DBCONN.assistencias_equips.ASSISTENCIA_EQUIP_SQ'
    end
    object qrListaAssistenciasEquipASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
      Origin = 'DBCONN.assistencias_equips.ASSISTENCIA_SQ'
    end
    object qrListaAssistenciasEquipMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
      Origin = 'DBCONN.assistencias_equips.MODELO_SQ'
    end
    object qrListaAssistenciasEquipNR_SERIE_EQUIP: TMemoField
      FieldName = 'NR_SERIE_EQUIP'
      Origin = 'DBCONN.assistencias_equips.NR_SERIE_EQUIP'
      BlobType = ftMemo
      Size = 1
    end
    object qrListaAssistenciasEquipDEFEITO: TBlobField
      FieldName = 'DEFEITO'
      Origin = 'DBCONN.assistencias_equips.DEFEITO'
      Size = 1
    end
    object qrListaAssistenciasEquipDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Origin = 'DBCONN.modelos.DESCRICAO_MODELO'
      Size = 200
    end
  end
  object qrListaAssistenciasItens: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    DataSource = dsListaAssistencias
    SQL.Strings = (
      'SELECT AI.*, P.DESCRICAO_PECA'
      'FROM ASSISTENCIAS_ITENS AI'
      'LEFT OUTER JOIN PECAS P ON (P.PECA_SQ = AI.PECA_SQ)'
      'WHERE ASSISTENCIA_SQ = :ASSISTENCIA_SQ')
    Left = 272
    Top = 464
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object qrListaAssistenciasItensASSISTENCIA_ITEM_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_ITEM_SQ'
      Origin = 'DBCONN.assistencias_itens.ASSISTENCIA_ITEM_SQ'
    end
    object qrListaAssistenciasItensASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
      Origin = 'DBCONN.assistencias_itens.ASSISTENCIA_SQ'
    end
    object qrListaAssistenciasItensPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
      Origin = 'DBCONN.assistencias_itens.PECA_SQ'
    end
    object qrListaAssistenciasItensQTDE_ASSISTENCIA_ITEM: TIntegerField
      FieldName = 'QTDE_ASSISTENCIA_ITEM'
      Origin = 'DBCONN.assistencias_itens.QTDE_ASSISTENCIA_ITEM'
    end
    object qrListaAssistenciasItensPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'DBCONN.assistencias_itens.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object qrListaAssistenciasItensDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Origin = 'DBCONN.pecas.DESCRICAO_PECA'
      Size = 50
    end
  end
  object qrBuscaPecas: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM PECAS')
    Left = 528
    Top = 264
    object qrBuscaPecasPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
      Origin = 'DBCONN.pecas.PECA_SQ'
    end
    object qrBuscaPecasCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
      Origin = 'DBCONN.pecas.CODIGO_PECA'
    end
    object qrBuscaPecasDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Origin = 'DBCONN.pecas.DESCRICAO_PECA'
      Size = 50
    end
    object qrBuscaPecasQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
      Origin = 'DBCONN.pecas.QTDE_PECA_LOJA'
    end
    object qrBuscaPecasQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
      Origin = 'DBCONN.pecas.QTDE_PECA_ARMAZEM'
    end
    object qrBuscaPecasQTDE_PECA_DEMO: TIntegerField
      FieldName = 'QTDE_PECA_DEMO'
      Origin = 'DBCONN.pecas.QTDE_PECA_DEMO'
    end
    object qrBuscaPecasQTDE_PECA_DEFEITO: TIntegerField
      FieldName = 'QTDE_PECA_DEFEITO'
      Origin = 'DBCONN.pecas.QTDE_PECA_DEFEITO'
    end
    object qrBuscaPecasQTDE_PECA_EM_USO: TIntegerField
      FieldName = 'QTDE_PECA_EM_USO'
      Origin = 'DBCONN.pecas.QTDE_PECA_EM_USO'
    end
    object qrBuscaPecasQTDE_PECA_BACKUP: TIntegerField
      FieldName = 'QTDE_PECA_BACKUP'
      Origin = 'DBCONN.pecas.QTDE_PECA_BACKUP'
    end
    object qrBuscaPecasQTDE_PECA_DEMO_CLI: TIntegerField
      FieldName = 'QTDE_PECA_DEMO_CLI'
      Origin = 'DBCONN.pecas.QTDE_PECA_DEMO_CLI'
    end
    object qrBuscaPecasQTDE_PECA_HLC: TIntegerField
      FieldName = 'QTDE_PECA_HLC'
      Origin = 'DBCONN.pecas.QTDE_PECA_HLC'
    end
    object qrBuscaPecasNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'DBCONN.pecas.NBM_SQ'
    end
    object qrBuscaPecasMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
      Origin = 'DBCONN.pecas.MODELO_SQ'
    end
    object qrBuscaPecasUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Origin = 'DBCONN.pecas.UN_PECA'
      Size = 2
    end
    object qrBuscaPecasMARCA_PECA: TStringField
      FieldName = 'MARCA_PECA'
      Origin = 'DBCONN.pecas.MARCA_PECA'
    end
    object qrBuscaPecasPRECO_UNIT_PECA: TBCDField
      FieldName = 'PRECO_UNIT_PECA'
      Origin = 'DBCONN.pecas.PRECO_UNIT_PECA'
      Precision = 9
      Size = 2
    end
    object qrBuscaPecasTIPO_PECA: TIntegerField
      FieldName = 'TIPO_PECA'
      Origin = 'DBCONN.pecas.TIPO_PECA'
    end
  end
  object qrBuscaClientes: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 528
    Top = 312
    object qrBuscaClientescliente_sq: TIntegerField
      FieldName = 'cliente_sq'
      Origin = 'DBCONN.clientes.cliente_sq'
    end
    object qrBuscaClientesCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'DBCONN.clientes.CODIGO_CLIENTE'
      Size = 15
    end
    object qrBuscaClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Size = 50
    end
    object qrBuscaClientesINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN.clientes.INSCR_ESTADUAL'
    end
    object qrBuscaClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DBCONN.clientes.ENDERECO'
      Size = 50
    end
    object qrBuscaClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'DBCONN.clientes.NUMERO'
    end
    object qrBuscaClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'DBCONN.clientes.BAIRRO'
      Size = 30
    end
    object qrBuscaClientesCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'DBCONN.clientes.COMPL_ENDERECO'
      Size = 50
    end
    object qrBuscaClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCONN.clientes.CIDADE'
      Size = 30
    end
    object qrBuscaClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'DBCONN.clientes.ESTADO'
      FixedChar = True
      Size = 2
    end
    object qrBuscaClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCONN.clientes.CEP'
      Size = 8
    end
    object qrBuscaClientesDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'DBCONN.clientes.DDD_FONE1'
      Size = 4
    end
    object qrBuscaClientesNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'DBCONN.clientes.NUMERO_FONE1'
      Size = 15
    end
    object qrBuscaClientesCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'DBCONN.clientes.COMPL_FONE1'
      Size = 10
    end
    object qrBuscaClientesDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Origin = 'DBCONN.clientes.DDD_FONE2'
      Size = 4
    end
    object qrBuscaClientesNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'DBCONN.clientes.NUMERO_FONE2'
      Size = 15
    end
    object qrBuscaClientesCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'DBCONN.clientes.COMPL_FONE2'
      Size = 10
    end
    object qrBuscaClientesDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Origin = 'DBCONN.clientes.DDD_FONE3'
      Size = 4
    end
    object qrBuscaClientesNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'DBCONN.clientes.NUMERO_FONE3'
      Size = 15
    end
    object qrBuscaClientesCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'DBCONN.clientes.COMPL_FONE3'
      Size = 10
    end
    object qrBuscaClientesDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'DBCONN.clientes.DDD_CELULAR'
      Size = 4
    end
    object qrBuscaClientesNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'DBCONN.clientes.NUMERO_CELULAR'
      Size = 15
    end
    object qrBuscaClientesCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'DBCONN.clientes.COMPL_CELULAR'
      Size = 10
    end
    object qrBuscaClientesDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Origin = 'DBCONN.clientes.DDD_FAX'
      Size = 4
    end
    object qrBuscaClientesNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'DBCONN.clientes.NUMERO_FAX'
      Size = 15
    end
    object qrBuscaClientesCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Origin = 'DBCONN.clientes.COMPL_FAX'
      Size = 10
    end
    object qrBuscaClientesE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'DBCONN.clientes.E_MAIL'
      Size = 100
    end
    object qrBuscaClientesWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Origin = 'DBCONN.clientes.WEB_SITE'
      Size = 100
    end
    object qrBuscaClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DBCONN.clientes.CONTATO'
      Size = 50
    end
    object qrBuscaClientesPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'DBCONN.clientes.PAIS'
    end
    object qrBuscaClientesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN.clientes.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object qrBuscaClientesREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'DBCONN.clientes.REVENDA'
      FixedChar = True
      Size = 1
    end
    object qrBuscaClientesBIRO: TStringField
      FieldName = 'BIRO'
      Origin = 'DBCONN.clientes.BIRO'
      FixedChar = True
      Size = 1
    end
    object qrBuscaClientesCAPITAL_ATUAL: TBCDField
      FieldName = 'CAPITAL_ATUAL'
      Origin = 'DBCONN.clientes.CAPITAL_ATUAL'
      Precision = 9
      Size = 2
    end
    object qrBuscaClientesNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'DBCONN.clientes.NOME_FANTASIA'
      Size = 50
    end
    object qrBuscaClientesRAMO_ATIVIDADE_SQ: TIntegerField
      FieldName = 'RAMO_ATIVIDADE_SQ'
      Origin = 'DBCONN.clientes.RAMO_ATIVIDADE_SQ'
    end
    object qrBuscaClientesFATURAMENTO_MENSAL: TBCDField
      FieldName = 'FATURAMENTO_MENSAL'
      Origin = 'DBCONN.clientes.FATURAMENTO_MENSAL'
      Precision = 9
      Size = 2
    end
    object qrBuscaClientesDATA_FUNDACAO: TDateTimeField
      FieldName = 'DATA_FUNDACAO'
      Origin = 'DBCONN.clientes.DATA_FUNDACAO'
    end
    object qrBuscaClientesINSCR_MUNICIPAL: TStringField
      FieldName = 'INSCR_MUNICIPAL'
      Origin = 'DBCONN.clientes.INSCR_MUNICIPAL'
    end
    object qrBuscaClientesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DBCONN.clientes.DATA_CADASTRO'
    end
    object qrBuscaClientesDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      Origin = 'DBCONN.clientes.DATA_ALT'
    end
    object qrBuscaClientesUSUARIO_SQ_ALT: TIntegerField
      FieldName = 'USUARIO_SQ_ALT'
      Origin = 'DBCONN.clientes.USUARIO_SQ_ALT'
    end
    object qrBuscaClientesTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.clientes.TRANSPORTADORA_SQ'
    end
    object qrBuscaClientesCLASSIFICACAO_SQ: TIntegerField
      FieldName = 'CLASSIFICACAO_SQ'
      Origin = 'DBCONN.clientes.CLASSIFICACAO_SQ'
    end
  end
  object Query1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    Left = 16
    Top = 128
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
    SessionName = 'Session1_3'
    Left = 528
    Top = 408
  end
  object qrCep: TQuery
    DatabaseName = 'DBCep'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT *'
      'FROM ENDERECOS'
      'WHERE CEP = :CEP')
    Left = 528
    Top = 456
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
  object dspListaClassificacao: TDataSetProvider
    DataSet = qrListaClassificacao
    Options = [poReadOnly]
    Left = 504
    Top = 32
  end
  object qrListaClassificacao: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM CLASSIFICACAO')
    Left = 448
    Top = 32
    object qrListaClassificacaoCLASSIFICACAO_SQ: TIntegerField
      FieldName = 'CLASSIFICACAO_SQ'
      Origin = 'DBCONN.classificacao.CLASSIFICACAO_SQ'
    end
    object qrListaClassificacaoCODIGO_CLASSIFICACAO: TStringField
      FieldName = 'CODIGO_CLASSIFICACAO'
      Origin = 'DBCONN.classificacao.CODIGO_CLASSIFICACAO'
      Size = 50
    end
    object qrListaClassificacaoLIMITE_MINIMO: TBCDField
      FieldName = 'LIMITE_MINIMO'
      Origin = 'DBCONN.classificacao.LIMITE_MINIMO'
      Precision = 9
      Size = 2
    end
    object qrListaClassificacaoLIMITE_MAXIMO: TBCDField
      FieldName = 'LIMITE_MAXIMO'
      Origin = 'DBCONN.classificacao.LIMITE_MAXIMO'
      Precision = 9
      Size = 2
    end
    object qrListaClassificacaoMESES_BONUS: TIntegerField
      FieldName = 'MESES_BONUS'
      Origin = 'DBCONN.classificacao.MESES_BONUS'
    end
  end
  object dspListaNFServicos: TDataSetProvider
    DataSet = qrListaNFServicos
    Options = [poReadOnly]
    Left = 504
    Top = 80
  end
  object qrListaNFServicos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT NF.*, C.NOME_CLIENTE FROM NF_SERVICOS NF'
      'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)'
      'ORDER BY NF.NUMERO_NF_SERVICO')
    Left = 448
    Top = 80
    object qrListaNFServicosNF_SERVICO_SQ: TIntegerField
      FieldName = 'NF_SERVICO_SQ'
      Origin = 'DBCONN.nf_servicos.NF_SERVICO_SQ'
    end
    object qrListaNFServicosNUMERO_NF_SERVICO: TIntegerField
      FieldName = 'NUMERO_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.NUMERO_NF_SERVICO'
    end
    object qrListaNFServicosDATA_NF_SERVICO: TDateTimeField
      FieldName = 'DATA_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.DATA_NF_SERVICO'
    end
    object qrListaNFServicosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.nf_servicos.CLIENTE_SQ'
    end
    object qrListaNFServicosTTL_NF_SERVICO: TBCDField
      FieldName = 'TTL_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.TTL_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object qrListaNFServicosALIQ_ISS_NF_SERVICO: TBCDField
      FieldName = 'ALIQ_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.ALIQ_ISS_NF_SERVICO'
      Precision = 4
      Size = 2
    end
    object qrListaNFServicosVLR_ISS_NF_SERVICO: TBCDField
      FieldName = 'VLR_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.VLR_ISS_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object qrListaNFServicosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Size = 50
    end
  end
  object dspListaKardexModelos: TDataSetProvider
    DataSet = qrListaKardexModelos
    Options = [poReadOnly]
    Left = 504
    Top = 128
  end
  object qrListaKardexModelos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_3'
    SQL.Strings = (
      'SELECT * FROM KARDEX_MODELOS KM')
    Left = 448
    Top = 128
    object qrListaKardexModelosKARDEX_MOD_SQ: TIntegerField
      FieldName = 'KARDEX_MOD_SQ'
      Origin = 'DBCONN.kardex_modelos.KARDEX_MOD_SQ'
    end
    object qrListaKardexModelosMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
      Origin = 'DBCONN.kardex_modelos.MODELO_SQ'
    end
    object qrListaKardexModelosTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Origin = 'DBCONN.kardex_modelos.TIPO_MOV'
      Size = 1
    end
    object qrListaKardexModelosQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'DBCONN.kardex_modelos.QTDE'
    end
    object qrListaKardexModelosVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'DBCONN.kardex_modelos.VALOR'
      Precision = 9
      Size = 2
    end
    object qrListaKardexModelosDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DBCONN.kardex_modelos.DATA'
    end
    object qrListaKardexModelosNFISCAL: TIntegerField
      FieldName = 'NFISCAL'
      Origin = 'DBCONN.kardex_modelos.NFISCAL'
    end
    object qrListaKardexModelosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.kardex_modelos.USUARIO_SQ'
    end
    object qrListaKardexModelosNR_SERIE: TMemoField
      FieldName = 'NR_SERIE'
      Origin = 'DBCONN.kardex_modelos.NR_SERIE'
      BlobType = ftMemo
      Size = 1
    end
  end
end
