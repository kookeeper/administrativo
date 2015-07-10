object FMainMenu: TFMainMenu
  Left = 194
  Top = 153
  Width = 694
  Height = 449
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Menu Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sbAgenda: TSpeedButton
    Left = 392
    Top = 200
    Width = 23
    Height = 22
    Hint = 'Consulte sua agenda...'
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333FF3333333333333C0C333333333333F777F3333333333CC0F0C3
      333333333777377F33333333C30F0F0C333333337F737377F333333C00FFF0F0
      C33333F7773337377F333CC0FFFFFF0F0C3337773F33337377F3C30F0FFFFFF0
      F0C37F7373F33337377F00FFF0FFFFFF0F0C7733373F333373770FFFFF0FFFFF
      F0F073F33373F333373730FFFFF0FFFFFF03373F33373F333F73330FFFFF0FFF
      00333373F33373FF77333330FFFFF000333333373F333777333333330FFF0333
      3333333373FF7333333333333000333333333333377733333333333333333333
      3333333333333333333333333333333333333333333333333333}
    NumGlyphs = 2
    ParentShowHint = False
    ShowHint = True
    OnClick = sbAgendaClick
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 686
    Height = 376
    Align = alClient
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 376
    Width = 686
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 150
      end
      item
        Width = 110
      end
      item
        Width = 150
      end
      item
        Width = 50
      end>
    OnDrawPanel = StatusBar1DrawPanel
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 80
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Atualizacoes1: TMenuItem
        Caption = 'Atualiza'#231#245'es'
      end
      object MudaLogin1: TMenuItem
        Caption = 'Muda Login'
        OnClick = MudaLogin1Click
      end
      object Parametros2: TMenuItem
        Caption = 'Par'#226'metros'
        OnClick = Parametros2Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        ShortCut = 32883
        OnClick = Sair1Click
      end
    end
    object Parametros1: TMenuItem
      Caption = 'Par'#226'metros'
      object Acessos1: TMenuItem
        Caption = 'Acessos'
        OnClick = Acessos1Click
      end
      object Classificacao1: TMenuItem
        Caption = 'Classifica'#231#227'o'
        OnClick = Classificacao1Click
      end
      object CondicoesdePagamento1: TMenuItem
        Caption = 'Condi'#231#245'es de Pagamento'
        OnClick = CondicoesdePagamento1Click
      end
      object ContaBanco1: TMenuItem
        Caption = 'ContaBanco'
        OnClick = ContaBanco1Click
      end
      object Estados1: TMenuItem
        Caption = 'Estados'
        OnClick = Estados1Click
      end
      object Naturezas1: TMenuItem
        Caption = 'Naturezas'
        OnClick = Naturezas1Click
      end
      object NCM1: TMenuItem
        Caption = 'NCM'
        OnClick = NCM1Click
      end
      object ipodecliente1: TMenuItem
        Caption = 'Tipo de cliente'
        OnClick = ipodecliente1Click
      end
      object Transportadoras1: TMenuItem
        Caption = 'Transportadoras'
        OnClick = Transportadoras1Click
      end
      object Usuarios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usuarios1Click
      end
      object Vendedores1: TMenuItem
        Caption = 'Vendedores'
        OnClick = Vendedores1Click
      end
    end
    object Cadastrar1: TMenuItem
      Caption = 'Cadastrar'
      object Agenda1: TMenuItem
        Caption = 'Agenda'
        OnClick = Agenda1Click
      end
      object Balanco1: TMenuItem
        Caption = 'Balan'#231'o'
        OnClick = Balanco1Click
      end
      object CartaCorrecao1: TMenuItem
        Caption = 'Carta de Corre'#231#227'o'
        OnClick = CartaCorrecao1Click
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Contasapagar1: TMenuItem
        Caption = 'Contas a pagar'
        OnClick = Contasapagar1Click
      end
      object ContasapagarManuteno1: TMenuItem
        Caption = 'Contas a pagar - Manuten'#231#227'o'
        OnClick = ContasapagarManuteno1Click
      end
      object Conteiner1: TMenuItem
        Caption = 'Conteiner'
        OnClick = Conteiner1Click
      end
      object Duplicatas1: TMenuItem
        Caption = 'Duplicatas'
        OnClick = Duplicatas1Click
      end
      object Fornecedor1: TMenuItem
        Caption = 'Fornecedor'
        OnClick = Fornecedor1Click
      end
      object Modelos1: TMenuItem
        Caption = 'Modelos'
        OnClick = Modelos1Click
      end
      object Movimentacoes1: TMenuItem
        Caption = 'Movimenta'#231#245'es'
        OnClick = Movimentacoes1Click
      end
      object NotasFiscais1: TMenuItem
        Caption = 'Notas Fiscais'
        OnClick = NotasFiscais1Click
      end
      object NotasFiscaisdeEntrada1: TMenuItem
        Caption = 'Notas Fiscais de Entrada'
        OnClick = NotasFiscaisdeEntrada1Click
      end
      object NotasFiscaisdeServico1: TMenuItem
        Caption = 'Notas Fiscais de Servi'#231'o'
        OnClick = NotasFiscaisdeServico1Click
      end
      object Pedidos1: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos1Click
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
        OnClick = Produtos1Click
      end
      object RMA1: TMenuItem
        Caption = 'R.M.A.'
        OnClick = RMA1Click
      end
      object RegistrarVenda1: TMenuItem
        Caption = 'Registrar Venda'
        OnClick = RegistrarVenda1Click
      end
    end
    object Consultar1: TMenuItem
      Caption = 'Consultar'
      object Clientes3: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes3Click
      end
      object Contatos1: TMenuItem
        Caption = 'Contatos'
        OnClick = Contatos1Click
      end
      object Conteiners1: TMenuItem
        Caption = 'Conteiners'
        OnClick = Conteiners1Click
      end
      object EstoqueNmerodesrie1: TMenuItem
        Caption = 'Estoque (N'#250'mero de s'#233'rie)'
        OnClick = EstoqueNmerodesrie1Click
      end
      object ExportarRMA1: TMenuItem
        Caption = 'Exportar R.M.A.'
        OnClick = ExportarRMA1Click
      end
      object NotasFiscais3: TMenuItem
        Caption = 'Notas Fiscais de Demonstra'#231#227'o'
        OnClick = NotasFiscais3Click
      end
      object NrSerie1: TMenuItem
        Caption = 'Nr. Serie'
        OnClick = NrSerie1Click
      end
      object ProdutosFaltantes1: TMenuItem
        Caption = 'Produtos em Falta'
        OnClick = ProdutosFaltantes1Click
      end
      object Pedidossemestoque1: TMenuItem
        Caption = 'Pedidos sem estoque'
        OnClick = Pedidossemestoque1Click
      end
    end
    object Imprimir1: TMenuItem
      Caption = 'Imprimir'
      object Assistencias2: TMenuItem
        Caption = 'Assist'#234'ncias'
        OnClick = Assistencias2Click
      end
      object Clientes2: TMenuItem
        Caption = 'Clientes'
        object Historico1: TMenuItem
          Caption = 'Hist'#243'rico'
          OnClick = Historico1Click
        end
        object MalaDireta1: TMenuItem
          Caption = 'Mala Direta'
          OnClick = MalaDireta1Click
        end
        object Novos1: TMenuItem
          Caption = 'Novos'
          OnClick = Novos1Click
        end
        object PorEstado1: TMenuItem
          Caption = 'Por Estado'
          OnClick = PorEstado1Click
        end
      end
      object Comisso1: TMenuItem
        Caption = 'Comiss'#227'o'
        OnClick = Comisso1Click
      end
      object Demonstrao1: TMenuItem
        Caption = 'Demonstra'#231#227'o'
        OnClick = Demonstrao1Click
      end
      object Duplicatas2: TMenuItem
        Caption = 'Duplicatas'
        OnClick = Duplicatas2Click
      end
      object Estoque1: TMenuItem
        Caption = 'Estoque'
        OnClick = Estoque1Click
      end
      object FechamentodeNotas1: TMenuItem
        Caption = 'Fechamento de Notas'
        OnClick = FechamentodeNotas1Click
      end
      object Movimentaodeestoque1: TMenuItem
        Caption = 'Movimenta'#231#227'o de estoque'
        OnClick = Movimentaodeestoque1Click
      end
      object NotasFiscaisEletrnicas1: TMenuItem
        Caption = 'Notas Fiscais Eletr'#244'nicas'
        OnClick = NotasFiscaisEletrnicas1Click
      end
      object Pedidos2: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos2Click
      end
      object RelacaodeVendas1: TMenuItem
        Caption = 'Rela'#231#227'o de Vendas'
        OnClick = RelacaodeVendas1Click
      end
      object RelacaodeVendaAcumulado1: TMenuItem
        Caption = 'Rela'#231#227'o de Venda Acumulado'
        OnClick = RelacaodeVendaAcumulado1Click
      end
      object SugestaodeCompras1: TMenuItem
        Caption = 'Sugest'#227'o de Compras'
        OnClick = SugestaodeCompras1Click
      end
    end
  end
  object PJVersionInfo1: TPJVersionInfo
    Left = 152
    Top = 32
  end
  object RzBalloonHints1: TRzBalloonHints
    Bitmaps.TransparentColor = clOlive
    CenterThreshold = 0
    FrameColor = cl3DDkShadow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clInfoText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 232
    Top = 208
  end
end
