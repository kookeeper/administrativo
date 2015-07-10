unit Nfiscal;

interface

uses Cadastro, Pedido, Cliente, CondPagto, Natureza, Transportadora, Vendedor,
    Produto, DBClient, SysUtils, Variants, Classes, Empresa;

type
  TNfiscal = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _NUMERO_NFISCAL	: Integer;
    _DTEMISSAO_NFISCAL	: Variant;
    _DTSAIDA_NFISCAL	: Variant;
    _PEDIDO_SQ	: TPedido;
    _CLIENTE_SQ	: TCliente;
    _COND_PAGTO_SQ	: TCondPagto;
    _NATUREZA_SQ	: TNatureza;
    _TRANSPORTADORA_SQ	: TTransportadora;
    _BASE_ICMS	: Double;
    _VLR_ICMS	: Double;
    _BASE_ICMS_SUBST	: Double;
    _VLR_ICMS_SUBST	: Double;
    _VLR_PRODUTOS	: Double;
    _VLR_FRETE	: Double;
    _VLR_SEGURO	: Double;
    _VLR_DESP_ACESS	: Double;
    _VLR_IPI	: Double;
    _VLR_TOTAL	: Double;
    _FRETE_TRANSP	: String;
    _PLACA_TRANSP	: String;
    _UF_PLACA_TRANSP	: String;
    _QTDE_TRANSP	: Integer;
    _ESPECIE_TRANSP	: String;
    _MARCA_TRANSP	: String;
    _NUMERO_TRANSP	: String;
    _PBRUTO_TRANSP	: String;
    _PLIQUIDO_TRANSP	: String;
    _CLASS_FISCAL1	: Integer;
    _CLASS_FISCAL2	: Integer;
    _CLASS_FISCAL3	: Integer;
    _CLASS_FISCAL4	: Integer;
    _CLASS_FISCAL5	: Integer;
    _CLASS_FISCAL6	: Integer;
    _CLASS_FISCAL7	: Integer;
    _MENSAGEM	: String;
    _CANCELADA	: String;
    _DIAS_DEMONSTRACAO	: Integer;
    _COTACAO_DOLAR	: Double;
    _NR_NFISCAL_RETORNO	: Integer;
    _DT_NFISCAL_RETORNO	: TDateTime;
    _CONCLUIDA	: String;
    _VENDEDOR_SQ	: TVendedor;
    _NF_MANUAL	: String;
    _RETORNO_PRODUTO	: String;
    _RETORNO_OBSERVACAO	: String;
    _NATUREZA_RET_DEM	: TNatureza;
    _class_fiscal8	: Integer;
    _class_fiscal9	: Integer;
    _class_fiscal10	: Integer;
    _class_fiscal11	: Integer;
    _class_fiscal12	: Integer;
    _class_fiscal13	: Integer;
    _class_fiscal14	: Integer;
    _class_fiscal15	: Integer;
    _class_fiscal16	: Integer;
    _class_fiscal17	: Integer;
    _class_fiscal18	: Integer;
    _class_fiscal19	: Integer;
    _class_fiscal20	: Integer;
    _class_fiscal21	: Integer;
    _class_fiscal22	: Integer;
    _class_fiscal23	: Integer;
    _class_fiscal24	: Integer;
    _inf_adicional	: String;
    _nfe_chave	: String;
    _nfe_resposta	: String;
    _numero_nfe	: Variant;
    _nfiscal_sq_referencia	: Variant;
    _recibo_nfe	: String;
    _motivo_cancelamento  : String;
    _vlr_ii: Double;
    _uf_embarque: String;
    _local_embarque: String;
    _itens: TList;
    _cartaCorrecao: TList;
    procedure carregaItens;
    procedure limpaItens;
    function TemItemSq(indice: Variant): Boolean;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property	numero_nfiscal	:Integer	read _numero_nfiscal	write _numero_nfiscal	;
    property	dtemissao_nfiscal	:Variant  read _dtemissao_nfiscal	write _dtemissao_nfiscal	;
    property	dtsaida_nfiscal	:Variant	read _dtsaida_nfiscal	write _dtsaida_nfiscal	;
    property	pedido_sq	:TPedido	read _pedido_sq	write _pedido_sq	;
    property	cliente_sq	:TCliente	read _cliente_sq	write _cliente_sq	;
    property	cond_pagto_sq	:TCondPagto	read _cond_pagto_sq	write _cond_pagto_sq	;
    property	natureza_sq	:TNatureza	read _natureza_sq	write _natureza_sq	;
    property	transportadora_sq	:TTransportadora	read _transportadora_sq	write _transportadora_sq	;
    property	base_icms	:Double	read _base_icms	write _base_icms	;
    property	vlr_icms	:Double	read _vlr_icms	write _vlr_icms	;
    property	base_icms_subst	:Double	read _base_icms_subst	write _base_icms_subst	;
    property	vlr_icms_subst	:Double	read _vlr_icms_subst	write _vlr_icms_subst	;
    property	vlr_produtos	:Double	read _vlr_produtos	write _vlr_produtos	;
    property	vlr_frete	:Double	read _vlr_frete	write _vlr_frete	;
    property	vlr_seguro	:Double	read _vlr_seguro	write _vlr_seguro	;
    property	vlr_desp_acess	:Double	read _vlr_desp_acess	write _vlr_desp_acess	;
    property	vlr_ipi	:Double	read _vlr_ipi	write _vlr_ipi	;
    property	vlr_total	:Double	read _vlr_total	write _vlr_total	;
    property	frete_transp	:String	read _frete_transp	write _frete_transp	;
    property	placa_transp	:String	read _placa_transp	write _placa_transp	;
    property	uf_placa_transp	:String	read _uf_placa_transp	write _uf_placa_transp	;
    property	qtde_transp	:Integer	read _qtde_transp	write _qtde_transp	;
    property	especie_transp	:String	read _especie_transp	write _especie_transp	;
    property	marca_transp	:String	read _marca_transp	write _marca_transp	;
    property	numero_transp	:String	read _numero_transp	write _numero_transp	;
    property	pbruto_transp	:String	read _pbruto_transp	write _pbruto_transp	;
    property	pliquido_transp	:String	read _pliquido_transp	write _pliquido_transp	;
    property	class_fiscal1	:Integer	read _class_fiscal1	write _class_fiscal1	;
    property	class_fiscal2	:Integer	read _class_fiscal2	write _class_fiscal2	;
    property	class_fiscal3	:Integer	read _class_fiscal3	write _class_fiscal3	;
    property	class_fiscal4	:Integer	read _class_fiscal4	write _class_fiscal4	;
    property	class_fiscal5	:Integer	read _class_fiscal5	write _class_fiscal5	;
    property	class_fiscal6	:Integer	read _class_fiscal6	write _class_fiscal6	;
    property	class_fiscal7	:Integer	read _class_fiscal7	write _class_fiscal7	;
    property	mensagem	:String	read _mensagem	write _mensagem	;
    property	cancelada	:String	read _cancelada	write _cancelada	;
    property	dias_demonstracao	:Integer	read _dias_demonstracao	write _dias_demonstracao	;
    property	cotacao_dolar	:Double	read _cotacao_dolar	write _cotacao_dolar	;
    property	nr_nfiscal_retorno	:Integer	read _nr_nfiscal_retorno	write _nr_nfiscal_retorno	;
    property	dt_nfiscal_retorno	:TDateTime	read _dt_nfiscal_retorno	write _dt_nfiscal_retorno	;
    property	concluida	:String	read _concluida	write _concluida	;
    property	vendedor_sq	:TVendedor	read _vendedor_sq	write _vendedor_sq	;
    property	nf_manual	:String	read _nf_manual	write _nf_manual	;
    property	retorno_produto	:String	read _retorno_produto	write _retorno_produto	;
    property	retorno_observacao	:String	read _retorno_observacao	write _retorno_observacao	;
    property	natureza_ret_dem	:TNatureza	read _natureza_ret_dem	write _natureza_ret_dem	;
    property	class_fiscal8	:Integer	read _class_fiscal8	write _class_fiscal8	;
    property	class_fiscal9	:Integer	read _class_fiscal9	write _class_fiscal9	;
    property	class_fiscal10	:Integer	read _class_fiscal10	write _class_fiscal10	;
    property	class_fiscal11	:Integer	read _class_fiscal11	write _class_fiscal11	;
    property	class_fiscal12	:Integer	read _class_fiscal12	write _class_fiscal12	;
    property	class_fiscal13	:Integer	read _class_fiscal13	write _class_fiscal13	;
    property	class_fiscal14	:Integer	read _class_fiscal14	write _class_fiscal14	;
    property	class_fiscal15	:Integer	read _class_fiscal15	write _class_fiscal15	;
    property	class_fiscal16	:Integer	read _class_fiscal16	write _class_fiscal16	;
    property	class_fiscal17	:Integer	read _class_fiscal17	write _class_fiscal17	;
    property	class_fiscal18	:Integer	read _class_fiscal18	write _class_fiscal18	;
    property	class_fiscal19	:Integer	read _class_fiscal19	write _class_fiscal19	;
    property	class_fiscal20	:Integer	read _class_fiscal20	write _class_fiscal20	;
    property	class_fiscal21	:Integer	read _class_fiscal21	write _class_fiscal21	;
    property	class_fiscal22	:Integer	read _class_fiscal22	write _class_fiscal22	;
    property	class_fiscal23	:Integer	read _class_fiscal23	write _class_fiscal23	;
    property	class_fiscal24	:Integer	read _class_fiscal24	write _class_fiscal24	;
    property	inf_adicional	:String	read _inf_adicional	write _inf_adicional	;
    property	nfe_chave	:String	read _nfe_chave	write _nfe_chave	;
    property	nfe_resposta	:String	read _nfe_resposta	write _nfe_resposta	;
    property	numero_nfe	:Variant	read _numero_nfe	write _numero_nfe	;
    property	nfiscal_sq_referencia	:Variant	read _nfiscal_sq_referencia	write _nfiscal_sq_referencia	;
    property	recibo_nfe	:String	read _recibo_nfe	write _recibo_nfe	;
    property  motivo_cancelamento :String read _motivo_cancelamento write _motivo_cancelamento  ;
    property	vlr_ii	:Double	read _vlr_ii	write _vlr_ii	;
    property  uf_embarque :String read _uf_embarque write _uf_embarque  ;
    property  local_embarque :String read _local_embarque write _local_embarque  ;
  public
    constructor Create; override;
    constructor CreateNumero(numeroNfiscal: Integer);
    constructor CreateNFe(numeroNfe: Integer);
    destructor Destroy; override;
    procedure setIndice(const Value: Variant); override;
    class function listaVendas(cliente_sq: Integer): TClientDataSet; overload;
    class function listaVendas(dtInicio, dtTermino: TDateTime; produto_sq,
      vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet; overload;
    class function listaVendaAcumulada(anoBase: Integer; produto_sq,
      vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet;
    class function listaVendasVendedor(dtInicio, dtTermino: TDateTime; produto_sq,
      vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet;
    class function listaVendasProduto(dtInicio, dtTermino: TDateTime; produto_sq,
      vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet; overload;
    class function buscarNumeroSerie(numeroSerie: String): TClientDataSet;
    class function buscarComissao(dtInicio, dtTermino: TDateTime; vendedor_sq: Variant): TClientDataSet;
    procedure salvar; override;
    procedure cancelar();
    procedure finalizar();
    procedure finalizarNfe(numero: Integer; chaveNFe: String; motivo: String;
      recibo: String);
    property listaItem: TList read _itens write _itens;
    property listaCartaCorrecao: TList read _cartaCorrecao write _cartaCorrecao;
    function listaDuplicatas(): TClientDataSet;
    function listaItens(): TClientDataSet;
    procedure copiaPedido(const pedido: TPedido);
    function BuscaItem(item: Integer): TCadastro;
    function BuscaCartaCorrecao(vIndice: Integer): TCadastro;
    function BuscaProximoItem: Integer;
    class function listaFechamentoNota(dtInicio, dtTermino: TDateTime): TClientDataSet;
    class function listaFechamentoNotaCliente(dtInicio, dtTermino: TDateTime): TClientDataSet;
    class function listaFechamentoNotaServico(dtInicio, dtTermino: TDateTime): TClientDataSet;
  end;

type
  TNfiscalItem = class(TCadastro)
  private
    _nfiscal_sq            : Integer;
    _item                  : Integer;
    _produto_sq            : TProduto;
    _nr_serie_item         : String;
    _class_fiscal          : String;
    _stribut               : Integer;
    _vlr_unit_item         : Double;
    _vlr_total_item        : Double;
    _aliq_icms_item        : Double;
    _aliq_ipi_item         : Double;
    _vlr_icms_item         : Double;
    _vlr_ipi_item          : Double;
    _peso_bruto            : Double;
    _peso_liquido          : Double;
    _qtde_item             : Integer;
    _vlr_desc              : Double;
    _pct_desc              : Double;
    _vlr_juros             : Double;
    _pct_juros             : Double;
    _base_icms_subst_item  : Double;
    _vlr_icms_subst_item   : Double;
    _origem_mercadoria     : Integer;
    _vlr_frete_item        : Double;
    _vlr_seguro_item       : Double;
    _vlr_desp_acess_item   : Double;
    _base_ii_item          : Double;
    _vlr_ii_item           : Double;
    _vlr_desp_adu_item     : Double;
    _vlr_iof_item          : Double;
    _numero_di             : String;
    _data_di               : TDateTime;
    _local_desemb          : String;
    _uf_desemb             : String;
    _data_desemb           : TDateTime;
    _codigo_exportador     : String;
    _base_icms_item        : Double;
    _numero_estoque        : Integer;
    procedure copiaItemPedido(nfiscal: TNfiscal; pedido: TPedido; itemPedido: TPedidoItem);
    function existeSerie: Boolean;
  published
    property nfiscal_sq            : Integer  read _nfiscal_sq           write _nfiscal_sq          ;
    property item                  : Integer  read _item                 write _item                ;
    property produto_sq            : TProduto read _produto_sq           write _produto_sq          ;
    property nr_serie_item         : String   read _nr_serie_item        write _nr_serie_item       ;
    property class_fiscal          : String   read _class_fiscal         write _class_fiscal        ;
    property stribut               : Integer  read _stribut              write _stribut             ;
    property vlr_unit_item         : Double   read _vlr_unit_item        write _vlr_unit_item       ;
    property vlr_total_item        : Double   read _vlr_total_item       write _vlr_total_item      ;
    property aliq_icms_item        : Double   read _aliq_icms_item       write _aliq_icms_item      ;
    property aliq_ipi_item         : Double   read _aliq_ipi_item        write _aliq_ipi_item       ;
    property vlr_icms_item         : Double   read _vlr_icms_item        write _vlr_icms_item       ;
    property vlr_ipi_item          : Double   read _vlr_ipi_item         write _vlr_ipi_item        ;
    property peso_bruto            : Double   read _peso_bruto           write _peso_bruto          ;
    property peso_liquido          : Double   read _peso_liquido         write _peso_liquido        ;
    property qtde_item             : Integer  read _qtde_item            write _qtde_item           ;
    property vlr_desc              : Double   read _vlr_desc             write _vlr_desc            ;
    property pct_desc              : Double   read _pct_desc             write _pct_desc            ;
    property vlr_juros             : Double   read _vlr_juros            write _vlr_juros           ;
    property pct_juros             : Double   read _pct_juros            write _pct_juros           ;
    property base_icms_subst_item  : Double   read _base_icms_subst_item write _base_icms_subst_item;
    property vlr_icms_subst_item   : Double   read _vlr_icms_subst_item  write _vlr_icms_subst_item ;
    property origem_mercadoria     : Integer  read _origem_mercadoria    write _origem_mercadoria   ;
    property vlr_frete_item        : Double   read _vlr_frete_item       write _vlr_frete_item      ;
    property vlr_seguro_item       : Double   read _vlr_seguro_item      write _vlr_seguro_item     ;
    property vlr_desp_acess_item   : Double   read _vlr_desp_acess_item  write _vlr_desp_acess_item ;
    property base_ii_item          : Double   read _base_ii_item         write _base_ii_item ;
    property vlr_ii_item           : Double   read _vlr_ii_item          write _vlr_ii_item ;
    property vlr_desp_adu_item     : Double   read _vlr_desp_adu_item    write _vlr_desp_adu_item ;
    property vlr_iof_item          : Double   read _vlr_iof_item         write _vlr_iof_item ;
    property numero_di             : String   read _numero_di            write _numero_di         ;
    property data_di               : TDateTime read _data_di             write _data_di           ;
    property local_desemb          : String   read _local_desemb         write _local_desemb      ;
    property uf_desemb             : String   read _uf_desemb            write _uf_desemb         ;
    property data_desemb           : TDateTime read _data_desemb         write _data_desemb       ;
    property codigo_exportador     : String   read _codigo_exportador    write _codigo_exportador ;
    property base_icms_item        : Double   read _base_icms_item       write _base_icms_item    ;
    property numero_estoque        : Integer  read _numero_estoque       write _numero_estoque    ;
  public
    listaAdicao, listaSerie: TList;
    constructor Create; override;
    constructor Create(indice: Variant); override;
    destructor Destroy; override;
    procedure salvar; override;
    function cdsListaAdicao: TClientDataSet;
    function cdsListaSerie: TClientDataSet;
  end;

type
  TNfiscalItemAdicao = class(TCadastro)
  private
    _nfiscal_item_sq          : Integer;
  	_numero_adicao            : Integer;
  	_numero_sequencial_adicao : Integer;
  	_codigo_fabricante        : String;
  	_vlr_desc_adicao          : Double;
  published
    property nfiscal_item_sq          : Integer read _nfiscal_item_sq          write _nfiscal_item_sq         ;
    property numero_adicao            : Integer read _numero_adicao            write _numero_adicao           ;
    property numero_sequencial_adicao : Integer read _numero_sequencial_adicao write _numero_sequencial_adicao;
    property codigo_fabricante        : String  read _codigo_fabricante        write _codigo_fabricante       ;
    property vlr_desc_adicao          : Double  read _vlr_desc_adicao          write _vlr_desc_adicao         ;
  public
    constructor Create; override;
  end;

type
  TNfiscalItemSerie = class(TCadastro)
  private
    _nfiscal_item_sq: Integer;
    _produto_numero_serie_sq     : TProdutoNumeroSerie;
  published
    property nfiscal_item_sq: Integer  read _nfiscal_item_sq write _nfiscal_item_sq;
    property produto_numero_serie_sq     : TProdutoNumeroSerie read _produto_numero_serie_sq      write _produto_numero_serie_sq     ;
  public
    constructor Create; override;
  end;

implementation

uses Duplicata, Kardex, Usuario, UDM, DB, CartaCorrecao, StrUtils, Math;

{ TNfiscal }

procedure TNfiscal.salvar;
var
  empresa: TEmpresa;
  cds: TClientDataSet;
  i: Integer;
begin
  while numero_nfiscal = 0 do
  begin
    empresa := TEmpresa.Create(1);

    if listaPersonalizada('select count(*) as total from nfiscais where numero_nfiscal = ' + IntToStr(empresa.numero_nfiscal)).FieldByName('total').Value = 0 then
      numero_nfiscal := empresa.numero_nfiscal
    else
    begin
      empresa.numero_nfiscal := empresa.numero_nfiscal + 1;
      empresa.salvar;
    end;
  end;

  inherited;

  cds := TNfiscalItem.listaRegistros(' where nfiscal_sq = ' + VarToStr(vIndice));

  for i := 0 to listaItem.Count - 1 do
  begin
    TNfiscalItem(listaItem.Items[i]).nfiscal_sq := vIndice;
    TNfiscalItem(listaItem.Items[i]).salvar;
  end;

  while not cds.Eof do
  begin
    if (not TemItemSq(cds.FieldByName('nfiscal_item_sq').Value)) then
      TNfiscalItem.Create(cds.FieldByName('nfiscal_item_sq').Value).excluirRegistro(false);
    cds.Next;
  end;

  if pedido_sq <> nil then
    pedido_sq.AtualizaStatus;
end;

function TNfiscal.TemItemSq(indice: Variant): Boolean;
var
  i: Integer;
begin
  result := false;
  for i := 0 to listaItem.Count - 1 do
  begin
    if TNfiscalItem(listaItem.Items[i]).vIndice = indice then
    begin
      result := true;
      exit;
    end;
  end;
end;

procedure TNfiscal.cancelar();
var
  cds1, cdsItens: TClientDataSet;
  item: TNfiscalItem;
  i, numero_estoque_: Integer;
  dataMovimentacao: TDateTime;
begin
  cancelada := 'S';
  salvar;

  dataMovimentacao := Date + Time;

  cds1 := TDuplicata.listaRegistros('where nfiscal_sq='+VarToStr(vIndice));
  while not cds1.Eof do
  begin
    TDuplicata.Create(cds1.FieldByName('duplicata_sq').Value).excluirRegistro(false);
    cds1.Next;
  end;

  cdsItens := TNfiscalItem.listaRegistros(' where nfiscal_sq = ' + VarToStr(vIndice));

  cdsItens.First;
  While not cdsItens.Eof do
  begin
    item := TNfiscalItem.Create(cdsItens.FieldByName('nfiscal_item_sq').Value);
    numero_estoque_ := item.numero_estoque;
    if (numero_estoque_ = 0) then
    begin
      if (natureza_sq.ent_sai ='E') then numero_estoque_ := natureza_sq.numero_estoque_entrada;
      if (natureza_sq.ent_sai ='S') then numero_estoque_ := natureza_sq.numero_estoque_saida;
    end;

    if (item.produto_sq.controle_numero_serie = 1) then
    begin
      for i := 0 to item.listaSerie.Count - 1 do
      begin
        if (natureza_sq.ent_sai = 'E') then
        begin
          TProdutoNumeroSerie.saida(
            TNfiscalItemSerie(item.listaSerie.Items[i]).produto_numero_serie_sq.numero_serie,
            item.vlr_total_item,
            numero_nfiscal,
            dataMovimentacao);
        end;
        if (natureza_sq.ent_sai = 'S') then
        begin
          TProdutoNumeroSerie.entrada(
            item.produto_sq,
            TNfiscalItemSerie(item.listaSerie.Items[i]).produto_numero_serie_sq.numero_serie,
            numero_estoque_,
            item.vlr_total_item,
            dataMovimentacao,
            numero_nfiscal);
        end;
      end;
    end
    else begin
      With TKardex.Create do
      begin
        produto_sq := item.produto_sq;
        tipo_mov   := natureza_sq.ent_sai;
        qtde       := item.qtde_item * -1;
        numero_estoque := numero_estoque_;
        data       := dataMovimentacao;
        nfiscal    := numero_nfiscal;
        valor      := item.vlr_total_item;
        usuario_sq := TUsuario.Create(DM.useq);
        nr_serie   := item.nr_serie_item;
        salvar;
      end;
    end;

    if ((natureza_sq.ent_sai = 'S') and (natureza_sq.numero_estoque_entrada > 0)) then
    With TKardex.Create do
    begin
      produto_sq := item.produto_sq;
      tipo_mov   := 'E';
      qtde       := item.qtde_item * -1;
      numero_estoque := natureza_sq.numero_estoque_entrada;
      data       := dtemissao_nfiscal;
      nfiscal    := numero_nfiscal;
      valor      := item.vlr_total_item;
      usuario_sq := TUsuario.Create(DM.useq);
      nr_serie   := item.nr_serie_item;
      salvar;
    end;

    if ((natureza_sq.ent_sai = 'E') and (natureza_sq.numero_estoque_saida > 0)) then
    With TKardex.Create do
    begin
      produto_sq := item.produto_sq;
      tipo_mov   := 'S';
      qtde       := item.qtde_item * -1;
      numero_estoque := natureza_sq.numero_estoque_saida;
      data       := dtemissao_nfiscal;
      nfiscal    := numero_nfiscal;
      valor      := item.vlr_total_item;
      usuario_sq := TUsuario.Create(DM.useq);
      nr_serie   := item.nr_serie_item;
      salvar;
    end;

    cdsItens.Next;
  end;

end;

constructor TNfiscal.Create;
begin
  setTabela('nfiscais');
  setLista('"Número NFe=numero_nfe","Pedido=NUMERO_PEDIDO","Número=NUMERO_NFISCAL",' +
    '"Data Emissão=DTEMISSAO_NFISCAL","Cliente=NOME_CLIENTE",' +
    '"Valor N.Fiscal=VLR_TOTAL","Condição de Pagamento=DESCRICAO_COND_PAGTO",' +
    '"Natureza da Operação=descricao_natureza"');

  sqlLista := 'select n.*, c.nome_cliente, p.descricao_cond_pagto, pe.numero_pedido, pe.observacao_nf, ' +
         'case na.descricao_natureza_nfiscal when '''' then na.descricao_natureza else na.descricao_natureza_nfiscal end as descricao_natureza, ' +
         'd1.numero_duplicata as dup1, d1.item_duplicata as it_dup1, d1.valor_duplicata as vlr_dup1, d1.dtemissao_duplicata as dt_dup1, ' +
         'd2.numero_duplicata as dup2, d2.item_duplicata as it_dup2, d2.valor_duplicata as vlr_dup2, d2.dtemissao_duplicata as dt_dup2, ' +
         'd3.numero_duplicata as dup3, d3.item_duplicata as it_dup3, d3.valor_duplicata as vlr_dup3, d3.dtemissao_duplicata as dt_dup3 ' +
         'from nfiscais n ' +
         'left join pedidos pe on (pe.pedido_sq = n.pedido_sq) ' +
         'left join clientes c on (c.cliente_sq = n.cliente_sq) ' +
         'left join cond_pagto p on (p.cond_pagto_sq = n.cond_pagto_sq) ' +
         'left join naturezas na on (na.natureza_sq = n.natureza_sq) ' +
         'left join duplicatas d1 on (d1.numero_duplicata = n.numero_nfiscal and d1.item_duplicata = 1 and d1.seq_duplicata = 0) ' +
         'left join duplicatas d2 on (d2.numero_duplicata = n.numero_nfiscal and d2.item_duplicata = 2 and d2.seq_duplicata = 0) ' +
         'left join duplicatas d3 on (d3.numero_duplicata = n.numero_nfiscal and d3.item_duplicata = 3 and d3.seq_duplicata = 0) ';
end;

class function TNfiscal.listaVendas(cliente_sq: Integer): TClientDataSet;
begin
  result := listaPersonalizada('select nfiscal_item_sq, descricao_produto, dtemissao_nfiscal, numero_nfiscal ' +
    ' from nfiscais_itens ni ' +
    ' left outer join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq) ' +
    ' left outer join produtos p on (p.produto_sq=ni.produto_sq) ' +
    ' where cancelada <> ''S'' and cliente_sq = ' + IntToStr(cliente_sq) +
    ' order by descricao_produto, numero_nfiscal');
end;

class function TNfiscal.listaVendas(dtInicio, dtTermino: TDateTime; produto_sq, vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet;
var
  sql: String;
begin
  sql := 'select n.*, v.*, c.*, ';
  if (produto_sq <> null) then
    sql := sql + 'it.vlr_total_item, it.qtde_item, it.vlr_icms_subst_item, ';

  sql := sql +
    'd1.numero_duplicata as dup1, d1.item_duplicata as it1, d1.valor_duplicata as vlr1, d1.dtvencto_duplicata as vct1, '+
    'd2.numero_duplicata as dup2, d2.item_duplicata as it2, d2.valor_duplicata as vlr2, d2.dtvencto_duplicata as vct2, '+
    'd3.numero_duplicata as dup3, d3.item_duplicata as it3, d3.valor_duplicata as vlr3, d3.dtvencto_duplicata as vct3, '+
    'd4.numero_duplicata as dup4, d4.item_duplicata as it4, d4.valor_duplicata as vlr4, d4.dtvencto_duplicata as vct4, '+
    'd5.numero_duplicata as dup5, d5.item_duplicata as it5, d5.valor_duplicata as vlr5, d5.dtvencto_duplicata as vct5 '+
    'from nfiscais n '+
    'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq) '+
    'left outer join clientes c on (c.cliente_sq = n.cliente_sq) '+
    'left outer join naturezas na on (na.natureza_sq = n.natureza_sq) '+
    'left outer join duplicatas d1 on (d1.nfiscal_sq = n.nfiscal_sq and d1.item_duplicata = 1) '+
    'left outer join duplicatas d2 on (d2.nfiscal_sq = n.nfiscal_sq and d2.item_duplicata = 2) '+
    'left outer join duplicatas d3 on (d3.nfiscal_sq = n.nfiscal_sq and d3.item_duplicata = 3) '+
    'left outer join duplicatas d4 on (d4.nfiscal_sq = n.nfiscal_sq and d4.item_duplicata = 4) '+
    'left outer join duplicatas d5 on (d5.nfiscal_sq = n.nfiscal_sq and d5.item_duplicata = 5) ';
  if (produto_sq <> null) then
  begin
    sql := sql + 'inner join (select nfiscal_sq, sum(vlr_total_item) vlr_total_item, sum(vlr_icms_subst_item) as vlr_icms_subst_item, sum(qtde_item) qtde_item from nfiscais_itens ni ' +
      'where ni.produto_sq = ' + VarToStr(produto_sq) +
      ' group by nfiscal_sq) it on (it.nfiscal_sq=n.nfiscal_sq) ';
  end;

  sql := sql +
    'where na.tipo_nfiscal = 0 and n.cancelada <> ''S'' '+
    'and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) + ' '+
    'and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) + ' ';
    if (vendedor_sq <> null) then
      sql := sql + ' and n.vendedor_sq = ' + VarToStr(vendedor_sq);
    if (codigo_cliente <> '') then
      sql := sql + ' and ((codigo_cliente like ''%' + VarToStr(codigo_cliente) + '%'') or (nome_cliente like ''%' + VarToStr(codigo_cliente) + '%''))';
    if (estado <> null) then
      sql := sql + ' and c.estado = ' + QuotedStr(VarToStr(estado));
    sql := sql + ' order by numero_nfiscal';
  result := listaPersonalizada(sql);
end;

class function TNfiscal.listaVendaAcumulada(anoBase: Integer; produto_sq, vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet;
var
  sql: String;
  cds, cdsResult: TClientDataSet;
begin
  sql := 'select c.cliente_sq, c.nome_cliente, date_format(n.dtemissao_nfiscal, ''%m'') mes, sum(coalesce(ni.vlr_total_item, 0) - coalesce(ni.vlr_icms_subst_item, 0)) valor ' +
    'from nfiscais n '+
    ' inner join nfiscais_itens ni on (ni.nfiscal_sq = n.nfiscal_sq) ' +
    ' left outer join clientes c on (c.cliente_sq = n.cliente_sq) '+
    ' left outer join naturezas na on (na.natureza_sq = n.natureza_sq) ' +
    'where na.tipo_nfiscal = 0 and n.cancelada <> ''S'' '+
    ' and date_format(dtemissao_nfiscal, ''%Y'') = ' + IntToStr(anoBase) + ' ' +
    IfThen(vendedor_sq <> null, ' and n.vendedor_sq = ' + VarToStr(vendedor_sq)) +
    IfThen(codigo_cliente <> '', ' and ((codigo_cliente like ''%' + VarToStr(codigo_cliente) + '%'') or (nome_cliente like ''%' + VarToStr(codigo_cliente) + '%''))') +
    IfThen(estado <> null, ' and c.estado = ' + QuotedStr(VarToStr(estado))) +
    IfThen(produto_sq <> null, ' and ni.produto_sq = ' + VarToStr(produto_sq)) +
    ' group by c.cliente_sq, c.nome_cliente, mes ' +
    ' order by nome_cliente';
  cds := listaPersonalizada(sql);

  cdsResult := TClientDataSet.Create(DM);
  cdsResult.FieldDefs.Add('cliente_sq', ftInteger);
  cdsResult.FieldDefs.Add('nome_cliente', ftString, 50);
  cdsResult.FieldDefs.Add('mes01', ftFloat);
  cdsResult.FieldDefs.Add('mes02', ftFloat);
  cdsResult.FieldDefs.Add('mes03', ftFloat);
  cdsResult.FieldDefs.Add('mes04', ftFloat);
  cdsResult.FieldDefs.Add('mes05', ftFloat);
  cdsResult.FieldDefs.Add('mes06', ftFloat);
  cdsResult.FieldDefs.Add('mes07', ftFloat);
  cdsResult.FieldDefs.Add('mes08', ftFloat);
  cdsResult.FieldDefs.Add('mes09', ftFloat);
  cdsResult.FieldDefs.Add('mes10', ftFloat);
  cdsResult.FieldDefs.Add('mes11', ftFloat);
  cdsResult.FieldDefs.Add('mes12', ftFloat);
  cdsResult.FieldDefs.Add('total', ftFloat);
  cdsResult.CreateDataSet;

  cds.First;
  while (not cds.Eof) do
  begin
    if (not cdsResult.Locate('cliente_sq', cds.FieldByName('cliente_sq').Value, [])) then
    begin
      cdsResult.Append;
      cdsResult.FieldByName('cliente_sq').Value := cds.FieldByName('cliente_sq').Value;
      cdsResult.FieldByName('nome_cliente').Value := cds.FieldByName('nome_cliente').Value;
    end
    else
      cdsResult.Edit;

    cdsResult.FieldByName('mes' + cds.FieldByName('mes').AsString).AsFloat := cdsResult.FieldByName('mes' + cds.FieldByName('mes').AsString).AsFloat + cds.FieldByName('valor').AsFloat;
    cdsResult.FieldByName('total').AsFloat := cdsResult.FieldByName('total').AsFloat + cds.FieldByName('valor').AsFloat;
    cdsResult.Post;

    cds.Next;
  end;

  result := cdsResult;
end;

procedure TNfiscal.finalizar;
var
  cdsItens: TClientDataSet;
  item: TNfiscalItem;
  i, numero_estoque_: Integer;
  dataMovimentacao: TDateTime;
begin
  if concluida = 'S' then // significa que ja foi finalizada
    Exit;

  if pedido_sq.baixou_estoque = 'S' then //significa que nao baixou pelo pedido.
    Exit;

  if natureza_sq.ent_sai = '' then
    Exit;

  dataMovimentacao := dtemissao_nfiscal;

  cdsItens := TNfiscalItem.listaRegistros(' where nfiscal_sq = ' + VarToStr(vIndice));

  cdsItens.First;
  While not cdsItens.Eof do
  begin
    item := TNfiscalItem.Create(cdsItens.FieldByName('nfiscal_item_sq').Value);
    numero_estoque_ := item.numero_estoque;
    if (numero_estoque_ = 0) then
    begin
      if (natureza_sq.ent_sai = 'S') then numero_estoque_ := natureza_sq.numero_estoque_saida;
      if (natureza_sq.ent_sai = 'E') then numero_estoque_ := natureza_sq.numero_estoque_entrada;
    end;

    if (item.produto_sq.controle_numero_serie = 1) then
    begin
      for i := 0 to item.listaSerie.Count - 1 do
      begin
        if (natureza_sq.ent_sai = 'S') then
        begin
          TProdutoNumeroSerie.saida(
            TNfiscalItemSerie(item.listaSerie.Items[i]).produto_numero_serie_sq.numero_serie,
            item.vlr_total_item,
            numero_nfiscal,
            dataMovimentacao);
        end;
        if (natureza_sq.ent_sai = 'E') then
        begin
          TProdutoNumeroSerie.entrada(
            item.produto_sq,
            TNfiscalItemSerie(item.listaSerie.Items[i]).produto_numero_serie_sq.numero_serie,
            numero_estoque_,
            item.vlr_total_item,
            dataMovimentacao,
            numero_nfiscal);
        end;
      end;
    end
    else begin
      With TKardex.Create do
      begin
        produto_sq := item.produto_sq;
        tipo_mov   := natureza_sq.ent_sai;
        qtde       := item.qtde_item;
        numero_estoque := numero_estoque_;
        data       := dataMovimentacao;
        nfiscal    := numero_nfiscal;
        valor      := item.vlr_total_item;
        usuario_sq := TUsuario.Create(DM.useq);
        nr_serie   := item.nr_serie_item;
        salvar;
      end;
    end;

    // transferencia de produto
    if ((natureza_sq.ent_sai = 'S') and (natureza_sq.numero_estoque_entrada > 0)) then
    With TKardex.Create do
    begin
      produto_sq := item.produto_sq;
      tipo_mov   := 'E';
      qtde       := item.qtde_item;
      numero_estoque := natureza_sq.numero_estoque_entrada;
      data       := dtemissao_nfiscal + Time;
      nfiscal    := numero_nfiscal;
      valor      := item.vlr_total_item;
      usuario_sq := TUsuario.Create(DM.useq);
      nr_serie   := item.nr_serie_item;
      salvar;
    end;

    // transferencia de produto
    if ((natureza_sq.ent_sai = 'E') and (natureza_sq.numero_estoque_saida > 0)) then
    With TKardex.Create do
    begin
      produto_sq := item.produto_sq;
      tipo_mov   := 'S';
      qtde       := item.qtde_item;
      numero_estoque := natureza_sq.numero_estoque_saida;
      data       := dtemissao_nfiscal + Time;
      nfiscal    := numero_nfiscal;
      valor      := item.vlr_total_item;
      usuario_sq := TUsuario.Create(DM.useq);
      nr_serie   := item.nr_serie_item;
      salvar;
    end;

    cdsItens.Next;
  end;

  concluida := 'S';
  cancelada := 'N';
  salvar;
end;

procedure TNfiscal.carregaItens;
var
  cds: TClientDataSet;
begin
  limpaItens;
  _itens := TList.Create;
  if (vIndice <> null) then
  begin
    cds := TNfiscalItem.listaRegistros('where nfiscal_sq = ' + VarToStr(vIndice));
    While not cds.Eof do
    begin
     _itens.Add(TNfiscalItem.Create(cds.FieldByName('nfiscal_item_sq').Value));
      cds.Next;
    end;
    cds.Free;
  end;
end;

procedure TNfiscal.finalizarNfe(numero: Integer; chaveNFe: String;
  motivo: String; recibo: String);
begin
  if (chaveNFe <> '') then
    numero_nfe := numero;
  nfe_chave := chaveNFe;
  nfe_resposta := motivo;
  recibo_nfe := recibo;
  salvar;
end;

function TNfiscal.listaItens: TClientDataSet;
var
  sql: String;
begin
  sql := 'SELECT NI.*, CODIGO_PRODUTO, DESCRICAO_PRODUTO, QTDE_estoque1, qtde_estoque2,' +
    ' qtde_estoque3, qtde_estoque4, qtde_estoque5, qtde_estoque6, qtde_estoque7,' +
    ' qtde_estoque8, qtde_estoque9, qtde_estoque10, CODIGO_NBM' +
    ' FROM nfiscais_itens NI' +
    ' LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = NI.PRODUTO_SQ)' +
    ' LEFT OUTER JOIN nbm N ON (N.NBM_SQ = P.NBM_SQ)' +
    ' WHERE NI.NFISCAL_SQ = ' + VarToStr(vIndice);
  result := listaPersonalizada(sql);
end;

procedure TNfiscal.setIndice(const Value: Variant);
begin
  inherited;

  carregaItens;
end;

constructor TNfiscal.CreateNumero;
begin
  Create();
  With (listaRegistros('where numero_nfiscal = ' + IntToStr(numeroNfiscal))) do
  begin
    if RecordCount = 0 then
      Exit;
    if RecordCount > 1 then
      raise Exception.Create('Foram encontrados mais de 1 registro.');
    setIndice(FieldByName(cIndice).Value);
  end;
end;

constructor TNfiscal.CreateNFe;
begin
  Create();
  With (listaRegistros('where numero_nfe = ' + IntToStr(numeroNfe))) do
  begin
    if RecordCount = 0 then
      Exit;
    if RecordCount > 1 then
      raise Exception.Create('Foram encontrados mais de 1 registro.');
    setIndice(FieldByName(cIndice).Value);
  end;
end;

destructor TNfiscal.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_PEDIDO_SQ);
  FreeAndNil(_CLIENTE_SQ);
  FreeAndNil(_COND_PAGTO_SQ);
  FreeAndNil(_NATUREZA_SQ);
  FreeAndNil(_TRANSPORTADORA_SQ);
  FreeAndNil(_DT_NFISCAL_RETORNO);
  FreeAndNil(_VENDEDOR_SQ);
  FreeAndNil(_NATUREZA_RET_DEM);

  limpaItens;
  inherited;
end;

function TNfiscal.listaDuplicatas: TClientDataSet;
begin
  result := TDuplicata.listaRegistros('where nfiscal_sq = ' + VarToStr(vIndice));
end;

procedure TNfiscal.limpaItens;
begin
  if (_itens <> nil) then
  while (_itens.Count > 0) do
  begin
    TNfiscalItem(_itens.Items[0]).Free;
    _itens.Delete(0);
  end;
  FreeAndNil(_itens);
end;

procedure TNfiscal.copiaPedido(const pedido: TPedido);
var
  itemPedido: TPedidoItem;
  itemNfiscal: TNfiscalItem;
  i: Integer;
begin
  pedido_sq         := pedido;
  dtemissao_nfiscal := Date;
  cliente_sq        := TCliente.Create(pedido.cliente_sq.vIndice);
  cond_pagto_sq     := TCondPagto.Create(pedido.cond_pagto_sq.vIndice);
  natureza_sq       := TNatureza.Create(pedido.natureza_sq.vIndice);
  transportadora_sq := TTransportadora.Create(pedido.transportadora_sq.vIndice);
  vendedor_sq       := TVendedor.Create(pedido.vendedor_sq.vIndice);
  mensagem          := pedido.observacao_nf;
  cotacao_dolar     := pedido.cotacao_dolar;
  frete_transp      := pedido.frete_transp;
  dias_demonstracao := pedido.dias_demonstracao;
  pbruto_transp     := FloatToStr(pedido.peso_bruto);
  pliquido_transp   := FloatToStr(pedido.peso_liquido);

  listaItem.Clear;
  for i := 0 to pedido.listaItem.Count -1 do
  begin
    itemPedido := pedido.listaItem.Items[i];
    itemNfiscal := TNfiscalItem.Create;
    itemNfiscal.copiaItemPedido(Self, pedido, itemPedido);
    listaItem.Add(itemNfiscal);
  end;
end;

function TNfiscal.BuscaProximoItem: Integer;
var
  indice: Integer;
begin
  if (listaItem.Count = 0) then
  begin
    result := 1;
    exit;
  end;

  for indice := 1 to listaItem.Count do
    if (BuscaItem(indice) = nil) then
      break;

  result := indice;
end;

function TNfiscal.BuscaItem(item: Integer): TCadastro;
var
  i: Integer;
begin
  result := nil;
  for i := 0 to listaItem.Count - 1 do
  begin
    if TNfiscalItem(listaItem.Items[i]).item = item then
      result := listaItem.Items[i];
  end;
end;

function TNfiscal.BuscaCartaCorrecao(vIndice: Integer): TCadastro;
var
  i: Integer;
begin
  result := nil;
  for i := 0 to listaCartaCorrecao.Count - 1 do
  begin
    if TCartaCorrecao(listaCartaCorrecao.Items[i]).vIndice = vIndice then
      result := listaCartaCorrecao.Items[i];
  end;
end;

class function TNfiscal.buscarNumeroSerie(numeroSerie: String): TClientDataSet;
var
  sql: String;
begin
  sql := 'SELECT NI.*, N.NUMERO_NFISCAL, N.NUMERO_NFE, C.NOME_CLIENTE, N.DTEMISSAO_NFISCAL, CANCELADA ' +
         'FROM ( ' +
         'SELECT NFISCAL_SQ, NFISCAL_ITEM_SQ, SUBSTRING(NR_SERIE_ITEM, 1, 200) AS NR_SERIE_ITEM FROM NFISCAIS_ITENS WHERE NR_SERIE_ITEM LIKE ''%' + numeroSerie + '%'' ' +
         'UNION ' +
         'SELECT NFISCAL_SQ, NI.NFISCAL_ITEM_SQ, NUMERO_SERIE FROM NFISCAIS_ITENS_SERIE NIS ' +
         'INNER JOIN PRODUTO_NUMERO_SERIE PNS ON (PNS.PRODUTO_NUMERO_SERIE_SQ=NIS.PRODUTO_NUMERO_SERIE_SQ) ' +
         'INNER JOIN NFISCAIS_ITENS NI ON (NI.NFISCAL_ITEM_SQ=NIS.NFISCAL_ITEM_SQ) ' +
         'WHERE NUMERO_SERIE LIKE ''%' + numeroSerie + '%'' ' +
         ') NI ' +
         'LEFT OUTER JOIN nfiscais N ON (N.NFISCAL_SQ = NI.NFISCAL_SQ) ' +
         'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = N.CLIENTE_SQ)';
  result := listaPersonalizada(sql);
end;

class function TNfiscal.buscarComissao(dtInicio, dtTermino: TDateTime;
  vendedor_sq: Variant): TClientDataSet;
var
  sql: String;
begin
  sql := 'select ' +
         'v.vendedor_sq, v.nome_vendedor, n.numero_nfiscal, ' +
         'origem, base, n.vlr_total,  c.nome_cliente, ' +
         'if (n.origem=''P'', case when ((c.pct_comissao_propria is null) or (c.pct_comissao_propria = 0)) ' +
         '  then v.pct_comissao_propria else c.pct_comissao_propria end *(n.vlr_total-n.vlr_icms_subst)/100, ' +
         '  case when ((c.pct_comissao_parceria is null) or (c.pct_comissao_parceria = 0)) then v.pct_comissao_parceria ' +
         '  else c.pct_comissao_parceria end *(n.vlr_total-n.vlr_icms_subst)/100) as comissao ' +
         '  from vendedores v ' +
         '  inner join ( ' +
         '    select _latin1 ''P'' as origem, _latin1 ''F'' as base, v.vendedor_sq, n.numero_nfiscal, n.dtemissao_nfiscal, n.vlr_total, n.cliente_sq, n.vlr_icms_subst ' +
         '    from vendedores v ' +
         '    inner join nfiscais n on (n.vendedor_sq=v.vendedor_sq and cancelada <> ''S'' and concluida = ''S'') ' +
         '  union ' +
         '    select _latin1 ''T'' as origem, _latin1 ''F'' as base, v.vendedor_sq, n.numero_nfiscal, n.dtemissao_nfiscal, n.vlr_total, c.cliente_sq, n.vlr_icms_subst ' +
         '    from vendedores v ' +
         '    inner join clientes c on (c.vendedor_sq=v.vendedor_sq) ' +
         '    inner join nfiscais n on (n.cliente_sq=c.cliente_sq and n.vendedor_sq<>v.vendedor_sq and cancelada <> ''S'' and concluida = ''S'') ' +
         '  union ' +
         '    select _latin1 ''P'' as origem, _latin1 ''V'' as base, v.vendedor_sq, d.numero_duplicata, d.dtvencto_duplicata, d.valor_duplicata, n.cliente_sq, n.vlr_icms_subst ' +
         '    from vendedores v ' +
         '    inner join nfiscais n on (n.vendedor_sq=v.vendedor_sq and cancelada <> ''S'' and concluida = ''S'') ' +
         '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq) ' +
         '  union ' +
         '    select _latin1 ''T'' as origem, _latin1 ''V'' as base, v.vendedor_sq, d.numero_duplicata, d.dtvencto_duplicata, d.valor_duplicata, c.cliente_sq, n.vlr_icms_subst ' +
         '    from vendedores v ' +
         '    inner join clientes c on (c.vendedor_sq=v.vendedor_sq) ' +
         '    inner join nfiscais n on (n.cliente_sq=c.cliente_sq and n.vendedor_sq<>v.vendedor_sq and cancelada <> ''S'' and concluida = ''S'') ' +
         '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq) ' +
         '  union ' +
         '    select _latin1 ''P'' as origem, _latin1 ''R'' as base, v.vendedor_sq, d.numero_duplicata, dp.dt_pgto, dp.valor_pgto, n.cliente_sq, n.vlr_icms_subst ' +
         '    from vendedores v ' +
         '    inner join nfiscais n on (n.vendedor_sq=v.vendedor_sq and cancelada <> ''S'' and concluida = ''S'') ' +
         '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq) ' +
         '    inner join duplicatas_pgto dp on (dp.duplicata_sq=d.duplicata_sq) ' +
         '  union ' +
         '    select _latin1 ''T'' as origem, _latin1 ''R'' as base, v.vendedor_sq, d.numero_duplicata, dp.dt_pgto, dp.valor_pgto, c.cliente_sq, n.vlr_icms_subst ' +
         '    from vendedores v ' +
         '    inner join clientes c on (c.vendedor_sq=v.vendedor_sq) ' +
         '    inner join nfiscais n on (n.cliente_sq=c.cliente_sq and n.vendedor_sq<>v.vendedor_sq and cancelada <> ''S'' and concluida = ''S'') ' +
         '    inner join duplicatas d on (d.nfiscal_sq=n.nfiscal_sq) ' +
         '    inner join duplicatas_pgto dp on (dp.duplicata_sq=d.duplicata_sq) ' +
         ') n on (n.vendedor_sq=v.vendedor_sq and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) +
         ' and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) + ') ' +
         'inner join clientes c on (c.cliente_sq = n.cliente_sq) ' +
         'where n.base=case when ((c.base_comissao is null) or (c.base_comissao = '' '')) then v.base_comissao else c.base_comissao end ';

  if (vendedor_sq <> null) then
    sql := sql + ' and v.vendedor_sq = ' + IntToStr(vendedor_sq);

  result := listaPersonalizada(sql);
end;

class function TNfiscal.listaVendasVendedor(dtInicio, dtTermino: TDateTime; produto_sq,
      vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet;
var
  sql: String;
begin
  sql := 'select nome_vendedor, sum(n.vlr_total) as total ' +
    'from nfiscais n ' +
    'left outer join clientes c on (c.cliente_sq=n.cliente_sq) ' +
    'left outer join naturezas na on (na.natureza_sq = n.natureza_sq) ' +
    'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq) ';

  if (produto_sq <> null) then
  begin
    sql := sql + 'inner join (select nfiscal_sq, sum(vlr_total_item) vlr_total_item, sum(qtde_item) qtde_item from nfiscais_itens ni ' +
      'where ni.produto_sq = ' + VarToStr(produto_sq) +
      ' group by nfiscal_sq) it on (it.nfiscal_sq=n.nfiscal_sq) ';
  end;

  sql := sql +
    'where na.tipo_nfiscal = 0 and n.cancelada <> ''S'' '+
    'and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) + ' '+
    'and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) + ' ';
    if (vendedor_sq <> null) then
      sql := sql + ' and n.vendedor_sq = ' + VarToStr(vendedor_sq);
    if (codigo_cliente <> '') then
      sql := sql + ' and ((codigo_cliente like ''%' + VarToStr(codigo_cliente) + '%'') or (nome_cliente like ''%' + VarToStr(codigo_cliente) + '%''))';
    if (estado <> null) then
      sql := sql + ' and c.estado = ' + QuotedStr(VarToStr(estado));

  sql := sql + ' group by nome_vendedor ' +
    'order by total';

  result := listaPersonalizada(sql);
end;

class function TNfiscal.listaVendasProduto(dtInicio, dtTermino: TDateTime; produto_sq,
      vendedor_sq, codigo_cliente, estado: Variant): TClientDataSet;
var
  sql: String;
begin
  sql := 'select descricao_produto, sum(ni.qtde_item) as total ' +
    'from nfiscais_itens ni ' +
    'left outer join nfiscais n on (n.nfiscal_sq = ni.nfiscal_sq) ' +
    'left outer join naturezas na on (na.natureza_sq = n.natureza_sq) ' +
    'left outer join vendedores v on (v.vendedor_sq = n.vendedor_sq) ' +
    'left outer join produtos p on (p.produto_sq = ni.produto_sq) ' +
    'left outer join clientes c on (c.cliente_sq=n.cliente_sq) ';

  sql := sql +
    'where na.tipo_nfiscal = 0 and n.cancelada <> ''S'' '+
    'and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) + ' '+
    'and date(date_format(dtemissao_nfiscal, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) + ' ';

  if (produto_sq <> null) then
    sql := sql + ' and ni.produto_sq = ' + VarToStr(produto_sq);
  if (vendedor_sq <> null) then
    sql := sql + ' and n.vendedor_sq = ' + VarToStr(vendedor_sq);
  if (codigo_cliente <> '') then
    sql := sql + ' and ((codigo_cliente like ''%' + VarToStr(codigo_cliente) + '%'') or (nome_cliente like ''%' + VarToStr(codigo_cliente) + '%''))';
  if (estado <> null) then
    sql := sql + ' and c.estado = ' + QuotedStr(VarToStr(estado));

  sql := sql + ' group by descricao_produto ' +
    'order by total';

  result := listaPersonalizada(sql);
end;

class function TNfiscal.listaFechamentoNota(dtInicio, dtTermino: TDateTime): TClientDataSet;
begin
  result := listaPersonalizada('select nf.dtemissao_nfiscal, nf.numero_nfiscal, na.cfo, na.descricao_natureza_nfiscal, ' +
    ' nf.vlr_produtos, nf.vlr_total, nf.vlr_icms, nf.vlr_ipi, c.nome_cliente, na.ent_sai, ' +
    ' na.tipo_nfiscal, nf.cancelada, nf.linha_sq, nf.vlr_icms_subst, nf.numero_nfe ' +
    ' from nfiscais NF ' +
    ' left outer join naturezas NA on (NA.natureza_sq = NF.natureza_sq) ' +
    ' left outer join clientes C on (C.cliente_sq = NF.cliente_sq) ' +
    ' where date(date_format(NF.dtemissao_nfiscal, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) +
    ' and date(date_format(NF.dtemissao_nfiscal, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) +
    ' order by NF.numero_nfiscal');
end;

class function TNfiscal.listaFechamentoNotaCliente(dtInicio,
  dtTermino: TDateTime): TClientDataSet;
begin
  result := listaPersonalizada('(SELECT NF.DT_NFISCAL_RETORNO as DTEMISSAO, NF.NR_NFISCAL_RETORNO as NFISCAL, ' +
      ' NA.CFO, NA.DESCRICAO_NATUREZA_NFISCAL, NF.VLR_PRODUTOS, NF.VLR_TOTAL, NF.VLR_ICMS, NF.VLR_IPI, C.NOME_CLIENTE, ' +
      ' NA.ENT_SAI, NA.TIPO_NFISCAL, NF.CANCELADA ' +
      ' FROM nfiscais NF ' +
      ' LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = NF.NATUREZA_RET_DEM) ' +
      ' LEFT OUTER JOIN clientes  C  ON (C.CLIENTE_SQ = NF.CLIENTE_SQ) ' +
      ' WHERE NF.NR_NFISCAL_RETORNO <> '''' AND ' +
      '       (SELECT N2.NUMERO_NFISCAL ' +
      '        FROM nfiscais N2 ' +
      '        WHERE NF.NR_NFISCAL_RETORNO=N2.NUMERO_NFISCAL AND ' +
      '              NF.DT_NFISCAL_RETORNO=N2.DTEMISSAO_NFISCAL) IS NULL ' +
      ' AND date(date_format(NF.DT_NFISCAL_RETORNO, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) +
      ' AND date(date_format(NF.DT_NFISCAL_RETORNO, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) +
      ' ORDER BY NF.NUMERO_NFISCAL) ' +
      ' UNION ' +
      ' (SELECT NFE.DTEMISSAO_NF_ENT as DTEMISSAO, NUMERO_NF_ENT, ' +
      ' NA.CFO, NA.DESCRICAO_NATUREZA_NFISCAL, VLR_PRODUTOS, VLR_TOTAL, VLR_ICMS, VLR_IPI, C.NOME_CLIENTE, ' +
      ' NA.ENT_SAI, NA.TIPO_NFISCAL, "N" ' +
      ' FROM nf_entradas NFE ' +
      ' LEFT OUTER JOIN clientes  C  ON (C.CLIENTE_SQ = NFE.CLIENTE_SQ) ' +
      ' LEFT OUTER JOIN naturezas NA ON (NA.NATUREZA_SQ = NFE.NATUREZA_SQ) ' +
      ' WHERE date(date_format(NFE.DTEMISSAO_NF_ENT, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) +
      ' AND date(date_format(NFE.DTEMISSAO_NF_ENT, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) +
      ' ORDER BY NFE.NUMERO_NF_ENT)');
end;

class function TNfiscal.listaFechamentoNotaServico(dtInicio,
  dtTermino: TDateTime): TClientDataSet;
begin
  result := listaPersonalizada('SELECT NF.*, C.NOME_CLIENTE ' +
    ' FROM nf_servicos NF ' +
    ' LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ) ' +
    ' WHERE date(date_format(NF.DATA_NF_SERVICO, ''%Y-%m-%d'')) >= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtInicio)) +
    ' AND date(date_format(NF.DATA_NF_SERVICO, ''%Y-%m-%d'')) <= ' + QuotedStr(FormatDateTime('yyyy-mm-dd', dtTermino)) +
    ' ORDER BY NF.NUMERO_NF_SERVICO');
end;

{ TNfiscalItem }

constructor TNfiscalItem.Create;
begin
  setTabela('nfiscais_itens');
  listaAdicao := TList.Create;
  listaSerie := TList.Create;
end;

constructor TNfiscalItem.Create(indice: Variant);
begin
  inherited;

  With cdsListaAdicao do
  begin
    First;
    While not Eof do
    begin
      listaAdicao.Add(TNfiscalItemAdicao.Create(FieldByName('nfiscal_item_adicao_sq').Value));
      Next;
    end;
    Free;
  end;

  if (existeSerie) then
  begin
    With cdsListaSerie do
    begin
      First;
      While not Eof do
      begin
        listaSerie.Add(TNfiscalItemSerie.Create(FieldByName('nfiscal_item_serie_sq').Value));
        Next;
      end;
      Free;
    end;
  end;
end;

function TNfiscalItem.cdsListaAdicao: TClientDataSet;
var
  sql: String;
begin
  sql := 'select * from nfiscais_itens_adicao' +
    ' where nfiscal_item_sq = ' + VarToStr(vIndice);
  result := listaPersonalizada(sql);
end;

procedure TNfiscalItem.salvar;
var
  i: Integer;
  apagar: Boolean;
begin
  inherited;

  for i := 0 to listaAdicao.Count - 1 do
  begin
    TNfiscalItemAdicao(listaAdicao.Items[i]).nfiscal_item_sq := vIndice;
    TNfiscalItemAdicao(listaAdicao.Items[i]).salvar;
  end;

  for i := 0 to listaSerie.Count - 1 do
  begin
    TNfiscalItemSerie(listaSerie.Items[i]).nfiscal_item_sq := vIndice;
    TNfiscalItemSerie(listaSerie.Items[i]).salvar;
  end;

  With cdsListaAdicao do
  begin
    First;
    While not Eof do
    begin
      apagar := true;
      for i := 0 to listaAdicao.Count - 1 do
        if TNfiscalItemAdicao(listaAdicao.Items[i]).vIndice = FieldByName('nfiscal_item_adicao_sq').Value then
          apagar := false;
      if apagar then
        TNfiscalItemAdicao.Create(FieldByName('nfiscal_item_adicao_sq').Value).excluirRegistro(false);

      Next;
    end;
  end;

  if (existeSerie) then
  begin
    With cdsListaSerie do
    begin
      First;
      While not Eof do
      begin
        apagar := true;
        for i := 0 to listaSerie.Count - 1 do
          if TNfiscalItemSerie(listaSerie.Items[i]).vIndice = FieldByName('nfiscal_item_serie_sq').Value then
            apagar := false;
        if apagar then
          TNfiscalItemSerie.Create(FieldByName('nfiscal_item_serie_sq').Value).excluirRegistro(false);

        Next;
      end;
    end;
  end;
end;

destructor TNfiscalItem.Destroy;
var
  i: Integer;
  obj: TCadastro;
begin
  FreeAndNil(_produto_sq);
  FreeAndNil(_data_di);
  FreeAndNil(_data_desemb);

  if (listaAdicao <> nil) then
  for i := 0 to listaAdicao.Count - 1 do
  begin
      obj := TNfiscalItemAdicao(listaAdicao.Items[i]);
      FreeAndNil(obj);
  end;
  FreeAndNil(listaAdicao);

  if (listaSerie <> nil) then
  for i := 0 to listaSerie.Count - 1 do
  begin
      obj := TNfiscalItemSerie(listaSerie.Items[i]);
      FreeAndNil(obj);
  end;
  FreeAndNil(listaSerie);

  inherited;
end;

function TNfiscalItem.existeSerie: Boolean;
var
  cds: TClientDataSet;
begin
  cds := listaPersonalizada('show tables like ''nfiscais_itens_serie''');
  result := cds.RecordCount > 0;
  cds.Free;
end;

function TNfiscalItem.cdsListaSerie: TClientDataSet;
var
  sql: String;
begin
  sql := 'select * from nfiscais_itens_serie' +
    ' where nfiscal_item_sq = ' + VarToStr(vIndice);
  result := listaPersonalizada(sql);
end;

procedure TNfiscalItem.copiaItemPedido(nfiscal: TNfiscal; pedido: TPedido; itemPedido: TPedidoItem);
var
  cdsItensFaturados: TClientDataSet;
  i, qtdeItem: Integer;
  itemSerie: TNfiscalItemSerie;
begin
  cdsItensFaturados := itemPedido.ItensFaturados;

  qtdeItem   := itemPedido.qtde_pedido_item - cdsItensFaturados.FieldByName('qtde_faturado').AsInteger;

  if (qtdeItem > 0) then
  begin
    if (nfiscal.vIndice <> Null) then
      nfiscal_sq        := nfiscal.vIndice;
    item                := nfiscal.BuscaProximoItem;
    produto_sq          := TProduto.Create(itemPedido.produto_sq.vIndice);
    qtde_item           := qtdeItem;
    vlr_unit_item       := itemPedido.preco_unit + itemPedido.vlr_juros - itemPedido.vlr_desc;
    stribut             := empresaSelecionada.stribut;
    aliq_icms_item      := itemPedido.aliq_icms_item;
    aliq_ipi_item       := itemPedido.aliq_ipi_item;
    if cdsItensFaturados.FieldByName('qtde_faturado').AsInteger > 0 then
    begin
      vlr_icms_item     := itemPedido.vlr_icms_item;
      vlr_ipi_item      := itemPedido.vlr_ipi_item;
      vlr_total_item    := itemPedido.vlr_total_item;
    end;
    nr_serie_item       := itemPedido.nr_serie_item;
    peso_bruto          := itemPedido.peso_bruto;
    peso_liquido        := itemPedido.peso_liquido;

    origem_mercadoria   := itemPedido.produto_sq.origem_mercadoria;

    if (item = 1) then
    begin
      vlr_frete_item    := pedido.vlr_frete;
      vlr_seguro_item   := pedido.vlr_seguro;
    end;

    numero_estoque := itemPedido.numero_estoque;
    for i := 0 to itemPedido.listaSerie.Count -1 do
    begin
      itemSerie := TNfiscalItemSerie.Create;
      itemSerie.produto_numero_serie_sq := TProdutoNumeroSerie.Create(TPedidoItemSerie(itemPedido.listaSerie.Items[i]).produto_numero_serie_sq.vIndice);
      listaSerie.Add(itemSerie);
    end;
  end;
end;

{ TNfiscalItemAdicao }

constructor TNfiscalItemAdicao.Create;
begin
  setTabela('nfiscais_itens_adicao');
end;

{ TNfiscalItemSerie }

constructor TNfiscalItemSerie.Create;
begin
  setTabela('nfiscais_itens_serie');
end;

end.
