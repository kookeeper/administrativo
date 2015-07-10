inherited FCadastrarListaPedidos: TFCadastrarListaPedidos
  Left = 320
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Pedidos'
  Caption = 'Cadastrar Pedidos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited ToolBar1: TToolBar
    object cbAberto: TCheckBox
      Left = 531
      Top = 2
      Width = 118
      Height = 21
      Caption = 'Apenas pendentes'
      TabOrder = 2
      OnClick = cbAbertoClick
    end
  end
  object cdsListaPedidosItens: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspLista'
    ReadOnly = True
    RemoteServer = DM.SCServer
    StoreDefs = True
    Left = 48
    Top = 184
  end
end
