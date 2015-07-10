inherited FCadastrarFormTipoCliente: TFCadastrarFormTipoCliente
  Caption = 'Cadastrar tipo de cliente'
  ClientHeight = 84
  ClientWidth = 415
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 21
    Top = 16
    Width = 48
    Height = 13
    Caption = 'Descri'#231'ao'
  end
  inherited Panel1: TPanel
    Top = 54
    Width = 415
    TabOrder = 1
    inherited bbOk: TBitBtn
      Left = 254
    end
    inherited bbCancelar: TBitBtn
      Left = 334
    end
  end
  object edDescricao: TRzEdit
    Left = 79
    Top = 16
    Width = 313
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 0
  end
end
