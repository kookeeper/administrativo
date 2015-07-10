
unit UCadastrarListaNfiscais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaNfiscais = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNfiscais: TFCadastrarListaNfiscais;

implementation

uses UDM, UCadastrarFormNfiscais, UDMLista, UConsultarNfiscaisSerie;

{$R *.DFM}

procedure TFCadastrarListaNfiscais.FormCreate(Sender: TObject);
begin
  Tabela := 'tbNfiscais';
  Sql := 'SELECT N.*, C.NOME_CLIENTE, P.DESCRICAO_COND_PAGTO, PE.NUMERO_PEDIDO, PE.OBSERVACAO_NF, ' +
         'D1.NUMERO_DUPLICATA AS DUP1, D1.ITEM_DUPLICATA AS IT_DUP1, D1.VALOR_DUPLICATA AS VLR_DUP1, D1.DTEMISSAO_DUPLICATA AS DT_DUP1, ' +
         'D2.NUMERO_DUPLICATA AS DUP2, D2.ITEM_DUPLICATA AS IT_DUP2, D2.VALOR_DUPLICATA AS VLR_DUP2, D2.DTEMISSAO_DUPLICATA AS DT_DUP2, ' +
         'D3.NUMERO_DUPLICATA AS DUP3, D3.ITEM_DUPLICATA AS IT_DUP3, D3.VALOR_DUPLICATA AS VLR_DUP3, D3.DTEMISSAO_DUPLICATA AS DT_DUP3 ' +
         'FROM NFISCAIS N ' +
         'LEFT JOIN PEDIDOS PE ON (PE.PEDIDO_SQ = N.PEDIDO_SQ) ' +
         'LEFT JOIN CLIENTES C ON (C.CLIENTE_SQ = N.CLIENTE_SQ) ' +
         'LEFT JOIN COND_PAGTO P ON (P.COND_PAGTO_SQ = N.COND_PAGTO_SQ) ' +
         'LEFT JOIN DUPLICATAS D1 ON (D1.NUMERO_DUPLICATA = N.NUMERO_NFISCAL AND D1.ITEM_DUPLICATA = 1 AND D1.SEQ_DUPLICATA = 0) ' +
         'LEFT JOIN DUPLICATAS D2 ON (D2.NUMERO_DUPLICATA = N.NUMERO_NFISCAL AND D2.ITEM_DUPLICATA = 2 AND D2.SEQ_DUPLICATA = 0) ' +
         'LEFT JOIN DUPLICATAS D3 ON (D3.NUMERO_DUPLICATA = N.NUMERO_NFISCAL AND D3.ITEM_DUPLICATA = 3 AND D3.SEQ_DUPLICATA = 0) ';
  SetLength (cLista, 6);
  SetLength (nLista, 6);
  SetLength (cIndice, 1);

  cIndice := 'NFISCAL_SQ';

  cLista[0] := 'NUMERO_NFISCAL';
  cLista[1] := 'DTEMISSAO_NFISCAL';
  cLista[2] := 'NOME_CLIENTE';
  cLista[3] := 'VLR_TOTAL';
  cLista[4] := 'DESCRICAO_COND_PAGTO';
  cLista[5] := 'CANCELADA';

  nLista[0] := 'Número';
  nLista[1] := 'Data Emissão';
  nLista[2] := 'Nome do Cliente';
  nLista[3] := 'Valor N.Fiscal';
  nLista[4] := 'Condição de Pagamento';
  nLista[5] := 'Cancelada';
  inherited;
  cbOrdem.Text := 'Número';
end;

procedure TFCadastrarListaNfiscais.sbEditarClick(Sender: TObject);
var
  i, row: integer;
  Itens: array of variant;
  DtSaida: Variant;
  Manual: Boolean;
