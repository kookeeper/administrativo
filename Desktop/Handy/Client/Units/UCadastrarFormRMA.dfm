inherited FCadastrarFormRMA: TFCadastrarFormRMA
  Left = 401
  Top = 229
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Assistencias'
  Caption = 'Cadastrar R.M.A.'
  ClientHeight = 394
  ClientWidth = 527
  OldCreateOrder = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 364
    Width = 527
    TabOrder = 1
    DesignSize = (
      527
      30)
    inherited bbOk: TBitBtn
      Left = 335
    end
    inherited bbCancelar: TBitBtn
      Left = 415
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 527
    Height = 364
    ActivePage = TabSheet4
    Align = alClient
    TabOrder = 0
    object TabSheet4: TTabSheet
      Caption = 'Abertura'
      ImageIndex = 3
      object Label1: TLabel
        Left = 32
        Top = 16
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label4: TLabel
        Left = 416
        Top = 16
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cota'#231#227'o do Dolar'
      end
      object Label5: TLabel
        Left = 26
        Top = 64
        Width = 32
        Height = 13
        Cursor = crHandPoint
        Caption = 'Cliente'
        FocusControl = dblcCliente
        OnClick = Label5Click
      end
      object Label2: TLabel
        Left = 288
        Top = 16
        Width = 23
        Height = 13
        Caption = 'Data'
      end
      object Label17: TLabel
        Left = 160
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Data do Chamado'
      end
      object Label12: TLabel
        Left = 0
        Top = 96
        Width = 56
        Height = 13
        Caption = 'Cond.Pagto'
        FocusControl = dblcCondPagto
      end
      object Label13: TLabel
        Left = 10
        Top = 304
        Width = 39
        Height = 13
        Cursor = crHandPoint
        Caption = 'Tecnico'
        FocusControl = dblVendedor
        OnClick = Label5Click
      end
      object dblcCliente: TDBLookupComboBox
        Left = 64
        Top = 64
        Width = 129
        Height = 21
        KeyField = 'CLIENTE_SQ'
        ListField = 'CODIGO_CLIENTE'
        ListSource = DataSource1
        TabOrder = 4
        OnClick = dblcClienteClick
      end
      object dblnCliente: TDBLookupComboBox
        Left = 200
        Top = 64
        Width = 314
        Height = 21
        KeyField = 'CLIENTE_SQ'
        ListField = 'NOME_CLIENTE'
        ListSource = DataSource1
        TabOrder = 5
        OnClick = dblnClienteClick
      end
      object GroupBox1: TGroupBox
        Left = 48
        Top = 128
        Width = 201
        Height = 145
        Caption = 'Despesas'
        TabOrder = 8
        object Label3: TLabel
          Left = 32
          Top = 16
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Chamado'
        end
        object Label6: TLabel
          Left = 10
          Top = 40
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hora T'#233'c. Ad.'
        end
        object Label7: TLabel
          Left = 9
          Top = 64
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'Deslocamento'
        end
        object Label8: TLabel
          Left = 47
          Top = 88
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Pe'#231'as'
        end
        object Label9: TLabel
          Left = 42
          Top = 112
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'TOTAL'
        end
        object edDespChamado: TRzNumericEdit
          Left = 80
          Top = 16
          Width = 113
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 0
          OnExit = edDespChamadoExit
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edDespHTecAd: TRzNumericEdit
          Left = 80
          Top = 40
          Width = 113
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 1
          OnExit = edDespChamadoExit
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edDespDesloc: TRzNumericEdit
          Left = 80
          Top = 64
          Width = 113
          Height = 21
          Alignment = taLeftJustify
          TabOrder = 2
          OnExit = edDespChamadoExit
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edDespPecas: TRzNumericEdit
          Left = 80
          Top = 88
          Width = 113
          Height = 21
          Alignment = taLeftJustify
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 3
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
        object edDespTotal: TRzNumericEdit
          Left = 80
          Top = 112
          Width = 113
          Height = 21
          Alignment = taLeftJustify
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 4
          IntegersOnly = False
          DisplayFormat = ',0.00;(,0.00)'
        end
      end
      object GroupBox2: TGroupBox
        Left = 256
        Top = 128
        Width = 201
        Height = 145
        Caption = 'Interven'#231#227'o'
        TabOrder = 9
        object Label10: TLabel
          Left = 50
          Top = 16
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'In'#237'cio'
        end
        object Label11: TLabel
          Left = 39
          Top = 40
          Width = 38
          Height = 13
          Alignment = taRightJustify
          Caption = 'T'#233'rmino'
        end
        object Label14: TLabel
          Left = 42
          Top = 112
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'TOTAL'
        end
        object edHrInicio: TRzEdit
          Left = 80
          Top = 16
          Width = 113
          Height = 21
          TabOrder = 0
          OnExit = edHrInicioExit
        end
        object edHrFim: TRzEdit
          Left = 80
          Top = 40
          Width = 113
          Height = 21
          TabOrder = 1
          OnExit = edHrInicioExit
        end
        object edTempoTotal: TRzEdit
          Left = 80
          Top = 112
          Width = 113
          Height = 21
          TabOrder = 2
        end
      end
      object cbGarantia: TCheckBox
        Left = 56
        Top = 280
        Width = 97
        Height = 17
        Caption = 'Garantia'
        TabOrder = 10
      end
      object cbContrato: TCheckBox
        Left = 160
        Top = 280
        Width = 97
        Height = 17
        Caption = 'Contrato'
        TabOrder = 11
      end
      object dblcCondPagto: TDBLookupComboBox
        Left = 64
        Top = 96
        Width = 129
        Height = 21
        KeyField = 'COND_PAGTO_SQ'
        ListField = 'CODIGO_COND_PAGTO'
        ListSource = DataSource2
        TabOrder = 6
        OnClick = dblcCondPagtoClick
      end
      object dbldCondPagto: TDBLookupComboBox
        Left = 200
        Top = 96
        Width = 314
        Height = 21
        KeyField = 'COND_PAGTO_SQ'
        ListField = 'DESCRICAO_COND_PAGTO'
        ListSource = DataSource2
        TabOrder = 7
        OnClick = dbldCondPagtoClick
      end
      object dblVendedor: TDBLookupComboBox
        Left = 56
        Top = 304
        Width = 289
        Height = 21
        KeyField = 'VENDEDOR_SQ'
        ListField = 'NOME_VENDEDOR'
        ListSource = DataSource3
        TabOrder = 12
        OnClick = dblcClienteClick
      end
      object edNrAssistencia: TRzNumericEdit
        Left = 32
        Top = 32
        Width = 113
        Height = 21
        Alignment = taLeftJustify
        TabOrder = 0
        DisplayFormat = ',0;(,0)'
      end
      object edDtAssistencia: TRzDateTimeEdit
        Left = 288
        Top = 32
        Width = 113
        Height = 21
        EditType = etDate
        TabOrder = 2
      end
      object edDtChamado: TRzDateTimeEdit
        Left = 160
        Top = 32
        Width = 113
        Height = 21
        EditType = etDate
        TabOrder = 1
      end
      object edDolar: TRzNumericEdit
        Left = 416
        Top = 32
        Width = 97
        Height = 21
        Alignment = taLeftJustify
        TabOrder = 3
        OnExit = edDolarExit
        IntegersOnly = False
        DisplayFormat = ',0.00;(,0.00)'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Equipamentos'
      object ToolBar1: TToolBar
        Left = 0
        Top = 0
        Width = 519
        Height = 25
        AutoSize = True
        ButtonHeight = 21
        Caption = 'ToolBar1'
        TabOrder = 0
        object sbNovoEquip: TSpeedButton
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
          OnClick = sbNovoEquipClick
        end
        object sbEditarEquip: TSpeedButton
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
          OnClick = sbEditarEquipClick
        end
        object sbApagarEquip: TSpeedButton
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
          OnClick = sbApagarEquipClick
        end
      end
      object sgEquip: TStringGrid
        Left = 0
        Top = 25
        Width = 519
        Height = 311
        Align = alClient
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sbEditarEquipClick
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Pe'#231'as Aplicadas'
      ImageIndex = 4
      object ToolBar2: TToolBar
        Left = 0
        Top = 0
        Width = 519
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
      object sgItens: TStringGrid
        Left = 0
        Top = 25
        Width = 519
        Height = 311
        Align = alClient
        ColCount = 4
        DefaultRowHeight = 20
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
        TabOrder = 1
        OnDblClick = sbEditarItemClick
        RowHeights = (
          20
          20
          20
          20
          20)
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsListaClientes
    Left = 416
    Top = 88
  end
  object DataSource2: TDataSource
    DataSet = DM.cdsListaCondPagto
    Left = 472
    Top = 96
  end
  object DataSource3: TDataSource
    DataSet = DM.cdsListaVendedores
    Left = 224
    Top = 328
  end
end
