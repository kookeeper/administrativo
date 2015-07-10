inherited FManutencaoListaNFiscaisDemonstracao: TFManutencaoListaNFiscaisDemonstracao
  Caption = 'Manuten'#231#227'o nas Notas Fiscais de Demonstra'#231#227'o'
  ClientWidth = 662
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited DBGrid1: TDBGrid
    Width = 662
  end
  inherited ToolBar1: TToolBar
    Width = 662
    inherited sbNovo: TSpeedButton
      Enabled = False
    end
    inherited sbApagar: TSpeedButton
      Enabled = False
    end
    inherited edFiltro: TEdit
      ParentFont = False
    end
    object cbAberto: TCheckBox
      Left = 609
      Top = 2
      Width = 97
      Height = 21
      Caption = 'Em Aberto'
      TabOrder = 3
      OnClick = cbAbertoClick
    end
  end
  inherited StringGrid1: TStringGrid
    Width = 662
    ParentFont = False
  end
end