begin
  Manual := Sender = SpeedButton2;
  if Sender = SpeedButton2 then Sender := sbNovo;
  inherited;
  Application.CreateForm (TFCadastrarFormNfiscais, FCadastrarFormNfiscais);
  FCadastrarFormNfiscais.Manual := Manual;
  FCadastrarFormNfiscais.edDtEmissao.ReadOnly := DM.alt_dtnf = 'N';
  FCadastrarFormNfiscais.edNrNfiscal.ReadOnly := DM.alt_nrnf = 'N';
  FCadastrarFormNfiscais.bbOk.Enabled         := True;
  DMLista.cdsListaClientes.Open;
  DMLista.cdsListaCondPagto.Open;
  DMLista.cdsListaNaturezas.Open;
  DMLista.cdsListaTransportadoras.Open;
  DMLista.cdsListaVendedores.Open;
  DMLista.cdsListaNfiscaisItens.Params.ParamByName('NFISCAL_SQ').AsInteger := cdsLista.FieldByName ('NFISCAL_SQ').AsInteger;
  DMLista.cdsListaNfiscaisItens.Open;
  if not novo then
  begin
    FCadastrarFormNfiscais.bbOk.Enabled        := cdsLista.FieldByName('CONCLUIDA').AsString <> 'S';
    if cdsLista.FieldByName('CONCLUIDA').AsString <> 'S' then
      FCadastrarFormNfiscais.bbOk.Enabled        := cdsLista.FieldByName('CANCELADA').AsString <> 'S';
    FCadastrarFormNfiscais.edPedido.Enabled := False;
    FCadastrarFormNfiscais.Manual                := cdsLista.FieldByName ('NF_MANUAL').AsString = 'S';
    Manual := FCadastrarFormNfiscais.Manual;

    FCadastrarFormNfiscais.bbAtualizar.Visible   := Manual;
    FCadastrarFormNfiscais.edNrNfiscal.Text      := cdsLista.FieldByName('NUMERO_NFISCAL').AsString;
    FCadastrarFormNfiscais.edPedido.Text         := cdsLista.FieldByName('NUMERO_PEDIDO').AsString;
    FCadastrarFormNfiscais.edPedido.Tag          := cdsLista.FieldByName('PEDIDO_SQ').AsInteger;
    FCadastrarFormNfiscais.ednfat1.Text          := cdsLista.FieldByName('DUP1').AsString + '/' + cdsLista.FieldByName('IT_DUP1').AsString;
    FCadastrarFormNfiscais.edvfat1.Text          := cdsLista.FieldByName('VLR_DUP1').AsString;
    FCadastrarFormNfiscais.eddfat1.Text          := cdsLista.FieldByName('DT_DUP1').AsString;
    FCadastrarFormNfiscais.ednfat2.Text          := cdsLista.FieldByName('DUP2').AsString + '/' + cdsLista.FieldByName('IT_DUP2').AsString;
    FCadastrarFormNfiscais.edvfat2.Text          := cdsLista.FieldByName('VLR_DUP2').AsString;
    FCadastrarFormNfiscais.eddfat2.Text          := cdsLista.FieldByName('DT_DUP2').AsString;
    FCadastrarFormNfiscais.ednfat3.Text          := cdsLista.FieldByName('DUP3').AsString + '/' + cdsLista.FieldByName('IT_DUP3').AsString;
    FCadastrarFormNfiscais.edvfat3.Text          := cdsLista.FieldByName('VLR_DUP3').AsString;
    FCadastrarFormNfiscais.eddfat3.Text          := cdsLista.FieldByName('DT_DUP3').AsString;
    FCadastrarFormNfiscais.edDtEmissao.Text      := FormatDateTime ('dd/mm/yyyy', cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsDateTime);
    if not cdsLista.FieldByName('DTSAIDA_NFISCAL').IsNull then
      FCadastrarFormNfiscais.edDtSaida.Text        := FormatDateTime ('dd/mm/yyyy', cdsLista.FieldByName('DTSAIDA_NFISCAL').AsDateTime);
    FCadastrarFormNfiscais.edDemonstracao.Text   := cdsLista.FieldByName('DIAS_DEMONSTRACAO').AsString;
    FCadastrarFormNfiscais.edDolar.Text          := FloattoStr (cdsLista.FieldByName('COTACAO_DOLAR').AsCurrency);
    FCadastrarFormNfiscais.edBaseICMS.Text       := FloattoStr (cdsLista.FieldByName('BASE_ICMS').AsCurrency);
    FCadastrarFormNfiscais.edVlrIcms.Text        := FloattoStr (cdsLista.FieldByName('VLR_ICMS').AsCurrency);
    FCadastrarFormNfiscais.edBaseICMSStrib.Text  := FloattoStr (cdsLista.FieldByName('BASE_ICMS_SUBST').AsCurrency);
    FCadastrarFormNfiscais.edVlrICMSStrib.Text   := FloattoStr (cdsLista.FieldByName('VLR_ICMS_SUBST').AsCurrency);
    FCadastrarFormNfiscais.edVlrProd.Text        := FloattoStr (cdsLista.FieldByName('VLR_PRODUTOS').AsCurrency);
    FCadastrarFormNfiscais.edVlrTotal.Text       := FloattoStr (cdsLista.FieldByName('VLR_TOTAL').AsCurrency);
    FCadastrarFormNfiscais.edVlrIPI.Text         := FloattoStr (cdsLista.FieldByName('VLR_IPI').AsCurrency);
    FCadastrarFormNfiscais.edVlrDespAcess.Text   := FloattoStr (cdsLista.FieldByName('VLR_DESP_ACESS').AsCurrency);
    FCadastrarFormNfiscais.edVlrSeguro.Text      := FloattoStr (cdsLista.FieldByName('VLR_SEGURO').AsCurrency);
    FCadastrarFormNfiscais.edVlrFrete.Text       := FloattoStr (cdsLista.FieldByName('VLR_FRETE').AsCurrency);
    FCadastrarFormNfiscais.edPlacaTransp.Text    := cdsLista.FieldByName('PLACA_TRANSP').AsString;
    FCadastrarFormNfiscais.edQtdeTransp.Text     := cdsLista.FieldByName('QTDE_TRANSP').AsString;
    FCadastrarFormNfiscais.edEspecieTransp.Text  := cdsLista.FieldByName('ESPECIE_TRANSP').AsString;
    FCadastrarFormNfiscais.edPBrutoTransp.Text   := cdsLista.FieldByName('PBRUTO_TRANSP').AsString;
    FCadastrarFormNfiscais.edMarcaTransp.Text    := cdsLista.FieldByName('MARCA_TRANSP').AsString;
    FCadastrarFormNfiscais.edNumeroTransp.Text   := cdsLista.FieldByName('NUMERO_TRANSP').AsString;
    FCadastrarFormNfiscais.edPLiquidoTransp.Text := cdsLista.FieldByName('PLIQUIDO_TRANSP').AsString;
    FCadastrarFormNfiscais.edClassA.Text         := cdsLista.FieldByName('CLASS_FISCAL1').AsString;
    FCadastrarFormNfiscais.edClassB.Text         := cdsLista.FieldByName('CLASS_FISCAL2').AsString;
    FCadastrarFormNfiscais.edClassC.Text         := cdsLista.FieldByName('CLASS_FISCAL3').AsString;
    FCadastrarFormNfiscais.edClassD.Text         := cdsLista.FieldByName('CLASS_FISCAL4').AsString;
    FCadastrarFormNfiscais.edClassE.Text         := cdsLista.FieldByName('CLASS_FISCAL5').AsString;
    FCadastrarFormNfiscais.edClassF.Text         := cdsLista.FieldByName('CLASS_FISCAL6').AsString;
    FCadastrarFormNfiscais.edClassG.Text         := cdsLista.FieldByName('CLASS_FISCAL7').AsString;
    FCadastrarFormNfiscais.DBLookupComboBox1.KeyValue  := cdsLista.FieldByName('CLIENTE_SQ').AsInteger;
    FCadastrarFormNfiscais.DBLookupComboBox2.KeyValue  := cdsLista.FieldByName('CLIENTE_SQ').AsInteger;
    FCadastrarFormNfiscais.DBLookupComboBox3.KeyValue  := cdsLista.FieldByName('COND_PAGTO_SQ').AsInteger;
    FCadastrarFormNfiscais.DBLookupComboBox4.KeyValue  := cdsLista.FieldByName('COND_PAGTO_SQ').AsInteger;
    FCadastrarFormNfiscais.DBLookupComboBox5.KeyValue  := cdsLista.FieldByName('NATUREZA_SQ').AsInteger;
    FCadastrarFormNfiscais.DBLookupComboBox6.KeyValue  := cdsLista.FieldByName('TRANSPORTADORA_SQ').AsInteger;
    FCadastrarFormNfiscais.DBLookupComboBox7.KeyValue  := cdsLista.FieldByName('VENDEDOR_SQ').AsInteger;
    FCadastrarFormNfiscais.mmMensagem.Lines.Text       := cdsLista.FieldByName('MENSAGEM').AsString;
    FCadastrarFormNfiscais.rgFrete.ItemIndex           := cdsLista.FieldByName('FRETE_TRANSP').AsInteger - 1;
    FCadastrarFormNfiscais.cbEstadoTransp.Text         := cdsLista.FieldByName ('UF_PLACA_TRANSP').AsString;
    FCadastrarFormNfiscais.MensagemPedido              := cdsLista.FieldByName ('OBSERVACAO_NF').AsString;

    DMLista.cdsListaNfiscaisItens.Last;

    if DMLista.cdsListaNfiscaisItens.RecordCount > 0 then
    begin
      SetLength(FCadastrarFormNfiscais.vIndice, DMLista.cdsListaNfiscaisItens.RecordCount);
      SetLength(FCadastrarFormNfiscais.cProduto, DMLista.cdsListaNfiscaisItens.RecordCount);
    end
    else begin
      SetLength(FCadastrarFormNfiscais.vIndice, 1);
      SetLength(FCadastrarFormNfiscais.cProduto, 1);
    end;

    DMLista.cdsListaNfiscaisItens.First;
    row := 1;
    While not DMLista.cdsListaNfiscaisItens.Eof do
    begin
      inc (row);
      FCadastrarFormNfiscais.StringGrid1.RowCount := row;
      FCadastrarFormNfiscais.StringGrid1.Cells [1,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('CODIGO_PRODUTO').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [2,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('DESCRICAO_PRODUTO').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [3,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('QTDE_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [4,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('VLR_UNIT_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [5,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('CLASS_FISCAL').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [6,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('STRIBUT').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [7,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('ALIQ_ICMS_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [8,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('VLR_ICMS_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [9,  row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('ALIQ_IPI_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [10, row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('VLR_IPI_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [11, row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('VLR_TOTAL_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [12, row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('NR_SERIE_ITEM').AsString;
      FCadastrarFormNfiscais.StringGrid1.Cells [13, row-1] := InttoStr (DMLista.cdsListaPecasQTDE_PECA_LOJA.AsInteger + DMLista.cdsListaPecasQTDE_PECA_ARMAZEM.AsInteger);
      FCadastrarFormNfiscais.StringGrid1.Cells [14, row-1] := DMLista.cdsListaNfiscaisItens.FieldByName ('CODIGO_NBM').AsString;
      FCadastrarFormNfiscais.vIndice[row-2]  := DMLista.cdsListaNfiscaisItens.FieldByName ('NFISCAL_ITEM_SQ').AsString;
      FCadastrarFormNfiscais.cProduto[row-2] := DMLista.cdsListaNfiscaisItensPECA_SQ.AsInteger;
      DMLista.cdsListaNfiscaisItens.Next;
    end;
    if not Manual then FCadastrarFormNfiscais.DBLookupComboBox3.OnClick (Sender);
  end
  else
  begin
    FCadastrarFormNfiscais.edNrNfiscal.Text := '0';
    FCadastrarFormNfiscais.edDtEmissao.Text := DatetoStr (Date);
    FCadastrarFormNfiscais.edDtSaida.Text   := DatetoStr (Date);
    SetLength(FCadastrarFormNfiscais.cProduto, 1);
    FCadastrarFormNfiscais.bbAtualizar.Click;
  end;
  FCadastrarFormNfiscais.edBaseICMS.ReadOnly := not Manual;
  FCadastrarFormNfiscais.edVlrIcms.ReadOnly  := not Manual;
  FCadastrarFormNfiscais.edVlrProd.ReadOnly  := not Manual;
  FCadastrarFormNfiscais.edVlrIPI.ReadOnly   := not Manual;
  FCadastrarFormNfiscais.edVlrTotal.ReadOnly := not Manual;
  if FCadastrarFormNfiscais.ShowModal = mrOk then
  try
    SetLength (Itens, FCadastrarFormNfiscais.StringGrid1.RowCount-1);
    Itens[0] := 0;
    for i := 0 to (FCadastrarFormNfiscais.StringGrid1.RowCount-2) do
    if (High (FCadastrarFormNfiscais.cProduto) >= 0) and (FCadastrarFormNfiscais.cProduto[0] <> 0) then
    begin
      Itens[i] := VarArrayOf ([FCadastrarFormNfiscais.cProduto[i],
        FCadastrarFormNfiscais.StringGrid1.Cells [1, i+1],
        FCadastrarFormNfiscais.StringGrid1.Cells [2, i+1],
        FCadastrarFormNfiscais.StringGrid1.Cells [3, i+1],
        StrtoFloat (FCadastrarFormNfiscais.StringGrid1.Cells [4, i+1]),
        FCadastrarFormNfiscais.StringGrid1.Cells [5, i+1],
        FCadastrarFormNfiscais.StringGrid1.Cells [6, i+1],
        StrtoFloat (FCadastrarFormNfiscais.StringGrid1.Cells [7, i+1]),
        StrtoFloat (FCadastrarFormNfiscais.StringGrid1.Cells [8, i+1]),
        StrtoFloat (FCadastrarFormNfiscais.StringGrid1.Cells [9, i+1]),
        StrtoFloat (FCadastrarFormNfiscais.StringGrid1.Cells [10, i+1]),
        StrtoFloat (FCadastrarFormNfiscais.StringGrid1.Cells [11, i+1]),
        FCadastrarFormNfiscais.StringGrid1.Cells [12, i+1]]);
    end;

    if FCadastrarFormNfiscais.edDtSaida.Text = '' then
      DtSaida := Null else
      DtSaida := StrtoDate (FCadastrarFormNfiscais.edDtSaida.Text);

    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('NFISCAIS', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormNfiscais.edNrNfiscal.Text,
        StrtoDate (FCadastrarFormNfiscais.edDtEmissao.Text),
        DtSaida,
        FCadastrarFormNfiscais.edPedido.Tag,
        StrtoFloat (FCadastrarFormNfiscais.edDolar.Text),
        FCadastrarFormNfiscais.DBLookupComboBox1.KeyValue,
        FCadastrarFormNfiscais.DBLookupComboBox3.KeyValue,
        FCadastrarFormNfiscais.DBLookupComboBox5.KeyValue,
        FCadastrarFormNfiscais.DBLookupComboBox6.KeyValue,
        StrtoFloat (FCadastrarFormNfiscais.edBaseICMS.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrIcms.Text),
        StrtoFloat (FCadastrarFormNfiscais.edBaseICMSStrib.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrICMSStrib.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrProd.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrFrete.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrSeguro.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrDespAcess.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrIPI.Text),
        StrtoFloat (FCadastrarFormNfiscais.edVlrTotal.Text),
        FCadastrarFormNfiscais.rgFrete.ItemIndex,
        FCadastrarFormNfiscais.edPlacaTransp.Text,
        FCadastrarFormNfiscais.cbEstadoTransp.Text,
        FCadastrarFormNfiscais.edQtdeTransp.Text,
        FCadastrarFormNfiscais.edEspecieTransp.Text,
        FCadastrarFormNfiscais.edMarcaTransp.Text,
        FCadastrarFormNfiscais.edNumeroTransp.Text,
        FCadastrarFormNfiscais.edPBrutoTransp.Text,
        FCadastrarFormNfiscais.edPLiquidoTransp.Text,
        FCadastrarFormNfiscais.edClassA.Text,
        FCadastrarFormNfiscais.edClassB.Text,
        FCadastrarFormNfiscais.edClassC.Text,
        FCadastrarFormNfiscais.edClassD.Text,
        FCadastrarFormNfiscais.edClassE.Text,
        FCadastrarFormNfiscais.edClassF.Text,
        FCadastrarFormNfiscais.edClassG.Text,
        FCadastrarFormNfiscais.mmMensagem.Lines.Text,
        'N',
        FCadastrarFormNfiscais.edDemonstracao.Text,
        FCadastrarFormNfiscais.DBLookupComboBox7.KeyValue,
        High(FCadastrarFormNfiscais.xItens),
        FCadastrarFormNfiscais.xItens,
        High(Itens),
        Itens,
        High(FCadastrarFormNFiscais.cProduto),
        FCadastrarFormNfiscais.cProduto,
        FCadastrarFormNfiscais.vIndice,
        DM.useq,
        FCadastrarFormNfiscais.Manual]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
  DMLista.cdsListaNfiscaisItens.Close;
  DMLista.cdsListaClientes.Close;
  DMLista.cdsListaCondPagto.Close;
  DMLista.cdsListaNaturezas.Close;
  DMLista.cdsListaTransportadoras.Close;
end;

procedure TFCadastrarListaNfiscais.SpeedButton1Click(Sender: TObject);
var
  s1: String;
begin
  inherited;
  if MessageDlg ('Tem certeza que deseja cancelar esta Nota Fiscal!?',
                           mtWarning, [mbyes, mbno], 0) = mryes then
  try
    DM.SCServer.Open;
    s1 := DM.SCServer.AppServer.CancelaNFiscal (vIndice[StringGrid1.row-1]);
    if s1 <> '' then Showmessage ('Erro ao gravar Registro: ' + s1);
    DM.EnviarEmail (Tabela, 'GRAVAR', s1, Novo);
  finally
//    DM.SCServer.Close;
    AtualizaLista;
  end;
end;

procedure TFCadastrarListaNfiscais.StringGrid1DrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if StringGrid1.Cells[6, ARow] = 'S' then
  begin
    StringGrid1.Canvas.Font.Color := clRed;
    StringGrid1.Canvas.Font.Style := [fsBold];
  end;
  StringGrid1.Canvas.TextRect(Rect, Rect.Left, Rect.Top, StringGrid1.Cells [ACol, ARow]);
end;

procedure TFCadastrarListaNfiscais.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  sbEditarClick (SpeedButton2);
end;

procedure TFCadastrarListaNfiscais.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  FConsultarNfiscaisSerie.Showmodal;
end;

end.
