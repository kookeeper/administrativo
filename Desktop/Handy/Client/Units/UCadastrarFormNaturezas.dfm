inherited FCadastrarFormNaturezas: TFCadastrarFormNaturezas
  Left = 383
  Top = 109
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Naturezas'
  Caption = 'Cadastrar Naturezas'
  ClientHeight = 425
  ClientWidth = 609
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 395
    Width = 609
    TabOrder = 1
    DesignSize = (
      609
      30)
    inherited bbOk: TBitBtn
      Left = 441
    end
    inherited bbCancelar: TBitBtn
      Left = 521
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 609
    Height = 395
    ActivePage = TabSheet1
    Align = alClient
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Geral'
      object Label1: TLabel
        Left = 48
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 169
        Top = 8
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel
        Left = 441
        Top = 168
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'C.F.O.P.'
      end
      object Label4: TLabel
        Left = 509
        Top = 112
        Width = 84
        Height = 13
        Caption = 'Al'#237'quota de ICMS'
      end
      object Label5: TLabel
        Left = 509
        Top = 72
        Width = 80
        Height = 13
        Caption = 'Al'#237'quota de I.P.I.'
      end
      object Label6: TLabel
        Left = 237
        Top = 216
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label7: TLabel
        Left = 29
        Top = 272
        Width = 38
        Height = 13
        Caption = 'Estados'
      end
      object Label8: TLabel
        Left = 98
        Top = 40
        Width = 119
        Height = 13
        Alignment = taRightJustify
        Caption = 'Descri'#231#227'o na Nota Fiscal'
      end
      object Label9: TLabel
        Left = 497
        Top = 168
        Width = 70
        Height = 13
        Caption = 'C.F.O.P. Subst'
      end
      object mmObservacao: TMemo
        Left = 240
        Top = 232
        Width = 353
        Height = 129
        TabOrder = 11
      end
      object edCodigo: TRzEdit
        Left = 88
        Top = 8
        Width = 73
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object edDescricao: TRzEdit
        Left = 224
        Top = 8
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 1
      end
      object edDescricaoNF: TRzEdit
        Left = 224
        Top = 40
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 2
      end
      object edUF01: TRzEdit
        Left = 72
        Top = 272
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 12
      end
      object edUF02: TRzEdit
        Left = 96
        Top = 272
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 13
      end
      object edUF03: TRzEdit
        Left = 120
        Top = 272
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 14
      end
      object edUF04: TRzEdit
        Left = 144
        Top = 272
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 15
      end
      object edUF05: TRzEdit
        Left = 168
        Top = 272
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 16
      end
      object edUF06: TRzEdit
        Left = 192
        Top = 272
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 17
      end
      object edUF07: TRzEdit
        Left = 0
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 18
      end
      object edUF08: TRzEdit
        Left = 24
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 19
      end
      object edUF09: TRzEdit
        Left = 48
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 20
      end
      object edUF10: TRzEdit
        Left = 72
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 21
      end
      object edUF11: TRzEdit
        Left = 96
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 22
      end
      object edUF12: TRzEdit
        Left = 120
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 23
      end
      object edUF13: TRzEdit
        Left = 144
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 24
      end
      object edUF14: TRzEdit
        Left = 168
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 25
      end
      object edUF15: TRzEdit
        Left = 192
        Top = 296
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 26
      end
      object edUF16: TRzEdit
        Left = 0
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 27
      end
      object edUF17: TRzEdit
        Left = 24
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 28
      end
      object edUF18: TRzEdit
        Left = 48
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 29
      end
      object edUF19: TRzEdit
        Left = 72
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 30
      end
      object edUF20: TRzEdit
        Left = 96
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 31
      end
      object edUF21: TRzEdit
        Left = 120
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 32
      end
      object edUF22: TRzEdit
        Left = 144
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 33
      end
      object edUF23: TRzEdit
        Left = 168
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 34
      end
      object edUF24: TRzEdit
        Left = 192
        Top = 320
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 35
      end
      object edUF25: TRzEdit
        Left = 0
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 36
      end
      object edUF26: TRzEdit
        Left = 24
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 37
      end
      object edUF27: TRzEdit
        Left = 48
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 38
      end
      object edUF28: TRzEdit
        Left = 72
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 39
      end
      object edUF29: TRzEdit
        Left = 96
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 40
      end
      object edUF30: TRzEdit
        Left = 120
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 41
      end
      object edUF31: TRzEdit
        Left = 144
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 42
      end
      object edUF32: TRzEdit
        Left = 168
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 43
      end
      object edUF33: TRzEdit
        Left = 192
        Top = 344
        Width = 25
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 44
      end
      object edICMS: TRzNumericEdit
        Left = 520
        Top = 128
        Width = 73
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 7
        DisplayFormat = ',0;(,0)'
      end
      object edIPI: TRzNumericEdit
        Left = 520
        Top = 88
        Width = 73
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 5
        DisplayFormat = ',0;(,0)'
      end
      object edCFOP: TRzEdit
        Left = 440
        Top = 184
        Width = 41
        Height = 21
        Alignment = taRightJustify
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 4
        TabOrder = 8
      end
      object edCFOPSubst: TRzEdit
        Left = 496
        Top = 184
        Width = 41
        Height = 21
        Alignment = taRightJustify
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 4
        TabOrder = 9
      end
      object rgTipo: TRzRadioGroup
        Left = 8
        Top = 72
        Width = 417
        Height = 137
        Caption = 'Tipo de Nota Fiscal'
        Columns = 2
        ItemHotTrack = True
        Items.Strings = (
          '00 - Vendas'
          '01 - Demonstra'#231#227'o'
          '02 - Remessa'
          '03 - Retorno'
          '04 - Importa'#231#227'o'
          '05 - Exporta'#231#227'o'
          '06 - Simples Remessa'
          '07 - Devolu'#231#227'o'
          '08 - Nota Complementar'
          '09 - Simples Remessa p/ terceiros'
          '99 - Outros')
        ParentColor = True
        TabOrder = 3
      end
      object rgEntSai: TRzRadioGroup
        Left = 32
        Top = 216
        Width = 193
        Height = 49
        Caption = 'Entrada/Saida'
        Columns = 2
        ItemHotTrack = True
        Items.Strings = (
          'Entrada'
          'Saida')
        ParentColor = True
        TabOrder = 10
      end
      object cbICMS: TRzCheckBox
        Left = 448
        Top = 128
        Width = 65
        Height = 17
        Caption = 'Isen'#231#227'o'
        HotTrack = True
        State = cbUnchecked
        TabOrder = 6
      end
      object cbIPI: TRzCheckBox
        Left = 448
        Top = 88
        Width = 65
        Height = 17
        Caption = 'Isen'#231#227'o'
        HotTrack = True
        State = cbUnchecked
        TabOrder = 4
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Estoques'
      object rgEstoqueEntrada: TRzRadioGroup
        Left = 8
        Top = 48
        Width = 273
        Height = 241
        Caption = 'Estoque de entrada'
        ItemHotTrack = True
        ItemIndex = 0
        Items.Strings = (
          'N'#227'o registra entrada no estoque'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10')
        TabOrder = 0
      end
      object rgEstoqueSaida: TRzRadioGroup
        Left = 312
        Top = 48
        Width = 273
        Height = 241
        Caption = 'Estoque de sa'#237'da'
        ItemHotTrack = True
        ItemIndex = 0
        Items.Strings = (
          'N'#227'o registra sa'#237'da no estoque'
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10')
        TabOrder = 1
      end
    end
  end
end
