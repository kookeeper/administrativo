object FImprimirMalaDiretaParametros: TFImprimirMalaDiretaParametros
  Left = 304
  Top = 216
  Width = 255
  Height = 244
  Caption = 'Par'#226'metros'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 42
    Top = 8
    Width = 111
    Height = 13
    Alignment = taRightJustify
    Caption = 'Margem Esquerda (mm)'
  end
  object Label2: TLabel
    Left = 57
    Top = 32
    Width = 96
    Height = 13
    Alignment = taRightJustify
    Caption = 'Margem Direita (mm)'
  end
  object Label3: TLabel
    Left = 48
    Top = 56
    Width = 105
    Height = 13
    Alignment = taRightJustify
    Caption = 'Margem Superior (mm)'
  end
  object Label4: TLabel
    Left = 44
    Top = 80
    Width = 109
    Height = 13
    Alignment = taRightJustify
    Caption = 'Altura da Etiqueta (mm)'
  end
  object Label7: TLabel
    Left = 8
    Top = 104
    Width = 143
    Height = 13
    Alignment = taRightJustify
    Caption = 'Comprimento da Etiqueta (mm)'
  end
  object Label8: TLabel
    Left = 112
    Top = 128
    Width = 38
    Height = 13
    Alignment = taRightJustify
    Caption = 'Colunas'
  end
  object Label9: TLabel
    Left = 66
    Top = 152
    Width = 90
    Height = 13
    Alignment = taRightJustify
    Caption = 'Tamanho da Fonte'
  end
  object meMargemEsq: TMaskEdit
    Left = 168
    Top = 8
    Width = 60
    Height = 21
    TabOrder = 0
  end
  object meMargemDir: TMaskEdit
    Left = 168
    Top = 32
    Width = 60
    Height = 21
    TabOrder = 1
  end
  object meMargemSup: TMaskEdit
    Left = 168
    Top = 56
    Width = 60
    Height = 21
    TabOrder = 2
  end
  object meAlturaEti: TMaskEdit
    Left = 168
    Top = 80
    Width = 60
    Height = 21
    TabOrder = 3
  end
  object meCompriEti: TMaskEdit
    Left = 168
    Top = 104
    Width = 60
    Height = 21
    TabOrder = 4
  end
  object meColunas: TMaskEdit
    Left = 168
    Top = 128
    Width = 60
    Height = 21
    TabOrder = 5
  end
  object meFonte: TMaskEdit
    Left = 168
    Top = 152
    Width = 60
    Height = 21
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = 0
    Top = 181
    Width = 247
    Height = 29
    Align = alBottom
    TabOrder = 7
    object bbFechar: TBitBtn
      Left = 168
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
    object bbImprimir: TBitBtn
      Left = 88
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 0
      Kind = bkOK
    end
  end
end
