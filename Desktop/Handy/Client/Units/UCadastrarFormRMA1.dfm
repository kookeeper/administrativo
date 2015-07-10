inherited FCadastrarFormRMA1: TFCadastrarFormRMA1
  Left = 405
  Top = 346
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Assistencias'
  Caption = 'Cadastrar R.M.A. - Modelo 1'
  ClientHeight = 217
  ClientWidth = 527
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 187
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
    object btnImportar: TBitBtn
      Left = 7
      Top = 2
      Width = 178
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Importar informa'#231#245'es da NF'
      TabOrder = 2
      OnClick = btnImportarClick
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 527
    Height = 187
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
      object Label5: TLabel
        Left = 10
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
        Width = 89
        Height = 13
        Caption = 'Data da Execu'#231#227'o'
      end
      object Label17: TLabel
        Left = 160
        Top = 16
        Width = 86
        Height = 13
        Caption = 'Data do Chamado'
      end
      object Label13: TLabel
        Left = 2
        Top = 96
        Width = 39
        Height = 13
        Cursor = crHandPoint
        Caption = 'Tecnico'
        FocusControl = dblVendedor
        OnClick = Label5Click
      end
      object dblcCliente: TDBLookupComboBox
        Left = 48
        Top = 64
        Width = 129
        Height = 21
        KeyField = 'CLIENTE_SQ'
        ListField = 'CODIGO_CLIENTE'
        ListSource = dsListaClientes
        TabOrder = 3
        OnClick = dblcClienteClick
      end
      object dblnCliente: TDBLookupComboBox
        Left = 184
        Top = 64
        Width = 314
        Height = 21
        KeyField = 'CLIENTE_SQ'
        ListField = 'NOME_CLIENTE'
        ListSource = dsListaClientes
        TabOrder = 4
        OnClick = dblnClienteClick
      end
      object cbGarantia: TCheckBox
        Left = 48
        Top = 128
        Width = 97
        Height = 17
        Caption = 'Garantia'
        TabOrder = 5
      end
      object cbFrete: TCheckBox
        Left = 152
        Top = 128
        Width = 49
        Height = 17
        Caption = 'Frete'
        TabOrder = 6
      end
      object dblVendedor: TDBLookupComboBox
        Left = 48
        Top = 96
        Width = 289
        Height = 21
        KeyField = 'VENDEDOR_SQ'
        ListField = 'NOME_VENDEDOR'
        ListSource = dsListaVendedores
        TabOrder = 7
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
        Height = 134
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
        Height = 134
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
  object dsListaClientes: TDataSource
    Left = 440
    Top = 56
  end
  object dsListaVendedores: TDataSource
    Left = 368
    Top = 64
  end
end
