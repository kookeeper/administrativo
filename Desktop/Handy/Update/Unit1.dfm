object Form2: TForm2
  Left = 778
  Top = 519
  Width = 238
  Height = 101
  Caption = 'Atualiza'#231#245'es'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object IdTrivialFTP1: TIdTrivialFTP
    Port = 212
    ReceiveTimeout = 4000
    Left = 168
    Top = 16
  end
  object SCServer: TSocketConnection
    ServerGUID = '{A655A3E7-D825-4A1B-BE06-453254930503}'
    ServerName = 'PrServer.Server'
    Host = '127.0.0.1'
    Left = 96
    Top = 16
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 24
    Top = 16
  end
end
