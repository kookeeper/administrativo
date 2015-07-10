inherited FCadastrarFormPedidos: TFCadastrarFormPedidos
  Left = 408
  Top = 114
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Pedidos'
  Caption = 'Cadastrar Pedidos'
  ClientHeight = 579
  ClientWidth = 598
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 83
    Top = 16
    Width = 47
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nr Pedido'
  end
  object Label4: TLabel [1]
    Left = 431
    Top = 16
    Width = 83
    Height = 13
    Caption = 'Cota'#231#227'o do Dolar'
  end
  object lblCliente: TLabel [2]
    Left = 98
    Top = 48
    Width = 32
    Height = 13
    Cursor = crHandPoint
    Caption = 'Cliente'
    FocusControl = dblcCliente
    OnClick = lblClienteClick
  end
  object Label7: TLabel [3]
    Left = 74
    Top = 80
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cond Pagto'
    FocusControl = dblcCondPagto
  end
  object Label9: TLabel [4]
    Left = 22
    Top = 208
    Width = 108
    Height = 13
    Caption = 'Natureza da Opera'#231#227'o'
    FocusControl = dblcNatureza
  end
  object Label3: TLabel [5]
    Left = 90
    Top = 240
    Width = 40
    Height = 13
    Caption = 'C.F.O.P.'
  end
  object Label6: TLabel [6]
    Left = 197
    Top = 240
    Width = 69
    Height = 13
    Caption = 'Al'#237'quota ICMS'
  end
  object Label8: TLabel [7]
    Left = 338
    Top = 240
    Width = 56
    Height = 13
    Caption = 'Al'#237'quota IPI'
  end
  object Label2: TLabel [8]
    Left = 256
    Top = 16
    Width = 47
    Height = 13
    Caption = 'Dt Pedido'
  end
  object Label10: TLabel [9]
    Left = 58
    Top = 272
    Width = 72
    Height = 13
    Caption = 'Transportadora'
    FocusControl = dblnTransportadora
  end
  object Label12: TLabel [10]
    Left = 20
    Top = 176
    Width = 110
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dias em Demonstra'#231#227'o'
  end
  object Label17: TLabel [11]
    Left = 84
    Top = 304
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vendedor'
    FocusControl = dblnVendedor
  end
  object Label24: TLabel [12]
    Left = 429
    Top = 80
    Width = 71
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr Cond Pagto'
    FocusControl = dblcCondPagto
  end
  object Label26: TLabel [13]
    Left = 414
    Top = 112
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr Cond Pagto (2)'
    FocusControl = dblcCondPagto2
  end
  object Label28: TLabel [14]
    Left = 414
    Top = 144
    Width = 86
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vlr Cond Pagto (3)'
    FocusControl = dblcCondPagto3
  end
  inherited Panel1: TPanel
    Top = 549
    Width = 598
    TabOrder = 16
    DesignSize = (
      598
      30)
    inherited bbOk: TBitBtn
      Left = 440
    end
    inherited bbCancelar: TBitBtn
      Left = 519
    end
    object btnBaixar: TBitBtn
      Left = 8
      Top = 2
      Width = 106
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Baixar estoque'
      ModalResult = 8
      TabOrder = 2
      OnClick = btnBaixarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFFFFFFFFFF33330000000000
        03333377777777777F33333003333330033333377FF333377F33333300333333
        0333333377FF33337F3333333003333303333333377FF3337333333333003333
        333333333377FF3333333333333003333333333333377FF33333333333330033
        3333333333337733333333333330033333333333333773333333333333003333
        33333333337733333F3333333003333303333333377333337F33333300333333
        03333333773333337F33333003333330033333377FFFFFF77F33330000000000
        0333337777777777733333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object bbCancelarPedido: TBitBtn
      Left = 240
      Top = 2
      Width = 118
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancelar pedido'
      TabOrder = 3
      OnClick = bbCancelarPedidoClick
      Kind = bkNo
    end
    object bbFinalizaPedido: TBitBtn
      Left = 240
      Top = 2
      Width = 118
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Finalizar pedido'
      TabOrder = 4
      OnClick = bbFinalizaPedidoClick
      Kind = bkNo
    end
  end
  object dblcCliente: TDBLookupComboBox
    Left = 136
    Top = 48
    Width = 129
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'CODIGO_CLIENTE'
    ListSource = dsListaClientes
    TabOrder = 3
    OnClick = dblcClienteClick
  end
  object dblnCliente: TDBLookupComboBox
    Left = 272
    Top = 48
    Width = 314
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'NOME_CLIENTE'
    ListSource = dsListaClientes
    TabOrder = 4
    OnClick = dblcClienteClick
  end
  object dblcCondPagto: TDBLookupComboBox
    Left = 136
    Top = 80
    Width = 265
    Height = 21
    KeyField = 'COND_PAGTO_SQ'
    ListField = 'CODIGO_COND_PAGTO;DESCRICAO_COND_PAGTO'
    ListFieldIndex = 1
    ListSource = dsListaCondPagto
    TabOrder = 5
    OnClick = dblcClienteClick
  end
  object dblcNatureza: TDBLookupComboBox
    Left = 136
    Top = 208
    Width = 129
    Height = 21
    KeyField = 'NATUREZA_SQ'
    ListField = 'CODIGO_NATUREZA'
    ListSource = dsListaNat
    TabOrder = 7
    OnClick = dblcClienteClick
    OnExit = dblcNaturezaExit
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 335
    Width = 598
    Height = 214
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 15
    object TabSheet1: TTabSheet
      Caption = #205'tens'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 590
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
        Width = 590
        Height = 161
        Align = alClient
        DataSource = dsItens
        DefaultDrawing = True
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
            FieldName = 'CODIGO_PRODUTO'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_PRODUTO'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE_PEDIDO_ITEM'
            Title.Caption = 'Qtde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECO_UNIT'
            Title.Caption = 'Pre'#231'o Unit.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_SERIE_ITEM'
            Title.Caption = 'Serie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_DESC'
            Title.Caption = 'Vlr Desconto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PCT_DESC'
            Title.Caption = '% Desconto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ICMS_ITEM'
            Title.Caption = 'Aliq ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_IPI_ITEM'
            Title.Caption = 'Aliq IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS_ITEM'
            Title.Caption = 'Vlr ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_IPI_ITEM'
            Title.Caption = 'Vlr IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL_ITEM'
            Title.Caption = 'Vlr Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO_BRUTO'
            Title.Caption = 'Peso Bruto'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESO_LIQUIDO'
            Title.Caption = 'Peso L'#237'quido'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_JUROS'
            Title.Caption = 'Vlr Juros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PCT_JUROS'
            Title.Caption = '% Juros'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_NBM'
            Title.Caption = 'N.C.M.'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Observa'#231#245'es'
      ImageIndex = 1
      object mmObservacaoPed: TMemo
        Left = 64
        Top = 0
        Width = 526
        Height = 80
        TabOrder = 0
      end
      object mmObservacaoNf: TMemo
        Left = 64
        Top = 80
        Width = 526
        Height = 79
        TabOrder = 1
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 65
        Height = 159
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object Label18: TLabel
          Left = 8
          Top = 82
          Width = 53
          Height = 13
          Caption = 'Nota Fiscal'
        end
        object Label19: TLabel
          Left = 28
          Top = 2
          Width = 33
          Height = 13
          Caption = 'Pedido'
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Totais'
      ImageIndex = 2
      object Label15: TLabel
        Left = 200
        Top = 56
        Width = 53
        Height = 13
        Caption = 'Base ICMS'
      end
      object Label34: TLabel
        Left = 200
        Top = 104
        Width = 53
        Height = 13
        Caption = 'Valor ICMS'
      end
      object Label37: TLabel
        Left = 488
        Top = 56
        Width = 89
        Height = 13
        Caption = 'Valor dos Produtos'
      end
      object Label38: TLabel
        Left = 104
        Top = 56
        Width = 57
        Height = 13
        Caption = '% Desconto'
      end
      object Label39: TLabel
        Left = 104
        Top = 104
        Width = 61
        Height = 13
        Caption = 'Vlr Desconto'
      end
      object Label41: TLabel
        Left = 392
        Top = 104
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor IPI'
      end
      object Label16: TLabel
        Left = 488
        Top = 104
        Width = 75
        Height = 13
        Caption = 'Total do Pedido'
      end
      object Label22: TLabel
        Left = 8
        Top = 8
        Width = 52
        Height = 13
        Caption = 'Peso Bruto'
      end
      object Label23: TLabel
        Left = 157
        Top = 8
        Width = 63
        Height = 13
        Caption = 'Peso L'#237'quido'
      end
      object Label13: TLabel
        Left = 16
        Top = 56
        Width = 36
        Height = 13
        Caption = '% Juros'
      end
      object Label14: TLabel
        Left = 16
        Top = 104
        Width = 43
        Height = 13
        Caption = 'Vlr. Juros'
      end
      object Label5: TLabel
        Left = 392
        Top = 56
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Seguro'
      end
      object Label11: TLabel
        Left = 354
        Top = 10
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Frete'
      end
      object Label20: TLabel
        Left = 288
        Top = 56
        Width = 70
        Height = 13
        Caption = 'Base ICMS-ST'
      end
      object Label21: TLabel
        Left = 288
        Top = 104
        Width = 70
        Height = 13
        Caption = 'Valor ICMS-ST'
      end
      object edPctDesc: TRzNumericEdit
        Left = 104
        Top = 72
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 5
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrDesc: TRzNumericEdit
        Left = 104
        Top = 120
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 6
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edBaseIcms: TRzNumericEdit
        Left = 200
        Top = 72
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 7
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrIcms: TRzNumericEdit
        Left = 200
        Top = 120
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 8
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrIpi: TRzNumericEdit
        Left = 392
        Top = 120
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 12
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrProd: TRzNumericEdit
        Left = 488
        Top = 72
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 13
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrTotal: TRzNumericEdit
        Left = 488
        Top = 120
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 14
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edPesoBruto: TRzNumericEdit
        Left = 64
        Top = 8
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edPesoLiquido: TRzNumericEdit
        Left = 224
        Top = 8
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edPctJuros: TRzNumericEdit
        Left = 16
        Top = 72
        Width = 57
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrJuros: TRzNumericEdit
        Left = 16
        Top = 120
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edSeguro: TRzNumericEdit
        Left = 392
        Top = 72
        Width = 81
        Height = 21
        TabOrder = 11
        OnExit = dblcClienteClick
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edFrete: TRzNumericEdit
        Left = 392
        Top = 10
        Width = 81
        Height = 21
        TabOrder = 2
        OnExit = dblcClienteClick
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edBaseIcmsSubst: TRzNumericEdit
        Left = 288
        Top = 72
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 9
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
      object edVlrIcmsSubst: TRzNumericEdit
        Left = 288
        Top = 120
        Width = 73
        Height = 21
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 10
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
    end
  end
  object dblnTransportadora: TDBLookupComboBox
    Left = 136
    Top = 272
    Width = 322
    Height = 21
    KeyField = 'TRANSPORTADORA_SQ'
    ListField = 'NOME_TRANSPORTADORA'
    ListSource = dsListaTransportadoras
    TabOrder = 12
  end
  object dbldNatureza: TDBLookupComboBox
    Left = 272
    Top = 208
    Width = 314
    Height = 21
    KeyField = 'NATUREZA_SQ'
    ListField = 'DESCRICAO_NATUREZA'
    ListSource = dsListaNat
    TabOrder = 8
    OnClick = dblcClienteClick
    OnExit = dblcNaturezaExit
  end
  object DBEdit1: TDBEdit
    Left = 136
    Top = 240
    Width = 49
    Height = 21
    DataField = 'CFO'
    DataSource = dsListaNat
    TabOrder = 9
  end
  object DBEdit2: TDBEdit
    Left = 272
    Top = 240
    Width = 49
    Height = 21
    DataField = 'ALIQ_ICMS'
    DataSource = dsListaNat
    TabOrder = 10
  end
  object DBEdit3: TDBEdit
    Left = 400
    Top = 240
    Width = 49
    Height = 21
    DataField = 'ALIQ_IPI'
    DataSource = dsListaNat
    TabOrder = 11
  end
  object rgFrete: TRadioGroup
    Left = 464
    Top = 256
    Width = 121
    Height = 61
    Caption = 'Frete por conta do'
    ItemIndex = 1
    Items.Strings = (
      'Emitente'
      'Destinat'#225'rio')
    TabOrder = 13
    TabStop = True
  end
  object dblnVendedor: TDBLookupComboBox
    Left = 136
    Top = 304
    Width = 322
    Height = 21
    KeyField = 'VENDEDOR_SQ'
    ListField = 'NOME_VENDEDOR'
    ListSource = dsListaVendedores
    TabOrder = 14
  end
  object btnDuplica: TBitBtn
    Left = 8
    Top = 16
    Width = 65
    Height = 25
    Caption = 'Duplica'
    TabOrder = 17
    OnClick = btnDuplicaClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
      000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
      FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
      00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
      FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
      0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
      05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
      55557F7777777555555500000005555555557777777555555555}
    NumGlyphs = 2
  end
  object edDtPedido: TRzEdit
    Left = 312
    Top = 16
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object edDolar: TRzNumericEdit
    Left = 520
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 2
    OnExit = dblcClienteClick
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edDemonstracao: TRzNumericEdit
    Left = 136
    Top = 176
    Width = 73
    Height = 21
    TabOrder = 6
    DisplayFormat = ',0;(,0)'
  end
  object edNrPedido: TRzEdit
    Left = 136
    Top = 16
    Width = 113
    Height = 21
    Alignment = taRightJustify
    TabOrder = 0
  end
  object edVlrCondPagto: TRzNumericEdit
    Left = 512
    Top = 80
    Width = 73
    Height = 21
    TabOrder = 18
    IntegersOnly = False
    DisplayFormat = ',0;(,0)'
  end
  object dblcCondPagto2: TDBLookupComboBox
    Left = 136
    Top = 112
    Width = 265
    Height = 21
    KeyField = 'COND_PAGTO_SQ'
    ListField = 'CODIGO_COND_PAGTO;DESCRICAO_COND_PAGTO'
    ListFieldIndex = 1
    ListSource = dsListaCondPagto
    TabOrder = 19
    OnClick = dblcClienteClick
  end
  object edVlrCondPagto2: TRzNumericEdit
    Left = 512
    Top = 112
    Width = 73
    Height = 21
    TabOrder = 20
    IntegersOnly = False
    DisplayFormat = ',0;(,0)'
  end
  object dblcCondPagto3: TDBLookupComboBox
    Left = 136
    Top = 144
    Width = 265
    Height = 21
    KeyField = 'COND_PAGTO_SQ'
    ListField = 'CODIGO_COND_PAGTO;DESCRICAO_COND_PAGTO'
    ListFieldIndex = 1
    ListSource = dsListaCondPagto
    TabOrder = 21
    OnClick = dblcClienteClick
  end
  object edVlrCondPagto3: TRzNumericEdit
    Left = 512
    Top = 144
    Width = 73
    Height = 21
    TabOrder = 22
    IntegersOnly = False
    DisplayFormat = ',0;(,0)'
  end
  object chkCondPagto2: TCheckBox
    Left = 32
    Top = 112
    Width = 97
    Height = 17
    Caption = 'Cond Pagto (2)'
    TabOrder = 23
    OnClick = chkCondPagto2Click
  end
  object chkCondPagto3: TCheckBox
    Left = 32
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Cond Pagto (3)'
    TabOrder = 24
    OnClick = chkCondPagto3Click
  end
  object dsListaClientes: TDataSource
    Left = 648
    Top = 160
  end
  object dsListaCondPagto: TDataSource
    Left = 720
    Top = 160
  end
  object dsListaNat: TDataSource
    Left = 792
    Top = 160
  end
  object dsListaTransportadoras: TDataSource
    Left = 864
    Top = 160
  end
  object dsListaVendedores: TDataSource
    Left = 936
    Top = 160
  end
  object cdsBuscaPedido: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLista'
    RemoteServer = DM.SCServer
    Left = 716
    Top = 51
  end
  object cdsBuscaPedidoItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLista'
    RemoteServer = DM.SCServer
    Left = 716
    Top = 99
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 644
    Top = 51
    object cdsItensPEDIDO_ITEM_SQ: TIntegerField
      FieldName = 'PEDIDO_ITEM_SQ'
    end
    object cdsItensPEDIDO_SQ: TIntegerField
      FieldName = 'PEDIDO_SQ'
    end
    object cdsItensPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object cdsItensQTDE_PEDIDO_ITEM: TIntegerField
      FieldName = 'QTDE_PEDIDO_ITEM'
    end
    object cdsItensNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensPRECO_UNIT: TBCDField
      FieldName = 'PRECO_UNIT'
      DisplayFormat = '$ #,###,##0.00'
      Precision = 9
      Size = 2
    end
    object cdsItensVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object cdsItensPCT_DESC: TBCDField
      FieldName = 'PCT_DESC'
      Precision = 9
      Size = 2
    end
    object cdsItensALIQ_ICMS_ITEM: TBCDField
      FieldName = 'ALIQ_ICMS_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsItensALIQ_IPI_ITEM: TBCDField
      FieldName = 'ALIQ_IPI_ITEM'
      Precision = 4
      Size = 2
    end
    object cdsItensVLR_ICMS_ITEM: TBCDField
      FieldName = 'VLR_ICMS_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsItensVLR_IPI_ITEM: TBCDField
      FieldName = 'VLR_IPI_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsItensVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsItensPESO_BRUTO: TBCDField
      FieldName = 'PESO_BRUTO'
      Precision = 9
      Size = 2
    end
    object cdsItensPESO_LIQUIDO: TBCDField
      FieldName = 'PESO_LIQUIDO'
      Precision = 9
      Size = 2
    end
    object cdsItensVLR_JUROS: TBCDField
      FieldName = 'VLR_JUROS'
      Precision = 9
      Size = 2
    end
    object cdsItensPCT_JUROS: TBCDField
      FieldName = 'PCT_JUROS'
      Precision = 5
      Size = 2
    end
    object cdsItensCODIGO_PRODUTO: TStringField
      FieldName = 'CODIGO_PRODUTO'
    end
    object cdsItensDESCRICAO_PRODUTO: TStringField
      FieldName = 'DESCRICAO_PRODUTO'
      Size = 50
    end
    object cdsItensCODIGO_NBM: TStringField
      FieldName = 'CODIGO_NBM'
      Size = 10
    end
    object cdsItensbase_icms_subst_item: TBCDField
      FieldName = 'base_icms_subst_item'
    end
    object cdsItensvlr_icms_subst_item: TBCDField
      FieldName = 'vlr_icms_subst_item'
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 644
    Top = 99
  end
end
