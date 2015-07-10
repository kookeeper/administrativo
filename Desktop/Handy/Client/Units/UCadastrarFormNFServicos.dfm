inherited FCadastrarFormNFServicos: TFCadastrarFormNFServicos
  Left = 344
  Top = 338
  Caption = 'Cadastrar Notas Fiscais de Servi'#231'os'
  ClientHeight = 225
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 40
    Top = 24
    Width = 108
    Height = 13
    Caption = 'N'#250'mero da Nota Fiscal'
  end
  object Label2: TLabel [1]
    Left = 302
    Top = 24
    Width = 94
    Height = 13
    Caption = 'Data da Nota Fiscal'
  end
  object Label3: TLabel [2]
    Left = 60
    Top = 56
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object Label4: TLabel [3]
    Left = 171
    Top = 88
    Width = 65
    Height = 13
    Caption = 'Total da Nota'
  end
  object Label5: TLabel [4]
    Left = 168
    Top = 120
    Width = 68
    Height = 13
    Caption = 'Al'#237'q. I.S.S. (%)'
  end
  object Label6: TLabel [5]
    Left = 168
    Top = 152
    Width = 68
    Height = 13
    Caption = 'Valor do I.S.S.'
  end
  inherited Panel1: TPanel
    Top = 195
    TabOrder = 6
  end
  object dblCliente: TDBLookupComboBox
    Left = 96
    Top = 56
    Width = 425
    Height = 21
    KeyField = 'CLIENTE_SQ'
    ListField = 'NOME_CLIENTE'
    ListSource = dsListaClientes
    TabOrder = 2
  end
  object edNumero: TRzEdit
    Left = 152
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edData: TRzEdit
    Left = 400
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edTotal: TRzNumericEdit
    Left = 240
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 3
    OnExit = edAliqISSExit
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edAliqISS: TRzNumericEdit
    Left = 240
    Top = 120
    Width = 81
    Height = 21
    TabOrder = 4
    OnExit = edAliqISSExit
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edVlrISS: TRzNumericEdit
    Left = 240
    Top = 152
    Width = 121
    Height = 21
    TabOrder = 5
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object dsListaClientes: TDataSource
    Left = 472
    Top = 120
  end
end
