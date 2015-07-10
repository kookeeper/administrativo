object FCadastrarListaComum: TFCadastrarListaComum
  Left = 257
  Top = 149
  Align = alClient
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 348
  ClientWidth = 616
  Color = clBtnFace
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 616
    Height = 323
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = sbEditarClick
    OnKeyDown = FormKeyDown
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 616
    Height = 25
    AutoSize = True
    ButtonHeight = 21
    Caption = 'ToolBar1'
    TabOrder = 1
    object sbNovo: TSpeedButton
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
      OnClick = sbNovoClick
    end
    object sbEditar: TSpeedButton
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
      OnClick = sbEditarClick
    end
    object sbApagar: TSpeedButton
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
      OnClick = sbApagarClick
    end
    object sbSair: TSpeedButton
      Left = 84
      Top = 2
      Width = 29
      Height = 21
      Hint = 'Sair'
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00330000000000
        03333377777777777F333301BBBBBBBB033333773F3333337F3333011BBBBBBB
        0333337F73F333337F33330111BBBBBB0333337F373F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F337F33337F333301110BBBBB0333337F337FF3337F33330111B0BBBB
        0333337F337733337F333301110BBBBB0333337F337F33337F333301110BBBBB
        0333337F3F7F33337F333301E10BBBBB0333337F7F7F33337F333301EE0BBBBB
        0333337F777FFFFF7F3333000000000003333377777777777333}
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      OnClick = sbSairClick
    end
    object SpeedButton1: TSpeedButton
      Left = 113
      Top = 2
      Width = 23
      Height = 21
      Enabled = False
      Flat = True
    end
    object SpeedButton2: TSpeedButton
      Left = 136
      Top = 2
      Width = 23
      Height = 21
      Enabled = False
      Flat = True
    end
    object SpeedButton3: TSpeedButton
      Left = 159
      Top = 2
      Width = 23
      Height = 21
      Enabled = False
      Flat = True
    end
    object Label1: TLabel
      Left = 182
      Top = 2
      Width = 40
      Height = 21
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '  Ordem '
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object cbOrdem: TComboBox
      Left = 222
      Top = 2
      Width = 107
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnKeyDown = FormKeyDown
      OnKeyPress = edFiltroKeyPress
    end
    object Label2: TLabel
      Left = 329
      Top = 2
      Width = 32
      Height = 21
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = '  Filtro'
      ParentBiDiMode = False
      Layout = tlCenter
    end
    object cbFiltro: TComboBox
      Left = 361
      Top = 2
      Width = 104
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      OnKeyDown = FormKeyDown
      OnKeyPress = edFiltroKeyPress
    end
    object edFiltro: TEdit
      Left = 465
      Top = 2
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnKeyDown = FormKeyDown
      OnKeyPress = edFiltroKeyPress
    end
    object sbFiltro: TSpeedButton
      Left = 586
      Top = 2
      Width = 23
      Height = 21
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
      OnClick = sbFiltroClick
    end
  end
  object StringGrid1: TStringGrid
    Left = 0
    Top = 25
    Width = 616
    Height = 323
    Align = alClient
    ColCount = 2
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedHorzLine, goDrawFocusSelected, goColSizing, goColMoving, goRowSelect]
    TabOrder = 2
    OnDblClick = StringGrid1DblClick
    OnDrawCell = StringGrid1DrawCell
    OnKeyDown = FormKeyDown
    OnKeyPress = StringGrid1KeyPress
  end
  object DataSource1: TDataSource
    Left = 104
    Top = 64
  end
  object cdsLista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLista'
    ReadOnly = True
    RemoteServer = DMLista.SCServerLista
    Left = 32
    Top = 64
  end
end
