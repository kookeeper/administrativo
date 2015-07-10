object FImprimirComissao: TFImprimirComissao
  Left = 325
  Top = 116
  Width = 696
  Height = 480
  Caption = 'Imprimir Comiss'#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label2: TLabel
      Left = 534
      Top = 16
      Width = 27
      Height = 13
      Caption = 'In'#237'cio'
    end
    object Label4: TLabel
      Left = 526
      Top = 40
      Width = 38
      Height = 13
      Caption = 'T'#233'rmino'
    end
    object dblVendedor: TDBLookupComboBox
      Left = 88
      Top = 8
      Width = 393
      Height = 21
      KeyField = 'VENDEDOR_SQ'
      ListField = 'NOME_VENDEDOR'
      ListSource = dsListaVendedores
      TabOrder = 0
      OnClick = dblVendedorClick
    end
    object dtpInicio: TDateTimePicker
      Left = 574
      Top = 16
      Width = 98
      Height = 21
      Date = 38586.414024375000000000
      Time = 38586.414024375000000000
      TabOrder = 2
      OnChange = dblVendedorClick
    end
    object dtpFim: TDateTimePicker
      Left = 574
      Top = 40
      Width = 98
      Height = 21
      Date = 38586.414024375000000000
      Time = 38586.414024375000000000
      TabOrder = 3
      OnChange = dblVendedorClick
    end
    object cbVendedor: TCheckBox
      Left = 8
      Top = 8
      Width = 73
      Height = 17
      Caption = 'Vendedor'
      Checked = True
      State = cbChecked
      TabOrder = 1
      OnClick = dblVendedorClick
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 73
    Width = 688
    Height = 343
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Vendas'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 680
        Height = 315
        Align = alClient
        DataSource = dsImprComissao
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nome_vendedor'
            Title.Caption = 'Vendedor'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'numero_nfiscal'
            Title.Caption = 'Nota fiscal'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'origem'
            Title.Caption = 'Origem'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'base'
            Title.Caption = 'Base'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_total'
            Title.Caption = 'Base de c'#225'lculo'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'comissao'
            Title.Caption = 'Vlr comiss'#227'o'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_cliente'
            Title.Caption = 'Cliente'
            Visible = True
          end>
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 688
    Height = 30
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      688
      30)
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
    object bbFechar: TBitBtn
      Left = 607
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 0
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
    object btnExportar: TBitBtn
      Left = 528
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 1
      OnClick = btnExportarClick
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
  end
  object dsListaVendedores: TDataSource
    Left = 176
    Top = 232
  end
  object dsImprComissao: TDataSource
    Left = 320
    Top = 224
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel Files|*.xls'
    Left = 328
    Top = 288
  end
end
