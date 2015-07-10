inherited FCadastrarFormNfEntradas: TFCadastrarFormNfEntradas
  Left = 402
  Top = 176
  Caption = 'Cadastrar Notas Fiscais de Entrada'
  ClientHeight = 450
  ClientWidth = 602
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 44
    Top = 16
    Width = 46
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nr Nfiscal'
  end
  object Label5: TLabel [1]
    Left = 36
    Top = 48
    Width = 54
    Height = 13
    Cursor = crHandPoint
    Caption = 'Fornecedor'
    FocusControl = dblCodCliente
  end
  object Label2: TLabel [2]
    Left = 218
    Top = 16
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Emiss'#227'o'
  end
  object Label9: TLabel [3]
    Left = 35
    Top = 80
    Width = 108
    Height = 13
    Caption = 'Natureza da Opera'#231#227'o'
    FocusControl = dblcNatureza
  end
  object Label7: TLabel [4]
    Left = 119
    Top = 113
    Width = 30
    Height = 13
    Caption = 'C.F.O.'
    FocusControl = DBEdit1
  end
  object Label8: TLabel [5]
    Left = 216
    Top = 113
    Width = 69
    Height = 13
    Caption = 'Al'#237'quota ICMS'
    FocusControl = DBEdit2
  end
  object Label10: TLabel [6]
    Left = 389
    Top = 113
    Width = 56
    Height = 13
    Caption = 'Al'#237'quota IPI'
    FocusControl = DBEdit3
  end
  object Label11: TLabel [7]
    Left = 388
    Top = 16
    Width = 51
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dt Entrada'
  end
  inherited Panel1: TPanel
    Top = 420
    Width = 602
    TabOrder = 11
    DesignSize = (
      602
      30)
    inherited bbOk: TBitBtn
      Left = 408
      Width = 106
      Caption = 'Gravar e Sair'
      TabOrder = 1
    end
    inherited bbCancelar: TBitBtn
      Left = 519
      TabOrder = 2
    end
    object bbTransfere: TBitBtn
      Left = 240
      Top = 1
      Width = 163
      Height = 25
      Caption = 'Transferir para o Estoque'
      ModalResult = 8
      TabOrder = 0
      OnClick = bbTransfereClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancelaTransferencia: TBitBtn
      Left = 32
      Top = 1
      Width = 145
      Height = 25
      Caption = 'Cancela Transfer'#234'ncia'
      ModalResult = 2
      TabOrder = 3
      OnClick = bbCancelaTransferenciaClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object dblCodCliente: TDBLookupComboBox
    Left = 96
    Top = 48
    Width = 129
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'CODIGO_CLIENTE'
    ListSource = dsListaClientes
    TabOrder = 2
    OnClick = dblCodClienteClick
  end
  object dblNomeCliente: TDBLookupComboBox
    Left = 232
    Top = 48
    Width = 314
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'NOME_CLIENTE'
    ListSource = dsListaClientes
    TabOrder = 3
    OnClick = dblNomeClienteClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 146
    Width = 602
    Height = 187
    ActivePage = TabSheet1
    Align = alBottom
    TabOrder = 9
    object TabSheet1: TTabSheet
      Caption = #205'tens'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 594
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
      object gridItems: TRzDBGrid
        Left = 0
        Top = 25
        Width = 594
        Height = 134
        Align = alClient
        DataSource = dsItems
        DefaultDrawing = False
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
            FieldName = 'codigo_produto'
            Title.Caption = 'C'#243'digo'
            Width = 120
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
            FieldName = 'qtde'
            Title.Caption = 'Qtde'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preco'
            Title.Caption = 'Pre'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aliqIcms'
            Title.Caption = 'Aliq ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'aliqIpi'
            Title.Caption = 'Aliq IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlrIcms'
            Title.Caption = 'Vlr ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlrIpi'
            Title.Caption = 'Vlr IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlrTotal'
            Title.Caption = 'Valor Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde_estoque'
            Title.Caption = 'Qtde estoque'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'codigo_nbm'
            Title.Caption = 'C'#243'digo NCM'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Valores'
      ImageIndex = 1
      object Label15: TLabel
        Left = 24
        Top = 24
        Width = 53
        Height = 13
        Caption = 'Base ICMS'
      end
      object Label34: TLabel
        Left = 24
        Top = 72
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Valor ICMS'
      end
      object Label37: TLabel
        Left = 216
        Top = 24
        Width = 24
        Height = 13
        Caption = 'Frete'
      end
      object Label38: TLabel
        Left = 120
        Top = 24
        Width = 86
        Height = 13
        Caption = 'Base ICMS Subst.'
      end
      object Label39: TLabel
        Left = 120
        Top = 72
        Width = 86
        Height = 13
        Caption = 'Valor ICMS Subst.'
      end
      object Label41: TLabel
        Left = 216
        Top = 72
        Width = 34
        Height = 13
        Caption = 'Seguro'
      end
      object Label16: TLabel
        Left = 408
        Top = 72
        Width = 51
        Height = 13
        Caption = 'Valor Total'
      end
      object Label3: TLabel
        Left = 312
        Top = 24
        Width = 82
        Height = 13
        Caption = 'Despesas Acess.'
      end
      object Label4: TLabel
        Left = 312
        Top = 72
        Width = 40
        Height = 13
        Caption = 'Valor IPI'
      end
      object Label6: TLabel
        Left = 408
        Top = 24
        Width = 69
        Height = 13
        Caption = 'Valor Produtos'
      end
      object edBaseIcmsSubst: TRzNumericEdit
        Left = 120
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 0
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrIcmsSubst: TRzNumericEdit
        Left = 120
        Top = 88
        Width = 73
        Height = 21
        TabOrder = 1
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edBaseIcms: TRzNumericEdit
        Left = 24
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 2
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrIcms: TRzNumericEdit
        Left = 24
        Top = 88
        Width = 73
        Height = 21
        TabOrder = 3
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrSeguro: TRzNumericEdit
        Left = 216
        Top = 88
        Width = 73
        Height = 21
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrFrete: TRzNumericEdit
        Left = 216
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 5
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrTotal: TRzNumericEdit
        Left = 408
        Top = 88
        Width = 73
        Height = 21
        TabOrder = 6
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrIpi: TRzNumericEdit
        Left = 312
        Top = 88
        Width = 73
        Height = 21
        TabOrder = 7
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrDesp: TRzNumericEdit
        Left = 312
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 8
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
      object edVlrProdutos: TRzNumericEdit
        Left = 408
        Top = 40
        Width = 73
        Height = 21
        TabOrder = 9
        IntegersOnly = False
        DisplayFormat = '0.00;(0.00)'
      end
    end
  end
  object mmObservacao: TMemo
    Left = 0
    Top = 333
    Width = 602
    Height = 87
    Align = alBottom
    TabOrder = 10
  end
  object dblcNatureza: TDBLookupComboBox
    Left = 152
    Top = 81
    Width = 74
    Height = 21
    KeyField = 'NATUREZA_SQ'
    ListField = 'CODIGO_NATUREZA'
    ListSource = dsListaNatEnt
    TabOrder = 4
    OnClick = dblcNaturezaClick
  end
  object DBEdit1: TDBEdit
    Left = 155
    Top = 113
    Width = 36
    Height = 21
    TabStop = False
    DataField = 'CFO'
    DataSource = dsListaNatEnt
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit2: TDBEdit
    Left = 291
    Top = 113
    Width = 72
    Height = 21
    TabStop = False
    DataField = 'ALIQ_ICMS'
    DataSource = dsListaNatEnt
    ReadOnly = True
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 451
    Top = 113
    Width = 72
    Height = 21
    TabStop = False
    DataField = 'ALIQ_IPI'
    DataSource = dsListaNatEnt
    ReadOnly = True
    TabOrder = 8
  end
  object dbldNatureza: TDBLookupComboBox
    Left = 232
    Top = 81
    Width = 314
    Height = 21
    KeyField = 'NATUREZA_SQ'
    ListField = 'DESCRICAO_NATUREZA'
    ListSource = dsListaNatEnt
    TabOrder = 5
    OnClick = dbldNaturezaClick
  end
  object edNrNfEnt: TRzEdit
    Left = 96
    Top = 16
    Width = 113
    Height = 21
    TabOrder = 0
  end
  object edDtNfEnt: TRzEdit
    Left = 280
    Top = 16
    Width = 97
    Height = 21
    TabOrder = 1
  end
  object edDtEntrada: TRzEdit
    Left = 448
    Top = 16
    Width = 97
    Height = 21
    TabStop = False
    Color = clInfoBk
    ReadOnly = True
    TabOrder = 12
  end
  object dsListaClientes: TDataSource
    Left = 552
    Top = 136
  end
  object dsListaNatEnt: TDataSource
    Left = 552
    Top = 192
  end
  object cdsItems: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 404
    Top = 361
    object cdsItemsnf_entrada_item_sq: TIntegerField
      FieldName = 'nf_entrada_item_sq'
    end
    object cdsItemsproduto_sq: TIntegerField
      FieldName = 'produto_sq'
    end
    object cdsItemscodigo_produto: TStringField
      DisplayWidth = 20
      FieldName = 'codigo_produto'
    end
    object cdsItemsdescricao_produto: TStringField
      FieldName = 'descricao_produto'
      Size = 50
    end
    object cdsItemsqtde: TIntegerField
      FieldName = 'qtde'
    end
    object cdsItemspreco: TBCDField
      FieldName = 'preco'
      Precision = 9
      Size = 2
    end
    object cdsItemsaliqIcms: TBCDField
      FieldName = 'aliqIcms'
      Precision = 9
      Size = 2
    end
    object cdsItemsaliqIpi: TBCDField
      FieldName = 'aliqIpi'
      Precision = 9
      Size = 2
    end
    object cdsItemsvlrIcms: TBCDField
      FieldName = 'vlrIcms'
      Precision = 9
      Size = 2
    end
    object cdsItemsvlrIpi: TBCDField
      FieldName = 'vlrIpi'
      Precision = 9
      Size = 2
    end
    object cdsItemsvlrTotal: TBCDField
      FieldName = 'vlrTotal'
      Precision = 9
      Size = 2
    end
    object cdsItemsqtde_estoque: TIntegerField
      FieldName = 'qtde_estoque'
    end
    object cdsItemscodigo_nbm: TStringField
      FieldName = 'codigo_nbm'
      Size = 10
    end
    object cdsItemsnumero_serie: TStringField
      FieldName = 'numero_serie'
      Size = 1000
    end
    object cdsItemsnumero_estoque: TIntegerField
      FieldName = 'numero_estoque'
    end
  end
  object dsItems: TDataSource
    DataSet = cdsItems
    Left = 448
    Top = 360
  end
end
