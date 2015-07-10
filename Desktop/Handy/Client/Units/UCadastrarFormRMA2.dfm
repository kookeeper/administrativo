inherited FCadastrarFormRMA2: TFCadastrarFormRMA2
  Left = 321
  Top = 169
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Assistencias'
  Caption = 'Cadastrar R.M.A. - Modelo 2'
  ClientHeight = 352
  ClientWidth = 369
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 322
    Width = 369
    TabOrder = 1
    DesignSize = (
      369
      30)
    inherited bbOk: TBitBtn
      Left = 209
    end
    inherited bbCancelar: TBitBtn
      Left = 289
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 369
    Height = 322
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet4: TTabSheet
      Caption = 'Abertura'
      ImageIndex = 3
      object Label3: TLabel
        Left = 8
        Top = 8
        Width = 109
        Height = 13
        Caption = 'Data de entrada da NF'
      end
      object edDataEntradaNf: TRzDateTimeEdit
        Left = 8
        Top = 24
        Width = 113
        Height = 21
        EditType = etDate
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        TabOrder = 0
      end
      object RzPageControl1: TRzPageControl
        Left = 8
        Top = 56
        Width = 337
        Height = 225
        ActivePage = TabSheet1
        TabIndex = 0
        TabOrder = 1
        FixedDimension = 19
        object TabSheet1: TRzTabSheet
          Caption = 'Dados do cliente'
          object Label6: TLabel
            Left = 8
            Top = 8
            Width = 28
            Height = 13
            Caption = 'Nome'
          end
          object Label7: TLabel
            Left = 8
            Top = 56
            Width = 46
            Height = 13
            Caption = 'Endere'#231'o'
          end
          object Label8: TLabel
            Left = 168
            Top = 104
            Width = 42
            Height = 13
            Caption = 'Telefone'
          end
          object Label19: TLabel
            Left = 8
            Top = 104
            Width = 28
            Height = 13
            Caption = 'E-mail'
          end
          object Label9: TLabel
            Left = 8
            Top = 152
            Width = 37
            Height = 13
            Caption = 'Contato'
          end
          object edNome: TRzEdit
            Left = 8
            Top = 24
            Width = 313
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            MaxLength = 50
            TabOrder = 0
          end
          object edEndereco: TRzEdit
            Left = 8
            Top = 72
            Width = 313
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            MaxLength = 50
            TabOrder = 1
          end
          object edTelefoneCliente: TRzEdit
            Left = 168
            Top = 120
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            MaxLength = 30
            TabOrder = 2
          end
          object edEmailCliente: TRzEdit
            Left = 8
            Top = 120
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            MaxLength = 50
            TabOrder = 3
          end
          object edResponsavelCliente: TRzEdit
            Left = 8
            Top = 168
            Width = 313
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 4
          end
        end
        object TabSheet2: TRzTabSheet
          Caption = 'Redes'
          object Label4: TLabel
            Left = 136
            Top = 8
            Width = 118
            Height = 13
            Caption = 'N'#250'mero da NF do cliente'
          end
          object Label5: TLabel
            Left = 8
            Top = 8
            Width = 111
            Height = 13
            Caption = 'Data da emiss'#227'o da NF'
          end
          object edNumeroNFCliente: TRzNumericEdit
            Left = 136
            Top = 24
            Width = 113
            Height = 21
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 0
            DisplayFormat = ',0;(,0)'
          end
          object edDataEmissaoNF: TRzDateTimeEdit
            Left = 8
            Top = 24
            Width = 113
            Height = 21
            EditType = etDate
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 1
          end
        end
        object TabSheet3: TRzTabSheet
          Caption = 'Clientes'
          object Label17: TLabel
            Left = 8
            Top = 8
            Width = 76
            Height = 13
            Caption = 'Data da compra'
          end
          object Label1: TLabel
            Left = 8
            Top = 56
            Width = 85
            Height = 13
            Caption = 'Loja que comprou'
          end
          object Label2: TLabel
            Left = 168
            Top = 56
            Width = 73
            Height = 13
            Caption = 'Forma de envio'
          end
          object Label10: TLabel
            Left = 136
            Top = 8
            Width = 67
            Height = 13
            Caption = 'NF de compra'
          end
          object edDataCompra: TRzDateTimeEdit
            Left = 8
            Top = 24
            Width = 113
            Height = 21
            EditType = etDate
            FlatButtons = True
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 0
          end
          object edLojaCliente: TRzEdit
            Left = 8
            Top = 72
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            MaxLength = 50
            TabOrder = 1
          end
          object edFormaEnvio: TRzEdit
            Left = 168
            Top = 72
            Width = 153
            Height = 21
            CharCase = ecUpperCase
            FrameHotTrack = True
            FrameVisible = True
            MaxLength = 50
            TabOrder = 2
          end
          object edNFCompra: TRzNumericEdit
            Left = 136
            Top = 24
            Width = 113
            Height = 21
            FrameHotTrack = True
            FrameVisible = True
            TabOrder = 3
            DisplayFormat = ',0;(,0)'
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Itens'
      ImageIndex = 4
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 361
        Height = 25
        AutoSize = True
        ButtonHeight = 21
        Caption = 'ToolBar1'
        TabOrder = 0
        object sbNovoItem: TSpeedButton
          Left = 0
          Top = 2
          Width = 28
          Height = 21
          Hint = 'Novo (Ctrl + N)'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000130B0000130B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
            333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
            0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
            07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
            0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
            33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
            B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
            3BB33773333773333773B333333B3333333B7333333733333337}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbNovoItemClick
        end
        object sbEditarItem: TSpeedButton
          Left = 28
          Top = 2
          Width = 28
          Height = 21
          Hint = 'Editar (Ctrl + E)'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
            000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
            00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
            F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
            0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
            FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
            FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
            0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
            00333377737FFFFF773333303300000003333337337777777333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbEditarItemClick
        end
        object sbApagarItem: TSpeedButton
          Left = 56
          Top = 2
          Width = 28
          Height = 21
          Hint = 'Excluir (Ctrl + X)'
          Flat = True
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
            555557777F777555F55500000000555055557777777755F75555005500055055
            555577F5777F57555555005550055555555577FF577F5FF55555500550050055
            5555577FF77577FF555555005050110555555577F757777FF555555505099910
            555555FF75777777FF555005550999910555577F5F77777775F5500505509990
            3055577F75F77777575F55005055090B030555775755777575755555555550B0
            B03055555F555757575755550555550B0B335555755555757555555555555550
            BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
            50BB555555555555575F555555555555550B5555555555555575}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbApagarItemClick
        end
      end
      object RzDBGrid1: TRzDBGrid
        Left = 0
        Top = 25
        Width = 361
        Height = 269
        Align = alClient
        DataSource = dsItens
        DefaultDrawing = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = sbEditarItemClick
        QuickCompare.FieldValue = 1
        AltRowShading = False
        Columns = <
          item
            Expanded = False
            FieldName = 'descricao_produto'
            Title.Caption = 'Produto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nr_serie_produto'
            Title.Caption = 'Nr Serie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_produto'
            Title.Caption = 'Qtde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'acessorio_produto'
            Title.Caption = 'Acess'#243'rio'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_unit_produto'
            Title.Caption = 'Vlr Unit'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'defeito_produto'
            Title.Caption = 'Defeito'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'data_retorno_produto'
            Title.Caption = 'Data retorno'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nf_devolucao_produto'
            Title.Caption = 'NF devolu'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'finalizacao_produto'
            Title.Caption = 'Finaliza'#231#227'o'
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    Left = 192
    Top = 40
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 180
    Top = 232
    object cdsItensrma_item_sq: TIntegerField
      FieldName = 'rma_item_sq'
    end
    object cdsItensrma_sq: TIntegerField
      FieldName = 'rma_sq'
    end
    object cdsItensproduto_sq: TIntegerField
      FieldName = 'produto_sq'
    end
    object cdsItensnr_serie_produto: TStringField
      FieldName = 'nr_serie_produto'
      Size = 100
    end
    object cdsItensqtde_produto: TIntegerField
      FieldName = 'qtde_produto'
    end
    object cdsItensacessorio_produto: TStringField
      FieldName = 'acessorio_produto'
      Size = 100
    end
    object cdsItensvlr_unit_produto: TBCDField
      FieldName = 'vlr_unit_produto'
      Precision = 9
      Size = 2
    end
    object cdsItensdefeito_produto: TStringField
      FieldName = 'defeito_produto'
      Size = 100
    end
    object cdsItensdata_retorno_produto: TDateTimeField
      FieldName = 'data_retorno_produto'
    end
    object cdsItensnf_devolucao_produto: TIntegerField
      FieldName = 'nf_devolucao_produto'
    end
    object cdsItensfinalizacao_produto: TStringField
      FieldName = 'finalizacao_produto'
      Size = 100
    end
    object cdsItensdescricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 50
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 260
    Top = 232
  end
end
