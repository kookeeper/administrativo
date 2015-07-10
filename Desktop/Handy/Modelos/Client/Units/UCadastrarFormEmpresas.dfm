object FCadastrarFormEmpresas: TFCadastrarFormEmpresas
  Left = 195
  Top = 199
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Empresas'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastrar Empresas'
  ClientHeight = 331
  ClientWidth = 576
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
    Left = 20
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 170
    Top = 16
    Width = 63
    Height = 13
    Caption = 'Raz'#227'o Social'
  end
  object Label4: TLabel
    Left = 22
    Top = 48
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Label3: TLabel
    Left = 166
    Top = 80
    Width = 67
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ultima NFiscal'
  end
  object Label5: TLabel
    Left = 424
    Top = 80
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Estado'
  end
  object Label6: TLabel
    Left = 168
    Top = 48
    Width = 65
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ultimo Pedido'
  end
  object Label8: TLabel
    Left = 2
    Top = 80
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Sit. Stribut.'
  end
  object Label9: TLabel
    Left = 348
    Top = 48
    Width = 109
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dias p/ Ret. N.F. Dem.'
  end
  object Label13: TLabel
    Left = 148
    Top = 112
    Width = 85
    Height = 13
    Alignment = taRightJustify
    Caption = 'Ultima Assist'#234'ncia'
  end
  object Label14: TLabel
    Left = 460
    Top = 112
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aliq PIS'
  end
  object Label15: TLabel
    Left = 438
    Top = 144
    Width = 59
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aliq COFINS'
  end
  object Label16: TLabel
    Left = 11
    Top = 264
    Width = 94
    Height = 13
    Alignment = taRightJustify
    Caption = #218'ltima Classifica'#231#227'o'
  end
  object Label11: TLabel
    Left = 457
    Top = 176
    Width = 40
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aliq. ISS'
  end
  object Panel1: TPanel
    Left = 0
    Top = 301
    Width = 576
    Height = 30
    Align = alBottom
    TabOrder = 17
    object bbOk: TBitBtn
      Left = 415
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 0
      OnClick = bbOkClick
      Kind = bkOK
    end
    object bbCancelar: TBitBtn
      Left = 495
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object edCodigo: TEdit
    Left = 60
    Top = 16
    Width = 105
    Height = 21
    TabOrder = 0
  end
  object edRazao: TEdit
    Left = 240
    Top = 16
    Width = 329
    Height = 21
    TabOrder = 1
  end
  object edSenha: TEdit
    Left = 60
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 2
  end
  object edEstado: TEdit
    Left = 464
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 8
  end
  object edUNfiscal: TEdit
    Left = 240
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 5
  end
  object edUPedido: TEdit
    Left = 240
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 4
  end
  object cbAltDtPedido: TCheckBox
    Left = 16
    Top = 152
    Width = 169
    Height = 17
    Caption = 'Altera Data do Pedido'
    TabOrder = 13
  end
  object cbAltDtNfiscal: TCheckBox
    Left = 16
    Top = 176
    Width = 169
    Height = 17
    Caption = 'Altera Data da Nota Fiscal'
    TabOrder = 14
  end
  object cbAltNrNFiscal: TCheckBox
    Left = 16
    Top = 200
    Width = 169
    Height = 17
    Caption = 'Altera Numero da Nota Fiscal'
    TabOrder = 15
  end
  object cbAltNrPedido: TCheckBox
    Left = 16
    Top = 224
    Width = 169
    Height = 17
    Caption = 'Altera Numero do Pedido'
    TabOrder = 16
  end
  object edSTribut: TEdit
    Left = 60
    Top = 80
    Width = 105
    Height = 21
    TabOrder = 3
  end
  object edDiasDemonstr: TEdit
    Left = 464
    Top = 48
    Width = 105
    Height = 21
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 312
    Top = 208
    Width = 257
    Height = 57
    Caption = 'Aliquota de ICMS - ISENTOS do Estado'
    TabOrder = 12
    object Label7: TLabel
      Left = 15
      Top = 24
      Width = 42
      Height = 13
      Alignment = taRightJustify
      Caption = 'Produtos'
    end
    object Label10: TLabel
      Left = 147
      Top = 24
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pe'#231'as'
    end
    object edICMSProd1: TEdit
      Left = 64
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 0
    end
    object edICMSPec1: TEdit
      Left = 184
      Top = 24
      Width = 65
      Height = 21
      TabOrder = 1
    end
  end
  object edUAssistencia: TEdit
    Left = 240
    Top = 112
    Width = 105
    Height = 21
    TabOrder = 6
  end
  object edPIS: TEdit
    Left = 504
    Top = 112
    Width = 65
    Height = 21
    TabOrder = 9
  end
  object edCOFINS: TEdit
    Left = 504
    Top = 144
    Width = 65
    Height = 21
    TabOrder = 10
  end
  object edClassificacao: TEdit
    Left = 112
    Top = 264
    Width = 105
    Height = 21
    ReadOnly = True
    TabOrder = 18
  end
  object edISS: TEdit
    Left = 503
    Top = 176
    Width = 65
    Height = 21
    TabOrder = 11
  end
end
