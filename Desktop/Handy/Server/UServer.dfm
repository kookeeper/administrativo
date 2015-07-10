object FServer: TFServer
  Left = 574
  Top = 151
  Width = 445
  Height = 160
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMinimized
  PixelsPerInch = 96
  TextHeight = 13
  object IdTrivialFTPServer1: TIdTrivialFTPServer
    Active = True
    Bindings = <
      item
        IP = '0.0.0.0'
        Port = 212
      end>
    DefaultPort = 69
    OnReadFile = IdTrivialFTPServer1ReadFile
    Left = 72
    Top = 24
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 1024
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientRead = ServerSocket1ClientRead
    Left = 208
    Top = 24
  end
  object timerNotificacao: TTimer
    Enabled = False
    Interval = 600000
    OnTimer = timerNotificacaoTimer
    Left = 320
    Top = 24
  end
end
