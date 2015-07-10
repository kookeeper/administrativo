inherited FCadastrarFormEstoque: TFCadastrarFormEstoque
  Left = 282
  Caption = 'Incluir item no estoque'
  ClientWidth = 565
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 24
    Top = 256
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor'
  end
  object Label5: TLabel [1]
    Left = 24
    Top = 208
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nota Fiscal'
  end
  object Label7: TLabel [2]
    Left = 24
    Top = 16
    Width = 76
    Height = 13
    Alignment = taRightJustify
    Caption = 'Item do estoque'
  end
  object Label6: TLabel [3]
    Left = 192
    Top = 104
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nr. Serie'
  end
  object Label1: TLabel [4]
    Left = 192
    Top = 48
    Width = 39
    Height = 13
    Alignment = taRightJustify
    Caption = 'Estoque'
  end
  object Label2: TLabel [5]
    Left = 24
    Top = 160
    Width = 110
    Height = 13
    Caption = 'Data da movimenta'#231#227'o'
  end
  object sbIncluir: TSpeedButton [6]
    Left = 496
    Top = 96
    Width = 23
    Height = 22
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000E0000000E0000000100
      0400000000007000000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3300333333333333330033333333333333003333300033333300333330F03333
      3300333330F033333300330000F000033300330FFFFFFF033300330000F00003
      3300333330F033333300333330F0333333003333300033333300333333333333
      33003333333333333300}
    OnClick = sbIncluirClick
  end
  object sbExcluir: TSpeedButton [7]
    Left = 520
    Top = 96
    Width = 23
    Height = 22
    Glyph.Data = {
      E6000000424DE60000000000000076000000280000000E0000000E0000000100
      0400000000007000000000000000000000001000000000000000000000000000
      BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3300333333333333330033333333333333003333333333333300333333333333
      330033333333333333003300000000003300330FFFFFFFF03300330000000000
      3300333333333333330033333333333333003333333333333300333333333333
      33003333333333333300}
    OnClick = sbExcluirClick
  end
  inherited Panel1: TPanel
    Width = 565
    TabOrder = 7
    DesignSize = (
      565
      30)
    inherited bbOk: TBitBtn
      Left = 404
    end
    inherited bbCancelar: TBitBtn
      Left = 484
    end
  end
  object rgTipoMov: TRzRadioGroup
    Left = 24
    Top = 48
    Width = 145
    Height = 89
    Alignment = taRightJustify
    Caption = 'Tipo de Movimenta'#231#227'o'
    ItemHotTrack = True
    ItemHeight = 28
    ItemIndex = 0
    Items.Strings = (
      'Entrada no estoque'
      'Sa'#237'da do estoque')
    ParentColor = True
    StartYPos = 12
    TabOrder = 1
    TabStop = True
    WinMaskColor = clLime
    OnClick = rgTipoMovClick
  end
  object edProduto: TRzEdit
    Left = 112
    Top = 16
    Width = 441
    Height = 21
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 0
  end
  object edNfiscal: TRzNumericEdit
    Left = 24
    Top = 224
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 5
    DisplayFormat = ',0;(,0)'
  end
  object edValor: TRzNumericEdit
    Left = 24
    Top = 272
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 6
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object listBoxNumerosSerie: TRzListBox
    Left = 192
    Top = 120
    Width = 361
    Height = 185
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    TabOrder = 3
  end
  object comboNumeroEstoque: TRzComboBox
    Left = 192
    Top = 64
    Width = 361
    Height = 21
    Style = csDropDownList
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 2
    OnChange = comboNumeroEstoqueChange
  end
  object edDtMovimento: TRzDateTimeEdit
    Left = 24
    Top = 176
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 4
  end
end
