inherited FCadastrarFormClassificacao: TFCadastrarFormClassificacao
  Left = 166
  Top = 267
  Caption = 'Cadastrar Classifica'#231#227'o'
  ClientHeight = 118
  ClientWidth = 453
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 55
    Top = 16
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'C'#243'digo'
  end
  object Label3: TLabel [1]
    Left = 242
    Top = 16
    Width = 62
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor M'#237'nimo'
  end
  object Label4: TLabel [2]
    Left = 241
    Top = 48
    Width = 63
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor M'#225'ximo'
  end
  object Label5: TLabel [3]
    Left = 9
    Top = 48
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'Meses de Bonus'
  end
  inherited Panel1: TPanel
    Top = 88
    Width = 453
    TabOrder = 4
    DesignSize = (
      453
      30)
    inherited bbOk: TBitBtn
      Left = 292
    end
    inherited bbCancelar: TBitBtn
      Left = 372
    end
  end
  object edCodigo: TRzEdit
    Left = 96
    Top = 16
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edMinimo: TRzNumericEdit
    Left = 312
    Top = 16
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 2
    IntegersOnly = False
    DisplayFormat = ',0.00;-,0.00'
  end
  object edMaximo: TRzNumericEdit
    Left = 312
    Top = 48
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 3
    IntegersOnly = False
    DisplayFormat = ',0.00;-,0.00'
  end
  object edMeses: TRzNumericEdit
    Left = 96
    Top = 48
    Width = 49
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 1
    DisplayFormat = ',0;(,0)'
  end
end
