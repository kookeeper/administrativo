inherited FCadastrarFormCartaCorrecao: TFCadastrarFormCartaCorrecao
  Left = 487
  Top = 296
  Caption = 'Cadastrar Carta de Corre'#231#227'o'
  ClientWidth = 588
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 16
    Width = 99
    Height = 13
    Caption = 'Nota fiscal eletr'#244'nica'
  end
  object Label2: TLabel [1]
    Left = 256
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Chave'
  end
  object Label4: TLabel [2]
    Left = 256
    Top = 48
    Width = 27
    Height = 13
    Caption = 'CNPJ'
  end
  object Label5: TLabel [3]
    Left = 16
    Top = 80
    Width = 102
    Height = 13
    Caption = 'Sequencia do evento'
  end
  object Label6: TLabel [4]
    Left = 256
    Top = 80
    Width = 74
    Height = 13
    Caption = 'Data do evento'
  end
  object Label7: TLabel [5]
    Left = 16
    Top = 112
    Width = 43
    Height = 13
    Caption = 'Corre'#231#227'o'
  end
  object Label8: TLabel [6]
    Left = 16
    Top = 48
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  inherited Panel1: TPanel
    Width = 588
    TabOrder = 7
    inherited bbOk: TBitBtn
      Left = 427
    end
    inherited bbCancelar: TBitBtn
      Left = 507
    end
  end
  object edChave: TRzEdit
    Left = 344
    Top = 16
    Width = 233
    Height = 21
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 2
  end
  object edCnpj: TRzEdit
    Left = 344
    Top = 48
    Width = 121
    Height = 21
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 3
  end
  object edDataEvento: TRzEdit
    Left = 344
    Top = 80
    Width = 121
    Height = 21
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 5
  end
  object edNFe: TRzNumericEdit
    Left = 128
    Top = 16
    Width = 121
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 0
    OnChange = edNFeChange
    DisplayFormat = ',0;(,0)'
  end
  object edSequenciaEvento: TRzNumericEdit
    Left = 128
    Top = 80
    Width = 121
    Height = 21
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 4
    DisplayFormat = ',0;(,0)'
  end
  object mmCorrecao: TRzMemo
    Left = 64
    Top = 112
    Width = 505
    Height = 193
    MaxLength = 1000
    TabOrder = 6
    FrameHotTrack = True
    FrameVisible = True
  end
  object dblEstado: TRzDBLookupComboBox
    Left = 72
    Top = 48
    Width = 177
    Height = 21
    Ctl3D = False
    KeyField = 'codigo_ibge'
    ListField = 'descricao_estado'
    ListSource = dsListaEstados
    ParentCtl3D = False
    TabOrder = 1
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
  end
  object dsListaEstados: TDataSource
    Left = 396
    Top = 224
  end
end
