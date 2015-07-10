object fTrocaSenha: TfTrocaSenha
  Left = 498
  Top = 340
  Width = 250
  Height = 166
  Caption = 'Troca Senha'
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
    Left = 8
    Top = 49
    Width = 110
    Height = 13
    Caption = 'Re-digite a nova senha'
  end
  object Label2: TLabel
    Left = 8
    Top = 9
    Width = 95
    Height = 13
    Caption = 'Digite a nova senha'
  end
  object OKBtn: TButton
    Left = 112
    Top = 99
    Width = 57
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 176
    Top = 99
    Width = 57
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object Password2: TRzEdit
    Left = 8
    Top = 67
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Password1: TRzEdit
    Left = 8
    Top = 27
    Width = 217
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
end
