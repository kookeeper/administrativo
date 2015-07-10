inherited FCadastrarFormMovimentacoes: TFCadastrarFormMovimentacoes
  Left = 411
  Top = 135
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Movimenta'#231#245'es'
  Caption = 'Registrar altera'#231#245'es no estoque dos produtos'
  ClientHeight = 411
  ClientWidth = 560
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 24
    Top = 200
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor'
  end
  object Label5: TLabel [1]
    Left = 24
    Top = 152
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
    Left = 24
    Top = 296
    Width = 41
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nr. Serie'
  end
  object Label2: TLabel [4]
    Left = 189
    Top = 48
    Width = 39
    Height = 13
    Caption = 'Estoque'
  end
  object Label8: TLabel [5]
    Left = 24
    Top = 248
    Width = 26
    Height = 13
    Caption = 'Qtde.'
  end
  inherited Panel1: TPanel
    Top = 381
    Width = 560
    TabOrder = 7
    DesignSize = (
      560
      30)
    inherited bbOk: TBitBtn
      Left = 399
    end
    inherited bbCancelar: TBitBtn
      Left = 479
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
  end
  object mmNrSerie: TRzMemo
    Left = 24
    Top = 312
    Width = 529
    Height = 65
    TabOrder = 5
    FrameHotTrack = True
    FrameVisible = True
  end
  object edProduto: TRzEdit
    Left = 112
    Top = 16
    Width = 441
    Height = 21
    TabStop = False
    Color = clInfoBk
    FrameHotTrack = True
    FrameVisible = True
    ReadOnly = True
    TabOrder = 6
  end
  object edNfiscal: TRzNumericEdit
    Left = 24
    Top = 168
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 2
    DisplayFormat = ',0;(,0)'
  end
  object edValor: TRzNumericEdit
    Left = 24
    Top = 216
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 3
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edQtde: TRzNumericEdit
    Left = 24
    Top = 264
    Width = 57
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 4
    DisplayFormat = ',0;(,0)'
  end
  object listaEstoque: TRzListBox
    Left = 192
    Top = 64
    Width = 361
    Height = 241
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    TabOrder = 0
  end
end
