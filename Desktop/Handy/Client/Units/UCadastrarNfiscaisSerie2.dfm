object FCadastrarNfiscaisSerie2: TFCadastrarNfiscaisSerie2
  Left = 321
  Top = 110
  Width = 383
  Height = 229
  Caption = 'N'#250'mero de S'#233'rie'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmSerie: TMemo
    Left = 0
    Top = 0
    Width = 375
    Height = 165
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 165
    Width = 375
    Height = 30
    Align = alBottom
    TabOrder = 1
    object bbFechar: TBitBtn
      Left = 295
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkCancel
    end
    object BitBtn1: TBitBtn
      Left = 215
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkOK
    end
  end
end
