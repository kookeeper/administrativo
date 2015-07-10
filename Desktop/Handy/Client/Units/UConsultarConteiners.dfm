object FConsultarConteiners: TFConsultarConteiners
  Left = 438
  Top = 157
  BorderStyle = bsSingle
  Caption = 'Consultar Conteiners'
  ClientHeight = 446
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 0
    Top = 169
    Width = 540
    Height = 13
    Align = alTop
    Caption = 'Observa'#231#227'o'
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 540
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Invoice Number'
    end
    object edCodigo: TRzEdit
      Left = 96
      Top = 8
      Width = 153
      Height = 21
      TabOrder = 0
      OnChange = edCodigoChange
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 540
    Height = 128
    Align = alTop
    DataSource = dsListaConteiner
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'invoice_number'
        Title.Caption = 'Invoice Number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_remessa'
        Title.Caption = 'Remessa'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_chegada'
        Title.Caption = 'Chegada'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 0
    Top = 271
    Width = 540
    Height = 145
    Align = alClient
    DataSource = dsListaConteinerItens
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
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
        FieldName = 'quantidade'
        Title.Caption = 'Quantidade'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 540
    Height = 30
    Align = alBottom
    TabOrder = 3
    object bbFechar: TBitBtn
      Left = 455
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
  end
  object DBMemo1: TDBMemo
    Left = 0
    Top = 182
    Width = 540
    Height = 89
    Align = alTop
    DataField = 'observacao'
    DataSource = dsListaConteiner
    TabOrder = 4
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 264
    Top = 72
  end
  object dsListaConteiner: TDataSource
    OnDataChange = dsListaConteinerDataChange
    Left = 424
    Top = 80
  end
  object dsListaConteinerItens: TDataSource
    Left = 424
    Top = 200
  end
end
