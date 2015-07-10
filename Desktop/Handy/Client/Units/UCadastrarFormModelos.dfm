inherited FCadastrarFormModelos: TFCadastrarFormModelos
  Top = 284
  Caption = 'Cadastrar Modelos'
  ClientHeight = 146
  ClientWidth = 508
  OldCreateOrder = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 160
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Descri'#231#227'o'
  end
  object Label5: TLabel [2]
    Left = 16
    Top = 56
    Width = 35
    Height = 13
    Caption = 'Modelo'
  end
  inherited Panel1: TPanel
    Top = 116
    Width = 508
    TabOrder = 3
    DesignSize = (
      508
      30)
    inherited bbOk: TBitBtn
      Left = 349
    end
    inherited bbCancelar: TBitBtn
      Left = 429
    end
  end
  object edCodigo: TRzEdit
    Left = 16
    Top = 24
    Width = 129
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 0
  end
  object edDescricao: TRzEdit
    Left = 160
    Top = 24
    Width = 329
    Height = 21
    CharCase = ecUpperCase
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 1
  end
  object dblModelo: TRzDBLookupComboBox
    Left = 16
    Top = 72
    Width = 329
    Height = 21
    Ctl3D = False
    KeyField = 'MODELO_SQ'
    ListField = 'DESCRICAO_MODELO'
    ListSource = dsListaModelos
    ParentCtl3D = False
    TabOrder = 2
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
  end
  object dsListaModelos: TDataSource
    Left = 384
    Top = 328
  end
end
