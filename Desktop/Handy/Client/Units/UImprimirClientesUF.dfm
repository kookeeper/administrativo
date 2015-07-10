object FImprimirClientesUF: TFImprimirClientesUF
  Left = 219
  Top = 224
  BorderStyle = bsSingle
  Caption = 'Imprime Clientes por Estado'
  ClientHeight = 365
  ClientWidth = 731
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 335
    Width = 731
    Height = 30
    Align = alBottom
    TabOrder = 1
    object Label8: TLabel
      Left = 152
      Top = 4
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object bbImprimir: TBitBtn
      Left = 559
      Top = 2
      Width = 79
      Height = 25
      Caption = 'Imprimir'
      Default = True
      TabOrder = 0
      OnClick = bbImprimirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
    object bbFechar: TBitBtn
      Left = 647
      Top = 2
      Width = 75
      Height = 25
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
    object bbMapa: TBitBtn
      Left = 8
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Mapa'
      TabOrder = 2
      Visible = False
      OnClick = bbMapaClick
      Glyph.Data = {
        B2050000424DB205000000000000360400002800000012000000130000000100
        0800000000007C010000C40E0000C40E00000001000000010000EAC18500EDC9
        9500EDCA9700EAC28700ECC79000EDCB9900ECC99400ECC79100EDCC9A00EBC5
        8D00ECC89300E9C08300EAC28600EBC48B00ECC68F00EECD9C00EDCA9600EAC3
        8800EECD9D00EECE9E00ECC89200E9BF8100EECC9B00EECFA000EECE9F00E9BE
        7F00EFCFA100EAC38900E8BD7D00EAC18400E9C08200EBC48A00EBC68E00EBC5
        8E00EAC08400EBC48C00EBC38900E9BF8000E9BF8200EDCB9800E9BE8000EBC5
        8C00EFD0A2006B102200E9BE7E00E8BD7E00E8BD7C00FFFEFE00E8BC7C00FEFB
        F700F2D9B400FDF8F100FBF4EA00F8EBD800F0D3A800FDFAF500F6E5CC00FEFD
        FB00FFFEFD00FEFCF900F9EEDE00FAF2E500F4DFC000FCF5EC00F1D6AE00FCF6
        ED00F3DCBA00FEFDFC00F2D8B200F3DBB800F7E7D000FDF9F300FCF5EB00FCF7
        EF00F3DDBC00F8ECD900F5E1C400F5E3C800EFD0A300FAF0E100F7E8D200FBF2
        E600FDFAF600F9EDDC00FBF3E700FAEFE000F9ECDA00F4DEBE00F0D4AA00FEFD
        FA00FAF1E300F1D7AF00FFFEFC00F1D5AD00FCF7F000F6E5CB00FDF9F400F7E7
        CF00F9EFDF00F6E6CD00F1D8B200FBF3E800EFD1A400F8EAD600FAF0E200F5E3
        C700F9EDDB00FEFCF800EFD1A500F8EAD500F6E4CA00F5E2C600F5E2C500F2DA
        B600F1D5AC00F4DDBC00FCF6EE00F7E8D100FAF1E400F7E9D300FEFCFA00F1D7
        B100EED0A100F0D2A600F0D2A700F6E6CE00F4E0C200F8E9D400F0D5AC00FEFB
        F600ECC99500F6E4C900F7E9D400F0D4AB00F6E4CB00EFD2A600F7E6CE00F3DC
        B900F5E2C700F2D7B100EECFA100F1D6AD00F4E0C100EDC99600FDF9F200F3DE
        BD00FCF8F000EFD0A400EED0A200F2DBB700F2DAB500F3DBB700F3DAB700F4E1
        C300EECF9F00EDCD9C00EAC28800F5E0C300F0D4A900EECC9A00EFD1A300F0D1
        A600EDCB9700FCF7EE00EDCC9B00ECC79200F1D4AB00FBF4E800F5E1C300E8BC
        7B00F0D2A500EBC38A00EDCD9B00F2DAB700EDCC9900ECCA9600EFCFA000ECC6
        9000EECD9E00ECCA9500F1D4AA00F4E0C300E8BE7F00EAC48A00ECC99300EBC5
        8B00EBC68D00EFCF9F00FBFBFB00FBF3E600F9ECDB00EAC48B00EECE9D00EBC7
        8F00E8BE7E00EECEA000EFCFA200F5E0C200F8ECDA00EFD2A500F3DAB600ECC8
        9100EAC18700EAC08100E9BF7F00EAC48900EDCA9800EAC08200ECC68E00E9C0
        8400FEFEFC00EAC48C00EFCEA000E8BE8000EAC18300EDC99400EBC69000ECC8
        9400EFCE9F00E9BE8100EECB9800EECD9B00ECC68D00E9C08100EAC38700EECC
        9C00F0D4AC00EBC28800F9EEDC00F6E7CF00EDCB9A00ECCA9700FEFEFD00ECC5
        8E00FAF0E300ECC58D00EECB9A00EECC9900F7E6CF00EBC48D00EAC28900EAC2
        8500EDC89300ECC89500FEFCFB00EDC99300FCFCFC00EDCA9900F9EFE000F6E3
        C700EFCE9E00EBC38800F2D9B600F5E4C900FDF7EF00FFFFFF00FFFFFFFFFFFF
        FFFFFF6DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6DE76DFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF6DD5A9A96DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7
        8D4AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA9CAFAFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF8DE7FAE7FA4A6DFFFFFFFFFFFFFFFFFFFFFFFFFACAA99DA99DFA
        D56DFFFFFFFFFFFFFFFFFFFFFF4AA9E78D4AFAE7FAE7FFFFFFFFFFFFFFFFFFFF
        FFFA9DFACAA99DA9D5A9FFFFFFFFFFFFFFFFFFFFFAE7FAE7FAE7FAE7FAE7FFFF
        FFFFFFFFFFFF9DA99DA9CAA9E7FA9DA9D5A99DFFFFFFFF4AFAFFA9E7FAD5FAE7
        FAE78D4AA9E7A9FFFFFF9DA99DA99DFA9DFAFAFA9DFA9DFA9DFA9DFAFFFF6DE7
        FAE7FAE7FAE7FAE7FAE7FAE7FAE7FA4AFFFFFF6DE7A9CAFAE7A9CAA9E7A99DA9
        D5A93FFFFFFFFFFFA9E7A9E7A9E7FAE76DE7A9E5FFFFFFFFFFFFFFFFD5A9D5FA
        9DA9D5A99D6DFFFFFFFFFFFFFFFFFFFF6DFF6DA98DFF6D4AFAFFFFFFFFFFFFFF
        FFFFFFFFFFFF3F9D9DFFFFFF3FFFFFFFFFFFFFFFFFFF}
    end
    object dblEstado: TRzDBLookupComboBox
      Left = 192
      Top = 4
      Width = 177
      Height = 21
      Ctl3D = False
      KeyField = 'codigo_estado'
      ListField = 'descricao_estado'
      ListSource = dsListaEstados
      ParentCtl3D = False
      TabOrder = 3
      OnClick = dblEstadoClick
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
    end
    object btnExportar: TBitBtn
      Left = 472
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 4
      OnClick = btnExportarClick
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 731
    Height = 335
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Rela'#231#227'o 1'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 723
        Height = 307
        Align = alClient
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO_CLIENTE'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Title.Caption = 'Valor'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'QTDE'
            Title.Caption = 'Qtde.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA'
            Title.Caption = 'Data'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Rela'#231#227'o 2'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 723
        Height = 307
        Align = alClient
        DataSource = DataSource1
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
            FieldName = 'CODIGO_CLIENTE'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENDERECO'
            Title.Caption = 'Endere'#231'o'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPL_ENDERECO'
            Title.Caption = 'Compl.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BAIRRO'
            Title.Caption = 'Bairro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Title.Caption = 'C.E.P.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CIDADE'
            Title.Caption = 'Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Title.Caption = 'Estado'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAIS'
            Title.Caption = 'Pais'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DDD_FONE1'
            Title.Caption = 'DDD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_FONE1'
            Title.Caption = 'Telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPL_FONE1'
            Title.Caption = 'Compl.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Title.Caption = 'Contato'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'E_MAIL'
            Title.Caption = 'e_mail'
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Rela'#231#227'o3'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 723
        Height = 307
        Align = alClient
        DataSource = DataSource1
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
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Title.Caption = 'Contato'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DDD_FONE1'
            Title.Caption = 'DDD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUMERO_FONE1'
            Title.Caption = 'Telefone'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPL_FONE1'
            Title.Caption = 'Compl.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'E_MAIL'
            Title.Caption = 'e_mail'
            Visible = True
          end>
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DM.cdsImprClientesUF
    Left = 472
    Top = 208
  end
  object dsListaEstados: TDataSource
    Left = 588
    Top = 296
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Excel Files|*.xls'
    Left = 328
    Top = 288
  end
end
