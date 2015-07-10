inherited FCadastrarFormClientes: TFCadastrarFormClientes
  Left = 338
  Top = 190
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Clientes'
  Caption = 'Cadastrar Clientes'
  ClientHeight = 350
  ClientWidth = 645
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Top = 320
    Width = 645
    TabOrder = 1
    inherited bbOk: TBitBtn
      Left = 455
    end
    inherited bbCancelar: TBitBtn
      Left = 535
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 645
    Height = 320
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados Cadastrais'
      object Label1: TLabel
        Left = 23
        Top = 16
        Width = 58
        Height = 13
        Caption = 'CPF / CNPJ'
      end
      object Label2: TLabel
        Left = 237
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label3: TLabel
        Left = 394
        Top = 176
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Inscr. Est.'
      end
      object Label4: TLabel
        Left = 219
        Top = 48
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label5: TLabel
        Left = 44
        Top = 144
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object Label6: TLabel
        Left = 54
        Top = 80
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label7: TLabel
        Left = 48
        Top = 112
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label8: TLabel
        Left = 312
        Top = 112
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object Label9: TLabel
        Left = 51
        Top = 48
        Width = 30
        Height = 13
        Caption = 'C.E.P.'
      end
      object Label18: TLabel
        Left = 419
        Top = 112
        Width = 22
        Height = 13
        Caption = 'Pa'#237's'
      end
      object Label19: TLabel
        Left = 17
        Top = 176
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label20: TLabel
        Left = 39
        Top = 240
        Width = 42
        Height = 13
        Caption = 'Cadastro'
      end
      object Label21: TLabel
        Left = 257
        Top = 240
        Width = 77
        Height = 13
        Caption = #218'ltima Altera'#231#227'o'
      end
      object Label29: TLabel
        Left = 9
        Top = 208
        Width = 72
        Height = 13
        Alignment = taRightJustify
        Caption = 'Transportadora'
      end
      object edCodigo: TEdit
        Left = 88
        Top = 16
        Width = 105
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edNome: TEdit
        Left = 272
        Top = 16
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object edEndereco: TEdit
        Left = 272
        Top = 48
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 3
      end
      object edNumero: TEdit
        Left = 88
        Top = 144
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 8
      end
      object edComplemento: TEdit
        Left = 88
        Top = 176
        Width = 297
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 11
      end
      object edBairro: TEdit
        Left = 88
        Top = 80
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
      end
      object edCep: TEdit
        Left = 88
        Top = 48
        Width = 65
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnExit = edCepExit
      end
      object edCidade: TEdit
        Left = 88
        Top = 112
        Width = 193
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object edInscricao: TEdit
        Left = 448
        Top = 176
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 12
      end
      object edPais: TEdit
        Left = 448
        Top = 112
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 7
        OnExit = edPaisExit
      end
      object cbEstado: TComboBox
        Left = 352
        Top = 112
        Width = 49
        Height = 21
        CharCase = ecUpperCase
        ItemHeight = 13
        TabOrder = 6
        Items.Strings = (
          'AC'
          'AL'
          'AM'
          'AP'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MG'
          'MS'
          'MT'
          'PA'
          'PB'
          'PE'
          'PI'
          'PR'
          'RJ'
          'RN'
          'RO'
          'RR'
          'RS'
          'SC'
          'SE'
          'SP'
          'TO')
      end
      object cbRevenda: TCheckBox
        Left = 400
        Top = 144
        Width = 97
        Height = 17
        Caption = 'Revenda'
        TabOrder = 9
      end
      object cbBiro: TCheckBox
        Left = 512
        Top = 144
        Width = 97
        Height = 17
        Caption = 'Biro'
        TabOrder = 10
      end
      object edCadastro: TEdit
        Left = 88
        Top = 240
        Width = 161
        Height = 21
        TabOrder = 14
      end
      object edAlteracao: TEdit
        Left = 344
        Top = 240
        Width = 241
        Height = 21
        TabOrder = 15
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 88
        Top = 208
        Width = 497
        Height = 21
        KeyField = 'TRANSPORTADORA_SQ'
        ListField = 'NOME_TRANSPORTADORA'
        ListSource = DataSource1
        TabOrder = 13
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Informa'#231#245'es de Contato'
      ImageIndex = 1
      object Label11: TLabel
        Left = 33
        Top = 48
        Width = 48
        Height = 13
        Caption = 'Telefone1'
      end
      object Label10: TLabel
        Left = 33
        Top = 80
        Width = 48
        Height = 13
        Caption = 'Telefone2'
      end
      object Label12: TLabel
        Left = 33
        Top = 112
        Width = 48
        Height = 13
        Caption = 'Telefone3'
      end
      object Label13: TLabel
        Left = 352
        Top = 80
        Width = 17
        Height = 13
        Caption = 'Fax'
      end
      object Label15: TLabel
        Left = 337
        Top = 48
        Width = 32
        Height = 13
        Caption = 'Celular'
      end
      object Label14: TLabel
        Left = 52
        Top = 144
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'E-Mail'
      end
      object Label16: TLabel
        Left = 37
        Top = 176
        Width = 44
        Height = 13
        Caption = 'Web Site'
      end
      object Label17: TLabel
        Left = 44
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Contato'
      end
      object edContato: TEdit
        Left = 88
        Top = 16
        Width = 313
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edDDDFone1: TEdit
        Left = 88
        Top = 48
        Width = 41
        Height = 21
        TabOrder = 1
      end
      object edFone1: TEdit
        Left = 136
        Top = 48
        Width = 105
        Height = 21
        TabOrder = 2
      end
      object edComplFone1: TEdit
        Left = 248
        Top = 48
        Width = 73
        Height = 21
        TabOrder = 3
      end
      object edDDDFone2: TEdit
        Left = 88
        Top = 80
        Width = 41
        Height = 21
        TabOrder = 4
      end
      object edFone2: TEdit
        Left = 136
        Top = 80
        Width = 105
        Height = 21
        TabOrder = 5
      end
      object edComplFone2: TEdit
        Left = 248
        Top = 80
        Width = 73
        Height = 21
        TabOrder = 6
      end
      object edDDDFone3: TEdit
        Left = 88
        Top = 112
        Width = 41
        Height = 21
        TabOrder = 7
      end
      object edFone3: TEdit
        Left = 136
        Top = 112
        Width = 105
        Height = 21
        TabOrder = 8
      end
      object edComplFone3: TEdit
        Left = 248
        Top = 112
        Width = 73
        Height = 21
        TabOrder = 9
      end
      object edDDDCelular: TEdit
        Left = 376
        Top = 48
        Width = 41
        Height = 21
        TabOrder = 10
      end
      object edCelular: TEdit
        Left = 424
        Top = 48
        Width = 105
        Height = 21
        TabOrder = 11
      end
      object edComplCelular: TEdit
        Left = 536
        Top = 48
        Width = 73
        Height = 21
        TabOrder = 12
      end
      object edDDDFax: TEdit
        Left = 376
        Top = 80
        Width = 41
        Height = 21
        TabOrder = 13
      end
      object edFax: TEdit
        Left = 424
        Top = 80
        Width = 105
        Height = 21
        TabOrder = 14
      end
      object edComplFax: TEdit
        Left = 536
        Top = 80
        Width = 73
        Height = 21
        TabOrder = 15
      end
      object edEmail: TEdit
        Left = 88
        Top = 144
        Width = 521
        Height = 21
        CharCase = ecLowerCase
        TabOrder = 16
      end
      object edSite: TEdit
        Left = 88
        Top = 176
        Width = 521
        Height = 21
        CharCase = ecLowerCase
        TabOrder = 17
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Informa'#231#245'es Comerciais'
      ImageIndex = 2
      object Label22: TLabel
        Left = 17
        Top = 112
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Menor Venda'
      end
      object Label23: TLabel
        Left = 18
        Top = 48
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = #218'ltima Venda'
      end
      object Label24: TLabel
        Left = 21
        Top = 80
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Maior Venda'
      end
      object Label25: TLabel
        Left = 10
        Top = 16
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Primeira Venda'
      end
      object Label26: TLabel
        Left = 18
        Top = 144
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Observa'#231#245'es'
      end
      object Label27: TLabel
        Left = 243
        Top = 16
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total de Vendas'
      end
      object Label28: TLabel
        Left = 251
        Top = 48
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Media por M'#234's'
      end
      object Label30: TLabel
        Left = 259
        Top = 80
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'Classifica'#231#227'o'
      end
      object edMenorVenda: TEdit
        Left = 88
        Top = 112
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 3
      end
      object edUltimaVenda: TEdit
        Left = 88
        Top = 48
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 1
      end
      object edPrimeiraVenda: TEdit
        Left = 88
        Top = 16
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 0
        OnExit = edCepExit
      end
      object edMaiorVenda: TEdit
        Left = 88
        Top = 80
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 2
      end
      object mmObservacao: TMemo
        Left = 88
        Top = 144
        Width = 537
        Height = 105
        TabOrder = 6
      end
      object edTotalVendas: TEdit
        Left = 328
        Top = 16
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 4
      end
      object edMediaVendas: TEdit
        Left = 328
        Top = 48
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 5
      end
      object edClassificacao: TEdit
        Left = 328
        Top = 80
        Width = 137
        Height = 21
        CharCase = ecUpperCase
        ReadOnly = True
        TabOrder = 7
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DMLista.cdsListaTransportadoras
    Left = 420
    Top = 224
  end
end
