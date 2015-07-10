object FImprimirPedidos: TFImprimirPedidos
  Left = 423
  Top = 112
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Imprimir Pedidos'
  ClientHeight = 296
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 266
    Width = 588
    Height = 30
    Align = alBottom
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 4
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 276
      Top = 7
      Width = 33
      Height = 13
      Caption = 'Pedido'
    end
    object bbImprimir: TBitBtn
      Left = 431
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Default = True
      TabOrder = 3
      OnClick = bbImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object bbFechar: TBitBtn
      Left = 511
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 4
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object btnPesquisar: TButton
      Left = 172
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = btnPesquisarClick
    end
    object edData: TRzEdit
      Left = 68
      Top = 4
      Width = 101
      Height = 21
      TabOrder = 0
      OnEnter = edDataEnter
    end
    object edPedido: TRzEdit
      Left = 316
      Top = 4
      Width = 101
      Height = 21
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 588
    Height = 266
    Align = alClient
    DataSource = dsImprPed
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = bbImprimirClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO_PEDIDO'
        Title.Caption = 'N'#250'mero do Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_PEDIDO'
        Title.Caption = 'Data do Pedido'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Cliente'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NUMERO_NFISCAL'
        Title.Caption = 'N'#250'mero da Nota Fiscal'
        Visible = True
      end>
  end
  object dsImprPed: TDataSource
    OnDataChange = dsImprPedDataChange
    Left = 744
    Top = 240
  end
  object cdsImprPed: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'NUMERO_PEDIDO'
        ParamType = ptUnknown
      end>
    ReadOnly = True
    Left = 744
    Top = 128
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
    object cdsImprPedVLR_SEGURO: TBCDField
      FieldName = 'VLR_SEGURO'
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
    object cdsImprPedP00: TIntegerField
      FieldName = 'P00'
    end
    object cdsImprPedP01: TIntegerField
      FieldName = 'P01'
    end
    object cdsImprPedP02: TIntegerField
      FieldName = 'P02'
    end
    object cdsImprPedP03: TIntegerField
      FieldName = 'P03'
    end
    object cdsImprPedP04: TIntegerField
      FieldName = 'P04'
    end
    object cdsImprPedP05: TIntegerField
      FieldName = 'P05'
    end
    object cdsImprPedP06: TIntegerField
      FieldName = 'P06'
    end
    object cdsImprPedP07: TIntegerField
      FieldName = 'P07'
    end
    object cdsImprPedP08: TIntegerField
      FieldName = 'P08'
    end
    object cdsImprPedP09: TIntegerField
      FieldName = 'P09'
    end
    object cdsImprPedbase_icms_subst: TBCDField
      FieldName = 'base_icms_subst'
      Precision = 9
      Size = 2
    end
    object cdsImprPedvlr_icms_subst: TBCDField
      FieldName = 'vlr_icms_subst'
      Precision = 9
      Size = 2
    end
    object cdsImprPedvlr_total: TBCDField
      FieldName = 'vlr_total'
      Precision = 9
      Size = 2
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
    ReadOnly = True
    Left = 744
    Top = 176
    object cdsImprPedItemNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsImprPedItemCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object cdsImprPedItemDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
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
    object cdsImprPedItembase_icms_subst_item: TBCDField
      FieldName = 'base_icms_subst_item'
      Precision = 9
      Size = 2
    end
    object cdsImprPedItemvlr_icms_subst_item: TBCDField
      FieldName = 'vlr_icms_subst_item'
      Precision = 9
      Size = 2
    end
  end
end
