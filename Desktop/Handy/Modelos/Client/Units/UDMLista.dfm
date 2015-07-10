object DMLista: TDMLista
  OldCreateOrder = False
  Left = 531
  Top = 120
  Height = 546
  Width = 458
  object cdsListaClientes: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLIENTE_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_CLIENTE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME_CLIENTE'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'INSCR_ESTADUAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'ENDERECO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NUMERO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'COMPL_ENDERECO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DDD_FONE1'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMERO_FONE1'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_FONE1'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DDD_FONE2'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMERO_FONE2'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_FONE2'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DDD_FONE3'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMERO_FONE3'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_FONE3'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DDD_CELULAR'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMERO_CELULAR'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_CELULAR'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DDD_FAX'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMERO_FAX'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_FAX'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'E_MAIL'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'WEB_SITE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CONTATO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PAIS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'REVENDA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'BIRO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CAPITAL_ATUAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'NOME_FANTASIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'RAMO_ATIVIDADE_SQ'
        DataType = ftInteger
      end
      item
        Name = 'FATURAMENTO_MENSAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DATA_FUNDACAO'
        DataType = ftDateTime
      end
      item
        Name = 'INSCR_MUNICIPAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DATA_CADASTRO'
        DataType = ftDateTime
      end
      item
        Name = 'DATA_ALT'
        DataType = ftDateTime
      end
      item
        Name = 'USUARIO_SQ_ALT'
        DataType = ftInteger
      end
      item
        Name = 'TRANSPORTADORA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CLASSIFICACAO_SQ'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaClientes'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 32
    object cdsListaClientesCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.clientes.cliente_sq'
      Required = True
    end
    object cdsListaClientesCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'DBCONN.clientes.CODIGO_CLIENTE'
      Required = True
      Size = 15
    end
    object cdsListaClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Required = True
      Size = 50
    end
    object cdsListaClientesINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN.clientes.INSCR_ESTADUAL'
    end
    object cdsListaClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DBCONN.clientes.ENDERECO'
      Size = 50
    end
    object cdsListaClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'DBCONN.clientes.NUMERO'
    end
    object cdsListaClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'DBCONN.clientes.BAIRRO'
      Size = 30
    end
    object cdsListaClientesCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'DBCONN.clientes.COMPL_ENDERECO'
      Size = 50
    end
    object cdsListaClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCONN.clientes.CIDADE'
      Size = 30
    end
    object cdsListaClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'DBCONN.clientes.ESTADO'
      Size = 2
    end
    object cdsListaClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCONN.clientes.CEP'
      Size = 8
    end
    object cdsListaClientesDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'DBCONN.clientes.DDD_FONE1'
      Size = 4
    end
    object cdsListaClientesNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'DBCONN.clientes.NUMERO_FONE1'
      Size = 15
    end
    object cdsListaClientesCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'DBCONN.clientes.COMPL_FONE1'
      Size = 10
    end
    object cdsListaClientesDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Origin = 'DBCONN.clientes.DDD_FONE2'
      Size = 4
    end
    object cdsListaClientesNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'DBCONN.clientes.NUMERO_FONE2'
      Size = 15
    end
    object cdsListaClientesCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'DBCONN.clientes.COMPL_FONE2'
      Size = 10
    end
    object cdsListaClientesDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Origin = 'DBCONN.clientes.DDD_FONE3'
      Size = 4
    end
    object cdsListaClientesNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'DBCONN.clientes.NUMERO_FONE3'
      Size = 15
    end
    object cdsListaClientesCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'DBCONN.clientes.COMPL_FONE3'
      Size = 10
    end
    object cdsListaClientesDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'DBCONN.clientes.DDD_CELULAR'
      Size = 4
    end
    object cdsListaClientesNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'DBCONN.clientes.NUMERO_CELULAR'
      Size = 15
    end
    object cdsListaClientesCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'DBCONN.clientes.COMPL_CELULAR'
      Size = 10
    end
    object cdsListaClientesDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Origin = 'DBCONN.clientes.DDD_FAX'
      Size = 4
    end
    object cdsListaClientesNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'DBCONN.clientes.NUMERO_FAX'
      Size = 15
    end
    object cdsListaClientesCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Origin = 'DBCONN.clientes.COMPL_FAX'
      Size = 10
    end
    object cdsListaClientesE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'DBCONN.clientes.E_MAIL'
      Size = 100
    end
    object cdsListaClientesWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Origin = 'DBCONN.clientes.WEB_SITE'
      Size = 100
    end
    object cdsListaClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DBCONN.clientes.CONTATO'
      Size = 50
    end
    object cdsListaClientesPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'DBCONN.clientes.PAIS'
    end
    object cdsListaClientesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN.clientes.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaClientesREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'DBCONN.clientes.REVENDA'
      Size = 1
    end
    object cdsListaClientesBIRO: TStringField
      FieldName = 'BIRO'
      Origin = 'DBCONN.clientes.BIRO'
      Size = 1
    end
    object cdsListaClientesCAPITAL_ATUAL: TBCDField
      FieldName = 'CAPITAL_ATUAL'
      Origin = 'DBCONN.clientes.CAPITAL_ATUAL'
      Precision = 9
      Size = 2
    end
    object cdsListaClientesNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'DBCONN.clientes.NOME_FANTASIA'
      Size = 50
    end
    object cdsListaClientesRAMO_ATIVIDADE_SQ: TIntegerField
      FieldName = 'RAMO_ATIVIDADE_SQ'
      Origin = 'DBCONN.clientes.RAMO_ATIVIDADE_SQ'
    end
    object cdsListaClientesFATURAMENTO_MENSAL: TBCDField
      FieldName = 'FATURAMENTO_MENSAL'
      Origin = 'DBCONN.clientes.FATURAMENTO_MENSAL'
      Precision = 9
      Size = 2
    end
    object cdsListaClientesDATA_FUNDACAO: TDateTimeField
      FieldName = 'DATA_FUNDACAO'
      Origin = 'DBCONN.clientes.DATA_FUNDACAO'
    end
    object cdsListaClientesINSCR_MUNICIPAL: TStringField
      FieldName = 'INSCR_MUNICIPAL'
      Origin = 'DBCONN.clientes.INSCR_MUNICIPAL'
    end
    object cdsListaClientesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DBCONN.clientes.DATA_CADASTRO'
    end
    object cdsListaClientesDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      Origin = 'DBCONN.clientes.DATA_ALT'
    end
    object cdsListaClientesUSUARIO_SQ_ALT: TIntegerField
      FieldName = 'USUARIO_SQ_ALT'
      Origin = 'DBCONN.clientes.USUARIO_SQ_ALT'
    end
    object cdsListaClientesTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.clientes.TRANSPORTADORA_SQ'
    end
    object cdsListaClientesCLASSIFICACAO_SQ: TIntegerField
      FieldName = 'CLASSIFICACAO_SQ'
      Origin = 'DBCONN.clientes.CLASSIFICACAO_SQ'
    end
  end
  object cdsListaDuplicatas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'DUPLICATA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_DUPLICATA'
        DataType = ftInteger
      end
      item
        Name = 'ITEM_DUPLICATA'
        DataType = ftInteger
      end
      item
        Name = 'SEQ_DUPLICATA'
        DataType = ftInteger
      end
      item
        Name = 'NFISCAL_SQ'
        DataType = ftInteger
      end
      item
        Name = 'VALOR_DUPLICATA'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DTEMISSAO_DUPLICATA'
        DataType = ftDateTime
      end
      item
        Name = 'DTVENCTO_DUPLICATA'
        DataType = ftDateTime
      end
      item
        Name = 'DTPGTO_DUPLICATA'
        DataType = ftDateTime
      end
      item
        Name = 'VALORPG_DUPLICATA'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaDuplicatas'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 272
    object cdsListaDuplicatasDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Origin = 'DBCONN.duplicatas.duplicata_sq'
      Required = True
    end
    object cdsListaDuplicatasNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.NUMERO_DUPLICATA'
      Required = True
    end
    object cdsListaDuplicatasITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Origin = 'DBCONN.duplicatas.ITEM_DUPLICATA'
      Required = True
    end
    object cdsListaDuplicatasSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
      Origin = 'DBCONN.duplicatas.SEQ_DUPLICATA'
    end
    object cdsListaDuplicatasNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DBCONN.duplicatas.NFISCAL_SQ'
    end
    object cdsListaDuplicatasVALOR_DUPLICATA: TBCDField
      FieldName = 'VALOR_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsListaDuplicatasDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTEMISSAO_DUPLICATA'
    end
    object cdsListaDuplicatasDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTVENCTO_DUPLICATA'
    end
    object cdsListaDuplicatasDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTPGTO_DUPLICATA'
    end
    object cdsListaDuplicatasVALORPG_DUPLICATA: TBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object cdsListaNfiscaisItens: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NFISCAL_ITEM_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NFISCAL_SQ'
        DataType = ftInteger
      end
      item
        Name = 'ITEM'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_ITEM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PECA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'MODELO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE_ITEM'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'CLASS_FISCAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'STRIBUT'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_ITEM'
        DataType = ftInteger
      end
      item
        Name = 'VLR_UNIT_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_TOTAL_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'ALIQ_ICMS_ITEM'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'ALIQ_IPI_ITEM'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'VLR_ICMS_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_IPI_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'CODIGO_PECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO_PECA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QTDE_PECA_LOJA'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_ARMAZEM'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_NBM'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspListaNfiscaisItens'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 176
    object cdsListaNfiscaisItensNFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
    end
    object cdsListaNfiscaisItensNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object cdsListaNfiscaisItensITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object cdsListaNfiscaisItensTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object cdsListaNfiscaisItensPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsListaNfiscaisItensMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsListaNfiscaisItensNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaNfiscaisItensCLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object cdsListaNfiscaisItensSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object cdsListaNfiscaisItensQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object cdsListaNfiscaisItensVLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisItensVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisItensALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsListaNfiscaisItensALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsListaNfiscaisItensVLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisItensVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisItensCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsListaNfiscaisItensDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsListaNfiscaisItensQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object cdsListaNfiscaisItensQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object cdsListaNfiscaisItensCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object cdsListaNfiscais: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NFISCAL_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_NFISCAL'
        DataType = ftInteger
      end
      item
        Name = 'DTEMISSAO_NFISCAL'
        DataType = ftDateTime
      end
      item
        Name = 'DTSAIDA_NFISCAL'
        DataType = ftDateTime
      end
      item
        Name = 'PEDIDO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE_SQ'
        DataType = ftInteger
      end
      item
        Name = 'COND_PAGTO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NATUREZA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'TRANSPORTADORA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'BASE_ICMS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_ICMS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'BASE_ICMS_SUBST'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_ICMS_SUBST'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_PRODUTOS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_FRETE'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_SEGURO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_DESP_ACESS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_IPI'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_TOTAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'FRETE_TRANSP'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PLACA_TRANSP'
        DataType = ftString
        Size = 7
      end
      item
        Name = 'UF_PLACA_TRANSP'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'QTDE_TRANSP'
        DataType = ftInteger
      end
      item
        Name = 'ESPECIE_TRANSP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MARCA_TRANSP'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'NUMERO_TRANSP'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'PBRUTO_TRANSP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PLIQUIDO_TRANSP'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CLASS_FISCAL1'
        DataType = ftInteger
      end
      item
        Name = 'CLASS_FISCAL2'
        DataType = ftInteger
      end
      item
        Name = 'CLASS_FISCAL3'
        DataType = ftInteger
      end
      item
        Name = 'CLASS_FISCAL4'
        DataType = ftInteger
      end
      item
        Name = 'CLASS_FISCAL5'
        DataType = ftInteger
      end
      item
        Name = 'CLASS_FISCAL6'
        DataType = ftInteger
      end
      item
        Name = 'CLASS_FISCAL7'
        DataType = ftInteger
      end
      item
        Name = 'MENSAGEM'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'CANCELADA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DIAS_DEMONSTRACAO'
        DataType = ftInteger
      end
      item
        Name = 'COTACAO_DOLAR'
        DataType = ftBCD
        Precision = 9
        Size = 4
      end
      item
        Name = 'NR_NFISCAL_RETORNO'
        DataType = ftInteger
      end
      item
        Name = 'DT_NFISCAL_RETORNO'
        DataType = ftDateTime
      end
      item
        Name = 'CONCLUIDA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'VENDEDOR_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NF_MANUAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RETORNO_PRODUTO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'RETORNO_OBSERVACAO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'qrListaNfiscaisItens'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaNfiscais'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 128
    object cdsListaNfiscaisNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object cdsListaNfiscaisNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object cdsListaNfiscaisDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
    end
    object cdsListaNfiscaisDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
    end
    object cdsListaNfiscaisPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object cdsListaNfiscaisCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object cdsListaNfiscaisCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object cdsListaNfiscaisNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
    end
    object cdsListaNfiscaisTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
    end
    object cdsListaNfiscaisBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisBASE_ICMS_SUBST: TBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_ICMS_SUBST: TBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_DESP_ACESS: TBCDField
      FieldName = 'VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object cdsListaNfiscaisPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Size = 7
    end
    object cdsListaNfiscaisUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Size = 2
    end
    object cdsListaNfiscaisQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
    end
    object cdsListaNfiscaisESPECIE_TRANSP: TStringField
      FieldName = 'ESPECIE_TRANSP'
    end
    object cdsListaNfiscaisMARCA_TRANSP: TStringField
      FieldName = 'MARCA_TRANSP'
      Size = 30
    end
    object cdsListaNfiscaisNUMERO_TRANSP: TStringField
      FieldName = 'NUMERO_TRANSP'
      Size = 10
    end
    object cdsListaNfiscaisPBRUTO_TRANSP: TStringField
      FieldName = 'PBRUTO_TRANSP'
    end
    object cdsListaNfiscaisPLIQUIDO_TRANSP: TStringField
      FieldName = 'PLIQUIDO_TRANSP'
    end
    object cdsListaNfiscaisCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
    end
    object cdsListaNfiscaisCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
    end
    object cdsListaNfiscaisCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
    end
    object cdsListaNfiscaisCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
    end
    object cdsListaNfiscaisCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
    end
    object cdsListaNfiscaisCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
    end
    object cdsListaNfiscaisCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
    end
    object cdsListaNfiscaisMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaNfiscaisCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
    object cdsListaNfiscaisDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object cdsListaNfiscaisCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object cdsListaNfiscaisNR_NFISCAL_RETORNO: TIntegerField
      FieldName = 'NR_NFISCAL_RETORNO'
    end
    object cdsListaNfiscaisDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
    end
    object cdsListaNfiscaisCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      Size = 1
    end
    object cdsListaNfiscaisVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
    end
    object cdsListaNfiscaisNF_MANUAL: TStringField
      FieldName = 'NF_MANUAL'
      Size = 1
    end
    object cdsListaNfiscaisRETORNO_PRODUTO: TStringField
      FieldName = 'RETORNO_PRODUTO'
      Size = 1
    end
    object cdsListaNfiscaisRETORNO_OBSERVACAO: TMemoField
      FieldName = 'RETORNO_OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaNfiscaisqrListaNfiscaisItens: TDataSetField
      FieldName = 'qrListaNfiscaisItens'
    end
  end
  object cdsListaTransportadoras: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'TRANSPORTADORA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_TRANSPORTADORA'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME_TRANSPORTADORA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ENDERECO_TRANSPORTADORA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MUNICIPIO_TRANSPORTADORA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'ESTADO_TRANSPORTADORA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'INSCR_ESTADUAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DDD_FONE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NUMERO_FONE'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'COMPL_FONE'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaTransportadoras'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 32
    object cdsListaTransportadorasTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.transportadoras.transportadora_sq'
      Required = True
    end
    object cdsListaTransportadorasCODIGO_TRANSPORTADORA: TStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.CODIGO_TRANSPORTADORA'
      Required = True
      Size = 15
    end
    object cdsListaTransportadorasNOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.NOME_TRANSPORTADORA'
      Size = 50
    end
    object cdsListaTransportadorasENDERECO_TRANSPORTADORA: TStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object cdsListaTransportadorasMUNICIPIO_TRANSPORTADORA: TStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object cdsListaTransportadorasESTADO_TRANSPORTADORA: TStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Origin = 'DBCONN.transportadoras.ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object cdsListaTransportadorasINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN.transportadoras.INSCR_ESTADUAL'
    end
    object cdsListaTransportadorasDDD_FONE: TStringField
      FieldName = 'DDD_FONE'
      Origin = 'DBCONN.transportadoras.DDD_FONE'
      Size = 4
    end
    object cdsListaTransportadorasNUMERO_FONE: TStringField
      FieldName = 'NUMERO_FONE'
      Origin = 'DBCONN.transportadoras.NUMERO_FONE'
      Size = 15
    end
    object cdsListaTransportadorasCOMPL_FONE: TStringField
      FieldName = 'COMPL_FONE'
      Origin = 'DBCONN.transportadoras.COMPL_FONE'
      Size = 10
    end
  end
  object cdsListaUsuarios: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'USUARIO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_USUARIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME_USUARIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'SENHA_USUARIO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_EMAIL_FROM'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_NOME_FROM'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_EMAIL_TO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_NOME_TO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_SMTP'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_USERNAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ERRO_PASSWORD'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaUsuarios'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 368
    object cdsListaUsuariosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.usuarios.usuario_sq'
      Required = True
    end
    object cdsListaUsuariosCODIGO_USUARIO: TStringField
      FieldName = 'CODIGO_USUARIO'
      Origin = 'DBCONN.usuarios.CODIGO_USUARIO'
      Required = True
    end
    object cdsListaUsuariosNOME_USUARIO: TStringField
      FieldName = 'NOME_USUARIO'
      Origin = 'DBCONN.usuarios.NOME_USUARIO'
      Required = True
      Size = 50
    end
    object cdsListaUsuariosSENHA_USUARIO: TStringField
      FieldName = 'SENHA_USUARIO'
      Origin = 'DBCONN.usuarios.SENHA_USUARIO'
      Size = 50
    end
    object cdsListaUsuariosERRO_EMAIL_FROM: TStringField
      FieldName = 'ERRO_EMAIL_FROM'
      Origin = 'DBCONN.usuarios.ERRO_EMAIL_FROM'
      Size = 50
    end
    object cdsListaUsuariosERRO_NOME_FROM: TStringField
      FieldName = 'ERRO_NOME_FROM'
      Origin = 'DBCONN.usuarios.ERRO_NOME_FROM'
      Size = 50
    end
    object cdsListaUsuariosERRO_EMAIL_TO: TStringField
      FieldName = 'ERRO_EMAIL_TO'
      Origin = 'DBCONN.usuarios.ERRO_EMAIL_TO'
      Size = 50
    end
    object cdsListaUsuariosERRO_NOME_TO: TStringField
      FieldName = 'ERRO_NOME_TO'
      Origin = 'DBCONN.usuarios.ERRO_NOME_TO'
      Size = 50
    end
    object cdsListaUsuariosERRO_SMTP: TStringField
      FieldName = 'ERRO_SMTP'
      Origin = 'DBCONN.usuarios.ERRO_SMTP'
      Size = 50
    end
    object cdsListaUsuariosERRO_USERNAME: TStringField
      FieldName = 'ERRO_USERNAME'
      Origin = 'DBCONN.usuarios.ERRO_USERNAME'
      Size = 50
    end
    object cdsListaUsuariosERRO_PASSWORD: TStringField
      FieldName = 'ERRO_PASSWORD'
      Origin = 'DBCONN.usuarios.ERRO_PASSWORD'
      Size = 50
    end
  end
  object cdsListaPedidosItens: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PEDIDO_ITEM_SQ'
        DataType = ftInteger
      end
      item
        Name = 'PEDIDO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_ITEM'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PECA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'MODELO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PEDIDO_ITEM'
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE_ITEM'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'PRECO_UNIT'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_DESC'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'PCT_DESC'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'ALIQ_ICMS_ITEM'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'ALIQ_IPI_ITEM'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'VLR_ICMS_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_IPI_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_TOTAL_ITEM'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'CODIGO_PECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO_PECA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QTDE_PECA_LOJA'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_ARMAZEM'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_NBM'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspListaPedidosItens'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 320
    object cdsListaPedidosItensPEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
    end
    object cdsListaPedidosItensPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object cdsListaPedidosItensTIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object cdsListaPedidosItensPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsListaPedidosItensMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsListaPedidosItensQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
    end
    object cdsListaPedidosItensNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaPedidosItensPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object cdsListaPedidosItensVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object cdsListaPedidosItensPCT_DESC: TBCDField
      FieldName = 'PCT_DESC'
      Precision = 9
      Size = 2
    end
    object cdsListaPedidosItensALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsListaPedidosItensALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsListaPedidosItensVLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaPedidosItensVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaPedidosItensVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsListaPedidosItensCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsListaPedidosItensDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsListaPedidosItensQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object cdsListaPedidosItensQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object cdsListaPedidosItensCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object cdsListaNBM: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NBM_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_NBM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ALIQ_ICMS'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'ALIQ_IPI'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaNBM'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 224
    object cdsListaNBMNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'DBCONN.nbm.nbm_sq'
      Required = True
    end
    object cdsListaNBMCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'DBCONN.nbm.CODIGO_NBM'
      Required = True
      Size = 10
    end
    object cdsListaNBMALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'DBCONN.nbm.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object cdsListaNBMALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'DBCONN.nbm.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object cdsListaPecas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PECA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_PECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO_PECA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QTDE_PECA_LOJA'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_ARMAZEM'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_DEMO'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_DEFEITO'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_EM_USO'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_BACKUP'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_DEMO_CLI'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PECA_HLC'
        DataType = ftInteger
      end
      item
        Name = 'NBM_SQ'
        DataType = ftInteger
      end
      item
        Name = 'MODELO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'UN_PECA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MARCA_PECA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRECO_UNIT_PECA'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'TIPO_PECA'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_MODELO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'CODIGO_NBM'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ALIQ_ICMS'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'ALIQ_IPI'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaPecas'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 176
    object cdsListaPecasPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsListaPecasCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsListaPecasDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsListaPecasQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object cdsListaPecasQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object cdsListaPecasQTDE_PECA_DEMO: TIntegerField
      FieldName = 'QTDE_PECA_DEMO'
    end
    object cdsListaPecasQTDE_PECA_DEFEITO: TIntegerField
      FieldName = 'QTDE_PECA_DEFEITO'
    end
    object cdsListaPecasQTDE_PECA_EM_USO: TIntegerField
      FieldName = 'QTDE_PECA_EM_USO'
    end
    object cdsListaPecasQTDE_PECA_BACKUP: TIntegerField
      FieldName = 'QTDE_PECA_BACKUP'
    end
    object cdsListaPecasQTDE_PECA_DEMO_CLI: TIntegerField
      FieldName = 'QTDE_PECA_DEMO_CLI'
    end
    object cdsListaPecasQTDE_PECA_HLC: TIntegerField
      FieldName = 'QTDE_PECA_HLC'
    end
    object cdsListaPecasNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object cdsListaPecasMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsListaPecasUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Size = 2
    end
    object cdsListaPecasMARCA_PECA: TStringField
      FieldName = 'MARCA_PECA'
    end
    object cdsListaPecasPRECO_UNIT_PECA: TBCDField
      FieldName = 'PRECO_UNIT_PECA'
      Precision = 9
      Size = 2
    end
    object cdsListaPecasTIPO_PECA: TIntegerField
      FieldName = 'TIPO_PECA'
    end
    object cdsListaPecasDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object cdsListaPecasCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object cdsListaPecasALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object cdsListaPecasALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object cdsListaNaturezas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NATUREZA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_NATUREZA'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_NATUREZA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CFO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'ALIQ_ICMS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'ALIQ_IPI'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'ENT_SAI'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'UF01'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF02'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF03'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF04'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF05'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF06'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF07'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF08'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF09'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF10'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF11'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF12'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF13'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF14'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF15'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF16'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF17'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF18'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF19'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF20'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF21'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF22'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF23'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF24'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF25'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF26'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF27'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF28'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF29'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'UF30'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ISENCAO_IPI'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ISENCAO_ICMS'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DESCRICAO_NATUREZA_NFISCAL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TIPO_NFISCAL'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaNaturezas'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 128
    object cdsListaNaturezasNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'DBCONN.naturezas.NATUREZA_SQ'
      Required = True
    end
    object cdsListaNaturezasCODIGO_NATUREZA: TIntegerField
      FieldName = 'CODIGO_NATUREZA'
      Origin = 'DBCONN.naturezas.CODIGO_NATUREZA'
      Required = True
    end
    object cdsListaNaturezasDESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'DBCONN.naturezas.DESCRICAO_NATUREZA'
      Required = True
      Size = 50
    end
    object cdsListaNaturezasCFO: TStringField
      FieldName = 'CFO'
      Origin = 'DBCONN.naturezas.CFO'
      Required = True
      Size = 4
    end
    object cdsListaNaturezasALIQ_ICMS: TBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'DBCONN.naturezas.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsListaNaturezasALIQ_IPI: TBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'DBCONN.naturezas.ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object cdsListaNaturezasENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Origin = 'DBCONN.naturezas.ENT_SAI'
      Size = 1
    end
    object cdsListaNaturezasOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN.naturezas.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaNaturezasUF01: TStringField
      FieldName = 'UF01'
      Origin = 'DBCONN.naturezas.UF01'
      Size = 2
    end
    object cdsListaNaturezasUF02: TStringField
      FieldName = 'UF02'
      Origin = 'DBCONN.naturezas.UF02'
      Size = 2
    end
    object cdsListaNaturezasUF03: TStringField
      FieldName = 'UF03'
      Origin = 'DBCONN.naturezas.UF03'
      Size = 2
    end
    object cdsListaNaturezasUF04: TStringField
      FieldName = 'UF04'
      Origin = 'DBCONN.naturezas.UF04'
      Size = 2
    end
    object cdsListaNaturezasUF05: TStringField
      FieldName = 'UF05'
      Origin = 'DBCONN.naturezas.UF05'
      Size = 2
    end
    object cdsListaNaturezasUF06: TStringField
      FieldName = 'UF06'
      Origin = 'DBCONN.naturezas.UF06'
      Size = 2
    end
    object cdsListaNaturezasUF07: TStringField
      FieldName = 'UF07'
      Origin = 'DBCONN.naturezas.UF07'
      Size = 2
    end
    object cdsListaNaturezasUF08: TStringField
      FieldName = 'UF08'
      Origin = 'DBCONN.naturezas.UF08'
      Size = 2
    end
    object cdsListaNaturezasUF09: TStringField
      FieldName = 'UF09'
      Origin = 'DBCONN.naturezas.UF09'
      Size = 2
    end
    object cdsListaNaturezasUF10: TStringField
      FieldName = 'UF10'
      Origin = 'DBCONN.naturezas.UF10'
      Size = 2
    end
    object cdsListaNaturezasUF11: TStringField
      FieldName = 'UF11'
      Origin = 'DBCONN.naturezas.UF11'
      Size = 2
    end
    object cdsListaNaturezasUF12: TStringField
      FieldName = 'UF12'
      Origin = 'DBCONN.naturezas.UF12'
      Size = 2
    end
    object cdsListaNaturezasUF13: TStringField
      FieldName = 'UF13'
      Origin = 'DBCONN.naturezas.UF13'
      Size = 2
    end
    object cdsListaNaturezasUF14: TStringField
      FieldName = 'UF14'
      Origin = 'DBCONN.naturezas.UF14'
      Size = 2
    end
    object cdsListaNaturezasUF15: TStringField
      FieldName = 'UF15'
      Origin = 'DBCONN.naturezas.UF15'
      Size = 2
    end
    object cdsListaNaturezasUF16: TStringField
      FieldName = 'UF16'
      Origin = 'DBCONN.naturezas.UF16'
      Size = 2
    end
    object cdsListaNaturezasUF17: TStringField
      FieldName = 'UF17'
      Origin = 'DBCONN.naturezas.UF17'
      Size = 2
    end
    object cdsListaNaturezasUF18: TStringField
      FieldName = 'UF18'
      Origin = 'DBCONN.naturezas.UF18'
      Size = 2
    end
    object cdsListaNaturezasUF19: TStringField
      FieldName = 'UF19'
      Origin = 'DBCONN.naturezas.UF19'
      Size = 2
    end
    object cdsListaNaturezasUF20: TStringField
      FieldName = 'UF20'
      Origin = 'DBCONN.naturezas.UF20'
      Size = 2
    end
    object cdsListaNaturezasUF21: TStringField
      FieldName = 'UF21'
      Origin = 'DBCONN.naturezas.UF21'
      Size = 2
    end
    object cdsListaNaturezasUF22: TStringField
      FieldName = 'UF22'
      Origin = 'DBCONN.naturezas.UF22'
      Size = 2
    end
    object cdsListaNaturezasUF23: TStringField
      FieldName = 'UF23'
      Origin = 'DBCONN.naturezas.UF23'
      Size = 2
    end
    object cdsListaNaturezasUF24: TStringField
      FieldName = 'UF24'
      Origin = 'DBCONN.naturezas.UF24'
      Size = 2
    end
    object cdsListaNaturezasUF25: TStringField
      FieldName = 'UF25'
      Origin = 'DBCONN.naturezas.UF25'
      Size = 2
    end
    object cdsListaNaturezasUF26: TStringField
      FieldName = 'UF26'
      Origin = 'DBCONN.naturezas.UF26'
      Size = 2
    end
    object cdsListaNaturezasUF27: TStringField
      FieldName = 'UF27'
      Origin = 'DBCONN.naturezas.UF27'
      Size = 2
    end
    object cdsListaNaturezasUF28: TStringField
      FieldName = 'UF28'
      Origin = 'DBCONN.naturezas.UF28'
      Size = 2
    end
    object cdsListaNaturezasUF29: TStringField
      FieldName = 'UF29'
      Origin = 'DBCONN.naturezas.UF29'
      Size = 2
    end
    object cdsListaNaturezasUF30: TStringField
      FieldName = 'UF30'
      Origin = 'DBCONN.naturezas.UF30'
      Size = 2
    end
    object cdsListaNaturezasISENCAO_IPI: TStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'DBCONN.naturezas.ISENCAO_IPI'
      Size = 1
    end
    object cdsListaNaturezasISENCAO_ICMS: TStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'DBCONN.naturezas.ISENCAO_ICMS'
      Size = 1
    end
    object cdsListaNaturezasDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Origin = 'DBCONN.naturezas.DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object cdsListaNaturezasTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
      Origin = 'DBCONN.naturezas.TIPO_NFISCAL'
    end
  end
  object cdsListaCondPagto: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'COND_PAGTO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_COND_PAGTO'
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_COND_PAGTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PARCELAS'
        DataType = ftInteger
      end
      item
        Name = 'D00'
        DataType = ftInteger
      end
      item
        Name = 'D01'
        DataType = ftInteger
      end
      item
        Name = 'D02'
        DataType = ftInteger
      end
      item
        Name = 'D03'
        DataType = ftInteger
      end
      item
        Name = 'D04'
        DataType = ftInteger
      end
      item
        Name = 'D05'
        DataType = ftInteger
      end
      item
        Name = 'D06'
        DataType = ftInteger
      end
      item
        Name = 'D07'
        DataType = ftInteger
      end
      item
        Name = 'D08'
        DataType = ftInteger
      end
      item
        Name = 'D09'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaCondPagto'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 80
    object cdsListaCondPagtoCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'DBCONN.cond_pagto.cond_pagto_sq'
      Required = True
    end
    object cdsListaCondPagtoCODIGO_COND_PAGTO: TIntegerField
      FieldName = 'CODIGO_COND_PAGTO'
      Origin = 'DBCONN.cond_pagto.CODIGO_COND_PAGTO'
      Required = True
    end
    object cdsListaCondPagtoDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Origin = 'DBCONN.cond_pagto.DESCRICAO_COND_PAGTO'
      Required = True
      Size = 50
    end
    object cdsListaCondPagtoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'DBCONN.cond_pagto.PARCELAS'
      Required = True
    end
    object cdsListaCondPagtoD00: TIntegerField
      FieldName = 'D00'
      Origin = 'DBCONN.cond_pagto.D00'
    end
    object cdsListaCondPagtoD01: TIntegerField
      FieldName = 'D01'
      Origin = 'DBCONN.cond_pagto.D01'
    end
    object cdsListaCondPagtoD02: TIntegerField
      FieldName = 'D02'
      Origin = 'DBCONN.cond_pagto.D02'
    end
    object cdsListaCondPagtoD03: TIntegerField
      FieldName = 'D03'
      Origin = 'DBCONN.cond_pagto.D03'
    end
    object cdsListaCondPagtoD04: TIntegerField
      FieldName = 'D04'
      Origin = 'DBCONN.cond_pagto.D04'
    end
    object cdsListaCondPagtoD05: TIntegerField
      FieldName = 'D05'
      Origin = 'DBCONN.cond_pagto.D05'
    end
    object cdsListaCondPagtoD06: TIntegerField
      FieldName = 'D06'
      Origin = 'DBCONN.cond_pagto.D06'
    end
    object cdsListaCondPagtoD07: TIntegerField
      FieldName = 'D07'
      Origin = 'DBCONN.cond_pagto.D07'
    end
    object cdsListaCondPagtoD08: TIntegerField
      FieldName = 'D08'
      Origin = 'DBCONN.cond_pagto.D08'
    end
    object cdsListaCondPagtoD09: TIntegerField
      FieldName = 'D09'
      Origin = 'DBCONN.cond_pagto.D09'
    end
  end
  object cdsCep: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CEP'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        Size = 242
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        Size = 72
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'UF'
        DataType = ftString
        Size = 2
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        Name = 'CEP'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspCep'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 32
    Top = 104
    object cdsCepCEP: TStringField
      FieldName = 'CEP'
      Origin = 'ENDERECOS.CEP'
      Size = 8
    end
    object cdsCepLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Origin = 'ENDERECOS.LOGRADOURO'
      Size = 242
    end
    object cdsCepBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'ENDERECOS.BAIRRO'
      Size = 72
    end
    object cdsCepCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'ENDERECOS.CIDADE'
      Size = 60
    end
    object cdsCepUF: TStringField
      FieldName = 'UF'
      Origin = 'ENDERECOS.UF'
      Size = 2
    end
  end
  object cdsBuscaClientes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaClientes'
    ReadOnly = True
    RemoteServer = SCServerLista
    Left = 32
    Top = 368
    object cdsBuscaClientesCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.clientes.cliente_sq'
      Required = True
    end
    object cdsBuscaClientesCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'DBCONN.clientes.CODIGO_CLIENTE'
      Required = True
      Size = 15
    end
    object cdsBuscaClientesNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Required = True
      Size = 50
    end
    object cdsBuscaClientesINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'DBCONN.clientes.INSCR_ESTADUAL'
    end
    object cdsBuscaClientesENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DBCONN.clientes.ENDERECO'
      Size = 50
    end
    object cdsBuscaClientesNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'DBCONN.clientes.NUMERO'
    end
    object cdsBuscaClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'DBCONN.clientes.BAIRRO'
      Size = 30
    end
    object cdsBuscaClientesCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'DBCONN.clientes.COMPL_ENDERECO'
      Size = 50
    end
    object cdsBuscaClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'DBCONN.clientes.CIDADE'
      Size = 30
    end
    object cdsBuscaClientesESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'DBCONN.clientes.ESTADO'
      Size = 2
    end
    object cdsBuscaClientesCEP: TStringField
      FieldName = 'CEP'
      Origin = 'DBCONN.clientes.CEP'
      Size = 8
    end
    object cdsBuscaClientesDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'DBCONN.clientes.DDD_FONE1'
      Size = 4
    end
    object cdsBuscaClientesNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'DBCONN.clientes.NUMERO_FONE1'
      Size = 15
    end
    object cdsBuscaClientesCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'DBCONN.clientes.COMPL_FONE1'
      Size = 10
    end
    object cdsBuscaClientesDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Origin = 'DBCONN.clientes.DDD_FONE2'
      Size = 4
    end
    object cdsBuscaClientesNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'DBCONN.clientes.NUMERO_FONE2'
      Size = 15
    end
    object cdsBuscaClientesCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'DBCONN.clientes.COMPL_FONE2'
      Size = 10
    end
    object cdsBuscaClientesDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Origin = 'DBCONN.clientes.DDD_FONE3'
      Size = 4
    end
    object cdsBuscaClientesNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'DBCONN.clientes.NUMERO_FONE3'
      Size = 15
    end
    object cdsBuscaClientesCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'DBCONN.clientes.COMPL_FONE3'
      Size = 10
    end
    object cdsBuscaClientesDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'DBCONN.clientes.DDD_CELULAR'
      Size = 4
    end
    object cdsBuscaClientesNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'DBCONN.clientes.NUMERO_CELULAR'
      Size = 15
    end
    object cdsBuscaClientesCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'DBCONN.clientes.COMPL_CELULAR'
      Size = 10
    end
    object cdsBuscaClientesDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Origin = 'DBCONN.clientes.DDD_FAX'
      Size = 4
    end
    object cdsBuscaClientesNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'DBCONN.clientes.NUMERO_FAX'
      Size = 15
    end
    object cdsBuscaClientesCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Origin = 'DBCONN.clientes.COMPL_FAX'
      Size = 10
    end
    object cdsBuscaClientesE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Origin = 'DBCONN.clientes.E_MAIL'
      Size = 100
    end
    object cdsBuscaClientesWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Origin = 'DBCONN.clientes.WEB_SITE'
      Size = 100
    end
    object cdsBuscaClientesCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DBCONN.clientes.CONTATO'
      Size = 50
    end
    object cdsBuscaClientesPAIS: TStringField
      FieldName = 'PAIS'
      Origin = 'DBCONN.clientes.PAIS'
    end
    object cdsBuscaClientesOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      Origin = 'DBCONN.clientes.OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsBuscaClientesREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'DBCONN.clientes.REVENDA'
      Size = 1
    end
    object cdsBuscaClientesBIRO: TStringField
      FieldName = 'BIRO'
      Origin = 'DBCONN.clientes.BIRO'
      Size = 1
    end
    object cdsBuscaClientesCAPITAL_ATUAL: TBCDField
      FieldName = 'CAPITAL_ATUAL'
      Origin = 'DBCONN.clientes.CAPITAL_ATUAL'
      Precision = 9
      Size = 2
    end
    object cdsBuscaClientesNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'DBCONN.clientes.NOME_FANTASIA'
      Size = 50
    end
    object cdsBuscaClientesRAMO_ATIVIDADE_SQ: TIntegerField
      FieldName = 'RAMO_ATIVIDADE_SQ'
      Origin = 'DBCONN.clientes.RAMO_ATIVIDADE_SQ'
    end
    object cdsBuscaClientesFATURAMENTO_MENSAL: TBCDField
      FieldName = 'FATURAMENTO_MENSAL'
      Origin = 'DBCONN.clientes.FATURAMENTO_MENSAL'
      Precision = 9
      Size = 2
    end
    object cdsBuscaClientesDATA_FUNDACAO: TDateTimeField
      FieldName = 'DATA_FUNDACAO'
      Origin = 'DBCONN.clientes.DATA_FUNDACAO'
    end
    object cdsBuscaClientesINSCR_MUNICIPAL: TStringField
      FieldName = 'INSCR_MUNICIPAL'
      Origin = 'DBCONN.clientes.INSCR_MUNICIPAL'
    end
    object cdsBuscaClientesDATA_CADASTRO: TDateTimeField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DBCONN.clientes.DATA_CADASTRO'
    end
    object cdsBuscaClientesDATA_ALT: TDateTimeField
      FieldName = 'DATA_ALT'
      Origin = 'DBCONN.clientes.DATA_ALT'
    end
    object cdsBuscaClientesUSUARIO_SQ_ALT: TIntegerField
      FieldName = 'USUARIO_SQ_ALT'
      Origin = 'DBCONN.clientes.USUARIO_SQ_ALT'
    end
    object cdsBuscaClientesTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'DBCONN.clientes.TRANSPORTADORA_SQ'
    end
    object cdsBuscaClientesCLASSIFICACAO_SQ: TIntegerField
      FieldName = 'CLASSIFICACAO_SQ'
      Origin = 'DBCONN.clientes.CLASSIFICACAO_SQ'
    end
  end
  object cdsBuscaPecas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBuscaPecas'
    ReadOnly = True
    RemoteServer = SCServerLista
    Left = 32
    Top = 320
    object cdsBuscaPecasPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsBuscaPecasCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsBuscaPecasDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsBuscaPecasQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object cdsBuscaPecasQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object cdsBuscaPecasQTDE_PECA_DEMO: TIntegerField
      FieldName = 'QTDE_PECA_DEMO'
    end
    object cdsBuscaPecasQTDE_PECA_DEFEITO: TIntegerField
      FieldName = 'QTDE_PECA_DEFEITO'
    end
    object cdsBuscaPecasQTDE_PECA_EM_USO: TIntegerField
      FieldName = 'QTDE_PECA_EM_USO'
    end
    object cdsBuscaPecasQTDE_PECA_BACKUP: TIntegerField
      FieldName = 'QTDE_PECA_BACKUP'
    end
    object cdsBuscaPecasQTDE_PECA_DEMO_CLI: TIntegerField
      FieldName = 'QTDE_PECA_DEMO_CLI'
    end
    object cdsBuscaPecasQTDE_PECA_HLC: TIntegerField
      FieldName = 'QTDE_PECA_HLC'
    end
    object cdsBuscaPecasNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object cdsBuscaPecasMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsBuscaPecasUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Size = 2
    end
    object cdsBuscaPecasMARCA_PECA: TStringField
      FieldName = 'MARCA_PECA'
    end
    object cdsBuscaPecasPRECO_UNIT_PECA: TBCDField
      FieldName = 'PRECO_UNIT_PECA'
      Precision = 9
      Size = 2
    end
    object cdsBuscaPecasTIPO_PECA: TIntegerField
      FieldName = 'TIPO_PECA'
    end
  end
  object SCServerLista: TSocketConnection
    ServerGUID = '{F42F0CFA-A587-45F4-ACD0-C64157557715}'
    ServerName = 'Svr.DMSvrLista'
    Host = '127.0.0.1'
    Left = 32
    Top = 16
  end
  object cdsListaModelos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'MODELO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_MODELO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESCRICAO_MODELO'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'NBM_SQ'
        DataType = ftInteger
      end
      item
        Name = 'UN_MODELO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MARCA_MODELO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRECO_UNIT_MODELO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaModelos'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 320
    object cdsListaModelosMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsListaModelosCODIGO_MODELO: TStringField
      FieldName = 'CODIGO_MODELO'
      Size = 30
    end
    object cdsListaModelosDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object cdsListaModelosNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object cdsListaModelosUN_MODELO: TStringField
      FieldName = 'UN_MODELO'
      Size = 2
    end
    object cdsListaModelosMARCA_MODELO: TStringField
      FieldName = 'MARCA_MODELO'
    end
    object cdsListaModelosPRECO_UNIT_MODELO: TBCDField
      FieldName = 'PRECO_UNIT_MODELO'
      Precision = 9
      Size = 2
    end
  end
  object cdsListaAssistencias: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASSISTENCIA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_ASSISTENCIA'
        DataType = ftInteger
      end
      item
        Name = 'DATA_CHAMADO'
        DataType = ftDateTime
      end
      item
        Name = 'DATA_ASSISTENCIA'
        DataType = ftDateTime
      end
      item
        Name = 'COTACAO_DOLAR'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'CLIENTE_SQ'
        DataType = ftInteger
      end
      item
        Name = 'COND_PAGTO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'DESP_CHAMADO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DESP_HTEC_AD'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DESP_DESLOC'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_PECAS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'VLR_TOTAL'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'HORA_INICIO'
        DataType = ftTime
      end
      item
        Name = 'HORA_FIM'
        DataType = ftTime
      end
      item
        Name = 'GARANTIA'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CONTRATO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'SERVICOS'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'qrListaAssistenciasItens'
        DataType = ftDataSet
      end
      item
        Name = 'qrListaAssistenciasEquip'
        DataType = ftDataSet
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaAssistencias'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 368
    object cdsListaAssistenciasASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
      Origin = 'DBCONN.assistencias.ASSISTENCIA_SQ'
      Required = True
    end
    object cdsListaAssistenciasNUMERO_ASSISTENCIA: TIntegerField
      FieldName = 'NUMERO_ASSISTENCIA'
      Origin = 'DBCONN.assistencias.NUMERO_ASSISTENCIA'
      Required = True
    end
    object cdsListaAssistenciasDATA_CHAMADO: TDateTimeField
      FieldName = 'DATA_CHAMADO'
      Origin = 'DBCONN.assistencias.DATA_CHAMADO'
      Required = True
    end
    object cdsListaAssistenciasDATA_ASSISTENCIA: TDateTimeField
      FieldName = 'DATA_ASSISTENCIA'
      Origin = 'DBCONN.assistencias.DATA_ASSISTENCIA'
      Required = True
    end
    object cdsListaAssistenciasCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'DBCONN.assistencias.COTACAO_DOLAR'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.assistencias.CLIENTE_SQ'
      Required = True
    end
    object cdsListaAssistenciasCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'DBCONN.assistencias.COND_PAGTO_SQ'
      Required = True
    end
    object cdsListaAssistenciasDESP_CHAMADO: TBCDField
      FieldName = 'DESP_CHAMADO'
      Origin = 'DBCONN.assistencias.DESP_CHAMADO'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasDESP_HTEC_AD: TBCDField
      FieldName = 'DESP_HTEC_AD'
      Origin = 'DBCONN.assistencias.DESP_HTEC_AD'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasDESP_DESLOC: TBCDField
      FieldName = 'DESP_DESLOC'
      Origin = 'DBCONN.assistencias.DESP_DESLOC'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasVLR_PECAS: TBCDField
      FieldName = 'VLR_PECAS'
      Origin = 'DBCONN.assistencias.VLR_PECAS'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'DBCONN.assistencias.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasHORA_INICIO: TDateTimeField
      FieldName = 'HORA_INICIO'
      Origin = 'DBCONN.assistencias.HORA_INICIO'
      Required = True
    end
    object cdsListaAssistenciasHORA_FIM: TDateTimeField
      FieldName = 'HORA_FIM'
      Origin = 'DBCONN.assistencias.HORA_FIM'
      Required = True
    end
    object cdsListaAssistenciasGARANTIA: TStringField
      FieldName = 'GARANTIA'
      Origin = 'DBCONN.assistencias.GARANTIA'
      Size = 1
    end
    object cdsListaAssistenciasCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Origin = 'DBCONN.assistencias.CONTRATO'
      Size = 1
    end
    object cdsListaAssistenciasSERVICOS: TMemoField
      FieldName = 'SERVICOS'
      Origin = 'DBCONN.assistencias.SERVICOS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaAssistenciasqrListaAssistenciasItens: TDataSetField
      FieldName = 'qrListaAssistenciasItens'
    end
    object cdsListaAssistenciasqrListaAssistenciasEquip: TDataSetField
      FieldName = 'qrListaAssistenciasEquip'
    end
  end
  object cdsListaKardexPecas: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KARDEX_PECA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'PECA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_MOV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QTDE'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'NFISCAL'
        DataType = ftInteger
      end
      item
        Name = 'USUARIO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaKardexPecas'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 224
    object cdsListaKardexPecasKARDEX_PECA_SQ: TIntegerField
      FieldName = 'KARDEX_PECA_SQ'
      Origin = 'DBCONN.kardex_pecas.KARDEX_PECA_SQ'
    end
    object cdsListaKardexPecasPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
      Origin = 'DBCONN.kardex_pecas.PECA_SQ'
    end
    object cdsListaKardexPecasTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Origin = 'DBCONN.kardex_pecas.TIPO_MOV'
      Size = 1
    end
    object cdsListaKardexPecasQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'DBCONN.kardex_pecas.QTDE'
    end
    object cdsListaKardexPecasVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'DBCONN.kardex_pecas.VALOR'
      Precision = 9
      Size = 2
    end
    object cdsListaKardexPecasDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DBCONN.kardex_pecas.DATA'
    end
    object cdsListaKardexPecasNFISCAL: TIntegerField
      FieldName = 'NFISCAL'
      Origin = 'DBCONN.kardex_pecas.NFISCAL'
    end
    object cdsListaKardexPecasUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.kardex_pecas.USUARIO_SQ'
    end
    object cdsListaKardexPecasNR_SERIE: TMemoField
      FieldName = 'NR_SERIE'
      Origin = 'DBCONN.kardex_pecas.NR_SERIE'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsListaAssistenciasItens: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASSISTENCIA_ITEM_SQ'
        DataType = ftInteger
      end
      item
        Name = 'ASSISTENCIA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'PECA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'QTDE_ASSISTENCIA_ITEM'
        DataType = ftInteger
      end
      item
        Name = 'PRECO_UNIT'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DESCRICAO_PECA'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspListaAssistenciasItens'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 464
    object cdsListaAssistenciasItensASSISTENCIA_ITEM_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_ITEM_SQ'
      Origin = 'DBCONN.assistencias_itens.ASSISTENCIA_ITEM_SQ'
    end
    object cdsListaAssistenciasItensASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
      Origin = 'DBCONN.assistencias_itens.ASSISTENCIA_SQ'
    end
    object cdsListaAssistenciasItensPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
      Origin = 'DBCONN.assistencias_itens.PECA_SQ'
    end
    object cdsListaAssistenciasItensQTDE_ASSISTENCIA_ITEM: TIntegerField
      FieldName = 'QTDE_ASSISTENCIA_ITEM'
      Origin = 'DBCONN.assistencias_itens.QTDE_ASSISTENCIA_ITEM'
    end
    object cdsListaAssistenciasItensPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'DBCONN.assistencias_itens.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object cdsListaAssistenciasItensDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Origin = 'DBCONN.pecas.DESCRICAO_PECA'
      Size = 50
    end
  end
  object cdsListaAssistenciasEquip: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ASSISTENCIA_EQUIP_SQ'
        DataType = ftInteger
      end
      item
        Name = 'ASSISTENCIA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'MODELO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE_EQUIP'
        DataType = ftMemo
        Size = 1
      end
      item
        Name = 'DEFEITO'
        DataType = ftBlob
        Size = 1
      end
      item
        Name = 'DESCRICAO_MODELO'
        DataType = ftString
        Size = 200
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspListaAssistenciasEquip'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 416
    object cdsListaAssistenciasEquipASSISTENCIA_EQUIP_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_EQUIP_SQ'
    end
    object cdsListaAssistenciasEquipASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object cdsListaAssistenciasEquipMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsListaAssistenciasEquipNR_SERIE_EQUIP: TMemoField
      FieldName = 'NR_SERIE_EQUIP'
      BlobType = ftMemo
      Size = 1
    end
    object cdsListaAssistenciasEquipDEFEITO: TBlobField
      FieldName = 'DEFEITO'
      Size = 1
    end
    object cdsListaAssistenciasEquipDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
  end
  object cdsListaVendedores: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VENDEDOR_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_VENDEDOR'
        DataType = ftInteger
      end
      item
        Name = 'NOME_VENDEDOR'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaVendedores'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 416
    object cdsListaVendedoresVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
      Origin = 'DBCONN.vendedores.vendedor_sq'
      Required = True
    end
    object cdsListaVendedoresCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
      Origin = 'DBCONN.vendedores.CODIGO_VENDEDOR'
      Required = True
    end
    object cdsListaVendedoresNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = 'DBCONN.vendedores.NOME_VENDEDOR'
      Required = True
      Size = 100
    end
  end
  object cdsListaAcessos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ACESSO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NOME_PROGRAMA'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'USUARIO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'VISUALIZAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'CRIAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'EDITAR'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'APAGAR'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaAcessos'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 112
    Top = 464
    object cdsListaAcessosACESSO_SQ: TIntegerField
      FieldName = 'ACESSO_SQ'
      Origin = 'DBCONN.acessos.acesso_sq'
      Required = True
    end
    object cdsListaAcessosNOME_PROGRAMA: TStringField
      FieldName = 'NOME_PROGRAMA'
      Origin = 'DBCONN.acessos.NOME_PROGRAMA'
      Required = True
      Size = 100
    end
    object cdsListaAcessosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.acessos.USUARIO_SQ'
      Required = True
    end
    object cdsListaAcessosVISUALIZAR: TStringField
      FieldName = 'VISUALIZAR'
      Origin = 'DBCONN.acessos.VISUALIZAR'
      Size = 1
    end
    object cdsListaAcessosCRIAR: TStringField
      FieldName = 'CRIAR'
      Origin = 'DBCONN.acessos.CRIAR'
      Size = 1
    end
    object cdsListaAcessosEDITAR: TStringField
      FieldName = 'EDITAR'
      Origin = 'DBCONN.acessos.EDITAR'
      Size = 1
    end
    object cdsListaAcessosAPAGAR: TStringField
      FieldName = 'APAGAR'
      Origin = 'DBCONN.acessos.APAGAR'
      Size = 1
    end
  end
  object cdsListaNfiscaisTotais: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ULTIMA_VENDA'
        DataType = ftDateTime
      end
      item
        Name = 'PRIMEIRA_VENDA'
        DataType = ftDateTime
      end
      item
        Name = 'MAIOR_VENDA'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'MENOR_VENDA'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'TOTAL_VENDA'
        DataType = ftBCD
        Precision = 31
        Size = 2
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIENTE_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspListaNfiscaisTotais'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 232
    Top = 80
    object cdsListaNfiscaisTotaisULTIMA_VENDA: TDateTimeField
      FieldName = 'ULTIMA_VENDA'
      Origin = 'DBCONN.nfiscais.DTEMISSAO_NFISCAL'
    end
    object cdsListaNfiscaisTotaisPRIMEIRA_VENDA: TDateTimeField
      FieldName = 'PRIMEIRA_VENDA'
      Origin = 'DBCONN.nfiscais.DTEMISSAO_NFISCAL'
    end
    object cdsListaNfiscaisTotaisMAIOR_VENDA: TBCDField
      FieldName = 'MAIOR_VENDA'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisTotaisMENOR_VENDA: TBCDField
      FieldName = 'MENOR_VENDA'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsListaNfiscaisTotaisTOTAL_VENDA: TBCDField
      FieldName = 'TOTAL_VENDA'
      Origin = 'DBCONN.nfiscais.VLR_TOTAL'
      Precision = 18
      Size = 2
    end
  end
  object cdsListaClassificacao: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CLASSIFICACAO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_CLASSIFICACAO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'LIMITE_MINIMO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'LIMITE_MAXIMO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'MESES_BONUS'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaClassificacao'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 352
    Top = 32
    object cdsListaClassificacaoCLASSIFICACAO_SQ: TIntegerField
      FieldName = 'CLASSIFICACAO_SQ'
      Origin = 'DBCONN.classificacao.CLASSIFICACAO_SQ'
    end
    object cdsListaClassificacaoCODIGO_CLASSIFICACAO: TStringField
      FieldName = 'CODIGO_CLASSIFICACAO'
      Origin = 'DBCONN.classificacao.CODIGO_CLASSIFICACAO'
      Size = 50
    end
    object cdsListaClassificacaoLIMITE_MINIMO: TBCDField
      FieldName = 'LIMITE_MINIMO'
      Origin = 'DBCONN.classificacao.LIMITE_MINIMO'
      Precision = 9
      Size = 2
    end
    object cdsListaClassificacaoLIMITE_MAXIMO: TBCDField
      FieldName = 'LIMITE_MAXIMO'
      Origin = 'DBCONN.classificacao.LIMITE_MAXIMO'
      Precision = 9
      Size = 2
    end
    object cdsListaClassificacaoMESES_BONUS: TIntegerField
      FieldName = 'MESES_BONUS'
      Origin = 'DBCONN.classificacao.MESES_BONUS'
    end
  end
  object cdsListaNFServicos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'NF_SERVICO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_NF_SERVICO'
        DataType = ftInteger
      end
      item
        Name = 'DATA_NF_SERVICO'
        DataType = ftDateTime
      end
      item
        Name = 'CLIENTE_SQ'
        DataType = ftInteger
      end
      item
        Name = 'TTL_NF_SERVICO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'ALIQ_ISS_NF_SERVICO'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'VLR_ISS_NF_SERVICO'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'NOME_CLIENTE'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaNFServicos'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 352
    Top = 80
    object cdsListaNFServicosNF_SERVICO_SQ: TIntegerField
      FieldName = 'NF_SERVICO_SQ'
      Origin = 'DBCONN.nf_servicos.NF_SERVICO_SQ'
    end
    object cdsListaNFServicosNUMERO_NF_SERVICO: TIntegerField
      FieldName = 'NUMERO_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.NUMERO_NF_SERVICO'
    end
    object cdsListaNFServicosDATA_NF_SERVICO: TDateTimeField
      FieldName = 'DATA_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.DATA_NF_SERVICO'
    end
    object cdsListaNFServicosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.nf_servicos.CLIENTE_SQ'
    end
    object cdsListaNFServicosTTL_NF_SERVICO: TBCDField
      FieldName = 'TTL_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.TTL_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object cdsListaNFServicosALIQ_ISS_NF_SERVICO: TBCDField
      FieldName = 'ALIQ_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.ALIQ_ISS_NF_SERVICO'
      Precision = 2
      Size = 2
    end
    object cdsListaNFServicosVLR_ISS_NF_SERVICO: TBCDField
      FieldName = 'VLR_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.VLR_ISS_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object cdsListaNFServicosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Size = 50
    end
  end
  object cdsListaKardexModelos: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'KARDEX_MOD_SQ'
        DataType = ftInteger
      end
      item
        Name = 'MODELO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_MOV'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'QTDE'
        DataType = ftInteger
      end
      item
        Name = 'VALOR'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'DATA'
        DataType = ftDateTime
      end
      item
        Name = 'NFISCAL'
        DataType = ftInteger
      end
      item
        Name = 'USUARIO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE'
        DataType = ftMemo
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspListaKardexModelos'
    ReadOnly = True
    RemoteServer = SCServerLista
    StoreDefs = True
    Left = 352
    Top = 128
    object cdsListaKardexModelosKARDEX_MOD_SQ: TIntegerField
      FieldName = 'KARDEX_MOD_SQ'
      Origin = 'DBCONN.kardex_modelos.KARDEX_MOD_SQ'
    end
    object cdsListaKardexModelosMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
      Origin = 'DBCONN.kardex_modelos.MODELO_SQ'
    end
    object cdsListaKardexModelosTIPO_MOV: TStringField
      FieldName = 'TIPO_MOV'
      Origin = 'DBCONN.kardex_modelos.TIPO_MOV'
      Size = 1
    end
    object cdsListaKardexModelosQTDE: TIntegerField
      FieldName = 'QTDE'
      Origin = 'DBCONN.kardex_modelos.QTDE'
    end
    object cdsListaKardexModelosVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'DBCONN.kardex_modelos.VALOR'
      Precision = 9
      Size = 2
    end
    object cdsListaKardexModelosDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'DBCONN.kardex_modelos.DATA'
    end
    object cdsListaKardexModelosNFISCAL: TIntegerField
      FieldName = 'NFISCAL'
      Origin = 'DBCONN.kardex_modelos.NFISCAL'
    end
    object cdsListaKardexModelosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Origin = 'DBCONN.kardex_modelos.USUARIO_SQ'
    end
    object cdsListaKardexModelosNR_SERIE: TMemoField
      FieldName = 'NR_SERIE'
      Origin = 'DBCONN.kardex_modelos.NR_SERIE'
      BlobType = ftMemo
      Size = 1
    end
  end
end
