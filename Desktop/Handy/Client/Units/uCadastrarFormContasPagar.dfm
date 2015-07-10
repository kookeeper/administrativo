inherited FCadastrarFormContasPagar: TFCadastrarFormContasPagar
  Left = 448
  Top = 232
  Caption = 'Contas a pagar'
  ClientHeight = 394
  ClientWidth = 495
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 64
    Top = 48
    Width = 45
    Height = 13
    Alignment = taRightJustify
    Caption = 'Duplicata'
  end
  object Label5: TLabel [1]
    Left = 286
    Top = 48
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor a pagar'
  end
  object Label6: TLabel [2]
    Left = 73
    Top = 80
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Emiss'#227'o'
  end
  object Label7: TLabel [3]
    Left = 16
    Top = 112
    Width = 97
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data do Vencimento'
  end
  object Label1: TLabel [4]
    Left = 19
    Top = 248
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object lblCliente: TLabel [5]
    Left = 55
    Top = 16
    Width = 54
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'Fornecedor'
  end
  object Label2: TLabel [6]
    Left = 58
    Top = 144
    Width = 54
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pagamento'
  end
  object Label3: TLabel [7]
    Left = 303
    Top = 80
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Desconto'
  end
  object Label8: TLabel [8]
    Left = 324
    Top = 112
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Caption = 'Juros'
  end
  object Label9: TLabel [9]
    Left = 298
    Top = 144
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor pago'
  end
  object Label10: TLabel [10]
    Left = 9
    Top = 176
    Width = 100
    Height = 13
    Alignment = taRightJustify
    Caption = 'Forma de pagamento'
  end
  object Label11: TLabel [11]
    Left = 45
    Top = 208
    Width = 64
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'Banco/Conta'
  end
  inherited Panel1: TPanel
    Top = 364
    Width = 495
    TabOrder = 12
    DesignSize = (
      495
      30)
    inherited bbOk: TBitBtn
      Left = 334
    end
    inherited bbCancelar: TBitBtn
      Left = 414
    end
  end
  object edValor: TRzNumericEdit
    Left = 360
    Top = 48
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 5
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object mmObservacao: TRzMemo
    Left = 16
    Top = 264
    Width = 457
    Height = 89
    TabOrder = 11
  end
  object edDtEmissao: TRzDateTimeEdit
    Left = 120
    Top = 80
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 2
  end
  object edDtVencto: TRzDateTimeEdit
    Left = 120
    Top = 112
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 3
  end
  object dblFornecedor: TDBLookupComboBox
    Left = 120
    Top = 16
    Width = 361
    Height = 21
    KeyField = 'fornecedor_sq'
    ListField = 'nome_fornecedor'
    ListSource = dsListaFornecedor
    TabOrder = 0
  end
  object edDtPagamento: TRzDateTimeEdit
    Left = 120
    Top = 144
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 4
  end
  object edDesconto: TRzNumericEdit
    Left = 360
    Top = 80
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 6
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edJuros: TRzNumericEdit
    Left = 360
    Top = 112
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 7
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edValorPago: TRzNumericEdit
    Left = 360
    Top = 144
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 8
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edForma: TRzEdit
    Left = 120
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object dblContaBanco: TDBLookupComboBox
    Left = 120
    Top = 208
    Width = 361
    Height = 21
    KeyField = 'conta_banco_sq'
    ListField = 'numero_conta'
    ListSource = dsListaContaBanco
    TabOrder = 10
  end
  object edNumero: TRzEdit
    Left = 120
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object dsListaFornecedor: TDataSource
    Left = 264
    Top = 88
  end
  object dsListaContaBanco: TDataSource
    Left = 264
    Top = 144
  end
end
