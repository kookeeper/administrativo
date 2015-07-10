unit UCadastrarListaPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaPedidos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbApagarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaPedidos: TFCadastrarListaPedidos;

implementation

uses UDM, UCadastrarFormPedidos, DBCtrls, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaPedidos.FormCreate(Sender: TObject);
begin
  Tabela := 'tbPedidos';
  Sql := 'SELECT P.*, C.NOME_CLIENTE FROM PEDIDOS P ' +
         'LEFT JOIN CLIENTES C ON (C.CLIENTE_SQ = P.CLIENTE_SQ)';

  SetLength (cLista, 3);
  SetLength (nLista, 3);
  SetLength (cIndice, 1);

  cIndice := 'PEDIDO_SQ';

  cLista[0] := 'NUMERO_PEDIDO';
  cLista[1] := 'DATA_PEDIDO';
  cLista[2] := 'NOME_CLIENTE';

  nLista[0] := 'Número';
  nLista[1] := 'Data';
  nLista[2] := 'Cliente';
  inherited;
  cbOrdem.Text := 'Número';
end;

procedure TFCadastrarListaPedidos.sbEditarClick(Sender: TObject);
var
  i, row: integer;
  Itens: array of variant;
begin
  inherited;
  Application.CreateForm (TFCadastrarFormPedidos, FCadastrarFormPedidos);
  FCadastrarFormPedidos.edDtPedido.ReadOnly := DM.alt_dtped = 'N';
  FCadastrarFormPedidos.edNrPedido.ReadOnly := DM.alt_nrped = 'N';
  FCadastrarFormPedidos.bbOk.Enabled := True;
  DMLista.cdsListaClientes.Open;
  DMLista.cdsListaCondPagto.Open;
  DMLista.cdsListaNaturezas.Open;
  DMLista.cdsListaTransportadoras.Open;
  DMLista.cdsListaVendedores.Open;
  DMLista.cdsListaPedidosItens.Params.ParamByName('PEDIDO_SQ').AsInteger := cdsLista.FieldByName ('PEDIDO_SQ').AsInteger;
  DMLista.cdsListaPedidosItens.Open;
  if not novo then
  begin
    FCadastrarFormPedidos.bbOk.Enabled        := cdsLista.FieldByName('NFISCAL_SQ').AsInteger = 0;
    FCadastrarFormPedidos.edNrPedido.Text     := cdsLista.FieldByName('NUMERO_PEDIDO').AsString;
    FCadastrarFormPedidos.edDtPedido.Text     := cdsLista.FieldByName('DATA_PEDIDO').AsString;
    FCadastrarFormPedidos.edDolar.Text        := cdsLista.FieldByName('COTACAO_DOLAR').AsString;
    FCadastrarFormPedidos.edDemonstracao.Text := cdsLista.FieldByName('DIAS_DEMONSTRACAO').AsString;
    FCadastrarFormPedidos.edFrete.Text        := cdsLista.FieldByName('VLR_FRETE').AsString;
    FCadastrarFormPedidos.edPctJuros.Text     := cdsLista.FieldByName('PCT_JUROS').AsString;
    FCadastrarFormPedidos.edVlrJuros.Text     := cdsLista.FieldByName('VLR_JUROS').AsString;
    FCadastrarFormPedidos.rgFrete.ItemIndex   := cdsLista.FieldByName('FRETE_TRANSP').AsInteger - 1;
    FCadastrarFormPedidos.edVlrDesc.Text      := cdsLista.FieldByName('VLR_DESC').Text;
    FCadastrarFormPedidos.edBaseIcms.Text     := cdsLista.FieldByName('BASE_ICMS').Text;
    FCadastrarFormPedidos.edVlrIcms.Text      := cdsLista.FieldByName('VLR_ICMS').Text;
    FCadastrarFormPedidos.edVlrIpi.Text       := cdsLista.FieldByName('VLR_IPI').Text;
    FCadastrarFormPedidos.edVlrProd.Text      := cdsLista.FieldByName('VLR_PRODUTOS').Text;
    FCadastrarFormPedidos.edPctDesc.Text      := cdsLista.FieldByName('PCT_DESC').Text;
    FCadastrarFormPedidos.edVlrProdIpi.Text   := FloattoStr(cdsLista.FieldByName('VLR_PRODUTOS').Value + cdsLista.FieldByName('VLR_IPI').Value);
    FCadastrarFormPedidos.mmObservacaoPed.Lines.Text := cdsLista.FieldByName('OBSERVACAO_PED').AsString;
    FCadastrarFormPedidos.mmObservacaoNf.Lines.Text  := cdsLista.FieldByName('OBSERVACAO_NF').AsString;
    FCadastrarFormPedidos.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('CLIENTE_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox2.KeyValue := cdsLista.FieldByName('CLIENTE_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox3.KeyValue := cdsLista.FieldByName('COND_PAGTO_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox4.KeyValue := cdsLista.FieldByName('COND_PAGTO_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox5.KeyValue := cdsLista.FieldByName('NATUREZA_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox6.KeyValue := cdsLista.FieldByName('NATUREZA_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox7.KeyValue := cdsLista.FieldByName('TRANSPORTADORA_SQ').Text;
    FCadastrarFormPedidos.DBLookupComboBox8.KeyValue := cdsLista.FieldByName('VENDEDOR_SQ').Text;

    DMLista.cdsListaPedidosItens.Last;

    SetLength(FCadastrarFormPedidos.vIndice, DMLista.cdsListaPedidosItens.RecordCount);

    if DMLista.cdsListaPedidosItens.RecordCount > 0 then
      SetLength(FCadastrarFormPedidos.cProduto, DMLista.cdsListaPedidosItens.RecordCount) else
      SetLength(FCadastrarFormPedidos.cProduto, 1);

    DMLista.cdsListaPedidosItens.First;
    row := 1;
    While not DMLista.cdsListaPedidosItens.Eof do
    begin
      inc (row);
      FCadastrarFormPedidos.StringGrid1.RowCount := row;
      FCadastrarFormPedidos.StringGrid1.Cells [1,  row-1] := DMLista.cdsListaPedidosItensCODIGO_PECA.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [2,  row-1] := DMLista.cdsListaPedidosItensDESCRICAO_PECA.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [3,  row-1] := DMLista.cdsListaPedidosItensQTDE_PEDIDO_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [4,  row-1] := DMLista.cdsListaPedidosItensPRECO_UNIT.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [5,  row-1] := DMLista.cdsListaPedidosItensVLR_DESC.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [6,  row-1] := DMLista.cdsListaPedidosItensPCT_DESC.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [7,  row-1] := DMLista.cdsListaPedidosItensALIQ_ICMS_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [8,  row-1] := DMLista.cdsListaPedidosItensVLR_ICMS_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [9,  row-1] := DMLista.cdsListaPedidosItensALIQ_IPI_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [10, row-1] := DMLista.cdsListaPedidosItensVLR_IPI_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [11, row-1] := DMLista.cdsListaPedidosItensVLR_TOTAL_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [12, row-1] := DMLista.cdsListaPedidosItensNR_SERIE_ITEM.AsString;
      FCadastrarFormPedidos.StringGrid1.Cells [13, row-1] := InttoStr (DMLista.cdsListaPecasQTDE_PECA_LOJA.AsInteger + DMLista.cdsListaPecasQTDE_PECA_ARMAZEM.AsInteger);
      FCadastrarFormPedidos.StringGrid1.Cells [14, row-1] := DMLista.cdsListaPedidosItensCODIGO_NBM.AsString;
      FCadastrarFormPedidos.vIndice[row-2]  := DMLista.cdsListaPedidosItensPEDIDO_ITEM_SQ.AsString;
      FCadastrarFormPedidos.cProduto[row-2] := DMLista.cdsListaPedidosItensPECA_SQ.AsInteger;
      DMLista.cdsListaPedidosItens.Next;
    end;
  end
  else
  begin
    FCadastrarFormPedidos.edNrPedido.Text := '0';
    FCadastrarFormPedidos.edDtPedido.Text := DatetoStr (Date);
    SetLength(FCadastrarFormPedidos.cProduto, 1);
  end;
  if FCadastrarFormPedidos.ShowModal = mrOk then
  try
    if FCadastrarFormPedidos.edDemonstracao.Text = '' then
      FCadastrarFormPedidos.edDemonstracao.Text := '0';

    SetLength (Itens, FCadastrarFormPedidos.StringGrid1.RowCount-1);
    for i := 0 to (FCadastrarFormPedidos.StringGrid1.RowCount-2) do
    if (High (FCadastrarFormPedidos.cProduto) >= 0) and (FCadastrarFormPedidos.cProduto[0] <> 0) then
    begin
      Itens[i] := VarArrayOf ([FCadastrarFormPedidos.cProduto[i],
      FCadastrarFormPedidos.StringGrid1.Cells [1,  i+1],
      FCadastrarFormPedidos.StringGrid1.Cells [2,  i+1],
      StrtoInt (FCadastrarFormPedidos.StringGrid1.Cells [3,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [4,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [5,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [6,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [7,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [8,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [9,  i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [10, i+1]),
      StrtoFloat (FCadastrarFormPedidos.StringGrid1.Cells [11, i+1]),
      FCadastrarFormPedidos.StringGrid1.Cells [12, i+1]]);
    end;

    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('PEDIDOS', Novo, Valores,
      VarArrayOf ([
        StrtoInt (FCadastrarFormPedidos.edNrPedido.Text),
        StrToDateTime (FCadastrarFormPedidos.edDtPedido.Text),
        StrtoFloat (FCadastrarFormPedidos.edDolar.Text),
        StrtoInt (FCadastrarFormPedidos.edDemonstracao.Text),
        StrtoFloat (FCadastrarFormPedidos.edFrete.Text),
        StrtoFloat (FCadastrarFormPedidos.edPctJuros.Text),
        StrtoFloat (FCadastrarFormPedidos.edVlrJuros.Text),
        FCadastrarFormPedidos.rgFrete.ItemIndex,
        StrtoFloat (FCadastrarFormPedidos.edVlrDesc.Text),
        StrtoFloat (FCadastrarFormPedidos.edBaseIcms.Text),
        StrtoFloat (FCadastrarFormPedidos.edVlrIcms.Text),
        StrtoFloat (FCadastrarFormPedidos.edVlrIpi.Text),
        StrtoFloat (FCadastrarFormPedidos.edVlrProd.Text),
        StrtoFloat (FCadastrarFormPedidos.edPctDesc.Text),
        FCadastrarFormPedidos.mmObservacaoPed.Lines.Text,
        FCadastrarFormPedidos.mmObservacaoNf.Lines.Text,
        FCadastrarFormPedidos.DBLookupComboBox1.KeyValue,
        FCadastrarFormPedidos.DBLookupComboBox3.KeyValue,
        FCadastrarFormPedidos.DBLookupComboBox5.KeyValue,
        FCadastrarFormPedidos.DBLookupComboBox7.KeyValue,
        FCadastrarFormPedidos.DBLookupComboBox8.KeyValue,
        High(FCadastrarFormPedidos.xItens),
        FCadastrarFormPedidos.xItens,
        High(Itens),
        Itens,
        High(FCadastrarFormPedidos.cProduto),
        FCadastrarFormPedidos.cProduto,
        FCadastrarFormPedidos.vIndice]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
  DMLista.cdsListaPedidosItens.Close;
  DMLista.cdsListaClientes.Close;
  DMLista.cdsListaCondPagto.Close;
  DMLista.cdsListaNaturezas.Close;
  DMLista.cdsListaTransportadoras.Close;
end;

procedure TFCadastrarListaPedidos.sbApagarClick(Sender: TObject);
begin
  if (not cdsLista.Locate('PEDIDO_SQ', vIndice[StringGrid1.row-1], [])) or
    (cdsLista.FieldByName('NFISCAL_SQ').AsInteger <> 0) then
    raise Exception.Create('Pedido Vinculado a uma Nota Fiscal! Não pode ser Excluído!');

  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  try
    DM.SCServer.Open;
    DMLista.SCServerLista.Open;

    DMLista.cdsListaPedidosItens.Params.ParamByName('PEDIDO_SQ').AsString := vIndice[StringGrid1.row-1];
    DMLista.cdsListaPedidosItens.Open;
    While not DMLista.cdsListaPedidosItens.Eof do
    begin
      Mensagem := DM.SCServer.AppServer.ApagaRegistro (VarArrayOf (['tbPedidos_Itens',
        'PEDIDO_ITEM_SQ', DMLista.cdsListaPedidosItensPEDIDO_ITEM_SQ.AsString]));
      DMLista.cdsListaPedidosItens.Next;
    end;
    DMLista.cdsListaPedidosItens.Close;
//    DMLista.SCServerLista.Close;

    Mensagem := DM.SCServer.AppServer.ApagaRegistro (VarArrayOf (['tbPedidos',
      cIndice, vIndice[StringGrid1.row-1]]));
//    DM.SCServer.Close;

    if Mensagem <> '' then
      raise Exception.Create('Houve um erro ao tentar apagar este registro!' + chr(13) + Mensagem);

    AtualizaLista;
  except
    on E: Exception do
    begin
      Showmessage (E.Message);
      DM.EnviarEmail (Tabela, 'APAGAR', Mensagem, Novo);
    end;
  end;
end;

end.
