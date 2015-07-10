object FImprimirMovimentacao: TFImprimirMovimentacao
  Left = 422
  Top = 124
  Width = 509
  Height = 186
  BorderIcons = [biSystemMenu]
  Caption = 'Imprimir movimenta'#231#227'o do estoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 168
    Top = 56
    Width = 27
    Height = 13
    Caption = 'In'#237'cio'
  end
  object Label4: TLabel
    Left = 160
    Top = 80
    Width = 38
    Height = 13
    Caption = 'T'#233'rmino'
  end
  object dbldProduto: TDBLookupComboBox
    Left = 224
    Top = 16
    Width = 273
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'DESCRICAO_PRODUTO'
    ListSource = dsListaProdutos
    TabOrder = 1
  end
  object dblcProduto: TDBLookupComboBox
    Left = 80
    Top = 16
    Width = 137
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'CODIGO_PRODUTO'
    ListSource = dsListaProdutos
    TabOrder = 0
  end
  object dtpInicio: TDateTimePicker
    Left = 208
    Top = 56
    Width = 98
    Height = 21
    Date = 38586.414024375000000000
    Time = 38586.414024375000000000
    TabOrder = 2
  end
  object dtpFim: TDateTimePicker
    Left = 208
    Top = 80
    Width = 98
    Height = 21
    Date = 38586.414024375000000000
    Time = 38586.414024375000000000
    TabOrder = 3
  end
  object Panel1: TPanel
    Left = 0
    Top = 122
    Width = 501
    Height = 30
    Align = alBottom
    TabOrder = 4
    DesignSize = (
      501
      30)
    object bbImprimir: TBitBtn
      Left = 340
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
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
      Left = 420
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
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
  object cbProduto: TCheckBox
    Left = 8
    Top = 16
    Width = 65
    Height = 17
    Caption = 'Produto'
    TabOrder = 5
    OnClick = cbProdutoClick
  end
  object dsListaProdutos: TDataSource
    Left = 64
    Top = 56
  end
end
