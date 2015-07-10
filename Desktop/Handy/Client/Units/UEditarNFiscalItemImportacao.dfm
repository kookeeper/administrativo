object FEditarNFiscalItemImportacao: TFEditarNFiscalItemImportacao
  Left = 352
  Top = 143
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar dados de importa'#231#227'o do item da nota fiscal'
  ClientHeight = 356
  ClientWidth = 556
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 8
    Width = 545
    Height = 177
    Caption = 'Declara'#231#227'o de Importa'#231#227'o (DI)'
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 24
      Width = 153
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nro do Doc. de Imp. DI/DSI/DA'
    end
    object Label2: TLabel
      Left = 20
      Top = 48
      Width = 152
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data de Registro da DI/DSI/DA'
    end
    object Label3: TLabel
      Left = 64
      Top = 72
      Width = 108
      Height = 13
      Alignment = taRightJustify
      Caption = 'Local de desembara'#231'o'
    end
    object Label4: TLabel
      Left = 13
      Top = 96
      Width = 159
      Height = 13
      Alignment = taRightJustify
      Caption = 'UF onde ocorreu o Desemb. Adu.'
    end
    object Label5: TLabel
      Left = 14
      Top = 120
      Width = 158
      Height = 13
      Alignment = taRightJustify
      Caption = 'Data do Desembara'#231'o Aduaneiro'
    end
    object Label6: TLabel
      Left = 71
      Top = 144
      Width = 101
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo do exportador'
    end
    object edNumeroDI: TRzEdit
      Left = 176
      Top = 24
      Width = 81
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      MaxLength = 10
      TabOrder = 0
    end
    object edLocalDesemb: TRzEdit
      Left = 176
      Top = 72
      Width = 361
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      MaxLength = 60
      TabOrder = 2
    end
    object edCodigoExportador: TRzEdit
      Left = 176
      Top = 144
      Width = 361
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      MaxLength = 60
      TabOrder = 5
    end
    object edDataDI: TRzDateTimeEdit
      Left = 176
      Top = 48
      Width = 89
      Height = 21
      Date = 40858.000000000000000000
      EditType = etDate
      Alignment = taRightJustify
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 1
    end
    object edDataDesemb: TRzDateTimeEdit
      Left = 176
      Top = 120
      Width = 89
      Height = 21
      EditType = etDate
      Alignment = taRightJustify
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 4
    end
    object edUFDesemb: TRzDBLookupComboBox
      Left = 176
      Top = 96
      Width = 177
      Height = 21
      Ctl3D = False
      KeyField = 'codigo_estado'
      ListField = 'descricao_estado'
      ListSource = dsListaEstados
      ParentCtl3D = False
      TabOrder = 3
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 192
    Width = 169
    Height = 129
    Caption = 'Imposto de Importa'#231#227'o'
    TabOrder = 1
    object Label7: TLabel
      Left = 45
      Top = 24
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base I.I.'
    end
    object Label13: TLabel
      Left = 16
      Top = 48
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr Desp. Adu.'
    end
    object Label16: TLabel
      Left = 57
      Top = 72
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr I.I.'
    end
    object Label21: TLabel
      Left = 43
      Top = 96
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr I.O.F.'
    end
    object edBaseIIItem: TRzNumericEdit
      Left = 88
      Top = 24
      Width = 73
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 0
      IntegersOnly = False
      DisplayFormat = ',0.00;(,0.00)'
    end
    object edVlrDespAduItem: TRzNumericEdit
      Left = 88
      Top = 48
      Width = 73
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 1
      IntegersOnly = False
      DisplayFormat = ',0.00;(,0.00)'
    end
    object edVlrIIItem: TRzNumericEdit
      Left = 88
      Top = 72
      Width = 73
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 2
      IntegersOnly = False
      DisplayFormat = ',0.00;(,0.00)'
    end
    object edVlrIOFItem: TRzNumericEdit
      Left = 88
      Top = 96
      Width = 73
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 3
      IntegersOnly = False
      DisplayFormat = ',0.00;(,0.00)'
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 556
    Height = 30
    Align = alBottom
    TabOrder = 3
    DesignSize = (
      556
      30)
    object bbOk: TBitBtn
      Left = 470
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOkClick
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
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 184
    Top = 192
    Width = 369
    Height = 129
    Caption = 'Adi'#231#227'o'
    TabOrder = 2
    object gridItemAdicao: TRzDBGrid
      Left = 1
      Top = 39
      Width = 367
      Height = 89
      Align = alClient
      DataSource = dsItemAdicao
      DefaultDrawing = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      QuickCompare.FieldValue = 1
      AltRowShading = False
      Columns = <
        item
          Expanded = False
          FieldName = 'numero_adicao'
          Title.Caption = 'N'#250'mero'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'numero_sequencial_adicao'
          Title.Caption = 'Sequ'#234'ncia'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_fabricante'
          Title.Caption = 'C'#243'd. fabricante'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'vlr_desc_adicao'
          Title.Caption = 'Vlr desconto'
          Visible = True
        end>
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 14
      Width = 367
      Height = 25
      AutoSize = True
      ButtonHeight = 21
      Caption = 'ToolBar1'
      TabOrder = 1
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
  end
  object dsListaEstados: TDataSource
    Left = 244
    Top = 72
  end
  object cdsItemAdicao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 256
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
  object dsItemAdicao: TDataSource
    DataSet = cdsItemAdicao
    Left = 304
    Top = 256
  end
end
