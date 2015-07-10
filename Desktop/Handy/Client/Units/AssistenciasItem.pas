unit AssistenciasItem;

interface

uses Classes, SysUtils, Variants, DB, Cadastro, UDM, AssistenciasEquipamento,
  DBClient, Produto;

type
  TAssistenciasItem = class(TCadastro)
  private
    _assistencia_equip_sq: Integer;
    _produto_sq: TProduto;
    _qtde_assistencia_item: Integer;
    _preco_unit: Double;
  published
    property assistencia_equip_sq : Integer  read _assistencia_equip_sq  write _assistencia_equip_sq ;
    property produto_sq           : TProduto read _produto_sq            write _produto_sq           ;
    property qtde_assistencia_item: Integer  read _qtde_assistencia_item write _qtde_assistencia_item;
    property preco_unit           : Double   read _preco_unit            write _preco_unit           ;
  public
    constructor Create; override;
    class function ListaItens(assistencia_equip_sq: Variant): TList;
    destructor Destroy; override;
  end;

implementation

{ TAssistenciasItem }

constructor TAssistenciasItem.Create;
begin
  setTabela('assistencias_itens');
end;

destructor TAssistenciasItem.Destroy;
begin
  FreeAndNil(_produto_sq);
  
  inherited;
end;

class function TAssistenciasItem.ListaItens(assistencia_equip_sq: Variant): TList;
var
  lista: TList;
  cds: TClientDataSet;
begin
  lista := TList.Create;
  lista.Clear;
  if (assistencia_equip_sq <> null) then
  begin
    cds := listaRegistros('where assistencia_equip_sq  = ' + IntToStr(assistencia_equip_sq));

    While not cds.Eof do
    begin
      lista.Add(TAssistenciasItem.Create(cds.FieldByName('assistencia_item_sq').Value));
      cds.Next;
    end;
    cds.Close;
  end;
  result := lista;
end;

end.
