object FPesquisarPedido: TFPesquisarPedido
  Left = 390
  Top = 110
  Width = 758
  Height = 350
  Caption = 'Pesquisar Pedido'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 286
    Width = 750
    Height = 30
    Align = alBottom
    TabOrder = 0
    DesignSize = (
      750
      30)
    object btnEscolher: TBitBtn
      Left = 589
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Escolher'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnEscolherClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0FFFFF
        FFFFFFFFF77FFFFFFFFFFFFFAAA0FFFFFFFFFFFF7777FFFFFFFFFFFFAAA0FFFF
        FFFFFFFF7777FFFFFFFFFFFAAAAA0FFFFFFFFFF777777FFFFFFFFFAAAAAA0FFF
        FFFFFF7777777FFFFFFFFAAA0FAAA0FFFFFFF7777F7777FFFFFFAA0FFFFAA0FF
        FFFF777FFFF777FFFFFFFFFFFFFAAA0FFFFFFFFFFFF7777FFFFFFFFFFFFFAA0F
        FFFFFFFFFFFF777FFFFFFFFFFFFFFAA0FFFFFFFFFFFFF777FFFFFFFFFFFFFFAA
        0FFFFFFFFFFFFF777FFFFFFFFFFFFFFAA0FFFFFFFFFFFFF777FFFFFFFFFFFFFF
        FAA0FFFFFFFFFFFFF777FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      NumGlyphs = 2
    end
    object btnCancelar: TBitBtn
      Left = 672
      Top = 2
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333000033338833333333333333333F333333333333
        0000333911833333983333333388F333333F3333000033391118333911833333
        38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
        911118111118333338F3338F833338F3000033333911111111833333338F3338
        3333F8330000333333911111183333333338F333333F83330000333333311111
        8333333333338F3333383333000033333339111183333333333338F333833333
        00003333339111118333333333333833338F3333000033333911181118333333
        33338333338F333300003333911183911183333333383338F338F33300003333
        9118333911183333338F33838F338F33000033333913333391113333338FF833
        38F338F300003333333333333919333333388333338FFF830000333333333333
        3333333333333333333888330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
  end
  object RzDBGrid1: TRzDBGrid
    Left = 0
    Top = 0
    Width = 750
    Height = 286
    Align = alClient
    DataSource = dsListaPedido
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
        FieldName = 'numero_pedido'
        Title.Caption = 'N'#250'mero'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data_pedido'
        Title.Caption = 'Data'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'vlr_total'
        Title.Caption = 'Total'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome_cliente'
        Title.Caption = 'Cliente'
        Width = 400
        Visible = True
      end>
  end
  object dsListaPedido: TDataSource
    Left = 144
    Top = 128
  end
end
