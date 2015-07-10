object FSugestaoCompras: TFSugestaoCompras
  Left = 394
  Top = 99
  Width = 870
  Height = 640
  Caption = 'FSugestaoCompras'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 121
    Width = 862
    Height = 485
    Align = alClient
    DataSource = dsSugestaoCompra
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo_produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao_produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estoque_total'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sugestao'
        Title.Caption = 'Sugest'#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde1'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde2'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde3'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde4'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde5'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde6'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde7'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde8'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde9'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde10'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde11'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde12'
        Width = 60
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 862
    Height = 121
    Align = alTop
    TabOrder = 0
    object rgMeses: TRadioGroup
      Left = 8
      Top = 8
      Width = 185
      Height = 105
      Caption = 'Meses para c'#225'lculo'
      Columns = 4
      ItemIndex = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12')
      TabOrder = 0
      OnClick = rgMesesClick
    end
    object rgSugestao: TRadioGroup
      Left = 200
      Top = 8
      Width = 185
      Height = 105
      Caption = 'Compra para'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Uma semana'
        '15 dias'
        'Um m'#234's'
        'Dois meses')
      TabOrder = 1
      OnClick = rgMesesClick
    end
    object rgTipo: TRadioGroup
      Left = 392
      Top = 72
      Width = 265
      Height = 41
      Caption = 'Tipo do Item'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Produto'
        'Pe'#231'a de Reposi'#231#227'o')
      TabOrder = 2
      OnClick = rgMesesClick
    end
    object pnLinha: TPanel
      Left = 393
      Top = 17
      Width = 296
      Height = 28
      Align = alCustom
      BevelOuter = bvNone
      TabOrder = 3
    end
  end
  object dsSugestaoCompra: TDataSource
    Left = 224
    Top = 272
  end
end
