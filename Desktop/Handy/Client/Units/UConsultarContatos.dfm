object FConsultarContatos: TFConsultarContatos
  Left = 231
  Top = 158
  Width = 741
  Height = 508
  Caption = 'Consultar Contatos'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 129
    Width = 733
    Height = 293
    Align = alClient
    DataSource = dsListaContatos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnTitleClick = DBGrid1TitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME_CLIENTE'
        Title.Caption = 'Cliente'
        Width = 278
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_CONTATO'
        Title.Caption = 'Data'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'OBSERVACAO'
        Title.Caption = 'Observa'#231#227'o'
        Width = 500
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 733
    Height = 52
    Align = alBottom
    TabOrder = 1
    object bbFechar: TBitBtn
      Left = 647
      Top = 10
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 129
    Align = alTop
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Vendedor'
    end
    object Label2: TLabel
      Left = 286
      Top = 16
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object dblVendedor: TDBLookupListBox
      Left = 72
      Top = 16
      Width = 209
      Height = 95
      KeyField = 'VENDEDOR_SQ'
      ListField = 'NOME_VENDEDOR'
      ListSource = dsListaVendedores
      TabOrder = 0
      OnClick = dblVendedorClick
      OnKeyPress = dblVendedorKeyPress
    end
    object dblCliente: TDBLookupListBox
      Left = 328
      Top = 16
      Width = 393
      Height = 95
      KeyField = 'CLIENTE_SQ'
      ListField = 'NOME_CLIENTE'
      ListSource = dsListaClientes
      TabOrder = 1
      OnClick = dblClienteClick
      OnKeyPress = dblClienteKeyPress
    end
  end
  object dsListaVendedores: TDataSource
    Left = 136
    Top = 264
  end
  object dsListaClientes: TDataSource
    Left = 208
    Top = 264
  end
  object dsListaContatos: TDataSource
    Left = 288
    Top = 264
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 392
    Top = 224
  end
end
