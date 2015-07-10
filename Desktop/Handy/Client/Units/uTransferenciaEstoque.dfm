object FTransferenciaEstoque: TFTransferenciaEstoque
  Left = 504
  Top = 159
  Width = 564
  Height = 418
  Caption = 'FTransferenciaEstoque'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 16
    Width = 37
    Height = 13
    Caption = 'Produto'
  end
  object Label2: TLabel
    Left = 48
    Top = 48
    Width = 88
    Height = 13
    Caption = 'Estoque de origem'
  end
  object Label3: TLabel
    Left = 48
    Top = 80
    Width = 91
    Height = 13
    Caption = 'Estoque de destino'
  end
  object lblQtde: TLabel
    Left = 48
    Top = 120
    Width = 133
    Height = 13
    Caption = 'Quantidade a ser transferida'
  end
  object lblNumeroSerie: TLabel
    Left = 48
    Top = 120
    Width = 155
    Height = 13
    Caption = 'N'#250'mero de s'#233'rie a ser transferido'
  end
  object Panel1: TPanel
    Left = 0
    Top = 361
    Width = 556
    Height = 30
    Align = alBottom
    TabOrder = 5
    DesignSize = (
      556
      30)
    object bbOk: TBitBtn
      Left = 360
      Top = 2
      Width = 86
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Transferir'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = bbOkClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      NumGlyphs = 2
    end
    object bbCancelar: TBitBtn
      Left = 464
      Top = 2
      Width = 86
      Height = 25
      Anchors = [akTop, akRight]
      TabOrder = 1
      Kind = bkCancel
    end
  end
  object listBoxNumerosSerie: TRzListBox
    Left = 48
    Top = 136
    Width = 473
    Height = 185
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 4
  end
  object comboNumeroEstoqueOrigem: TRzComboBox
    Left = 144
    Top = 48
    Width = 377
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 1
    OnChange = comboNumeroEstoqueOrigemChange
  end
  object comboNumeroEstoqueDestino: TRzComboBox
    Left = 144
    Top = 80
    Width = 377
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 2
  end
  object edProduto: TRzEdit
    Left = 144
    Top = 16
    Width = 377
    Height = 21
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 0
  end
  object edQtde: TRzNumericEdit
    Left = 208
    Top = 120
    Width = 97
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 3
    DisplayFormat = ',0;(,0)'
  end
  object dsListaProdutos: TDataSource
    Left = 256
    Top = 152
  end
end
