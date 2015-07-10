object FSetup: TFSetup
  Left = 265
  Top = 279
  Width = 403
  Height = 157
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
    Left = 64
    Top = 16
    Width = 80
    Height = 13
    Caption = 'Banco de Dados'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 128
    Height = 13
    Alignment = taRightJustify
    Caption = 'Banco de Dados de C.E.P.'
  end
  object edBanco: TEdit
    Left = 152
    Top = 16
    Width = 233
    Height = 21
    TabOrder = 0
  end
  object OKBtn: TButton
    Left = 230
    Top = 91
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object CancelBtn: TButton
    Left = 310
    Top = 91
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object edBancoCep: TEdit
    Left = 152
    Top = 48
    Width = 233
    Height = 21
    TabOrder = 1
  end
end
