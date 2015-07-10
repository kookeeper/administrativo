unit Pedido;

interface

uses Cadastro, Cliente, CondPagto, Natureza, Transportadora, Vendedor,
  Produto, DBClient, SysUtils, Empresa, Classes, Dialogs;

type
  TPedido = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _baixou_estoque	: String;
    _base_icms	: Double;
    _cliente_sq	: TCliente;
    _cond_pagto_sq	: TCondPagto;
    _cotacao_dolar	: Double;
    _data_pedido	: TDateTime;
    _dias_demonstracao	: Integer;
    _frete_transp	: String;
    _natureza_sq	: TNatureza;
    _nfiscal_sq	: Integer;
    _numero_pedido	: Integer;
    _observacao_nf	: String;
    _observacao_ped	: String;
    _pct_desc	: Double;
    _pct_juros	: Double;
    _peso_bruto	: Double;
    _peso_liquido	: Double;
    _status	: Variant;
    _transportadora_sq	: TTransportadora;
    _vendedor_sq	: TVendedor;
    _vlr_desc	: Double;
    _vlr_frete	: Double;
    _vlr_icms	: Double;
    _vlr_ipi	: Double;
    _vlr_juros	: Double;
    _vlr_produtos	: Double;
    _vlr_seguro	: Double;
    _base_icms_subst: Double;
    _vlr_icms_subst: Double;
    _vlr_total: Double;
    _numero_comprovante_cartao: Integer;
    Fvendedor_sq_desconto: Variant;
    Fcond_pagto3_sq: TCondPagto;
    Fcond_pagto2_sq: TCondPagto;
    Fvlr_cond_pagto3: Double;
    Fvlr_cond_pagto: Double;
    Fvlr_cond_pagto2: Double;
    procedure setStatus(const Value: Variant);
    procedure Setvendedor_sq_desconto(const Value: Variant);
    procedure Setcond_pagto2_sq(const Value: TCondPagto);
    procedure Setcond_pagto3_sq(const Value: TCondPagto);
    procedure Setvlr_cond_pagto(const Value: Double);
    procedure Setvlr_cond_pagto2(const Value: Double);
    procedure Setvlr_cond_pagto3(const Value: Double);
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property baixou_estoque	: String read _baixou_estoque write _baixou_estoque;
    property base_icms	: Double read _base_icms write _base_icms;
    property cliente_sq	: TCliente read _cliente_sq write _cliente_sq;
    property cond_pagto_sq	: TCondPagto read _cond_pagto_sq write _cond_pagto_sq;
    property vlr_cond_pagto : Double read Fvlr_cond_pagto write Setvlr_cond_pagto;
    property cond_pagto2_sq	: TCondPagto read Fcond_pagto2_sq write Setcond_pagto2_sq;
    property vlr_cond_pagto2 : Double read Fvlr_cond_pagto2 write Setvlr_cond_pagto2;
    property cond_pagto3_sq	: TCondPagto read Fcond_pagto3_sq write Setcond_pagto3_sq;
    property vlr_cond_pagto3 : Double read Fvlr_cond_pagto3 write Setvlr_cond_pagto3;
    property cotacao_dolar : Double read _cotacao_dolar write _cotacao_dolar ;
    property data_pedido : TDateTime read _data_pedido write _data_pedido ;
    property dias_demonstracao : Integer read _dias_demonstracao write _dias_demonstracao ;
    property frete_transp : String read _frete_transp write _frete_transp ;
    property natureza_sq : TNatureza read _natureza_sq write _natureza_sq ;
    property nfiscal_sq : Integer read _nfiscal_sq write _nfiscal_sq ;
    property numero_pedido : Integer read _numero_pedido write _numero_pedido ;
    property observacao_nf : String read _observacao_nf write _observacao_nf ;
    property observacao_ped : String read _observacao_ped write _observacao_ped ;
    property pct_desc : Double read _pct_desc write _pct_desc ;
    property pct_juros : Double read _pct_juros write _pct_juros ;
    property peso_bruto : Double read _peso_bruto write _peso_bruto ;
    property peso_liquido : Double read _peso_liquido write _peso_liquido ;
    property status : Variant read _status write setStatus ;
    property transportadora_sq : TTransportadora read _transportadora_sq write _transportadora_sq ;
    property vendedor_sq : TVendedor read _vendedor_sq write _vendedor_sq ;
    property vlr_desc : Double read _vlr_desc write _vlr_desc ;
    property vlr_frete : Double read _vlr_frete write _vlr_frete ;
    property vlr_icms : Double read _vlr_icms write _vlr_icms ;
    property vlr_ipi : Double read _vlr_ipi write _vlr_ipi ;
    property vlr_juros : Double read _vlr_juros write _vlr_juros ;
    property vlr_produtos : Double read _vlr_produtos write _vlr_produtos ;
    property vlr_seguro : Double read _vlr_seguro write _vlr_seguro ;
    property base_icms_subst: Double read _base_icms_subst write _base_icms_subst;
    property vlr_icms_subst: Double read _vlr_icms_subst write _vlr_icms_subst;
    property vlr_total: Double read _vlr_total write _vlr_total ;
    property numero_comprovante_cartao: Integer read _numero_comprovante_cartao write _numero_comprovante_cartao;
    property vendedor_sq_desconto: Variant read Fvendedor_sq_desconto write Setvendedor_sq_desconto;
  public
    listaItem: TList;
    constructor Create; override;
    procedure setIndice(const indiceP: Variant); override;
    destructor Destroy; override;
    procedure Finalizar();
    procedure salvar(); override;
    procedure AtualizaStatus();
    class function listaSemEstoque(): TClientDataSet;
    function cdsImpressao(): TClientDataSet;
    function cdsImpressaoItem(): TClientDataSet;
    function pesquisaProduto(produto_sq: Integer): TCadastro;
    class function listaPedidoPendente(): TClientDataSet;
  end;

