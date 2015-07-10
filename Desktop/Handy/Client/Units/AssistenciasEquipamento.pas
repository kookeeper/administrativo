unit AssistenciasEquipamento;

interface

uses SysUtils, UDM, DB, Classes, Cadastro, DBClient, Produto, Variants;

type
  TAssistenciasEquipamento = class(TCadastro)
  private
    _assistencia_sq: Integer;
    _produto_sq: TProduto;
    _nr_serie_equip: String;
    _defeito: String;
    _servicos: String;
  published
    property assistencia_sq : Integer  read _assistencia_sq write _assistencia_sq;
    property produto_sq     : TProduto read _produto_sq     write _produto_sq    ;
    property nr_serie_equip : String   read _nr_serie_equip write _nr_serie_equip;
    property defeito        : String   read _defeito        write _defeito       ;
    property servicos       : String   read _servicos       write _servicos      ;
  public
    Itens: TList;
    constructor Create; override;
    destructor Destroy; override;
    class function ListaEquipamentos(assistencia_sq: Variant): TList;
    procedure salvar; override;
    procedure setIndice(const indiceP: Variant); override;
  end;

implementation

uses AssistenciasItem;

{ TAssistenciasEquipamento }

constructor TAssistenciasEquipamento.Create;
begin
  setTabela('assistencias_equips');
end;

destructor TAssistenciasEquipamento.Destroy;
var
  i: Integer;
  obj: TAssistenciasItem;
begin
  FreeAndNil(_produto_sq);
  for i := 0 to Itens.Count - 1 do
  begin
    obj := TAssistenciasItem(Itens.Items[i]);
    FreeAndNil(obj);
  end;
  FreeAndNil(Itens);
  
  inherited;
end;

class function TAssistenciasEquipamento.ListaEquipamentos(assistencia_sq: Variant): TList;
var
  lista: TList;
  cds: TClientDataSet;
begin
  lista := TList.Create;
  lista.Clear;
  if (assistencia_sq <> null) then
  begin
    cds := listaRegistros(' where assistencia_sq = ' + IntToStr(assistencia_sq));
    While not cds.Eof do
    begin
      lista.Add(TAssistenciasEquipamento.Create(cds.FieldByName('assistencia_equip_sq').Value));
      cds.Next;
    end;
    cds.Close;
  end;
  result := lista;
end;

procedure TAssistenciasEquipamento.salvar;
var
  i, j: Integer;
  apagar: Boolean;
  lista: TList;
begin
  inherited;

  for i := 0 to Itens.Count - 1 do
  begin
    TAssistenciasItem(Itens.Items[i]).assistencia_equip_sq := vIndice;
    TAssistenciasItem(Itens.Items[i]).salvar;
  end;

  lista := TAssistenciasItem.ListaItens(vIndice);
  for i := 0 to lista.Count - 1 do
  begin
    apagar := true;
    for j := 0 to Itens.Count - 1 do
      if TAssistenciasItem(Itens.Items[j]).vIndice = TAssistenciasItem(lista.Items[i]).vIndice then
        apagar := false;
    if apagar then
      TAssistenciasItem(lista.Items[i]).excluirRegistro(false);
  end;
end;

procedure TAssistenciasEquipamento.setIndice(const indiceP: Variant);
begin
  inherited;

  Itens := TAssistenciasItem.ListaItens(vIndice);
end;

end.

