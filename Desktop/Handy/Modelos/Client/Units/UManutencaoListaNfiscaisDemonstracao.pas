unit UManutencaoListaNfiscaisDemonstracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, Grids, StdCtrls, Buttons, ToolWin,
  ComCtrls, DBGrids, DBClient;

type
  TFManutencaoListaNFiscaisDemonstracao = class(TFCadastrarListaComum)
    cbAberto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure cbAbertoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FManutencaoListaNFiscaisDemonstracao: TFManutencaoListaNFiscaisDemonstracao;

implementation

uses UDM, UManutencaoFormNfiscaisDemonstracao, UDMLista;

{$R *.dfm}

procedure TFManutencaoListaNFiscaisDemonstracao.FormCreate(
  Sender: TObject);
begin
  Tabela := 'tbNfiscais';
  Sql := 'SELECT N.*, C.NOME_CLIENTE, PE.NUMERO_PEDIDO, PE.DATA_PEDIDO, NA.TIPO_NFISCAL ' +
         'FROM NFISCAIS N ' +
         'LEFT JOIN PEDIDOS    PE ON (PE.PEDIDO_SQ = N.PEDIDO_SQ) ' +
         'LEFT JOIN CLIENTES   C  ON (C.CLIENTE_SQ = N.CLIENTE_SQ) ' +
         'LEFT JOIN NATUREZAS  NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ) ';

  Filtro1 := 'WHERE NA.TIPO_NFISCAL = 1 AND N.CANCELADA <> ''S''';

  SetLength (cLista, 9);
  SetLength (nLista, 9);
  SetLength (cIndice, 1);

  cIndice := 'NFISCAL_SQ';

  cLista[0] := 'NUMERO_NFISCAL';
  cLista[1] := 'DTEMISSAO_NFISCAL';
  cLista[2] := 'NOME_CLIENTE';
  cLista[3] := 'VLR_TOTAL';
  cLista[4] := 'DIAS_DEMONSTRACAO';
  cLista[5] := 'NR_NFISCAL_RETORNO';
  cLista[6] := 'DIAS_DEMONSTRACAO';
  cLista[7] := 'DIAS_DEMONSTRACAO';
  cLista[8] := 'RETORNO_PRODUTO';

  nLista[0] := 'Número';
  nLista[1] := 'Data Emissão';
  nLista[2] := 'Nome do Cliente';
  nLista[3] := 'Valor N.Fiscal';
  nLista[4] := 'Dias em Demonstração';
  nLista[5] := 'Nota de Retorno';
  nLista[6] := 'Data de Vencimento';
  nLista[7] := 'Data Limite';
  nLista[8] := 'Retorno do Produto';
  inherited;
  cbOrdem.Text := 'Número';
end;

procedure TFManutencaoListaNFiscaisDemonstracao.sbEditarClick(
  Sender: TObject);
var
  i: Integer;
