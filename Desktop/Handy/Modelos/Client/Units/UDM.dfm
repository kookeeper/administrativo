object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 292
  Top = 155
  Height = 359
  Width = 310
  object Msg: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 192
    Top = 248
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atLogin
    Left = 192
    Top = 200
  end
  object SCServer: TSocketConnection
    ServerGUID = '{A655A3E7-D825-4A1B-BE06-453254930503}'
    ServerName = 'PrServer.Server'
    Host = '127.0.0.1'
    SupportCallbacks = False
    Left = 24
    Top = 24
  end
end
