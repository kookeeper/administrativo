object RegistrarVendaSenha: TRegistrarVendaSenha
  Left = 664
  Top = 227
  BorderStyle = bsDialog
  Caption = 'Libera'#231#227'o de desconto'
  ClientHeight = 105
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label54: TLabel
    Left = 8
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Vendedor'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object dblVendedor: TRzDBLookupComboBox
    Left = 8
    Top = 24
    Width = 314
    Height = 21
    Ctl3D = False
    KeyField = 'VENDEDOR_SQ'
    ListField = 'NOME_VENDEDOR'
    ListSource = dsListaVendedores
    ParentCtl3D = False
    TabOrder = 0
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
  end
  object edSenha: TRzEdit
    Left = 8
    Top = 72
    Width = 145
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    PasswordChar = '*'
    TabOrder = 1
  end
  object OKBtn: TButton
    Left = 208
    Top = 67
    Width = 57
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 272
    Top = 67
    Width = 57
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object dsListaVendedores: TDataSource
    Left = 488
    Top = 608
  end
end
