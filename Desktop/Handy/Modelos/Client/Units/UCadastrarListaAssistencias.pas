unit UCadastrarListaAssistencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaAssistencias = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaAssistencias: TFCadastrarListaAssistencias;

implementation

uses UDM, UDMLista, UCadastrarFormAssistencias;

{$R *.DFM}

procedure TFCadastrarListaAssistencias.FormCreate(Sender: TObject);
begin
  Tabela := 'tbAssistencias';
  Sql := 'SELECT A.*, C.NOME_CLIENTE ' +
         'FROM ASSISTENCIAS A ' +
         'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = A.CLIENTE_SQ)';
  SetLength (cLista, 2);
  SetLength (nLista, 2);
  SetLength (cIndice, 1);

  cIndice := 'ASSISTENCIA_SQ';

  cLista[0] := 'NUMERO_ASSISTENCIA';
  cLista[1] := 'NOME_CLIENTE';

  nLista[0] := 'Código';
  nLista[1] := 'Nome';
  inherited;
end;

procedure TFCadastrarListaAssistencias.sbEditarClick(Sender: TObject);
var
  i, row: integer;
  Itens, Equip: array of variant;
begin
  inherited;
  Application.CreateForm (TFCadastrarFormAssistencias, FCadastrarFormAssistencias);
  FCadastrarFormAssistencias.bbOk.Enabled := True;
  DMLista.cdsListaClientes.Open;
  DMLista.cdsListaCondPagto.Open;
  DMLista.cdsListaAssistenciasEquip.Params.ParamByName('ASSISTENCIA_SQ').AsInteger := cdsLista.FieldByName ('ASSISTENCIA_SQ').AsInteger;
  DMLista.cdsListaAssistenciasEquip.Open;
  DMLista.cdsListaAssistenciasItens.Params.ParamByName('Assistencia_SQ').AsInteger := cdsLista.FieldByName ('Assistencia_SQ').AsInteger;
  DMLista.cdsListaAssistenciasItens.Open;
  if not novo then
  begin
    FCadastrarFormAssistencias.edNrAssistencia.Text  := cdsLista.FieldByName('NUMERO_ASSISTENCIA').AsString;
    FCadastrarFormAssistencias.edDtAssistencia.Text  := cdsLista.FieldByName('DATA_ASSISTENCIA').AsString;
    FCadastrarFormAssistencias.edDolar.Text          := cdsLista.FieldByName('COTACAO_DOLAR').AsString;
    FCadastrarFormAssistencias.edDtChamado.Text      := cdsLista.FieldByName('DATA_CHAMADO').AsString;
    FCadastrarFormAssistencias.edDespChamado.Text    := cdsLista.FieldByName('DESP_CHAMADO').AsString;
    FCadastrarFormAssistencias.edDespHTecAd.Text     := cdsLista.FieldByName('DESP_HTEC_AD').AsString;
    FCadastrarFormAssistencias.edDespDesloc.Text     := cdsLista.FieldByName('DESP_DESLOC').AsString;
    FCadastrarFormAssistencias.edDespPecas.Text      := cdsLista.FieldByName('VLR_PECAS').asString;
    FCadastrarFormAssistencias.edDespTotal.Text      := cdsLista.FieldByName('VLR_TOTAL').Text;
    FCadastrarFormAssistencias.edHrInicio.Text       := FormatDateTime ('hh:nn', cdsLista.FieldByName('HORA_INICIO').AsDateTime);
    FCadastrarFormAssistencias.edHrFim.Text          := FormatDateTime ('hh:nn', cdsLista.FieldByName('HORA_FIM').AsDateTime);
    FCadastrarFormAssistencias.cbGarantia.Checked    := cdsLista.FieldByName('GARANTIA').Text = 'S';
    FCadastrarFormAssistencias.cbContrato.Checked    := cdsLista.FieldByName('CONTRATO').Text = 'S';
    FCadastrarFormAssistencias.mmServicos.Lines.Text := cdsLista.FieldByName ('SERVICOS').AsString;
    FCadastrarFormAssistencias.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('CLIENTE_SQ').Text;
    FCadastrarFormAssistencias.DBLookupComboBox2.KeyValue := cdsLista.FieldByName('CLIENTE_SQ').Text;
    FCadastrarFormAssistencias.DBLookupComboBox3.KeyValue := cdsLista.FieldByName('COND_PAGTO_SQ').Text;
    FCadastrarFormAssistencias.DBLookupComboBox4.KeyValue := cdsLista.FieldByName('COND_PAGTO_SQ').Text;

    DMLista.cdsListaAssistenciasEquip.Last;

    for i := 0 to High (FCadastrarFormAssistencias.vEquip) do
      SetLength(FCadastrarFormAssistencias.vEquip[i], DMLista.cdsListaAssistenciasEquip.RecordCount);

    if DMLista.cdsListaAssistenciasEquip.RecordCount > 0 then
      SetLength(FCadastrarFormAssistencias.pEquip, DMLista.cdsListaAssistenciasEquip.RecordCount) else
      SetLength(FCadastrarFormAssistencias.pEquip, 1);

    DMLista.cdsListaAssistenciasEquip.First;
    row := 1;
    While not DMLista.cdsListaAssistenciasEquip.Eof do
    begin
      inc (row);
      FCadastrarFormAssistencias.sgEquip.RowCount := row;
      FCadastrarFormAssistencias.sgEquip.Cells [1,  row-1] := DMLista.cdsListaAssistenciasEquip.FieldByName ('DESCRICAO_PRODUTO').AsString;
      FCadastrarFormAssistencias.sgEquip.Cells [2,  row-1] := DMLista.cdsListaAssistenciasEquip.FieldByName ('NR_SERIE_EQUIP').AsString;
      FCadastrarFormAssistencias.sgEquip.Cells [3,  row-1] := DMLista.cdsListaAssistenciasEquip.FieldByName ('DEFEITO').AsString;
      FCadastrarFormAssistencias.vEquip[row-2]             := DMLista.cdsListaAssistenciasEquip.FieldByName ('ASSISTENCIA_EQUIP_SQ').AsString;
      FCadastrarFormAssistencias.pEquip[row-2]             := DMLista.cdsListaAssistenciasEquipMODELO_SQ.AsInteger;
      DMLista.cdsListaAssistenciasEquip.Next;
    end;

    DMLista.cdsListaAssistenciasItens.Last;

    for i := 0 to High (FCadastrarFormAssistencias.vItens) do
      SetLength(FCadastrarFormAssistencias.vItens[i], DMLista.cdsListaAssistenciasItens.RecordCount);

    if DMLista.cdsListaAssistenciasItens.RecordCount > 0 then
      SetLength(FCadastrarFormAssistencias.pItens, DMLista.cdsListaAssistenciasItens.RecordCount) else
      SetLength(FCadastrarFormAssistencias.pItens, 1);

    DMLista.cdsListaAssistenciasItens.First;
    row := 1;
    While not DMLista.cdsListaAssistenciasItens.Eof do
    begin
      inc (row);
      FCadastrarFormAssistencias.sgItens.RowCount := row;
      FCadastrarFormAssistencias.sgItens.Cells [1,  row-1] := DMLista.cdsListaAssistenciasItens.FieldByName ('DESCRICAO_PRODUTO').AsString;
      FCadastrarFormAssistencias.sgItens.Cells [2,  row-1] := DMLista.cdsListaAssistenciasItens.FieldByName ('QTDE_Assistencia_ITEM').AsString;
      FCadastrarFormAssistencias.sgItens.Cells [3,  row-1] := DMLista.cdsListaAssistenciasItens.FieldByName ('PRECO_UNIT').AsString;
      FCadastrarFormAssistencias.sgItens.Cells [4,  row-1] := DMLista.cdsListaAssistenciasItens.FieldByName ('QTDE_Assistencia_ITEM').Value * DMLista.cdsListaAssistenciasItens.FieldByName ('PRECO_UNIT').Value;
      FCadastrarFormAssistencias.vItens[row-2]             := DMLista.cdsListaAssistenciasItens.FieldByName ('Assistencia_ITEM_SQ').AsString;
      FCadastrarFormAssistencias.pItens[row-2]             := DMLista.cdsListaAssistenciasItensPECA_SQ.AsInteger;
      DMLista.cdsListaAssistenciasItens.Next;
    end;
  end
  else
  begin
    FCadastrarFormAssistencias.edNrAssistencia.Text := '0';
    FCadastrarFormAssistencias.edDtAssistencia.Text := FormatDateTime ('dd/mm/yyyy',Date);
    FCadastrarFormAssistencias.edDtChamado.Text     := FormatDateTime ('dd/mm/yyyy',Date);
    FCadastrarFormAssistencias.edHrInicio.Text      := FormatDateTime ('hh:nn', Time);
  end;
  if FCadastrarFormAssistencias.ShowModal = mrOk then
  try
    SetLength (Equip, FCadastrarFormAssistencias.sgEquip.RowCount-1);
    for i := 0 to (FCadastrarFormAssistencias.sgEquip.RowCount-2) do
    if (High (FCadastrarFormAssistencias.pEquip) >= 0) and (FCadastrarFormAssistencias.pEquip[0] <> 0) then
    begin
      Equip[i] := VarArrayOf ([FCadastrarFormAssistencias.pEquip[i], FCadastrarFormAssistencias.sgEquip.Cells [2,  i+1],
      FCadastrarFormAssistencias.sgEquip.Cells [3,  i+1]]);
    end;

    SetLength (Itens, FCadastrarFormAssistencias.sgItens.RowCount-1);
    for i := 0 to (FCadastrarFormAssistencias.sgItens.RowCount-2) do
    if (High (FCadastrarFormAssistencias.pItens) >= 0) and (FCadastrarFormAssistencias.pItens[0] <> 0) then
    begin
      Itens[i] := VarArrayOf ([FCadastrarFormAssistencias.pItens[i], StrtoInt (FCadastrarFormAssistencias.sgItens.Cells [2,  i+1]),
      StrtoFloat (FCadastrarFormAssistencias.sgItens.Cells [3,  i+1])]);
    end;


    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('ASSISTENCIAS', Novo, Valores,
      VarArrayOf ([
        StrtoInt (FCadastrarFormAssistencias.edNrAssistencia.Text),
        StrtoDate (FCadastrarFormAssistencias.edDtChamado.Text),
        StrtoDate (FCadastrarFormAssistencias.edDtAssistencia.Text),
        StrtoFloat (FCadastrarFormAssistencias.edDolar.Text),
        FCadastrarFormAssistencias.DBLookupComboBox1.KeyValue,
        FCadastrarFormAssistencias.DBLookupComboBox3.KeyValue,
        StrtoFloat (FCadastrarFormAssistencias.edDespChamado.Text),
        StrtoFloat (FCadastrarFormAssistencias.edDespHTecAd.Text),
        StrtoFloat (FCadastrarFormAssistencias.edDespDesloc.Text),
        StrtoFloat (FCadastrarFormAssistencias.edDespPecas.Text),
        StrtoFloat (FCadastrarFormAssistencias.edDespTotal.Text),
        StrToTime (FCadastrarFormAssistencias.edHrInicio.Text),
        StrToTime (FCadastrarFormAssistencias.edHrFim.Text),
        FCadastrarFormAssistencias.cbGarantia.Checked,
        FCadastrarFormAssistencias.cbContrato.Checked,
        FCadastrarFormAssistencias.mmServicos.Lines.Text,
        High(FCadastrarFormAssistencias.xEquip),
        FCadastrarFormAssistencias.xEquip,
        High(Equip),
        Equip,
        High(FCadastrarFormAssistencias.pEquip), // 20
        FCadastrarFormAssistencias.pEquip,
        FCadastrarFormAssistencias.vEquip,
        High(FCadastrarFormAssistencias.xItens),
        FCadastrarFormAssistencias.xItens,
        High(Itens),
        Itens,
        High(FCadastrarFormAssistencias.pItens),
        FCadastrarFormAssistencias.pItens,
        FCadastrarFormAssistencias.vItens]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
  DMLista.cdsListaAssistenciasItens.Close;
  DMLista.cdsListaAssistenciasEquip.Close;
  DMLista.cdsListaClientes.Close;
  DMLista.cdsListaCondPagto.Close;
  DMLista.cdsListaNaturezas.Close;
  DMLista.cdsListaTransportadoras.Close;
end;

end.
