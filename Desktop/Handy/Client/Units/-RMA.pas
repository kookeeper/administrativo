unit RMA;

interface

uses SysUtils, Classes, Cadastro, UDM, DB, RMAEquipamento, RMAItem, Variants,
  DBClient;

type
  TRMA = class(TCadastro)
    numero_assistencia: Integer;
    data_chamado: TDateTime;
    data_assistencia: TDateTime;
    cotacao_dolar: Double;
    cliente_sq: Integer;
    cond_pagto_sq: Variant;
    desp_chamado: Double;
    desp_htec_ad: Double;
    desp_desloc: Double;
    vlr_pecas: Double;
    vlr_total: Double;
    hora_inicio: TDateTime;
    hora_fim: TDateTime;
    garantia: Boolean;
    contrato: Boolean;
    vendedor_sq: Integer;
    frete: Boolean;
    Equipamentos: TList;
    Itens: TList;
  private
    Fassistencia_sq: Integer;
  protected
    procedure SetvIndice(const Value: Integer); override;
  public
    function salvar: Boolean;
    procedure proximaAssistencia;
    constructor Create;
    property assistencia_sq: Integer read Fassistencia_sq;
  end;

implementation

{ TRMA }

constructor TRMA.Create;
begin
  Fassistencia_sq := 0;
  numero_assistencia := 0;
  data_chamado := 0;
  data_assistencia := 0;
  cotacao_dolar := 0;
  cliente_sq := 0;
  cond_pagto_sq := null;
  desp_chamado := 0;
  desp_htec_ad := 0;
  desp_desloc := 0;
  vlr_pecas := 0;
  vlr_total := 0;
  hora_inicio := 0;
  hora_fim := 0;
  garantia := False;
  contrato := False;
  vendedor_sq := 0;
  frete := False;
  Equipamentos := TList.Create;
  Itens := TList.Create;

  Ftabela   := 'assistencias';
  FsqlLista := 'SELECT A.*, C.NOME_CLIENTE ' +
         'FROM assistencias A ' +
         'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = A.CLIENTE_SQ)';
  FcIndice := 'assistencia_sq';
  FcLista := TStringList.Create;
  FcLista.CommaText := 'Código=numero_assistencia, Nome=nome_cliente';
end;

procedure TRMA.proximaAssistencia;
var
  cdsLista: TClientDataSet;
begin
  cdsLista := TClientDataSet.Create(DM);
  cdsLista.RemoteServer := DM.SCServer;
  cdsLista.ProviderName := 'dspLista';

  DM.SCServer.AppServer.ExecSQL('UPDATE empresas SET NUMERO_ASSISTENCIA = NUMERO_ASSISTENCIA + 1');

  cdsLista.Close;
  DM.SCServer.AppServer.CriaLista ('SELECT NUMERO_ASSISTENCIA FROM EMPRESAS');
  cdsLista.Open;

  DM.SCServer.AppServer.ExecSQL('update assistencias set numero_assistencia = ' +
    cdsLista.FieldByName('NUMERO_ASSISTENCIA').AsString +
    ' where numero_assistencia = 0');
end;

function TRMA.salvar: Boolean;
var
  i: Integer;
  sql, garantiaStr, contratoStr, freteStr, condPagtoStr: String;
begin
  if garantia then
    garantiaStr := 'S'
  else
    garantiaStr := 'N';

  if contrato then
    contratoStr := 'S'
  else
    contratoStr := 'N';

  if frete then
    freteStr := 'S'
  else
    freteStr := 'N';

  if cond_pagto_sq = null then
    condPagtoStr := 'null'
  else
    condPagtoStr := QuotedStr(IntToStr(cond_pagto_sq));

  sql := Format(sqlUpdate, [
    numero_assistencia,
    QuotedStr(FormatDateTime('yyyy-mm-dd', data_chamado)),
    QuotedStr(FormatDateTime('yyyy-mm-dd', data_assistencia)),
    cotacao_dolar,
    cliente_sq,
    condPagtoStr,
    desp_chamado,
    desp_htec_ad,
    desp_desloc,
    vlr_pecas,
    vlr_total,
    QuotedStr(TimeToStr(hora_inicio)),
    QuotedStr(TimeToStr(hora_fim)),
    QuotedStr(garantiaStr),
    QuotedStr(contratoStr),
    vendedor_sq,
    QuotedStr(freteStr)
    ], fs);

  result := inherited salvar(sql);
  if result then
  begin
    for i := 0 to Equipamentos.Count - 1 do
      if result then
        result := TRMAEquipamento(Equipamentos.Items[i]).salvar;

    for i := 0 to Itens.Count - 1 do
      if result then
        result := TRMAItem(Itens.Items[i]).salvar;
  end;
  if (result) and (numero_assistencia = 0) then
    proximaAssistencia;

