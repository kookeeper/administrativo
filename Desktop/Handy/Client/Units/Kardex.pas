unit Kardex;

interface

uses Cadastro, Produto, Usuario, Pedido, DBClient, Variants, Empresa, SysUtils;

type
  TKardex = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _produto_sq    : TProduto;
    _tipo_mov      : String;
    _qtde          : Integer;
    _valor         : Double;
    _data          : TDateTime;
    _nfiscal       : Variant;
    _usuario_sq    : TUsuario;
    _nr_serie      : String;
    _pedido_item_sq: TPedidoItem;
    _numero_estoque: Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property produto_sq    : TProduto     read _produto_sq write _produto_sq;
    property tipo_mov      : String       read _tipo_mov   write _tipo_mov  ;
    property qtde          : Integer      read _qtde       write _qtde      ;
    property valor         : Double       read _valor      write _valor     ;
    property data          : TDateTime    read _data       write _data      ;
    property nfiscal       : Variant      read _nfiscal    write _nfiscal   ;
    property usuario_sq    : TUsuario     read _usuario_sq write _usuario_sq;
    property nr_serie      : String       read _nr_serie   write _nr_serie  ;
    property pedido_item_sq: TPedidoItem  read _pedido_item_sq write _pedido_item_sq;
    property numero_estoque: Integer      read _numero_estoque write _numero_estoque;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure salvar(); override;
    class function imprimirMovimentacao(inicio, fim: TDateTime; produto_sq: Variant): TClientDataSet;
  end;

implementation

uses Nfiscal, Natureza;

{ TKardex }

constructor TKardex.Create;
begin
  setTabela('kardex');
  setLista('"Código do Produto=CODIGO_PRODUTO",' +
    '"Descrição do Produto=DESCRICAO_PRODUTO","Data=DATA","Tipo=TIPO_MOV",' +
    '"Nota Fiscal=NFISCAL","Quantidade=QTDE","Valor=VALOR","Estoque=descricaoEstoque"');
  sqlLista := 'select k.*, codigo_produto, descricao_produto, case ' +
    'when numero_estoque is null then (select descricao_estoque1 from empresas) ' +
    'when numero_estoque = 1 then (select descricao_estoque1 from empresas) ' +
    'when numero_estoque = 2 then (select descricao_estoque2 from empresas) ' +
    'when numero_estoque = 3 then (select descricao_estoque3 from empresas) ' +
    'when numero_estoque = 4 then (select descricao_estoque4 from empresas) ' +
    'when numero_estoque = 5 then (select descricao_estoque5 from empresas) ' +
    'when numero_estoque = 6 then (select descricao_estoque6 from empresas) ' +
    'when numero_estoque = 7 then (select descricao_estoque7 from empresas) ' +
    'when numero_estoque = 8 then (select descricao_estoque8 from empresas) ' +
    'when numero_estoque = 9 then (select descricao_estoque9 from empresas) ' +
    'when numero_estoque = 10 then (select descricao_estoque10 from empresas) ' +
    'end as descricaoEstoque ' +
         'from kardex k left join produtos p on (k.produto_sq = p.produto_sq) ';
end;

destructor TKardex.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_produto_sq);
  FreeAndNil(_usuario_sq);
  FreeAndNil(_pedido_item_sq);

  inherited;
end;

class function TKardex.imprimirMovimentacao(inicio, fim: TDateTime;
  produto_sq: Variant): TClientDataSet;
var
  sql, filtro: String;
begin
  filtro := ' where data >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', inicio));
  filtro := filtro + ' and data < ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', fim + 1));
  if produto_sq <> null then
    filtro := filtro + ' and produto_sq = ' + VarToStr(produto_sq);
  sql := 'select k.*, p.codigo_produto, p.descricao_produto, u.nome_usuario, case ' +
    'when numero_estoque is null then (select descricao_estoque1 from empresas) ' +
    'when numero_estoque = 1 then (select descricao_estoque1 from empresas) ' +
    'when numero_estoque = 2 then (select descricao_estoque2 from empresas) ' +
    'when numero_estoque = 3 then (select descricao_estoque3 from empresas) ' +
    'when numero_estoque = 4 then (select descricao_estoque4 from empresas) ' +
    'when numero_estoque = 5 then (select descricao_estoque5 from empresas) ' +
    'when numero_estoque = 6 then (select descricao_estoque6 from empresas) ' +
    'when numero_estoque = 7 then (select descricao_estoque7 from empresas) ' +
    'when numero_estoque = 8 then (select descricao_estoque8 from empresas) ' +
    'when numero_estoque = 9 then (select descricao_estoque9 from empresas) ' +
    'when numero_estoque = 10 then (select descricao_estoque10 from empresas) ' +
    'end as descricao_estoque ' +
    'from kardex k inner join produtos p on (p.produto_sq=k.produto_sq) ' +
    'inner join usuarios u on (u.usuario_sq=k.usuario_sq) ' +
    filtro;
  result := listaPersonalizada(sql);
end;

procedure TKardex.salvar;
var
  novo: Boolean;
  qtdeMov: Integer;
begin
  novo := vIndice = null;

  inherited;

  if not novo then
    Exit;

  qtdeMov := qtde;

  if (tipo_mov = 'S') then
    qtdeMov := qtde * -1;

  if (produto_sq.controle_numero_serie = 1) then
    produto_sq.atualizaEstoque
  else
  begin
    if (numero_estoque = 0) then produto_sq.qtde_estoque1  := produto_sq.qtde_estoque1  + qtdeMov;
    if (numero_estoque = 1) then produto_sq.qtde_estoque1  := produto_sq.qtde_estoque1  + qtdeMov;
    if (numero_estoque = 2) then produto_sq.qtde_estoque2  := produto_sq.qtde_estoque2  + qtdeMov;
    if (numero_estoque = 3) then produto_sq.qtde_estoque3  := produto_sq.qtde_estoque3  + qtdeMov;
    if (numero_estoque = 4) then produto_sq.qtde_estoque4  := produto_sq.qtde_estoque4  + qtdeMov;
    if (numero_estoque = 5) then produto_sq.qtde_estoque5  := produto_sq.qtde_estoque5  + qtdeMov;
    if (numero_estoque = 6) then produto_sq.qtde_estoque6  := produto_sq.qtde_estoque6  + qtdeMov;
    if (numero_estoque = 7) then produto_sq.qtde_estoque7  := produto_sq.qtde_estoque7  + qtdeMov;
    if (numero_estoque = 8) then produto_sq.qtde_estoque8  := produto_sq.qtde_estoque8  + qtdeMov;
    if (numero_estoque = 9) then produto_sq.qtde_estoque9  := produto_sq.qtde_estoque9  + qtdeMov;
    if (numero_estoque =10) then produto_sq.qtde_estoque10 := produto_sq.qtde_estoque10 + qtdeMov;

    produto_sq.salvar;
  end;
end;

end.
