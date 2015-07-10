unit Cliente;

interface

uses Cadastro, Vendedor, TipoCliente, Classificacao, Transportadora, Usuario,
  DBClient, SysUtils, Empresa;

type
  TCliente = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_cliente    : String   ;
    _nome_cliente      : String   ;
    _inscr_estadual    : String   ;
    _endereco          : String   ;
    _numero            : String   ;
    _bairro            : String   ;
    _compl_endereco    : String   ;
    _cidade            : String   ;
    _estado            : String   ;
    _cep               : String   ;
    _ddd_fone1         : String   ;
    _numero_fone1      : String   ;
    _compl_fone1       : String   ;
    _ddd_fone2         : String   ;
    _numero_fone2      : String   ;
    _compl_fone2       : String   ;
    _ddd_fone3         : String   ;
    _numero_fone3      : String   ;
    _compl_fone3       : String   ;
    _ddd_celular       : String   ;
    _numero_celular    : String   ;
    _compl_celular     : String   ;
    _ddd_fax           : String   ;
    _numero_fax        : String   ;
    _compl_fax         : String   ;
    _e_mail            : String   ;
    _web_site          : String   ;
    _contato           : String   ;
    _pais              : String   ;
    _observacao        : String   ;
    _revenda           : String   ;
    _biro              : String   ;
    _capital_atual     : Double   ;
    _nome_fantasia     : String   ;
    _ramo_atividade_sq : Integer  ;
    _faturamento_mensal: Double   ;
    _data_fundacao     : TDateTime;
    _inscr_municipal   : String   ;
    _codigo_suframa    : String   ;
    _data_cadastro     : TDateTime;
    _data_alt          : TDateTime;
    _usuario_sq_alt    : TUsuario ;
    _transportadora_sq : TTransportadora;
    _classificacao_sq  : TClassificacao;
    _tipo_cliente_sq   : TTipoCliente;
    _vendedor_sq       : TVendedor;
    _pct_comissao_propria: Double;
    _pct_comissao_parceria: Double;
    _base_comissao: String;
    _pct_comissao_desconto: Double;
    _obs_comissao_desconto: String;
    _cnae              : String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_cliente    : String    read _codigo_cliente     write _codigo_cliente    ;
    property nome_cliente      : String    read _nome_cliente       write _nome_cliente      ;
    property inscr_estadual    : String    read _inscr_estadual     write _inscr_estadual    ;
    property endereco          : String    read _endereco           write _endereco          ;
    property numero            : String    read _numero             write _numero            ;
    property bairro            : String    read _bairro             write _bairro            ;
    property compl_endereco    : String    read _compl_endereco     write _compl_endereco    ;
    property cidade            : String    read _cidade             write _cidade            ;
    property estado            : String    read _estado             write _estado            ;
    property cep               : String    read _cep                write _cep               ;
    property ddd_fone1         : String    read _ddd_fone1          write _ddd_fone1         ;
    property numero_fone1      : String    read _numero_fone1       write _numero_fone1      ;
    property compl_fone1       : String    read _compl_fone1        write _compl_fone1       ;
    property ddd_fone2         : String    read _ddd_fone2          write _ddd_fone2         ;
    property numero_fone2      : String    read _numero_fone2       write _numero_fone2      ;
    property compl_fone2       : String    read _compl_fone2        write _compl_fone2       ;
    property ddd_fone3         : String    read _ddd_fone3          write _ddd_fone3         ;
    property numero_fone3      : String    read _numero_fone3       write _numero_fone3      ;
    property compl_fone3       : String    read _compl_fone3        write _compl_fone3       ;
    property ddd_celular       : String    read _ddd_celular        write _ddd_celular       ;
    property numero_celular    : String    read _numero_celular     write _numero_celular    ;
    property compl_celular     : String    read _compl_celular      write _compl_celular     ;
    property ddd_fax           : String    read _ddd_fax            write _ddd_fax           ;
    property numero_fax        : String    read _numero_fax         write _numero_fax        ;
    property compl_fax         : String    read _compl_fax          write _compl_fax         ;
    property e_mail            : String    read _e_mail             write _e_mail            ;
    property web_site          : String    read _web_site           write _web_site          ;
    property contato           : String    read _contato            write _contato           ;
    property pais              : String    read _pais               write _pais              ;
    property observacao        : String    read _observacao         write _observacao        ;
    property revenda           : String    read _revenda            write _revenda           ;
    property biro              : String    read _biro               write _biro              ;
    property capital_atual     : Double    read _capital_atual      write _capital_atual     ;
    property nome_fantasia     : String    read _nome_fantasia      write _nome_fantasia     ;
    property ramo_atividade_sq : Integer   read _ramo_atividade_sq  write _ramo_atividade_sq ;
    property faturamento_mensal: Double    read _faturamento_mensal write _faturamento_mensal;
    property data_fundacao     : TDateTime read _data_fundacao      write _data_fundacao     ;
    property inscr_municipal   : String    read _inscr_municipal    write _inscr_municipal   ;
    property codigo_suframa    : String    read _codigo_suframa     write _codigo_suframa    ;
    property data_cadastro     : TDateTime read _data_cadastro      write _data_cadastro     ;
    property data_alt          : TDateTime read _data_alt           write _data_alt          ;
    property usuario_sq_alt    : TUsuario  read _usuario_sq_alt     write _usuario_sq_alt    ;
    property transportadora_sq : TTransportadora read _transportadora_sq write _transportadora_sq;
    property classificacao_sq  : TClassificacao read _classificacao_sq write _classificacao_sq;
    property tipo_cliente_sq   : TTipoCliente read _tipo_cliente_sq write _tipo_cliente_sq;
    property vendedor_sq       : TVendedor read _vendedor_sq write _vendedor_sq;
    property pct_comissao_propria : Double  read _pct_comissao_propria  write _pct_comissao_propria ;
    property pct_comissao_parceria: Double  read _pct_comissao_parceria write _pct_comissao_parceria;
    property base_comissao        : String  read _base_comissao         write _base_comissao        ;
    property pct_comissao_desconto: Double  read _pct_comissao_desconto write _pct_comissao_desconto;
    property obs_comissao_desconto: String  read _obs_comissao_desconto write _obs_comissao_desconto;
    property cnae              : String read _cnae                  write _cnae;
  public
    constructor Create; override;
    destructor Destroy; override;
    class function buscaPorCodigo(codigo: String): TCliente;
    function NfiscaisTotais(): TClientDataSet;
  end;

  TContato = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _data_contato   : TDateTime;
    _cliente_sq     : TCliente ;
    _vendedor_sq    : TVendedor;
    _observacao     : String   ;
    _tipo_contato   : String   ;
    _forma_contato  : String   ;
    _nfiscal_item_sq: Variant  ;
    _qtde_produtos  : Integer  ;
    _finalizado     : String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property data_contato   : TDateTime read _data_contato    write _data_contato   ;
    property cliente_sq     : TCliente  read _cliente_sq      write _cliente_sq     ;
    property vendedor_sq    : TVendedor read _vendedor_sq     write _vendedor_sq    ;
    property observacao     : String    read _observacao      write _observacao     ;
    property tipo_contato   : String    read _tipo_contato    write _tipo_contato   ;
    property forma_contato  : String    read _forma_contato   write _forma_contato  ;
    property nfiscal_item_sq: Variant   read _nfiscal_item_sq write _nfiscal_item_sq;
    property qtde_produtos  : Integer   read _qtde_produtos   write _qtde_produtos  ;
    property finalizado     : String    read _finalizado      write _finalizado     ;
  public
    constructor Create; override;
    destructor Destroy; override;
    class function buscaContatosCliente(cliente_sq: Integer; emAberto: Boolean = false): TClientDataSet;
    class function buscaContatosVendedor(vendedor_sq: Integer; emAberto: Boolean = false): TClientDataSet;
  end;

