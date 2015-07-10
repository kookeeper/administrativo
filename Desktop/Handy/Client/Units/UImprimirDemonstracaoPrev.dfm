object FImprimirDemonstracaoPrev: TFImprimirDemonstracaoPrev
  Left = 261
  Top = 103
  Width = 736
  Height = 480
  Caption = 'Previs'#227'o de Retorno de Notas de Demonstra'#231#227'o'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 728
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 95
      Top = 8
      Width = 53
      Height = 13
      Caption = 'Data Inicial'
    end
    object Label2: TLabel
      Left = 332
      Top = 8
      Width = 48
      Height = 13
      Caption = 'Data Final'
    end
    object edInicio: TRzEdit
      Left = 152
      Top = 8
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edInicioChange
    end
    object edFim: TRzEdit
      Left = 384
      Top = 8
      Width = 153
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = edInicioChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 728
    Height = 375
    Align = alClient
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
        FieldName = 'NUMERO_NFISCAL'
        Title.Caption = 'N'#250'mero'
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
        FieldName = 'DTEMISSAO_NFISCAL'
        Title.Caption = 'Data de Emiss'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DIAS_DEMONSTRACAO'
        Title.Caption = 'Dias em Demonstra'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL'
        Title.Caption = 'Valor Total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_NFISCAL_RETORNO'
        Title.Caption = 'N'#250'mero N.F. Retorno'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DT_NFISCAL_RETORNO'
        Title.Caption = 'Data N.F. Retorno'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 728
    Height = 30
    Align = alBottom
    TabOrder = 2
    object bbImprimir: TBitBtn
      Left = 567
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
      Left = 647
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
  object DataSource1: TDataSource
    DataSet = DM.cdsImprDemPrev
    Left = 472
    Top = 208
  end
end
