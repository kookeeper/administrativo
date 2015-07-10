unit RMAItem;

interface

uses Classes, SysUtils, Variants, DB, Cadastro, UDM, RMAEquipamento, DBClient,
  Produto;

type
  TAssistenciasItem = class(TCadastro)
    produto: TProduto;
    qtde_assistencia_item: Integer;
    preco_unit: Double;
    assistencia_equip: TAssistenciasEquipamento;
  private
    Fassistencia_item_sq: Integer;
  protected
    procedure SetvIndice(const Value: Integer); override;
  public
    function salvar: Boolean;
    constructor Create;
    property assistencia_item_sq: Integer read Fassistencia_item_sq;
  end;

  procedure ListaItens(assistencia_sq: Integer; lista: TList);

implementation

{ TAssistenciasItem }

constructor TAssistenciasItem.Create;
begin
  Fassistencia_item_sq := 0;
  produto := TProduto.Create;
  qtde_assistencia_item := 0;
  preco_unit := 0;
  assistencia_equip := TAssistenciasEquipamento.Create;

  Ftabela   := 'assistencias_itens';
  FcIndice := 'assistencia_item_sq';
end;

function TAssistenciasItem.salvar: Boolean;
var
  sql: String;
begin
  sql := Format(sqlUpdate, [
    produto.produto_sq,
    qtde_assistencia_item,
    preco_unit,
    assistencia_equip.assistencia_equip_sq
    ], fs);

  result := inherited salvar(sql);
end;

procedure TAssistenciasItem.SetvIndice(const Value: Integer);
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
    DM.SCServer.AppServer.CriaLista ('select * from assistencias_itens where assistencia_item_sq = ' + IntToStr(Value));
    cdsLista.Open;

    Fassistencia_item_sq   := Value;
    produto.vIndice       := cdsLista.FieldByName('produto_sq').AsInteger;
    qtde_assistencia_item := cdsLista.FieldByName('qtde_assistencia_item').AsInteger;
    preco_unit            := cdsLista.FieldByName('preco_unit').AsFloat;
    assistencia_equip.vIndice := cdsLista.FieldByName('assistencia_equip_sq').AsInteger;

    cdsLista.Close;
  end;

  if FvIndice = 0 then
    sqlUpdate := 'INSERT INTO assistencias_itens (produto_sq, qtde_assistencia_item, ' +
      'preco_unit, assistencia_equip_sq) VALUES (%u, %u, %n, %u)'
  else
    sqlUpdate := 'UPDATE assistencias_itens set produto_sq = %u, qtde_assistencia_item = %u, ' +
      'preco_unit = %n, assistencia_equip_sq = %u ' +
      'WHERE assistencia_item_sq = ' + IntToStr(FvIndice);
end;

procedure ListaItens(assistencia_sq: Integer; lista: TList);
var
  registro: TAssistenciasItem;
  cdsLista: TClientDataSet;
begin
  lista.Clear;
  cdsLista := TClientDataSet.Create(DM);
  cdsLista.RemoteServer := DM.SCServer;
  cdsLista.ProviderName := 'dspLista';
  cdsLista.Close;
  DM.SCServer.AppServer.CriaLista ('select * from assistencias_itens ' +
    'where assistencia_equip_sq in (select assistencia_equip_sq ' +
    'from assistencias_equips where assistencia_sq = ' + IntToStr(assistencia_sq) + ')');
  cdsLista.Open;
  While not cdsLista.Eof do
  begin
    registro := TAssistenciasItem.Create;
    registro.vIndice := cdsLista.FieldByName('assistencia_item_sq').AsInteger;
    lista.Add(registro);
    cdsLista.Next;
  end;
  cdsLista.Close;
end;

end.
