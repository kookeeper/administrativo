inherited FCadastrarFormVendedores: TFCadastrarFormVendedores
  Left = 503
  Top = 279
  Caption = 'Cadastrar Vendedores'
  ClientHeight = 254
  ClientWidth = 383
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 224
    Width = 383
    TabOrder = 1
    DesignSize = (
      383
      30)
    inherited bbOk: TBitBtn
      Left = 222
    end
    inherited bbCancelar: TBitBtn
      Left = 302
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 383
    Height = 224
    ActivePage = TabSheet1
    ActivePageDefault = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Geral'
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 8
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label7: TLabel
        Left = 136
        Top = 104
        Width = 82
        Height = 13
        Caption = 'Data do cadastro'
      end
      object Label8: TLabel
        Left = 264
        Top = 104
        Width = 90
        Height = 13
        Caption = 'Data da inativa'#231#227'o'
      end
      object Label9: TLabel
        Left = 136
        Top = 152
        Width = 55
        Height = 13
        Caption = '% desconto'
      end
      object Label10: TLabel
        Left = 208
        Top = 152
        Width = 89
        Height = 13
        Caption = '% desconto master'
      end
      object edNome: TRzEdit
        Left = 8
        Top = 72
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edCodigo: TRzNumericEdit
        Left = 8
        Top = 24
        Width = 105
        Height = 21
        TabOrder = 0
        DisplayFormat = ',0;(,0)'
      end
      object rgTipo: TRzRadioGroup
        Left = 8
        Top = 104
        Width = 113
        Height = 57
        Caption = 'Tipo de vendedor'
        Items.Strings = (
          'Vendedor'
          'Revenda')
        TabOrder = 2
      end
      object edDataCadastro: TRzDateTimeEdit
        Left = 136
        Top = 120
        Width = 105
        Height = 21
        EditType = etDate
        Alignment = taRightJustify
        Color = clInfoBk
        DropButtonVisible = False
        ReadOnly = True
        TabOrder = 3
      end
      object edDataInativacao: TRzDateTimeEdit
        Left = 264
        Top = 120
        Width = 105
        Height = 21
        EditType = etDate
        Alignment = taRightJustify
        TabOrder = 4
      end
      object edPorcentagemDesconto: TRzNumericEdit
        Left = 136
        Top = 168
        Width = 65
        Height = 21
        TabOrder = 5
        CheckRange = True
        Max = 99.000000000000000000
        DisplayFormat = '0;(0)'
      end
      object edPctDescontoMaster: TRzNumericEdit
        Left = 208
        Top = 168
        Width = 65
        Height = 21
        TabOrder = 6
        CheckRange = True
        Max = 99.000000000000000000
        DisplayFormat = '0;(0)'
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Comiss'#227'o'
      object Label3: TLabel
        Left = 7
        Top = 24
        Width = 43
        Height = 13
        Caption = '% pr'#243'pria'
      end
      object Label4: TLabel
        Left = 191
        Top = 24
        Width = 49
        Height = 13
        Caption = '% parceria'
      end
      object Label5: TLabel
        Left = 7
        Top = 48
        Width = 55
        Height = 13
        Caption = '% desconto'
      end
      object Label6: TLabel
        Left = 7
        Top = 72
        Width = 79
        Height = 13
        Caption = 'Motivo desconto'
      end
      object edObservacao: TRzEdit
        Left = 88
        Top = 72
        Width = 257
        Height = 21
        TabOrder = 0
      end
      object rgBaseComissao: TRzRadioGroup
        Left = 16
        Top = 104
        Width = 209
        Height = 81
        Caption = 'Base da comiss'#227'o'
        Items.Strings = (
          'valor faturado (data do faturamento)'
          'valor cobrado (data do vencimento)'
          'valor recebido (data do pagamento)')
        TabOrder = 1
      end
      object edPctPropria: TRzNumericEdit
        Left = 88
        Top = 24
        Width = 65
        Height = 21
        TabOrder = 2
        CheckRange = True
        IntegersOnly = False
        Max = 99.990000000000000000
        DisplayFormat = '0.00;(0.00)'
      end
      object edPctParceria: TRzNumericEdit
        Left = 272
        Top = 24
        Width = 65
        Height = 21
        TabOrder = 3
        CheckRange = True
        IntegersOnly = False
        Max = 99.990000000000000000
        DisplayFormat = '0.00;(0.00)'
      end
      object edPctDesconto: TRzNumericEdit
        Left = 88
        Top = 48
        Width = 65
        Height = 21
        TabOrder = 4
        CheckRange = True
        IntegersOnly = False
        Max = 99.990000000000000000
        DisplayFormat = '0.00;(0.00)'
      end
    end
  end
end
