object FImprimirNfiscaisFech: TFImprimirNfiscaisFech
  Left = 455
  Top = 137
  Width = 545
  Height = 444
  Caption = 'Imprimir Fechamentos de Notas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 537
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 14
      Top = 8
      Width = 27
      Height = 13
      Caption = 'In'#237'cio'
    end
    object Label4: TLabel
      Left = 166
      Top = 8
      Width = 38
      Height = 13
      Caption = 'T'#233'rmino'
    end
    object dtpInicio: TDateTimePicker
      Left = 54
      Top = 8
      Width = 98
      Height = 21
      Date = 38586.414024375000000000
      Time = 38586.414024375000000000
      TabOrder = 0
      OnChange = dtpInicioChange
    end
    object dtpFim: TDateTimePicker
      Left = 214
      Top = 8
      Width = 98
      Height = 21
      Date = 38586.414024375000000000
      Time = 38586.414024375000000000
      TabOrder = 1
      OnChange = dtpInicioChange
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 380
    Width = 537
    Height = 30
    Align = alBottom
    TabOrder = 2
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 52
      Height = 13
      Caption = 'Qtde. Itens'
    end
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
    object lbValor: TLabel
      Left = 224
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
    object Label6: TLabel
      Left = 168
      Top = 9
      Width = 51
      Height = 13
      Caption = 'Valor Total'
    end
    object bbImprimir: TBitBtn
      Left = 375
      Top = 2
      Width = 75
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
      Left = 455
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
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 41
    Width = 537
    Height = 339
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'Notas Fiscais Fatura'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 311
        Align = alClient
        DataSource = dsImprNfFech
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
            FieldName = 'numero_nfe'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cfo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao_natureza_nfiscal'
            Title.Caption = 'Natureza Fiscal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_produtos'
            Title.Caption = 'Vlr Produtos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_total'
            Title.Caption = 'Vlr Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_icms'
            Title.Caption = 'Vlr ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vlr_ipi'
            Title.Caption = 'Vlr IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome_cliente'
            Title.Caption = 'Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ent_sai'
            Title.Caption = 'Ent / Sai'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'tipo_nfiscal'
            Title.Caption = 'Tipo Nfiscal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cancelada'
            Title.Caption = 'Cancelada'
            Visible = True
          end>
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Notas Fiscais de Clientes'
      ImageIndex = 2
      object DBGrid3: TDBGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 283
        Align = alClient
        DataSource = dsImprNFClientes
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
            FieldName = 'NFISCAL'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CFO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_NATUREZA_NFISCAL'
            Title.Caption = 'Natureza Fiscal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_PRODUTOS'
            Title.Caption = 'Vlr Produtos'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_TOTAL'
            Title.Caption = 'Vlr Total'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ICMS'
            Title.Caption = 'Vlr ICMS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_IPI'
            Title.Caption = 'Vlr IPI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Cliente'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENT_SAI'
            Title.Caption = 'Ent / Sai'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_NFISCAL'
            Title.Caption = 'Tipo Nfiscal'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANCELADA'
            Title.Caption = 'Cancelada'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Notas Fiscais de Servi'#231'os'
      ImageIndex = 1
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 529
        Height = 283
        Align = alClient
        DataSource = dsImprNFServicos
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
            FieldName = 'NUMERO_NF_SERVICO'
            Title.Caption = 'N'#250'mero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DATA_NF_SERVICO'
            Title.Caption = 'Data'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TTL_NF_SERVICO'
            Title.Caption = 'Total da Nota'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQ_ISS_NF_SERVICO'
            Title.Caption = 'Aliq. ISS'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VLR_ISS_NF_SERVICO'
            Title.Caption = 'Vlr. ISS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_CLIENTE'
            Title.Caption = 'Cliente'
            Width = 64
            Visible = True
          end>
      end
    end
  end
  object dsImprNfFech: TDataSource
    Left = 672
    Top = 128
  end
  object dsImprNFServicos: TDataSource
    DataSet = DM.cdsImprNFServicos
    Left = 672
    Top = 240
  end
  object dsImprNFClientes: TDataSource
    Left = 672
    Top = 184
  end
end
