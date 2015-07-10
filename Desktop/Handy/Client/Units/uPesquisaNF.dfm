object FPesquisaNF: TFPesquisaNF
  Left = 286
  Top = 195
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Pesquisa NF'
  ClientHeight = 86
  ClientWidth = 270
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 78
    Height = 13
    Caption = 'N'#250'mero da NF-e'
  end
  object btnOk: TBitBtn
    Left = 104
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 1
    Kind = bkOK
  end
  object btnCancelar: TBitBtn
    Left = 184
    Top = 56
    Width = 75
    Height = 25
    TabOrder = 2
    Kind = bkCancel
  end
  object edNf: TRzNumericEdit
    Left = 136
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    DisplayFormat = ',0;(,0)'
  end
end
