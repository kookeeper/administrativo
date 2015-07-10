object FEditarNFiscaisItens: TFEditarNFiscaisItens
  Left = 224
  Top = 168
  HelpType = htKeyword
  HelpKeyword = 'Itens das Notas Fiscais'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar '#205'tens das Notas Fiscais'
  ClientHeight = 237
  ClientWidth = 709
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
  object Label1: TLabel
    Left = 232
    Top = 8
    Width = 43
    Height = 13
    Caption = 'N.Fiscais'
  end
  object Label14: TLabel
    Left = 200
    Top = 40
    Width = 13
    Height = 13
    Caption = 'CL'
  end
  object Label15: TLabel
    Left = 216
    Top = 40
    Width = 48
    Height = 13
    Caption = 'Sit. Tribut.'
  end
  object Label16: TLabel
    Left = 328
    Top = 40
    Width = 32
    Height = 13
    Caption = 'Quant.'
  end
  object Label17: TLabel
    Left = 336
    Top = 80
    Width = 62
    Height = 13
    Caption = 'Vlr Unit c. IPI'
  end
  object Label18: TLabel
    Left = 472
    Top = 40
    Width = 51
    Height = 13
    Caption = 'Valor Total'
  end
  object Label19: TLabel
    Left = 544
    Top = 40
    Width = 26
    Height = 13
    Caption = 'ICMS'
  end
  object Label20: TLabel
    Left = 584
    Top = 40
    Width = 13
    Height = 13
    Caption = 'IPI'
  end
  object Label23: TLabel
    Left = 405
    Top = 104
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero de S'#233'rie'
  end
  object Label24: TLabel
    Left = 64
    Top = 40
    Width = 76
    Height = 13
    Cursor = crHandPoint
    Caption = 'C'#243'digo do Prod.'
    FocusControl = DBLookupComboBox1
    OnClick = Label24Click
  end
  object Label25: TLabel
    Left = 64
    Top = 88
    Width = 91
    Height = 13
    Caption = 'Descri'#231#227'o do Prod.'
    FocusControl = DBLookupComboBox2
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 20
    Height = 13
    Caption = 'Item'
  end
  object Label3: TLabel
    Left = 400
    Top = 40
    Width = 61
    Height = 13
    Caption = 'Vlr Unit s. IPI'
  end
  object Label9: TLabel
    Left = 288
    Top = 40
    Width = 25
    Height = 13
    Caption = 'Unid.'
  end
  object Label10: TLabel
    Left = 496
    Top = 80
    Width = 41
    Height = 13
    Caption = 'Vlr ICMS'
  end
  object Panel1: TPanel
    Left = 0
    Top = 207
    Width = 709
    Height = 30
    Align = alBottom
    TabOrder = 17
    object bbOk: TBitBtn
      Left = 551
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
      Left = 631
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
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
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 64
    Top = 56
    Width = 137
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'CODIGO_PRODUTO'
    ListSource = DataSource1
    TabOrder = 2
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 64
    Top = 104
    Width = 273
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'DESCRICAO_PRODUTO'
    ListSource = DataSource1
    TabOrder = 3
    OnClick = DBLookupComboBox2Click
  end
  object edNfiscal: TEdit
    Left = 280
    Top = 8
    Width = 73
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object edItem: TEdit
    Left = 16
    Top = 56
    Width = 48
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 1
  end
  object edClass: TEdit
    Left = 200
    Top = 56
    Width = 16
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 4
  end
  object edStrib: TEdit
    Left = 216
    Top = 56
    Width = 72
    Height = 21
    TabOrder = 5
  end
  object edQtde: TEdit
    Left = 328
    Top = 56
    Width = 72
    Height = 21
    TabOrder = 7
    OnExit = edQtdeExit
  end
  object edPreco: TEdit
    Left = 400
    Top = 80
    Width = 73
    Height = 21
    TabOrder = 9
    OnExit = edQtdeExit
  end
  object edVlrTotal: TEdit
    Left = 472
    Top = 56
    Width = 72
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 10
  end
  object edAliqICMS: TEdit
    Left = 544
    Top = 56
    Width = 40
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 11
    OnExit = edQtdeExit
  end
  object edVlrICMS: TEdit
    Left = 544
    Top = 80
    Width = 73
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 12
  end
  object edAliqIPI: TEdit
    Left = 584
    Top = 56
    Width = 40
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 13
  end
  object edVlrIPI: TEdit
    Left = 624
    Top = 56
    Width = 73
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 14
  end
  object mmNrSerie: TMemo
    Left = 408
    Top = 120
    Width = 289
    Height = 73
    TabOrder = 16
  end
  object edPrecoSIpi: TEdit
    Left = 400
    Top = 56
    Width = 72
    Height = 21
    ReadOnly = True
    TabOrder = 8
    OnExit = edPrecoSIpiExit
  end
  object GroupBox1: TGroupBox
    Left = 14
    Top = 136
    Width = 393
    Height = 57
    Caption = 'Estoque'
    TabOrder = 15
    object Label4: TLabel
      Left = 8
      Top = 16
      Width = 20
      Height = 13
      Caption = 'Loja'
    end
    object Label7: TLabel
      Left = 72
      Top = 16
      Width = 43
      Height = 13
      Caption = 'Armaz'#233'm'
    end
    object Label5: TLabel
      Left = 136
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Demo.'
    end
    object Label6: TLabel
      Left = 200
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Defeito'
    end
    object Label8: TLabel
      Left = 264
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Em Uso'
    end
    object Label21: TLabel
      Left = 328
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Backup'
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'QTDE_PRODUTO_LOJA'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit1: TDBEdit
      Left = 72
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'QTDE_PRODUTO_ARMAZEM'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 136
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'QTDE_PRODUTO_DEMO'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit5: TDBEdit
      Left = 200
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'QTDE_PRODUTO_DEFEITO'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit6: TDBEdit
      Left = 264
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'QTDE_PRODUTO_EM_USO'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit7: TDBEdit
      Left = 328
      Top = 32
      Width = 57
      Height = 21
      TabStop = False
      DataField = 'QTDE_PRODUTO_BACKUP'
      DataSource = DataSource1
      TabOrder = 5
    end
  end
  object edUnid: TEdit
    Left = 288
    Top = 56
    Width = 40
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object DataSource1: TDataSource
    Left = 488
    Top = 104
  end
end
