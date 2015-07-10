inherited FCadastrarFormDuplicatas: TFCadastrarFormDuplicatas
  Left = 383
  Top = 148
  HelpType = htKeyword
  HelpKeyword = 'Cadastro de Duplicatas'
  Caption = 'Cadastrar Duplicatas'
  ClientHeight = 379
  ClientWidth = 469
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 224
    Top = 8
    Width = 37
    Height = 13
    Alignment = taRightJustify
    Caption = 'N'#250'mero'
  end
  object Label2: TLabel [1]
    Left = 312
    Top = 8
    Width = 20
    Height = 13
    Alignment = taRightJustify
    Caption = #205'tem'
  end
  object Label4: TLabel [2]
    Left = 96
    Top = 8
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'Nota Fiscal'
  end
  object Label5: TLabel [3]
    Left = 96
    Top = 56
    Width = 24
    Height = 13
    Alignment = taRightJustify
    Caption = 'Valor'
  end
  object Label6: TLabel [4]
    Left = 96
    Top = 104
    Width = 80
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data da Emissao'
  end
  object Label7: TLabel [5]
    Left = 232
    Top = 104
    Width = 97
    Height = 13
    Alignment = taRightJustify
    Caption = 'Data do Vencimento'
  end
  object Label3: TLabel [6]
    Left = 200
    Top = 56
    Width = 25
    Height = 13
    Caption = 'Juros'
  end
  object Label8: TLabel [7]
    Left = 280
    Top = 56
    Width = 46
    Height = 13
    Caption = 'Desconto'
  end
  inherited Panel1: TPanel
    Top = 349
    Width = 469
    TabOrder = 9
    DesignSize = (
      469
      30)
    inherited bbOk: TBitBtn
      Left = 300
    end
    inherited bbCancelar: TBitBtn
      Left = 380
    end
  end
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 148
    Width = 469
    Height = 201
    Align = alBottom
    Caption = 'Pagamentos'
    GroupStyle = gsBanner
    TabOrder = 8
    object ToolBar1: TToolBar
      Left = 0
      Top = 21
      Width = 469
      Height = 25
      AutoSize = True
      ButtonHeight = 21
      Caption = 'ToolBar1'
      TabOrder = 0
      object sbNovoItem: TSpeedButton
        Left = 0
        Top = 2
        Width = 28
        Height = 21
        Hint = 'Novo (Ctrl + N)'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
          333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
          0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
          07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
          0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
          33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
          B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
          3BB33773333773333773B333333B3333333B7333333733333337}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbNovoItemClick
      end
      object sbEditarItem: TSpeedButton
        Left = 28
        Top = 2
        Width = 28
        Height = 21
        Hint = 'Editar (Ctrl + E)'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbEditarItemClick
      end
      object sbApagarItem: TSpeedButton
        Left = 56
        Top = 2
        Width = 28
        Height = 21
        Hint = 'Excluir (Ctrl + X)'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
          555557777F777555F55500000000555055557777777755F75555005500055055
          555577F5777F57555555005550055555555577FF577F5FF55555500550050055
          5555577FF77577FF555555005050110555555577F757777FF555555505099910
          555555FF75777777FF555005550999910555577F5F77777775F5500505509990
          3055577F75F77777575F55005055090B030555775755777575755555555550B0
          B03055555F555757575755550555550B0B335555755555757555555555555550
          BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
          50BB555555555555575F555555555555550B5555555555555575}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbApagarItemClick
      end
      object sbSalvar: TSpeedButton
        Left = 84
        Top = 2
        Width = 28
        Height = 21
        Hint = 'Salvar'
        Enabled = False
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbSalvarClick
      end
      object sbCancelar: TSpeedButton
        Left = 112
        Top = 2
        Width = 28
        Height = 21
        Hint = 'Cancelar'
        Enabled = False
        Flat = True
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbCancelarClick
      end
    end
    object gridPgto: TRzDBGrid
      Left = 0
      Top = 46
      Width = 469
      Height = 155
      Align = alClient
      DataSource = dsPgto
      DefaultDrawing = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      QuickCompare.FieldValue = 1
      AltRowShading = False
      Columns = <
        item
          Expanded = False
          FieldName = 'dt_pgto'
          Title.Caption = 'Data'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_pgto'
          Title.Caption = 'Valor'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'forma_pgto'
          Title.Caption = 'Forma'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'observacao'
          Title.Caption = 'Observa'#231#227'o'
          Visible = True
        end>
    end
  end
  object edValor: TRzNumericEdit
    Left = 96
    Top = 72
    Width = 97
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 3
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edDtEmissao: TRzDateTimeEdit
    Left = 96
    Top = 120
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 6
  end
  object edDtVencto: TRzDateTimeEdit
    Left = 232
    Top = 120
    Width = 121
    Height = 21
    EditType = etDate
    TabOrder = 7
  end
  object edNumero: TRzNumericEdit
    Left = 224
    Top = 24
    Width = 81
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 1
    DisplayFormat = ',0;(,0)'
  end
  object edItem: TRzNumericEdit
    Left = 312
    Top = 24
    Width = 41
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 2
    DisplayFormat = ',0;(,0)'
  end
  object edNfiscal: TRzNumericEdit
    Left = 96
    Top = 24
    Width = 121
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 0
    OnChange = edNfiscalChange
    DisplayFormat = ',0;(,0)'
  end
  object edJuros: TRzNumericEdit
    Left = 200
    Top = 72
    Width = 73
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 4
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object edDesconto: TRzNumericEdit
    Left = 280
    Top = 72
    Width = 73
    Height = 21
    Alignment = taLeftJustify
    TabOrder = 5
    IntegersOnly = False
    DisplayFormat = ',0.00;(,0.00)'
  end
  object cdsPgto: TClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = cdsPgtoAfterEdit
    AfterEdit = cdsPgtoAfterEdit
    AfterPost = cdsPgtoAfterPost
    AfterCancel = cdsPgtoAfterPost
    Left = 180
    Top = 232
    object cdsPgtoduplicata_pgto_sq: TIntegerField
      FieldName = 'duplicata_pgto_sq'
    end
    object cdsPgtoduplicata_sq: TIntegerField
      FieldName = 'duplicata_sq'
    end
    object cdsPgtodt_pgto: TDateTimeField
      FieldName = 'dt_pgto'
      EditMask = '!99/99/00;1;_'
    end
    object cdsPgtovalor_pgto: TBCDField
      FieldName = 'valor_pgto'
      currency = True
      Size = 2
    end
    object cdsPgtoforma_pgto: TStringField
      FieldName = 'forma_pgto'
      Size = 10
    end
    object cdsPgtoobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
  end
  object dsPgto: TDataSource
    DataSet = cdsPgto
    Left = 260
    Top = 232
  end
end
