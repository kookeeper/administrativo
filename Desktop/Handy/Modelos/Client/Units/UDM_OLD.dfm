object DM_OLD: TDM_OLD
  OldCreateOrder = False
  Left = 340
  Top = 161
  Height = 505
  Width = 666
  object dsPedidos: TDataSource
    DataSet = ibPedidos
    Left = 104
    Top = 280
  end
  object dsListaPedidos: TDataSource
    DataSet = ibListaPedidos
    Left = 280
    Top = 280
  end
  object IBTransaction1: TIBTransaction
    Active = False
    DefaultDatabase = DBConn
    AutoStopAction = saNone
    Left = 16
    Top = 64
  end
  object DBConn: TIBDatabase
    DatabaseName = 'C:\Delphi\banco\HANDY.HDB'
    Params.Strings = (
      'user_name=sergio'
      'password=sergio')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    BeforeDisconnect = DBConnBeforeDisconnect
    Left = 16
    Top = 16
  end
  object ibCondPagto: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'COND_PAGTO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_COND_PAGTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_COND_PAGTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PARCELAS'
        Attributes = [faRequired]
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
    IndexDefs = <
      item
        Name = 'COND_PAGTO_1'
        Fields = 'CODIGO_COND_PAGTO'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY2'
        Fields = 'COND_PAGTO_SQ'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'COND_PAGTO'
    Left = 80
    Top = 64
    object ibCondPagtoCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object ibCondPagtoCODIGO_COND_PAGTO: TIntegerField
      FieldName = 'CODIGO_COND_PAGTO'
    end
    object ibCondPagtoDESCRICAO_COND_PAGTO: TIBStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object ibCondPagtoPARCELAS: TIntegerField
      DisplayLabel = 'Parcelas'
      FieldName = 'PARCELAS'
      MaxValue = 3
    end
    object ibCondPagtoD00: TIntegerField
      FieldName = 'D00'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD01: TIntegerField
      FieldName = 'D01'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD02: TIntegerField
      FieldName = 'D02'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD03: TIntegerField
      FieldName = 'D03'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD04: TIntegerField
      FieldName = 'D04'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD05: TIntegerField
      FieldName = 'D05'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD06: TIntegerField
      FieldName = 'D06'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD07: TIntegerField
      FieldName = 'D07'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD08: TIntegerField
      FieldName = 'D08'
      DisplayFormat = '00'
      EditFormat = '0'
    end
    object ibCondPagtoD09: TIntegerField
      FieldName = 'D09'
      DisplayFormat = '00'
      EditFormat = '0'
    end
  end
  object ibNaturezas: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NATUREZA_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_NATUREZA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DESCRICAO_NATUREZA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CFO'
        Attributes = [faRequired]
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
        DataType = ftBlob
        Size = 8
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
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$17'
        Fields = 'CODIGO_NATUREZA'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY18'
        Fields = 'NATUREZA_SQ'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'NATUREZAS'
    Left = 80
    Top = 112
    object ibNaturezasNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Required = True
    end
    object ibNaturezasCODIGO_NATUREZA: TIntegerField
      FieldName = 'CODIGO_NATUREZA'
      Required = True
    end
    object ibNaturezasDESCRICAO_NATUREZA: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Required = True
      Size = 50
    end
    object ibNaturezasCFO: TIBStringField
      FieldName = 'CFO'
      Required = True
      Size = 4
    end
    object ibNaturezasALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object ibNaturezasALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object ibNaturezasENT_SAI: TIBStringField
      FieldName = 'ENT_SAI'
      Size = 1
    end
    object ibNaturezasOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 8
    end
    object ibNaturezasUF01: TIBStringField
      FieldName = 'UF01'
      Size = 2
    end
    object ibNaturezasUF02: TIBStringField
      FieldName = 'UF02'
      Size = 2
    end
    object ibNaturezasUF03: TIBStringField
      FieldName = 'UF03'
      Size = 2
    end
    object ibNaturezasUF04: TIBStringField
      FieldName = 'UF04'
      Size = 2
    end
    object ibNaturezasUF05: TIBStringField
      FieldName = 'UF05'
      Size = 2
    end
    object ibNaturezasUF06: TIBStringField
      FieldName = 'UF06'
      Size = 2
    end
    object ibNaturezasUF07: TIBStringField
      FieldName = 'UF07'
      Size = 2
    end
    object ibNaturezasUF08: TIBStringField
      FieldName = 'UF08'
      Size = 2
    end
    object ibNaturezasUF09: TIBStringField
      FieldName = 'UF09'
      Size = 2
    end
    object ibNaturezasUF10: TIBStringField
      FieldName = 'UF10'
      Size = 2
    end
    object ibNaturezasUF11: TIBStringField
      FieldName = 'UF11'
      Size = 2
    end
    object ibNaturezasUF12: TIBStringField
      FieldName = 'UF12'
      Size = 2
    end
    object ibNaturezasUF13: TIBStringField
      FieldName = 'UF13'
      Size = 2
    end
    object ibNaturezasUF14: TIBStringField
      FieldName = 'UF14'
      Size = 2
    end
    object ibNaturezasUF15: TIBStringField
      FieldName = 'UF15'
      Size = 2
    end
    object ibNaturezasUF16: TIBStringField
      FieldName = 'UF16'
      Size = 2
    end
    object ibNaturezasUF17: TIBStringField
      FieldName = 'UF17'
      Size = 2
    end
    object ibNaturezasUF18: TIBStringField
      FieldName = 'UF18'
      Size = 2
    end
    object ibNaturezasUF19: TIBStringField
      FieldName = 'UF19'
      Size = 2
    end
    object ibNaturezasUF20: TIBStringField
      FieldName = 'UF20'
      Size = 2
    end
    object ibNaturezasUF21: TIBStringField
      FieldName = 'UF21'
      Size = 2
    end
    object ibNaturezasUF22: TIBStringField
      FieldName = 'UF22'
      Size = 2
    end
    object ibNaturezasUF23: TIBStringField
      FieldName = 'UF23'
      Size = 2
    end
    object ibNaturezasUF24: TIBStringField
      FieldName = 'UF24'
      Size = 2
    end
    object ibNaturezasUF25: TIBStringField
      FieldName = 'UF25'
      Size = 2
    end
    object ibNaturezasUF26: TIBStringField
      FieldName = 'UF26'
      Size = 2
    end
    object ibNaturezasUF27: TIBStringField
      FieldName = 'UF27'
      Size = 2
    end
    object ibNaturezasUF28: TIBStringField
      FieldName = 'UF28'
      Size = 2
    end
    object ibNaturezasUF29: TIBStringField
      FieldName = 'UF29'
      Size = 2
    end
    object ibNaturezasUF30: TIBStringField
      FieldName = 'UF30'
      Size = 2
    end
    object ibNaturezasISENCAO_IPI: TIBStringField
      FieldName = 'ISENCAO_IPI'
      Size = 1
    end
    object ibNaturezasISENCAO_ICMS: TIBStringField
      FieldName = 'ISENCAO_ICMS'
      Size = 1
    end
    object ibNaturezasDESCRICAO_NATUREZA_NFISCAL: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object ibNaturezasTIPO_NFISCAL: TIBStringField
      FieldName = 'TIPO_NFISCAL'
      Size = 1
    end
  end
  object ibProdutos: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PRODUTO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_PRODUTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DESCRICAO_PRODUTO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QTDE_PRODUTO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NBM_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MODELO_PRODUTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'UN_PRODUTO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'MARCA_PRODUTO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRECO_UNIT'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY8'
        Fields = 'PRODUTO_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'PRODUTOS_1'
        Fields = 'CODIGO_PRODUTO'
        Options = [ixUnique]
      end
      item
        Name = 'PRODUTOS_X_NBM'
        Fields = 'NBM_SQ'
      end>
    StoreDefs = True
    TableName = 'PRODUTOS'
    Left = 80
    Top = 160
    object ibProdutosPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object ibProdutosCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object ibProdutosDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 50
    end
    object ibProdutosQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
    end
    object ibProdutosNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object ibProdutosMODELO_PRODUTO: TIBStringField
      FieldName = 'MODELO_PRODUTO'
    end
    object ibProdutosUN_PRODUTO: TIBStringField
      FieldName = 'UN_PRODUTO'
      Size = 2
    end
    object ibProdutosMARCA_PRODUTO: TIBStringField
      FieldName = 'MARCA_PRODUTO'
    end
    object ibProdutosPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      DisplayFormat = '$ ###,##0.00'
      EditFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object ibProdutosCODIGO_NBM: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_NBM'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'NBM_SQ'
      Size = 10
      Lookup = True
    end
  end
  object ibNbm: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NBM_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_NBM'
        Attributes = [faRequired]
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
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY5'
        Fields = 'NBM_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'NBM_1'
        Fields = 'CODIGO_NBM'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'NBM'
    Left = 80
    Top = 208
    object ibNbmNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
    end
    object ibNbmCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object ibNbmALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibNbmALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object ibPedidos: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    ForcedRefresh = True
    BeforeDelete = ibPedidosBeforeDelete
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PEDIDO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE_SQ'
        DataType = ftInteger
      end
      item
        Name = 'DATA_PEDIDO'
        DataType = ftDateTime
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
        Name = 'COTACAO_DOLAR'
        DataType = ftBCD
        Precision = 9
        Size = 4
      end
      item
        Name = 'OBSERVACAO'
        DataType = ftBlob
      end
      item
        Name = 'TRANSPORTADORA_SQ'
        DataType = ftInteger
      end
      item
        Name = 'VLR_FRETE'
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
        Name = 'NFISCAL_SQ'
        DataType = ftInteger
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
        Name = 'VLR_ICMS'
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
        Name = 'VLR_PRODUTOS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'BASE_ICMS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'NUMERO_PEDIDO'
        DataType = ftInteger
      end
      item
        Name = 'DIAS_DEMONSTRACAO'
        DataType = ftInteger
      end
      item
        Name = 'PCT_JUROS'
        DataType = ftBCD
        Precision = 4
        Size = 2
      end
      item
        Name = 'VLR_JUROS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY6'
        Fields = 'PEDIDO_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'PEDIDOS_X_CLIENTES'
        Fields = 'CLIENTE_SQ'
      end
      item
        Name = 'PEDIDOS_X_COND_PAGTO'
        Fields = 'COND_PAGTO_SQ'
      end
      item
        Name = 'PEDIDOS_X_NATUREZAS'
        Fields = 'NATUREZA_SQ'
      end
      item
        Name = 'PEDIDOS_X_TRANSPORTADORA'
        Fields = 'TRANSPORTADORA_SQ'
      end>
    StoreDefs = True
    TableName = 'PEDIDOS'
    Left = 80
    Top = 256
    object ibPedidosPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object ibPedidosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object ibPedidosDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
    end
    object ibPedidosCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
    end
    object ibPedidosNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
    end
    object ibPedidosCOTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      DisplayFormat = '0.0000'
      EditFormat = '0.0000'
      Precision = 9
      Size = 4
    end
    object ibPedidosOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 8
    end
    object ibPedidosTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Required = True
    end
    object ibPedidosVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object ibPedidosNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object ibPedidosFRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object ibPedidosVLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object ibPedidosPCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Precision = 9
      Size = 2
    end
    object ibPedidosVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object ibPedidosVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object ibPedidosVLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object ibPedidosBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object ibPedidosNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object ibPedidosDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object ibPedidosPCT_JUROS: TIBBCDField
      DisplayLabel = '% Juros'
      FieldName = 'PCT_JUROS'
      DisplayFormat = '00.00%'
      Precision = 4
      Size = 2
    end
    object ibPedidosVLR_JUROS: TIBBCDField
      DisplayLabel = 'Vlr. Juros'
      FieldName = 'VLR_JUROS'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibPedidosNOME_TRANSPORTADORA: TStringField
      DisplayLabel = 'Transportadora'
      FieldKind = fkLookup
      FieldName = 'NOME_TRANSPORTADORA'
      LookupDataSet = ibListaTransportadoras
      LookupKeyFields = 'TRANSPORTADORA_SQ'
      LookupResultField = 'NOME_TRANSPORTADORA'
      KeyFields = 'TRANSPORTADORA_SQ'
      Size = 50
      Lookup = True
    end
    object ibPedidosCODIGO_NATUREZA: TIntegerField
      FieldKind = fkLookup
      FieldName = 'CODIGO_NATUREZA'
      LookupDataSet = ibListaNaturezas
      LookupKeyFields = 'NATUREZA_SQ'
      LookupResultField = 'CODIGO_NATUREZA'
      KeyFields = 'NATUREZA_SQ'
      Lookup = True
    end
    object ibPedidosDESCRICAO_COND_PAGTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_COND_PAGTO'
      LookupDataSet = ibListaCondPagto
      LookupKeyFields = 'COND_PAGTO_SQ'
      LookupResultField = 'DESCRICAO_COND_PAGTO'
      KeyFields = 'COND_PAGTO_SQ'
      Size = 50
      Lookup = True
    end
    object ibPedidosCODIGO_COND_PAGTO: TIntegerField
      FieldKind = fkLookup
      FieldName = 'CODIGO_COND_PAGTO'
      LookupDataSet = ibListaCondPagto
      LookupKeyFields = 'COND_PAGTO_SQ'
      LookupResultField = 'CODIGO_COND_PAGTO'
      KeyFields = 'COND_PAGTO_SQ'
      Lookup = True
    end
    object ibPedidosNOME_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CLIENTE'
      LookupDataSet = ibListaClientes
      LookupKeyFields = 'CLIENTE_SQ'
      LookupResultField = 'NOME_CLIENTE'
      KeyFields = 'CLIENTE_SQ'
      Size = 50
      Lookup = True
    end
    object ibPedidosCODIGO_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_CLIENTE'
      LookupDataSet = ibListaClientes
      LookupKeyFields = 'CLIENTE_SQ'
      LookupResultField = 'CODIGO_CLIENTE'
      KeyFields = 'CLIENTE_SQ'
      Lookup = True
    end
    object ibPedidosDESCRICAO_NATUREZA: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_NATUREZA'
      LookupDataSet = ibListaNaturezas
      LookupKeyFields = 'NATUREZA_SQ'
      LookupResultField = 'DESCRICAO_NATUREZA'
      KeyFields = 'NATUREZA_SQ'
      Size = 50
      Lookup = True
    end
  end
  object ibPedidosItens: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'PEDIDO_ITEM_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PEDIDO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'QTDE_PEDIDO_ITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE_ITEM'
        DataType = ftString
        Size = 2000
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
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY7'
        Fields = 'PEDIDO_ITEM_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'PEDIDOS_ITENS_X_PEDIDOS'
        Fields = 'PEDIDO_SQ'
      end>
    IndexFieldNames = 'PEDIDO_SQ'
    MasterFields = 'PEDIDO_SQ'
    MasterSource = dsPedidos
    StoreDefs = True
    TableName = 'PEDIDOS_ITENS'
    Left = 80
    Top = 304
    object ibPedidosItensPEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
    end
    object ibPedidosItensPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object ibPedidosItensPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      OnChange = ibPedidosItensPRODUTO_SQChange
    end
    object ibPedidosItensQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
      OnValidate = ibPedidosItensPRECO_UNITValidate
    end
    object ibPedidosItensNR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Size = 2000
    end
    object ibPedidosItensPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      OnValidate = ibPedidosItensPRECO_UNITValidate
      DisplayFormat = '$ ###,##0.00'
      EditFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object ibPedidosItensVLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      OnValidate = ibPedidosItensPRECO_UNITValidate
      DisplayFormat = '$ ###,##0.00'
      EditFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object ibPedidosItensPCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      OnValidate = ibPedidosItensPCT_DESCValidate
      DisplayFormat = '% #0.00'
      EditFormat = '0.00'
      Precision = 9
      Size = 2
    end
    object ibPedidosItensALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      DisplayFormat = '% #0.00'
      Precision = 4
      Size = 2
    end
    object ibPedidosItensALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      DisplayFormat = '% #0.00'
      Precision = 4
      Size = 2
    end
    object ibPedidosItensVLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibPedidosItensVLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibPedidosItensVLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibPedidosItensCODIGO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_PRODUTO'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'CODIGO_PRODUTO'
      KeyFields = 'PRODUTO_SQ'
      Lookup = True
    end
    object ibPedidosItensDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'DESCRICAO_PRODUTO'
      KeyFields = 'PRODUTO_SQ'
      Size = 50
      Lookup = True
    end
  end
  object ibUsuarios: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'USUARIO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_USUARIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOME_USUARIO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NIVEL_USUARIO'
        Attributes = [faRequired]
        DataType = ftInteger
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
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY10'
        Fields = 'USUARIO_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'USUARIOS_1'
        Fields = 'CODIGO_USUARIO'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'USUARIOS'
    Left = 80
    Top = 352
    object ibUsuariosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
    end
    object ibUsuariosCODIGO_USUARIO: TIBStringField
      FieldName = 'CODIGO_USUARIO'
    end
    object ibUsuariosNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Size = 50
    end
    object ibUsuariosNIVEL_USUARIO: TIntegerField
      FieldName = 'NIVEL_USUARIO'
    end
    object ibUsuariosSENHA_USUARIO: TIBStringField
      FieldName = 'SENHA_USUARIO'
      Size = 50
    end
    object ibUsuariosERRO_EMAIL_FROM: TIBStringField
      FieldName = 'ERRO_EMAIL_FROM'
      Size = 50
    end
    object ibUsuariosERRO_NOME_FROM: TIBStringField
      FieldName = 'ERRO_NOME_FROM'
      Size = 50
    end
    object ibUsuariosERRO_EMAIL_TO: TIBStringField
      FieldName = 'ERRO_EMAIL_TO'
      Size = 50
    end
    object ibUsuariosERRO_NOME_TO: TIBStringField
      FieldName = 'ERRO_NOME_TO'
      Size = 50
    end
    object ibUsuariosERRO_SMTP: TIBStringField
      FieldName = 'ERRO_SMTP'
      Size = 50
    end
    object ibUsuariosERRO_USERNAME: TIBStringField
      FieldName = 'ERRO_USERNAME'
      Size = 50
    end
    object ibUsuariosERRO_PASSWORD: TIBStringField
      FieldName = 'ERRO_PASSWORD'
      Size = 50
    end
  end
  object ibClientes: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CLIENTE_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_CLIENTE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME_CLIENTE'
        Attributes = [faRequired]
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
        DataType = ftBlob
        Size = 8
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
      end>
    IndexDefs = <
      item
        Name = 'CLIENTES_1'
        Fields = 'CODIGO_CLIENTE'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'CLIENTE_SQ'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'CLIENTES'
    Left = 80
    Top = 16
    object ibClientesCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Required = True
    end
    object ibClientesCODIGO_CLIENTE: TIBStringField
      FieldName = 'CODIGO_CLIENTE'
      Required = True
      Size = 15
    end
    object ibClientesNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 50
    end
    object ibClientesINSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object ibClientesENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object ibClientesNUMERO: TIBStringField
      FieldName = 'NUMERO'
    end
    object ibClientesBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object ibClientesCOMPL_ENDERECO: TIBStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object ibClientesCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object ibClientesESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object ibClientesCEP: TIBStringField
      FieldName = 'CEP'
      Size = 8
    end
    object ibClientesDDD_FONE1: TIBStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object ibClientesNUMERO_FONE1: TIBStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object ibClientesCOMPL_FONE1: TIBStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object ibClientesDDD_FONE2: TIBStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object ibClientesNUMERO_FONE2: TIBStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object ibClientesCOMPL_FONE2: TIBStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object ibClientesDDD_FONE3: TIBStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object ibClientesNUMERO_FONE3: TIBStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object ibClientesCOMPL_FONE3: TIBStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object ibClientesDDD_CELULAR: TIBStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object ibClientesNUMERO_CELULAR: TIBStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object ibClientesCOMPL_CELULAR: TIBStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object ibClientesDDD_FAX: TIBStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object ibClientesNUMERO_FAX: TIBStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object ibClientesCOMPL_FAX: TIBStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object ibClientesE_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Size = 100
    end
    object ibClientesWEB_SITE: TIBStringField
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object ibClientesCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object ibClientesPAIS: TIBStringField
      FieldName = 'PAIS'
    end
    object ibClientesOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Size = 8
    end
    object ibClientesREVENDA: TIBStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object ibClientesBIRO: TIBStringField
      FieldName = 'BIRO'
      Size = 1
    end
  end
  object ibListaCondPagto: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM COND_PAGTO')
    Left = 256
    Top = 64
    object ibListaCondPagtoCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Required = True
    end
    object ibListaCondPagtoCODIGO_COND_PAGTO: TIntegerField
      FieldName = 'CODIGO_COND_PAGTO'
      Required = True
    end
    object ibListaCondPagtoDESCRICAO_COND_PAGTO: TIBStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Required = True
      Size = 50
    end
    object ibListaCondPagtoPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Required = True
    end
    object ibListaCondPagtoD00: TIntegerField
      FieldName = 'D00'
    end
    object ibListaCondPagtoD01: TIntegerField
      FieldName = 'D01'
    end
    object ibListaCondPagtoD02: TIntegerField
      FieldName = 'D02'
    end
    object ibListaCondPagtoD03: TIntegerField
      FieldName = 'D03'
    end
    object ibListaCondPagtoD04: TIntegerField
      FieldName = 'D04'
    end
    object ibListaCondPagtoD05: TIntegerField
      FieldName = 'D05'
    end
    object ibListaCondPagtoD06: TIntegerField
      FieldName = 'D06'
    end
    object ibListaCondPagtoD07: TIntegerField
      FieldName = 'D07'
    end
    object ibListaCondPagtoD08: TIntegerField
      FieldName = 'D08'
    end
    object ibListaCondPagtoD09: TIntegerField
      FieldName = 'D09'
    end
  end
  object ibListaNaturezas: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NATUREZAS')
    Left = 256
    Top = 112
    object ibListaNaturezasNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'NATUREZAS.NATUREZA_SQ'
      Required = True
    end
    object ibListaNaturezasCODIGO_NATUREZA: TIntegerField
      FieldName = 'CODIGO_NATUREZA'
      Origin = 'NATUREZAS.CODIGO_NATUREZA'
      Required = True
    end
    object ibListaNaturezasDESCRICAO_NATUREZA: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA'
      Required = True
      Size = 50
    end
    object ibListaNaturezasCFO: TIBStringField
      FieldName = 'CFO'
      Origin = 'NATUREZAS.CFO'
      Required = True
      Size = 4
    end
    object ibListaNaturezasALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NATUREZAS.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object ibListaNaturezasALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NATUREZAS.ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object ibListaNaturezasENT_SAI: TIBStringField
      FieldName = 'ENT_SAI'
      Origin = 'NATUREZAS.ENT_SAI'
      Size = 1
    end
    object ibListaNaturezasOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'NATUREZAS.OBSERVACAO'
      Size = 8
    end
    object ibListaNaturezasUF01: TIBStringField
      FieldName = 'UF01'
      Origin = 'NATUREZAS.UF01'
      Size = 2
    end
    object ibListaNaturezasUF02: TIBStringField
      FieldName = 'UF02'
      Origin = 'NATUREZAS.UF02'
      Size = 2
    end
    object ibListaNaturezasUF03: TIBStringField
      FieldName = 'UF03'
      Origin = 'NATUREZAS.UF03'
      Size = 2
    end
    object ibListaNaturezasUF04: TIBStringField
      FieldName = 'UF04'
      Origin = 'NATUREZAS.UF04'
      Size = 2
    end
    object ibListaNaturezasUF05: TIBStringField
      FieldName = 'UF05'
      Origin = 'NATUREZAS.UF05'
      Size = 2
    end
    object ibListaNaturezasUF06: TIBStringField
      FieldName = 'UF06'
      Origin = 'NATUREZAS.UF06'
      Size = 2
    end
    object ibListaNaturezasUF07: TIBStringField
      FieldName = 'UF07'
      Origin = 'NATUREZAS.UF07'
      Size = 2
    end
    object ibListaNaturezasUF08: TIBStringField
      FieldName = 'UF08'
      Origin = 'NATUREZAS.UF08'
      Size = 2
    end
    object ibListaNaturezasUF09: TIBStringField
      FieldName = 'UF09'
      Origin = 'NATUREZAS.UF09'
      Size = 2
    end
    object ibListaNaturezasUF10: TIBStringField
      FieldName = 'UF10'
      Origin = 'NATUREZAS.UF10'
      Size = 2
    end
    object ibListaNaturezasUF11: TIBStringField
      FieldName = 'UF11'
      Origin = 'NATUREZAS.UF11'
      Size = 2
    end
    object ibListaNaturezasUF12: TIBStringField
      FieldName = 'UF12'
      Origin = 'NATUREZAS.UF12'
      Size = 2
    end
    object ibListaNaturezasUF13: TIBStringField
      FieldName = 'UF13'
      Origin = 'NATUREZAS.UF13'
      Size = 2
    end
    object ibListaNaturezasUF14: TIBStringField
      FieldName = 'UF14'
      Origin = 'NATUREZAS.UF14'
      Size = 2
    end
    object ibListaNaturezasUF15: TIBStringField
      FieldName = 'UF15'
      Origin = 'NATUREZAS.UF15'
      Size = 2
    end
    object ibListaNaturezasUF16: TIBStringField
      FieldName = 'UF16'
      Origin = 'NATUREZAS.UF16'
      Size = 2
    end
    object ibListaNaturezasUF17: TIBStringField
      FieldName = 'UF17'
      Origin = 'NATUREZAS.UF17'
      Size = 2
    end
    object ibListaNaturezasUF18: TIBStringField
      FieldName = 'UF18'
      Origin = 'NATUREZAS.UF18'
      Size = 2
    end
    object ibListaNaturezasUF19: TIBStringField
      FieldName = 'UF19'
      Origin = 'NATUREZAS.UF19'
      Size = 2
    end
    object ibListaNaturezasUF20: TIBStringField
      FieldName = 'UF20'
      Origin = 'NATUREZAS.UF20'
      Size = 2
    end
    object ibListaNaturezasUF21: TIBStringField
      FieldName = 'UF21'
      Origin = 'NATUREZAS.UF21'
      Size = 2
    end
    object ibListaNaturezasUF22: TIBStringField
      FieldName = 'UF22'
      Origin = 'NATUREZAS.UF22'
      Size = 2
    end
    object ibListaNaturezasUF23: TIBStringField
      FieldName = 'UF23'
      Origin = 'NATUREZAS.UF23'
      Size = 2
    end
    object ibListaNaturezasUF24: TIBStringField
      FieldName = 'UF24'
      Origin = 'NATUREZAS.UF24'
      Size = 2
    end
    object ibListaNaturezasUF25: TIBStringField
      FieldName = 'UF25'
      Origin = 'NATUREZAS.UF25'
      Size = 2
    end
    object ibListaNaturezasUF26: TIBStringField
      FieldName = 'UF26'
      Origin = 'NATUREZAS.UF26'
      Size = 2
    end
    object ibListaNaturezasUF27: TIBStringField
      FieldName = 'UF27'
      Origin = 'NATUREZAS.UF27'
      Size = 2
    end
    object ibListaNaturezasUF28: TIBStringField
      FieldName = 'UF28'
      Origin = 'NATUREZAS.UF28'
      Size = 2
    end
    object ibListaNaturezasUF29: TIBStringField
      FieldName = 'UF29'
      Origin = 'NATUREZAS.UF29'
      Size = 2
    end
    object ibListaNaturezasUF30: TIBStringField
      FieldName = 'UF30'
      Origin = 'NATUREZAS.UF30'
      Size = 2
    end
    object ibListaNaturezasISENCAO_IPI: TIBStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'NATUREZAS.ISENCAO_IPI'
      Size = 1
    end
    object ibListaNaturezasISENCAO_ICMS: TIBStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'NATUREZAS.ISENCAO_ICMS'
      Size = 1
    end
    object ibListaNaturezasDESCRICAO_NATUREZA_NFISCAL: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object ibListaNaturezasTIPO_NFISCAL: TIBStringField
      FieldName = 'TIPO_NFISCAL'
      Origin = 'NATUREZAS.TIPO_NFISCAL'
      Size = 1
    end
  end
  object ibListaProdutos: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PRODUTOS')
    Left = 256
    Top = 160
    object ibListaProdutosPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Required = True
    end
    object ibListaProdutosCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Required = True
    end
    object ibListaProdutosDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Required = True
      Size = 50
    end
    object ibListaProdutosQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Required = True
    end
    object ibListaProdutosNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Required = True
    end
    object ibListaProdutosMODELO_PRODUTO: TIBStringField
      FieldName = 'MODELO_PRODUTO'
    end
    object ibListaProdutosUN_PRODUTO: TIBStringField
      FieldName = 'UN_PRODUTO'
      Size = 2
    end
    object ibListaProdutosMARCA_PRODUTO: TIBStringField
      FieldName = 'MARCA_PRODUTO'
    end
    object ibListaProdutosPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object ibListaProdutosCODIGO_NBM: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_NBM'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'NBM_SQ'
      Size = 10
      Lookup = True
    end
    object ibListaProdutosALIQ_IPI: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQ_IPI'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'ALIQ_IPI'
      KeyFields = 'NBM_SQ'
      Lookup = True
    end
    object ibListaProdutosALIQ_ICMS: TFloatField
      FieldKind = fkLookup
      FieldName = 'ALIQ_ICMS'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'ALIQ_ICMS'
      KeyFields = 'NBM_SQ'
      Lookup = True
    end
  end
  object ibListaNBM: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NBM')
    Left = 256
    Top = 208
    object ibListaNBMNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Required = True
    end
    object ibListaNBMCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Required = True
      Size = 10
    end
    object ibListaNBMALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibListaNBMALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object ibListaPedidos: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PEDIDOS')
    Left = 256
    Top = 256
    object ibListaPedidosPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS.PEDIDO_SQ'
      Required = True
    end
    object ibListaPedidosCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'PEDIDOS.CLIENTE_SQ'
      Required = True
    end
    object ibListaPedidosDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
      Origin = 'PEDIDOS.DATA_PEDIDO'
      Required = True
    end
    object ibListaPedidosCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'PEDIDOS.COND_PAGTO_SQ'
      Required = True
    end
    object ibListaPedidosNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'PEDIDOS.NATUREZA_SQ'
      Required = True
    end
    object ibListaPedidosCOTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'PEDIDOS.COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object ibListaPedidosOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'PEDIDOS.OBSERVACAO'
      Size = 8
    end
    object ibListaPedidosTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'PEDIDOS.TRANSPORTADORA_SQ'
      Required = True
    end
    object ibListaPedidosVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'PEDIDOS.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosFRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'PEDIDOS.FRETE_TRANSP'
      Size = 1
    end
    object ibListaPedidosNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'PEDIDOS.NFISCAL_SQ'
    end
    object ibListaPedidosVLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS.VLR_DESC'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosPCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Origin = 'PEDIDOS.PCT_DESC'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'PEDIDOS.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'PEDIDOS.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosVLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'PEDIDOS.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'PEDIDOS.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
      Origin = 'PEDIDOS.NUMERO_PEDIDO'
    end
    object ibListaPedidosDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'PEDIDOS.DIAS_DEMONSTRACAO'
    end
    object ibListaPedidosPCT_JUROS: TIBBCDField
      FieldName = 'PCT_JUROS'
      Origin = 'PEDIDOS.PCT_JUROS'
      Precision = 4
      Size = 2
    end
    object ibListaPedidosVLR_JUROS: TIBBCDField
      FieldName = 'VLR_JUROS'
      Origin = 'PEDIDOS.VLR_JUROS'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosNUMERO_NFISCAL: TIntegerField
      FieldKind = fkLookup
      FieldName = 'NUMERO_NFISCAL'
      LookupDataSet = ibListaNfiscais
      LookupKeyFields = 'NFISCAL_SQ'
      LookupResultField = 'NUMERO_NFISCAL'
      KeyFields = 'NFISCAL_SQ'
      Lookup = True
    end
  end
  object ibListaPedidosItens: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsListaPedidos
    SQL.Strings = (
      
        'SELECT PI.*, P.CODIGO_PRODUTO, P.DESCRICAO_PRODUTO, P.QTDE_PRODU' +
        'TO, N.CODIGO_NBM'
      'FROM PEDIDOS_ITENS PI'
      'LEFT OUTER JOIN PRODUTOS P ON (P.PRODUTO_SQ = PI.PRODUTO_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'WHERE PI.PEDIDO_SQ = :PEDIDO_SQ')
    Left = 256
    Top = 304
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibListaPedidosItensPEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_ITEM_SQ'
      Required = True
    end
    object ibListaPedidosItensPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_SQ'
      Required = True
    end
    object ibListaPedidosItensPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Origin = 'PEDIDOS_ITENS.PRODUTO_SQ'
      Required = True
    end
    object ibListaPedidosItensQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
      Origin = 'PEDIDOS_ITENS.QTDE_PEDIDO_ITEM'
      Required = True
    end
    object ibListaPedidosItensNR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Origin = 'PEDIDOS_ITENS.NR_SERIE_ITEM'
      Size = 2000
    end
    object ibListaPedidosItensPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'PEDIDOS_ITENS.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosItensVLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS_ITENS.VLR_DESC'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosItensPCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Origin = 'PEDIDOS_ITENS.PCT_DESC'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosItensALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object ibListaPedidosItensALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object ibListaPedidosItensVLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosItensVLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosItensVLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaPedidosItensCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'PRODUTOS.CODIGO_PRODUTO'
    end
    object ibListaPedidosItensDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTOS.DESCRICAO_PRODUTO'
      Size = 50
    end
    object ibListaPedidosItensQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Origin = 'PRODUTOS.QTDE_PRODUTO'
    end
    object ibListaPedidosItensCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
  end
  object ibListaUsuarios: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    Left = 256
    Top = 352
    object ibListaUsuariosUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
      Required = True
    end
    object ibListaUsuariosCODIGO_USUARIO: TIBStringField
      FieldName = 'CODIGO_USUARIO'
      Required = True
    end
    object ibListaUsuariosNOME_USUARIO: TIBStringField
      FieldName = 'NOME_USUARIO'
      Required = True
      Size = 50
    end
    object ibListaUsuariosNIVEL_USUARIO: TIntegerField
      FieldName = 'NIVEL_USUARIO'
      Required = True
    end
    object ibListaUsuariosSENHA_USUARIO: TIBStringField
      FieldName = 'SENHA_USUARIO'
      Size = 50
    end
    object ibListaUsuariosERRO_EMAIL_FROM: TIBStringField
      FieldName = 'ERRO_EMAIL_FROM'
      Origin = 'USUARIOS.ERRO_EMAIL_FROM'
      Size = 50
    end
    object ibListaUsuariosERRO_NOME_FROM: TIBStringField
      FieldName = 'ERRO_NOME_FROM'
      Origin = 'USUARIOS.ERRO_NOME_FROM'
      Size = 50
    end
    object ibListaUsuariosERRO_EMAIL_TO: TIBStringField
      FieldName = 'ERRO_EMAIL_TO'
      Origin = 'USUARIOS.ERRO_EMAIL_TO'
      Size = 50
    end
    object ibListaUsuariosERRO_NOME_TO: TIBStringField
      FieldName = 'ERRO_NOME_TO'
      Origin = 'USUARIOS.ERRO_NOME_TO'
      Size = 50
    end
    object ibListaUsuariosERRO_SMTP: TIBStringField
      FieldName = 'ERRO_SMTP'
      Origin = 'USUARIOS.ERRO_SMTP'
      Size = 50
    end
    object ibListaUsuariosERRO_USERNAME: TIBStringField
      FieldName = 'ERRO_USERNAME'
      Origin = 'USUARIOS.ERRO_USERNAME'
      Size = 50
    end
    object ibListaUsuariosERRO_PASSWORD: TIBStringField
      FieldName = 'ERRO_PASSWORD'
      Origin = 'USUARIOS.ERRO_PASSWORD'
      Size = 50
    end
  end
  object ibListaClientes: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM CLIENTES')
    Left = 256
    Top = 16
    object ibListaClientesCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Required = True
    end
    object ibListaClientesCODIGO_CLIENTE: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_CLIENTE'
      Required = True
      Size = 15
    end
    object ibListaClientesNOME_CLIENTE: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_CLIENTE'
      Required = True
      Size = 50
    end
    object ibListaClientesINSCR_ESTADUAL: TIBStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSCR_ESTADUAL'
    end
    object ibListaClientesENDERECO: TIBStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object ibListaClientesNUMERO: TIBStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
    end
    object ibListaClientesBAIRRO: TIBStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 30
    end
    object ibListaClientesCOMPL_ENDERECO: TIBStringField
      DisplayLabel = 'Compl. Endere'#231'o'
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object ibListaClientesCIDADE: TIBStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      Size = 30
    end
    object ibListaClientesESTADO: TIBStringField
      DisplayLabel = 'U.F.'
      FieldName = 'ESTADO'
      Size = 2
    end
    object ibListaClientesCEP: TIBStringField
      DisplayLabel = 'C.E.P.'
      FieldName = 'CEP'
      Size = 8
    end
    object ibListaClientesDDD_FONE1: TIBStringField
      DisplayLabel = 'Fone1 DDD'
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object ibListaClientesNUMERO_FONE1: TIBStringField
      DisplayLabel = 'Fone1 Numero'
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object ibListaClientesCOMPL_FONE1: TIBStringField
      DisplayLabel = 'Fone1 Compl.'
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object ibListaClientesDDD_FONE2: TIBStringField
      DisplayLabel = 'Fone2 DDD'
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object ibListaClientesNUMERO_FONE2: TIBStringField
      DisplayLabel = 'N'#250'mero Fone2'
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object ibListaClientesCOMPL_FONE2: TIBStringField
      DisplayLabel = 'Compl. Fone2'
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object ibListaClientesDDD_FONE3: TIBStringField
      DisplayLabel = 'Fone3 DDD'
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object ibListaClientesNUMERO_FONE3: TIBStringField
      DisplayLabel = 'N'#250'mero Fone3'
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object ibListaClientesCOMPL_FONE3: TIBStringField
      DisplayLabel = 'Compl. Fone3'
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object ibListaClientesDDD_CELULAR: TIBStringField
      DisplayLabel = 'Celular DDD'
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object ibListaClientesNUMERO_CELULAR: TIBStringField
      DisplayLabel = 'Celular N'#250'mero'
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object ibListaClientesCOMPL_CELULAR: TIBStringField
      DisplayLabel = 'Celular Compl.'
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object ibListaClientesDDD_FAX: TIBStringField
      DisplayLabel = 'Fax DDD'
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object ibListaClientesNUMERO_FAX: TIBStringField
      DisplayLabel = 'Fax N'#250'mero'
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object ibListaClientesCOMPL_FAX: TIBStringField
      DisplayLabel = 'Fax Compl.'
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object ibListaClientesE_MAIL: TIBStringField
      DisplayLabel = 'E-Mail'
      FieldName = 'E_MAIL'
      Size = 100
    end
    object ibListaClientesWEB_SITE: TIBStringField
      DisplayLabel = 'Web Site'
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object ibListaClientesCONTATO: TIBStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 50
    end
    object ibListaClientesPAIS: TIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
    end
    object ibListaClientesOBSERVACAO: TBlobField
      DisplayLabel = 'Observa'#231#227'o'
      FieldName = 'OBSERVACAO'
      Size = 8
    end
    object ibListaClientesREVENDA: TIBStringField
      FieldName = 'REVENDA'
      Origin = 'CLIENTES.REVENDA'
      Size = 1
    end
    object ibListaClientesBIRO: TIBStringField
      FieldName = 'BIRO'
      Origin = 'CLIENTES.BIRO'
      Size = 1
    end
  end
  object ibTransportadoras: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'TRANSPORTADORA_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CODIGO_TRANSPORTADORA'
        Attributes = [faRequired]
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
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY9'
        Fields = 'TRANSPORTADORA_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'TRANSPORTADORA_1'
        Fields = 'CODIGO_TRANSPORTADORA'
        Options = [ixUnique]
      end>
    StoreDefs = True
    TableName = 'TRANSPORTADORAS'
    Left = 152
    Top = 16
    object ibTransportadorasTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
    end
    object ibTransportadorasCODIGO_TRANSPORTADORA: TIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object ibTransportadorasNOME_TRANSPORTADORA: TIBStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object ibTransportadorasENDERECO_TRANSPORTADORA: TIBStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object ibTransportadorasMUNICIPIO_TRANSPORTADORA: TIBStringField
      DisplayLabel = 'Munic'#237'pio'
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object ibTransportadorasESTADO_TRANSPORTADORA: TIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object ibTransportadorasINSCR_ESTADUAL: TIBStringField
      DisplayLabel = 'Inscri'#231#227'o Estadual'
      FieldName = 'INSCR_ESTADUAL'
    end
    object ibTransportadorasDDD_FONE: TIBStringField
      FieldName = 'DDD_FONE'
      Size = 4
    end
    object ibTransportadorasNUMERO_FONE: TIBStringField
      FieldName = 'NUMERO_FONE'
      Size = 15
    end
    object ibTransportadorasCOMPL_FONE: TIBStringField
      FieldName = 'COMPL_FONE'
      Size = 10
    end
  end
  object ibListaTransportadoras: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM TRANSPORTADORAS')
    Left = 328
    Top = 16
    object ibListaTransportadorasTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Required = True
    end
    object ibListaTransportadorasCODIGO_TRANSPORTADORA: TIBStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Required = True
      Size = 15
    end
    object ibListaTransportadorasNOME_TRANSPORTADORA: TIBStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Size = 50
    end
    object ibListaTransportadorasENDERECO_TRANSPORTADORA: TIBStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object ibListaTransportadorasMUNICIPIO_TRANSPORTADORA: TIBStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object ibListaTransportadorasESTADO_TRANSPORTADORA: TIBStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object ibListaTransportadorasINSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object ibListaTransportadorasDDD_FONE: TIBStringField
      FieldName = 'DDD_FONE'
      Origin = 'TRANSPORTADORAS.DDD_FONE'
      Size = 4
    end
    object ibListaTransportadorasNUMERO_FONE: TIBStringField
      FieldName = 'NUMERO_FONE'
      Origin = 'TRANSPORTADORAS.NUMERO_FONE'
      Size = 15
    end
    object ibListaTransportadorasCOMPL_FONE: TIBStringField
      FieldName = 'COMPL_FONE'
      Origin = 'TRANSPORTADORAS.COMPL_FONE'
      Size = 10
    end
  end
  object ibEmpresas: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    BeforeClose = ibEmpresasBeforeClose
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'CODIGO_EMPRESA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NOME_EMPRESA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ACESSOS'
        DataType = ftInteger
      end
      item
        Name = 'SENHA'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'NUMERO_NFISCAL'
        DataType = ftInteger
      end
      item
        Name = 'ESTADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NUMERO_PEDIDO'
        DataType = ftInteger
      end
      item
        Name = 'ALT_DATA_PEDIDO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALT_DTEMISSAO_NFISCAL'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALIQ_ICMS'
        DataType = ftBCD
        Precision = 9
        Size = 2
      end
      item
        Name = 'STRIBUT'
        DataType = ftInteger
      end
      item
        Name = 'ALT_NR_PEDIDO'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ALT_NR_NFISCAL'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY3'
        Fields = 'CODIGO_EMPRESA'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'EMPRESAS'
    Left = 152
    Top = 64
    object ibEmpresasCODIGO_EMPRESA: TIBStringField
      FieldName = 'CODIGO_EMPRESA'
      Size = 15
    end
    object ibEmpresasNOME_EMPRESA: TIBStringField
      FieldName = 'NOME_EMPRESA'
      Size = 50
    end
    object ibEmpresasACESSOS: TIntegerField
      FieldName = 'ACESSOS'
    end
    object ibEmpresasSENHA: TIBStringField
      FieldName = 'SENHA'
      Size = 14
    end
    object ibEmpresasNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
    end
    object ibEmpresasESTADO: TIBStringField
      FieldName = 'ESTADO'
      OnValidate = ibEmpresasESTADOValidate
      Size = 2
    end
    object ibEmpresasNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object ibEmpresasALT_DATA_PEDIDO: TIBStringField
      FieldName = 'ALT_DATA_PEDIDO'
      Size = 1
    end
    object ibEmpresasALT_DTEMISSAO_NFISCAL: TIBStringField
      FieldName = 'ALT_DTEMISSAO_NFISCAL'
      Size = 1
    end
    object ibEmpresasALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object ibEmpresasSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object ibEmpresasALT_NR_PEDIDO: TIBStringField
      FieldName = 'ALT_NR_PEDIDO'
      Size = 1
    end
    object ibEmpresasALT_NR_NFISCAL: TIBStringField
      FieldName = 'ALT_NR_NFISCAL'
      Size = 1
    end
  end
  object ibImprPed: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PEDIDOS P'
      
        'LEFT OUTER JOIN CLIENTES                     C ON (C.CLIENTE_SQ ' +
        '= P.CLIENTE_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO           CP ON (CP.COND_PAGTO_SQ = P' +
        '.COND_PAGTO_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS                N ON (N.NATUREZA_SQ = P' +
        '.NATUREZA_SQ)'
      
        'LEFT OUTER JOIN TRANSPORTADORAS T ON (T.TRANSPORTADORA_SQ = P.TR' +
        'ANSPORTADORA_SQ)'
      'WHERE NUMERO_PEDIDO = :NUMERO_PEDIDO')
    Left = 440
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMERO_PEDIDO'
        ParamType = ptUnknown
      end>
    object ibImprPedPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS.PEDIDO_SQ'
      Required = True
    end
    object ibImprPedCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'PEDIDOS.CLIENTE_SQ'
      Required = True
    end
    object ibImprPedDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
      Origin = 'PEDIDOS.DATA_PEDIDO'
      Required = True
    end
    object ibImprPedCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'PEDIDOS.COND_PAGTO_SQ'
      Required = True
    end
    object ibImprPedNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'PEDIDOS.NATUREZA_SQ'
      Required = True
    end
    object ibImprPedCOTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'PEDIDOS.COTACAO_DOLAR'
      currency = True
      Precision = 9
      Size = 4
    end
    object ibImprPedOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'PEDIDOS.OBSERVACAO'
      Size = 8
    end
    object ibImprPedTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'PEDIDOS.TRANSPORTADORA_SQ'
      Required = True
    end
    object ibImprPedVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'PEDIDOS.VLR_FRETE'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprPedFRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'PEDIDOS.FRETE_TRANSP'
      Size = 1
    end
    object ibImprPedNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'PEDIDOS.NFISCAL_SQ'
    end
    object ibImprPedVLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS.VLR_DESC'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprPedPCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Origin = 'PEDIDOS.PCT_DESC'
      Precision = 9
      Size = 2
    end
    object ibImprPedVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'PEDIDOS.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object ibImprPedVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'PEDIDOS.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object ibImprPedVLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'PEDIDOS.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object ibImprPedBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'PEDIDOS.BASE_ICMS'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprPedNUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
      Origin = 'PEDIDOS.NUMERO_PEDIDO'
    end
    object ibImprPedDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'PEDIDOS.DIAS_DEMONSTRACAO'
    end
    object ibImprPedVLR_JUROS: TIBBCDField
      FieldName = 'VLR_JUROS'
      Origin = 'PEDIDOS.VLR_JUROS'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprPedPCT_JUROS: TIBBCDField
      FieldName = 'PCT_JUROS'
      Origin = 'PEDIDOS.PCT_JUROS'
      Precision = 4
      Size = 2
    end
    object ibImprPedCLIENTE_SQ1: TIntegerField
      FieldName = 'CLIENTE_SQ1'
      Origin = 'CLIENTES.CLIENTE_SQ'
    end
    object ibImprPedCODIGO_CLIENTE: TIBStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'CLIENTES.CODIGO_CLIENTE'
      Size = 15
    end
    object ibImprPedNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'CLIENTES.NOME_CLIENTE'
      Size = 50
    end
    object ibImprPedINSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'CLIENTES.INSCR_ESTADUAL'
    end
    object ibImprPedENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES.ENDERECO'
      Size = 50
    end
    object ibImprPedNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = 'CLIENTES.NUMERO'
    end
    object ibImprPedBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 30
    end
    object ibImprPedCOMPL_ENDERECO: TIBStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'CLIENTES.COMPL_ENDERECO'
      Size = 50
    end
    object ibImprPedCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTES.CIDADE'
      Size = 30
    end
    object ibImprPedESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CLIENTES.ESTADO'
      Size = 2
    end
    object ibImprPedCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTES.CEP'
      Size = 8
    end
    object ibImprPedDDD_FONE1: TIBStringField
      FieldName = 'DDD_FONE1'
      Origin = 'CLIENTES.DDD_FONE1'
      Size = 4
    end
    object ibImprPedNUMERO_FONE1: TIBStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'CLIENTES.NUMERO_FONE1'
      Size = 15
    end
    object ibImprPedCOMPL_FONE1: TIBStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'CLIENTES.COMPL_FONE1'
      Size = 10
    end
    object ibImprPedDDD_FONE2: TIBStringField
      FieldName = 'DDD_FONE2'
      Origin = 'CLIENTES.DDD_FONE2'
      Size = 4
    end
    object ibImprPedNUMERO_FONE2: TIBStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'CLIENTES.NUMERO_FONE2'
      Size = 15
    end
    object ibImprPedCOMPL_FONE2: TIBStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'CLIENTES.COMPL_FONE2'
      Size = 10
    end
    object ibImprPedDDD_FONE3: TIBStringField
      FieldName = 'DDD_FONE3'
      Origin = 'CLIENTES.DDD_FONE3'
      Size = 4
    end
    object ibImprPedNUMERO_FONE3: TIBStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'CLIENTES.NUMERO_FONE3'
      Size = 15
    end
    object ibImprPedCOMPL_FONE3: TIBStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'CLIENTES.COMPL_FONE3'
      Size = 10
    end
    object ibImprPedDDD_CELULAR: TIBStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'CLIENTES.DDD_CELULAR'
      Size = 4
    end
    object ibImprPedNUMERO_CELULAR: TIBStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'CLIENTES.NUMERO_CELULAR'
      Size = 15
    end
    object ibImprPedCOMPL_CELULAR: TIBStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'CLIENTES.COMPL_CELULAR'
      Size = 10
    end
    object ibImprPedDDD_FAX: TIBStringField
      FieldName = 'DDD_FAX'
      Origin = 'CLIENTES.DDD_FAX'
      Size = 4
    end
    object ibImprPedNUMERO_FAX: TIBStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'CLIENTES.NUMERO_FAX'
      Size = 15
    end
    object ibImprPedCOMPL_FAX: TIBStringField
      FieldName = 'COMPL_FAX'
      Origin = 'CLIENTES.COMPL_FAX'
      Size = 10
    end
    object ibImprPedE_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Origin = 'CLIENTES.E_MAIL'
      Size = 100
    end
    object ibImprPedWEB_SITE: TIBStringField
      FieldName = 'WEB_SITE'
      Origin = 'CLIENTES.WEB_SITE'
      Size = 100
    end
    object ibImprPedCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'CLIENTES.CONTATO'
      Size = 50
    end
    object ibImprPedPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
    end
    object ibImprPedOBSERVACAO1: TBlobField
      FieldName = 'OBSERVACAO1'
      Origin = 'CLIENTES.OBSERVACAO'
      Size = 8
    end
    object ibImprPedREVENDA: TIBStringField
      FieldName = 'REVENDA'
      Origin = 'CLIENTES.REVENDA'
      Size = 1
    end
    object ibImprPedBIRO: TIBStringField
      FieldName = 'BIRO'
      Origin = 'CLIENTES.BIRO'
      Size = 1
    end
    object ibImprPedCOND_PAGTO_SQ1: TIntegerField
      FieldName = 'COND_PAGTO_SQ1'
      Origin = 'COND_PAGTO.COND_PAGTO_SQ'
    end
    object ibImprPedCODIGO_COND_PAGTO: TIntegerField
      FieldName = 'CODIGO_COND_PAGTO'
      Origin = 'COND_PAGTO.CODIGO_COND_PAGTO'
    end
    object ibImprPedDESCRICAO_COND_PAGTO: TIBStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Origin = 'COND_PAGTO.DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object ibImprPedPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'COND_PAGTO.PARCELAS'
    end
    object ibImprPedD00: TIntegerField
      FieldName = 'D00'
      Origin = 'COND_PAGTO.D00'
    end
    object ibImprPedD01: TIntegerField
      FieldName = 'D01'
      Origin = 'COND_PAGTO.D01'
    end
    object ibImprPedD02: TIntegerField
      FieldName = 'D02'
      Origin = 'COND_PAGTO.D02'
    end
    object ibImprPedD03: TIntegerField
      FieldName = 'D03'
      Origin = 'COND_PAGTO.D03'
    end
    object ibImprPedD04: TIntegerField
      FieldName = 'D04'
      Origin = 'COND_PAGTO.D04'
    end
    object ibImprPedD05: TIntegerField
      FieldName = 'D05'
      Origin = 'COND_PAGTO.D05'
    end
    object ibImprPedD06: TIntegerField
      FieldName = 'D06'
      Origin = 'COND_PAGTO.D06'
    end
    object ibImprPedD07: TIntegerField
      FieldName = 'D07'
      Origin = 'COND_PAGTO.D07'
    end
    object ibImprPedD08: TIntegerField
      FieldName = 'D08'
      Origin = 'COND_PAGTO.D08'
    end
    object ibImprPedD09: TIntegerField
      FieldName = 'D09'
      Origin = 'COND_PAGTO.D09'
    end
    object ibImprPedNATUREZA_SQ1: TIntegerField
      FieldName = 'NATUREZA_SQ1'
      Origin = 'NATUREZAS.NATUREZA_SQ'
    end
    object ibImprPedCODIGO_NATUREZA: TIntegerField
      FieldName = 'CODIGO_NATUREZA'
      Origin = 'NATUREZAS.CODIGO_NATUREZA'
    end
    object ibImprPedDESCRICAO_NATUREZA: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA'
      Size = 50
    end
    object ibImprPedCFO: TIBStringField
      FieldName = 'CFO'
      Origin = 'NATUREZAS.CFO'
      Size = 4
    end
    object ibImprPedALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NATUREZAS.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object ibImprPedALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NATUREZAS.ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object ibImprPedENT_SAI: TIBStringField
      FieldName = 'ENT_SAI'
      Origin = 'NATUREZAS.ENT_SAI'
      Size = 1
    end
    object ibImprPedOBSERVACAO2: TBlobField
      FieldName = 'OBSERVACAO2'
      Origin = 'NATUREZAS.OBSERVACAO'
      Size = 8
    end
    object ibImprPedUF01: TIBStringField
      FieldName = 'UF01'
      Origin = 'NATUREZAS.UF01'
      Size = 2
    end
    object ibImprPedUF02: TIBStringField
      FieldName = 'UF02'
      Origin = 'NATUREZAS.UF02'
      Size = 2
    end
    object ibImprPedUF03: TIBStringField
      FieldName = 'UF03'
      Origin = 'NATUREZAS.UF03'
      Size = 2
    end
    object ibImprPedUF04: TIBStringField
      FieldName = 'UF04'
      Origin = 'NATUREZAS.UF04'
      Size = 2
    end
    object ibImprPedUF05: TIBStringField
      FieldName = 'UF05'
      Origin = 'NATUREZAS.UF05'
      Size = 2
    end
    object ibImprPedUF06: TIBStringField
      FieldName = 'UF06'
      Origin = 'NATUREZAS.UF06'
      Size = 2
    end
    object ibImprPedUF07: TIBStringField
      FieldName = 'UF07'
      Origin = 'NATUREZAS.UF07'
      Size = 2
    end
    object ibImprPedUF08: TIBStringField
      FieldName = 'UF08'
      Origin = 'NATUREZAS.UF08'
      Size = 2
    end
    object ibImprPedUF09: TIBStringField
      FieldName = 'UF09'
      Origin = 'NATUREZAS.UF09'
      Size = 2
    end
    object ibImprPedUF10: TIBStringField
      FieldName = 'UF10'
      Origin = 'NATUREZAS.UF10'
      Size = 2
    end
    object ibImprPedUF11: TIBStringField
      FieldName = 'UF11'
      Origin = 'NATUREZAS.UF11'
      Size = 2
    end
    object ibImprPedUF12: TIBStringField
      FieldName = 'UF12'
      Origin = 'NATUREZAS.UF12'
      Size = 2
    end
    object ibImprPedUF13: TIBStringField
      FieldName = 'UF13'
      Origin = 'NATUREZAS.UF13'
      Size = 2
    end
    object ibImprPedUF14: TIBStringField
      FieldName = 'UF14'
      Origin = 'NATUREZAS.UF14'
      Size = 2
    end
    object ibImprPedUF15: TIBStringField
      FieldName = 'UF15'
      Origin = 'NATUREZAS.UF15'
      Size = 2
    end
    object ibImprPedUF16: TIBStringField
      FieldName = 'UF16'
      Origin = 'NATUREZAS.UF16'
      Size = 2
    end
    object ibImprPedUF17: TIBStringField
      FieldName = 'UF17'
      Origin = 'NATUREZAS.UF17'
      Size = 2
    end
    object ibImprPedUF18: TIBStringField
      FieldName = 'UF18'
      Origin = 'NATUREZAS.UF18'
      Size = 2
    end
    object ibImprPedUF19: TIBStringField
      FieldName = 'UF19'
      Origin = 'NATUREZAS.UF19'
      Size = 2
    end
    object ibImprPedUF20: TIBStringField
      FieldName = 'UF20'
      Origin = 'NATUREZAS.UF20'
      Size = 2
    end
    object ibImprPedUF21: TIBStringField
      FieldName = 'UF21'
      Origin = 'NATUREZAS.UF21'
      Size = 2
    end
    object ibImprPedUF22: TIBStringField
      FieldName = 'UF22'
      Origin = 'NATUREZAS.UF22'
      Size = 2
    end
    object ibImprPedUF23: TIBStringField
      FieldName = 'UF23'
      Origin = 'NATUREZAS.UF23'
      Size = 2
    end
    object ibImprPedUF24: TIBStringField
      FieldName = 'UF24'
      Origin = 'NATUREZAS.UF24'
      Size = 2
    end
    object ibImprPedUF25: TIBStringField
      FieldName = 'UF25'
      Origin = 'NATUREZAS.UF25'
      Size = 2
    end
    object ibImprPedUF26: TIBStringField
      FieldName = 'UF26'
      Origin = 'NATUREZAS.UF26'
      Size = 2
    end
    object ibImprPedUF27: TIBStringField
      FieldName = 'UF27'
      Origin = 'NATUREZAS.UF27'
      Size = 2
    end
    object ibImprPedUF28: TIBStringField
      FieldName = 'UF28'
      Origin = 'NATUREZAS.UF28'
      Size = 2
    end
    object ibImprPedUF29: TIBStringField
      FieldName = 'UF29'
      Origin = 'NATUREZAS.UF29'
      Size = 2
    end
    object ibImprPedUF30: TIBStringField
      FieldName = 'UF30'
      Origin = 'NATUREZAS.UF30'
      Size = 2
    end
    object ibImprPedISENCAO_IPI: TIBStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'NATUREZAS.ISENCAO_IPI'
      Size = 1
    end
    object ibImprPedISENCAO_ICMS: TIBStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'NATUREZAS.ISENCAO_ICMS'
      Size = 1
    end
    object ibImprPedTRANSPORTADORA_SQ1: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ1'
      Origin = 'TRANSPORTADORAS.TRANSPORTADORA_SQ'
    end
    object ibImprPedCODIGO_TRANSPORTADORA: TIBStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object ibImprPedNOME_TRANSPORTADORA: TIBStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.NOME_TRANSPORTADORA'
      Size = 50
    end
    object ibImprPedENDERECO_TRANSPORTADORA: TIBStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object ibImprPedMUNICIPIO_TRANSPORTADORA: TIBStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object ibImprPedESTADO_TRANSPORTADORA: TIBStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object ibImprPedINSCR_ESTADUAL1: TIBStringField
      FieldName = 'INSCR_ESTADUAL1'
      Origin = 'TRANSPORTADORAS.INSCR_ESTADUAL'
    end
    object ibImprPedDESCRICAO_NATUREZA_NFISCAL: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object ibImprPedTIPO_NFISCAL: TIBStringField
      FieldName = 'TIPO_NFISCAL'
      Origin = 'NATUREZAS.TIPO_NFISCAL'
      Size = 1
    end
    object ibImprPedDDD_FONE: TIBStringField
      FieldName = 'DDD_FONE'
      Origin = 'TRANSPORTADORAS.DDD_FONE'
      Size = 4
    end
    object ibImprPedNUMERO_FONE: TIBStringField
      FieldName = 'NUMERO_FONE'
      Origin = 'TRANSPORTADORAS.NUMERO_FONE'
      Size = 15
    end
    object ibImprPedCOMPL_FONE: TIBStringField
      FieldName = 'COMPL_FONE'
      Origin = 'TRANSPORTADORAS.COMPL_FONE'
      Size = 10
    end
  end
  object ibImprPedItem: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM PEDIDOS_ITENS PI'
      'LEFT OUTER JOIN PRODUTOS PR ON (PR.PRODUTO_SQ = PI.PRODUTO_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = PR.NBM_SQ)'
      'WHERE PEDIDO_SQ = :PEDIDO_SQ')
    Left = 440
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
      end>
    object ibImprPedItemPEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_ITEM_SQ'
      Required = True
    end
    object ibImprPedItemPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_SQ'
      Required = True
    end
    object ibImprPedItemPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Origin = 'PEDIDOS_ITENS.PRODUTO_SQ'
      Required = True
    end
    object ibImprPedItemQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
      Origin = 'PEDIDOS_ITENS.QTDE_PEDIDO_ITEM'
      Required = True
    end
    object ibImprPedItemNR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Origin = 'PEDIDOS_ITENS.NR_SERIE_ITEM'
      Size = 2000
    end
    object ibImprPedItemPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'PEDIDOS_ITENS.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemVLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS_ITENS.VLR_DESC'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemPCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Origin = 'PEDIDOS_ITENS.PCT_DESC'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object ibImprPedItemALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object ibImprPedItemVLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemVLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemVLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemPRODUTO_SQ1: TIntegerField
      FieldName = 'PRODUTO_SQ1'
      Origin = 'PRODUTOS.PRODUTO_SQ'
    end
    object ibImprPedItemCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'PRODUTOS.CODIGO_PRODUTO'
    end
    object ibImprPedItemDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTOS.DESCRICAO_PRODUTO'
      Size = 50
    end
    object ibImprPedItemQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Origin = 'PRODUTOS.QTDE_PRODUTO'
    end
    object ibImprPedItemNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'PRODUTOS.NBM_SQ'
    end
    object ibImprPedItemMODELO_PRODUTO: TIBStringField
      FieldName = 'MODELO_PRODUTO'
      Origin = 'PRODUTOS.MODELO_PRODUTO'
    end
    object ibImprPedItemUN_PRODUTO: TIBStringField
      FieldName = 'UN_PRODUTO'
      Origin = 'PRODUTOS.UN_PRODUTO'
      Size = 2
    end
    object ibImprPedItemMARCA_PRODUTO: TIBStringField
      FieldName = 'MARCA_PRODUTO'
      Origin = 'PRODUTOS.MARCA_PRODUTO'
    end
    object ibImprPedItemPRECO_UNIT1: TIBBCDField
      FieldName = 'PRECO_UNIT1'
      Origin = 'PRODUTOS.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object ibImprPedItemNBM_SQ1: TIntegerField
      FieldName = 'NBM_SQ1'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprPedItemCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprPedItemALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprPedItemALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object ibNfiscais: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    ForcedRefresh = True
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NFISCAL_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_NFISCAL'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'DTEMISSAO_NFISCAL'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'DTSAIDA_NFISCAL'
        Attributes = [faRequired]
        DataType = ftDateTime
      end
      item
        Name = 'PEDIDO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'COND_PAGTO_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NATUREZA_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TRANSPORTADORA_SQ'
        Attributes = [faRequired]
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
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'CANCELADA'
        Attributes = [faRequired]
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
      end>
    IndexDefs = <
      item
        Name = 'NFISCAIS_1'
        Fields = 'NUMERO_NFISCAL'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY24'
        Fields = 'NFISCAL_SQ'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'NFISCAIS'
    Left = 152
    Top = 112
    object ibNfiscaisNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Required = True
    end
    object ibNfiscaisNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Required = True
    end
    object ibNfiscaisDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Required = True
    end
    object ibNfiscaisDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
      Required = True
    end
    object ibNfiscaisPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Required = True
    end
    object ibNfiscaisCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Required = True
    end
    object ibNfiscaisCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Required = True
    end
    object ibNfiscaisNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Required = True
    end
    object ibNfiscaisTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Required = True
    end
    object ibNfiscaisBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisBASE_ICMS_SUBST: TIBBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_ICMS_SUBST: TIBBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_SEGURO: TIBBCDField
      FieldName = 'VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_DESP_ACESS: TIBBCDField
      FieldName = 'VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisVLR_TOTAL: TIBBCDField
      FieldName = 'VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object ibNfiscaisFRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Size = 1
    end
    object ibNfiscaisPLACA_TRANSP: TIBStringField
      FieldName = 'PLACA_TRANSP'
      Size = 7
    end
    object ibNfiscaisUF_PLACA_TRANSP: TIBStringField
      FieldName = 'UF_PLACA_TRANSP'
      Size = 2
    end
    object ibNfiscaisQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
    end
    object ibNfiscaisESPECIE_TRANSP: TIBStringField
      FieldName = 'ESPECIE_TRANSP'
    end
    object ibNfiscaisMARCA_TRANSP: TIBStringField
      FieldName = 'MARCA_TRANSP'
      Size = 30
    end
    object ibNfiscaisNUMERO_TRANSP: TIBStringField
      FieldName = 'NUMERO_TRANSP'
      Size = 10
    end
    object ibNfiscaisPBRUTO_TRANSP: TIBStringField
      FieldName = 'PBRUTO_TRANSP'
    end
    object ibNfiscaisPLIQUIDO_TRANSP: TIBStringField
      FieldName = 'PLIQUIDO_TRANSP'
    end
    object ibNfiscaisCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
    end
    object ibNfiscaisCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
    end
    object ibNfiscaisCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
    end
    object ibNfiscaisCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
    end
    object ibNfiscaisCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
    end
    object ibNfiscaisCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
    end
    object ibNfiscaisCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
    end
    object ibNfiscaisMENSAGEM: TBlobField
      FieldName = 'MENSAGEM'
      Size = 8
    end
    object ibNfiscaisCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Required = True
      Size = 1
    end
    object ibNfiscaisDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
    end
    object ibNfiscaisCOTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object ibNfiscaisCODIGO_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_CLIENTE'
      LookupDataSet = ibListaClientes
      LookupKeyFields = 'CLIENTE_SQ'
      LookupResultField = 'CODIGO_CLIENTE'
      KeyFields = 'CLIENTE_SQ'
      Lookup = True
    end
    object ibNfiscaisNOME_CLIENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_CLIENTE'
      LookupDataSet = ibListaClientes
      LookupKeyFields = 'CLIENTE_SQ'
      LookupResultField = 'NOME_CLIENTE'
      KeyFields = 'CLIENTE_SQ'
      Size = 50
      Lookup = True
    end
    object ibNfiscaisCODIGO_COND_PAGTO: TIntegerField
      FieldKind = fkLookup
      FieldName = 'CODIGO_COND_PAGTO'
      LookupDataSet = ibListaCondPagto
      LookupKeyFields = 'COND_PAGTO_SQ'
      LookupResultField = 'CODIGO_COND_PAGTO'
      KeyFields = 'COND_PAGTO_SQ'
      Lookup = True
    end
    object ibNfiscaisDESCRICAO_COND_PAGTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_COND_PAGTO'
      LookupDataSet = ibListaCondPagto
      LookupKeyFields = 'COND_PAGTO_SQ'
      LookupResultField = 'DESCRICAO_COND_PAGTO'
      KeyFields = 'COND_PAGTO_SQ'
      Size = 50
      Lookup = True
    end
    object ibNfiscaisCODIGO_NATUREZA: TIntegerField
      FieldKind = fkLookup
      FieldName = 'CODIGO_NATUREZA'
      LookupDataSet = ibListaNaturezas
      LookupKeyFields = 'NATUREZA_SQ'
      LookupResultField = 'CODIGO_NATUREZA'
      KeyFields = 'NATUREZA_SQ'
      Lookup = True
    end
    object ibNfiscaisNOME_TRANSPORTADORA: TStringField
      FieldKind = fkLookup
      FieldName = 'NOME_TRANSPORTADORA'
      LookupDataSet = ibListaTransportadoras
      LookupKeyFields = 'TRANSPORTADORA_SQ'
      LookupResultField = 'NOME_TRANSPORTADORA'
      KeyFields = 'TRANSPORTADORA_SQ'
      Size = 50
      Lookup = True
    end
    object ibNfiscaisNBM1: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM1'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL1'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNBM2: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM2'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL2'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNBM3: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM3'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL3'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNBM4: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM4'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL4'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNBM5: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM5'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL5'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNBM6: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM6'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL6'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNBM7: TStringField
      FieldKind = fkLookup
      FieldName = 'NBM7'
      LookupDataSet = ibListaNBM
      LookupKeyFields = 'NBM_SQ'
      LookupResultField = 'CODIGO_NBM'
      KeyFields = 'CLASS_FISCAL7'
      Size = 10
      Lookup = True
    end
    object ibNfiscaisNR_NFISCAL_RETORNO: TIntegerField
      FieldName = 'NR_NFISCAL_RETORNO'
    end
    object ibNfiscaisDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
    end
  end
  object ibNfiscaisItens: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'NFISCAL_ITEM_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NFISCAL_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ITEM'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO_SQ'
        DataType = ftInteger
      end
      item
        Name = 'NR_SERIE_ITEM'
        DataType = ftString
        Size = 2000
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
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY26'
        Fields = 'NFISCAL_ITEM_SQ'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'NFISCAL_SQ'
    MasterFields = 'NFISCAL_SQ'
    MasterSource = dsNfiscais
    StoreDefs = True
    TableName = 'NFISCAIS_ITENS'
    Left = 152
    Top = 160
    object ibNfiscaisItensNFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
    end
    object ibNfiscaisItensNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object ibNfiscaisItensITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object ibNfiscaisItensPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object ibNfiscaisItensNR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Size = 2000
    end
    object ibNfiscaisItensCLASS_FISCAL: TIBStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object ibNfiscaisItensSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object ibNfiscaisItensQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
    end
    object ibNfiscaisItensVLR_UNIT_ITEM: TIBBCDField
      FieldName = 'VLR_UNIT_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibNfiscaisItensVLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibNfiscaisItensALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object ibNfiscaisItensALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object ibNfiscaisItensVLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibNfiscaisItensVLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibNfiscaisItensCODIGO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_PRODUTO'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'CODIGO_PRODUTO'
      KeyFields = 'PRODUTO_SQ'
      Lookup = True
    end
    object ibNfiscaisItensDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'DESCRICAO_PRODUTO'
      KeyFields = 'PRODUTO_SQ'
      Size = 50
      Lookup = True
    end
    object ibNfiscaisItensNBM_SQ: TIntegerField
      FieldKind = fkLookup
      FieldName = 'NBM_SQ'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'NBM_SQ'
      KeyFields = 'PRODUTO_SQ'
      Lookup = True
    end
  end
  object ibListaNfiscais: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NFISCAIS')
    Left = 328
    Top = 112
    object ibListaNfiscaisNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS.NFISCAL_SQ'
      Required = True
    end
    object ibListaNfiscaisNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
      Required = True
    end
    object ibListaNfiscaisDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'NFISCAIS.DTEMISSAO_NFISCAL'
      Required = True
    end
    object ibListaNfiscaisDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
      Origin = 'NFISCAIS.DTSAIDA_NFISCAL'
      Required = True
    end
    object ibListaNfiscaisPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'NFISCAIS.PEDIDO_SQ'
      Required = True
    end
    object ibListaNfiscaisCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'NFISCAIS.CLIENTE_SQ'
      Required = True
    end
    object ibListaNfiscaisCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'NFISCAIS.COND_PAGTO_SQ'
      Required = True
    end
    object ibListaNfiscaisNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'NFISCAIS.NATUREZA_SQ'
      Required = True
    end
    object ibListaNfiscaisTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'NFISCAIS.TRANSPORTADORA_SQ'
      Required = True
    end
    object ibListaNfiscaisBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'NFISCAIS.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'NFISCAIS.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisBASE_ICMS_SUBST: TIBBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = 'NFISCAIS.BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_ICMS_SUBST: TIBBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Origin = 'NFISCAIS.VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'NFISCAIS.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'NFISCAIS.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_SEGURO: TIBBCDField
      FieldName = 'VLR_SEGURO'
      Origin = 'NFISCAIS.VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_DESP_ACESS: TIBBCDField
      FieldName = 'VLR_DESP_ACESS'
      Origin = 'NFISCAIS.VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'NFISCAIS.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisVLR_TOTAL: TIBBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'NFISCAIS.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisFRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'NFISCAIS.FRETE_TRANSP'
      Size = 1
    end
    object ibListaNfiscaisPLACA_TRANSP: TIBStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'NFISCAIS.PLACA_TRANSP'
      Size = 7
    end
    object ibListaNfiscaisUF_PLACA_TRANSP: TIBStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'NFISCAIS.UF_PLACA_TRANSP'
      Size = 2
    end
    object ibListaNfiscaisQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
      Origin = 'NFISCAIS.QTDE_TRANSP'
    end
    object ibListaNfiscaisESPECIE_TRANSP: TIBStringField
      FieldName = 'ESPECIE_TRANSP'
      Origin = 'NFISCAIS.ESPECIE_TRANSP'
    end
    object ibListaNfiscaisMARCA_TRANSP: TIBStringField
      FieldName = 'MARCA_TRANSP'
      Origin = 'NFISCAIS.MARCA_TRANSP'
      Size = 30
    end
    object ibListaNfiscaisNUMERO_TRANSP: TIBStringField
      FieldName = 'NUMERO_TRANSP'
      Origin = 'NFISCAIS.NUMERO_TRANSP'
      Size = 10
    end
    object ibListaNfiscaisPBRUTO_TRANSP: TIBStringField
      FieldName = 'PBRUTO_TRANSP'
      Origin = 'NFISCAIS.PBRUTO_TRANSP'
    end
    object ibListaNfiscaisPLIQUIDO_TRANSP: TIBStringField
      FieldName = 'PLIQUIDO_TRANSP'
      Origin = 'NFISCAIS.PLIQUIDO_TRANSP'
    end
    object ibListaNfiscaisCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
      Origin = 'NFISCAIS.CLASS_FISCAL1'
    end
    object ibListaNfiscaisCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
      Origin = 'NFISCAIS.CLASS_FISCAL2'
    end
    object ibListaNfiscaisCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
      Origin = 'NFISCAIS.CLASS_FISCAL3'
    end
    object ibListaNfiscaisCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
      Origin = 'NFISCAIS.CLASS_FISCAL4'
    end
    object ibListaNfiscaisCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
      Origin = 'NFISCAIS.CLASS_FISCAL5'
    end
    object ibListaNfiscaisCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
      Origin = 'NFISCAIS.CLASS_FISCAL6'
    end
    object ibListaNfiscaisCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
      Origin = 'NFISCAIS.CLASS_FISCAL7'
    end
    object ibListaNfiscaisMENSAGEM: TBlobField
      FieldName = 'MENSAGEM'
      Origin = 'NFISCAIS.MENSAGEM'
      Size = 8
    end
    object ibListaNfiscaisCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'NFISCAIS.CANCELADA'
      Required = True
      Size = 1
    end
    object ibListaNfiscaisDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'NFISCAIS.DIAS_DEMONSTRACAO'
    end
    object ibListaNfiscaisCOTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'NFISCAIS.COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object ibListaNfiscaisNR_NFISCAL_RETORNO: TIntegerField
      FieldName = 'NR_NFISCAL_RETORNO'
      Origin = 'NFISCAIS.NR_NFISCAL_RETORNO'
    end
    object ibListaNfiscaisDT_NFISCAL_RETORNO: TDateTimeField
      FieldName = 'DT_NFISCAL_RETORNO'
      Origin = 'NFISCAIS.DT_NFISCAL_RETORNO'
    end
  end
  object dsNfiscais: TDataSource
    DataSet = ibNfiscais
    Left = 176
    Top = 136
  end
  object ibspPK: TIBStoredProc
    Database = DBConn
    Transaction = IBTransaction1
    StoredProcName = 'SP_PK'
    Left = 16
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODIGO'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end>
  end
  object ibImprEst: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT P.*, N.CODIGO_NBM FROM PRODUTOS P'
      'LEFT JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'WHERE QTDE_PRODUTO <> 0')
    Left = 520
    Top = 16
    object ibImprEstPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Origin = 'PRODUTOS.PRODUTO_SQ'
      Required = True
    end
    object ibImprEstCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'PRODUTOS.CODIGO_PRODUTO'
      Required = True
    end
    object ibImprEstDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTOS.DESCRICAO_PRODUTO'
      Required = True
      Size = 50
    end
    object ibImprEstQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Origin = 'PRODUTOS.QTDE_PRODUTO'
      Required = True
    end
    object ibImprEstNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'PRODUTOS.NBM_SQ'
      Required = True
    end
    object ibImprEstMODELO_PRODUTO: TIBStringField
      FieldName = 'MODELO_PRODUTO'
      Origin = 'PRODUTOS.MODELO_PRODUTO'
    end
    object ibImprEstUN_PRODUTO: TIBStringField
      FieldName = 'UN_PRODUTO'
      Origin = 'PRODUTOS.UN_PRODUTO'
      Size = 2
    end
    object ibImprEstMARCA_PRODUTO: TIBStringField
      FieldName = 'MARCA_PRODUTO'
      Origin = 'PRODUTOS.MARCA_PRODUTO'
    end
    object ibImprEstPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'PRODUTOS.PRECO_UNIT'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprEstCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
  end
  object ibKardex: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'KARDEX_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO_SQ'
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
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY26'
        Fields = 'KARDEX_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'KARDEX_X_PRODUTOS'
        Fields = 'PRODUTO_SQ'
      end
      item
        Name = 'KARDEX_X_USUARIOS'
        Fields = 'USUARIO_SQ'
      end>
    StoreDefs = True
    TableName = 'KARDEX'
    Left = 152
    Top = 208
    object ibKardexKARDEX_SQ: TIntegerField
      FieldName = 'KARDEX_SQ'
    end
    object ibKardexPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object ibKardexTIPO_MOV: TIBStringField
      FieldName = 'TIPO_MOV'
      Size = 1
    end
    object ibKardexQTDE: TIntegerField
      FieldName = 'QTDE'
    end
    object ibKardexVALOR: TIBBCDField
      FieldName = 'VALOR'
      Precision = 9
      Size = 2
    end
    object ibKardexDATA: TDateTimeField
      FieldName = 'DATA'
    end
    object ibKardexNFISCAL: TIntegerField
      FieldName = 'NFISCAL'
    end
    object ibKardexUSUARIO_SQ: TIntegerField
      FieldName = 'USUARIO_SQ'
    end
    object ibKardexCODIGO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'CODIGO_PRODUTO'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'CODIGO_PRODUTO'
      KeyFields = 'PRODUTO_SQ'
      Lookup = True
    end
    object ibKardexDESCRICAO_PRODUTO: TStringField
      FieldKind = fkLookup
      FieldName = 'DESCRICAO_PRODUTO'
      LookupDataSet = ibListaProdutos
      LookupKeyFields = 'PRODUTO_SQ'
      LookupResultField = 'DESCRICAO_PRODUTO'
      KeyFields = 'PRODUTO_SQ'
      Size = 50
      Lookup = True
    end
  end
  object ibImprHistClientes1: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    AfterScroll = ibImprHistClientes1AfterScroll
    BufferChunks = 1000
    CachedUpdates = False
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
      'FROM PEDIDOS P'
      'LEFT JOIN CLIENTES C ON (C.CLIENTE_SQ = P.CLIENTE_SQ)'
      'WHERE CODIGO_CLIENTE CONTAINING :CODIGO_CLIENTE'
      'AND NOME_CLIENTE CONTAINING :NOME_CLIENTE'
      
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
    Left = 520
    Top = 64
    ParamData = <
      item
        DataType = ftString
        Name = 'CODIGO_CLIENTE'
        ParamType = ptUnknown
        Value = ''
      end
      item
        DataType = ftString
        Name = 'NOME_CLIENTE'
        ParamType = ptUnknown
        Value = ''
      end>
    object ibImprHistClientes1CLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
    end
    object ibImprHistClientes1CODIGO_CLIENTE: TIBStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object ibImprHistClientes1NOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object ibImprHistClientes1INSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
    end
    object ibImprHistClientes1ENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object ibImprHistClientes1NUMERO: TIBStringField
      FieldName = 'NUMERO'
    end
    object ibImprHistClientes1BAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object ibImprHistClientes1COMPL_ENDERECO: TIBStringField
      FieldName = 'COMPL_ENDERECO'
      Size = 50
    end
    object ibImprHistClientes1CIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object ibImprHistClientes1ESTADO: TIBStringField
      FieldName = 'ESTADO'
      Size = 2
    end
    object ibImprHistClientes1CEP: TIBStringField
      FieldName = 'CEP'
      Size = 8
    end
    object ibImprHistClientes1DDD_FONE1: TIBStringField
      FieldName = 'DDD_FONE1'
      Size = 4
    end
    object ibImprHistClientes1NUMERO_FONE1: TIBStringField
      FieldName = 'NUMERO_FONE1'
      Size = 15
    end
    object ibImprHistClientes1COMPL_FONE1: TIBStringField
      FieldName = 'COMPL_FONE1'
      Size = 10
    end
    object ibImprHistClientes1DDD_FONE2: TIBStringField
      FieldName = 'DDD_FONE2'
      Size = 4
    end
    object ibImprHistClientes1NUMERO_FONE2: TIBStringField
      FieldName = 'NUMERO_FONE2'
      Size = 15
    end
    object ibImprHistClientes1COMPL_FONE2: TIBStringField
      FieldName = 'COMPL_FONE2'
      Size = 10
    end
    object ibImprHistClientes1DDD_FONE3: TIBStringField
      FieldName = 'DDD_FONE3'
      Size = 4
    end
    object ibImprHistClientes1NUMERO_FONE3: TIBStringField
      FieldName = 'NUMERO_FONE3'
      Size = 15
    end
    object ibImprHistClientes1COMPL_FONE3: TIBStringField
      FieldName = 'COMPL_FONE3'
      Size = 10
    end
    object ibImprHistClientes1DDD_CELULAR: TIBStringField
      FieldName = 'DDD_CELULAR'
      Size = 4
    end
    object ibImprHistClientes1NUMERO_CELULAR: TIBStringField
      FieldName = 'NUMERO_CELULAR'
      Size = 15
    end
    object ibImprHistClientes1COMPL_CELULAR: TIBStringField
      FieldName = 'COMPL_CELULAR'
      Size = 10
    end
    object ibImprHistClientes1DDD_FAX: TIBStringField
      FieldName = 'DDD_FAX'
      Size = 4
    end
    object ibImprHistClientes1NUMERO_FAX: TIBStringField
      FieldName = 'NUMERO_FAX'
      Size = 15
    end
    object ibImprHistClientes1COMPL_FAX: TIBStringField
      FieldName = 'COMPL_FAX'
      Size = 10
    end
    object ibImprHistClientes1E_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Size = 100
    end
    object ibImprHistClientes1WEB_SITE: TIBStringField
      FieldName = 'WEB_SITE'
      Size = 100
    end
    object ibImprHistClientes1CONTATO: TIBStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object ibImprHistClientes1PAIS: TIBStringField
      FieldName = 'PAIS'
    end
    object ibImprHistClientes1REVENDA: TIBStringField
      FieldName = 'REVENDA'
      Size = 1
    end
    object ibImprHistClientes1BIRO: TIBStringField
      FieldName = 'BIRO'
      Size = 1
    end
  end
  object ibImprHistClientes2: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsImprHistClientes1
    SQL.Strings = (
      
        'SELECT P.PEDIDO_SQ, P.NUMERO_PEDIDO, P.DATA_PEDIDO, P.COTACAO_DO' +
        'LAR, P.VLR_FRETE, P.VLR_DESC,'
      
        'P.PCT_DESC, P.VLR_ICMS, P.VLR_IPI, P.VLR_PRODUTOS, P.VLR_JUROS, ' +
        'P.PCT_JUROS, P.FRETE_TRANSP, '
      
        'CP.DESCRICAO_COND_PAGTO, N.DESCRICAO_NATUREZA, N.CFO, T.NOME_TRA' +
        'NSPORTADORA'
      'FROM PEDIDOS P'
      
        'LEFT OUTER JOIN CLIENTES        C ON (C.CLIENTE_SQ = P.CLIENTE_S' +
        'Q)'
      
        'LEFT OUTER JOIN COND_PAGTO     CP ON (CP.COND_PAGTO_SQ = P.COND_' +
        'PAGTO_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS       N ON (N.NATUREZA_SQ = P.NATUREZA' +
        '_SQ)'
      
        'LEFT OUTER JOIN TRANSPORTADORAS T ON (T.TRANSPORTADORA_SQ = P.TR' +
        'ANSPORTADORA_SQ)'
      'WHERE P.CLIENTE_SQ = :CLIENTE_SQ'
      'ORDER BY P.NUMERO_PEDIDO')
    Left = 520
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CLIENTE_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibImprHistClientes2PEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS.PEDIDO_SQ'
      Required = True
    end
    object ibImprHistClientes2NUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
      Origin = 'PEDIDOS.NUMERO_PEDIDO'
    end
    object ibImprHistClientes2DATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
      Origin = 'PEDIDOS.DATA_PEDIDO'
      Required = True
    end
    object ibImprHistClientes2COTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'PEDIDOS.COTACAO_DOLAR'
      currency = True
      Precision = 9
      Size = 4
    end
    object ibImprHistClientes2VLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'PEDIDOS.VLR_FRETE'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2VLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS.VLR_DESC'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2PCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Origin = 'PEDIDOS.PCT_DESC'
      DisplayFormat = '0.00%'
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2VLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'PEDIDOS.VLR_ICMS'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2VLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'PEDIDOS.VLR_IPI'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2VLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'PEDIDOS.VLR_PRODUTOS'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2VLR_JUROS: TIBBCDField
      FieldName = 'VLR_JUROS'
      Origin = 'PEDIDOS.VLR_JUROS'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes2PCT_JUROS: TIBBCDField
      FieldName = 'PCT_JUROS'
      Origin = 'PEDIDOS.PCT_JUROS'
      DisplayFormat = '0.00%'
      Precision = 4
      Size = 2
    end
    object ibImprHistClientes2DESCRICAO_COND_PAGTO: TIBStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Origin = 'COND_PAGTO.DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object ibImprHistClientes2DESCRICAO_NATUREZA: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA'
      Size = 50
    end
    object ibImprHistClientes2CFO: TIBStringField
      FieldName = 'CFO'
      Origin = 'NATUREZAS.CFO'
      Size = 4
    end
    object ibImprHistClientes2NOME_TRANSPORTADORA: TIBStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.NOME_TRANSPORTADORA'
      Size = 50
    end
    object ibImprHistClientes2FRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'PEDIDOS.FRETE_TRANSP'
      Size = 1
    end
  end
  object ibImprHistClientes3: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsImprHistClientes2
    SQL.Strings = (
      'SELECT * FROM PEDIDOS_ITENS PI'
      'LEFT OUTER JOIN PRODUTOS PR ON (PR.PRODUTO_SQ = PI.PRODUTO_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = PR.NBM_SQ)'
      'WHERE PEDIDO_SQ = :PEDIDO_SQ'
      'ORDER BY PR.CODIGO_PRODUTO')
    Left = 520
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PEDIDO_SQ'
        ParamType = ptUnknown
        Size = 4
      end>
    object ibImprHistClientes3PEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_ITEM_SQ'
      Required = True
    end
    object ibImprHistClientes3PEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_SQ'
      Required = True
    end
    object ibImprHistClientes3PRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Origin = 'PEDIDOS_ITENS.PRODUTO_SQ'
      Required = True
    end
    object ibImprHistClientes3QTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
      Origin = 'PEDIDOS_ITENS.QTDE_PEDIDO_ITEM'
      Required = True
    end
    object ibImprHistClientes3NR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Origin = 'PEDIDOS_ITENS.NR_SERIE_ITEM'
      Size = 2000
    end
    object ibImprHistClientes3PRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'PEDIDOS_ITENS.PRECO_UNIT'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3VLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS_ITENS.VLR_DESC'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3PCT_DESC: TIBBCDField
      FieldName = 'PCT_DESC'
      Origin = 'PEDIDOS_ITENS.PCT_DESC'
      DisplayFormat = '0.00%'
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3ALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_ICMS_ITEM'
      DisplayFormat = '0.00%'
      Precision = 4
      Size = 2
    end
    object ibImprHistClientes3ALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_IPI_ITEM'
      DisplayFormat = '0.00%'
      Precision = 4
      Size = 2
    end
    object ibImprHistClientes3VLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_ICMS_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3VLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_IPI_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3VLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_TOTAL_ITEM'
      currency = True
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3PRODUTO_SQ1: TIntegerField
      FieldName = 'PRODUTO_SQ1'
      Origin = 'PRODUTOS.PRODUTO_SQ'
    end
    object ibImprHistClientes3CODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'PRODUTOS.CODIGO_PRODUTO'
    end
    object ibImprHistClientes3DESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTOS.DESCRICAO_PRODUTO'
      Size = 50
    end
    object ibImprHistClientes3QTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Origin = 'PRODUTOS.QTDE_PRODUTO'
    end
    object ibImprHistClientes3NBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'PRODUTOS.NBM_SQ'
    end
    object ibImprHistClientes3MODELO_PRODUTO: TIBStringField
      FieldName = 'MODELO_PRODUTO'
      Origin = 'PRODUTOS.MODELO_PRODUTO'
    end
    object ibImprHistClientes3UN_PRODUTO: TIBStringField
      FieldName = 'UN_PRODUTO'
      Origin = 'PRODUTOS.UN_PRODUTO'
      Size = 2
    end
    object ibImprHistClientes3MARCA_PRODUTO: TIBStringField
      FieldName = 'MARCA_PRODUTO'
      Origin = 'PRODUTOS.MARCA_PRODUTO'
    end
    object ibImprHistClientes3PRECO_UNIT1: TIBBCDField
      FieldName = 'PRECO_UNIT1'
      Origin = 'PRODUTOS.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object ibImprHistClientes3NBM_SQ1: TIntegerField
      FieldName = 'NBM_SQ1'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprHistClientes3CODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprHistClientes3ALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprHistClientes3ALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object dsImprHistClientes1: TDataSource
    DataSet = ibImprHistClientes1
    Left = 568
    Top = 88
  end
  object dsImprHistClientes2: TDataSource
    DataSet = ibImprHistClientes2
    Left = 568
    Top = 136
  end
  object ibImprNf: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NFISCAIS NF'
      
        'LEFT OUTER JOIN CLIENTES        C  ON (C.CLIENTE_SQ        = NF.' +
        'CLIENTE_SQ)'
      
        'LEFT OUTER JOIN COND_PAGTO      CP ON (CP.COND_PAGTO_SQ    = NF.' +
        'COND_PAGTO_SQ)'
      
        'LEFT OUTER JOIN NATUREZAS       N  ON (N.NATUREZA_SQ       = NF.' +
        'NATUREZA_SQ)'
      
        'LEFT OUTER JOIN TRANSPORTADORAS T  ON (T.TRANSPORTADORA_SQ = NF.' +
        'TRANSPORTADORA_SQ)'
      
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
    Left = 440
    Top = 112
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NUMERO_NFISCAL'
        ParamType = ptUnknown
      end>
    object ibImprNfNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS.NFISCAL_SQ'
      Required = True
    end
    object ibImprNfNUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
      Required = True
    end
    object ibImprNfDTEMISSAO_NFISCAL: TDateTimeField
      FieldName = 'DTEMISSAO_NFISCAL'
      Origin = 'NFISCAIS.DTEMISSAO_NFISCAL'
      Required = True
    end
    object ibImprNfDTSAIDA_NFISCAL: TDateTimeField
      FieldName = 'DTSAIDA_NFISCAL'
      Origin = 'NFISCAIS.DTSAIDA_NFISCAL'
      Required = True
    end
    object ibImprNfPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'NFISCAIS.PEDIDO_SQ'
      Required = True
    end
    object ibImprNfCLIENTE_SQ: TIntegerField
      FieldName = 'CLIENTE_SQ'
      Origin = 'NFISCAIS.CLIENTE_SQ'
      Required = True
    end
    object ibImprNfCOND_PAGTO_SQ: TIntegerField
      FieldName = 'COND_PAGTO_SQ'
      Origin = 'NFISCAIS.COND_PAGTO_SQ'
      Required = True
    end
    object ibImprNfNATUREZA_SQ: TIntegerField
      FieldName = 'NATUREZA_SQ'
      Origin = 'NFISCAIS.NATUREZA_SQ'
      Required = True
    end
    object ibImprNfTRANSPORTADORA_SQ: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ'
      Origin = 'NFISCAIS.TRANSPORTADORA_SQ'
      Required = True
    end
    object ibImprNfBASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Origin = 'NFISCAIS.BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Origin = 'NFISCAIS.VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object ibImprNfBASE_ICMS_SUBST: TIBBCDField
      FieldName = 'BASE_ICMS_SUBST'
      Origin = 'NFISCAIS.BASE_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_ICMS_SUBST: TIBBCDField
      FieldName = 'VLR_ICMS_SUBST'
      Origin = 'NFISCAIS.VLR_ICMS_SUBST'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Origin = 'NFISCAIS.VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Origin = 'NFISCAIS.VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_SEGURO: TIBBCDField
      FieldName = 'VLR_SEGURO'
      Origin = 'NFISCAIS.VLR_SEGURO'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_DESP_ACESS: TIBBCDField
      FieldName = 'VLR_DESP_ACESS'
      Origin = 'NFISCAIS.VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Origin = 'NFISCAIS.VLR_IPI'
      Precision = 9
      Size = 2
    end
    object ibImprNfVLR_TOTAL: TIBBCDField
      FieldName = 'VLR_TOTAL'
      Origin = 'NFISCAIS.VLR_TOTAL'
      Precision = 9
      Size = 2
    end
    object ibImprNfFRETE_TRANSP: TIBStringField
      FieldName = 'FRETE_TRANSP'
      Origin = 'NFISCAIS.FRETE_TRANSP'
      Size = 1
    end
    object ibImprNfPLACA_TRANSP: TIBStringField
      FieldName = 'PLACA_TRANSP'
      Origin = 'NFISCAIS.PLACA_TRANSP'
      Size = 7
    end
    object ibImprNfUF_PLACA_TRANSP: TIBStringField
      FieldName = 'UF_PLACA_TRANSP'
      Origin = 'NFISCAIS.UF_PLACA_TRANSP'
      Size = 2
    end
    object ibImprNfQTDE_TRANSP: TIntegerField
      FieldName = 'QTDE_TRANSP'
      Origin = 'NFISCAIS.QTDE_TRANSP'
    end
    object ibImprNfESPECIE_TRANSP: TIBStringField
      FieldName = 'ESPECIE_TRANSP'
      Origin = 'NFISCAIS.ESPECIE_TRANSP'
    end
    object ibImprNfMARCA_TRANSP: TIBStringField
      FieldName = 'MARCA_TRANSP'
      Origin = 'NFISCAIS.MARCA_TRANSP'
      Size = 30
    end
    object ibImprNfNUMERO_TRANSP: TIBStringField
      FieldName = 'NUMERO_TRANSP'
      Origin = 'NFISCAIS.NUMERO_TRANSP'
      Size = 10
    end
    object ibImprNfPBRUTO_TRANSP: TIBStringField
      FieldName = 'PBRUTO_TRANSP'
      Origin = 'NFISCAIS.PBRUTO_TRANSP'
    end
    object ibImprNfPLIQUIDO_TRANSP: TIBStringField
      FieldName = 'PLIQUIDO_TRANSP'
      Origin = 'NFISCAIS.PLIQUIDO_TRANSP'
    end
    object ibImprNfCLASS_FISCAL1: TIntegerField
      FieldName = 'CLASS_FISCAL1'
      Origin = 'NFISCAIS.CLASS_FISCAL1'
    end
    object ibImprNfCLASS_FISCAL2: TIntegerField
      FieldName = 'CLASS_FISCAL2'
      Origin = 'NFISCAIS.CLASS_FISCAL2'
    end
    object ibImprNfCLASS_FISCAL3: TIntegerField
      FieldName = 'CLASS_FISCAL3'
      Origin = 'NFISCAIS.CLASS_FISCAL3'
    end
    object ibImprNfCLASS_FISCAL4: TIntegerField
      FieldName = 'CLASS_FISCAL4'
      Origin = 'NFISCAIS.CLASS_FISCAL4'
    end
    object ibImprNfCLASS_FISCAL5: TIntegerField
      FieldName = 'CLASS_FISCAL5'
      Origin = 'NFISCAIS.CLASS_FISCAL5'
    end
    object ibImprNfCLASS_FISCAL6: TIntegerField
      FieldName = 'CLASS_FISCAL6'
      Origin = 'NFISCAIS.CLASS_FISCAL6'
    end
    object ibImprNfCLASS_FISCAL7: TIntegerField
      FieldName = 'CLASS_FISCAL7'
      Origin = 'NFISCAIS.CLASS_FISCAL7'
    end
    object ibImprNfMENSAGEM: TBlobField
      FieldName = 'MENSAGEM'
      Origin = 'NFISCAIS.MENSAGEM'
      Size = 8
    end
    object ibImprNfCANCELADA: TIBStringField
      FieldName = 'CANCELADA'
      Origin = 'NFISCAIS.CANCELADA'
      Required = True
      Size = 1
    end
    object ibImprNfDIAS_DEMONSTRACAO: TIntegerField
      FieldName = 'DIAS_DEMONSTRACAO'
      Origin = 'NFISCAIS.DIAS_DEMONSTRACAO'
    end
    object ibImprNfCLIENTE_SQ1: TIntegerField
      FieldName = 'CLIENTE_SQ1'
      Origin = 'CLIENTES.CLIENTE_SQ'
    end
    object ibImprNfCODIGO_CLIENTE: TIBStringField
      FieldName = 'CODIGO_CLIENTE'
      Origin = 'CLIENTES.CODIGO_CLIENTE'
      Size = 15
    end
    object ibImprNfNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Origin = 'CLIENTES.NOME_CLIENTE'
      Size = 50
    end
    object ibImprNfINSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'CLIENTES.INSCR_ESTADUAL'
    end
    object ibImprNfENDERECO: TIBStringField
      FieldName = 'ENDERECO'
      Origin = 'CLIENTES.ENDERECO'
      Size = 50
    end
    object ibImprNfNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = 'CLIENTES.NUMERO'
    end
    object ibImprNfBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 30
    end
    object ibImprNfCOMPL_ENDERECO: TIBStringField
      FieldName = 'COMPL_ENDERECO'
      Origin = 'CLIENTES.COMPL_ENDERECO'
      Size = 50
    end
    object ibImprNfCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTES.CIDADE'
      Size = 30
    end
    object ibImprNfESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CLIENTES.ESTADO'
      Size = 2
    end
    object ibImprNfCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'CLIENTES.CEP'
      Size = 8
    end
    object ibImprNfDDD_FONE1: TIBStringField
      FieldName = 'DDD_FONE1'
      Origin = 'CLIENTES.DDD_FONE1'
      Size = 4
    end
    object ibImprNfNUMERO_FONE1: TIBStringField
      FieldName = 'NUMERO_FONE1'
      Origin = 'CLIENTES.NUMERO_FONE1'
      Size = 15
    end
    object ibImprNfCOMPL_FONE1: TIBStringField
      FieldName = 'COMPL_FONE1'
      Origin = 'CLIENTES.COMPL_FONE1'
      Size = 10
    end
    object ibImprNfDDD_FONE2: TIBStringField
      FieldName = 'DDD_FONE2'
      Origin = 'CLIENTES.DDD_FONE2'
      Size = 4
    end
    object ibImprNfNUMERO_FONE2: TIBStringField
      FieldName = 'NUMERO_FONE2'
      Origin = 'CLIENTES.NUMERO_FONE2'
      Size = 15
    end
    object ibImprNfCOMPL_FONE2: TIBStringField
      FieldName = 'COMPL_FONE2'
      Origin = 'CLIENTES.COMPL_FONE2'
      Size = 10
    end
    object ibImprNfDDD_FONE3: TIBStringField
      FieldName = 'DDD_FONE3'
      Origin = 'CLIENTES.DDD_FONE3'
      Size = 4
    end
    object ibImprNfNUMERO_FONE3: TIBStringField
      FieldName = 'NUMERO_FONE3'
      Origin = 'CLIENTES.NUMERO_FONE3'
      Size = 15
    end
    object ibImprNfCOMPL_FONE3: TIBStringField
      FieldName = 'COMPL_FONE3'
      Origin = 'CLIENTES.COMPL_FONE3'
      Size = 10
    end
    object ibImprNfDDD_CELULAR: TIBStringField
      FieldName = 'DDD_CELULAR'
      Origin = 'CLIENTES.DDD_CELULAR'
      Size = 4
    end
    object ibImprNfNUMERO_CELULAR: TIBStringField
      FieldName = 'NUMERO_CELULAR'
      Origin = 'CLIENTES.NUMERO_CELULAR'
      Size = 15
    end
    object ibImprNfCOMPL_CELULAR: TIBStringField
      FieldName = 'COMPL_CELULAR'
      Origin = 'CLIENTES.COMPL_CELULAR'
      Size = 10
    end
    object ibImprNfDDD_FAX: TIBStringField
      FieldName = 'DDD_FAX'
      Origin = 'CLIENTES.DDD_FAX'
      Size = 4
    end
    object ibImprNfNUMERO_FAX: TIBStringField
      FieldName = 'NUMERO_FAX'
      Origin = 'CLIENTES.NUMERO_FAX'
      Size = 15
    end
    object ibImprNfCOMPL_FAX: TIBStringField
      FieldName = 'COMPL_FAX'
      Origin = 'CLIENTES.COMPL_FAX'
      Size = 10
    end
    object ibImprNfE_MAIL: TIBStringField
      FieldName = 'E_MAIL'
      Origin = 'CLIENTES.E_MAIL'
      Size = 100
    end
    object ibImprNfWEB_SITE: TIBStringField
      FieldName = 'WEB_SITE'
      Origin = 'CLIENTES.WEB_SITE'
      Size = 100
    end
    object ibImprNfCONTATO: TIBStringField
      FieldName = 'CONTATO'
      Origin = 'CLIENTES.CONTATO'
      Size = 50
    end
    object ibImprNfPAIS: TIBStringField
      FieldName = 'PAIS'
      Origin = 'CLIENTES.PAIS'
    end
    object ibImprNfOBSERVACAO: TBlobField
      FieldName = 'OBSERVACAO'
      Origin = 'CLIENTES.OBSERVACAO'
      Size = 8
    end
    object ibImprNfREVENDA: TIBStringField
      FieldName = 'REVENDA'
      Origin = 'CLIENTES.REVENDA'
      Size = 1
    end
    object ibImprNfBIRO: TIBStringField
      FieldName = 'BIRO'
      Origin = 'CLIENTES.BIRO'
      Size = 1
    end
    object ibImprNfCOND_PAGTO_SQ1: TIntegerField
      FieldName = 'COND_PAGTO_SQ1'
      Origin = 'COND_PAGTO.COND_PAGTO_SQ'
    end
    object ibImprNfCODIGO_COND_PAGTO: TIntegerField
      FieldName = 'CODIGO_COND_PAGTO'
      Origin = 'COND_PAGTO.CODIGO_COND_PAGTO'
    end
    object ibImprNfDESCRICAO_COND_PAGTO: TIBStringField
      FieldName = 'DESCRICAO_COND_PAGTO'
      Origin = 'COND_PAGTO.DESCRICAO_COND_PAGTO'
      Size = 50
    end
    object ibImprNfPARCELAS: TIntegerField
      FieldName = 'PARCELAS'
      Origin = 'COND_PAGTO.PARCELAS'
    end
    object ibImprNfD00: TIntegerField
      FieldName = 'D00'
      Origin = 'COND_PAGTO.D00'
    end
    object ibImprNfD01: TIntegerField
      FieldName = 'D01'
      Origin = 'COND_PAGTO.D01'
    end
    object ibImprNfD02: TIntegerField
      FieldName = 'D02'
      Origin = 'COND_PAGTO.D02'
    end
    object ibImprNfD03: TIntegerField
      FieldName = 'D03'
      Origin = 'COND_PAGTO.D03'
    end
    object ibImprNfD04: TIntegerField
      FieldName = 'D04'
      Origin = 'COND_PAGTO.D04'
    end
    object ibImprNfD05: TIntegerField
      FieldName = 'D05'
      Origin = 'COND_PAGTO.D05'
    end
    object ibImprNfD06: TIntegerField
      FieldName = 'D06'
      Origin = 'COND_PAGTO.D06'
    end
    object ibImprNfD07: TIntegerField
      FieldName = 'D07'
      Origin = 'COND_PAGTO.D07'
    end
    object ibImprNfD08: TIntegerField
      FieldName = 'D08'
      Origin = 'COND_PAGTO.D08'
    end
    object ibImprNfD09: TIntegerField
      FieldName = 'D09'
      Origin = 'COND_PAGTO.D09'
    end
    object ibImprNfNATUREZA_SQ1: TIntegerField
      FieldName = 'NATUREZA_SQ1'
      Origin = 'NATUREZAS.NATUREZA_SQ'
    end
    object ibImprNfCODIGO_NATUREZA: TIntegerField
      FieldName = 'CODIGO_NATUREZA'
      Origin = 'NATUREZAS.CODIGO_NATUREZA'
    end
    object ibImprNfDESCRICAO_NATUREZA: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA'
      Size = 50
    end
    object ibImprNfCFO: TIBStringField
      FieldName = 'CFO'
      Origin = 'NATUREZAS.CFO'
      Size = 4
    end
    object ibImprNfALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NATUREZAS.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object ibImprNfALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NATUREZAS.ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object ibImprNfENT_SAI: TIBStringField
      FieldName = 'ENT_SAI'
      Origin = 'NATUREZAS.ENT_SAI'
      Size = 1
    end
    object ibImprNfOBSERVACAO1: TBlobField
      FieldName = 'OBSERVACAO1'
      Origin = 'NATUREZAS.OBSERVACAO'
      Size = 8
    end
    object ibImprNfUF01: TIBStringField
      FieldName = 'UF01'
      Origin = 'NATUREZAS.UF01'
      Size = 2
    end
    object ibImprNfUF02: TIBStringField
      FieldName = 'UF02'
      Origin = 'NATUREZAS.UF02'
      Size = 2
    end
    object ibImprNfUF03: TIBStringField
      FieldName = 'UF03'
      Origin = 'NATUREZAS.UF03'
      Size = 2
    end
    object ibImprNfUF04: TIBStringField
      FieldName = 'UF04'
      Origin = 'NATUREZAS.UF04'
      Size = 2
    end
    object ibImprNfUF05: TIBStringField
      FieldName = 'UF05'
      Origin = 'NATUREZAS.UF05'
      Size = 2
    end
    object ibImprNfUF06: TIBStringField
      FieldName = 'UF06'
      Origin = 'NATUREZAS.UF06'
      Size = 2
    end
    object ibImprNfUF07: TIBStringField
      FieldName = 'UF07'
      Origin = 'NATUREZAS.UF07'
      Size = 2
    end
    object ibImprNfUF08: TIBStringField
      FieldName = 'UF08'
      Origin = 'NATUREZAS.UF08'
      Size = 2
    end
    object ibImprNfUF09: TIBStringField
      FieldName = 'UF09'
      Origin = 'NATUREZAS.UF09'
      Size = 2
    end
    object ibImprNfUF10: TIBStringField
      FieldName = 'UF10'
      Origin = 'NATUREZAS.UF10'
      Size = 2
    end
    object ibImprNfUF11: TIBStringField
      FieldName = 'UF11'
      Origin = 'NATUREZAS.UF11'
      Size = 2
    end
    object ibImprNfUF12: TIBStringField
      FieldName = 'UF12'
      Origin = 'NATUREZAS.UF12'
      Size = 2
    end
    object ibImprNfUF13: TIBStringField
      FieldName = 'UF13'
      Origin = 'NATUREZAS.UF13'
      Size = 2
    end
    object ibImprNfUF14: TIBStringField
      FieldName = 'UF14'
      Origin = 'NATUREZAS.UF14'
      Size = 2
    end
    object ibImprNfUF15: TIBStringField
      FieldName = 'UF15'
      Origin = 'NATUREZAS.UF15'
      Size = 2
    end
    object ibImprNfUF16: TIBStringField
      FieldName = 'UF16'
      Origin = 'NATUREZAS.UF16'
      Size = 2
    end
    object ibImprNfUF17: TIBStringField
      FieldName = 'UF17'
      Origin = 'NATUREZAS.UF17'
      Size = 2
    end
    object ibImprNfUF18: TIBStringField
      FieldName = 'UF18'
      Origin = 'NATUREZAS.UF18'
      Size = 2
    end
    object ibImprNfUF19: TIBStringField
      FieldName = 'UF19'
      Origin = 'NATUREZAS.UF19'
      Size = 2
    end
    object ibImprNfUF20: TIBStringField
      FieldName = 'UF20'
      Origin = 'NATUREZAS.UF20'
      Size = 2
    end
    object ibImprNfUF21: TIBStringField
      FieldName = 'UF21'
      Origin = 'NATUREZAS.UF21'
      Size = 2
    end
    object ibImprNfUF22: TIBStringField
      FieldName = 'UF22'
      Origin = 'NATUREZAS.UF22'
      Size = 2
    end
    object ibImprNfUF23: TIBStringField
      FieldName = 'UF23'
      Origin = 'NATUREZAS.UF23'
      Size = 2
    end
    object ibImprNfUF24: TIBStringField
      FieldName = 'UF24'
      Origin = 'NATUREZAS.UF24'
      Size = 2
    end
    object ibImprNfUF25: TIBStringField
      FieldName = 'UF25'
      Origin = 'NATUREZAS.UF25'
      Size = 2
    end
    object ibImprNfUF26: TIBStringField
      FieldName = 'UF26'
      Origin = 'NATUREZAS.UF26'
      Size = 2
    end
    object ibImprNfUF27: TIBStringField
      FieldName = 'UF27'
      Origin = 'NATUREZAS.UF27'
      Size = 2
    end
    object ibImprNfUF28: TIBStringField
      FieldName = 'UF28'
      Origin = 'NATUREZAS.UF28'
      Size = 2
    end
    object ibImprNfUF29: TIBStringField
      FieldName = 'UF29'
      Origin = 'NATUREZAS.UF29'
      Size = 2
    end
    object ibImprNfUF30: TIBStringField
      FieldName = 'UF30'
      Origin = 'NATUREZAS.UF30'
      Size = 2
    end
    object ibImprNfISENCAO_IPI: TIBStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'NATUREZAS.ISENCAO_IPI'
      Size = 1
    end
    object ibImprNfISENCAO_ICMS: TIBStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'NATUREZAS.ISENCAO_ICMS'
      Size = 1
    end
    object ibImprNfDESCRICAO_NATUREZA_NFISCAL: TIBStringField
      FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
      Origin = 'NATUREZAS.DESCRICAO_NATUREZA_NFISCAL'
      Size = 50
    end
    object ibImprNfTRANSPORTADORA_SQ1: TIntegerField
      FieldName = 'TRANSPORTADORA_SQ1'
      Origin = 'TRANSPORTADORAS.TRANSPORTADORA_SQ'
    end
    object ibImprNfCODIGO_TRANSPORTADORA: TIBStringField
      FieldName = 'CODIGO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.CODIGO_TRANSPORTADORA'
      Size = 15
    end
    object ibImprNfNOME_TRANSPORTADORA: TIBStringField
      FieldName = 'NOME_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.NOME_TRANSPORTADORA'
      Size = 50
    end
    object ibImprNfENDERECO_TRANSPORTADORA: TIBStringField
      FieldName = 'ENDERECO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.ENDERECO_TRANSPORTADORA'
      Size = 50
    end
    object ibImprNfMUNICIPIO_TRANSPORTADORA: TIBStringField
      FieldName = 'MUNICIPIO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.MUNICIPIO_TRANSPORTADORA'
      Size = 30
    end
    object ibImprNfESTADO_TRANSPORTADORA: TIBStringField
      FieldName = 'ESTADO_TRANSPORTADORA'
      Origin = 'TRANSPORTADORAS.ESTADO_TRANSPORTADORA'
      Size = 2
    end
    object ibImprNfINSCR_ESTADUAL1: TIBStringField
      FieldName = 'INSCR_ESTADUAL1'
      Origin = 'TRANSPORTADORAS.INSCR_ESTADUAL'
    end
    object ibImprNfNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS1: TIBBCDField
      FieldName = 'ALIQ_ICMS1'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI1: TIBBCDField
      FieldName = 'ALIQ_IPI1'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfNBM_SQ1: TIntegerField
      FieldName = 'NBM_SQ1'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM1: TIBStringField
      FieldName = 'CODIGO_NBM1'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS2: TIBBCDField
      FieldName = 'ALIQ_ICMS2'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI2: TIBBCDField
      FieldName = 'ALIQ_IPI2'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfNBM_SQ2: TIntegerField
      FieldName = 'NBM_SQ2'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM2: TIBStringField
      FieldName = 'CODIGO_NBM2'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS3: TIBBCDField
      FieldName = 'ALIQ_ICMS3'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI3: TIBBCDField
      FieldName = 'ALIQ_IPI3'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfNBM_SQ3: TIntegerField
      FieldName = 'NBM_SQ3'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM3: TIBStringField
      FieldName = 'CODIGO_NBM3'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS4: TIBBCDField
      FieldName = 'ALIQ_ICMS4'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI4: TIBBCDField
      FieldName = 'ALIQ_IPI4'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfNBM_SQ4: TIntegerField
      FieldName = 'NBM_SQ4'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM4: TIBStringField
      FieldName = 'CODIGO_NBM4'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS5: TIBBCDField
      FieldName = 'ALIQ_ICMS5'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI5: TIBBCDField
      FieldName = 'ALIQ_IPI5'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfNBM_SQ5: TIntegerField
      FieldName = 'NBM_SQ5'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM5: TIBStringField
      FieldName = 'CODIGO_NBM5'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS6: TIBBCDField
      FieldName = 'ALIQ_ICMS6'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI6: TIBBCDField
      FieldName = 'ALIQ_IPI6'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfNBM_SQ6: TIntegerField
      FieldName = 'NBM_SQ6'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfCODIGO_NBM6: TIBStringField
      FieldName = 'CODIGO_NBM6'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfALIQ_ICMS7: TIBBCDField
      FieldName = 'ALIQ_ICMS7'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfALIQ_IPI7: TIBBCDField
      FieldName = 'ALIQ_IPI7'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object ibImprNfCOTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'NFISCAIS.COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object ibImprNfDDD_FONE: TIBStringField
      FieldName = 'DDD_FONE'
      Origin = 'TRANSPORTADORAS.DDD_FONE'
      Size = 4
    end
    object ibImprNfNUMERO_FONE: TIBStringField
      FieldName = 'NUMERO_FONE'
      Origin = 'TRANSPORTADORAS.NUMERO_FONE'
      Size = 15
    end
    object ibImprNfCOMPL_FONE: TIBStringField
      FieldName = 'COMPL_FONE'
      Origin = 'TRANSPORTADORAS.COMPL_FONE'
      Size = 10
    end
  end
  object ibImprNfItem: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM NFISCAIS_ITENS NFI'
      'LEFT OUTER JOIN PRODUTOS PR ON (PR.PRODUTO_SQ = NFI.PRODUTO_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = PR.NBM_SQ)'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ')
    Left = 440
    Top = 160
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    object ibImprNfItemNFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
      Origin = 'NFISCAIS_ITENS.NFISCAL_ITEM_SQ'
      Required = True
    end
    object ibImprNfItemNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS_ITENS.NFISCAL_SQ'
      Required = True
    end
    object ibImprNfItemITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'NFISCAIS_ITENS.ITEM'
      Required = True
    end
    object ibImprNfItemPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Origin = 'NFISCAIS_ITENS.PRODUTO_SQ'
    end
    object ibImprNfItemNR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Origin = 'NFISCAIS_ITENS.NR_SERIE_ITEM'
      Size = 2000
    end
    object ibImprNfItemCLASS_FISCAL: TIBStringField
      FieldName = 'CLASS_FISCAL'
      Origin = 'NFISCAIS_ITENS.CLASS_FISCAL'
      Size = 1
    end
    object ibImprNfItemSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
      Origin = 'NFISCAIS_ITENS.STRIBUT'
    end
    object ibImprNfItemQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
      Origin = 'NFISCAIS_ITENS.QTDE_ITEM'
    end
    object ibImprNfItemVLR_UNIT_ITEM: TIBBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprNfItemVLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprNfItemALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'NFISCAIS_ITENS.ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object ibImprNfItemALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'NFISCAIS_ITENS.ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object ibImprNfItemVLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprNfItemVLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object ibImprNfItemPRODUTO_SQ1: TIntegerField
      FieldName = 'PRODUTO_SQ1'
      Origin = 'PRODUTOS.PRODUTO_SQ'
    end
    object ibImprNfItemCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'PRODUTOS.CODIGO_PRODUTO'
    end
    object ibImprNfItemDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTOS.DESCRICAO_PRODUTO'
      Size = 50
    end
    object ibImprNfItemQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Origin = 'PRODUTOS.QTDE_PRODUTO'
    end
    object ibImprNfItemNBM_SQ: TIntegerField
      FieldName = 'NBM_SQ'
      Origin = 'PRODUTOS.NBM_SQ'
    end
    object ibImprNfItemMODELO_PRODUTO: TIBStringField
      FieldName = 'MODELO_PRODUTO'
      Origin = 'PRODUTOS.MODELO_PRODUTO'
    end
    object ibImprNfItemUN_PRODUTO: TIBStringField
      FieldName = 'UN_PRODUTO'
      Origin = 'PRODUTOS.UN_PRODUTO'
      Size = 2
    end
    object ibImprNfItemMARCA_PRODUTO: TIBStringField
      FieldName = 'MARCA_PRODUTO'
      Origin = 'PRODUTOS.MARCA_PRODUTO'
    end
    object ibImprNfItemPRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'PRODUTOS.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object ibImprNfItemNBM_SQ1: TIntegerField
      FieldName = 'NBM_SQ1'
      Origin = 'NBM.NBM_SQ'
    end
    object ibImprNfItemCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
    object ibImprNfItemALIQ_ICMS: TIBBCDField
      FieldName = 'ALIQ_ICMS'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object ibImprNfItemALIQ_IPI: TIBBCDField
      FieldName = 'ALIQ_IPI'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
  end
  object ibDuplicatas: TIBTable
    Database = DBConn
    Transaction = IBTransaction1
    OnDeleteError = ibClientesDeleteError
    OnEditError = ibClientesEditError
    OnPostError = ibClientesPostError
    OnUpdateError = ibClientesUpdateError
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'DUPLICATA_SQ'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NUMERO_DUPLICATA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ITEM_DUPLICATA'
        Attributes = [faRequired]
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
    IndexDefs = <
      item
        Name = 'DUPLICATAS_1'
        Fields = 'NUMERO_DUPLICATA;ITEM_DUPLICATA;SEQ_DUPLICATA'
        Options = [ixUnique]
      end
      item
        Name = 'RDB$PRIMARY32'
        Fields = 'DUPLICATA_SQ'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'DUPLICATAS_X_NFISCAIS'
        Fields = 'NFISCAL_SQ'
      end>
    StoreDefs = True
    TableName = 'DUPLICATAS'
    Left = 152
    Top = 256
    object ibDuplicatasDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Required = True
    end
    object ibDuplicatasNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Required = True
    end
    object ibDuplicatasITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Required = True
    end
    object ibDuplicatasSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
    end
    object ibDuplicatasNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object ibDuplicatasVALOR_DUPLICATA: TIBBCDField
      FieldName = 'VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object ibDuplicatasDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
    end
    object ibDuplicatasDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
    end
    object ibDuplicatasDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
    end
    object ibDuplicatasVALORPG_DUPLICATA: TIBBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object ibListaDuplicatas: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM DUPLICATAS')
    Left = 328
    Top = 256
    object ibListaDuplicatasDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Origin = 'DUPLICATAS.DUPLICATA_SQ'
      Required = True
    end
    object ibListaDuplicatasNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
      Required = True
    end
    object ibListaDuplicatasITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
      Required = True
    end
    object ibListaDuplicatasSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
      Origin = 'DUPLICATAS.SEQ_DUPLICATA'
    end
    object ibListaDuplicatasNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DUPLICATAS.NFISCAL_SQ'
    end
    object ibListaDuplicatasVALOR_DUPLICATA: TIBBCDField
      FieldName = 'VALOR_DUPLICATA'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object ibListaDuplicatasDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
      Origin = 'DUPLICATAS.DTEMISSAO_DUPLICATA'
    end
    object ibListaDuplicatasDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object ibListaDuplicatasDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
      Origin = 'DUPLICATAS.DTPGTO_DUPLICATA'
    end
    object ibListaDuplicatasVALORPG_DUPLICATA: TIBBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Origin = 'DUPLICATAS.VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object Msg: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 16
    Top = 424
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atLogin
    Left = 16
    Top = 376
  end
  object ibImprNfDups: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT * FROM DUPLICATAS'
      'WHERE NFISCAL_SQ = :NFISCAL_SQ')
    Left = 440
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    object ibImprNfDupsDUPLICATA_SQ: TIntegerField
      FieldName = 'DUPLICATA_SQ'
      Origin = 'DUPLICATAS.DUPLICATA_SQ'
      Required = True
    end
    object ibImprNfDupsNUMERO_DUPLICATA: TIntegerField
      FieldName = 'NUMERO_DUPLICATA'
      Origin = 'DUPLICATAS.NUMERO_DUPLICATA'
      Required = True
    end
    object ibImprNfDupsITEM_DUPLICATA: TIntegerField
      FieldName = 'ITEM_DUPLICATA'
      Origin = 'DUPLICATAS.ITEM_DUPLICATA'
      Required = True
    end
    object ibImprNfDupsSEQ_DUPLICATA: TIntegerField
      FieldName = 'SEQ_DUPLICATA'
      Origin = 'DUPLICATAS.SEQ_DUPLICATA'
    end
    object ibImprNfDupsNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'DUPLICATAS.NFISCAL_SQ'
    end
    object ibImprNfDupsVALOR_DUPLICATA: TIBBCDField
      FieldName = 'VALOR_DUPLICATA'
      Origin = 'DUPLICATAS.VALOR_DUPLICATA'
      Precision = 9
      Size = 2
    end
    object ibImprNfDupsDTEMISSAO_DUPLICATA: TDateTimeField
      FieldName = 'DTEMISSAO_DUPLICATA'
      Origin = 'DUPLICATAS.DTEMISSAO_DUPLICATA'
    end
    object ibImprNfDupsDTVENCTO_DUPLICATA: TDateTimeField
      FieldName = 'DTVENCTO_DUPLICATA'
      Origin = 'DUPLICATAS.DTVENCTO_DUPLICATA'
    end
    object ibImprNfDupsDTPGTO_DUPLICATA: TDateTimeField
      FieldName = 'DTPGTO_DUPLICATA'
      Origin = 'DUPLICATAS.DTPGTO_DUPLICATA'
    end
    object ibImprNfDupsVALORPG_DUPLICATA: TIBBCDField
      FieldName = 'VALORPG_DUPLICATA'
      Origin = 'DUPLICATAS.VALORPG_DUPLICATA'
      Precision = 9
      Size = 2
    end
  end
  object ibListaNfiscaisItens: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsListaNfiscais
    SQL.Strings = (
      
        'SELECT NI.*, P.CODIGO_PRODUTO, P.DESCRICAO_PRODUTO, P.QTDE_PRODU' +
        'TO, N.CODIGO_NBM'
      'FROM NFISCAIS_ITENS NI'
      'LEFT OUTER JOIN PRODUTOS P ON (P.PRODUTO_SQ = NI.PRODUTO_SQ)'
      'LEFT OUTER JOIN NBM N ON (N.NBM_SQ = P.NBM_SQ)'
      'WHERE NI.NFISCAL_SQ = :NFISCAL_SQ')
    Left = 328
    Top = 168
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'NFISCAL_SQ'
        ParamType = ptUnknown
      end>
    object ibListaNfiscaisItensNFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
      Origin = 'NFISCAIS_ITENS.NFISCAL_ITEM_SQ'
      Required = True
    end
    object ibListaNfiscaisItensNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS_ITENS.NFISCAL_SQ'
      Required = True
    end
    object ibListaNfiscaisItensITEM: TIntegerField
      FieldName = 'ITEM'
      Origin = 'NFISCAIS_ITENS.ITEM'
      Required = True
    end
    object ibListaNfiscaisItensPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
      Origin = 'NFISCAIS_ITENS.PRODUTO_SQ'
    end
    object ibListaNfiscaisItensNR_SERIE_ITEM: TIBStringField
      FieldName = 'NR_SERIE_ITEM'
      Origin = 'NFISCAIS_ITENS.NR_SERIE_ITEM'
      Size = 2000
    end
    object ibListaNfiscaisItensCLASS_FISCAL: TIBStringField
      FieldName = 'CLASS_FISCAL'
      Origin = 'NFISCAIS_ITENS.CLASS_FISCAL'
      Size = 1
    end
    object ibListaNfiscaisItensSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
      Origin = 'NFISCAIS_ITENS.STRIBUT'
    end
    object ibListaNfiscaisItensQTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
      Origin = 'NFISCAIS_ITENS.QTDE_ITEM'
    end
    object ibListaNfiscaisItensVLR_UNIT_ITEM: TIBBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisItensVLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisItensALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'NFISCAIS_ITENS.ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object ibListaNfiscaisItensALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'NFISCAIS_ITENS.ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object ibListaNfiscaisItensVLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisItensVLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object ibListaNfiscaisItensCODIGO_PRODUTO: TIBStringField
      FieldName = 'CODIGO_PRODUTO'
      Origin = 'PRODUTOS.CODIGO_PRODUTO'
    end
    object ibListaNfiscaisItensDESCRICAO_PRODUTO: TIBStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Origin = 'PRODUTOS.DESCRICAO_PRODUTO'
      Size = 50
    end
    object ibListaNfiscaisItensQTDE_PRODUTO: TIntegerField
      FieldName = 'QTDE_PRODUTO'
      Origin = 'PRODUTOS.QTDE_PRODUTO'
    end
    object ibListaNfiscaisItensCODIGO_NBM: TIBStringField
      FieldName = 'CODIGO_NBM'
      Origin = 'NBM.CODIGO_NBM'
      Size = 10
    end
  end
  object dsListaNfiscais: TDataSource
    DataSet = ibListaNfiscais
    Left = 352
    Top = 144
  end
  object ibImprClientesUF: TIBQuery
    Database = DBConn
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select codigo_cliente, nome_cliente, CIDADE,'
      'sum(vlr_total) as valor,'
      'sum(qtde_item) as qtde,'
      'max (n.dtemissao_nfiscal) as data'
      'from nfiscais_itens ni'
      'left outer join nfiscais n on (n.nfiscal_sq = ni.nfiscal_sq)'
      'left outer join clientes c on (n.cliente_sq = c.cliente_sq)'
      'WHERE ESTADO = :ESTADO'
      'group by codigo_cliente, nome_cliente, CIDADE'
      'order by sum(vlr_total) desc')
    Left = 520
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ESTADO'
        ParamType = ptUnknown
      end>
    object ibImprClientesUFCODIGO_CLIENTE: TIBStringField
      FieldName = 'CODIGO_CLIENTE'
      Size = 15
    end
    object ibImprClientesUFNOME_CLIENTE: TIBStringField
      FieldName = 'NOME_CLIENTE'
      Size = 50
    end
    object ibImprClientesUFCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Size = 30
    end
    object ibImprClientesUFVALOR: TIBBCDField
      FieldName = 'VALOR'
      currency = True
      Precision = 18
      Size = 2
    end
    object ibImprClientesUFQTDE: TLargeintField
      FieldName = 'QTDE'
    end
    object ibImprClientesUFDATA: TDateTimeField
      FieldName = 'DATA'
    end
  end
  object IBTransaction2: TIBTransaction
    Active = False
    DefaultDatabase = DBCep
    DefaultAction = TARollback
    Params.Strings = (
      'read'
      'consistency')
    AutoStopAction = saNone
    Left = 504
    Top = 400
  end
  object DBCep: TIBDatabase
    DatabaseName = 'C:\Delphi\banco\CEP.HDB'
    Params.Strings = (
      'user_name=sergio'
      'password=sergio')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    IdleTimer = 0
    SQLDialect = 3
    TraceFlags = []
    AllowStreamedConnected = False
    BeforeDisconnect = DBConnBeforeDisconnect
    Left = 504
    Top = 352
  end
  object ibCep: TIBQuery
    Database = DBCep
    Transaction = IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'SELECT *'
      'FROM ENDERECOS'
      'WHERE CEP = :CEP')
    Left = 568
    Top = 352
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CEP'
        ParamType = ptUnknown
      end>
    object ibCepCEP: TIBStringField
      FieldName = 'CEP'
      Origin = 'ENDERECOS.CEP'
      Size = 8
    end
    object ibCepLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Origin = 'ENDERECOS.LOGRADOURO'
      Size = 242
    end
    object ibCepBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'ENDERECOS.BAIRRO'
      Size = 72
    end
    object ibCepCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'ENDERECOS.CIDADE'
      Size = 60
    end
    object ibCepUF: TIBStringField
      FieldName = 'UF'
      Origin = 'ENDERECOS.UF'
      Size = 2
    end
  end
  object ibspMax: TIBStoredProc
    Database = DBConn
    Transaction = IBTransaction1
    StoredProcName = 'MAX_IDX'
    Left = 16
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'VALOR'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'TABELA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'CAMPO'
        ParamType = ptInput
      end>
  end
end
