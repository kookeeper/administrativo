unit RMAEquipamento;

interface

uses SysUtils, UDM, DB, Classes, Cadastro, DBClient, Produto;

type
  TAssistenciasEquipamento = class(TCadastro)
    assistencia_sq: Integer;
    produto: TProduto;
    nr_serie_equip: String;
    defeito: String;
    servicos: String;
  private
    Fassistencia_equip_sq: Integer;
  protected
    procedure SetvIndice(const Value: Integer); override;
  public
    function salvar: Boolean;
    constructor Create;
    property assistencia_equip_sq: Integer read Fassistencia_equip_sq;
  end;

  procedure ListaEquipamentos(assistencia_sq: Integer; lista: TList);

implementation

{ TAssistenciasEquipamento }

constructor TAssistenciasEquipamento.Create;
begin
  Fassistencia_equip_sq := 0;
  assistencia_sq := 0;
  produto := TProduto.Create;
  nr_serie_equip := '';
  defeito := '';
  servicos := '';

  Ftabela   := 'assistencias_equips';
  FcIndice := 'assistencia_equip_sq';
end;

function TAssistenciasEquipamento.salvar: Boolean;
var
  sql: String;
begin
  sql := Format(sqlUpdate, [
    assistencia_sq,
    produto.produto_sq,
    QuotedStr(nr_serie_equip),
    QuotedStr(defeito),
    QuotedStr(servicos)
    ], fs);

  result := inherited salvar(sql);
end;

procedure TAssistenciasEquipamento.SetvIndice(const Value: Integer);
var
  cdsLista: TClientDataSet;
begin
  FvIndice := Value;

  if Value <> 0 then
  begin
    cdsLista := TClientDataSet.Create(DM);
    cdsLista.RemoteServer := DM.SCServer;
    cdsLista.ProviderName := 'dspLista';
    cdsLista.Close;
    DM.SCServer.AppServer.CriaLista ('select * from assistencias_equips where assistencia_equip_sq = ' + IntToStr(Value));
    cdsLista.Open;

    Fassistencia_equip_sq := Value;
    assistencia_sq       := cdsLista.FieldByName('assistencia_sq').AsInteger;
    produto.vIndice      := cdsLista.FieldByName('produto_sq').AsInteger;
    nr_serie_equip       := cdsLista.FieldByName('nr_serie_equip').AsString;
    defeito              := cdsLista.FieldByName('defeito').AsString;
    servicos             := cdsLista.FieldByName('servicos').AsString;

    cdsLista.Close;
  end;

  if FvIndice = 0 then
    sqlUpdate := 'INSERT INTO assistencias_equips (assistencia_sq, produto_sq, ' +
      'nr_serie_equip, defeito, servicos) VALUES (%u, %u, %s, %s, %s)'
  else
    sqlUpdate := 'UPDATE assistencias_equips set assistencia_sq = %u, produto_sq = %u, ' +
      'nr_serie_equip = %s, defeito = %s, servicos = %s ' +
      'WHERE assistencia_equip_sq = ' + IntToStr(FvIndice);
end;

procedure ListaEquipamentos(assistencia_sq: Integer; lista: TList);
var
  registro: TAssistenciasEquipamento;
  cdsLista: TClientDataSet;
begin
  lista.Clear;
  cdsLista := TClientDataSet.Create(DM);
  cdsLista.RemoteServer := DM.SCServer;
  cdsLista.ProviderName := 'dspLista';
  cdsLista.Close;
  DM.SCServer.AppServer.CriaLista ('select * from assistencias_equips where assistencia_sq = ' + IntToStr(assistencia_sq));
  cdsLista.Open;
  While not cdsLista.Eof do
  begin
    registro := TAssistenciasEquipamento.Create;
    registro.vIndice := cdsLista.FieldByName('assistencia_equip_sq').AsInteger;
    lista.Add(registro);
    cdsLista.Next;
  end;
  cdsLista.Close;
end;

end.