type
  TPedidoItem = class(TCadastro)
  private
    _pedido_sq	: Integer;
    _produto_sq	: TProduto;
    _qtde_pedido_item	: Integer;
    _nr_serie_item	: String;
    _preco_unit	: Double;
    _vlr_desc	: Double;
    _pct_desc	: Double;
    _aliq_icms_item	: Double;
    _aliq_ipi_item	: Double;
    _vlr_icms_item	: Double;
    _vlr_ipi_item	: Double;
    _vlr_total_item	: Double;
    _peso_bruto	: Double;
    _peso_liquido	: Double;
    _vlr_juros	: Double;
    _pct_juros	: Double;
    _base_icms_subst_item: Double;
    _vlr_icms_subst_item: Double;
    _numero_estoque: Integer;
    _qtde_produto_retorno: Integer;
    function cdsListaSerie: TClientDataSet;
    function existeSerie: Boolean;
  published
    property pedido_sq : Integer read _pedido_sq write _pedido_sq ;
    property produto_sq : TProduto read _produto_sq write _produto_sq ;
    property qtde_pedido_item : Integer read _qtde_pedido_item write _qtde_pedido_item ;
    property nr_serie_item : String read _nr_serie_item write _nr_serie_item ;
    property preco_unit : Double read _preco_unit write _preco_unit ;
    property vlr_desc : Double read _vlr_desc write _vlr_desc ;
    property pct_desc : Double read _pct_desc write _pct_desc ;
    property aliq_icms_item : Double read _aliq_icms_item write _aliq_icms_item ;
    property aliq_ipi_item : Double read _aliq_ipi_item write _aliq_ipi_item ;
    property vlr_icms_item : Double read _vlr_icms_item write _vlr_icms_item ;
    property vlr_ipi_item : Double read _vlr_ipi_item write _vlr_ipi_item ;
    property vlr_total_item : Double read _vlr_total_item write _vlr_total_item ;
    property peso_bruto : Double read _peso_bruto write _peso_bruto ;
    property peso_liquido : Double read _peso_liquido write _peso_liquido ;
    property vlr_juros : Double read _vlr_juros write _vlr_juros ;
    property pct_juros : Double read _pct_juros write _pct_juros ;
    property base_icms_subst_item: Double read _base_icms_subst_item write _base_icms_subst_item;
    property vlr_icms_subst_item: Double read _vlr_icms_subst_item write _vlr_icms_subst_item;
    property numero_estoque: Integer read _numero_estoque write _numero_estoque;
    property qtde_produto_retorno  : Integer read _qtde_produto_retorno  write _qtde_produto_retorno;
  public
    indiceDataSet: Integer;
    listaSerie: TList;
    constructor Create; override;
    constructor Create(indice: Variant); override;
    destructor Destroy; override;
    function ItensFaturados(): TClientDataSet;
    procedure salvar(); override;
  end;

