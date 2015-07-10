inherited FCadastrarFormUsuarios: TFCadastrarFormUsuarios
  Left = 435
  Top = 213
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Usu'#225'rios'
  Caption = 'Cadastrar Usu'#225'rios'
  ClientHeight = 314
  ClientWidth = 562
  OldCreateOrder = True
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
    Left = 204
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  inherited Panel1: TPanel
    Top = 284
    Width = 562
    TabOrder = 6
    DesignSize = (
      562
      30)
    inherited bbOk: TBitBtn
      Left = 399
    end
    inherited bbCancelar: TBitBtn
      Left = 479
    end
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 120
    Width = 472
    Height = 153
    Caption = 'Cadastro de Email'
    TabOrder = 5
    object Label4: TLabel
      Left = 245
      Top = 24
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'De E-mail'
    end
    object Label5: TLabel
      Left = 21
      Top = 24
      Width = 45
      Height = 13
      Alignment = taRightJustify
      Caption = 'De Nome'
    end
    object Label6: TLabel
      Left = 237
      Top = 56
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Para E-mail'
    end
    object Label7: TLabel
      Left = 13
      Top = 56
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Para Nome'
    end
    object Label8: TLabel
      Left = 11
      Top = 88
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Host SMTP'
    end
    object Label9: TLabel
      Left = 30
      Top = 120
      Width = 36
      Height = 13
      Alignment = taRightJustify
      Caption = 'Usuario'
    end
    object Label10: TLabel
      Left = 219
      Top = 120
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Senha'
    end
    object edDeEmail: TRzEdit
      Left = 296
      Top = 24
      Width = 161
      Height = 21
      TabOrder = 1
    end
    object edDeNome: TRzEdit
      Left = 72
      Top = 24
      Width = 161
      Height = 21
      TabOrder = 0
    end
    object edToEmail: TRzEdit
      Left = 296
      Top = 56
      Width = 161
      Height = 21
      TabOrder = 3
    end
    object edToNome: TRzEdit
      Left = 72
      Top = 56
      Width = 161
      Height = 21
      TabOrder = 2
    end
    object edSmtpHost: TRzEdit
      Left = 72
      Top = 88
      Width = 161
      Height = 21
      TabOrder = 4
    end
    object edSmtpUser: TRzEdit
      Left = 72
      Top = 120
      Width = 113
      Height = 21
      TabOrder = 5
    end
    object edSmtpPwd: TRzEdit
      Left = 256
      Top = 120
      Width = 113
      Height = 21
      PasswordChar = '*'
      TabOrder = 6
    end
  end
  object cmbVendedor: TDBLookupComboBox
    Left = 240
    Top = 88
    Width = 313
    Height = 21
    Enabled = False
    KeyField = 'VENDEDOR_SQ'
    ListField = 'NOME_VENDEDOR'
    ListSource = dsListaVendedores
    TabOrder = 4
  end
  object cbVendedor: TCheckBox
    Left = 168
    Top = 88
    Width = 69
    Height = 17
    Caption = 'Vendedor'
    TabOrder = 3
    OnClick = cbVendedorClick
  end
  object edCodigo: TRzEdit
    Left = 56
    Top = 24
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object edNome: TRzEdit
    Left = 240
    Top = 24
    Width = 313
    Height = 21
    TabOrder = 1
  end
  object edSenha: TRzEdit
    Left = 240
    Top = 56
    Width = 313
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object dsListaVendedores: TDataSource
    Left = 88
    Top = 48
  end
end