implementation

uses Variants;

{ TCliente }

class function TCliente.buscaPorCodigo(codigo: String): TCliente;
begin
  With (listaPersonalizada('select cliente_sq from clientes where codigo_cliente = ' + QuotedStr(codigo))) do
  begin
    if (RecordCount = 0) then
      raise Exception.Create('Não foi possível encontrar o cliente com o código ' + QuotedStr(codigo));
    result := TCliente.Create(FieldByName('cliente_sq').Value);
  end;
end;

constructor TCliente.Create;
begin
  setTabela('clientes');
  setLista('"Código=CODIGO_CLIENTE","Nome=NOME_CLIENTE","Tipo=descricao_tipo",' +
    '"E-mail=E_Mail","Produto mais comprado=DESCRICAO_PRODUTO",' +
    '"Código do produto=CODIGO_PRODUTO","Qtde do produto=QTDE","Estado=ESTADO",' +
    '"Data de Cadastro=DATA_CADASTRO"');
  sqlLista := 'SELECT C.*, U.NOME_USUARIO, CL.CODIGO_CLASSIFICACAO, ' +
    'V.CODIGO_PRODUTO, V.DESCRICAO_PRODUTO, V.QTDE, tc.descricao_tipo ' +
         'FROM clientes C ' +
         'LEFT OUTER JOIN usuarios       U  ON (U.USUARIO_SQ        = C.USUARIO_SQ_ALT) ' +
         'LEFT OUTER JOIN classificacao  CL ON (CL.CLASSIFICACAO_SQ = C.CLASSIFICACAO_SQ) ' +
         'left outer join tipo_cliente   tc on (tc.tipo_cliente_sq = C.tipo_cliente_sq)' +
         'left outer join ( ' +
           'select distinct cliente_sq as cli_sq, produto_sq, CODIGO_PRODUTO, descricao_produto, max(qtde) as qtde from ( ' +
             'SELECT N.cliente_sq, P.produto_sq, P.codigo_produto, P.DESCRICAO_PRODUTO, ' +
             'sum(ni.qtde_item) AS QTDE ' +
             'FROM nfiscais N ' +
             'inner join naturezas NA on (NA.natureza_sq = N.natureza_sq) ' +
             'inner JOIN nfiscais_itens NI ON (NI.NFISCAL_SQ       = N.NFISCAL_SQ) ' +
             'inner JOIN produtos P  ON (P.PRODUTO_SQ        = NI.PRODUTO_SQ) ' +
             'WHERE N.cancelada <> ''S'' AND NA.tipo_nfiscal = 0 ' +
             'GROUP BY N.cliente_sq, P.produto_sq, P.codigo_produto, P.descricao_produto) vendas ' +
           'group by cli_sq ' +
           'order by cli_sq, qtde desc) V on (V.cli_sq = C.cliente_sq)';
