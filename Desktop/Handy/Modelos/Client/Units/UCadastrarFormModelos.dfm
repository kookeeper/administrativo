inherited FCadastrarFormModelos: TFCadastrarFormModelos
  Top = 284
  Caption = 'Cadastrar Modelos'
  ClientHeight = 203
  ClientWidth = 534
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 87
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 72
    Top = 56
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label4: TLabel [2]
    Left = 89
    Top = 88
    Width = 33
    Height = 13
    Caption = 'N.C.M.'
    FocusControl = DBLookupComboBox1
  end
  object Label6: TLabel [3]
    Left = 80
    Top = 120
    Width = 40
    Height = 13
    Caption = 'Unidade'
  end
  object Label7: TLabel [4]
    Left = 214
    Top = 88
    Width = 30
    Height = 13
    Caption = 'Marca'
  end
  object Label8: TLabel [5]
    Left = 176
    Top = 120
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o Unit'#225'rio'
  end
  inherited Panel1: TPanel
    Top = 173
    Width = 534
    TabOrder = 2
  end
  object edCodigo: TEdit
    Left = 128
    Top = 24
    Width = 129
    Height = 21
    TabOrder = 0
  end
  object edDescricao: TEdit
    Left = 128
    Top = 56
    Width = 329
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 128
    Top = 88
    Width = 74
    Height = 21
    KeyField = 'NBM_SQ'
    ListField = 'CODIGO_NBM'
    ListSource = DataSource1
    TabOrder = 3
  end
  object edMarca: TEdit
    Left = 248
    Top = 88
    Width = 137
    Height = 21
    TabOrder = 4
  end
  object edPreco: TEdit
    Left = 248
    Top = 120
    Width = 73
    Height = 21
    TabOrder = 5
  end
  object edUnidade: TEdit
    Left = 128
    Top = 120
    Width = 25
    Height = 21
    TabOrder = 6
  end
  object DataSource1: TDataSource
    DataSet = DMLista.cdsListaNBM
    Left = 472
    Top = 88
  end
end
