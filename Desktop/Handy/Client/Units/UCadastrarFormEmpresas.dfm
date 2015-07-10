object FCadastrarFormEmpresas: TFCadastrarFormEmpresas
  Left = 384
  Top = 156
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Empresas'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastrar Empresas'
  ClientHeight = 339
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 309
    Width = 590
    Height = 30
    Align = alBottom
    TabOrder = 0
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
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 590
    Height = 309
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 0
    TabOrder = 1
    FixedDimension = 19
    object TabSheet2: TRzTabSheet
      Caption = 'Geral'
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
      object Label8: TLabel
        Left = 418
        Top = 48
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Sit. Stribut.'
      end
      object Label13: TLabel
        Left = 380
        Top = 112
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ultima Assist'#234'ncia'
      end
      object Label18: TLabel
        Left = 13
        Top = 80
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Imagens'
      end
      object Label5: TLabel
        Left = 200
        Top = 48
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object Label16: TLabel
        Left = 371
        Top = 144
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = #218'ltima Classifica'#231#227'o'
      end
      object Label6: TLabel
        Left = 168
        Top = 112
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ultimo Pedido'
      end
      object Label20: TLabel
        Left = 20
        Top = 256
        Width = 248
        Height = 13
        Caption = 'C'#243'digo de Situa'#231#227'o da Opera'#231#227'o - Simples Nacional'
      end
      object edCodigo: TRzEdit
        Left = 60
        Top = 16
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object edRazao: TRzEdit
        Left = 240
        Top = 16
        Width = 337
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 1
      end
      object edSenha: TRzEdit
        Left = 60
        Top = 48
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 2
      end
      object edSTribut: TRzEdit
        Left = 476
        Top = 48
        Width = 101
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 4
      end
      object edUAssistencia: TRzEdit
        Left = 472
        Top = 112
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 9
      end
      object edBancoImagens: TRzEdit
        Left = 60
        Top = 80
        Width = 289
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 5
      end
      object edEstado: TRzEdit
        Left = 240
        Top = 48
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 3
      end
      object edClassificacao: TRzEdit
        Left = 472
        Top = 141
        Width = 105
        Height = 21
        TabStop = False
        Color = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        TabOrder = 10
      end
      object edUPedido: TRzEdit
        Left = 240
        Top = 112
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 8
      end
      object cbAltDtPedido: TCheckBox
        Left = 24
        Top = 112
        Width = 129
        Height = 17
        Caption = 'Altera Data do Pedido'
        TabOrder = 6
      end
      object cbAltNrPedido: TCheckBox
        Left = 24
        Top = 144
        Width = 145
        Height = 17
        Caption = 'Altera Numero do Pedido'
        TabOrder = 7
      end
      object rgCodigoRegimeTributario: TRzRadioGroup
        Left = 8
        Top = 168
        Width = 313
        Height = 81
        Caption = 'C'#243'digo de Regime Tribut'#225'rio'
        ItemHotTrack = True
        Items.Strings = (
          '1 - Simples Nacional'
          '2 - Simples Nacional - excesso de sublimite de receita bruta'
          '3 - Regime Normal. (v2.0)')
        ParentColor = True
        TabOrder = 11
        OnChanging = rgCodigoRegimeTributarioChanging
      end
      object edCodigoSituacaoOperacao: TRzNumericEdit
        Left = 276
        Top = 256
        Width = 105
        Height = 21
        Alignment = taLeftJustify
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 12
        DisplayFormat = ',0;(,0)'
      end
    end
    object TabSheet1: TRzTabSheet
      Caption = 'Financeiro'
      object Label3: TLabel
        Left = 14
        Top = 16
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ultima NFiscal'
      end
      object Label9: TLabel
        Left = 259
        Top = 16
        Width = 198
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dias para retorno da NF de demonstra'#231#227'o'
      end
      object Label14: TLabel
        Left = 44
        Top = 48
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aliq PIS'
      end
      object Label15: TLabel
        Left = 22
        Top = 80
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aliq COFINS'
      end
      object Label11: TLabel
        Left = 41
        Top = 112
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Aliq. ISS'
      end
      object Label19: TLabel
        Left = 352
        Top = 48
        Width = 105
        Height = 13
        Alignment = taRightJustify
        Caption = '% de Juros no receber'
      end
      object edUNfiscal: TRzEdit
        Left = 88
        Top = 16
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object edDiasDemonstr: TRzEdit
        Left = 464
        Top = 16
        Width = 105
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 1
      end
      object edPIS: TRzNumericEdit
        Left = 88
        Top = 48
        Width = 65
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edCOFINS: TRzNumericEdit
        Left = 88
        Top = 80
        Width = 65
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edISS: TRzNumericEdit
        Left = 87
        Top = 112
        Width = 65
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 144
        Width = 257
        Height = 57
        Caption = 'Aliquota de ICMS - ISENTOS do Estado'
        TabOrder = 5
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
        object edICMSProd1: TRzNumericEdit
          Left = 64
          Top = 24
          Width = 65
          Height = 21
          FrameHotTrack = True
          FrameVisible = True
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edICMSPec1: TRzNumericEdit
          Left = 184
          Top = 24
          Width = 65
          Height = 21
          FrameHotTrack = True
          FrameVisible = True
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
      end
      object cbAltDtNfiscal: TCheckBox
        Left = 360
        Top = 80
        Width = 161
        Height = 17
        Caption = 'Altera Data da Nota Fiscal'
        TabOrder = 6
      end
      object cbAltNrNFiscal: TCheckBox
        Left = 360
        Top = 104
        Width = 161
        Height = 17
        Caption = 'Altera Numero da Nota Fiscal'
        TabOrder = 7
      end
      object edJuros: TRzNumericEdit
        Left = 463
        Top = 48
        Width = 65
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 8
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Estoque'
      object Label12: TLabel
        Left = 230
        Top = 32
        Width = 48
        Height = 13
        Caption = 'Estoque 1'
      end
      object Label17: TLabel
        Left = 294
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label21: TLabel
        Left = 230
        Top = 56
        Width = 48
        Height = 13
        Caption = 'Estoque 2'
      end
      object Label22: TLabel
        Left = 230
        Top = 80
        Width = 48
        Height = 13
        Caption = 'Estoque 3'
      end
      object Label23: TLabel
        Left = 230
        Top = 104
        Width = 48
        Height = 13
        Caption = 'Estoque 4'
      end
      object Label24: TLabel
        Left = 230
        Top = 128
        Width = 48
        Height = 13
        Caption = 'Estoque 5'
      end
      object Label25: TLabel
        Left = 230
        Top = 152
        Width = 48
        Height = 13
        Caption = 'Estoque 6'
      end
      object Label26: TLabel
        Left = 230
        Top = 176
        Width = 48
        Height = 13
        Caption = 'Estoque 7'
      end
      object Label27: TLabel
        Left = 230
        Top = 200
        Width = 48
        Height = 13
        Caption = 'Estoque 8'
      end
      object Label28: TLabel
        Left = 230
        Top = 224
        Width = 48
        Height = 13
        Caption = 'Estoque 9'
      end
      object Label29: TLabel
        Left = 230
        Top = 248
        Width = 54
        Height = 13
        Caption = 'Estoque 10'
      end
      object rgBaixarEstoque: TRadioGroup
        Left = 8
        Top = 16
        Width = 97
        Height = 65
        Caption = 'Baixar estoque'
        Items.Strings = (
          'na nota'
          'no pedido')
        TabOrder = 0
      end
      object cbEstoqueNegativo: TCheckBox
        Left = 8
        Top = 89
        Width = 169
        Height = 17
        Caption = 'O estoque pode ficar negativo'
        TabOrder = 1
      end
      object edDescricaoEstoque1: TRzEdit
        Left = 292
        Top = 32
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 2
      end
      object edDescricaoEstoque2: TRzEdit
        Left = 292
        Top = 56
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 3
      end
      object edDescricaoEstoque3: TRzEdit
        Left = 292
        Top = 80
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 4
      end
      object edDescricaoEstoque4: TRzEdit
        Left = 292
        Top = 104
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 5
      end
      object edDescricaoEstoque5: TRzEdit
        Left = 292
        Top = 128
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 6
      end
      object edDescricaoEstoque6: TRzEdit
        Left = 292
        Top = 152
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 7
      end
      object edDescricaoEstoque7: TRzEdit
        Left = 292
        Top = 176
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 8
      end
      object edDescricaoEstoque8: TRzEdit
        Left = 292
        Top = 200
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 9
      end
      object edDescricaoEstoque9: TRzEdit
        Left = 292
        Top = 224
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 10
      end
      object edDescricaoEstoque10: TRzEdit
        Left = 292
        Top = 248
        Width = 221
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 100
        TabOrder = 11
      end
    end
  end
end
