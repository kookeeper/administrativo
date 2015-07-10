object FExportarRMA: TFExportarRMA
  Left = 188
  Top = 156
  Width = 798
  Height = 361
  Caption = 'Exportar R.M.A.'
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 790
    Height = 286
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'RMA NO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Receive Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Process Date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Repair Center'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Customer Name'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Phone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Model'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Serial number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'In/Out of Warranty'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Defected reason'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'How to repair'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Change component'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Parts number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Technician'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Result'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Freight'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Warraty'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 286
    Width = 790
    Height = 41
    Align = alBottom
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 32
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
    end
    object BitBtn1: TBitBtn
      Left = 624
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 0
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
    object bbFechar: TBitBtn
      Left = 703
      Top = 10
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
    object cbReferencia: TRzComboBox
      Left = 96
      Top = 8
      Width = 145
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 2
      OnChange = cbReferenciaChange
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsImprRMA
    Left = 160
    Top = 112
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel Files|*.xls'
    Left = 336
    Top = 208
  end
  object Excel: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 336
    Top = 152
  end
end
