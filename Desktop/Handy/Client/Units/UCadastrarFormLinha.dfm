inherited FCadastrarFormLinha: TFCadastrarFormLinha
  Caption = 'Cadastrar linha'
  ClientHeight = 90
  ClientWidth = 461
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 26
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Descri'#231'ao'
  end
  inherited Panel1: TPanel
    Top = 60
    Width = 461
    TabOrder = 1
    inherited bbOk: TBitBtn
      Left = 300
    end
    inherited bbCancelar: TBitBtn
      Left = 380
    end
  end
  object edDescricao: TRzEdit
    Left = 88
    Top = 16
    Width = 353
    Height = 21
    TabOrder = 0
  end
  object cbExclusiva: TRzCheckBox
    Left = 88
    Top = 40
    Width = 115
    Height = 17
    Caption = 'Exclusiva'
    HotTrack = True
    State = cbUnchecked
    TabOrder = 2
  end
end
