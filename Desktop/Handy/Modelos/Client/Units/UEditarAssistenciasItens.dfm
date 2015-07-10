object FEditarAssistenciasItens: TFEditarAssistenciasItens
  Left = 186
  Top = 274
  HelpType = htKeyword
  HelpKeyword = 'Itens das Assist'#234'ncias'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar '#205'tens das Assist'#234'ncias'
  ClientHeight = 126
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 112
    Top = 48
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Quantidade'
  end
  object Label5: TLabel
    Left = 12
    Top = 16
    Width = 37
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'Produto'
    FocusControl = DBLookupComboBox1
    OnClick = Label5Click
  end
  object Label2: TLabel
    Left = 200
    Top = 48
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  object Label14: TLabel
    Left = 288
    Top = 48
    Width = 39
    Height = 13
    Caption = 'Vlr Total'
  end
  object Panel1: TPanel
    Left = 0
    Top = 97
    Width = 474
    Height = 29
    Align = alBottom
    TabOrder = 5
    object bbOk: TBitBtn
      Left = 311
      Top = 2
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOkClick
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
    object bbCancelar: TBitBtn
      Left = 391
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 56
    Top = 16
    Width = 82
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'CODIGO_PRODUTO'
    ListSource = DataSource1
    TabOrder = 0
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 144
    Top = 16
    Width = 322
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'DESCRICAO_PRODUTO'
    ListSource = DataSource1
    TabOrder = 1
    OnClick = DBLookupComboBox2Click
  end
  object edQtde: TEdit
    Left = 112
    Top = 64
    Width = 73
    Height = 21
    TabOrder = 2
    OnExit = edQtdeExit
  end
  object edPreco: TEdit
    Left = 200
    Top = 64
    Width = 73
    Height = 21
    TabOrder = 3
    OnExit = edQtdeExit
  end
  object edVlrTotal: TEdit
    Left = 288
    Top = 64
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object DataSource1: TDataSource
    Left = 408
    Top = 24
  end
end
