object ServerImpr: TServerImpr
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Left = 350
  Top = 182
  Height = 465
  Width = 638
  object dsImprHistClientes1: TDataSource
    DataSet = qrImprHistClientes1
    Left = 328
    Top = 96
  end
  object dsImprHistClientes2: TDataSource
    DataSet = qrImprHistClientes2
    Left = 328
    Top = 144
  end
  object dspImprPed: TDataSetProvider
    DataSet = qrImprPed
    Left = 184
    Top = 40
  end
  object dspImprNfDups: TDataSetProvider
    DataSet = qrImprNfDups
    Left = 184
    Top = 232
  end
  object dspImprNfItem: TDataSetProvider
    DataSet = qrImprNfItem
    Left = 184
    Top = 184
  end
  object dspImprNf: TDataSetProvider
    DataSet = qrImprNf
    Left = 184
    Top = 136
  end
  object dspImprPedItem: TDataSetProvider
    DataSet = qrImprPedItem
    Left = 184
    Top = 88
  end
  object dspImprEst: TDataSetProvider
    DataSet = qrImprEst
    Left = 368
    Top = 40
  end
  object dspImprHistClientes1: TDataSetProvider
    DataSet = qrImprHistClientes1
    Left = 368
    Top = 88
  end
  object dspImprHistClientes2: TDataSetProvider
    DataSet = qrImprHistClientes2
    Left = 368
    Top = 136
  end
  object dspImprHistClientes3: TDataSetProvider
    DataSet = qrImprHistClientes3
    Left = 368
    Top = 184
  end
  object dspImprClientesUF: TDataSetProvider
    DataSet = qrImprClientesUF
    Left = 368
    Top = 232
  end
  object dspImprDemPrev: TDataSetProvider
    DataSet = qrImprDemPrev
    Left = 368
    Top = 280
  end
  object dspImprNfVend: TDataSetProvider
    DataSet = qrImprNfVend
    Left = 184
    Top = 280
  end
  object dspImprNfSerie: TDataSetProvider
    DataSet = qrImprNfSerie
    Left = 368
    Top = 328
  end
  object qrImprPed: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
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
      
        'N.OBSERVACAO AS OBSERVACAO_NAT, VLR_FRETE, FRETE_TRANSP, DIAS_DE' +
        'MONSTRACAO,'
      
        'DATA_PEDIDO, NUMERO_PEDIDO, COTACAO_DOLAR, OBSERVACAO_PED, OBSER' +
        'VACAO_NF,'
      
        'VLR_PRODUTOS, VLR_IPI, VLR_ICMS, D00, D01, D02, D03, D04, D05, D' +
        '06, D07, D08,'
      'D09, PARCELAS, DESCRICAO_COND_PAGTO'
      'FROM PEDIDOS P'
      
        'LEFT OUTER JOIN CLIENTES                     C ON (C.CLIENTE_SQ ' +
        '= P.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO           CP ON (CP.COND_PAGTO_SQ = P' +
        '.COND_PAGTO_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS                N ON (N.NATUREZA_SQ = P' +
        '.NATUREZA_SQ)'
      
        'LEFT OUTER JOIN TRANSPORTADORAS T ON (T.TRANSPORTADORA_SQ = P.TR' +
        'ANSPORTADORA_SQ)'
      
        'LEFT OUTER JOIN VENDEDORES             V ON (V.VENDEDOR_SQ = P.V' +
        'ENDEDOR_SQ)'
      'WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO')
    Left = 128
    Top = 40
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
    object qrImprPedPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object qrImprPedDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
  end
  object qrImprPedItem: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'SELECT NR_SERIE_ITEM, CODIGO_PECA, DESCRICAO_PECA, QTDE_PEDIDO_I' +
        'TEM,'
      
        'CODIGO_NBM, PI.PRECO_UNIT, VLR_DESC, VLR_IPI_ITEM, ALIQ_ICMS_ITE' +
        'M,'
      'ALIQ_IPI_ITEM, VLR_TOTAL_ITEM'
      'FROM PEDIDOS_ITENS PI'
      'LEFT OUTER JOIN PECAS PE ON (PE.PECA_SQ = PI.PECA_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = PE.NBM_SQ)'
      'LEFT OUTER JOIN MODELOS M ON (M.MODELO_SQ = PE.MODELO_SQ)'
      'WHERE PEDIDO_SQ = :PEDIDO_SQ')
    Left = 128
    Top = 88
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
    object qrImprPedItemCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrImprPedItemDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
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
    SessionName = 'Session1_2'
    SQL.Strings = (
      'SELECT NFI.PECA_SQ, CODIGO_PECA, DESCRICAO_PECA, CLASS_FISCAL,'
      
        'VLR_TOTAL_ITEM, VLR_UNIT_ITEM, QTDE_ITEM, UN_PECA, STRIBUT, VLR_' +
        'IPI_ITEM,'
      'ALIQ_IPI_ITEM, ALIQ_ICMS_ITEM, NR_SERIE_ITEM'
      'FROM NFISCAIS_ITENS NFI'
      'LEFT OUTER JOIN PECAS PE ON (PE.PECA_SQ = NFI.PECA_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = PE.NBM_SQ)'
      'LEFT OUTER JOIN MODELOS M ON (M.MODELO_SQ = PE.MODELO_SQ)'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ')
    Left = 128
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    object qrImprNfItemPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrImprNfItemCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrImprNfItemDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
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
    object qrImprNfItemQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object qrImprNfItemUN_PECA: TStringField
      FieldName = 'UN_PECA'
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
  end
  object qrImprNf: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'SELECT NFISCAL_SQ, NOME_CLIENTE, CODIGO_CLIENTE, C.INSCR_ESTADUA' +
        'L, ENDERECO,'
      
        'COMPL_ENDERECO, NUMERO, ENT_SAI, BAIRRO, CIDADE, ESTADO, CEP, DT' +
        'EMISSAO_NFISCAL,'
      
        'DTSAIDA_NFISCAL, DESCRICAO_NATUREZA_NFISCAL, CFO, MENSAGEM, BASE' +
        '_ICMS,'
      
        'VLR_FRETE, VLR_ICMS, BASE_ICMS_SUBST, VLR_SEGURO, VLR_DESP_ACESS' +
        ','
      
        'VLR_ICMS_SUBST, VLR_TOTAL, VLR_PRODUTOS, VLR_IPI, NOME_TRANSPORT' +
        'ADORA,'
      
        'ENDERECO_TRANSPORTADORA, T.INSCR_ESTADUAL as INSCR_ESTADUAL_TRAN' +
        'SP,'
      
        'QTDE_TRANSP, ESTADO_TRANSPORTADORA, MUNICIPIO_TRANSPORTADORA, PL' +
        'IQUIDO_TRANSP,'
      'PBRUTO_TRANSP, NUMERO_TRANSP,  MARCA_TRANSP, ESPECIE_TRANSP,'
      
        'CODIGO_TRANSPORTADORA, UF_PLACA_TRANSP,  PLACA_TRANSP, FRETE_TRA' +
        'NSP,'
      
        'CLASS_FISCAL1, CLASS_FISCAL2,  CLASS_FISCAL3,  CLASS_FISCAL4,  C' +
        'LASS_FISCAL5,'
      
        'CLASS_FISCAL6,  CLASS_FISCAL7,  DDD_FONE1,  NUMERO_FONE1,  COMPL' +
        '_FONE1,'
      
        'NUMERO_NFISCAL, PARCELAS, NF.COND_PAGTO_SQ, NF.NATUREZA_SQ, DIAS' +
        '_DEMONSTRACAO'
      'FROM NFISCAIS NF'
      
        'LEFT OUTER JOIN CLIENTES        C  ON (C.CLIENTE_SQ        = NF.' +
        'CLIENTE_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO      CP ON (CP.COND_PAGTO_SQ    = NF.' +
        'COND_PAGTO_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS       N  ON (N.NATUREZA_SQ       = NF.' +
        'NATUREZA_SQ)'
      
        'LEFT OUTER JOIN TRANSPORTADORAS T  ON (T.TRANSPORTADORA_SQ = NF.' +
        'TRANSPORTADORA_SQ)'
      
        'LEFT OUTER JOIN VENDEDORES             V ON (V.VENDEDOR_SQ = NF.' +
        'VENDEDOR_SQ)'
      
        'LEFT OUTER JOIN NBM             N1 ON (N1.NBM_SQ           = NF.' +
        'CLASS_FISCAL1)'
      
        'LEFT OUTER JOIN NBM             N2 ON (N2.NBM_SQ           = NF.' +
        'CLASS_FISCAL2)'
      
        'LEFT OUTER JOIN NBM             N3 ON (N3.NBM_SQ           = NF.' +
        'CLASS_FISCAL3)'
      
        'LEFT OUTER JOIN NBM             N4 ON (N4.NBM_SQ           = NF.' +
        'CLASS_FISCAL4)'
      
        'LEFT OUTER JOIN NBM             N5 ON (N5.NBM_SQ           = NF.' +
        'CLASS_FISCAL5)'
      
        'LEFT OUTER JOIN NBM             N6 ON (N6.NBM_SQ           = NF.' +
        'CLASS_FISCAL6)'
      
        'LEFT OUTER JOIN NBM             N7 ON (N7.NBM_SQ           = NF.' +
        'CLASS_FISCAL7)'
      'WHERE NUMERO_NFISCAL = :NUMERO_NFISCAL')
    Left = 128
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_NFISCAL'
        ParamType = ptUnknown
      end>
    object qrImprNfNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
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
  end
  object qrImprNfVend: TQuery
    BeforeOpen = qrImprNfVendBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'select n.nfiscal_sq, n.numero_nfiscal, n.dtemissao_nfiscal, n.vl' +
        'r_total,'
      
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
      'n.vendedor_sq, nome_vendedor, codigo_cliente, nome_cliente'
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
      'where na.tipo_nfiscal = 0'
      'and n.cancelada <> '#39'S'#39
      'and n.dtemissao_nfiscal >= :dt_inicio'
      'and n.dtemissao_nfiscal <= :dt_termino')
    Left = 128
    Top = 280
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
    object qrImprNfVendvendedor_sq: TIntegerField
      FieldName = 'vendedor_sq'
    end
    object qrImprNfVendnome_vendedor: TStringField
      FieldName = 'nome_vendedor'
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
  end
  object qrImprNfDups: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'SELECT * FROM DUPLICATAS'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ')
    Left = 128
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    object qrImprNfDupsDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Origin = 'DBCONN.duplicatas.DUPLICATA_SQ'
    end
    object qrImprNfDupsNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.NUMERO_DUPLICATA'
    end
    object qrImprNfDupsITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Origin = 'DBCONN.duplicatas.ITEM_DUPLICATA'
    end
    object qrImprNfDupsSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
      Origin = 'DBCONN.duplicatas.SEQ_DUPLICATA'
    end
    object qrImprNfDupsNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DBCONN.duplicatas.NFISCAL_SQ'
    end
    object qrImprNfDupsVALOR_DUPLICATA: TBCDField
      FieldName = 'VALOR_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object qrImprNfDupsDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTEMISSAO_DUPLICATA'
    end
    object qrImprNfDupsDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTVENCTO_DUPLICATA'
    end
    object qrImprNfDupsDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTPGTO_DUPLICATA'
    end
    object qrImprNfDupsVALORPG_DUPLICATA: TBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object qrImprEst: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'SELECT P.*, M.DESCRICAO_MODELO, N.CODIGO_NBM'
      'FROM PECAS P'
      'LEFT JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'LEFT JOIN MODELOS M ON (M.MODELO_SQ = P.MODELO_SQ)'
      'WHERE QTDE_PECA_LOJA + QTDE_PECA_ARMAZEM <> 0'
      'AND TIPO_PECA = :TIPO_PECA')
    Left = 312
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'TIPO_PECA'
        ParamType = ptUnknown
      end>
    object qrImprEstPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrImprEstCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrImprEstDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object qrImprEstQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object qrImprEstQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object qrImprEstQTDE_PECA_DEMO: TIntegerField
      FieldName = 'QTDE_PECA_DEMO'
    end
    object qrImprEstQTDE_PECA_DEFEITO: TIntegerField
      FieldName = 'QTDE_PECA_DEFEITO'
    end
    object qrImprEstQTDE_PECA_EM_USO: TIntegerField
      FieldName = 'QTDE_PECA_EM_USO'
    end
    object qrImprEstQTDE_PECA_BACKUP: TIntegerField
      FieldName = 'QTDE_PECA_BACKUP'
    end
    object qrImprEstQTDE_PECA_DEMO_CLI: TIntegerField
      FieldName = 'QTDE_PECA_DEMO_CLI'
    end
    object qrImprEstQTDE_PECA_HLC: TIntegerField
      FieldName = 'QTDE_PECA_HLC'
    end
    object qrImprEstNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object qrImprEstMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object qrImprEstUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Size = 2
    end
    object qrImprEstMARCA_PECA: TStringField
      FieldName = 'MARCA_PECA'
    end
    object qrImprEstPRECO_UNIT_PECA: TBCDField
      FieldName = 'PRECO_UNIT_PECA'
      Precision = 9
      Size = 2
    end
    object qrImprEstTIPO_PECA: TIntegerField
      FieldName = 'TIPO_PECA'
    end
    object qrImprEstDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object qrImprEstCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object qrImprHistClientes1: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'SELECT C.CLIENTE_SQ, C.CODIGO_CLIENTE, C.NOME_CLIENTE, C.INSCR_E' +
        'STADUAL, C.ENDERECO, '
      
        'C.NUMERO, C.BAIRRO, C.COMPL_ENDERECO, C.CIDADE, C.ESTADO, C.CEP,' +
        ' C.DDD_FONE1, '
      
        'C.NUMERO_FONE1, C.COMPL_FONE1, C.DDD_FONE2, C.NUMERO_FONE2, C.CO' +
        'MPL_FONE2, '
      
        'C.DDD_FONE3, C.NUMERO_FONE3, C.COMPL_FONE3, C.DDD_CELULAR, C.NUM' +
        'ERO_CELULAR, '
      
        'C.COMPL_CELULAR, C.DDD_FAX, C.NUMERO_FAX, C.COMPL_FAX, C.E_MAIL,' +
        ' C.WEB_SITE, '
      'C.CONTATO, C.PAIS, C.REVENDA, C.BIRO'
      'FROM NFISCAIS NF'
      'LEFT JOIN CLIENTES C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)'
      'LEFT JOIN NATUREZAS NA ON (NA.NATUREZA_SQ = NF.NATUREZA_SQ)'
      'WHERE NF.CANCELADA <> '#39'S'#39' AND NA.TIPO_NFISCAL = 0'
      'AND CODIGO_CLIENTE LIKE :CODIGO_CLIENTE'
      'AND NOME_CLIENTE LIKE :NOME_CLIENTE'
      
        'GROUP BY C.CLIENTE_SQ, C.CODIGO_CLIENTE, C.NOME_CLIENTE, C.INSCR' +
        '_ESTADUAL, C.ENDERECO, '
      
        'C.NUMERO, C.BAIRRO, C.COMPL_ENDERECO, C.CIDADE, C.ESTADO, C.CEP,' +
        ' C.DDD_FONE1, '
      
        'C.NUMERO_FONE1, C.COMPL_FONE1, C.DDD_FONE2, C.NUMERO_FONE2, C.CO' +
        'MPL_FONE2, '
      
        'C.DDD_FONE3, C.NUMERO_FONE3, C.COMPL_FONE3, C.DDD_CELULAR, C.NUM' +
        'ERO_CELULAR, '
      
        'C.COMPL_CELULAR, C.DDD_FAX, C.NUMERO_FAX, C.COMPL_FAX, C.E_MAIL,' +
        ' C.WEB_SITE, '
      'C.CONTATO, C.PAIS, C.REVENDA, C.BIRO')
    Left = 312
    Top = 88
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
    object qrImprHistClientes1CLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object qrImprHistClientes1CODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object qrImprHistClientes1NOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprHistClientes1INSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object qrImprHistClientes1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qrImprHistClientes1NUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qrImprHistClientes1BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrImprHistClientes1COMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object qrImprHistClientes1CIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qrImprHistClientes1ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qrImprHistClientes1CEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrImprHistClientes1DDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object qrImprHistClientes1NUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object qrImprHistClientes1COMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object qrImprHistClientes1DDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object qrImprHistClientes1NUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object qrImprHistClientes1COMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object qrImprHistClientes1DDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object qrImprHistClientes1NUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object qrImprHistClientes1COMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object qrImprHistClientes1DDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object qrImprHistClientes1NUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object qrImprHistClientes1COMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object qrImprHistClientes1DDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object qrImprHistClientes1NUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object qrImprHistClientes1COMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object qrImprHistClientes1E_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 100
    end
    object qrImprHistClientes1WEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object qrImprHistClientes1CONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qrImprHistClientes1PAIS: TStringField
      FieldName = 'PAIS'
    end
    object qrImprHistClientes1REVENDA: TStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object qrImprHistClientes1BIRO: TStringField
      FieldName = 'BIRO'
      Size = 1
    end
  end
  object qrImprHistClientes3: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    DataSource = dsImprHistClientes2
    SQL.Strings = (
      
        'SELECT NI.*, PE.CODIGO_PECA, PE.DESCRICAO_PECA, N.CODIGO_NBM, M.' +
        'DESCRICAO_MODELO'
      'FROM NFISCAIS_ITENS NI'
      'LEFT OUTER JOIN PECAS PE ON (PE.PECA_SQ = NI.PECA_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = PE.NBM_SQ)'
      'LEFT OUTER JOIN MODELOS M ON (M.MODELO_SQ = PE.MODELO_SQ)'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ'
      'ORDER BY PE.CODIGO_PECA')
    Left = 312
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object qrImprHistClientes3NFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
    end
    object qrImprHistClientes3NFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object qrImprHistClientes3ITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object qrImprHistClientes3TIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object qrImprHistClientes3PECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrImprHistClientes3MODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object qrImprHistClientes3NR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object qrImprHistClientes3CLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object qrImprHistClientes3STRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object qrImprHistClientes3QTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object qrImprHistClientes3VLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes3VLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes3ALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object qrImprHistClientes3ALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object qrImprHistClientes3VLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes3VLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes3CODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrImprHistClientes3DESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object qrImprHistClientes3CODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object qrImprHistClientes3DESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
  end
  object qrImprHistClientes2: TQuery
    BeforeOpen = qrImprHistClientes2BeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    DataSource = dsImprHistClientes1
    SQL.Strings = (
      
        'SELECT NF.NFISCAL_SQ, NF.NUMERO_NFISCAL, NF.DTEMISSAO_NFISCAL, N' +
        'F.COTACAO_DOLAR, '
      
        'NF.VLR_ICMS, NF.VLR_IPI, NF.VLR_FRETE, NF.FRETE_TRANSP, NF.VLR_P' +
        'RODUTOS, NF.VLR_TOTAL,'
      
        'CP.DESCRICAO_COND_PAGTO, NA.DESCRICAO_NATUREZA, NA.CFO, TR.NOME_' +
        'TRANSPORTADORA, V.NOME_VENDEDOR'
      'FROM NFISCAIS NF'
      
        'LEFT OUTER JOIN CLIENTES         C ON (C.CLIENTE_SQ = NF.CLIENTE' +
        '_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO      CP ON (CP.COND_PAGTO_SQ = NF.CON' +
        'D_PAGTO_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS       NA ON (NA.NATUREZA_SQ = NF.NATUR' +
        'EZA_SQ)'
      
        'LEFT OUTER JOIN TRANSPORTADORAS TR ON (TR.TRANSPORTADORA_SQ = NF' +
        '.TRANSPORTADORA_SQ)'
      
        'LEFT OUTER JOIN VENDEDORES             V ON (V.VENDEDOR_SQ = NF.' +
        'VENDEDOR_SQ)'
      'WHERE NF.CLIENTE_SQ = :CLIENTE_SQ'
      'AND NF.DTEMISSAO_NFISCAL >= :DT_INICIO'
      'AND NF.DTEMISSAO_NFISCAL <= :DT_TERMINO'
      'AND NF.CANCELADA <> '#39'S'#39
      'AND NA.TIPO_NFISCAL = 0'
      'ORDER BY NF.NUMERO_NFISCAL')
    Left = 312
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CLIENTE_SQ'
        ParamType = ptUnknown
        Size = 4
      end
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
    object qrImprHistClientes2NFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object qrImprHistClientes2NUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object qrImprHistClientes2DTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
    end
    object qrImprHistClientes2COTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object qrImprHistClientes2VLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes2VLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes2VLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes2FRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object qrImprHistClientes2VLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes2VLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrImprHistClientes2DESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object qrImprHistClientes2DESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Size = 50
    end
    object qrImprHistClientes2CFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object qrImprHistClientes2NOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object qrImprHistClientes2NOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 100
    end
  end
  object qrImprDemPrev: TQuery
    BeforeOpen = qrImprDemPrevBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'SELECT NUMERO_NFISCAL, NOME_CLIENTE, DTEMISSAO_NFISCAL, DIAS_DEM' +
        'ONSTRACAO,'
      'DT_NFISCAL_RETORNO'
      'FROM NFISCAIS NF'
      
        'LEFT OUTER JOIN CLIENTES        C  ON (C.CLIENTE_SQ        = NF.' +
        'CLIENTE_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS       N  ON (N.NATUREZA_SQ       = NF.' +
        'NATUREZA_SQ)'
      'WHERE TIPO_NFISCAL = 1'
      'AND CANCELADA <> '#39'S'#39
      
        'AND (INTERVAL DIAS_DEMONSTRACAO DAY + DTEMISSAO_NFISCAL) >= :INI' +
        'CIO'
      'AND (INTERVAL DIAS_DEMONSTRACAO DAY + DTEMISSAO_NFISCAL) <= :FIM'
      '')
    Left = 312
    Top = 280
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
  end
  object qrImprClientesUF: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
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
      '  C.E_MAIL, C.WEB_SITE, C.CONTATO, C.PAIS, C.REVENDA, C.BIRO,'
      
        'SUM(NI.QTDE_ITEM) AS QTDE, SUM(NI.VLR_TOTAL_ITEM) AS VALOR, MAX(' +
        'N.DTEMISSAO_NFISCAL) AS DATA'
      'FROM CLIENTES C'
      
        'LEFT OUTER JOIN NFISCAIS N ON (N.CLIENTE_SQ = C.CLIENTE_SQ AND N' +
        '.CANCELADA <> '#39'S'#39')'
      'LEFT OUTER JOIN NATUREZAS NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ)'
      
        'LEFT OUTER JOIN NFISCAIS_ITENS NI ON (NI.NFISCAL_SQ = N.NFISCAL_' +
        'SQ AND NA.TIPO_NFISCAL = 0)'
      'WHERE ESTADO = :ESTADO'
      
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
      '  C.E_MAIL, C.WEB_SITE, C.CONTATO, C.PAIS, C.REVENDA, C.BIRO'
      'ORDER BY SUM(NI.VLR_TOTAL_ITEM) DESC')
    Left = 312
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'ESTADO'
        ParamType = ptUnknown
      end>
    object qrImprClientesUFCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object qrImprClientesUFCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object qrImprClientesUFNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprClientesUFINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object qrImprClientesUFENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qrImprClientesUFNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qrImprClientesUFBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object qrImprClientesUFCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object qrImprClientesUFCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object qrImprClientesUFESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object qrImprClientesUFCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrImprClientesUFDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object qrImprClientesUFNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object qrImprClientesUFCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object qrImprClientesUFDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object qrImprClientesUFNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object qrImprClientesUFCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object qrImprClientesUFDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object qrImprClientesUFNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object qrImprClientesUFCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object qrImprClientesUFDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object qrImprClientesUFNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object qrImprClientesUFCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object qrImprClientesUFDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object qrImprClientesUFNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object qrImprClientesUFCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object qrImprClientesUFE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 100
    end
    object qrImprClientesUFWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object qrImprClientesUFCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qrImprClientesUFPAIS: TStringField
      FieldName = 'PAIS'
    end
    object qrImprClientesUFREVENDA: TStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object qrImprClientesUFBIRO: TStringField
      FieldName = 'BIRO'
      Size = 1
    end
    object qrImprClientesUFQTDE: TBCDField
      FieldName = 'QTDE'
      Precision = 32
      Size = 0
    end
    object qrImprClientesUFVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 31
      Size = 2
    end
    object qrImprClientesUFDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object qrImprNfSerie: TQuery
    BeforeOpen = qrImprNfSerieBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'SELECT NR_SERIE_ITEM, N.*, NOME_CLIENTE, DESCRICAO_COND_PAGTO, D' +
        'ESCRICAO_NATUREZA, NOME_VENDEDOR'
      'FROM NFISCAIS_ITENS NI'
      'LEFT OUTER JOIN NFISCAIS N ON (N.NFISCAL_SQ = NI.NFISCAL_SQ)'
      'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = N.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO CP ON (CP.COND_PAGTO_SQ = N.COND_PAGT' +
        'O_SQ)'
      'LEFT OUTER JOIN NATUREZAS NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ)'
      'LEFT OUTER JOIN VENDEDORES V ON (V.VENDEDOR_SQ = N.VENDEDOR_SQ)'
      'WHERE NI.NR_SERIE_ITEM LIKE :NR_SERIE_ITEM')
    Left = 312
    Top = 328
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
      'SQLQRYMODE=SERVER'
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
  object dspImprNfFech: TDataSetProvider
    DataSet = qrImprNfFech
    Left = 184
    Top = 328
  end
  object qrImprNfFech: TQuery
    BeforeOpen = qrImprNfFechBeforeOpen
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      
        'select NF.NUMERO_NFISCAL, NA.CFO, NA.DESCRICAO_NATUREZA_NFISCAL,' +
        ' NF.VLR_PRODUTOS,'
      
        ' NF.VLR_TOTAL, NF.VLR_ICMS, NF.VLR_IPI, C.NOME_CLIENTE, NA.ENT_S' +
        'AI, NA.TIPO_NFISCAL, NF.CANCELADA'
      'from nfiscais nf'
      
        'left outer join naturezas na on (na.natureza_sq = nf.natureza_sq' +
        ')'
      'left outer join clientes c on (c.cliente_sq = nf.cliente_sq)'
      'where nf.dtemissao_nfiscal >= :dt_inicio'
      'and nf.dtemissao_nfiscal <= :dt_termino'
      'order by nf.numero_nfiscal')
    Left = 128
    Top = 328
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
    object qrImprNfFechNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object qrImprNfFechCFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object qrImprNfFechDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object qrImprNfFechVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object qrImprNfFechVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object qrImprNfFechVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object qrImprNfFechVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object qrImprNfFechNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object qrImprNfFechENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Size = 1
    end
    object qrImprNfFechTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
    end
    object qrImprNfFechCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
  end
  object dspImprAssist: TDataSetProvider
    DataSet = qrImprAssist
    Left = 536
    Top = 40
  end
  object dspImprAssistItem: TDataSetProvider
    DataSet = qrAssistItem
    Left = 536
    Top = 136
  end
  object dspImprAssistEquip: TDataSetProvider
    DataSet = qrImprAssistEquip
    Left = 536
    Top = 88
  end
  object qrImprAssist: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
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
      'D09, PARCELAS, DESCRICAO_COND_PAGTO'
      'FROM ASSISTENCIAS A'
      
        'LEFT OUTER JOIN CLIENTES              C ON (C.CLIENTE_SQ     = A' +
        '.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO           CP ON (CP.COND_PAGTO_SQ = A' +
        '.COND_PAGTO_SQ)'
      'WHERE NUMERO_ASSISTENCIA = :NUMERO_ASSISTENCIA')
    Left = 480
    Top = 40
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
    object qrImprAssistSERVICOS: TMemoField
      FieldName = 'SERVICOS'
      BlobType = ftMemo
      Size = 1
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
    object qrImprAssistPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object qrImprAssistDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
  end
  object qrImprAssistEquip: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'SELECT AE.*, CODIGO_MODELO, DESCRICAO_MODELO, CODIGO_NBM'
      'FROM ASSISTENCIAS_EQUIPS AE'
      'LEFT OUTER JOIN MODELOS M ON (M.MODELO_SQ = AE.MODELO_SQ)'
      'LEFT OUTER JOIN NBM     N ON (N.NBM_SQ    = M.NBM_SQ)'
      'WHERE ASSISTENCIA_SQ = :ASSISTENCIA_SQ')
    Left = 480
    Top = 88
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
    object qrImprAssistEquipMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
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
    object qrImprAssistEquipCODIGO_MODELO: TStringField
      FieldName = 'CODIGO_MODELO'
      Size = 30
    end
    object qrImprAssistEquipDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object qrImprAssistEquipCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object qrAssistItem: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'SELECT AI.*, CODIGO_PECA, DESCRICAO_PECA, CODIGO_NBM'
      'FROM ASSISTENCIAS_ITENS AI'
      'LEFT OUTER JOIN PECAS PE ON (PE.PECA_SQ = AI.PECA_SQ)'
      'LEFT OUTER JOIN NBM    N ON (N.NBM_SQ   = PE.NBM_SQ)'
      'WHERE ASSISTENCIA_SQ = :ASSISTENCIA_SQ')
    Left = 480
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    object qrAssistItemASSISTENCIA_ITEM_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_ITEM_SQ'
    end
    object qrAssistItemASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object qrAssistItemPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object qrAssistItemQTDE_ASSISTENCIA_ITEM: TIntegerField
      FieldName = 'QTDE_ASSISTENCIA_ITEM'
    end
    object qrAssistItemPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object qrAssistItemCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object qrAssistItemDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object qrAssistItemCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object dspImprNFServicos: TDataSetProvider
    DataSet = qrImprNFServicos
    Left = 536
    Top = 184
  end
  object qrImprNFServicos: TQuery
    DatabaseName = 'DBConn'
    SessionName = 'Session1_2'
    SQL.Strings = (
      'SELECT NF.*, C.NOME_CLIENTE'
      'FROM NF_SERVICOS NF'
      'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)'
      'WHERE NF.DATA_NF_SERVICO >= :DT_INICIO'
      'AND NF.DATA_NF_SERVICO <= :DT_TERMINO'
      'ORDER BY NF.NUMERO_NF_SERVICO'
      '')
    Left = 480
    Top = 184
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
end
