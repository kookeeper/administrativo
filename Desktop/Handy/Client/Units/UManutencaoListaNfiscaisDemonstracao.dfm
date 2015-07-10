inherited FManutencaoListaNFiscaisDemonstracao: TFManutencaoListaNFiscaisDemonstracao
  Left = 268
  Top = 144
  Caption = 'Manuten'#231#227'o nas Notas Fiscais de Demonstra'#231#227'o'
  ClientWidth = 740
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StringGrid_Old: TStringGrid
    Width = 740
    ParentFont = False
  end
  inherited DBGrid1: TDBGrid
    Width = 740
  end
  inherited ToolBar1: TToolBar
    Width = 740
    inherited sbNovo: TSpeedButton
      Enabled = False
    end
    inherited sbApagar: TSpeedButton
      Enabled = False
    end
    inherited edFiltro: TRzEdit
      ParentFont = False
    end
    object cbAberto: TCheckBox
      Left = 531
      Top = 2
      Width = 74
      Height = 21
      Caption = 'Em Aberto'
      TabOrder = 2
      OnClick = cbAbertoClick
    end
  end
end
