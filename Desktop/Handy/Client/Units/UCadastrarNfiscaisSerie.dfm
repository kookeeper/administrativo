object FCadastrarNfiscaisSerie: TFCadastrarNfiscaisSerie
  Left = 258
  Top = 352
  BorderStyle = bsSingle
  Caption = 'Cadastrar N'#250'mero de S'#233'rie'
  ClientHeight = 329
  ClientWidth = 747
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbNfiscal: TLabel
    Left = 8
    Top = 16
    Width = 62
    Height = 13
    Caption = 'Nota Fiscal - '
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 44
    Width = 747
    Height = 255
    Align = alBottom
    DataSource = dsListaNfiscaisItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ITEM'
        Title.Caption = 'Item'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CODIGO_PRODUTO'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_PRODUTO'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTDE_ITEM'
        Title.Caption = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NR_SERIE_ITEM'
        Title.Caption = 'N'#250'mero de S'#233'rie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLR_TOTAL_ITEM'
        Title.Caption = 'Total do Item'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 299
    Width = 747
    Height = 30
    Align = alBottom
    TabOrder = 1
    object bbFechar: TBitBtn
      Left = 663
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = '&Fechar'
      ModalResult = 2
      TabOrder = 0
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
      Left = 583
      Top = 2
      Width = 75
      Height = 25
      TabOrder = 1
      Kind = bkOK
    end
  end
  object dsListaNfiscaisItens: TDataSource
    Left = 528
    Top = 168
  end
end
