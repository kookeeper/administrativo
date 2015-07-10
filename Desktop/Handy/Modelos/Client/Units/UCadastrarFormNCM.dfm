inherited FCadastrarFormNCM: TFCadastrarFormNCM
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de NCM'
  Caption = 'Cadastrar NCM'
  ClientHeight = 146
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 211
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 135
    Top = 56
    Width = 84
    Height = 13
    Caption = 'Al'#237'quota de ICMS'
  end
  object Label3: TLabel [2]
    Left = 284
    Top = 56
    Width = 71
    Height = 13
    Caption = 'Al'#237'quota de IPI'
  end
  inherited Panel1: TPanel
    Top = 116
    TabOrder = 3
  end
  object edCodigo: TEdit
    Left = 248
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object edICMS: TEdit
    Left = 224
    Top = 56
    Width = 49
    Height = 21
    TabOrder = 1
  end
  object edIPI: TEdit
    Left = 360
    Top = 56
    Width = 49
    Height = 21
    TabOrder = 2
  end
end
