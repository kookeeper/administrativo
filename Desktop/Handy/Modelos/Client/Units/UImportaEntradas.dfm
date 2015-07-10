object FImportaEntradas: TFImportaEntradas
  Left = 301
  Top = 103
  Width = 481
  Height = 136
  Caption = 'Importa Entradas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 8
    Width = 82
    Height = 13
    Caption = 'Nome do Arquivo'
  end
  object SpeedButton1: TSpeedButton
    Left = 440
    Top = 8
    Width = 23
    Height = 22
    Caption = '...'
    OnClick = SpeedButton1Click
  end
  object edArquivo: TEdit
    Left = 112
    Top = 8
    Width = 329
    Height = 21
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 79
    Width = 473
    Height = 30
    Align = alBottom
    TabOrder = 1
    object bbOk: TBitBtn
      Left = 311
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Importar'
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object bbCancelar: TBitBtn
      Left = 391
      Top = 2
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 1
      Kind = bkClose
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 392
    Top = 32
  end
end
