inherited FCadastrarFormProdutos: TFCadastrarFormProdutos
  Left = 307
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Produtos'
  Caption = 'Cadastrar Produtos'
  ClientHeight = 270
  ClientWidth = 588
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 7
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 192
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label4: TLabel [2]
    Left = 7
    Top = 48
    Width = 33
    Height = 13
    Caption = 'N.C.M.'
    FocusControl = DBLookupComboBox1
  end
  object Label5: TLabel [3]
    Left = 13
    Top = 80
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  object Label6: TLabel [4]
    Left = 328
    Top = 48
    Width = 40
    Height = 13
    Caption = 'Unidade'
  end
  object Label7: TLabel [5]
    Left = 134
    Top = 48
    Width = 30
    Height = 13
    Caption = 'Marca'
  end
  object Label8: TLabel [6]
    Left = 429
    Top = 48
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  inherited Panel1: TPanel
    Top = 240
    Width = 588
    TabOrder = 9
    inherited bbOk: TBitBtn
      Left = 423
    end
    inherited bbCancelar: TBitBtn
      Left = 503
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 48
    Top = 48
    Width = 74
    Height = 21
    KeyField = 'NBM_SQ'
    ListField = 'CODIGO_NBM'
    ListSource = DataSource1
    TabOrder = 2
  end
  object edCodigo: TEdit
    Left = 48
    Top = 16
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object edDescricao: TEdit
    Left = 248
    Top = 16
    Width = 329
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object edMarca: TEdit
    Left = 168
    Top = 48
    Width = 137
    Height = 21
    TabOrder = 3
  end
  object edPreco: TEdit
    Left = 504
    Top = 48
    Width = 73
    Height = 21
    TabOrder = 5
  end
  object edUnidade: TEdit
    Left = 376
    Top = 48
    Width = 25
    Height = 21
    TabOrder = 4
  end
  object rgTipoProduto: TRadioGroup
    Left = 16
    Top = 112
    Width = 185
    Height = 49
    Caption = 'Tipo do Produto'
    Columns = 2
    Items.Strings = (
      'Produto'
      'Pe'#231'a')
    TabOrder = 7
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 56
    Top = 80
    Width = 145
    Height = 21
    KeyField = 'MODELO_SQ'
    ListField = 'DESCRICAO_MODELO'
    ListSource = DataSource2
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 216
    Top = 80
    Width = 361
    Height = 145
    Caption = 'Estoque'
    TabOrder = 8
    object Label3: TLabel
      Left = 60
      Top = 16
      Width = 20
      Height = 13
      Alignment = taRightJustify
      Caption = 'Loja'
    end
    object Label10: TLabel
      Left = 37
      Top = 48
      Width = 43
      Height = 13
      Alignment = taRightJustify
      Caption = 'Armaz'#233'm'
    end
    object Label9: TLabel
      Left = 11
      Top = 80
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demonstra'#231#227'o'
    end
    object Label11: TLabel
      Left = 230
      Top = 16
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Defeito'
    end
    object Label12: TLabel
      Left = 227
      Top = 48
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Em Uso'
    end
    object Label13: TLabel
      Left = 183
      Top = 80
      Width = 81
      Height = 13
      Alignment = taRightJustify
      Caption = 'Back up (Cliente)'
    end
    object Label14: TLabel
      Left = 17
      Top = 112
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Demo Cliente'
    end
    object Label15: TLabel
      Left = 243
      Top = 112
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'HLC'
    end
    object edQtdeLoja: TEdit
      Left = 88
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 0
    end
    object edQtdeArmazem: TEdit
      Left = 88
      Top = 48
      Width = 73
      Height = 21
      TabOrder = 1
    end
    object edQtdeDemo: TEdit
      Left = 88
      Top = 80
      Width = 73
      Height = 21
      TabOrder = 2
    end
    object edQtdeDefeito: TEdit
      Left = 272
      Top = 16
      Width = 73
      Height = 21
      TabOrder = 4
    end
    object edQtdeEmUso: TEdit
      Left = 272
      Top = 48
      Width = 73
      Height = 21
      TabOrder = 5
    end
    object edQtdeBackup: TEdit
      Left = 272
      Top = 80
      Width = 73
      Height = 21
      TabOrder = 6
    end
    object edQtdeDemoCli: TEdit
      Left = 88
      Top = 112
      Width = 73
      Height = 21
      TabOrder = 3
    end
    object edQtdeHLC: TEdit
      Left = 272
      Top = 112
      Width = 73
      Height = 21
      TabOrder = 7
    end
  end
  object DataSource1: TDataSource
    DataSet = DMLista.cdsListaNBM
    Left = 80
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = DMLista.cdsListaModelos
    Left = 344
    Top = 32
  end
end
