inherited FManutencaoFormNFiscaisDemonstracao: TFManutencaoFormNFiscaisDemonstracao
  Left = 137
  Top = 113
  Caption = 'Manuten'#231#227'o nas Notas Fiscais de Demonstra'#231#227'o'
  ClientHeight = 408
  ClientWidth = 612
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 29
    Top = 49
    Width = 88
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'N'#250'mero do Pedido'
    OnClick = Label1Click
  end
  object Label2: TLabel [1]
    Left = 434
    Top = 17
    Width = 43
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Sa'#237'da'
  end
  object Label12: TLabel [2]
    Left = 27
    Top = 17
    Width = 90
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'N'#250'mero da NFiscal'
    OnClick = Label12Click
  end
  object Label13: TLabel [3]
    Left = 248
    Top = 17
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Emiss'#227'o'
  end
  object Label4: TLabel [4]
    Left = 254
    Top = 49
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Pedido'
  end
  object Label51: TLabel [5]
    Left = 7
    Top = 80
    Width = 110
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dias em Demonstra'#231#227'o'
  end
  object Label53: TLabel [6]
    Left = 452
    Top = 49
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dolar'
  end
  object Label3: TLabel [7]
    Left = 145
    Top = 145
    Width = 164
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero da Nota Fiscal de Retorno'
  end
  object Label6: TLabel [8]
    Left = 102
    Top = 177
    Width = 207
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data de Emiss'#227'o da Nota Fiscal de Retorno'
  end
  object Label7: TLabel [9]
    Left = 85
    Top = 113
    Width = 32
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cliente'
  end
  object Label5: TLabel [10]
    Left = 231
    Top = 81
    Width = 70
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Vencimento'
  end
  object Label8: TLabel [11]
    Left = 436
    Top = 81
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Limite'
  end
  object Label11: TLabel [12]
    Left = 3
    Top = 273
    Width = 58
    Height = 13
    Alignment = taRightJustify
    Caption = 'Observa'#231#227'o'
  end
  inherited Panel1: TPanel
    Top = 378
    Width = 612
    TabOrder = 15
    inherited bbOk: TBitBtn
      Left = 447
    end
    inherited bbCancelar: TBitBtn
      Left = 527
    end
  end
  object edNrPedido: TEdit
    Left = 120
    Top = 48
    Width = 112
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 3
  end
  object edNrNfiscal: TEdit
    Left = 120
    Top = 16
    Width = 113
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object edDtEmissao: TEdit
    Left = 304
    Top = 16
    Width = 113
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 1
  end
  object edDtSaida: TEdit
    Left = 480
    Top = 16
    Width = 113
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 2
  end
  object edDemonstracao: TEdit
    Left = 120
    Top = 80
    Width = 73
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 6
  end
  object edDolar: TEdit
    Left = 480
    Top = 48
    Width = 113
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object edNrNFiscalRet: TEdit
    Left = 312
    Top = 144
    Width = 113
    Height = 21
    TabOrder = 10
    OnChange = edNrNFiscalRetChange
  end
  object edDtNfiscalRet: TEdit
    Left = 312
    Top = 176
    Width = 113
    Height = 21
    TabOrder = 11
  end
  object edDtPedido: TEdit
    Left = 304
    Top = 48
    Width = 112
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
  object edCliente: TEdit
    Left = 120
    Top = 112
    Width = 473
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 9
  end
  object edDtLimite: TEdit
    Left = 480
    Top = 80
    Width = 113
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 8
  end
  object edDtVencto: TEdit
    Left = 304
    Top = 80
    Width = 112
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 7
  end
  object mmObservacao: TMemo
    Left = 0
    Top = 289
    Width = 612
    Height = 89
    Align = alBottom
    TabOrder = 14
  end
  object cbRetNFiscal: TCheckBox
    Left = 312
    Top = 208
    Width = 137
    Height = 17
    Caption = 'Retorno da Nota Fiscal'
    Enabled = False
    TabOrder = 12
  end
  object cbRetProduto: TCheckBox
    Left = 312
    Top = 240
    Width = 137
    Height = 17
    Caption = 'Retorno do Produto'
    TabOrder = 13
  end
end