type
  TPedidoItemSerie = class(TCadastro)
  private
    _pedido_item_sq: Integer;
    _produto_numero_serie_sq    : TProdutoNumeroSerie;
  published
    property pedido_item_sq: Integer  read _pedido_item_sq write _pedido_item_sq;
    property produto_numero_serie_sq    : TProdutoNumeroSerie read _produto_numero_serie_sq     write _produto_numero_serie_sq    ;
  public
    constructor Create; override;
  end;

implementation

uses Variants, UDM, Kardex, Usuario, StrUtils;

{ TPedido }

procedure TPedido.AtualizaStatus;
var
  finalizado : Boolean;
  cds: TClientDataSet;
begin
  if vIndice = null then
    exit;

  if status = 'F' then
    exit;
    
  finalizado := True;

  cds := listaPersonalizada('select produto_sq, sum(qtde_faturado) qtde_aberto from (' +
    ' select pi.produto_sq, sum(pi.qtde_pedido_item) qtde_faturado ' +
    ' from pedidos_itens pi ' +
    ' where pi.pedido_sq=' + VarToStr(vIndice) +
    ' group by pi.produto_sq ' +
    ' union ' +
    ' select ni.produto_sq, -1 * sum(ni.qtde_item) qtde_faturado ' +
    ' from nfiscais_itens ni ' +
    ' inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq) ' +
    ' where n.cancelada <> ''S'' and n.pedido_sq=' + VarToStr(vIndice) +
    ' group by ni.produto_sq ' +
    ' ) a group by produto_sq');

  While not cds.Eof do
  begin
    if cds.FieldByName('qtde_aberto').AsInteger > 0 then
      finalizado := False;
    cds.Next;
  end;

  if finalizado then
  begin
    status := 'F';
    salvar;
  end;
end;

function TPedido.cdsImpressao: TClientDataSet;
var
  sql: String;
begin
  sql := 'SELECT p.*, DDD_FONE1, NUMERO_FONE1, COMPL_FONE1, DDD_CELULAR, ' +
    'NUMERO_CELULAR, COMPL_CELULAR, ENDERECO, NUMERO, COMPL_ENDERECO, DDD_FONE2, ' +
    'NUMERO_FONE2, COMPL_FONE2, DDD_FONE3, NUMERO_FONE3, COMPL_FONE3, DDD_FAX, ' +
    'NUMERO_FAX, COMPL_FAX, CODIGO_CLIENTE, NOME_CLIENTE, CONTATO, C.INSCR_ESTADUAL, ' +
    'BAIRRO, CIDADE, ESTADO, PAIS, CEP, NOME_VENDEDOR, CODIGO_VENDEDOR, TIPO_NFISCAL, ' +
    'DESCRICAO_NATUREZA, CFO, CODIGO_TRANSPORTADORA, NOME_TRANSPORTADORA, ' +
    'N.OBSERVACAO AS OBSERVACAO_NAT, D00, D01, D02, D03, D04, D05, ' +
    'D06, D07, D08, D09, P00, P01, P02, P03, P04, P05, P06, P07, P08, P09, PARCELAS, ' +
    'DESCRICAO_COND_PAGTO ' +
    'FROM pedidos P ' +
    'LEFT OUTER JOIN clientes                     C ON (C.CLIENTE_SQ = P.CLIENTE_SQ) ' +
    'LEFT OUTER JOIN cond_pagto           CP ON (CP.COND_PAGTO_SQ = P.COND_PAGTO_SQ) ' +
    'LEFT OUTER JOIN naturezas                N ON (N.NATUREZA_SQ = P.NATUREZA_SQ) ' +
    'LEFT OUTER JOIN transportadoras T ON (T.TRANSPORTADORA_SQ = P.TRANSPORTADORA_SQ) ' +
    'LEFT OUTER JOIN vendedores             V ON (V.VENDEDOR_SQ = P.VENDEDOR_SQ) ' +
    'WHERE PEDIDO_SQ = ' + VarToStr(vIndice);

  result := listaPersonalizada(sql);