end;

procedure TRMA.SetvIndice(const Value: Integer);
begin
  FvIndice := Value;

  if Value <> 0 then
  begin
    DM.cdsListaAssistencias.Open;
    DM.cdsListaAssistencias.Locate(FcIndice, Value, []);

    Fassistencia_sq     := Value;
    numero_assistencia := DM.cdsListaAssistencias.FieldByName('numero_assistencia').AsInteger;
    data_chamado       := DM.cdsListaAssistencias.FieldByName('data_chamado').AsDateTime;
    data_assistencia   := DM.cdsListaAssistencias.FieldByName('data_assistencia').AsDateTime;
    cotacao_dolar      := DM.cdsListaAssistencias.FieldByName('cotacao_dolar').AsFloat;
    cliente_sq         := DM.cdsListaAssistencias.FieldByName('cliente_sq').AsInteger;
    cond_pagto_sq      := DM.cdsListaAssistencias.FieldByName('cond_pagto_sq').AsVariant;
    desp_chamado       := DM.cdsListaAssistencias.FieldByName('desp_chamado').AsFloat;
    desp_htec_ad       := DM.cdsListaAssistencias.FieldByName('desp_htec_ad').AsFloat;
    desp_desloc        := DM.cdsListaAssistencias.FieldByName('desp_desloc').AsFloat;
    vlr_pecas          := DM.cdsListaAssistencias.FieldByName('vlr_pecas').AsFloat;
    vlr_total          := DM.cdsListaAssistencias.FieldByName('vlr_total').AsFloat;
    hora_inicio        := DM.cdsListaAssistencias.FieldByName('hora_inicio').AsDateTime;
    hora_fim           := DM.cdsListaAssistencias.FieldByName('hora_fim').AsDateTime;
    garantia           := DM.cdsListaAssistencias.FieldByName('garantia').AsString='S';
    contrato           := DM.cdsListaAssistencias.FieldByName('contrato').AsString='S';
    vendedor_sq        := DM.cdsListaAssistencias.FieldByName('vendedor_sq').AsInteger;
    frete              := DM.cdsListaAssistencias.FieldByName('frete').AsString='S'; 

    ListaEquipamentos(assistencia_sq, Equipamentos);
    ListaItens(assistencia_sq, Itens);

    DM.cdsListaAssistencias.Close;
  end;

  if FvIndice = 0 then
    sqlUpdate := 'INSERT INTO assistencias (numero_assistencia, data_chamado, ' +
      'data_assistencia, cotacao_dolar, cliente_sq, cond_pagto_sq, desp_chamado, ' +
      'desp_htec_ad, desp_desloc, vlr_pecas, vlr_total, hora_inicio, hora_fim, ' +
      'garantia, contrato, vendedor_sq, frete) ' +
      ' VALUES (%u, %s, ' +
      '%s, %n, %u, %s, %n, ' +
      '%n, %n, %n, %n, %s, %s, ' +
      '%s, %s, %u, %s)'
  else
    sqlUpdate := 'UPDATE assistencias set numero_assistencia = %u, data_chamado = %s, ' +
      'data_assistencia = %s, cotacao_dolar = %n, cliente_sq = %u, cond_pagto_sq = %s, ' +
      'desp_chamado = %n, desp_htec_ad = %n, desp_desloc = %n, vlr_pecas = %n, ' +
      'vlr_total = %n, hora_inicio = %s, hora_fim = %s, garantia = %s, contrato = %s, ' +
      'vendedor_sq = %u, frete = %s WHERE assistencia_sq = ' + IntToStr(FvIndice);
end;

end.
