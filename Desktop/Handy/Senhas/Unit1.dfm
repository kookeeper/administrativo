object Form1: TForm1
  Left = 499
  Top = 207
  Width = 246
  Height = 161
  Caption = 'Form1'
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
  object Label1: TLabel
    Left = 27
    Top = 48
    Width = 52
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nova Data'
  end
  object Label2: TLabel
    Left = 29
    Top = 16
    Width = 50
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data Atual'
  end
  object btnOk: TButton
    Left = 64
    Top = 88
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 0
    OnClick = btnOkClick
  end
  object btnCancelar: TButton
    Left = 144
    Top = 88
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object dtpAtual: TDateTimePicker
    Left = 88
    Top = 16
    Width = 121
    Height = 21
    Date = 38364.030099756900000000
    Time = 38364.030099756900000000
    Enabled = False
    TabOrder = 2
  end
  object dtpNova: TDateTimePicker
    Left = 88
    Top = 48
    Width = 121
    Height = 21
    Date = 39057.030099756900000000
    Time = 39057.030099756900000000
    TabOrder = 3
  end
  object qrEmpresas: TQuery
    DatabaseName = 'DBConn'
    Left = 24
    Top = 72
  end
  object Database1: TDatabase
    AliasName = 'HD'
    DatabaseName = 'DBConn'
    LoginPrompt = False
    Params.Strings = (
      'DATABASE NAME='
      'USER NAME=avision'
      'ODBC DSN=HD'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'SQLQRYMODE='
      'LANGDRIVER='
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=64'
      'PASSWORD=avision')
    SessionName = 'Default'
    Left = 24
    Top = 24
  end
end
