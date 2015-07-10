object FImprimirClientesHist: TFImprimirClientesHist
  Left = 281
  Top = 103
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Imprimir Hist'#243'rico de Clientes'
  ClientHeight = 510
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 480
    Width = 540
    Height = 30
    Align = alBottom
    TabOrder = 4
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Qtde. Itens'
    end
    object lbItens: TLabel
      Left = 64
      Top = 8
      Width = 17
      Height = 13
      Caption = '    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbValor: TLabel
      Left = 224
      Top = 8
      Width = 17
      Height = 13
      Caption = '    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 168
      Top = 9
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object bbImprimir: TBitBtn
      Left = 375
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      Default = True
      TabOrder = 0
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
      Left = 455
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 1
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
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 39
      Height = 13
      Caption = 'C.N.P.J.'
    end
    object Label2: TLabel
      Left = 227
      Top = 8
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome'
    end
    object Label4: TLabel
      Left = 32
      Top = 40
      Width = 27
      Height = 13
      Caption = 'In'#237'cio'
    end
    object Label5: TLabel
      Left = 220
      Top = 40
      Width = 38
      Height = 13
      Caption = 'T'#233'rmino'
    end
    object edCodigo: TEdit
      Left = 64
      Top = 8
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = edCodigoChange
    end
    object edNome: TEdit
      Left = 264
      Top = 8
      Width = 241
      Height = 21
      TabOrder = 1
      OnChange = edCodigoChange
    end
    object dtpInicio: TDateTimePicker
      Left = 64
      Top = 40
      Width = 97
      Height = 21
      Date = 38615.442000185180000000
      Time = 38615.442000185180000000
      TabOrder = 2
      OnChange = edCodigoChange
    end
    object dtpTermino: TDateTimePicker
      Left = 264
      Top = 40
      Width = 97
      Height = 21
      Date = 38615.442000185180000000
      Time = 38615.442000185180000000
      TabOrder = 3
      OnChange = edCodigoChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 540
    Height = 104
    Align = alTop
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO_CLIENTE'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Nome'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 177
    Width = 540
    Height = 160
    Align = alClient
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NUMERO_NFISCAL'
        Title.Caption = 'N.Fiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTEMISSAO_NFISCAL'
        Title.Caption = 'Dt Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COTACAO_DOLAR'
        Title.Caption = 'Dolar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ICMS'
        Title.Caption = 'Vlr. ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_IPI'
        Title.Caption = 'Vlr. IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_PRODUTOS'
        Title.Caption = 'Vlr. Produtos'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        Title.Caption = 'Vlr. Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_COND_PAGTO'
        Title.Caption = 'Condi'#231#227'o de Pagamento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_NATUREZA'
        Title.Caption = 'Natureza da Opera'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CFO'
        Title.Caption = 'C.F.O.P.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_TRANSPORTADORA'
        Title.Caption = 'Transportadora'
        Visible = True
      end>
  end
  object DBGrid3: TDBGrid
    Left = 0
    Top = 337
    Width = 540
    Height = 143
    Align = alBottom
    DataSource = DataSource3
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Caption = 'Item'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CLASS_FISCAL'
        Title.Caption = 'Class. Fiscal'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STRIBUT'
        Title.Caption = 'Sit. Tribut.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE_ITEM'
        Title.Caption = 'Qtde.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_UNIT_ITEM'
        Title.Caption = 'Vlr. Unit'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL_ITEM'
        Title.Caption = 'Vlr. Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_ICMS_ITEM'
        Title.Caption = 'Vlr. ICMS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_IPI_ITEM'
        Title.Caption = 'Vlr. IPI'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_PRODUTO'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_NBM'
        Title.Caption = 'N.C.M.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_SERIE_ITEM'
        Title.Caption = 'Nr. Serie'
        Width = 200
        Visible = True
      end>
  end
  object DataSource1: TDataSource
    DataSet = DMImpr.cdsImprHistClientes1
    Left = 424
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = DMImpr.cdsImprHistClientes2
    Left = 424
    Top = 200
  end
  object DataSource3: TDataSource
    DataSet = DMImpr.cdsImprHistClientes3
    Left = 424
    Top = 312
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 264
    Top = 72
  end
end
