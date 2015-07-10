inherited FCadastrarFormNfiscais: TFCadastrarFormNfiscais
  Left = 436
  Top = 118
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Notas Fiscais'
  Caption = 'Cadastrar Notas Fiscais'
  ClientHeight = 490
  ClientWidth = 774
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 460
    Width = 774
    TabOrder = 1
    DesignSize = (
      774
      30)
    object SpeedButton1: TSpeedButton [0]
      Left = 96
      Top = 4
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FF33333333FF3330033333333
        00333377FF33333377FF300003333330000337777FFFFFF7777F000000000000
        000077777777777777770F88FFFF8FFF88F07F333F33333333370FFF9FFF8FFF
        FF707F337FF333FFFFF70FF999FF800000037F377733377777730FFF9FFF0888
        80337F3373337F3337330FFFFFFF088803337FFFFFFF7FFF7333700000000000
        3333777777777777F33333333339399939333333333337773333333333333393
        3333333333333373333333333333933393333333333333333333333333333393
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    inherited bbOk: TBitBtn
      Left = 607
    end
    inherited bbCancelar: TBitBtn
      Left = 687
    end
    object bbAtualizar: TBitBtn
      Left = 8
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 2
      OnClick = bbAtualizarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 774
    Height = 460
    ActivePage = tsCabecalho
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsCabecalho: TTabSheet
      Caption = 'Cabe'#231'alho'
      ImageIndex = 2
      object Label1: TLabel
        Left = 85
        Top = 57
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#250'mero do Pedido'
      end
      object Label7: TLabel
        Left = 95
        Top = 89
        Width = 117
        Height = 13
        Caption = 'Condi'#231#227'o de Pagamento'
        FocusControl = dblcCondPagto
      end
      object Label9: TLabel
        Left = 97
        Top = 185
        Width = 108
        Height = 13
        Caption = 'Natureza da Opera'#231#227'o'
        FocusControl = dblcNatureza
      end
      object Label3: TLabel
        Left = 175
        Top = 217
        Width = 30
        Height = 13
        Caption = 'C.F.O.'
        FocusControl = DBEdit3
      end
      object Label6: TLabel
        Left = 272
        Top = 217
        Width = 69
        Height = 13
        Caption = 'Al'#237'quota ICMS'
        FocusControl = DBEdit5
      end
      object Label8: TLabel
        Left = 445
        Top = 217
        Width = 56
        Height = 13
        Caption = 'Al'#237'quota IPI'
        FocusControl = DBEdit6
      end
      object Label2: TLabel
        Left = 506
        Top = 25
        Width = 43
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt Sa'#237'da'
      end
      object Label12: TLabel
        Left = 83
        Top = 25
        Width = 90
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#250'mero da NFiscal'
      end
      object Label13: TLabel
        Left = 320
        Top = 25
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt Emiss'#227'o'
      end
      object Label4: TLabel
        Left = 326
        Top = 57
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dt Pedido'
      end
      object Label51: TLabel
        Left = 95
        Top = 152
        Width = 110
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dias em Demonstra'#231#227'o'
      end
      object Label52: TLabel
        Left = 10
        Top = 121
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Caption = 'Faturas'
        FocusControl = dblcCondPagto
      end
      object Label53: TLabel
        Left = 524
        Top = 57
        Width = 25
        Height = 13
        Alignment = taRightJustify
        Caption = 'Dolar'
      end
      object Label54: TLabel
        Left = 295
        Top = 153
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor'
        FocusControl = dblcCondPagto
      end
      object lblNfReferencia: TLabel
        Left = 624
        Top = 200
        Width = 136
        Height = 13
        Caption = 'NF Referenciada (Nr interno)'
        FocusControl = edNfRef
      end
      object sbPesquisarPedido: TSpeedButton
        Left = 288
        Top = 56
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
          300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
          330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
          333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
          339977FF777777773377000BFB03333333337773FF733333333F333000333333
          3300333777333333337733333333333333003333333333333377333333333333
          333333333333333333FF33333333333330003333333333333777333333333333
          3000333333333333377733333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = sbPesquisarPedidoClick
      end
      object dblcCondPagto: TDBLookupComboBox
        Left = 227
        Top = 89
        Width = 74
        Height = 21
        KeyField = 'COND_PAGTO_SQ'
        ListField = 'CODIGO_COND_PAGTO'
        ListSource = dsListaCondPagto
        TabOrder = 6
        OnClick = dblcCondPagtoClick
      end
      object dbldCondPagto: TDBLookupComboBox
        Left = 307
        Top = 89
        Width = 314
        Height = 21
        KeyField = 'COND_PAGTO_SQ'
        ListField = 'DESCRICAO_COND_PAGTO'
        ListSource = dsListaCondPagto
        TabOrder = 7
        OnClick = dblcCondPagtoClick
      end
      object dblcNatureza: TDBLookupComboBox
        Left = 211
        Top = 185
        Width = 74
        Height = 21
        KeyField = 'NATUREZA_SQ'
        ListField = 'CODIGO_NATUREZA'
        ListSource = dsListaNaturezas
        TabOrder = 19
        OnClick = dblcCondPagtoClick
      end
      object DBEdit3: TDBEdit
        Left = 211
        Top = 217
        Width = 36
        Height = 21
        TabStop = False
        DataField = 'CFO'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 22
      end
      object DBEdit5: TDBEdit
        Left = 347
        Top = 217
        Width = 72
        Height = 21
        TabStop = False
        DataField = 'ALIQ_ICMS'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 23
      end
      object DBEdit6: TDBEdit
        Left = 507
        Top = 217
        Width = 72
        Height = 21
        TabStop = False
        DataField = 'ALIQ_IPI'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 24
      end
      object GroupBox1: TGroupBox
        Left = 81
        Top = 249
        Width = 604
        Height = 152
        Caption = 'Destinat'#225'rio/Remetente'
        TabOrder = 25
        object lblCliente: TLabel
          Left = 14
          Top = 24
          Width = 28
          Height = 13
          Cursor = crHandPoint
          Alignment = taRightJustify
          Caption = 'Nome'
          FocusControl = dblcCliente
          OnClick = lblClienteClick
        end
        object Label11: TLabel
          Left = 371
          Top = 24
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.N.P.J.'
          FocusControl = dblcCliente
        end
        object Label14: TLabel
          Left = 22
          Top = 56
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'End.'
          FocusControl = DBEdit8
        end
        object Label16: TLabel
          Left = 17
          Top = 88
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Bairro'
          FocusControl = DBEdit12
        end
        object Label18: TLabel
          Left = 251
          Top = 88
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cidade'
          FocusControl = DBEdit14
        end
        object Label19: TLabel
          Left = 487
          Top = 88
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Estado'
          FocusControl = DBEdit15
        end
        object Label20: TLabel
          Left = 14
          Top = 120
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.E.P.'
          FocusControl = DBEdit16
        end
        object Label15: TLabel
          Left = 373
          Top = 56
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Numero'
          FocusControl = dblcCliente
        end
        object Label55: TLabel
          Left = 126
          Top = 120
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscr. Estadual'
          FocusControl = DBEdit2
        end
        object Label56: TLabel
          Left = 354
          Top = 120
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo de Cliente'
        end
        object dblcCliente: TDBLookupComboBox
          Left = 416
          Top = 24
          Width = 134
          Height = 21
          KeyField = 'CLIENTE_SQ'
          ListField = 'CODIGO_CLIENTE'
          ListSource = dsListaClientes
          TabOrder = 1
          OnClick = dblcCondPagtoClick
        end
        object dblnCliente: TDBLookupComboBox
          Left = 48
          Top = 24
          Width = 314
          Height = 21
          KeyField = 'CLIENTE_SQ'
          ListField = 'NOME_CLIENTE'
          ListSource = dsListaClientes
          TabOrder = 0
          OnClick = dblcCondPagtoClick
        end
        object DBEdit8: TDBEdit
          Left = 48
          Top = 56
          Width = 312
          Height = 21
          DataField = 'ENDERECO'
          DataSource = dsListaClientes
          TabOrder = 2
        end
        object DBEdit11: TDBEdit
          Left = 416
          Top = 56
          Width = 132
          Height = 21
          DataField = 'NUMERO'
          DataSource = dsListaClientes
          TabOrder = 3
        end
        object DBEdit12: TDBEdit
          Left = 48
          Top = 88
          Width = 192
          Height = 21
          DataField = 'BAIRRO'
          DataSource = dsListaClientes
          TabOrder = 4
        end
        object DBEdit14: TDBEdit
          Left = 288
          Top = 88
          Width = 192
          Height = 21
          DataField = 'CIDADE'
          DataSource = dsListaClientes
          TabOrder = 5
        end
        object DBEdit15: TDBEdit
          Left = 524
          Top = 88
          Width = 24
          Height = 21
          DataField = 'ESTADO'
          DataSource = dsListaClientes
          TabOrder = 6
        end
        object DBEdit16: TDBEdit
          Left = 48
          Top = 120
          Width = 60
          Height = 21
          DataField = 'CEP'
          DataSource = dsListaClientes
          TabOrder = 7
        end
        object DBEdit2: TDBEdit
          Left = 200
          Top = 120
          Width = 145
          Height = 21
          DataField = 'INSCR_ESTADUAL'
          DataSource = dsListaClientes
          TabOrder = 8
        end
        object edtTipoCliente: TRzEdit
          Left = 432
          Top = 120
          Width = 161
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 9
        end
      end
      object DBEdit1: TDBEdit
        Left = 376
        Top = 56
        Width = 113
        Height = 21
        TabStop = False
        DataField = 'DATA_PEDIDO'
        DataSource = dsListaPedidos
        ReadOnly = True
        TabOrder = 4
      end
      object dblVendedor: TDBLookupComboBox
        Left = 347
        Top = 153
        Width = 314
        Height = 21
        KeyField = 'VENDEDOR_SQ'
        ListField = 'NOME_VENDEDOR'
        ListSource = dsListaVendedores
        TabOrder = 18
      end
      object dbldNatureza: TDBLookupComboBox
        Left = 291
        Top = 185
        Width = 314
        Height = 21
        KeyField = 'NATUREZA_SQ'
        ListField = 'DESCRICAO_NATUREZA'
        ListSource = dsListaNaturezas
        TabOrder = 20
        OnClick = dblcCondPagtoClick
      end
      object ednfat1: TRzEdit
        Left = 48
        Top = 121
        Width = 89
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 8
        OnExit = edPedidoExit
      end
      object edvfat1: TRzEdit
        Left = 139
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 9
        OnExit = edPedidoExit
      end
      object eddfat1: TRzEdit
        Left = 211
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 10
        OnExit = edPedidoExit
      end
      object eddfat2: TRzEdit
        Left = 451
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 13
        OnExit = edPedidoExit
      end
      object ednfat2: TRzEdit
        Left = 288
        Top = 121
        Width = 89
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 11
        OnExit = edPedidoExit
      end
      object edvfat2: TRzEdit
        Left = 379
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 12
        OnExit = edPedidoExit
      end
      object eddfat3: TRzEdit
        Left = 691
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 16
        OnExit = edPedidoExit
      end
      object ednfat3: TRzEdit
        Left = 536
        Top = 121
        Width = 81
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 14
        OnExit = edPedidoExit
      end
      object edvfat3: TRzEdit
        Left = 619
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 15
        OnExit = edPedidoExit
      end
      object edNrNfiscal: TRzEdit
        Left = 176
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 0
        OnExit = edNrNfiscalExit
      end
      object edDtEmissao: TRzEdit
        Left = 376
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 1
      end
      object edDtSaida: TRzEdit
        Left = 552
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 2
      end
      object edDemonstracao: TRzEdit
        Left = 208
        Top = 152
        Width = 73
        Height = 21
        TabOrder = 17
        OnExit = dblcCondPagtoClick
      end
      object edNfRef: TRzEdit
        Left = 624
        Top = 216
        Width = 113
        Height = 21
        TabOrder = 21
      end
      object edPedido: TRzNumericEdit
        Left = 176
        Top = 56
        Width = 112
        Height = 21
        TabOrder = 3
        OnExit = edPedidoExit
        DisplayFormat = ',0;(,0)'
      end
      object edDolar: TRzNumericEdit
        Left = 552
        Top = 56
        Width = 113
        Height = 21
        TabOrder = 5
        OnExit = bbAtualizarClick
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
    end
    object tsItens: TTabSheet
      Caption = 'Itens'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 766
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
        Width = 766
        Height = 404
        Align = alClient
        DataSource = dsItens
        DefaultDrawing = False
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = RzDBGrid1DrawColumnCell
        OnDblClick = sbEditarItemClick
        QuickCompare.FieldValue = 1
        AltRowShading = False
        Columns = <
          item
            Expanded = False
            FieldName = 'ITEM'
            Title.Caption = 'Item'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo_produto'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao_produto'
            Title.Caption = 'Descri'#231#227'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_item'
            Title.Caption = 'Qtde'
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
            FieldName = 'codigo_nbm'
            Title.Caption = 'N.C.M.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NR_SERIE_ITEM'
            Title.Caption = 'Nr Serie'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLASS_FISCAL'
            Title.Caption = 'CF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STRIBUT'
            Title.Caption = 'ST'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_UNIT_ITEM'
            Title.Caption = 'Vlr Unit'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ICMS_ITEM'
            Title.Caption = '% ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_IPI_ITEM'
            Title.Caption = '% IPI'
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
            FieldName = 'VLR_DESC'
            Title.Caption = 'Vlr Desc.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PCT_DESC'
            Title.Caption = '% Desc.'
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
            FieldName = 'base_icms_subst_item'
            Title.Caption = 'Base ICMS Subst'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_icms_subst_item'
            Title.Caption = 'Vlr ICMS Subst'
            Visible = True
          end>
      end
    end
    object tsMensagem: TTabSheet
      Caption = 'Mensagem'
      ImageIndex = 1
      object mmMensagem: TMemo
        Left = 0
        Top = 0
        Width = 766
        Height = 429
        Align = alClient
        TabOrder = 0
      end
    end
    object tsRodape: TTabSheet
      Caption = 'Rodap'#233
      ImageIndex = 3
      object GroupBox2: TGroupBox
        Left = 0
        Top = 129
        Width = 766
        Height = 154
        Align = alClient
        Caption = 'Transportadora'
        TabOrder = 1
        object Label17: TLabel
          Left = 11
          Top = 24
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.N.P.J.'
          FocusControl = DBEdit13
        end
        object Label21: TLabel
          Left = 166
          Top = 24
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nome'
        end
        object Label22: TLabel
          Left = 4
          Top = 56
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit18
        end
        object Label23: TLabel
          Left = 395
          Top = 56
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Munic'#237'pio'
          FocusControl = DBEdit19
        end
        object Label24: TLabel
          Left = 673
          Top = 56
          Width = 33
          Height = 13
          Alignment = taRightJustify
          Caption = 'Estado'
          FocusControl = DBEdit20
        end
        object Label25: TLabel
          Left = 528
          Top = 24
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Inscr. Estadual'
          FocusControl = DBEdit21
        end
        object Label26: TLabel
          Left = 111
          Top = 88
          Width = 27
          Height = 13
          Caption = 'Placa'
        end
        object Label27: TLabel
          Left = 110
          Top = 120
          Width = 20
          Height = 13
          Caption = 'U.F.'
        end
        object Label28: TLabel
          Left = 218
          Top = 88
          Width = 23
          Height = 13
          Caption = 'Qtde'
        end
        object Label29: TLabel
          Left = 387
          Top = 88
          Width = 38
          Height = 13
          Caption = 'Esp'#233'cie'
        end
        object Label30: TLabel
          Left = 203
          Top = 120
          Width = 30
          Height = 13
          Caption = 'Marca'
        end
        object Label31: TLabel
          Left = 444
          Top = 120
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label32: TLabel
          Left = 565
          Top = 88
          Width = 52
          Height = 13
          Caption = 'Peso Bruto'
        end
        object Label33: TLabel
          Left = 568
          Top = 120
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'P. L'#237'quido'
        end
        object sbAtualizarQtde: TSpeedButton
          Left = 328
          Top = 88
          Width = 23
          Height = 22
          Hint = 'Atualizar quantidade'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
            73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
            0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
            0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
            0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
            0333337F777777737F333308888888880333337F333333337F33330888888888
            03333373FFFFFFFF733333700000000073333337777777773333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbAtualizarQtdeClick
        end
        object dblTransportadora: TDBLookupComboBox
          Left = 200
          Top = 24
          Width = 322
          Height = 21
          KeyField = 'TRANSPORTADORA_SQ'
          ListField = 'NOME_TRANSPORTADORA'
          ListSource = dsListaTransportadoras
          TabOrder = 1
        end
        object DBEdit13: TDBEdit
          Left = 56
          Top = 24
          Width = 102
          Height = 21
          TabStop = False
          DataField = 'CODIGO_TRANSPORTADORA'
          DataSource = dsListaTransportadoras
          TabOrder = 0
        end
        object DBEdit18: TDBEdit
          Left = 56
          Top = 56
          Width = 312
          Height = 21
          TabStop = False
          DataField = 'ENDERECO_TRANSPORTADORA'
          DataSource = dsListaTransportadoras
          TabOrder = 3
        end
        object DBEdit19: TDBEdit
          Left = 448
          Top = 56
          Width = 192
          Height = 21
          TabStop = False
          DataField = 'MUNICIPIO_TRANSPORTADORA'
          DataSource = dsListaTransportadoras
          TabOrder = 4
        end
        object DBEdit20: TDBEdit
          Left = 712
          Top = 56
          Width = 24
          Height = 21
          TabStop = False
          DataField = 'ESTADO_TRANSPORTADORA'
          DataSource = dsListaTransportadoras
          TabOrder = 5
        end
        object DBEdit21: TDBEdit
          Left = 604
          Top = 24
          Width = 132
          Height = 21
          TabStop = False
          DataField = 'INSCR_ESTADUAL'
          DataSource = dsListaTransportadoras
          TabOrder = 2
        end
        object rgFrete: TRadioGroup
          Left = 8
          Top = 84
          Width = 97
          Height = 57
          Caption = 'Frete por Conta'
          Items.Strings = (
            'Emitente'
            'Destinat'#225'rio')
          TabOrder = 14
          TabStop = True
        end
        object cbEstadoTransp: TComboBox
          Left = 144
          Top = 120
          Width = 49
          Height = 21
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PB'
            'PE'
            'PI'
            'PR'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
        end
        object edPlacaTransp: TRzEdit
          Left = 144
          Top = 88
          Width = 57
          Height = 21
          CharCase = ecUpperCase
          MaxLength = 7
          TabOrder = 6
        end
        object edEspecieTransp: TRzEdit
          Left = 432
          Top = 88
          Width = 129
          Height = 21
          TabOrder = 8
        end
        object edPBrutoTransp: TRzEdit
          Left = 624
          Top = 88
          Width = 129
          Height = 21
          TabOrder = 9
        end
        object edMarcaTransp: TRzEdit
          Left = 240
          Top = 120
          Width = 193
          Height = 21
          TabOrder = 11
        end
        object edNumeroTransp: TRzEdit
          Left = 488
          Top = 120
          Width = 73
          Height = 21
          TabOrder = 12
        end
        object edPLiquidoTransp: TRzEdit
          Left = 624
          Top = 120
          Width = 129
          Height = 21
          TabOrder = 13
        end
        object edQtdeTransp: TRzNumericEdit
          Left = 248
          Top = 88
          Width = 73
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 7
          DisplayFormat = ',0;(,0)'
        end
      end
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 766
        Height = 129
        Align = alTop
        Caption = 'C'#225'lculo do Imposto'
        TabOrder = 0
        object Label10: TLabel
          Left = 50
          Top = 24
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base ICMS'
        end
        object Label34: TLabel
          Left = 146
          Top = 24
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor ICMS'
        end
        object Label35: TLabel
          Left = 242
          Top = 24
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base ICMS Subst.'
        end
        object Label36: TLabel
          Left = 338
          Top = 24
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor ICMS Subst.'
        end
        object Label37: TLabel
          Left = 530
          Top = 24
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor dos Produtos'
        end
        object Label38: TLabel
          Left = 50
          Top = 72
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Frete'
        end
        object Label39: TLabel
          Left = 146
          Top = 72
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Seguro'
        end
        object Label40: TLabel
          Left = 242
          Top = 72
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Desp. Acess.'
        end
        object Label41: TLabel
          Left = 338
          Top = 72
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor IPI'
        end
        object Label42: TLabel
          Left = 530
          Top = 72
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total da Nota'
        end
        object Label78: TLabel
          Left = 434
          Top = 24
          Width = 39
          Height = 13
          Caption = 'Valor I.I.'
        end
        object edBaseICMS: TRzEdit
          Left = 48
          Top = 40
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
        end
        object edVlrIcms: TRzEdit
          Left = 144
          Top = 40
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 1
        end
        object edBaseICMSStrib: TRzEdit
          Left = 240
          Top = 40
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 2
          OnExit = dblcCondPagtoClick
        end
        object edVlrICMSStrib: TRzEdit
          Left = 336
          Top = 40
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
          OnExit = dblcCondPagtoClick
        end
        object edVlrProd: TRzEdit
          Left = 528
          Top = 40
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 4
        end
        object edVlrTotal: TRzEdit
          Left = 528
          Top = 88
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 9
        end
        object edVlrIPI: TRzEdit
          Left = 336
          Top = 88
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 8
        end
        object edVlrDespAcess: TRzEdit
          Left = 240
          Top = 88
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 7
          OnExit = dblcCondPagtoClick
        end
        object edVlrSeguro: TRzEdit
          Left = 144
          Top = 88
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 6
          OnExit = dblcCondPagtoClick
        end
        object edVlrFrete: TRzEdit
          Left = 48
          Top = 88
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 5
          OnExit = dblcCondPagtoClick
        end
        object edVlrII: TRzEdit
          Left = 432
          Top = 40
          Width = 73
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 10
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 283
        Width = 766
        Height = 146
        Align = alBottom
        Caption = 'Dados Adicionais - Classifica'#231#227'o fiscal'
        TabOrder = 2
        object Label44: TLabel
          Left = 8
          Top = 20
          Width = 7
          Height = 13
          Caption = 'A'
        end
        object Label45: TLabel
          Left = 8
          Top = 40
          Width = 7
          Height = 13
          Caption = 'B'
        end
        object Label46: TLabel
          Left = 8
          Top = 60
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label47: TLabel
          Left = 8
          Top = 80
          Width = 8
          Height = 13
          Caption = 'D'
        end
        object Label48: TLabel
          Left = 8
          Top = 100
          Width = 7
          Height = 13
          Caption = 'E'
        end
        object Label49: TLabel
          Left = 8
          Top = 120
          Width = 6
          Height = 13
          Caption = 'F'
        end
        object Label5: TLabel
          Left = 104
          Top = 20
          Width = 8
          Height = 13
          Caption = 'G'
        end
        object Label43: TLabel
          Left = 104
          Top = 40
          Width = 8
          Height = 13
          Caption = 'H'
        end
        object Label50: TLabel
          Left = 104
          Top = 60
          Width = 3
          Height = 13
          Caption = 'I'
        end
        object Label57: TLabel
          Left = 104
          Top = 80
          Width = 5
          Height = 13
          Caption = 'J'
        end
        object Label58: TLabel
          Left = 104
          Top = 100
          Width = 7
          Height = 13
          Caption = 'K'
        end
        object Label59: TLabel
          Left = 104
          Top = 120
          Width = 6
          Height = 13
          Caption = 'L'
        end
        object Label60: TLabel
          Left = 200
          Top = 20
          Width = 9
          Height = 13
          Caption = 'M'
        end
        object Label61: TLabel
          Left = 200
          Top = 40
          Width = 8
          Height = 13
          Caption = 'N'
        end
        object Label62: TLabel
          Left = 200
          Top = 60
          Width = 8
          Height = 13
          Caption = 'O'
        end
        object Label63: TLabel
          Left = 200
          Top = 80
          Width = 7
          Height = 13
          Caption = 'P'
        end
        object Label64: TLabel
          Left = 200
          Top = 100
          Width = 8
          Height = 13
          Caption = 'Q'
        end
        object Label65: TLabel
          Left = 200
          Top = 120
          Width = 8
          Height = 13
          Caption = 'R'
        end
        object Label66: TLabel
          Left = 296
          Top = 20
          Width = 7
          Height = 13
          Caption = 'S'
        end
        object Label67: TLabel
          Left = 296
          Top = 40
          Width = 7
          Height = 13
          Caption = 'T'
        end
        object Label68: TLabel
          Left = 296
          Top = 60
          Width = 8
          Height = 13
          Caption = 'U'
        end
        object Label69: TLabel
          Left = 296
          Top = 80
          Width = 7
          Height = 13
          Caption = 'V'
        end
        object Label70: TLabel
          Left = 296
          Top = 100
          Width = 7
          Height = 13
          Caption = 'X'
        end
        object Label71: TLabel
          Left = 296
          Top = 120
          Width = 7
          Height = 13
          Caption = 'Z'
        end
        object Label72: TLabel
          Left = 451
          Top = 24
          Width = 108
          Height = 13
          Caption = 'Informa'#231#245'es adicionais'
        end
        object edClass1: TRzEdit
          Left = 24
          Top = 20
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
        end
        object edClass2: TRzEdit
          Left = 24
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 1
        end
        object edClass3: TRzEdit
          Left = 24
          Top = 60
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 2
        end
        object edClass4: TRzEdit
          Left = 24
          Top = 80
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
        end
        object edClass5: TRzEdit
          Left = 24
          Top = 100
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 4
        end
        object edClass6: TRzEdit
          Left = 24
          Top = 120
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 5
        end
        object edClass7: TRzEdit
          Left = 120
          Top = 20
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 6
        end
        object edClass8: TRzEdit
          Left = 120
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 7
        end
        object edClass9: TRzEdit
          Left = 120
          Top = 60
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 8
        end
        object edClass10: TRzEdit
          Left = 120
          Top = 80
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 9
        end
        object edClass11: TRzEdit
          Left = 120
          Top = 100
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 10
        end
        object edClass12: TRzEdit
          Left = 120
          Top = 117
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 11
        end
        object edClass13: TRzEdit
          Left = 216
          Top = 20
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 12
        end
        object edClass14: TRzEdit
          Left = 216
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 13
        end
        object edClass15: TRzEdit
          Left = 216
          Top = 60
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 14
        end
        object edClass16: TRzEdit
          Left = 216
          Top = 80
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 15
        end
        object edClass17: TRzEdit
          Left = 216
          Top = 100
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 16
        end
        object edClass18: TRzEdit
          Left = 216
          Top = 117
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 17
        end
        object edClass19: TRzEdit
          Left = 312
          Top = 20
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 18
        end
        object edClass20: TRzEdit
          Left = 312
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 19
        end
        object edClass21: TRzEdit
          Left = 312
          Top = 60
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 20
        end
        object edClass22: TRzEdit
          Left = 312
          Top = 80
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 21
        end
        object edClass23: TRzEdit
          Left = 312
          Top = 100
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 22
        end
        object edClass24: TRzEdit
          Left = 312
          Top = 117
          Width = 73
          Height = 21
          TabStop = False
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 23
        end
        object mmInfAdic: TMemo
          Left = 448
          Top = 40
          Width = 292
          Height = 88
          MaxLength = 100
          TabOrder = 24
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Outras informa'#231#245'es'
      ImageIndex = 5
      object GroupBox5: TGroupBox
        Left = 0
        Top = 0
        Width = 766
        Height = 73
        Align = alTop
        Caption = 'Exporta'#231#227'o'
        TabOrder = 0
        object Label77: TLabel
          Left = 50
          Top = 24
          Width = 79
          Height = 13
          Caption = 'UF de embarque'
        end
        object Label83: TLabel
          Left = 146
          Top = 24
          Width = 91
          Height = 13
          Caption = 'Local de embarque'
        end
        object edUfEmbarque: TRzEdit
          Left = 48
          Top = 40
          Width = 49
          Height = 21
          MaxLength = 2
          TabOrder = 0
        end
        object edLocalEmbarque: TRzEdit
          Left = 144
          Top = 40
          Width = 265
          Height = 21
          MaxLength = 60
          TabOrder = 1
          OnExit = dblcCondPagtoClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'NF-e'
      ImageIndex = 4
      object Label73: TLabel
        Left = 80
        Top = 72
        Width = 72
        Height = 13
        Caption = 'Chave da Nota'
      end
      object Label74: TLabel
        Left = 80
        Top = 128
        Width = 97
        Height = 13
        Caption = 'Resposta do servi'#231'o'
      end
      object Label75: TLabel
        Left = 80
        Top = 24
        Width = 75
        Height = 13
        Caption = 'N'#250'mero da NFe'
      end
      object edChaveNFe: TRzEdit
        Left = 80
        Top = 88
        Width = 409
        Height = 21
        TabOrder = 1
      end
      object mmNFeResposta: TRzMemo
        Left = 80
        Top = 144
        Width = 409
        Height = 193
        MaxLength = 100
        TabOrder = 2
      end
      object edNumeroNFe: TRzEdit
        Left = 80
        Top = 40
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
  end
  object dsListaCondPagto: TDataSource
    Left = 232
    Top = 608
  end
  object dsListaNaturezas: TDataSource
    Left = 168
    Top = 608
  end
  object dsListaClientes: TDataSource
    Left = 296
    Top = 608
  end
  object dsListaTransportadoras: TDataSource
    Left = 360
    Top = 608
  end
  object dsListaPedidos: TDataSource
    Left = 424
    Top = 608
  end
  object dsListaVendedores: TDataSource
    Left = 488
    Top = 608
  end
  object cdsItens: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'item'
    Params = <>
    Left = 236
    Top = 659
    object cdsItensNFISCAL_ITEM_SQ: TIntegerField
      FieldName = 'NFISCAL_ITEM_SQ'
    end
    object cdsItensNFISCAL_SQ: TIntegerField
      FieldName = 'NFISCAL_SQ'
    end
    object cdsItensITEM: TIntegerField
      FieldName = 'ITEM'
    end
    object cdsItensPRODUTO_SQ: TIntegerField
      FieldName = 'PRODUTO_SQ'
    end
    object cdsItensNR_SERIE_ITEM: TMemoField
      FieldName = 'NR_SERIE_ITEM'
      BlobType = ftMemo
      Size = 1
    end
    object cdsItensCLASS_FISCAL: TStringField
      FieldName = 'CLASS_FISCAL'
      Size = 1
    end
    object cdsItensSTRIBUT: TIntegerField
      FieldName = 'STRIBUT'
    end
    object cdsItensqtde_item: TIntegerField
      FieldName = 'qtde_item'
    end
    object cdsItensVLR_UNIT_ITEM: TBCDField
      FieldName = 'VLR_UNIT_ITEM'
      Precision = 9
      Size = 2
    end
    object cdsItensVLR_TOTAL_ITEM: TBCDField
      FieldName = 'VLR_TOTAL_ITEM'
      DisplayFormat = '$ #,###,##0.00'
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
    object cdsItensVLR_DESC: TBCDField
      FieldName = 'VLR_DESC'
      Precision = 9
      Size = 2
    end
    object cdsItensPCT_DESC: TBCDField
      FieldName = 'PCT_DESC'
      Precision = 5
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
    object cdsItensbase_icms_subst_item: TBCDField
      FieldName = 'base_icms_subst_item'
      Precision = 9
      Size = 2
    end
    object cdsItensvlr_icms_subst_item: TBCDField
      FieldName = 'vlr_icms_subst_item'
      Precision = 9
      Size = 2
    end
    object cdsItensorigem_mercadoria: TIntegerField
      FieldName = 'origem_mercadoria'
    end
    object cdsItenscodigo_produto: TStringField
      FieldName = 'codigo_produto'
    end
    object cdsItensdescricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 50
    end
    object cdsItenscodigo_nbm: TStringField
      FieldName = 'codigo_nbm'
      Size = 10
    end
    object cdsItensvlr_frete_item: TBCDField
      FieldName = 'vlr_frete_item'
      Precision = 9
      Size = 2
    end
    object cdsItensvlr_seguro_item: TBCDField
      FieldName = 'vlr_seguro_item'
      Precision = 9
      Size = 2
    end
    object cdsItensvlr_desp_acess_item: TBCDField
      FieldName = 'vlr_desp_acess_item'
      Precision = 9
      Size = 2
    end
    object cdsItensbase_ii_item: TBCDField
      FieldName = 'base_ii_item'
      Precision = 9
      Size = 2
    end
    object cdsItensvlr_ii_item: TBCDField
      FieldName = 'vlr_ii_item'
      Precision = 9
      Size = 2
    end
    object cdsItensvlr_desp_adu_item: TBCDField
      FieldName = 'vlr_desp_adu_item'
      Precision = 9
      Size = 2
    end
    object cdsItensvlr_iof_item: TBCDField
      FieldName = 'vlr_iof_item'
      Precision = 9
      Size = 2
    end
    object cdsItensnumero_di: TStringField
      FieldName = 'numero_di'
      Size = 10
    end
    object cdsItensdata_di: TDateField
      FieldName = 'data_di'
    end
    object cdsItenslocal_desemb: TStringField
      FieldName = 'local_desemb'
      Size = 60
    end
    object cdsItensuf_desemb: TStringField
      FieldName = 'uf_desemb'
      Size = 2
    end
    object cdsItensdata_desemb: TDateField
      FieldName = 'data_desemb'
    end
    object cdsItenscodigo_exportador: TStringField
      FieldName = 'codigo_exportador'
      Size = 60
    end
    object cdsItensbase_icms_item: TBCDField
      FieldName = 'base_icms_item'
      Precision = 9
      Size = 2
    end
  end
  object dsItens: TDataSource
    DataSet = cdsItens
    Left = 296
    Top = 659
  end
  object cdsItemAdicao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 656
    object cdsItemAdicaonfiscal_item_adicao_sq: TIntegerField
      FieldName = 'nfiscal_item_adicao_sq'
    end
    object cdsItemAdicaonfiscal_item_sq: TIntegerField
      FieldName = 'nfiscal_item_sq'
    end
    object cdsItemAdicaonumero_adicao: TIntegerField
      FieldName = 'numero_adicao'
    end
    object cdsItemAdicaonumero_sequencial_adicao: TIntegerField
      FieldName = 'numero_sequencial_adicao'
    end
    object cdsItemAdicaocodigo_fabricante: TStringField
      FieldName = 'codigo_fabricante'
      Size = 60
    end
    object cdsItemAdicaovlr_desc_adicao: TBCDField
      FieldName = 'vlr_desc_adicao'
      Precision = 9
      Size = 2
    end
  end
end
