inherited FCadastrarFormNaturezas: TFCadastrarFormNaturezas
  Top = 104
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Naturezas'
  Caption = 'Cadastrar Naturezas'
  ClientHeight = 402
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 24
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 145
    Top = 24
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label3: TLabel [2]
    Left = 425
    Top = 200
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'C.F.O.P.'
  end
  object Label4: TLabel [3]
    Left = 429
    Top = 144
    Width = 84
    Height = 13
    Caption = 'Al'#237'quota de ICMS'
  end
  object Label5: TLabel [4]
    Left = 429
    Top = 88
    Width = 80
    Height = 13
    Caption = 'Al'#237'quota de I.P.I.'
  end
  object Label6: TLabel [5]
    Left = 237
    Top = 216
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  object Label7: TLabel [6]
    Left = 29
    Top = 272
    Width = 38
    Height = 13
    Caption = 'Estados'
  end
  object Label8: TLabel [7]
    Left = 74
    Top = 56
    Width = 119
    Height = 13
    Alignment = taRightJustify
    Caption = 'Descri'#231#227'o na Nota Fiscal'
  end
  inherited Panel1: TPanel
    Top = 372
    TabOrder = 44
  end
  object edCodigo: TEdit
    Left = 64
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object edDescricao1: TEdit
    Left = 200
    Top = 24
    Width = 313
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edDescricao2: TEdit
    Left = 200
    Top = 56
    Width = 313
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
  end
  object edCFOP: TEdit
    Left = 472
    Top = 200
    Width = 41
    Height = 21
    TabOrder = 8
  end
  object edICMS: TEdit
    Left = 440
    Top = 160
    Width = 73
    Height = 21
    TabOrder = 4
  end
  object edIPI: TEdit
    Left = 440
    Top = 104
    Width = 73
    Height = 21
    TabOrder = 5
  end
  object cbICMS: TCheckBox
    Left = 368
    Top = 160
    Width = 65
    Height = 17
    Caption = 'Isen'#231#227'o'
    TabOrder = 6
  end
  object cbIPI: TCheckBox
    Left = 368
    Top = 104
    Width = 65
    Height = 17
    Caption = 'Isen'#231#227'o'
    TabOrder = 7
  end
  object rgEntSai: TRadioGroup
    Left = 32
    Top = 208
    Width = 193
    Height = 49
    Caption = 'Entrada/Saida'
    Columns = 2
    Items.Strings = (
      'Entrada'
      'Saida')
    TabOrder = 9
  end
  object edUF01: TEdit
    Left = 72
    Top = 272
    Width = 25
    Height = 21
    TabOrder = 10
  end
  object edUF02: TEdit
    Left = 96
    Top = 272
    Width = 25
    Height = 21
    TabOrder = 11
  end
  object edUF03: TEdit
    Left = 120
    Top = 272
    Width = 25
    Height = 21
    TabOrder = 12
  end
  object edUF04: TEdit
    Left = 144
    Top = 272
    Width = 25
    Height = 21
    TabOrder = 13
  end
  object edUF05: TEdit
    Left = 168
    Top = 272
    Width = 25
    Height = 21
    TabOrder = 14
  end
  object edUF06: TEdit
    Left = 192
    Top = 272
    Width = 25
    Height = 21
    TabOrder = 15
  end
  object edUF07: TEdit
    Left = 0
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 16
  end
  object edUF08: TEdit
    Left = 24
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 17
  end
  object edUF09: TEdit
    Left = 48
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 18
  end
  object edUF10: TEdit
    Left = 72
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 19
  end
  object edUF11: TEdit
    Left = 96
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 20
  end
  object edUF12: TEdit
    Left = 120
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 21
  end
  object edUF13: TEdit
    Left = 144
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 22
  end
  object edUF14: TEdit
    Left = 168
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 23
  end
  object edUF15: TEdit
    Left = 192
    Top = 296
    Width = 25
    Height = 21
    TabOrder = 24
  end
  object edUF16: TEdit
    Left = 0
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 25
  end
  object edUF17: TEdit
    Left = 24
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 26
  end
  object edUF18: TEdit
    Left = 48
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 27
  end
  object edUF19: TEdit
    Left = 72
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 28
  end
  object edUF20: TEdit
    Left = 96
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 29
  end
  object edUF21: TEdit
    Left = 120
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 30
  end
  object edUF22: TEdit
    Left = 144
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 31
  end
  object edUF23: TEdit
    Left = 168
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 32
  end
  object edUF24: TEdit
    Left = 192
    Top = 320
    Width = 25
    Height = 21
    TabOrder = 33
  end
  object edUF25: TEdit
    Left = 0
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 34
  end
  object edUF26: TEdit
    Left = 24
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 35
  end
  object edUF27: TEdit
    Left = 48
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 36
  end
  object edUF28: TEdit
    Left = 72
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 37
  end
  object edUF29: TEdit
    Left = 96
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 38
  end
  object edUF30: TEdit
    Left = 120
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 39
  end
  object edUF31: TEdit
    Left = 144
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 40
  end
  object edUF32: TEdit
    Left = 168
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 41
  end
  object edUF33: TEdit
    Left = 192
    Top = 344
    Width = 25
    Height = 21
    TabOrder = 42
  end
  object mmObservacao: TMemo
    Left = 240
    Top = 232
    Width = 273
    Height = 129
    TabOrder = 43
  end
  object rgTipo: TRadioGroup
    Left = 8
    Top = 96
    Width = 289
    Height = 97
    Caption = 'Tipo de Nota Fiscal'
    Columns = 2
    Items.Strings = (
      '00 - Vendas'
      '01 - Demonstra'#231#227'o'
      '02 - Remessa'
      '03 - Retorno'
      '04 - Importa'#231#227'o'
      '05 - Exporta'#231#227'o'
      '06 - Simples Remessa'
      '07 - Devolu'#231#227'o'
      '99 - Outros')
    TabOrder = 3
  end
end
