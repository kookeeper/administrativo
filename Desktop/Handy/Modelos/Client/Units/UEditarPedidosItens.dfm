object FEditarPedidosItens: TFEditarPedidosItens
  Left = 322
  Top = 151
  HelpType = htKeyword
  HelpKeyword = 'Itens dos Pedidos'
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Editar '#205'tens dos Pedidos'
  ClientHeight = 354
  ClientWidth = 595
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
    Left = 8
    Top = 16
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pedido'
  end
  object Label3: TLabel
    Left = 24
    Top = 280
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Quantidade'
  end
  object Label4: TLabel
    Left = 26
    Top = 112
    Width = 79
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero de S'#233'rie'
  end
  object Label5: TLabel
    Left = 132
    Top = 16
    Width = 37
    Height = 13
    Cursor = crHandPoint
    Alignment = taRightJustify
    Caption = 'Produto'
    FocusControl = DBLookupComboBox1
    OnClick = Label5Click
  end
  object Label8: TLabel
    Left = 136
    Top = 48
    Width = 33
    Height = 13
    Alignment = taRightJustify
    Caption = 'N.C.M.'
  end
  object Label2: TLabel
    Left = 104
    Top = 280
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  object Label6: TLabel
    Left = 184
    Top = 280
    Width = 61
    Height = 13
    Caption = 'Vlr Desconto'
  end
  object Label9: TLabel
    Left = 264
    Top = 280
    Width = 72
    Height = 13
    Caption = '% de Desconto'
  end
  object Label10: TLabel
    Left = 392
    Top = 48
    Width = 49
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aliq. ICMS'
  end
  object Label11: TLabel
    Left = 269
    Top = 48
    Width = 36
    Height = 13
    Alignment = taRightJustify
    Caption = 'Aliq. IPI'
  end
  object Label12: TLabel
    Left = 344
    Top = 280
    Width = 41
    Height = 13
    Caption = 'Vlr ICMS'
  end
  object Label13: TLabel
    Left = 424
    Top = 280
    Width = 28
    Height = 13
    Caption = 'Vlr IPI'
  end
  object Label14: TLabel
    Left = 504
    Top = 280
    Width = 68
    Height = 13
    Caption = 'Vlr Total s/ IPI'
  end
  object Label15: TLabel
    Left = 344
    Top = 240
    Width = 46
    Height = 13
    Caption = 'Aliq ICMS'
  end
  object Label16: TLabel
    Left = 424
    Top = 240
    Width = 33
    Height = 13
    Caption = 'Aliq IPI'
  end
  object Panel1: TPanel
    Left = 0
    Top = 325
    Width = 595
    Height = 29
    Align = alBottom
    TabOrder = 17
    object bbOk: TBitBtn
      Left = 431
      Top = 2
      Width = 75
      Height = 25
      Caption = 'OK'
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
      Left = 511
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 176
    Top = 16
    Width = 82
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'CODIGO_PRODUTO'
    ListSource = DataSource1
    TabOrder = 1
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 264
    Top = 16
    Width = 322
    Height = 21
    KeyField = 'PRODUTO_SQ'
    ListField = 'DESCRICAO_PRODUTO'
    ListSource = DataSource1
    TabOrder = 2
    OnClick = DBLookupComboBox2Click
  end
  object DBEdit2: TDBEdit
    Left = 176
    Top = 48
    Width = 80
    Height = 21
    TabStop = False
    DataField = 'CODIGO_NBM'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit9: TDBEdit
    Left = 448
    Top = 48
    Width = 65
    Height = 21
    TabStop = False
    DataField = 'ALIQ_ICMS'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit10: TDBEdit
    Left = 312
    Top = 48
    Width = 65
    Height = 21
    TabStop = False
    DataField = 'ALIQ_IPI'
    DataSource = DataSource1
    TabOrder = 4
  end
  object edPedido: TEdit
    Left = 48
    Top = 16
    Width = 73
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 0
  end
  object edQtde: TEdit
    Left = 24
    Top = 296
    Width = 73
    Height = 21
    TabOrder = 10
    OnExit = edQtdeExit
  end
  object edPreco: TEdit
    Left = 104
    Top = 296
    Width = 73
    Height = 21
    TabOrder = 11
    OnExit = edQtdeExit
  end
  object edVlrDesc: TEdit
    Left = 184
    Top = 296
    Width = 73
    Height = 21
    TabOrder = 12
    OnExit = edQtdeExit
  end
  object edPctDesc: TEdit
    Left = 264
    Top = 296
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 13
  end
  object edVlrIcms: TEdit
    Left = 344
    Top = 296
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 14
  end
  object edVlrIpi: TEdit
    Left = 424
    Top = 296
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 15
  end
  object edVlrTotal: TEdit
    Left = 504
    Top = 296
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 16
  end
  object mmSerie: TMemo
    Left = 24
    Top = 136
    Width = 553
    Height = 97
    TabOrder = 7
  end
  object edAliqICMS: TEdit
    Left = 344
    Top = 256
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 8
  end
  object edAliqIPI: TEdit
    Left = 424
    Top = 256
    Width = 73
    Height = 21
    ReadOnly = True
    TabOrder = 9
  end
  object GroupBox1: TGroupBox
    Left = 184
    Top = 72
    Width = 393
    Height = 57
    Caption = 'Estoque'
    TabOrder = 6
    object Label17: TLabel
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
    object Label18: TLabel
      Left = 136
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Demo.'
    end
    object Label19: TLabel
      Left = 200
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Defeito'
    end
    object Label20: TLabel
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
  object DataSource1: TDataSource
    Left = 144
    Top = 96
  end
end
