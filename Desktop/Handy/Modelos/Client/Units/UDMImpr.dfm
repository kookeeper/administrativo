object DMImpr: TDMImpr
  OldCreateOrder = False
  Left = 396
  Top = 174
  Height = 415
  Width = 501
  object cdsImprPed: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO_PEDIDO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprPed'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 32
    object cdsImprPedPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS.PEDIDO_SQ'
      Required = True
    end
    object cdsImprPedDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'CLIENTES.DDD_FONE1'
      Size = 4
    end
    object cdsImprPedNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'CLIENTES.NUMERO_FONE1'
      Size = 15
    end
    object cdsImprPedCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'CLIENTES.COMPL_FONE1'
      Size = 10
    end
    object cdsImprPedDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'CLIENTES.DDD_CELULAR'
      Size = 4
    end
    object cdsImprPedNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'CLIENTES.NUMERO_CELULAR'
      Size = 15
    end
    object cdsImprPedCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'CLIENTES.COMPL_CELULAR'
      Size = 10
    end
    object cdsImprPedENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES.ENDERECO'
      Size = 50
    end
    object cdsImprPedNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'CLIENTES.NUMERO'
    end
    object cdsImprPedCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'CLIENTES.COMPL_ENDERECO'
      Size = 50
    end
    object cdsImprPedDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Origin = 'CLIENTES.DDD_FONE2'
      Size = 4
    end
    object cdsImprPedNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'CLIENTES.NUMERO_FONE2'
      Size = 15
    end
    object cdsImprPedCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'CLIENTES.COMPL_FONE2'
      Size = 10
    end
    object cdsImprPedDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Origin = 'CLIENTES.DDD_FONE3'
      Size = 4
    end
    object cdsImprPedNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'CLIENTES.NUMERO_FONE3'
      Size = 15
    end
    object cdsImprPedCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'CLIENTES.COMPL_FONE3'
      Size = 10
    end
    object cdsImprPedDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Origin = 'CLIENTES.DDD_FAX'
      Size = 4
    end
    object cdsImprPedNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'CLIENTES.NUMERO_FAX'
      Size = 15
    end
    object cdsImprPedCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object cdsImprPedCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object cdsImprPedNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsImprPedCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object cdsImprPedINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object cdsImprPedBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsImprPedCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsImprPedESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsImprPedPAIS: TStringField
      FieldName = 'PAIS'
    end
    object cdsImprPedCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsImprPedNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 100
    end
    object cdsImprPedCODIGO_VENDEDOR: TIntegerField
      FieldName = 'CODIGO_VENDEDOR'
    end
    object cdsImprPedTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
    end
    object cdsImprPedDESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Size = 50
    end
    object cdsImprPedCFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object cdsImprPedCODIGO_TRANSPORTADORA: TStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object cdsImprPedNOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object cdsImprPedOBSERVACAO_NAT: TMemoField
      FieldName = 'OBSERVACAO_NAT'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprPedVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object cdsImprPedFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object cdsImprPedDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object cdsImprPedDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
    end
    object cdsImprPedNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object cdsImprPedCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object cdsImprPedOBSERVACAO_PED: TMemoField
      FieldName = 'OBSERVACAO_PED'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprPedOBSERVACAO_NF: TMemoField
      FieldName = 'OBSERVACAO_NF'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprPedVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object cdsImprPedVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object cdsImprPedVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprPedD00: TIntegerField
      FieldName = 'D00'
    end
    object cdsImprPedD01: TIntegerField
      FieldName = 'D01'
    end
    object cdsImprPedD02: TIntegerField
      FieldName = 'D02'
    end
    object cdsImprPedD03: TIntegerField
      FieldName = 'D03'
    end
    object cdsImprPedD04: TIntegerField
      FieldName = 'D04'
    end
    object cdsImprPedD05: TIntegerField
      FieldName = 'D05'
    end
    object cdsImprPedD06: TIntegerField
      FieldName = 'D06'
    end
    object cdsImprPedD07: TIntegerField
      FieldName = 'D07'
    end
    object cdsImprPedD08: TIntegerField
      FieldName = 'D08'
    end
    object cdsImprPedD09: TIntegerField
      FieldName = 'D09'
    end
    object cdsImprPedPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object cdsImprPedDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
  end
  object cdsImprClientesUF: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'ESTADO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprClientesUF'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 240
    Top = 224
    object cdsImprClientesUFCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object cdsImprClientesUFCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object cdsImprClientesUFNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsImprClientesUFINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object cdsImprClientesUFENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsImprClientesUFNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsImprClientesUFBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsImprClientesUFCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object cdsImprClientesUFCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsImprClientesUFESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsImprClientesUFCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsImprClientesUFDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object cdsImprClientesUFNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object cdsImprClientesUFCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object cdsImprClientesUFDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object cdsImprClientesUFNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object cdsImprClientesUFCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object cdsImprClientesUFDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object cdsImprClientesUFNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object cdsImprClientesUFCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object cdsImprClientesUFDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object cdsImprClientesUFNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object cdsImprClientesUFCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object cdsImprClientesUFDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object cdsImprClientesUFNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object cdsImprClientesUFCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object cdsImprClientesUFE_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 100
    end
    object cdsImprClientesUFWEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object cdsImprClientesUFCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object cdsImprClientesUFPAIS: TStringField
      FieldName = 'PAIS'
    end
    object cdsImprClientesUFREVENDA: TStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object cdsImprClientesUFBIRO: TStringField
      FieldName = 'BIRO'
      Size = 1
    end
    object cdsImprClientesUFQTDE: TBCDField
      FieldName = 'QTDE'
      Precision = 32
      Size = 0
    end
    object cdsImprClientesUFVALOR: TBCDField
      FieldName = 'VALOR'
      Precision = 31
      Size = 2
    end
    object cdsImprClientesUFDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object cdsImprHistClientes3: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprHistClientes3'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 240
    Top = 176
    object cdsImprHistClientes3NFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
    end
    object cdsImprHistClientes3NFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object cdsImprHistClientes3ITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object cdsImprHistClientes3TIPO_ITEM: TStringField
      FieldName = 'TIPO_ITEM'
      Size = 1
    end
    object cdsImprHistClientes3PECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsImprHistClientes3MODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsImprHistClientes3NR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprHistClientes3CLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object cdsImprHistClientes3STRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object cdsImprHistClientes3QTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object cdsImprHistClientes3VLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes3VLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes3ALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsImprHistClientes3ALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsImprHistClientes3VLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes3VLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes3CODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsImprHistClientes3DESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsImprHistClientes3CODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object cdsImprHistClientes3DESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
  end
  object cdsImprHistClientes2: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'CLIENTE_SQ'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprHistClientes2'
    ReadOnly = True
    RemoteServer = SCServerImpr
    AfterScroll = cdsImprHistClientes2AfterScroll
    Left = 240
    Top = 128
    object cdsImprHistClientes2NFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object cdsImprHistClientes2NUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object cdsImprHistClientes2DTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
    end
    object cdsImprHistClientes2COTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
    end
    object cdsImprHistClientes2VLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes2VLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes2VLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes2FRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object cdsImprHistClientes2VLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes2VLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsImprHistClientes2DESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object cdsImprHistClientes2DESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Size = 50
    end
    object cdsImprHistClientes2CFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object cdsImprHistClientes2NOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object cdsImprHistClientes2NOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 100
    end
    object cdsImprHistClientes2qrImprHistClientes3: TDataSetField
      FieldName = 'qrImprHistClientes3'
    end
  end
  object cdsImprHistClientes1: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'CODIGO_CLIENTE'
        ParamType = ptUnknown
        Size = 15
      end
      item
        DataType = ftString
        Name = 'NOME_CLIENTE'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprHistClientes1'
    ReadOnly = True
    RemoteServer = SCServerImpr
    AfterScroll = cdsImprHistClientes1AfterScroll
    Left = 240
    Top = 80
    object cdsImprHistClientes1CLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object cdsImprHistClientes1CODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object cdsImprHistClientes1NOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsImprHistClientes1INSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object cdsImprHistClientes1ENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsImprHistClientes1NUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsImprHistClientes1BAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsImprHistClientes1COMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object cdsImprHistClientes1CIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsImprHistClientes1ESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsImprHistClientes1CEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsImprHistClientes1DDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object cdsImprHistClientes1NUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object cdsImprHistClientes1COMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object cdsImprHistClientes1DDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object cdsImprHistClientes1NUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object cdsImprHistClientes1COMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object cdsImprHistClientes1DDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object cdsImprHistClientes1NUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object cdsImprHistClientes1COMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object cdsImprHistClientes1DDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object cdsImprHistClientes1NUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object cdsImprHistClientes1COMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object cdsImprHistClientes1DDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object cdsImprHistClientes1NUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object cdsImprHistClientes1COMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object cdsImprHistClientes1E_MAIL: TStringField
      FieldName = 'E_MAIL'
      Size = 100
    end
    object cdsImprHistClientes1WEB_SITE: TStringField
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object cdsImprHistClientes1CONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object cdsImprHistClientes1PAIS: TStringField
      FieldName = 'PAIS'
    end
    object cdsImprHistClientes1REVENDA: TStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object cdsImprHistClientes1BIRO: TStringField
      FieldName = 'BIRO'
      Size = 1
    end
    object cdsImprHistClientes1qrImprHistClientes2: TDataSetField
      FieldName = 'qrImprHistClientes2'
    end
  end
  object cdsImprEst: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprEst'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 240
    Top = 32
    object cdsImprEstPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsImprEstCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsImprEstDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsImprEstQTDE_PECA_LOJA: TIntegerField
      FieldName = 'QTDE_PECA_LOJA'
    end
    object cdsImprEstQTDE_PECA_ARMAZEM: TIntegerField
      FieldName = 'QTDE_PECA_ARMAZEM'
    end
    object cdsImprEstQTDE_PECA_DEMO: TIntegerField
      FieldName = 'QTDE_PECA_DEMO'
    end
    object cdsImprEstQTDE_PECA_DEFEITO: TIntegerField
      FieldName = 'QTDE_PECA_DEFEITO'
    end
    object cdsImprEstQTDE_PECA_EM_USO: TIntegerField
      FieldName = 'QTDE_PECA_EM_USO'
    end
    object cdsImprEstQTDE_PECA_BACKUP: TIntegerField
      FieldName = 'QTDE_PECA_BACKUP'
    end
    object cdsImprEstQTDE_PECA_DEMO_CLI: TIntegerField
      FieldName = 'QTDE_PECA_DEMO_CLI'
    end
    object cdsImprEstQTDE_PECA_HLC: TIntegerField
      FieldName = 'QTDE_PECA_HLC'
    end
    object cdsImprEstNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object cdsImprEstMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsImprEstUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Size = 2
    end
    object cdsImprEstMARCA_PECA: TStringField
      FieldName = 'MARCA_PECA'
    end
    object cdsImprEstPRECO_UNIT_PECA: TBCDField
      FieldName = 'PRECO_UNIT_PECA'
      Precision = 9
      Size = 2
    end
    object cdsImprEstTIPO_PECA: TIntegerField
      FieldName = 'TIPO_PECA'
    end
    object cdsImprEstDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object cdsImprEstCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object cdsImprNfDups: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprNfDups'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 224
    object cdsImprNfDupsDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Origin = 'DBCONN.duplicatas.duplicata_sq'
      Required = True
    end
    object cdsImprNfDupsNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.NUMERO_DUPLICATA'
      Required = True
    end
    object cdsImprNfDupsITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Origin = 'DBCONN.duplicatas.ITEM_DUPLICATA'
      Required = True
    end
    object cdsImprNfDupsSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
      Origin = 'DBCONN.duplicatas.SEQ_DUPLICATA'
    end
    object cdsImprNfDupsNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DBCONN.duplicatas.NFISCAL_SQ'
    end
    object cdsImprNfDupsVALOR_DUPLICATA: TBCDField
      FieldName = 'VALOR_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsImprNfDupsDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTEMISSAO_DUPLICATA'
    end
    object cdsImprNfDupsDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTVENCTO_DUPLICATA'
    end
    object cdsImprNfDupsDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
      Origin = 'DBCONN.duplicatas.DTPGTO_DUPLICATA'
    end
    object cdsImprNfDupsVALORPG_DUPLICATA: TBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Origin = 'DBCONN.duplicatas.VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object cdsImprNfItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprNfItem'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 176
    object cdsImprNfItemPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsImprNfItemCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsImprNfItemDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsImprNfItemCLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object cdsImprNfItemVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprNfItemVLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprNfItemQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object cdsImprNfItemUN_PECA: TStringField
      FieldName = 'UN_PECA'
      Size = 2
    end
    object cdsImprNfItemSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object cdsImprNfItemVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprNfItemALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsImprNfItemALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsImprNfItemNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
  end
  object cdsImprNf: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO_NFISCAL'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprNf'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 128
    object cdsImprNfNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS.NFISCAL_SQ'
      Required = True
    end
    object cdsImprNfNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'CLIENTES.NOME_CLIENTE'
      Size = 50
    end
    object cdsImprNfCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'CLIENTES.CODIGO_CLIENTE'
      Size = 15
    end
    object cdsImprNfINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'TRANSPORTADORAS.INSCR_ESTADUAL'
    end
    object cdsImprNfENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES.ENDERECO'
      Size = 50
    end
    object cdsImprNfCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'CLIENTES.COMPL_ENDERECO'
      Size = 50
    end
    object cdsImprNfNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'CLIENTES.NUMERO'
    end
    object cdsImprNfENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Origin = 'NATUREZAS.ENT_SAI'
      Size = 1
    end
    object cdsImprNfBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 30
    end
    object cdsImprNfCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTES.CIDADE'
      Size = 30
    end
    object cdsImprNfESTADO: TStringField
      FieldName = 'ESTADO'
      Origin = 'CLIENTES.ESTADO'
      Size = 2
    end
    object cdsImprNfCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CLIENTES.CEP'
      Size = 8
    end
    object cdsImprNfDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'NFISCAIS.DTEMISSAO_NFISCAL'
      Required = True
    end
    object cdsImprNfDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
      Origin = 'NFISCAIS.DTSAIDA_NFISCAL'
    end
    object cdsImprNfDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object cdsImprNfCFO: TStringField
      FieldName = 'CFO'
      Origin = 'NATUREZAS.CFO'
      Size = 4
    end
    object cdsImprNfMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprNfBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'NFISCAIS.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'NFISCAIS.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'NFISCAIS.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfBASE_ICMS_SUBST: TBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = 'NFISCAIS.BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Origin = 'NFISCAIS.VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_DESP_ACESS: TBCDField
      FieldName = 'VLR_DESP_ACESS'
      Origin = 'NFISCAIS.VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_ICMS_SUBST: TBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Origin = 'NFISCAIS.VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'NFISCAIS.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'NFISCAIS.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Origin = 'NFISCAIS.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object cdsImprNfNOME_TRANSPORTADORA: TStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.NOME_TRANSPORTADORA'
      Size = 50
    end
    object cdsImprNfENDERECO_TRANSPORTADORA: TStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object cdsImprNfINSCR_ESTADUAL_TRANSP: TStringField
      FieldName = 'INSCR_ESTADUAL_TRANSP'
      Origin = 'TRANSPORTADORAS.INSCR_ESTADUAL'
    end
    object cdsImprNfQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
      Origin = 'NFISCAIS.QTDE_TRANSP'
    end
    object cdsImprNfESTADO_TRANSPORTADORA: TStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object cdsImprNfMUNICIPIO_TRANSPORTADORA: TStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object cdsImprNfPLIQUIDO_TRANSP: TStringField
      FieldName = 'PLIQUIDO_TRANSP'
      Origin = 'NFISCAIS.PLIQUIDO_TRANSP'
    end
    object cdsImprNfPBRUTO_TRANSP: TStringField
      FieldName = 'PBRUTO_TRANSP'
      Origin = 'NFISCAIS.PBRUTO_TRANSP'
    end
    object cdsImprNfNUMERO_TRANSP: TStringField
      FieldName = 'NUMERO_TRANSP'
      Origin = 'NFISCAIS.NUMERO_TRANSP'
      Size = 10
    end
    object cdsImprNfMARCA_TRANSP: TStringField
      FieldName = 'MARCA_TRANSP'
      Origin = 'NFISCAIS.MARCA_TRANSP'
      Size = 30
    end
    object cdsImprNfESPECIE_TRANSP: TStringField
      FieldName = 'ESPECIE_TRANSP'
      Origin = 'NFISCAIS.ESPECIE_TRANSP'
    end
    object cdsImprNfCODIGO_TRANSPORTADORA: TStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object cdsImprNfUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'NFISCAIS.UF_PLACA_TRANSP'
      Size = 2
    end
    object cdsImprNfPLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'NFISCAIS.PLACA_TRANSP'
      Size = 7
    end
    object cdsImprNfFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'NFISCAIS.FRETE_TRANSP'
      Size = 1
    end
    object cdsImprNfCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
      Origin = 'NFISCAIS.CLASS_FISCAL1'
    end
    object cdsImprNfCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
      Origin = 'NFISCAIS.CLASS_FISCAL2'
    end
    object cdsImprNfCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
      Origin = 'NFISCAIS.CLASS_FISCAL3'
    end
    object cdsImprNfCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
      Origin = 'NFISCAIS.CLASS_FISCAL4'
    end
    object cdsImprNfCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
      Origin = 'NFISCAIS.CLASS_FISCAL5'
    end
    object cdsImprNfCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
      Origin = 'NFISCAIS.CLASS_FISCAL6'
    end
    object cdsImprNfCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
      Origin = 'NFISCAIS.CLASS_FISCAL7'
    end
    object cdsImprNfDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Origin = 'CLIENTES.DDD_FONE1'
      Size = 4
    end
    object cdsImprNfNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'CLIENTES.NUMERO_FONE1'
      Size = 15
    end
    object cdsImprNfCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'CLIENTES.COMPL_FONE1'
      Size = 10
    end
    object cdsImprNfNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
      Required = True
    end
    object cdsImprNfPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'COND_PAGTO.PARCELAS'
    end
    object cdsImprNfCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'NFISCAIS.COND_PAGTO_SQ'
      Required = True
    end
    object cdsImprNfNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'NFISCAIS.NATUREZA_SQ'
      Required = True
    end
    object cdsImprNfDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'NFISCAIS.DIAS_DEMONSTRACAO'
    end
  end
  object cdsImprPedItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprPedItem'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 80
    object cdsImprPedItemNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprPedItemCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsImprPedItemDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsImprPedItemQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
    end
    object cdsImprPedItemCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object cdsImprPedItemPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object cdsImprPedItemVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object cdsImprPedItemVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsImprPedItemALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsImprPedItemALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsImprPedItemVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
  end
  object SCServerImpr: TSocketConnection
    ServerGUID = '{25DA1343-565C-4793-9C40-FE82C204EE0C}'
    ServerName = 'PrServer.ServerImpr'
    Host = '127.0.0.1'
    SupportCallbacks = False
    Left = 40
    Top = 24
  end
  object cdsImprDemPrev: TClientDataSet
    Aggregates = <>
    Params = <
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
    ProviderName = 'dspImprDemPrev'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 240
    Top = 272
    object cdsImprDemPrevNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
      Required = True
    end
    object cdsImprDemPrevNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'CLIENTES.NOME_CLIENTE'
      Size = 50
    end
    object cdsImprDemPrevDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'NFISCAIS.DTEMISSAO_NFISCAL'
      Required = True
    end
    object cdsImprDemPrevDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'NFISCAIS.DIAS_DEMONSTRACAO'
    end
    object cdsImprDemPrevDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
      Origin = 'NFISCAIS.DT_NFISCAL_RETORNO'
    end
  end
  object cdsImprNfVend: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprNfVend'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 272
    object cdsImprNfVendNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS.NFISCAL_SQ'
      Required = True
    end
    object cdsImprNfVendNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
      Required = True
    end
    object cdsImprNfVendDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'NFISCAIS.DTEMISSAO_NFISCAL'
      Required = True
    end
    object cdsImprNfVendVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'NFISCAIS.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVendDUP1: TIntegerField
      FieldName = 'DUP1'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
    end
    object cdsImprNfVendIT1: TIntegerField
      FieldName = 'IT1'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
    end
    object cdsImprNfVendVLR1: TBCDField
      FieldName = 'VLR1'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVendVCT1: TDateTimeField
      FieldName = 'VCT1'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object cdsImprNfVendDUP2: TIntegerField
      FieldName = 'DUP2'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
    end
    object cdsImprNfVendIT2: TIntegerField
      FieldName = 'IT2'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
    end
    object cdsImprNfVendVLR2: TBCDField
      FieldName = 'VLR2'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVendVCT2: TDateTimeField
      FieldName = 'VCT2'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object cdsImprNfVendDUP3: TIntegerField
      FieldName = 'DUP3'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
    end
    object cdsImprNfVendIT3: TIntegerField
      FieldName = 'IT3'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
    end
    object cdsImprNfVendVLR3: TBCDField
      FieldName = 'VLR3'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVendVCT3: TDateTimeField
      FieldName = 'VCT3'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object cdsImprNfVendDUP4: TIntegerField
      FieldName = 'DUP4'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
    end
    object cdsImprNfVendIT4: TIntegerField
      FieldName = 'IT4'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
    end
    object cdsImprNfVendVLR4: TBCDField
      FieldName = 'VLR4'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVendVCT4: TDateTimeField
      FieldName = 'VCT4'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object cdsImprNfVendDUP5: TIntegerField
      FieldName = 'DUP5'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
    end
    object cdsImprNfVendIT5: TIntegerField
      FieldName = 'IT5'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
    end
    object cdsImprNfVendVLR5: TBCDField
      FieldName = 'VLR5'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object cdsImprNfVendVCT5: TDateTimeField
      FieldName = 'VCT5'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object cdsImprNfVendVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
      Origin = 'NFISCAIS.VENDEDOR_SQ'
      Required = True
    end
    object cdsImprNfVendNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = 'VENDEDORES.NOME_VENDEDOR'
      Size = 100
    end
    object cdsImprNfVendCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'CLIENTES.CODIGO_CLIENTE'
      Size = 15
    end
    object cdsImprNfVendNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'CLIENTES.NOME_CLIENTE'
      Size = 50
    end
  end
  object cdsImprNfSerie: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'NR_SERIE_ITEM'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprNfSerie'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 240
    Top = 320
    object cdsImprNfSerieNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprNfSerieNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS.NFISCAL_SQ'
    end
    object cdsImprNfSerieNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
    end
    object cdsImprNfSerieDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'NFISCAIS.DTEMISSAO_NFISCAL'
    end
    object cdsImprNfSerieDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
      Origin = 'NFISCAIS.DTSAIDA_NFISCAL'
    end
    object cdsImprNfSeriePEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'NFISCAIS.PEDIDO_SQ'
    end
    object cdsImprNfSerieCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'NFISCAIS.CLIENTE_SQ'
    end
    object cdsImprNfSerieCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'NFISCAIS.COND_PAGTO_SQ'
    end
    object cdsImprNfSerieNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'NFISCAIS.NATUREZA_SQ'
    end
    object cdsImprNfSerieTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'NFISCAIS.TRANSPORTADORA_SQ'
    end
    object cdsImprNfSerieBASE_ICMS: TBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'NFISCAIS.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'NFISCAIS.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieBASE_ICMS_SUBST: TBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = 'NFISCAIS.BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_ICMS_SUBST: TBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Origin = 'NFISCAIS.VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'NFISCAIS.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_FRETE: TBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'NFISCAIS.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
      Origin = 'NFISCAIS.VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_DESP_ACESS: TBCDField
      FieldName = 'VLR_DESP_ACESS'
      Origin = 'NFISCAIS.VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Origin = 'NFISCAIS.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'NFISCAIS.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsImprNfSerieFRETE_TRANSP: TStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'NFISCAIS.FRETE_TRANSP'
      Size = 1
    end
    object cdsImprNfSeriePLACA_TRANSP: TStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'NFISCAIS.PLACA_TRANSP'
      Size = 7
    end
    object cdsImprNfSerieUF_PLACA_TRANSP: TStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'NFISCAIS.UF_PLACA_TRANSP'
      Size = 2
    end
    object cdsImprNfSerieQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
      Origin = 'NFISCAIS.QTDE_TRANSP'
    end
    object cdsImprNfSerieESPECIE_TRANSP: TStringField
      FieldName = 'ESPECIE_TRANSP'
      Origin = 'NFISCAIS.ESPECIE_TRANSP'
    end
    object cdsImprNfSerieMARCA_TRANSP: TStringField
      FieldName = 'MARCA_TRANSP'
      Origin = 'NFISCAIS.MARCA_TRANSP'
      Size = 30
    end
    object cdsImprNfSerieNUMERO_TRANSP: TStringField
      FieldName = 'NUMERO_TRANSP'
      Origin = 'NFISCAIS.NUMERO_TRANSP'
      Size = 10
    end
    object cdsImprNfSeriePBRUTO_TRANSP: TStringField
      FieldName = 'PBRUTO_TRANSP'
      Origin = 'NFISCAIS.PBRUTO_TRANSP'
    end
    object cdsImprNfSeriePLIQUIDO_TRANSP: TStringField
      FieldName = 'PLIQUIDO_TRANSP'
      Origin = 'NFISCAIS.PLIQUIDO_TRANSP'
    end
    object cdsImprNfSerieCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
      Origin = 'NFISCAIS.CLASS_FISCAL1'
    end
    object cdsImprNfSerieCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
      Origin = 'NFISCAIS.CLASS_FISCAL2'
    end
    object cdsImprNfSerieCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
      Origin = 'NFISCAIS.CLASS_FISCAL3'
    end
    object cdsImprNfSerieCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
      Origin = 'NFISCAIS.CLASS_FISCAL4'
    end
    object cdsImprNfSerieCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
      Origin = 'NFISCAIS.CLASS_FISCAL5'
    end
    object cdsImprNfSerieCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
      Origin = 'NFISCAIS.CLASS_FISCAL6'
    end
    object cdsImprNfSerieCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
      Origin = 'NFISCAIS.CLASS_FISCAL7'
    end
    object cdsImprNfSerieMENSAGEM: TMemoField
      FieldName = 'MENSAGEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprNfSerieCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Origin = 'NFISCAIS.CANCELADA'
      Size = 1
    end
    object cdsImprNfSerieDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'NFISCAIS.DIAS_DEMONSTRACAO'
    end
    object cdsImprNfSerieCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'NFISCAIS.COTACAO_DOLAR'
      Precision = 9
    end
    object cdsImprNfSerieNR_NFISCAL_RETORNO: TIntegerField
      FieldName = 'NR_NFISCAL_RETORNO'
      Origin = 'NFISCAIS.NR_NFISCAL_RETORNO'
    end
    object cdsImprNfSerieDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
      Origin = 'NFISCAIS.DT_NFISCAL_RETORNO'
    end
    object cdsImprNfSerieCONCLUIDA: TStringField
      FieldName = 'CONCLUIDA'
      Origin = 'NFISCAIS.CONCLUIDA'
      Size = 1
    end
    object cdsImprNfSerieVENDEDOR_SQ: TIntegerField
      FieldName = 'VENDEDOR_SQ'
      Origin = 'NFISCAIS.VENDEDOR_SQ'
    end
    object cdsImprNfSerieNF_MANUAL: TStringField
      FieldName = 'NF_MANUAL'
      Origin = 'NFISCAIS.NF_MANUAL'
      Size = 1
    end
    object cdsImprNfSerieRETORNO_PRODUTO: TStringField
      FieldName = 'RETORNO_PRODUTO'
      Size = 1
    end
    object cdsImprNfSerieRETORNO_OBSERVACAO: TMemoField
      FieldName = 'RETORNO_OBSERVACAO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprNfSerieNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'CLIENTES.NOME_CLIENTE'
      Size = 50
    end
    object cdsImprNfSerieDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Origin = 'COND_PAGTO.DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object cdsImprNfSerieDESCRICAO_NATUREZA: TStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA'
      Size = 50
    end
    object cdsImprNfSerieNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Origin = 'VENDEDORES.NOME_VENDEDOR'
      Size = 100
    end
  end
  object cdsImprNfFech: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'DT_INICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DT_TERMINO'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprNfFech'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 112
    Top = 320
    object cdsImprNfFechNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object cdsImprNfFechCFO: TStringField
      FieldName = 'CFO'
      Size = 4
    end
    object cdsImprNfFechDESCRICAO_NATUREZA_NFISCAL: TStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object cdsImprNfFechVLR_PRODUTOS: TBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfFechVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object cdsImprNfFechVLR_ICMS: TBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object cdsImprNfFechVLR_IPI: TBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object cdsImprNfFechNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsImprNfFechENT_SAI: TStringField
      FieldName = 'ENT_SAI'
      Size = 1
    end
    object cdsImprNfFechTIPO_NFISCAL: TIntegerField
      FieldName = 'TIPO_NFISCAL'
    end
    object cdsImprNfFechCANCELADA: TStringField
      FieldName = 'CANCELADA'
      Size = 1
    end
  end
  object cdsImprAssist: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO_ASSISTENCIA'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprAssist'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 360
    Top = 32
    object cdsImprAssistASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object cdsImprAssistNUMERO_ASSISTENCIA: TIntegerField
      FieldName = 'NUMERO_ASSISTENCIA'
    end
    object cdsImprAssistDATA_CHAMADO: TDateTimeField
      FieldName = 'DATA_CHAMADO'
    end
    object cdsImprAssistDATA_ASSISTENCIA: TDateTimeField
      FieldName = 'DATA_ASSISTENCIA'
    end
    object cdsImprAssistCOTACAO_DOLAR: TBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
      Size = 2
    end
    object cdsImprAssistCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object cdsImprAssistCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object cdsImprAssistDESP_CHAMADO: TBCDField
      FieldName = 'DESP_CHAMADO'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsImprAssistDESP_HTEC_AD: TBCDField
      FieldName = 'DESP_HTEC_AD'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsImprAssistDESP_DESLOC: TBCDField
      FieldName = 'DESP_DESLOC'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsImprAssistVLR_PECAS: TBCDField
      FieldName = 'VLR_PECAS'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsImprAssistVLR_TOTAL: TBCDField
      FieldName = 'VLR_TOTAL'
      currency = True
      Precision = 9
      Size = 2
    end
    object cdsImprAssistHORA_INICIO: TTimeField
      FieldName = 'HORA_INICIO'
    end
    object cdsImprAssistHORA_FIM: TTimeField
      FieldName = 'HORA_FIM'
    end
    object cdsImprAssistGARANTIA: TStringField
      FieldName = 'GARANTIA'
      Size = 1
    end
    object cdsImprAssistCONTRATO: TStringField
      FieldName = 'CONTRATO'
      Size = 1
    end
    object cdsImprAssistSERVICOS: TMemoField
      FieldName = 'SERVICOS'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprAssistDDD_FONE1: TStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object cdsImprAssistNUMERO_FONE1: TStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object cdsImprAssistCOMPL_FONE1: TStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object cdsImprAssistDDD_CELULAR: TStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object cdsImprAssistNUMERO_CELULAR: TStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object cdsImprAssistCOMPL_CELULAR: TStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object cdsImprAssistENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsImprAssistNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object cdsImprAssistCOMPL_ENDERECO: TStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object cdsImprAssistDDD_FONE2: TStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object cdsImprAssistNUMERO_FONE2: TStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object cdsImprAssistCOMPL_FONE2: TStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object cdsImprAssistDDD_FONE3: TStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object cdsImprAssistNUMERO_FONE3: TStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object cdsImprAssistCOMPL_FONE3: TStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object cdsImprAssistDDD_FAX: TStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object cdsImprAssistNUMERO_FAX: TStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object cdsImprAssistCOMPL_FAX: TStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object cdsImprAssistCODIGO_CLIENTE: TStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object cdsImprAssistNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object cdsImprAssistCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object cdsImprAssistINSCR_ESTADUAL: TStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object cdsImprAssistBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsImprAssistCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object cdsImprAssistESTADO: TStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object cdsImprAssistPAIS: TStringField
      FieldName = 'PAIS'
    end
    object cdsImprAssistCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object cdsImprAssistD00: TIntegerField
      FieldName = 'D00'
    end
    object cdsImprAssistD01: TIntegerField
      FieldName = 'D01'
    end
    object cdsImprAssistD02: TIntegerField
      FieldName = 'D02'
    end
    object cdsImprAssistD03: TIntegerField
      FieldName = 'D03'
    end
    object cdsImprAssistD04: TIntegerField
      FieldName = 'D04'
    end
    object cdsImprAssistD05: TIntegerField
      FieldName = 'D05'
    end
    object cdsImprAssistD06: TIntegerField
      FieldName = 'D06'
    end
    object cdsImprAssistD07: TIntegerField
      FieldName = 'D07'
    end
    object cdsImprAssistD08: TIntegerField
      FieldName = 'D08'
    end
    object cdsImprAssistD09: TIntegerField
      FieldName = 'D09'
    end
    object cdsImprAssistPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
    end
    object cdsImprAssistDESCRICAO_COND_PAGTO: TStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
  end
  object cdsImprAssistItem: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprAssistItem'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 360
    Top = 128
    object cdsImprAssistItemASSISTENCIA_ITEM_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_ITEM_SQ'
    end
    object cdsImprAssistItemASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object cdsImprAssistItemPECA_SQ: TIntegerField
      FieldName = 'PECA_SQ'
    end
    object cdsImprAssistItemQTDE_ASSISTENCIA_ITEM: TIntegerField
      FieldName = 'QTDE_ASSISTENCIA_ITEM'
    end
    object cdsImprAssistItemPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object cdsImprAssistItemCODIGO_PECA: TStringField
      FieldName = 'CODIGO_PECA'
    end
    object cdsImprAssistItemDESCRICAO_PECA: TStringField
      FieldName = 'DESCRICAO_PECA'
      Size = 50
    end
    object cdsImprAssistItemCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object cdsImprAssistEquip: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'ASSISTENCIA_SQ'
        ParamType = ptUnknown
      end>
    ProviderName = 'dspImprAssistEquip'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 360
    Top = 80
    object cdsImprAssistEquipASSISTENCIA_EQUIP_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_EQUIP_SQ'
    end
    object cdsImprAssistEquipASSISTENCIA_SQ: TIntegerField
      FieldName = 'ASSISTENCIA_SQ'
    end
    object cdsImprAssistEquipMODELO_SQ: TIntegerField
      FieldName = 'MODELO_SQ'
    end
    object cdsImprAssistEquipNR_SERIE_EQUIP: TMemoField
      FieldName = 'NR_SERIE_EQUIP'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprAssistEquipDEFEITO: TBlobField
      FieldName = 'DEFEITO'
      Size = 1
    end
    object cdsImprAssistEquipCODIGO_MODELO: TStringField
      FieldName = 'CODIGO_MODELO'
      Size = 30
    end
    object cdsImprAssistEquipDESCRICAO_MODELO: TStringField
      FieldName = 'DESCRICAO_MODELO'
      Size = 200
    end
    object cdsImprAssistEquipCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
  end
  object cdsImprNFServicos: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'dt_inicio'
        ParamType = ptUnknown
        Value = '2005-01-01'
      end
      item
        DataType = ftString
        Name = 'dt_termino'
        ParamType = ptUnknown
        Value = '2006-01-01'
      end>
    ProviderName = 'dspImprNFServicos'
    ReadOnly = True
    RemoteServer = SCServerImpr
    Left = 360
    Top = 176
    object cdsImprNFServicosNF_SERVICO_SQ: TIntegerField
      FieldName = 'NF_SERVICO_SQ'
      Origin = 'DBCONN.nf_servicos.NF_SERVICO_SQ'
    end
    object cdsImprNFServicosNUMERO_NF_SERVICO: TIntegerField
      FieldName = 'NUMERO_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.NUMERO_NF_SERVICO'
    end
    object cdsImprNFServicosDATA_NF_SERVICO: TDateTimeField
      FieldName = 'DATA_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.DATA_NF_SERVICO'
    end
    object cdsImprNFServicosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'DBCONN.nf_servicos.CLIENTE_SQ'
    end
    object cdsImprNFServicosTTL_NF_SERVICO: TBCDField
      FieldName = 'TTL_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.TTL_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object cdsImprNFServicosALIQ_ISS_NF_SERVICO: TBCDField
      FieldName = 'ALIQ_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.ALIQ_ISS_NF_SERVICO'
      Precision = 4
      Size = 2
    end
    object cdsImprNFServicosVLR_ISS_NF_SERVICO: TBCDField
      FieldName = 'VLR_ISS_NF_SERVICO'
      Origin = 'DBCONN.nf_servicos.VLR_ISS_NF_SERVICO'
      Precision = 9
      Size = 2
    end
    object cdsImprNFServicosNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'DBCONN.clientes.NOME_CLIENTE'
      Size = 50
    end
  end
end
