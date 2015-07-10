inherited FCadastrarFormNfiscais: TFCadastrarFormNfiscais
  Left = 237
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Notas Fiscais'
  Caption = 'Cadastrar Notas Fiscais'
  ClientHeight = 486
  ClientWidth = 774
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 456
    Width = 774
    TabOrder = 1
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
    Height = 456
    ActivePage = tsCabecalho
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsCabecalho: TTabSheet
      Caption = 'Cabe'#231'alho'
      ImageIndex = 2
      object Label1: TLabel
        Left = 101
        Top = 57
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'N'#250'mero do Pedido'
      end
      object Label7: TLabel
        Left = 104
        Top = 89
        Width = 117
        Height = 13
        Caption = 'Condi'#231#227'o de Pagamento'
        FocusControl = DBLookupComboBox3
      end
      object Label9: TLabel
        Left = 113
        Top = 185
        Width = 108
        Height = 13
        Caption = 'Natureza da Opera'#231#227'o'
        FocusControl = DBLookupComboBox5
      end
      object Label3: TLabel
        Left = 191
        Top = 217
        Width = 30
        Height = 13
        Caption = 'C.F.O.'
        FocusControl = DBEdit3
      end
      object Label6: TLabel
        Left = 288
        Top = 217
        Width = 69
        Height = 13
        Caption = 'Al'#237'quota ICMS'
        FocusControl = DBEdit5
      end
      object Label8: TLabel
        Left = 461
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
        Left = 99
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
        Left = 111
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
        FocusControl = DBLookupComboBox3
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
        Left = 391
        Top = 153
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Vendedor'
        FocusControl = DBLookupComboBox3
      end
      object DBLookupComboBox3: TDBLookupComboBox
        Left = 227
        Top = 89
        Width = 74
        Height = 21
        KeyField = 'COND_PAGTO_SQ'
        ListField = 'CODIGO_COND_PAGTO'
        ListSource = dsListaCondPagto
        TabOrder = 6
        OnClick = DBLookupComboBox3Click
      end
      object DBLookupComboBox4: TDBLookupComboBox
        Left = 307
        Top = 89
        Width = 314
        Height = 21
        KeyField = 'COND_PAGTO_SQ'
        ListField = 'DESCRICAO_COND_PAGTO'
        ListSource = dsListaCondPagto
        TabOrder = 7
        OnClick = DBLookupComboBox4Click
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 227
        Top = 185
        Width = 74
        Height = 21
        KeyField = 'NATUREZA_SQ'
        ListField = 'CODIGO_NATUREZA'
        ListSource = dsListaNaturezas
        TabOrder = 19
        OnClick = DBLookupComboBox5Click
      end
      object DBEdit2: TDBEdit
        Left = 307
        Top = 185
        Width = 312
        Height = 21
        TabStop = False
        DataField = 'DESCRICAO_NATUREZA'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 20
      end
      object DBEdit3: TDBEdit
        Left = 227
        Top = 217
        Width = 36
        Height = 21
        TabStop = False
        DataField = 'CFO'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 21
      end
      object DBEdit5: TDBEdit
        Left = 363
        Top = 217
        Width = 72
        Height = 21
        TabStop = False
        DataField = 'ALIQ_ICMS'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 22
      end
      object DBEdit6: TDBEdit
        Left = 523
        Top = 217
        Width = 72
        Height = 21
        TabStop = False
        DataField = 'ALIQ_IPI'
        DataSource = dsListaNaturezas
        ReadOnly = True
        TabOrder = 23
      end
      object GroupBox1: TGroupBox
        Left = 99
        Top = 249
        Width = 561
        Height = 153
        Caption = 'Destinat'#225'rio/Remetente'
        TabOrder = 24
        object Label5: TLabel
          Left = 14
          Top = 24
          Width = 28
          Height = 13
          Cursor = crHandPoint
          Alignment = taRightJustify
          Caption = 'Nome'
          FocusControl = DBLookupComboBox1
          OnClick = Label5Click
        end
        object Label11: TLabel
          Left = 371
          Top = 24
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'C.N.P.J.'
          FocusControl = DBLookupComboBox1
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
          FocusControl = DBLookupComboBox1
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 416
          Top = 24
          Width = 134
          Height = 21
          KeyField = 'CLIENTE_SQ'
          ListField = 'CODIGO_CLIENTE'
          ListSource = dsListaClientes
          TabOrder = 1
          OnClick = DBLookupComboBox1Click
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 48
          Top = 24
          Width = 314
          Height = 21
          KeyField = 'CLIENTE_SQ'
          ListField = 'NOME_CLIENTE'
          ListSource = dsListaClientes
          TabOrder = 0
          OnClick = DBLookupComboBox2Click
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
      end
      object edPedido: TEdit
        Left = 192
        Top = 56
        Width = 112
        Height = 21
        TabOrder = 3
        OnExit = edPedidoExit
      end
      object ednfat1: TEdit
        Left = 48
        Top = 121
        Width = 89
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 8
        OnExit = edPedidoExit
      end
      object edvfat1: TEdit
        Left = 139
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 9
        OnExit = edPedidoExit
      end
      object eddfat1: TEdit
        Left = 211
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 10
        OnExit = edPedidoExit
      end
      object eddfat2: TEdit
        Left = 451
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 13
        OnExit = edPedidoExit
      end
      object ednfat2: TEdit
        Left = 288
        Top = 121
        Width = 89
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 11
        OnExit = edPedidoExit
      end
      object edvfat2: TEdit
        Left = 379
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 12
        OnExit = edPedidoExit
      end
      object eddfat3: TEdit
        Left = 691
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 16
        OnExit = edPedidoExit
      end
      object ednfat3: TEdit
        Left = 536
        Top = 121
        Width = 81
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 14
        OnExit = edPedidoExit
      end
      object edvfat3: TEdit
        Left = 619
        Top = 121
        Width = 70
        Height = 21
        TabStop = False
        ReadOnly = True
        TabOrder = 15
        OnExit = edPedidoExit
      end
      object edNrNfiscal: TEdit
        Left = 192
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 0
        OnExit = edNrNfiscalExit
      end
      object edDtEmissao: TEdit
        Left = 376
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 1
      end
      object edDtSaida: TEdit
        Left = 552
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 2
      end
      object edDemonstracao: TEdit
        Left = 224
        Top = 152
        Width = 73
        Height = 21
        TabOrder = 17
        OnExit = edDemonstracaoExit
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
      object edDolar: TEdit
        Left = 552
        Top = 56
        Width = 113
        Height = 21
        TabOrder = 5
      end
      object DBLookupComboBox7: TDBLookupComboBox
        Left = 443
        Top = 153
        Width = 314
        Height = 21
        KeyField = 'VENDEDOR_SQ'
        ListField = 'NOME_VENDEDOR'
        ListSource = dsListaVendedores
        TabOrder = 18
      end
    end
    object tsItens: TTabSheet
      Caption = #205'tens'
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
      object StringGrid1: TStringGrid
        Left = 0
        Top = 25
        Width = 766
        Height = 400
        Align = alClient
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sbEditarItemClick
      end
    end
    object tsMensagem: TTabSheet
      Caption = 'Mensagem'
      ImageIndex = 1
      object mmMensagem: TMemo
        Left = 0
        Top = 0
        Width = 766
        Height = 425
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
        Height = 150
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
          Left = 331
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
        object DBLookupComboBox6: TDBLookupComboBox
          Left = 200
          Top = 24
          Width = 322
          Height = 21
          KeyField = 'TRANSPORTADORA_SQ'
          ListField = 'NOME_TRANSPORTADORA'
          ListSource = dsListaTransp
          TabOrder = 1
        end
        object DBEdit13: TDBEdit
          Left = 56
          Top = 24
          Width = 102
          Height = 21
          TabStop = False
          DataField = 'CODIGO_TRANSPORTADORA'
          DataSource = dsListaTransp
          TabOrder = 0
        end
        object DBEdit18: TDBEdit
          Left = 56
          Top = 56
          Width = 312
          Height = 21
          TabStop = False
          DataField = 'ENDERECO_TRANSPORTADORA'
          DataSource = dsListaTransp
          TabOrder = 3
        end
        object DBEdit19: TDBEdit
          Left = 448
          Top = 56
          Width = 192
          Height = 21
          TabStop = False
          DataField = 'MUNICIPIO_TRANSPORTADORA'
          DataSource = dsListaTransp
          TabOrder = 4
        end
        object DBEdit20: TDBEdit
          Left = 712
          Top = 56
          Width = 24
          Height = 21
          TabStop = False
          DataField = 'ESTADO_TRANSPORTADORA'
          DataSource = dsListaTransp
          TabOrder = 5
        end
        object DBEdit21: TDBEdit
          Left = 604
          Top = 24
          Width = 132
          Height = 21
          TabStop = False
          DataField = 'INSCR_ESTADUAL'
          DataSource = dsListaTransp
          TabOrder = 2
        end
        object edPlacaTransp: TEdit
          Left = 144
          Top = 88
          Width = 57
          Height = 21
          TabOrder = 6
        end
        object edQtdeTransp: TEdit
          Left = 248
          Top = 88
          Width = 73
          Height = 21
          TabOrder = 7
        end
        object edEspecieTransp: TEdit
          Left = 376
          Top = 88
          Width = 129
          Height = 21
          TabOrder = 8
        end
        object edPBrutoTransp: TEdit
          Left = 624
          Top = 88
          Width = 129
          Height = 21
          TabOrder = 9
        end
        object edMarcaTransp: TEdit
          Left = 240
          Top = 120
          Width = 193
          Height = 21
          TabOrder = 11
        end
        object edNumeroTransp: TEdit
          Left = 488
          Top = 120
          Width = 73
          Height = 21
          TabOrder = 12
        end
        object edPLiquidoTransp: TEdit
          Left = 624
          Top = 120
          Width = 129
          Height = 21
          TabOrder = 13
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
          Left = 146
          Top = 24
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base ICMS'
        end
        object Label34: TLabel
          Left = 242
          Top = 24
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor ICMS'
        end
        object Label35: TLabel
          Left = 338
          Top = 24
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Base ICMS Subst.'
        end
        object Label36: TLabel
          Left = 434
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
          Left = 146
          Top = 72
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Frete'
        end
        object Label39: TLabel
          Left = 242
          Top = 72
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Seguro'
        end
        object Label40: TLabel
          Left = 338
          Top = 72
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Desp. Acess.'
        end
        object Label41: TLabel
          Left = 434
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
        object edBaseICMS: TEdit
          Left = 144
          Top = 40
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edVlrIcms: TEdit
          Left = 240
          Top = 40
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edBaseICMSStrib: TEdit
          Left = 336
          Top = 40
          Width = 73
          Height = 21
          TabOrder = 2
        end
        object edVlrICMSStrib: TEdit
          Left = 432
          Top = 40
          Width = 73
          Height = 21
          TabOrder = 3
        end
        object edVlrProd: TEdit
          Left = 528
          Top = 40
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 4
        end
        object edVlrTotal: TEdit
          Left = 528
          Top = 88
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 9
        end
        object edVlrIPI: TEdit
          Left = 432
          Top = 88
          Width = 73
          Height = 21
          ReadOnly = True
          TabOrder = 8
        end
        object edVlrDespAcess: TEdit
          Left = 336
          Top = 88
          Width = 73
          Height = 21
          TabOrder = 7
          OnExit = edVlrDespAcessExit
        end
        object edVlrSeguro: TEdit
          Left = 240
          Top = 88
          Width = 73
          Height = 21
          TabOrder = 6
          OnExit = edVlrSeguroExit
        end
        object edVlrFrete: TEdit
          Left = 144
          Top = 88
          Width = 73
          Height = 21
          TabOrder = 5
          OnExit = edVlrFreteExit
        end
      end
      object GroupBox4: TGroupBox
        Left = 0
        Top = 279
        Width = 766
        Height = 146
        Align = alBottom
        Caption = 'Dados Adicionais'
        TabOrder = 2
        object Label43: TLabel
          Left = 328
          Top = 16
          Width = 92
          Height = 13
          Caption = 'Classifica'#231#227'o Fiscal'
        end
        object Label44: TLabel
          Left = 280
          Top = 40
          Width = 7
          Height = 13
          Caption = 'A'
        end
        object Label45: TLabel
          Left = 280
          Top = 64
          Width = 7
          Height = 13
          Caption = 'B'
        end
        object Label46: TLabel
          Left = 280
          Top = 88
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label47: TLabel
          Left = 280
          Top = 112
          Width = 8
          Height = 13
          Caption = 'D'
        end
        object Label48: TLabel
          Left = 392
          Top = 56
          Width = 7
          Height = 13
          Caption = 'E'
        end
        object Label49: TLabel
          Left = 392
          Top = 80
          Width = 6
          Height = 13
          Caption = 'F'
        end
        object Label50: TLabel
          Left = 392
          Top = 104
          Width = 8
          Height = 13
          Caption = 'G'
        end
        object edClassA: TEdit
          Left = 296
          Top = 40
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 0
        end
        object edClassB: TEdit
          Left = 296
          Top = 64
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 1
        end
        object edClassC: TEdit
          Left = 296
          Top = 88
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 2
        end
        object edClassD: TEdit
          Left = 296
          Top = 112
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 3
        end
        object edClassE: TEdit
          Left = 408
          Top = 56
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 4
        end
        object edClassF: TEdit
          Left = 408
          Top = 80
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 5
        end
        object edClassG: TEdit
          Left = 408
          Top = 104
          Width = 73
          Height = 21
          TabStop = False
          ReadOnly = True
          TabOrder = 6
        end
      end
    end
  end
  object dsListaCondPagto: TDataSource
    DataSet = DMLista.cdsListaCondPagto
    Left = 384
    Top = 416
  end
  object dsListaNaturezas: TDataSource
    DataSet = DMLista.cdsListaNaturezas
    Left = 320
    Top = 416
  end
  object dsListaClientes: TDataSource
    DataSet = DMLista.cdsListaClientes
    Left = 448
    Top = 416
  end
  object dsListaTransp: TDataSource
    DataSet = DMLista.cdsListaTransportadoras
    Left = 512
    Top = 416
  end
  object dsListaPedidos: TDataSource
    Left = 576
    Top = 416
  end
  object dsListaVendedores: TDataSource
    DataSet = DMLista.cdsListaVendedores
    Left = 640
    Top = 416
  end
  object cdsListaPedidos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLista'
    RemoteServer = DMLista.SCServerLista
    Left = 20
    Top = 67
  end
  object cdsListaPedidosItens: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLista'
    RemoteServer = DMLista.SCServerLista
    Left = 20
    Top = 115
  end
end
