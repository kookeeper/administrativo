unit ProdutoFaltante;

interface

uses Cadastro, Produto, Cliente, Empresa, SysUtils;

type TProdutoFaltante = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _produto_sq: TProduto;
    _qtde_produto_faltante: Integer;
    _data_produto_faltante: TDateTime;
    _nf_entrada_sq: Variant;
    _cliente_sq: TCliente;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property produto_sq           : TProduto  read _produto_sq            write _produto_sq           ;
    property qtde_produto_faltante: Integer   read _qtde_produto_faltante write _qtde_produto_faltante;
    property data_produto_faltante: TDateTime read _data_produto_faltante write _data_produto_faltante;
    property nf_entrada_sq        : Variant   read _nf_entrada_sq         write _nf_entrada_sq        ;
    property cliente_sq           : TCliente  read _cliente_sq            write _cliente_sq           ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TProdutoFaltante }

constructor TProdutoFaltante.Create;
begin
  setTabela('produtos_faltantes');
  setLista('Produto=DESCRICAO_PRODUTO,Cliente=NOME_CLIENTE,' +
    'Quantidade=QTDE_PRODUTO_FALTANTE,Data=DATA_PRODUTO_FALTANTE,' +
    'NotaFiscaldeEntrada=NUMERO_NF_ENT');
  sqlLista := 'SELECT PF.*, P.DESCRICAO_PRODUTO, C.NOME_CLIENTE, NE.NUMERO_NF_ENT ' +
  'FROM produtos_faltantes PF ' +
  'LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ=PF.PRODUTO_SQ) ' +
  'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ=PF.CLIENTE_SQ) ' +
  'LEFT OUTER JOIN nf_entradas NE ON (NE.NF_ENTRADA_SQ = PF.NF_ENTRADA_SQ)';
end;

destructor TProdutoFaltante.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_produto_sq);
  FreeAndNil(_cliente_sq);

  inherited;
end;

end.