end;

function TPedido.cdsImpressaoItem: TClientDataSet;
var
  sql: String;
begin
  sql := 'select pi.*, CODIGO_PRODUTO, DESCRICAO_PRODUTO, CODIGO_NBM ' +
    'FROM pedidos_itens PI ' +
    'LEFT OUTER JOIN produtos PR ON (PR.PRODUTO_SQ = PI.PRODUTO_SQ) ' +
    'LEFT OUTER JOIN nbm N ON (N.NBM_SQ = PR.NBM_SQ) ' +
    'LEFT OUTER JOIN modelos M ON (M.MODELO_SQ = PR.MODELO_SQ) ' +
    'WHERE PEDIDO_SQ = ' + VarToStr(vIndice);

  result := listaPersonalizada(sql);
end;

constructor TPedido.Create;
begin
  setTabela('pedidos');
  setLista('"Status=statusDescricao","Número=NUMERO_PEDIDO","Data=DATA_PEDIDO","Cliente=NOME_CLIENTE","Linha=descricao_linha"');
  sqlLista := 'select p.*, c.nome_cliente, l.descricao_linha, n.notas, ' +
             'case p.status when ''F'' then ''Finalizado'' when ''C'' then ''Cancelado'' else ''Pendente'' end as statusDescricao ' +
             'from pedidos p ' +
             'left join clientes c on (c.cliente_sq = p.cliente_sq) ' +
             'left join linha l on (l.linha_sq=p.linha_sq) ' +
             'left join (select pedido_sq, count(*) notas from nfiscais group by pedido_sq) n on (n.pedido_sq=p.pedido_sq)';
  listaItem := TList.Create;
end;

destructor TPedido.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_cliente_sq);
  FreeAndNil(_cond_pagto_sq);
  FreeAndNil(_natureza_sq);
  FreeAndNil(_transportadora_sq);
  FreeAndNil(_vendedor_sq);

  inherited;
end;

procedure TPedido.Finalizar;
var
  cds: TClientDataSet;
  item: TPedidoItem;
begin
  cds := TPedidoItem.listaRegistros('where pedido_sq = ' + VarToStr(vIndice));

  While not cds.Eof do
  begin
    item := TPedidoItem.Create(cds.FieldByName('pedido_item_sq').Value);
    With TKardex.Create do
    begin
      produto_sq := item.produto_sq;
      tipo_mov   := 'S';
      qtde       := item.qtde_pedido_item;
      numero_estoque := natureza_sq.numero_estoque_saida;
      valor      := item.vlr_total_item;
      data       := data_pedido;
      usuario_sq := TUsuario.Create(DM.useq);
      nr_serie   := item.nr_serie_item;
      pedido_item_sq := item;
      salvar;
    end;

    // retorno de produto.
    if ((item.qtde_produto_retorno > 0) and (item.produto_Sq.produto_sq_retorno <> Null)) then
    With TKardex.Create do
    begin
      produto_sq := TProduto.Create(item.produto_sq.produto_sq_retorno);
      tipo_mov   := 'S';
      qtde       := item.qtde_produto_retorno;
      numero_estoque := natureza_sq.numero_estoque_saida;
      data       := data_pedido;
      pedido_item_sq := item;
      usuario_sq := TUsuario.Create(DM.useq);
      salvar;
    end;

    cds.Next;
  end;

  baixou_estoque := 'S';
  salvar;
end;

class function TPedido.listaPedidoPendente: TClientDataSet;
begin
  result := listaPersonalizada('select p.pedido_sq, p.numero_pedido, p.data_pedido, p.vlr_total, c.nome_cliente ' +
    'from pedidos p ' +
    'inner join clientes c on (c.cliente_sq=p.cliente_sq) ' +
    'where p.status is null ' +
    'order by p.data_pedido');
end;

class function TPedido.listaSemEstoque: TClientDataSet;
var
  sql: String;
