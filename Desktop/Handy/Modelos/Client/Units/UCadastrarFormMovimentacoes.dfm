inherited FCadastrarFormMovimentacoes: TFCadastrarFormMovimentacoes
  Left = 361
  Top = 264
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Movimenta'#231#245'es'
  Caption = 'Cadastrar Movimenta'#231#245'es'
  ClientHeight = 342
  ClientWidth = 632
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 100
    Top = 192
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Quantidade'
  end
  object Label3: TLabel [1]
    Left = 275
    Top = 192
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor'
  end
  object Label4: TLabel [2]
    Left = 276
    Top = 160
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data'
  end
  object Label5: TLabel [3]
    Left = 102
    Top = 160
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nota Fiscal'
  end
  object Label7: TLabel [4]
    Left = 34
    Top = 64
    Width = 25
    Height = 13
    Alignment = taRightJustify
    Caption = 'Pe'#231'a'
  end
  object Label6: TLabel [5]
    Left = 114
    Top = 232
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nr. Serie'
  end
  object Label8: TLabel [6]
    Left = 415
    Top = 96
    Width = 42
    Height = 13
    Alignment = taRightJustify
    Caption = 'Estoque '
  end
  inherited Panel1: TPanel
    Top = 312
    Width = 632
    TabOrder = 11
    inherited bbOk: TBitBtn
      Left = 471
    end
    inherited bbCancelar: TBitBtn
      Left = 551
    end
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 72
    Top = 64
    Width = 145
    Height = 21
    KeyField = 'PECA_SQ'
    ListField = 'CODIGO_PECA'
    ListSource = DataSource1
    TabOrder = 1
    OnClick = DBLookupComboBox1Click
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 248
    Top = 64
    Width = 370
    Height = 21
    KeyField = 'PECA_SQ'
    ListField = 'DESCRICAO_PECA'
    ListSource = DataSource1
    TabOrder = 2
    OnClick = DBLookupComboBox2Click
  end
  object rgTipoMov: TRadioGroup
    Left = 176
    Top = 104
    Width = 217
    Height = 41
    Caption = 'Tipo de Movimenta'#231#227'o'
    Columns = 2
    Items.Strings = (
      'Entrada'
      'Sa'#237'da')
    TabOrder = 5
    TabStop = True
  end
  object edData: TEdit
    Left = 304
    Top = 160
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object edQtde: TEdit
    Left = 160
    Top = 192
    Width = 57
    Height = 21
    TabOrder = 8
  end
  object edValor: TEdit
    Left = 304
    Top = 192
    Width = 105
    Height = 21
    TabOrder = 9
  end
  object edNfiscal: TEdit
    Left = 160
    Top = 160
    Width = 105
    Height = 21
    TabOrder = 6
  end
  object DBEdit5: TDBEdit
    Left = 464
    Top = 96
    Width = 73
    Height = 21
    TabStop = False
    DataField = 'QTDE_PECA_LOJA'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 544
    Top = 96
    Width = 72
    Height = 21
    TabStop = False
    DataField = 'QTDE_PECA_ARMAZEM'
    DataSource = DataSource1
    TabOrder = 4
  end
  object mmNrSerie: TMemo
    Left = 160
    Top = 232
    Width = 369
    Height = 57
    TabOrder = 10
  end
  object rgTipoItem: TRadioGroup
    Left = 8
    Top = 8
    Width = 313
    Height = 41
    Caption = 'Tipo do Item'
    Columns = 2
    Items.Strings = (
      'Pe'#231'a/Acess'#243'rio'
      'Modelo')
    TabOrder = 0
    OnClick = rgTipoItemClick
  end
  object DataSource1: TDataSource
    DataSet = DMLista.cdsListaPecas
    Left = 552
    Top = 16
  end
end
