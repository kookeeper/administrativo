object FSetup: TFSetup
  Left = 265
  Top = 279
  Width = 403
  Height = 176
  Caption = 'Setup'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 56
    Width = 124
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nome do Computador / IP'
  end
  object edIP: TEdit
    Left = 152
    Top = 56
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 238
    Top = 123
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelBtn: TButton
    Left = 318
    Top = 123
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