begin
  sql := 'select p.numero_pedido, c.nome_cliente, pr.descricao_produto,' +
    ' pr.qtde_estoque1+pr.qtde_estoque2+pr.qtde_estoque3+pr.qtde_estoque4+' +
    ' pr.qtde_estoque5+pr.qtde_estoque6+pr.qtde_estoque7+pr.qtde_estoque8+' +
    ' pr.qtde_estoque9+pr.qtde_estoque10 as qtde_estoque, pi.qtde_pedido_item' +
    ' -coalesce(n.qtde_item,0) as qtde_pedido' +
    ' from pedidos_itens pi' +
    ' inner join pedidos p on (p.pedido_sq=pi.pedido_sq)' +
    ' inner join clientes c on (c.cliente_sq=p.cliente_sq)' +
    ' inner join produtos pr on (pr.produto_sq=pi.produto_sq)' +
    ' left join (select n.pedido_sq, ni.produto_sq, sum(ni.qtde_item) as qtde_item' +
    '   from nfiscais n' +
    '   inner join nfiscais_itens ni on (ni.nfiscal_sq=n.nfiscal_sq)' +
    '   where n.cancelada = ''N''' +
    '   group by n.pedido_sq, ni.produto_sq) n on (n.pedido_sq=pi.pedido_sq and n.produto_sq=pi.produto_sq)' +
    ' where coalesce(n.qtde_item,0) < pi.qtde_pedido_item and (pr.qtde_estoque1+' +
    '   pr.qtde_estoque2+pr.qtde_estoque3+pr.qtde_estoque4+pr.qtde_estoque5+' +
    '   pr.qtde_estoque6+pr.qtde_estoque7+pr.qtde_estoque8+pr.qtde_estoque9+' +
    '   pr.qtde_estoque10+coalesce(n.qtde_item,0)) < pi.qtde_pedido_item' +
    ' order by p.numero_pedido';
  result := listaPersonalizada(sql);
end;

function TPedido.pesquisaProduto(produto_sq: Integer): TCadastro;
var
  i: Integer;
begin
  result := nil;
  for i := 0 to listaItem.Count - 1 do
  begin
    if TPedidoItem(listaItem.Items[i]).produto_sq.vIndice = produto_sq then
    begin
      result := TPedidoItem(listaItem.Items[i]);
      exit;
    end;
  end;
end;

procedure TPedido.salvar;
var
  empresa: TEmpresa;
  cds: TClientDataSet;
  i: Integer;

  function TemItemSq(indice: Variant): Boolean;
  var
    i: Integer;
  begin
    result := false;
    for i := 0 to listaItem.Count - 1 do
    begin
      if TCadastro(listaItem.Items[i]).vIndice = indice then
      begin
        result := true;
        exit;
      end;
    end;
  end;

begin
  while numero_pedido = 0 do
  begin
    empresa := TEmpresa.Create(1);
    if (empresa.numero_pedido = 0) then
      empresa.numero_pedido := 1;

    if listaPersonalizada('select count(*) as total from pedidos where numero_pedido = ' + IntToStr(empresa.numero_pedido)).FieldByName('total').Value = 0 then
      numero_pedido := empresa.numero_pedido
    else
    begin
      empresa.numero_pedido := empresa.numero_pedido + 1;
      empresa.salvar;
    end;
  end;

  inherited;

  cds := TPedidoItem.listaRegistros(' where pedido_sq = ' + VarToStr(vIndice));

  for i := 0 to listaItem.Count - 1 do
  begin
    TPedidoItem(listaItem.Items[i]).pedido_sq := vIndice;
    TPedidoItem(listaItem.Items[i]).salvar;
  end;

  while not cds.Eof do
  begin
    if (not TemItemSq(cds.FieldByName('pedido_item_sq').Value)) then
      TPedidoItem.Create(cds.FieldByName('pedido_item_sq').Value).excluirRegistro(false);
    cds.Next;
  end;
end;

procedure TPedido.Setcond_pagto2_sq(const Value: TCondPagto);
begin
  Fcond_pagto2_sq := Value;
end;

procedure TPedido.Setcond_pagto3_sq(const Value: TCondPagto);
begin
  Fcond_pagto3_sq := Value;
end;

procedure TPedido.setIndice;
begin
  inherited;

  listaItem.Clear;
  if (indiceP = null) then
    exit;

  With TPedidoItem.listaRegistros('where pedido_sq = ' + VarToStr(indiceP)) do
  begin
    First;
    While not Eof do
    begin
      listaItem.Add(TPedidoItem.Create(FieldByName('pedido_item_sq').Value));
      Next;
    end;
    Free;
  end;
