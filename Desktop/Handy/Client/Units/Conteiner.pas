unit Conteiner;

interface

uses Cadastro, Produto, Empresa, SysUtils;

type
  TConteiner = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _invoice_number: String;
    _data_remessa  : TDateTime;
    _data_chegada  : TDateTime;
    _tipo_envio    : String;
    _conhecimento  : String;
    _observacao    : String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property invoice_number: String    read _invoice_number write _invoice_number;
    property data_remessa  : TDateTime read _data_remessa   write _data_remessa  ;
    property data_chegada  : TDateTime read _data_chegada   write _data_chegada  ;
    property tipo_envio    : String    read _tipo_envio     write _tipo_envio    ;
    property conhecimento  : String    read _conhecimento   write _conhecimento  ;
    property observacao    : String    read _observacao     write _observacao    ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

  TConteinerItem = class(TCadastro)
  private
    _conteiner_sq: TConteiner;
    _produto_sq  : TProduto;
    _quantidade  : Integer;
  published
    property conteiner_sq: TConteiner read _conteiner_sq write _conteiner_sq;
    property produto_sq  : TProduto   read _produto_sq   write _produto_sq  ;
    property quantidade  : Integer    read _quantidade   write _quantidade  ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TConteiner }

constructor TConteiner.Create;
begin
  setTabela('conteiner');
  setLista('Invoice=INVOICE_NUMBER,Remessa=DATA_REMESSA,Conhecimento=CONHECIMENTO');
end;

destructor TConteiner.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

{ TConteinerItem }

constructor TConteinerItem.Create;
begin
  setTabela('conteiner_itens');
end;

destructor TConteinerItem.Destroy;
begin
  FreeAndNil(_conteiner_sq);
  FreeAndNil(_produto_sq);

  inherited;
end;

end.
 
