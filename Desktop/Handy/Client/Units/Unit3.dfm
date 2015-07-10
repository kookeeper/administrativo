object Form2: TForm2
  Left = 445
  Top = 145
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 135
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 513
    Height = 21
    TabOrder = 0
    Text = 
      'C:\Documents and Settings\Administrador\Meus documentos\Minhas i' +
      'magens\champion\'
  end
  object Button1: TButton
    Left = 16
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Local'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBImage1: TDBImage
    Left = 408
    Top = 272
    Width = 105
    Height = 105
    DataField = 'produto_imagem'
    DataSource = DataSource1
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 16
    Top = 48
    Width = 513
    Height = 21
    TabOrder = 3
    Text = 'http://www.magnumsa.com.br/imagens/'
  end
  object Button2: TButton
    Left = 96
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Web'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 176
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Thumbnails'
    TabOrder = 5
    OnClick = Button3Click
  end
  object DataSource1: TDataSource
    Left = 312
    Top = 288
  end
end
