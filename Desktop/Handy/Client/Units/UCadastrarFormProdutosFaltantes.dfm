inherited FCadastrarFormProdutosFaltantes: TFCadastrarFormProdutosFaltantes
  Left = 368
  Top = 313
  Caption = 'Cadastrar Produtos em Falta'
  ClientHeight = 209
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 88
    Top = 48
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cliente'
  end
  object Label2: TLabel [1]
    Left = 65
    Top = 80
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Quantidade'
  end
  object Label3: TLabel [2]
    Left = 97
    Top = 112
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data'
  end
  object Label4: TLabel [3]
    Left = 12
    Top = 144
    Width = 108
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nota Fiscal de Entrada'
  end
  object Label5: TLabel [4]
    Left = 83
    Top = 16
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Produto'
  end
  inherited Panel1: TPanel
    Top = 179
    TabOrder = 5
  end
  object edCliente: TRzEdit
    Left = 128
    Top = 48
    Width = 369
    Height = 21
    TabOrder = 1
  end
  object edQtde: TRzEdit
    Left = 128
    Top = 80
    Width = 49
    Height = 21
    TabOrder = 2
  end
  object edData: TRzEdit
    Left = 128
    Top = 112
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edNfEntrada: TRzEdit
    Left = 128
    Top = 144
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edProduto: TRzEdit
    Left = 128
    Top = 16
    Width = 369
    Height = 21
    TabOrder = 0
  end
end
