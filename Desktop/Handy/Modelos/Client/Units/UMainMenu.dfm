object FMainMenu: TFMainMenu
  Left = 193
  Top = 123
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
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 686
    Height = 384
    Align = alClient
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 384
    Width = 686
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 100
      end
      item
        Width = 150
      end
      item
        Width = 110
      end
      item
        Width = 150
      end>
  end
  object MainMenu1: TMainMenu
    Left = 328
    Top = 80
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Atualizacoes1: TMenuItem
        Caption = 'Atualiza'#231#245'es'
        OnClick = Atualizacoes1Click
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
      object Naturezas1: TMenuItem
        Caption = 'Naturezas'
        OnClick = Naturezas1Click
      end
      object NCM1: TMenuItem
        Caption = 'NCM'
        OnClick = NCM1Click
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
      object Assistencias1: TMenuItem
        Caption = 'Assistencias'
        OnClick = Assistencias1Click
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object Duplicatas1: TMenuItem
        Caption = 'Duplicatas'
        OnClick = Duplicatas1Click
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
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object NotasFiscais3: TMenuItem
        Caption = 'Notas Fiscais de Demonstracao'
        OnClick = NotasFiscais3Click
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
        object PorEstado1: TMenuItem
          Caption = 'Por Estado'
          OnClick = PorEstado1Click
        end
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
      object NotasFiscais2: TMenuItem
        Caption = 'Notas Fiscais'
        OnClick = NotasFiscais2Click
      end
      object Pedidos2: TMenuItem
        Caption = 'Pedidos'
        OnClick = Pedidos2Click
      end
      object RelacaodeVendas1: TMenuItem
        Caption = 'Rela'#231#227'o de Vendas'
        OnClick = RelacaodeVendas1Click
      end
    end
  end
  object PJVersionInfo1: TPJVersionInfo
    Left = 152
    Top = 32
  end
end
