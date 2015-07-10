object FCorrecao: TFCorrecao
  Left = 301
  Top = 103
  Width = 696
  Height = 480
  Caption = 'Corre'#231#227'o'
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
  object Panel1: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
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
    object Button2: TButton
      Left = 392
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button2'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 488
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button3'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 584
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Button4'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 688
    Height = 412
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 384
        Align = alClient
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 384
        Align = alClient
        DataSource = DataSource2
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 384
        Align = alClient
        DataSource = DataSource3
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 384
        Align = alClient
        DataSource = DataSource4
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
  end
  object IBQuery1: TIBQuery
    OnCalcFields = IBQuery1CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select p.pedido_sq, numero_pedido, pedido_item_sq,'
      
        'qtde_pedido_item, pi.PRECO_UNIT, pi.vlr_desc, cotacao_dolar, ali' +
        'q_ipi_item, aliq_icms_item,'
      'vlr_total_item, vlr_ipi_item, vlr_icms_item,'
      'isencao_ipi, isencao_icms,'
      'nbm.aliq_ipi as aliq_ipi_produto,'
      'estado, inscr_estadual,'
      'n.aliq_icms as aliq_icms_nat,'
      'nbm.aliq_icms as aliq_icms_prod'
      'from pedidos_itens pi'
      'left outer join pedidos    p on (p.pedido_sq = pi.pedido_sq)'
      'left outer join naturezas n on (n.natureza_sq = p.natureza_sq)'
      'left outer join produtos  pr on (pr.produto_sq = pi.produto_sq)'
      'left outer join nbm             on (nbm.nbm_sq = pr.nbm_sq)'
      'left outer join clientes     c on (c.cliente_sq = p.cliente_sq)')
    Left = 24
    Top = 16
    object IBQuery1PEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Origin = 'PEDIDOS.PEDIDO_SQ'
    end
    object IBQuery1NUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
      Origin = 'PEDIDOS.NUMERO_PEDIDO'
    end
    object IBQuery1PEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
      Origin = 'PEDIDOS_ITENS.PEDIDO_ITEM_SQ'
      Required = True
    end
    object IBQuery1QTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
      Origin = 'PEDIDOS_ITENS.QTDE_PEDIDO_ITEM'
      Required = True
    end
    object IBQuery1PRECO_UNIT: TIBBCDField
      FieldName = 'PRECO_UNIT'
      Origin = 'PEDIDOS_ITENS.PRECO_UNIT'
      Precision = 9
      Size = 2
    end
    object IBQuery1VLR_DESC: TIBBCDField
      FieldName = 'VLR_DESC'
      Origin = 'PEDIDOS_ITENS.VLR_DESC'
      Precision = 9
      Size = 2
    end
    object IBQuery1COTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'PEDIDOS.COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object IBQuery1ALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object IBQuery1ALIQ_IPI_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'ALIQ_IPI_ITEM_NEW'
      Calculated = True
    end
    object IBQuery1VLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery1VLR_TOTAL_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'VLR_TOTAL_ITEM_NEW'
      Calculated = True
    end
    object IBQuery1VLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery1VLR_IPI_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'VLR_IPI_ITEM_NEW'
      Calculated = True
    end
    object IBQuery1ISENCAO_IPI: TIBStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'NATUREZAS.ISENCAO_IPI'
      Size = 1
    end
    object IBQuery1ISENCAO_ICMS: TIBStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'NATUREZAS.ISENCAO_ICMS'
      Size = 1
    end
    object IBQuery1ALIQ_IPI_PRODUTO: TIBBCDField
      FieldName = 'ALIQ_IPI_PRODUTO'
      Origin = 'NATUREZAS.ALIQ_IPI'
      Precision = 9
      Size = 2
    end
    object IBQuery1ALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object IBQuery1ALIQ_ICMS_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'ALIQ_ICMS_ITEM_NEW'
      Calculated = True
    end
    object IBQuery1VLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'PEDIDOS_ITENS.VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery1VLR_ICMS_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'VLR_ICMS_ITEM_NEW'
      Calculated = True
    end
    object IBQuery1ESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CLIENTES.ESTADO'
      Size = 2
    end
    object IBQuery1INSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'CLIENTES.INSCR_ESTADUAL'
    end
    object IBQuery1ALIQ_ICMS_NAT: TIBBCDField
      FieldName = 'ALIQ_ICMS_NAT'
      Origin = 'NATUREZAS.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQuery1ALIQ_ICMS_PROD: TIBBCDField
      FieldName = 'ALIQ_ICMS_PROD'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = IBQuery1
    Left = 72
    Top = 16
  end
  object IBQuery2: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select p.pedido_sq, numero_pedido,'
      'sum(vlr_ipi_item) as ipi_item, vlr_ipi,'
      'sum(vlr_icms_item) as icms_item, vlr_icms,'
      'sum(vlr_total_item) as prod_item, vlr_produtos, base_icms'
      'from pedidos p'
      'left outer join pedidos_itens pi on (pi.pedido_sq = p.pedido_sq)'
      
        'group by p.pedido_sq, numero_pedido, vlr_ipi, vlr_icms, vlr_prod' +
        'utos, base_icms')
    Left = 24
    Top = 72
    object IBQuery2PEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
      Required = True
    end
    object IBQuery2NUMERO_PEDIDO: TIntegerField
      FieldName = 'NUMERO_PEDIDO'
    end
    object IBQuery2IPI_ITEM: TIBBCDField
      FieldName = 'IPI_ITEM'
      Precision = 18
      Size = 2
    end
    object IBQuery2VLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object IBQuery2ICMS_ITEM: TIBBCDField
      FieldName = 'ICMS_ITEM'
      Precision = 18
      Size = 2
    end
    object IBQuery2VLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQuery2PROD_ITEM: TIBBCDField
      FieldName = 'PROD_ITEM'
      Precision = 18
      Size = 2
    end
    object IBQuery2VLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object IBQuery2BASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
  end
  object DataSource2: TDataSource
    DataSet = IBQuery2
    Left = 72
    Top = 72
  end
  object IBQuery3: TIBQuery
    OnCalcFields = IBQuery3CalcFields
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      'select ni.nfiscal_sq, numero_nfiscal, nfiscal_item_sq,'
      'qtde_item, ni.vlr_unit_item, aliq_ipi_item, aliq_icms_item,'
      'vlr_total_item, vlr_ipi_item, vlr_icms_item,'
      'isencao_ipi, isencao_icms,'
      'nbm.aliq_ipi as aliq_ipi_produto,'
      'estado, inscr_estadual,'
      'n.aliq_icms as aliq_icms_nat,'
      'nbm.aliq_icms as aliq_icms_prod,'
      'p.cotacao_dolar'
      'from nfiscais_itens ni'
      'left outer join nfiscais  nf on (nf.nfiscal_sq = ni.nfiscal_sq)'
      'left outer join naturezas n  on (n.natureza_sq = nf.natureza_sq)'
      'left outer join produtos  pr on (pr.produto_sq = ni.produto_sq)'
      'left outer join nbm          on (nbm.nbm_sq = pr.nbm_sq)'
      'left outer join clientes  c  on (c.cliente_sq = nf.cliente_sq)'
      'left outer join pedidos p on (p.pedido_sq = nf.pedido_sq)')
    Left = 24
    Top = 128
    object IBQuery3NFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Origin = 'NFISCAIS_ITENS.NFISCAL_SQ'
      Required = True
    end
    object IBQuery3NUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Origin = 'NFISCAIS.NUMERO_NFISCAL'
    end
    object IBQuery3NFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
      Origin = 'NFISCAIS_ITENS.NFISCAL_ITEM_SQ'
      Required = True
    end
    object IBQuery3ESTADO: TIBStringField
      FieldName = 'ESTADO'
      Origin = 'CLIENTES.ESTADO'
      Size = 2
    end
    object IBQuery3ISENCAO_ICMS: TIBStringField
      FieldName = 'ISENCAO_ICMS'
      Origin = 'NATUREZAS.ISENCAO_ICMS'
      Size = 1
    end
    object IBQuery3ISENCAO_IPI: TIBStringField
      FieldName = 'ISENCAO_IPI'
      Origin = 'NATUREZAS.ISENCAO_IPI'
      Size = 1
    end
    object IBQuery3INSCR_ESTADUAL: TIBStringField
      FieldName = 'INSCR_ESTADUAL'
      Origin = 'CLIENTES.INSCR_ESTADUAL'
    end
    object IBQuery3QTDE_ITEM: TIntegerField
      FieldName = 'QTDE_ITEM'
      Origin = 'NFISCAIS_ITENS.QTDE_ITEM'
    end
    object IBQuery3VLR_UNIT_ITEM: TIBBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery3ALIQ_ICMS_PROD: TIBBCDField
      FieldName = 'ALIQ_ICMS_PROD'
      Origin = 'NBM.ALIQ_ICMS'
      Precision = 4
      Size = 2
    end
    object IBQuery3ALIQ_ICMS_NAT: TIBBCDField
      FieldName = 'ALIQ_ICMS_NAT'
      Origin = 'NATUREZAS.ALIQ_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQuery3ALIQ_IPI_PRODUTO: TIBBCDField
      FieldName = 'ALIQ_IPI_PRODUTO'
      Origin = 'NBM.ALIQ_IPI'
      Precision = 4
      Size = 2
    end
    object IBQuery3COTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Origin = 'PEDIDOS.COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object IBQuery3ALIQ_IPI_ITEM: TIBBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Origin = 'NFISCAIS_ITENS.ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object IBQuery3ALIQ_IPI_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'ALIQ_IPI_ITEM_NEW'
      Calculated = True
    end
    object IBQuery3ALIQ_ICMS_ITEM: TIBBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Origin = 'NFISCAIS_ITENS.ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object IBQuery3ALIQ_ICMS_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'ALIQ_ICMS_ITEM_NEW'
      Calculated = True
    end
    object IBQuery3VLR_TOTAL_ITEM: TIBBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery3VLR_TOTAL_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'VLR_TOTAL_ITEM_NEW'
      Calculated = True
    end
    object IBQuery3VLR_IPI_ITEM: TIBBCDField
      FieldName = 'VLR_IPI_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery3VLR_IPI_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'VLR_IPI_ITEM_NEW'
      Calculated = True
    end
    object IBQuery3VLR_ICMS_ITEM: TIBBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Origin = 'NFISCAIS_ITENS.VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object IBQuery3VLR_ICMS_ITEM_NEW: TIBBCDField
      FieldKind = fkCalculated
      FieldName = 'VLR_ICMS_ITEM_NEW'
      Calculated = True
    end
  end
  object DataSource3: TDataSource
    DataSet = IBQuery3
    Left = 72
    Top = 128
  end
  object IBQuery4: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    SQL.Strings = (
      
        'select n.nfiscal_sq, numero_nfiscal, p.cotacao_dolar, n.VLR_DESP' +
        '_ACESS, n.VLR_FRETE, n.VLR_SEGURO, '
      'sum(vlr_ipi_item) as ipi_item, n.vlr_ipi,'
      'sum(vlr_icms_item) as icms_item, n.vlr_icms,'
      'sum(vlr_total_item) as prod_item, n.vlr_produtos, n.base_icms'
      'from nfiscais n'
      
        'left outer join nfiscais_itens ni on (ni.nfiscal_sq = n.nfiscal_' +
        'sq)'
      'left outer join pedidos p on (p.pedido_sq = n.pedido_sq)'
      
        'group by n.nfiscal_sq, numero_nfiscal, n.vlr_ipi, n.vlr_icms, n.' +
        'vlr_produtos, n.base_icms, p.cotacao_dolar, n.VLR_DESP_ACESS, n.' +
        'VLR_FRETE, n.VLR_SEGURO')
    Left = 24
    Top = 184
    object IBQuery4NFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
      Required = True
    end
    object IBQuery4NUMERO_NFISCAL: TIntegerField
      FieldName = 'NUMERO_NFISCAL'
      Required = True
    end
    object IBQuery4COTACAO_DOLAR: TIBBCDField
      FieldName = 'COTACAO_DOLAR'
      Precision = 9
      Size = 4
    end
    object IBQuery4IPI_ITEM: TIBBCDField
      FieldName = 'IPI_ITEM'
      Precision = 18
      Size = 2
    end
    object IBQuery4VLR_IPI: TIBBCDField
      FieldName = 'VLR_IPI'
      Precision = 9
      Size = 2
    end
    object IBQuery4ICMS_ITEM: TIBBCDField
      FieldName = 'ICMS_ITEM'
      Precision = 18
      Size = 2
    end
    object IBQuery4VLR_ICMS: TIBBCDField
      FieldName = 'VLR_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQuery4PROD_ITEM: TIBBCDField
      FieldName = 'PROD_ITEM'
      Precision = 18
      Size = 2
    end
    object IBQuery4VLR_PRODUTOS: TIBBCDField
      FieldName = 'VLR_PRODUTOS'
      Precision = 9
      Size = 2
    end
    object IBQuery4BASE_ICMS: TIBBCDField
      FieldName = 'BASE_ICMS'
      Precision = 9
      Size = 2
    end
    object IBQuery4VLR_DESP_ACESS: TIBBCDField
      FieldName = 'VLR_DESP_ACESS'
      Precision = 9
      Size = 2
    end
    object IBQuery4VLR_FRETE: TIBBCDField
      FieldName = 'VLR_FRETE'
      Precision = 9
      Size = 2
    end
    object IBQuery4VLR_SEGURO: TIBBCDField
      FieldName = 'VLR_SEGURO'
      Precision = 9
      Size = 2
    end
  end
  object DataSource4: TDataSource
    DataSet = IBQuery4
    Left = 72
    Top = 184
  end
end
