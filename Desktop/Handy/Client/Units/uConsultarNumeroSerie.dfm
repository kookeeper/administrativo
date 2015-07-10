object FConsultarNumeroSerie: TFConsultarNumeroSerie
  Left = 427
  Top = 231
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta n'#250'mero de s'#233'rie'
  ClientHeight = 400
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 370
    Width = 609
    Height = 30
    Align = alBottom
    TabOrder = 2
    DesignSize = (
      609
      30)
    object lbItens: TLabel
      Left = 64
      Top = 8
      Width = 17
      Height = 13
      Caption = '    '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Qtde. Itens'
    end
    object bbCancelar: TBitBtn
      Left = 527
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 446
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = '&Exportar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        6E040000424D6E04000000000000360000002800000014000000120000000100
        1800000000003804000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000
        0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000
        0000000000000000000000000000000000000000004080404080404080404080
        40000000FFFFFFFFFFFFFFFFFFFFFFFF00000080A06080A06080A06080A06080
        A06080A06080A06080A06000000040804080A04040E020FFFFFF000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080A0404080404080404080404080
        4040804000000040804080A04040E020FFFFFF000000FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000080A040408040408040408040000000
        40804080A04040E020FFFFFF000000408040000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFF00000080A04040804000000040804080A04040
        E020FFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF00000000000040804080A04040E020FFFFFF0000
        00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF00000040804080A04040E020FFFFFF000000000000FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF00000040804080A04040E020FFFFFF00000040804080A060000000FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000408040
        80A04040E020FFFFFF00000080A04040804040804080A060000000FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000040804080A04040E020FF
        FFFF000000FFFFFF00000080A04040804040804080A060000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFF000000FFFF
        FFFFFFFFFFFFFF00000080A04080A04080A04080A040000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
  end
  object RzDBGrid1: TRzDBGrid
    Left = 0
    Top = 97
    Width = 609
    Height = 273
    Align = alClient
    DataSource = dsListaEstoque
    DefaultDrawing = True
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = RzDBGrid1DblClick
    QuickCompare.FieldValue = 1
    AltRowShading = False
    Columns = <
      item
        Expanded = False
        FieldName = 'data_ultima_entrada'
        Title.Caption = 'Entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero_nf_ent'
        Title.Caption = 'NF entrada'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_ultima_saida'
        Title.Caption = 'Sa'#237'da'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero_nfe'
        Title.Caption = 'NFe saida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao_produto'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero_serie'
        Title.Caption = 'N'#250'mero de s'#233'rie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero_estoque'
        Title.Caption = 'Estoque'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_cliente'
        Title.Caption = 'Cliente'
        Visible = True
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 609
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 72
      Width = 77
      Height = 13
      Caption = 'N'#250'mero de s'#233'rie'
    end
    object comboProduto: TRzDBLookupComboBox
      Left = 88
      Top = 8
      Width = 377
      Height = 21
      Ctl3D = False
      Enabled = False
      KeyField = 'PRODUTO_SQ'
      ListField = 'CODIGO_PRODUTO;DESCRICAO_PRODUTO'
      ListSource = dsListaProdutos
      ParentCtl3D = False
      TabOrder = 1
      OnClick = cbProdutoClick
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
    end
    object comboNumeroEstoque: TRzComboBox
      Left = 88
      Top = 40
      Width = 377
      Height = 21
      Style = csDropDownList
      Ctl3D = False
      Enabled = False
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 3
      OnChange = cbProdutoClick
    end
    object cbProduto: TRzCheckBox
      Left = 16
      Top = 8
      Width = 65
      Height = 17
      Cursor = crHandPoint
      Caption = 'Produto'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 0
      OnClick = cbProdutoClick
    end
    object cbEstoque: TRzCheckBox
      Left = 16
      Top = 40
      Width = 65
      Height = 17
      Caption = 'Estoque'
      HotTrack = True
      State = cbUnchecked
      TabOrder = 2
      OnClick = cbProdutoClick
    end
    object edNumeroSerie: TRzEdit
      Left = 104
      Top = 72
      Width = 201
      Height = 21
      FrameHotTrack = True
      FrameVisible = True
      TabOrder = 4
      OnChange = cbProdutoClick
    end
    object cbEmEstoque: TRzCheckBox
      Left = 312
      Top = 72
      Width = 81
      Height = 17
      Caption = 'Em estoque'
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbProdutoClick
    end
    object rgCampoPesquisa: TRzRadioGroup
      Left = 472
      Top = 8
      Width = 129
      Height = 57
      Caption = 'Pesquisar produto por...'
      ItemIndex = 0
      Items.Strings = (
        'C'#243'digo'
        'Descri'#231#227'o')
      TabOrder = 6
      OnClick = rgCampoPesquisaClick
    end
  end
  object dsListaEstoque: TDataSource
    Left = 360
    Top = 144
  end
  object dsListaProdutos: TDataSource
    Left = 256
    Top = 144
  end
end
