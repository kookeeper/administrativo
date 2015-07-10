inherited FCadastrarFormContasPagarAuto: TFCadastrarFormContasPagarAuto
  Caption = 'Contas a pagar - Manuten'#231#227'o'
  ClientHeight = 321
  ClientWidth = 502
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 94
    Top = 80
    Width = 95
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero de parcelas'
  end
  object Label5: TLabel [1]
    Left = 126
    Top = 112
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor a pagar'
  end
  object Label6: TLabel [2]
    Left = 140
    Top = 48
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data inicial'
  end
  object Label1: TLabel [3]
    Left = 27
    Top = 176
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object lblCliente: TLabel [4]
    Left = 15
    Top = 16
    Width = 54
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'Fornecedor'
  end
  inherited Panel1: TPanel
    Top = 291
    Width = 502
    TabOrder = 5
    inherited bbOk: TBitBtn
      Left = 341
    end
    inherited bbCancelar: TBitBtn
      Left = 421
    end
  end
  object edValor: TRzNumericEdit
    Left = 200
    Top = 112
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 3
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object mmObservacao: TRzMemo
    Left = 24
    Top = 192
    Width = 457
    Height = 89
    TabOrder = 4
  end
  object dblnFornecedor: TDBLookupComboBox
    Left = 80
    Top = 16
    Width = 361
    Height = 21
    KeyField = 'fornecedor_sq'
    ListField = 'nome_fornecedor'
    ListSource = dsListaFornecedor
    TabOrder = 0
  end
  object edParcelas: TRzNumericEdit
    Left = 200
    Top = 80
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 2
    DisplayFormat = ',0;(,0)'
  end
  object edDtInicial: TRzDateTimeEdit
    Left = 200
    Top = 48
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 1
  end
  object dsListaFornecedor: TDataSource
    Left = 352
    Top = 144
  end
end
