inherited FCadastrarFormPedidos: TFCadastrarFormPedidos
  Left = 336
  Top = 88
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Pedidos'
  Caption = 'Cadastrar Pedidos'
  ClientHeight = 530
  ClientWidth = 598
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
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
  object Label5: TLabel [2]
    Left = 98
    Top = 48
    Width = 32
    Height = 13
    Cursor = crHandPoint
    Caption = 'Cliente'
    FocusControl = DBLookupComboBox1
    OnClick = Label5Click
  end
  object Label7: TLabel [3]
    Left = 13
    Top = 80
    Width = 117
    Height = 13
    Caption = 'Condi'#231#227'o de Pagamento'
    FocusControl = DBLookupComboBox3
  end
  object Label9: TLabel [4]
    Left = 22
    Top = 144
    Width = 108
    Height = 13
    Caption = 'Natureza da Opera'#231#227'o'
    FocusControl = DBLookupComboBox5
  end
  object Label3: TLabel [5]
    Left = 90
    Top = 176
    Width = 40
    Height = 13
    Caption = 'C.F.O.P.'
  end
  object Label6: TLabel [6]
    Left = 197
    Top = 176
    Width = 69
    Height = 13
    Caption = 'Al'#237'quota ICMS'
  end
  object Label8: TLabel [7]
    Left = 370
    Top = 176
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
    Top = 208
    Width = 72
    Height = 13
    Caption = 'Transportadora'
    FocusControl = DBLookupComboBox7
  end
  object Label11: TLabel [10]
    Left = 474
    Top = 208
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Frete'
  end
  object Label12: TLabel [11]
    Left = 20
    Top = 112
    Width = 110
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dias em Demonstra'#231#227'o'
  end
  object Label13: TLabel [12]
    Left = 325
    Top = 240
    Width = 36
    Height = 13
    Caption = '% Juros'
  end
  object Label14: TLabel [13]
    Left = 438
    Top = 240
    Width = 43
    Height = 13
    Caption = 'Vlr. Juros'
  end
  object Label17: TLabel [14]
    Left = 84
    Top = 280
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Vendedor'
    FocusControl = DBLookupComboBox8
  end
  inherited Panel1: TPanel
    Top = 500
    Width = 598
    TabOrder = 20
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 136
    Top = 48
    Width = 129
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'CODIGO_CLIENTE'
    ListSource = DataSource1
    TabOrder = 3
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 272
    Top = 48
    Width = 314
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'NOME_CLIENTE'
    ListSource = DataSource1
    TabOrder = 4
    OnClick = DBLookupComboBox2Click
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 136
    Top = 80
    Width = 129
    Height = 21
    KeyField = 'COND_PAGTO_SQ'
    ListField = 'CODIGO_COND_PAGTO'
    ListSource = DataSource2
    TabOrder = 5
    OnClick = DBLookupComboBox3Click
  end
  object DBLookupComboBox4: TDBLookupComboBox
    Left = 272
    Top = 80
    Width = 314
    Height = 21
    KeyField = 'COND_PAGTO_SQ'
    ListField = 'DESCRICAO_COND_PAGTO'
    ListSource = DataSource2
    TabOrder = 6
    OnClick = DBLookupComboBox4Click
  end
  object DBLookupComboBox5: TDBLookupComboBox
    Left = 136
    Top = 144
    Width = 129
    Height = 21
    KeyField = 'NATUREZA_SQ'
    ListField = 'CODIGO_NATUREZA'
    ListSource = DataSource3
    TabOrder = 8
    OnClick = DBLookupComboBox5Click
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 313
    Width = 598
    Height = 187
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 19
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
      object StringGrid1: TStringGrid
        Left = 0
        Top = 25
        Width = 590
        Height = 134
        Align = alClient
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sbEditarItemClick
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
        Top = 40
        Width = 53
        Height = 13
        Caption = 'Base ICMS'
      end
      object Label34: TLabel
        Left = 200
        Top = 88
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor ICMS'
      end
      object Label37: TLabel
        Left = 392
        Top = 40
        Width = 89
        Height = 13
        Caption = 'Valor dos Produtos'
      end
      object Label38: TLabel
        Left = 104
        Top = 40
        Width = 57
        Height = 13
        Caption = '% Desconto'
      end
      object Label39: TLabel
        Left = 104
        Top = 88
        Width = 61
        Height = 13
        Caption = 'Vlr Desconto'
      end
      object Label41: TLabel
        Left = 296
        Top = 88
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor IPI'
      end
      object Label16: TLabel
        Left = 392
        Top = 88
        Width = 75
        Height = 13
        Caption = 'Total do Pedido'
      end
      object edPctDesc: TEdit
        Left = 104
        Top = 56
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edVlrDesc: TEdit
        Left = 104
        Top = 104
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edBaseIcms: TEdit
        Left = 200
        Top = 56
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object edVlrIcms: TEdit
        Left = 200
        Top = 104
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object edVlrIpi: TEdit
        Left = 296
        Top = 104
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object edVlrProd: TEdit
        Left = 392
        Top = 56
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 5
      end
      object edVlrProdIpi: TEdit
        Left = 392
        Top = 104
        Width = 73
        Height = 21
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object DBLookupComboBox7: TDBLookupComboBox
    Left = 136
    Top = 208
    Width = 322
    Height = 21
    KeyField = 'TRANSPORTADORA_SQ'
    ListField = 'NOME_TRANSPORTADORA'
    ListSource = DataSource4
    TabOrder = 13
  end
  object DBLookupComboBox6: TDBLookupComboBox
    Left = 272
    Top = 144
    Width = 314
    Height = 21
    KeyField = 'NATUREZA_SQ'
    ListField = 'DESCRICAO_NATUREZA'
    ListSource = DataSource3
    TabOrder = 9
    OnClick = DBLookupComboBox6Click
  end
  object edNrPedido: TEdit
    Left = 136
    Top = 16
    Width = 113
    Height = 21
    TabOrder = 0
  end
  object edDtPedido: TEdit
    Left = 312
    Top = 16
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object edDolar: TEdit
    Left = 520
    Top = 16
    Width = 65
    Height = 21
    TabOrder = 2
    OnExit = edDolarExit
  end
  object edDemonstracao: TEdit
    Left = 136
    Top = 112
    Width = 73
    Height = 21
    TabOrder = 7
  end
  object edFrete: TEdit
    Left = 504
    Top = 208
    Width = 81
    Height = 21
    TabOrder = 14
    OnExit = edFreteExit
  end
  object edPctJuros: TEdit
    Left = 368
    Top = 240
    Width = 57
    Height = 21
    TabOrder = 16
    OnExit = edPctJurosExit
  end
  object edVlrJuros: TEdit
    Left = 488
    Top = 240
    Width = 100
    Height = 21
    TabOrder = 17
    OnExit = edVlrJurosExit
  end
  object DBEdit1: TDBEdit
    Left = 136
    Top = 176
    Width = 49
    Height = 21
    DataField = 'CFO'
    DataSource = DataSource3
    TabOrder = 10
  end
  object DBEdit2: TDBEdit
    Left = 272
    Top = 176
    Width = 49
    Height = 21
    DataField = 'ALIQ_ICMS'
    DataSource = DataSource3
    TabOrder = 11
  end
  object DBEdit3: TDBEdit
    Left = 432
    Top = 176
    Width = 49
    Height = 21
    DataField = 'ALIQ_IPI'
    DataSource = DataSource3
    TabOrder = 12
  end
  object rgFrete: TRadioGroup
    Left = 136
    Top = 232
    Width = 169
    Height = 37
    Caption = 'Frete por Conta'
    Columns = 2
    Items.Strings = (
      'Emitente'
      'Destinat'#225'rio')
    TabOrder = 15
    TabStop = True
  end
  object DBLookupComboBox8: TDBLookupComboBox
    Left = 136
    Top = 280
    Width = 322
    Height = 21
    KeyField = 'VENDEDOR_SQ'
    ListField = 'NOME_VENDEDOR'
    ListSource = DataSource5
    TabOrder = 18
  end
  object DataSource1: TDataSource
    DataSet = DMLista.cdsListaClientes
    Left = 248
    Top = 400
  end
  object DataSource2: TDataSource
    DataSet = DMLista.cdsListaCondPagto
    Left = 320
    Top = 400
  end
  object DataSource3: TDataSource
    DataSet = DMLista.cdsListaNaturezas
    Left = 392
    Top = 400
  end
  object DataSource4: TDataSource
    DataSet = DMLista.cdsListaTransportadoras
    Left = 464
    Top = 400
  end
  object DataSource5: TDataSource
    DataSet = DMLista.cdsListaVendedores
    Left = 536
    Top = 400
  end
end
