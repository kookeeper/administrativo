inherited FCadastrarListaAgenda: TFCadastrarListaAgenda
  Left = 179
  Top = 334
  Caption = 'Cadastrar Agenda'
  ClientWidth = 791
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited StringGrid_Old: TStringGrid
    Width = 791
  end
  inherited DBGrid1: TDBGrid
    Width = 791
  end
  inherited ToolBar1: TToolBar
    Width = 791
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
