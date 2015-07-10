object FImprimirEstoque: TFImprimirEstoque
  Left = 459
  Top = 126
  Width = 747
  Height = 506
  BorderIcons = [biSystemMenu]
  Caption = 'Imprimir Estoque'
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
    Top = 392
    Width = 739
    Height = 80
    Align = alBottom
    TabOrder = 0
    object bbImprimir: TBitBtn
      Left = 567
      Top = 42
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
      Left = 647
      Top = 42
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
    object rgTipo: TRadioGroup
      Left = 120
      Top = 4
      Width = 105
      Height = 68
      Caption = 'Tipo do Produto'
      ItemIndex = 0
      Items.Strings = (
        'Produtos'
        'Pe'#231'as')
      TabOrder = 2
      OnClick = rgTipoClick
    end
    object rgGrafico: TRadioGroup
      Left = 232
      Top = 4
      Width = 106
      Height = 67
      Caption = 'Tipo do Gr'#225'fico'
      ItemIndex = 0
      Items.Strings = (
        'Barra'
        'Pizza')
      TabOrder = 3
      OnClick = rgGraficoClick
    end
    object BitBtn1: TBitBtn
      Left = 488
      Top = 42
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 4
      OnClick = BitBtn1Click
      Glyph.Data = {
        6E040000424D6E04000000000000360000002800000014000000120000000100
        1800000000003804000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
        0000000000000000000000000000000000000000004080404080404080404080
        40000000FFFFFFFFFFFFFFFFFFFFFFFF00000080A06080A06080A06080A06080
        A06080A06080A06080A06000000040804080A04040E020FFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080A0404080404080404080404080
        4040804000000040804080A04040E020FFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080A040408040408040408040000000
        40804080A04040E020FFFFFF000000408040000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00000080A04040804000000040804080A04040
        E020FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000000000040804080A04040E020FFFFFF0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF00000040804080A04040E020FFFFFF000000000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00000040804080A04040E020FFFFFF00000040804080A060000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000408040
        80A04040E020FFFFFF00000080A04040804040804080A060000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000040804080A04040E020FF
        FFFF000000FFFFFF00000080A04040804040804080A060000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFF00000080A04080A04080A04080A040000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object rgEstoque: TRadioGroup
      Left = 344
      Top = 4
      Width = 105
      Height = 67
      Caption = 'Tipo do Produto'
      ItemIndex = 0
      Items.Strings = (
        'Com estoque'
        'Sem estoque'
        'Tudo')
      TabOrder = 5
      OnClick = rgTipoClick
    end
    object rgOrdenacao: TRadioGroup
      Left = 8
      Top = 4
      Width = 105
      Height = 68
      Caption = 'Ordena'#231#227'o'
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      TabOrder = 6
      OnClick = rgTipoClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 739
    Height = 392
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Estoque'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 731
        Height = 364
        Align = alClient
        DataSource = dsImprEst
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_PRODUTO'
            Title.Caption = 'Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_PRODUTO'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque3'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque4'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque5'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque6'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque7'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque8'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque9'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque10'
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
            FieldName = 'PRECO_UNIT'
            Title.Caption = 'Pre'#231'o unit'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_TOTAL'
            Title.Caption = 'Pre'#231'o total'
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Resumo'
      ImageIndex = 2
      object DBChart1: TDBChart
        Left = 0
        Top = 0
        Width = 731
        Height = 364
        AllowPanning = pmNone
        AllowZoom = False
        AnimatedZoom = True
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        BackWall.Pen.Visible = False
        Title.Font.Charset = ANSI_CHARSET
        Title.Font.Color = clBlue
        Title.Font.Height = -16
        Title.Font.Name = 'Comic Sans MS'
        Title.Font.Style = []
        Title.Text.Strings = (
          'Resumo do Estoque')
        AxisVisible = False
        ClipPoints = False
        Frame.Visible = False
        LeftAxis.ExactDateTime = False
        View3DOptions.Elevation = 315
        View3DOptions.Orthogonal = False
        View3DOptions.Perspective = 0
        View3DOptions.Rotation = 360
        View3DWalls = False
        Align = alClient
        TabOrder = 0
        object BarSeries1: TBarSeries
          ColorEachPoint = True
          Marks.ArrowLength = 8
          Marks.Style = smsLabelPercent
          Marks.Visible = False
          DataSource = DM.cdsImprEst
          SeriesColor = clRed
          XLabelsSource = 'DESCRICAO_PRODUTO'
          MultiBar = mbNone
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Bar'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
          YValues.ValueSource = 'PRECO_TOTAL'
        end
        object Series2: TPieSeries
          Marks.ArrowLength = 8
          Marks.Style = smsLabelPercent
          Marks.Visible = False
          DataSource = DM.cdsImprEst
          SeriesColor = clRed
          XLabelsSource = 'DESCRICAO_PRODUTO'
          OtherSlice.Text = 'Other'
          PieValues.DateTime = False
          PieValues.Name = 'Pie'
          PieValues.Multiplier = 1.000000000000000000
          PieValues.Order = loNone
          PieValues.ValueSource = 'PRECO_TOTAL'
        end
      end
    end
  end
  object dsImprEst: TDataSource
    DataSet = DM.cdsImprEst
    Left = 864
    Top = 168
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel Files|*.xls'
    Left = 864
    Top = 224
  end
  object cdsImprEst: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'TIPO_PRODUTO'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'ORDEM'
        ParamType = ptUnknown
        Value = 'DESCRICAO_MODELO'
      end>
    ProviderName = 'dspImprEst'
    ReadOnly = True
    Left = 864
    Top = 112
  end
end