end;

destructor TCliente.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_usuario_sq_alt);
  FreeAndNil(_transportadora_sq);
  FreeAndNil(_classificacao_sq);
  FreeAndNil(_tipo_cliente_sq);
  FreeAndNil(_vendedor_sq);

  inherited;
end;

function TCliente.NfiscaisTotais: TClientDataSet;
var
  sql: String;
begin
  sql := 'sELECT 1 + (year(MAX(DTEMISSAO_NFISCAL))*12+month(MAX(DTEMISSAO_NFISCAL))) - ' +
    '     (year(MIN(DTEMISSAO_NFISCAL))*12+month(MIN(DTEMISSAO_NFISCAL))) as MESES' +
    ' , MAX(DTEMISSAO_NFISCAL) as ULTIMA_VENDA' +
    ' , MIN(DTEMISSAO_NFISCAL) as PRIMEIRA_VENDA' +
    ' , MAX(VLR_TOTAL) as MAIOR_VENDA' +
    ' , MIN(VLR_TOTAL) as MENOR_VENDA' +
    ' , SUM(VLR_TOTAL) as TOTAL_VENDA' +
    ' FROM nfiscais N'+
    ' LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ)'+
    ' WHERE N.CLIENTE_SQ = ' + VarToStr(vIndice) + 
    ' AND N.CANCELADA <> ''S'''+
    ' AND NA.TIPO_NFISCAL = 0';

  result := listaPersonalizada(sql);
end;

{ TContato }

constructor TContato.Create;
begin
  setTabela('contatos');
end;

class function TContato.buscaContatosCliente(cliente_sq: Integer; emAberto: Boolean = false): TClientDataSet;
var
  Sql: String;
  busca: TClientDataSet;
begin
  Sql := 'select c.*, nome_vendedor, descricao_produto from contatos c ' +
  'inner join vendedores v on (v.vendedor_sq = c.vendedor_sq) ' +
  'left join nfiscais_itens nfi on (nfi.nfiscal_item_sq = c.nfiscal_item_sq) ' +
  'left join produtos p on (p.produto_sq = nfi.produto_sq) ' +
  'where c.cliente_sq = ' + IntToStr(cliente_sq);
  if (emAberto) then
    Sql := Sql + ' and finalizado = ''N''';

  busca := listaPersonalizada(sql);
  busca.IndexFieldNames := 'DATA_CONTATO';
  result := busca;
end;

class function TContato.buscaContatosVendedor(vendedor_sq: Integer; emAberto: Boolean = false): TClientDataSet;
var
  Sql: String;
  busca: TClientDataSet;
begin
  Sql := 'select c.*, nome_cliente, descricao_produto from contatos c ' +
  'inner join clientes cl on (cl.cliente_sq = c.cliente_sq) ' +
  'left join nfiscais_itens nfi on (nfi.nfiscal_item_sq = c.nfiscal_item_sq) ' +
  'left join produtos p on (p.produto_sq = nfi.produto_sq) ' +
  'where c.vendedor_sq = ' + IntToStr(vendedor_sq);
  if (emAberto) then
    Sql := Sql + ' and finalizado = ''N''';

  busca := listaPersonalizada(sql);
  busca.IndexFieldNames := 'DATA_CONTATO';
  result := busca;
end;

destructor TContato.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_cliente_sq);
  FreeAndNil(_vendedor_sq);

  inherited;
end;

end.

