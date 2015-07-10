inherited FCadastrarFormUsuarios: TFCadastrarFormUsuarios
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Usu'#225'rios'
  Caption = 'Cadastrar Usu'#225'rios'
  ClientHeight = 382
  ClientWidth = 606
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 18
    Top = 24
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel [1]
    Left = 207
    Top = 24
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label3: TLabel [2]
    Left = 110
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  inherited Panel1: TPanel
    Top = 352
    Width = 606
    TabOrder = 4
  end
  object GroupBox1: TGroupBox
    Left = 111
    Top = 88
    Width = 385
    Height = 249
    Caption = 'Cadastro de Email'
    TabOrder = 3
    object Label4: TLabel
      Left = 21
      Top = 24
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'De E-mail'
    end
    object Label5: TLabel
      Left = 21
      Top = 56
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'De Nome'
    end
    object Label6: TLabel
      Left = 13
      Top = 88
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Para E-mail'
    end
    object Label7: TLabel
      Left = 13
      Top = 120
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Para Nome'
    end
    object Label8: TLabel
      Left = 11
      Top = 152
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Host SMTP'
    end
    object Label9: TLabel
      Left = 30
      Top = 184
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usuario'
    end
    object Label10: TLabel
      Left = 35
      Top = 216
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Senha'
    end
    object edDeEmail: TEdit
      Left = 72
      Top = 24
      Width = 297
      Height = 21
      TabOrder = 0
    end
    object edDeNome: TEdit
      Left = 72
      Top = 56
      Width = 297
      Height = 21
      TabOrder = 1
    end
    object edToEmail: TEdit
      Left = 72
      Top = 88
      Width = 297
      Height = 21
      TabOrder = 2
    end
    object edToNome: TEdit
      Left = 72
      Top = 120
      Width = 297
      Height = 21
      TabOrder = 3
    end
    object edSmtpHost: TEdit
      Left = 72
      Top = 152
      Width = 297
      Height = 21
      TabOrder = 4
    end
    object edSmtpUser: TEdit
      Left = 72
      Top = 184
      Width = 297
      Height = 21
      TabOrder = 5
    end
    object edSmtpPwd: TEdit
      Left = 72
      Top = 216
      Width = 297
      Height = 21
      PasswordChar = '*'
      TabOrder = 6
    end
  end
  object edCodigo: TEdit
    Left = 56
    Top = 24
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object edNome: TEdit
    Left = 240
    Top = 24
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object edSenha: TEdit
    Left = 152
    Top = 56
    Width = 313
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
end
