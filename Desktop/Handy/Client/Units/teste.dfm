object Form1: TForm1
  Left = 326
  Top = 110
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 128
    Top = 104
    Width = 75
    Height = 25
    Caption = 'criar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 128
    Top = 200
    Width = 345
    Height = 193
    TabOrder = 1
  end
  object edit: TRzNumericEdit
    Left = 136
    Top = 40
    Width = 65
    Height = 21
    TabOrder = 2
    DisplayFormat = ',0;(,0)'
  end
  object Button2: TButton
    Left = 216
    Top = 104
    Width = 75
    Height = 25
    Caption = 'listar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 304
    Top = 104
    Width = 75
    Height = 25
    Caption = 'salvar'
    TabOrder = 4
    OnClick = Button3Click
  end
  object ncm: TEdit
    Left = 272
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'ncm'
  end
end
