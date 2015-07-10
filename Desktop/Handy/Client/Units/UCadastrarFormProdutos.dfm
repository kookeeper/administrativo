inherited FCadastrarFormProdutos: TFCadastrarFormProdutos
  Left = 443
  Top = 160
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Produtos'
  Caption = 'Cadastrar Produtos'
  ClientHeight = 322
  ClientWidth = 591
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 292
    Width = 591
    TabOrder = 1
    DesignSize = (
      591
      30)
    inherited bbOk: TBitBtn
      Left = 426
    end
    inherited bbCancelar: TBitBtn
      Left = 506
    end
    object btnAlterarEstoque: TBitBtn
      Left = 8
      Top = 3
      Width = 101
      Height = 23
      Caption = 'Alterar estoque'
      TabOrder = 2
      Visible = False
      OnClick = btnAlterarEstoqueClick
      NumGlyphs = 2
    end
    object btnCarregarImagemInternet: TBitBtn
      Left = 8
      Top = 3
      Width = 121
      Height = 23
      Caption = 'Carregar da Internet'
      TabOrder = 3
      Visible = False
      OnClick = btnCarregarImagemInternetClick
      NumGlyphs = 2
    end
    object btnCarregarImagemDiretorio: TBitBtn
      Left = 136
      Top = 3
      Width = 121
      Height = 23
      Caption = 'Carregar do diret'#243'rio'
      TabOrder = 4
      Visible = False
      OnClick = btnCarregarImagemDiretorioClick
      NumGlyphs = 2
    end
    object btnLimpar: TBitBtn
      Left = 264
      Top = 3
      Width = 121
      Height = 23
      Caption = 'Limpar'
      TabOrder = 5
      Visible = False
      OnClick = btnLimparClick
      NumGlyphs = 2
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 0
    Width = 591
    Height = 292
    ActivePage = TabSheet2
    ActivePageDefault = TabSheet1
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    OnChange = RzPageControl1Change
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Geral'
      object Label1: TLabel
        Left = 8
        Top = 16
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel
        Left = 192
        Top = 16
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label4: TLabel
        Left = 8
        Top = 40
        Width = 33
        Height = 13
        Caption = 'N.C.M.'
        FocusControl = dblNCM
      end
      object Label5: TLabel
        Left = 8
        Top = 80
        Width = 35
        Height = 13
        Caption = 'Modelo'
      end
      object Label6: TLabel
        Left = 232
        Top = 120
        Width = 16
        Height = 13
        Caption = 'UN'
      end
      object Label7: TLabel
        Left = 232
        Top = 80
        Width = 30
        Height = 13
        Caption = 'Marca'
      end
      object Label8: TLabel
        Left = 360
        Top = 80
        Width = 67
        Height = 13
        Caption = 'Pre'#231'o Unit'#225'rio'
      end
      object Label16: TLabel
        Left = 456
        Top = 120
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object Label17: TLabel
        Left = 456
        Top = 80
        Width = 63
        Height = 13
        Caption = 'Peso L'#237'quido'
      end
      object Label20: TLabel
        Left = 360
        Top = 120
        Width = 73
        Height = 13
        Caption = 'Pre'#231'o Sugerido'
      end
      object lblIPI_NCM: TLabel
        Left = 88
        Top = 56
        Width = 76
        Height = 13
        Caption = 'I.P.I. do N.C.M.:'
        FocusControl = dblNCM
      end
      object lblSemIPI: TLabel
        Left = 240
        Top = 56
        Width = 69
        Height = 13
        Caption = 'Pre'#231'o sem IPI:'
        FocusControl = dblNCM
      end
      object Label3: TLabel
        Left = 392
        Top = 200
        Width = 134
        Height = 13
        Caption = 'M'#225'scara do n'#250'mero de s'#233'rie'
      end
      object dblNCM: TDBLookupComboBox
        Left = 8
        Top = 56
        Width = 74
        Height = 21
        KeyField = 'NBM_SQ'
        ListField = 'CODIGO_NBM'
        ListSource = dsListaNCM
        TabOrder = 2
        OnClick = dblNCMClick
      end
      object rgTipoProduto: TRadioGroup
        Left = 280
        Top = 168
        Width = 97
        Height = 89
        Caption = 'Tipo do Produto'
        ItemIndex = 0
        Items.Strings = (
          'Produto'
          'Pe'#231'a')
        TabOrder = 12
      end
      object dblModelo: TDBLookupComboBox
        Left = 8
        Top = 96
        Width = 217
        Height = 21
        KeyField = 'MODELO_SQ'
        ListField = 'DESCRICAO_MODELO'
        ListSource = dsListaModelos
        TabOrder = 3
      end
      object edCodigo: TRzEdit
        Left = 48
        Top = 16
        Width = 129
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object edDescricao: TRzEdit
        Left = 248
        Top = 16
        Width = 329
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 50
        TabOrder = 1
      end
      object edMarca: TRzEdit
        Left = 232
        Top = 96
        Width = 121
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 4
      end
      object edUnidade: TRzEdit
        Left = 232
        Top = 136
        Width = 25
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 2
        TabOrder = 8
      end
      object rgOrigemMercadoria: TRzRadioGroup
        Left = 8
        Top = 168
        Width = 257
        Height = 89
        Caption = 'Origem da mercadoria'
        ItemIndex = 0
        Items.Strings = (
          '0 - Nacional'
          '1 - Estrangeira - Importa'#231#227'o direta'
          '2 - Estrangeira - Adquirida no mercado interno')
        TabOrder = 11
        VerticalSpacing = 9
      end
      object edPreco: TRzNumericEdit
        Left = 360
        Top = 96
        Width = 81
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 5
        OnChange = edPrecoChange
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edPesoBruto: TRzNumericEdit
        Left = 456
        Top = 136
        Width = 74
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 10
        IntegersOnly = False
        Max = 999999.990000000000000000
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edPesoLiquido: TRzNumericEdit
        Left = 456
        Top = 96
        Width = 74
        Height = 21
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 6
        IntegersOnly = False
        Max = 999999.990000000000000000
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edPrecoSugerido: TRzNumericEdit
        Left = 360
        Top = 136
        Width = 81
        Height = 21
        TabStop = False
        Color = clInfoBk
        FrameHotTrack = True
        FrameVisible = True
        ReadOnly = True
        TabOrder = 9
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object checkControleNumeroSerie: TRzCheckBox
        Left = 392
        Top = 176
        Width = 145
        Height = 17
        Caption = 'Controla n'#250'mero de s'#233'rie'
        Enabled = False
        HotTrack = True
        State = cbUnchecked
        TabOrder = 13
      end
      object edMascaraNumeroSerie: TRzEdit
        Left = 392
        Top = 216
        Width = 185
        Height = 21
        CharCase = ecUpperCase
        FrameHotTrack = True
        FrameVisible = True
        MaxLength = 50
        TabOrder = 14
      end
      object checkProdutoAtivo: TRzCheckBox
        Left = 8
        Top = 136
        Width = 89
        Height = 17
        Hint = 
          'Inative um produto para que ele n'#227'o apare'#231'a no cadastro de notas' +
          ' fiscais e pedidos.'
        Caption = 'Produto Ativo'
        Checked = True
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Espec'#237'fico'
      object Label10: TLabel
        Left = 8
        Top = 8
        Width = 98
        Height = 13
        Caption = 'Descri'#231#227'o detalhada'
      end
      object Label18: TLabel
        Left = 344
        Top = 24
        Width = 58
        Height = 13
        Caption = 'C'#243'digo UPC'
      end
      object Label19: TLabel
        Left = 344
        Top = 64
        Width = 60
        Height = 13
        Caption = 'C'#243'digo DUN'
      end
      object Label12: TLabel
        Left = 248
        Top = 184
        Width = 78
        Height = 13
        Caption = 'Produto Retorno'
      end
      object RzLabel4: TRzLabel
        Left = 344
        Top = 112
        Width = 85
        Height = 13
        Caption = 'Grupo do balan'#231'o'
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 120
        Width = 233
        Height = 105
        Caption = 'Dimens'#245'es'
        TabOrder = 3
        object Label21: TLabel
          Left = 48
          Top = 32
          Width = 27
          Height = 13
          Caption = 'Altura'
        end
        object Label22: TLabel
          Left = 39
          Top = 56
          Width = 36
          Height = 13
          Caption = 'Largura'
        end
        object Label23: TLabel
          Left = 12
          Top = 80
          Width = 63
          Height = 13
          Caption = 'Profundidade'
        end
        object Label24: TLabel
          Left = 109
          Top = 16
          Width = 36
          Height = 13
          Caption = 'L'#237'quida'
        end
        object Label25: TLabel
          Left = 200
          Top = 16
          Width = 25
          Height = 13
          Caption = 'Bruta'
        end
        object edAlturaLiq: TRzNumericEdit
          Left = 80
          Top = 32
          Width = 65
          Height = 21
          TabOrder = 0
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edLarguraLiq: TRzNumericEdit
          Left = 80
          Top = 56
          Width = 65
          Height = 21
          TabOrder = 1
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edProfundidadeLiq: TRzNumericEdit
          Left = 80
          Top = 80
          Width = 65
          Height = 21
          TabOrder = 2
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edAlturaBru: TRzNumericEdit
          Left = 160
          Top = 32
          Width = 65
          Height = 21
          TabOrder = 3
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edLarguraBru: TRzNumericEdit
          Left = 160
          Top = 56
          Width = 65
          Height = 21
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edProfundidadeBru: TRzNumericEdit
          Left = 160
          Top = 80
          Width = 65
          Height = 21
          TabOrder = 5
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
      end
      object mmDescricao: TRzMemo
        Left = 8
        Top = 24
        Width = 321
        Height = 89
        MaxLength = 10000
        TabOrder = 0
      end
      object edCodigoUpc: TRzEdit
        Left = 344
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edCodigoDun: TRzEdit
        Left = 344
        Top = 80
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object dblProdutoRetorno: TDBLookupComboBox
        Left = 248
        Top = 200
        Width = 329
        Height = 21
        KeyField = 'produto_sq'
        ListField = 'descricao_produto'
        ListSource = dsListaProdutoRetorno
        TabOrder = 4
      end
      object edGrupoBalanco: TRzSpinner
        Left = 344
        Top = 128
        Width = 81
        Min = 1
        Value = 1
        ParentColor = False
        TabOrder = 5
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Estoques'
      object listBoxNumerosSerie: TRzListBox
        Left = 297
        Top = 30
        Width = 290
        Height = 239
        Align = alClient
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        TabOrder = 0
      end
      object listBoxEstoques: TRzListBox
        Left = 0
        Top = 30
        Width = 297
        Height = 239
        Align = alLeft
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        TabOrder = 1
        OnClick = listBoxEstoquesClick
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 587
        Height = 30
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 44
          Height = 13
          Caption = 'Estoques'
        end
        object Label11: TLabel
          Left = 296
          Top = 8
          Width = 82
          Height = 13
          Caption = 'N'#250'meros de s'#233'rie'
        end
      end
    end
    object TabSheet4: TRzTabSheet
      Caption = 'Imagem'
      object DBImage1: TDBImage
        Left = 0
        Top = 0
        Width = 587
        Height = 269
        Align = alClient
        DataField = 'produto_imagem'
        DataSource = dsProdutoImagem
        TabOrder = 0
      end
    end
  end
  object dsListaNCM: TDataSource
    Left = 304
    Top = 328
  end
  object dsListaModelos: TDataSource
    Left = 384
    Top = 328
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 185
    Top = 324
  end
  object dsProdutoImagem: TDataSource
    Left = 569
    Top = 332
  end
  object dsListaProdutoRetorno: TDataSource
    Left = 392
    Top = 376
  end
end
