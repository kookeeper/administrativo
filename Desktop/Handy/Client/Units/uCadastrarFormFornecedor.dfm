inherited FCadastrarFormFornecedor: TFCadastrarFormFornecedor
  Left = 446
  Top = 132
  Caption = 'Cadastrar fornecedor'
  ClientHeight = 474
  ClientWidth = 403
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 8
    Width = 39
    Height = 13
    Caption = 'C.N.P.J.'
    FocusControl = edCnpj
  end
  object Label2: TLabel [1]
    Left = 144
    Top = 8
    Width = 28
    Height = 13
    Caption = 'Nome'
    FocusControl = edNome
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 56
    Width = 90
    Height = 13
    Caption = 'Inscri'#231#227'o municipal'
    FocusControl = edInscrMunicipal
  end
  object Label4: TLabel [3]
    Left = 144
    Top = 56
    Width = 86
    Height = 13
    Caption = 'Inscri'#231#227'o estadual'
    FocusControl = edInscrEstadual
  end
  object Label5: TLabel [4]
    Left = 16
    Top = 152
    Width = 54
    Height = 13
    Caption = 'Logradouro'
    FocusControl = edLogradouro
  end
  object Label6: TLabel [5]
    Left = 240
    Top = 152
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = edNumero
  end
  object Label7: TLabel [6]
    Left = 16
    Top = 192
    Width = 27
    Height = 13
    Caption = 'Bairro'
    FocusControl = edBairro
  end
  object Label8: TLabel [7]
    Left = 320
    Top = 152
    Width = 64
    Height = 13
    Caption = 'Complemento'
    FocusControl = edComplemento
  end
  object Label9: TLabel [8]
    Left = 296
    Top = 192
    Width = 30
    Height = 13
    Caption = 'C.E.P.'
    FocusControl = edCEP
  end
  object Label10: TLabel [9]
    Left = 16
    Top = 232
    Width = 33
    Height = 13
    Caption = 'Cidade'
    FocusControl = edCidade
  end
  object Label11: TLabel [10]
    Left = 232
    Top = 232
    Width = 33
    Height = 13
    Caption = 'Estado'
    FocusControl = edEstado
  end
  object Label12: TLabel [11]
    Left = 272
    Top = 232
    Width = 20
    Height = 13
    Caption = 'Pais'
    FocusControl = edPais
  end
  object Label13: TLabel [12]
    Left = 16
    Top = 280
    Width = 42
    Height = 13
    Caption = 'Telefone'
    FocusControl = edTelefone
  end
  object Label14: TLabel [13]
    Left = 128
    Top = 280
    Width = 32
    Height = 13
    Caption = 'Celular'
    FocusControl = edCelular
  end
  object Label15: TLabel [14]
    Left = 240
    Top = 280
    Width = 28
    Height = 13
    Caption = 'E-mail'
    FocusControl = edEmail
  end
  object Label16: TLabel [15]
    Left = 16
    Top = 104
    Width = 37
    Height = 13
    Caption = 'Contato'
    FocusControl = edContato
  end
  object Label17: TLabel [16]
    Left = 16
    Top = 328
    Width = 58
    Height = 13
    Caption = 'Observa'#231#227'o'
  end
  inherited Panel1: TPanel
    Top = 444
    Width = 403
    TabOrder = 17
    inherited bbOk: TBitBtn
      Left = 242
    end
    inherited bbCancelar: TBitBtn
      Left = 322
    end
  end
  object edCnpj: TRzEdit
    Left = 16
    Top = 24
    Width = 121
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 0
  end
  object edNome: TRzEdit
    Left = 144
    Top = 24
    Width = 249
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 1
  end
  object edInscrMunicipal: TRzEdit
    Left = 16
    Top = 72
    Width = 121
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 2
  end
  object edInscrEstadual: TRzEdit
    Left = 144
    Top = 72
    Width = 121
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 3
  end
  object edLogradouro: TRzEdit
    Left = 16
    Top = 168
    Width = 217
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 5
  end
  object edNumero: TRzEdit
    Left = 240
    Top = 168
    Width = 73
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 6
  end
  object edBairro: TRzEdit
    Left = 16
    Top = 208
    Width = 273
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 8
  end
  object edComplemento: TRzEdit
    Left = 320
    Top = 168
    Width = 73
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 7
  end
  object edCEP: TRzEdit
    Left = 296
    Top = 208
    Width = 97
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 9
  end
  object edCidade: TRzEdit
    Left = 16
    Top = 248
    Width = 209
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 10
  end
  object edEstado: TRzEdit
    Left = 232
    Top = 248
    Width = 33
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 11
  end
  object edPais: TRzEdit
    Left = 272
    Top = 248
    Width = 121
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 12
  end
  object edTelefone: TRzEdit
    Left = 16
    Top = 296
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 13
  end
  object edCelular: TRzEdit
    Left = 128
    Top = 296
    Width = 105
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 14
  end
  object edEmail: TRzEdit
    Left = 240
    Top = 296
    Width = 153
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 15
  end
  object edContato: TRzEdit
    Left = 16
    Top = 120
    Width = 377
    Height = 21
    FrameHotTrack = True
    FrameVisible = True
    TabOrder = 4
  end
  object mmObservacao: TRzMemo
    Left = 16
    Top = 344
    Width = 377
    Height = 89
    TabOrder = 16
    FrameHotTrack = True
    FrameVisible = True
  end
end