end;

procedure TPedido.setStatus(const Value: Variant);
begin
  if _status = 'F' then
    raise Exception.Create('Pedido já finalizado, impossível alterar o status.');

  if _status = 'C' then
    raise Exception.Create('Pedido já cancelado, impossível alterar o status.');

  _status := Value;
end;

procedure TPedido.Setvendedor_sq_desconto(const Value: Variant);
begin
  Fvendedor_sq_desconto := Value;
end;

procedure TPedido.Setvlr_cond_pagto(const Value: Double);
begin
  Fvlr_cond_pagto := Value;
end;

procedure TPedido.Setvlr_cond_pagto2(const Value: Double);
begin
  Fvlr_cond_pagto2 := Value;
end;

procedure TPedido.Setvlr_cond_pagto3(const Value: Double);
begin
  Fvlr_cond_pagto3 := Value;
end;

{ TPedidoItem }

constructor TPedidoItem.Create;
begin
  setTabela('pedidos_itens');
  listaSerie := TList.Create;
end;

constructor TPedidoItem.Create(indice: Variant);
begin
  inherited;

  if existeSerie then
  begin
    With cdsListaSerie do
    begin
      First;
      While not Eof do
      begin
        listaSerie.Add(TPedidoItemSerie.Create(FieldByName('pedido_item_serie_sq').Value));
        Next;
      end;
      Free;
    end;
  end;
end;

function TPedidoItem.existeSerie: Boolean;
var
  cds: TClientDataSet;
begin
  cds := listaPersonalizada('show tables like ''pedidos_itens_serie''');
  result := cds.RecordCount > 0;
  cds.Free;
end;

function TPedidoItem.cdsListaSerie: TClientDataSet;
var
  sql: String;
begin
  sql := 'select * from pedidos_itens_serie' +
    ' where pedido_item_sq = ' + VarToStr(vIndice);
  result := listaPersonalizada(sql);
end;

destructor TPedidoItem.Destroy;
var
  i: Integer;
  obj: TCadastro;
begin
  FreeAndNil(_produto_sq);

  if (listaSerie <> nil) then
  for i := 0 to listaSerie.Count - 1 do
  begin
      obj := TPedidoItemSerie(listaSerie.Items[i]);
      FreeAndNil(obj);
  end;
  FreeAndNil(listaSerie);

  inherited;
end;

function TPedidoItem.ItensFaturados: TClientDataSet;
begin
  result := listaPersonalizada('select sum(ni.qtde_item) qtde_faturado ' +
      ' from nfiscais_itens ni ' +
      ' inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq) ' +
      ' where n.pedido_sq=' + IntToStr(pedido_sq) +
      ' and n.cancelada <> ''S'' and ni.produto_sq = ' + VarToStr(produto_sq.vIndice));
end;

procedure TPedidoItem.salvar;
var
  cds: TClientDataSet;
  i: Integer;
  pedidoItemSerie: TPedidoItemSerie;

  function TemItemSq(indice: Variant): Boolean;
  var
    i: Integer;
  begin
    result := false;
    for i := 0 to listaSerie.Count - 1 do
    begin
      if TCadastro(listaSerie.Items[i]).vIndice = indice then
      begin
        result := true;
        exit;
      end;
    end;
  end;
begin
  inherited;

  if existeSerie then
  begin
    cds := TPedidoItemSerie.listaRegistros(' where pedido_item_sq = ' + VarToStr(vIndice));

    for i := 0 to listaSerie.Count - 1 do
    begin
      pedidoItemSerie := TPedidoItemSerie(listaSerie.Items[i]);
      pedidoItemSerie.pedido_item_sq := vIndice;
      pedidoItemSerie.salvar;
    end;

    while not cds.Eof do
    begin
      if (not TemItemSq(cds.FieldByName('pedido_item_serie_sq').Value)) then
        TPedidoItemSerie.Create(cds.FieldByName('pedido_item_serie_sq').Value).excluirRegistro(false);
      cds.Next;
    end;
  end;
end;

{ TPedidoItemSerie }

constructor TPedidoItemSerie.Create;
begin
  setTabela('pedidos_itens_serie');
end;

end.