begin
  inherited;
  Application.CreateForm (TFManutencaoFormNfiscaisDemonstracao, FManutencaoFormNfiscaisDemonstracao);

  if StringGrid1.Cells[5, StringGrid1.row] <> '' then
    i := StrtoInt (StringGrid1.Cells[5, StringGrid1.row])
    else i := 0;

  FManutencaoFormNfiscaisDemonstracao.edNrNfiscal.Text        := cdsLista.FieldByName('NUMERO_NFISCAL').AsString;
  FManutencaoFormNfiscaisDemonstracao.edNrPedido.Text         := cdsLista.FieldByName('NUMERO_PEDIDO').AsString;
  FManutencaoFormNfiscaisDemonstracao.edNrPedido.Tag          := cdsLista.FieldByName('PEDIDO_SQ').AsInteger;
  FManutencaoFormNfiscaisDemonstracao.edDolar.Text            := cdsLista.FieldByName('COTACAO_DOLAR').AsString;
  FManutencaoFormNfiscaisDemonstracao.edDtPedido.Text         := cdsLista.FieldByName('DATA_PEDIDO').AsString;
  FManutencaoFormNfiscaisDemonstracao.edDtEmissao.Text        := cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsString;
  FManutencaoFormNfiscaisDemonstracao.edDtSaida.Text          := cdsLista.FieldByName('DTSAIDA_NFISCAL').AsString;
  FManutencaoFormNfiscaisDemonstracao.edDtVencto.Text         := DatetoStr (StrtoDate (StringGrid1.Cells[2, StringGrid1.row]) + i);
  FManutencaoFormNfiscaisDemonstracao.edDtLimite.Text         := DatetoStr (StrtoDate (StringGrid1.Cells[2, StringGrid1.row]) + DM.Dias_dem);
  FManutencaoFormNfiscaisDemonstracao.edDemonstracao.Text     := cdsLista.FieldByName('DIAS_DEMONSTRACAO').AsString;
  FManutencaoFormNfiscaisDemonstracao.edCliente.Text          := cdsLista.FieldByName('NOME_CLIENTE').AsString;
  FManutencaoFormNfiscaisDemonstracao.edNrNFiscalRet.Text     := cdsLista.FieldByName('NR_NFISCAL_RETORNO').AsString;
  FManutencaoFormNfiscaisDemonstracao.edDtNfiscalRet.Text     := cdsLista.FieldByName('DT_NFISCAL_RETORNO').AsString;
  FManutencaoFormNFiscaisDemonstracao.cbRetProduto.Checked    := cdsLista.FieldByName('RETORNO_PRODUTO').AsString = 'S';
  FManutencaoFormNFiscaisDemonstracao.mmObservacao.Lines.Text := cdsLista.FieldByName('RETORNO_OBSERVACAO').AsString;

  if FManutencaoFormNfiscaisDemonstracao.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('NFDEMONSTRACAO', Novo, Valores,
      VarArrayOf ([
        FManutencaoFormNFiscaisDemonstracao.edNrNFiscalRet.Text,
        StrtoDate (FManutencaoFormNFiscaisDemonstracao.edDtNfiscalRet.Text),
        FManutencaoFormNFiscaisDemonstracao.cbRetProduto.Checked,
        FManutencaoFormNFiscaisDemonstracao.mmObservacao.Lines.Text]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

procedure TFManutencaoListaNFiscaisDemonstracao.StringGrid1DrawCell(
  Sender: TObject; ACol, ARow: Integer; Rect: TRect;
  State: TGridDrawState);
var
  Texto: String;
  i: integer;
begin
  inherited;
  Texto := StringGrid1.Cells [ACol, ARow];

  if ARow <> 0 then
  begin
    if StringGrid1.Cells[5, ARow] <> '' then
      i := StrtoInt (StringGrid1.Cells[5, ARow])
      else i := 0;
    if ACol = 7 then // data de vencimento
      Texto := DatetoStr (i + StrtoDate (StringGrid1.Cells[2, ARow]));

    if ACol = 8 then // data limite
      Texto := DatetoStr (DM.dias_dem + StrtoDate (StringGrid1.Cells[2, ARow]));

    if (StringGrid1.Cells[6, ARow] <> '') and // nota de retorno emitida
       (StringGrid1.Cells[9, ARow] = 'S') then // retorno do produto
      StringGrid1.Canvas.Font.Color := clInactiveCaption
    else
    begin
      if i + StrToDate(StringGrid1.Cells[2, ARow]) < Date then
      begin
        StringGrid1.Canvas.Font.Color := clRed;
        StringGrid1.Canvas.Font.Style := [fsBold];
      end
      else StringGrid1.Canvas.Font.Color := clWindowText;
    end;
  end;

  StringGrid1.Canvas.TextRect(Rect, Rect.Left, Rect.Top, Texto);
end;

procedure TFManutencaoListaNFiscaisDemonstracao.cbAbertoClick(
  Sender: TObject);
begin
  inherited;
  if cbAberto.Checked then
    Filtro1 := 'WHERE NA.TIPO_NFISCAL = 1 AND N.CANCELADA <> ''S'' AND (NR_NFISCAL_RETORNO = 0 OR NR_NFISCAL_RETORNO IS NULL)' else
    Filtro1 := 'WHERE NA.TIPO_NFISCAL = 1 AND N.CANCELADA <> ''S''';
  sbFiltro.Click;
end;

end.
