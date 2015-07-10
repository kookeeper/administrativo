inherited FCadastrarFormDuplicatas: TFCadastrarFormDuplicatas
  Left = 345
  Top = 127
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Duplicatas'
  Caption = 'Cadastrar Duplicatas'
  ClientHeight = 184
  ClientWidth = 584
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel [1]
    Left = 208
    Top = 8
    Width = 20
    Height = 13
    Alignment = taRightJustify
    Caption = #205'tem'
  end
  object Label4: TLabel [2]
    Left = 376
    Top = 8
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nota Fiscal'
  end
  object Label5: TLabel [3]
    Left = 112
    Top = 56
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor'
  end
  object Label6: TLabel [4]
    Left = 320
    Top = 56
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data da Emissao'
  end
  object Label7: TLabel [5]
    Left = 304
    Top = 88
    Width = 97
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data do Vencimento'
  end
  object Label8: TLabel [6]
    Left = 304
    Top = 120
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data do Pagamento'
  end
  object Label9: TLabel [7]
    Left = 80
    Top = 120
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor Pago'
  end
  inherited Panel1: TPanel
    Top = 154
    Width = 584
    TabOrder = 8
  end
  object edNumero: TEdit
    Left = 56
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object edItem: TEdit
    Left = 232
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edNfiscal: TEdit
    Left = 440
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edValor: TEdit
    Left = 144
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edValorPg: TEdit
    Left = 144
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edDtEmissao: TEdit
    Left = 408
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edDtVencto: TEdit
    Left = 408
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 6
  end
  object edDtPagto: TEdit
    Left = 408
    Top = 120
    Width = 121
    Height = 21
    TabOrder = 7
  end
end
