inherited FCadastrarFormVendedores: TFCadastrarFormVendedores
  Top = 357
  Caption = 'Cadastrar Vendedores'
  ClientHeight = 130
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 87
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 92
    Top = 56
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  inherited Panel1: TPanel
    Top = 100
    TabOrder = 2
  end
  object edCodigo: TEdit
    Left = 128
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object edNome: TEdit
    Left = 128
    Top = 56
    Width = 329
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
end
