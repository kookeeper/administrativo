inherited FCadastrarFormTransportadoras: TFCadastrarFormTransportadoras
  Left = 304
  Top = 186
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Transportadoras'
  Caption = 'Cadastrar Transportadoras'
  ClientHeight = 185
  ClientWidth = 591
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 72
    Top = 16
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 229
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel [2]
    Left = 59
    Top = 80
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label4: TLabel [3]
    Left = 58
    Top = 112
    Width = 47
    Height = 13
    Caption = 'Munic'#237'pio'
  end
  object Label5: TLabel [4]
    Left = 320
    Top = 112
    Width = 33
    Height = 13
    Caption = 'Estado'
  end
  object Label6: TLabel [5]
    Left = 18
    Top = 48
    Width = 87
    Height = 13
    Caption = 'Inscri'#231#227'o Estadual'
  end
  object Label11: TLabel [6]
    Left = 294
    Top = 48
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  inherited Panel1: TPanel
    Top = 155
    Width = 591
    TabOrder = 9
    DesignSize = (
      591
      30)
    inherited bbOk: TBitBtn
      Left = 431
    end
    inherited bbCancelar: TBitBtn
      Left = 511
    end
  end
  object edCodigo: TRzEdit
    Left = 112
    Top = 16
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 15
    TabOrder = 0
  end
  object edNome: TRzEdit
    Left = 264
    Top = 16
    Width = 313
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 50
    TabOrder = 1
  end
  object edInscricao: TRzEdit
    Left = 112
    Top = 48
    Width = 137
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 20
    TabOrder = 2
  end
  object edEndereco: TRzEdit
    Left = 112
    Top = 80
    Width = 313
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 50
    TabOrder = 6
  end
  object edMunicipio: TRzEdit
    Left = 112
    Top = 112
    Width = 193
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 30
    TabOrder = 7
  end
  object edDDDFone: TRzEdit
    Left = 344
    Top = 48
    Width = 41
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 4
    TabOrder = 3
  end
  object edFone: TRzEdit
    Left = 392
    Top = 48
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 15
    TabOrder = 4
  end
  object edComplFone: TRzEdit
    Left = 504
    Top = 48
    Width = 73
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    MaxLength = 10
    TabOrder = 5
  end
  object cbEstado: TRzComboBox
    Left = 360
    Top = 112
    Width = 49
    Height = 21
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    MaxLength = 2
    ParentCtl3D = False
    TabOrder = 8
    Items.Strings = (
      'AC'
      'AL'
      'AM'
      'AP'
      'BA'
      'CE'
      'DF'
      'ES'
      'GO'
      'MA'
      'MG'
      'MS'
      'MT'
      'PA'
      'PB'
      'PE'
      'PI'
      'PR'
      'RJ'
      'RN'
      'RO'
      'RR'
      'RS'
      'SC'
      'SE'
      'SP'
      'TO')
  end
end
