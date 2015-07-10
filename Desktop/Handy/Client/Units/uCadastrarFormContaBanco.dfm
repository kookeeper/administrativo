inherited FCadastrarFormContaBanco: TFCadastrarFormContaBanco
  Caption = 'Cadastrar conta banco'
  ClientHeight = 240
  ClientWidth = 254
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 38
    Top = 21
    Width = 31
    Height = 13
    Caption = 'Banco'
    FocusControl = edNome_banco
  end
  object Label3: TLabel [1]
    Left = 38
    Top = 69
    Width = 39
    Height = 13
    Caption = 'Ag'#234'ncia'
    FocusControl = edNome_agencia
  end
  object Label16: TLabel [2]
    Left = 38
    Top = 117
    Width = 28
    Height = 13
    Caption = 'Conta'
    FocusControl = edNumero_conta
  end
  inherited Panel1: TPanel
    Top = 210
    Width = 254
    inherited bbOk: TBitBtn
      Left = 93
    end
    inherited bbCancelar: TBitBtn
      Left = 173
    end
  end
  object edNome_banco: TRzEdit
    Left = 38
    Top = 37
    Width = 177
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 1
  end
  object edNome_agencia: TRzEdit
    Left = 38
    Top = 85
    Width = 177
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 2
  end
  object edNumero_conta: TRzEdit
    Left = 38
    Top = 133
    Width = 177
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 3
  end
end
