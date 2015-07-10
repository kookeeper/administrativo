object fConsultarAlteracoes: TfConsultarAlteracoes
  Left = 294
  Top = 230
  Width = 558
  Height = 367
  Caption = 'fConsultarAlteracoes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 550
    Height = 333
    Align = alClient
    DataSource = dsListaHistAlteracoes
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA_ALTERACAO'
        Title.Caption = 'Data da Altera'#231#227'o'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME_USUARIO'
        Title.Caption = 'Usu'#225'rio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DescricaoTipo'
        Title.Caption = 'Tipo da Altera'#231#227'o'
        Width = 93
        Visible = True
      end>
  end
  object dsListaHistAlteracoes: TDataSource
    Left = 64
    Top = 48
  end
end
