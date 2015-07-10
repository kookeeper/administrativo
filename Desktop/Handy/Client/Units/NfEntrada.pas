unit NfEntrada;

interface

uses Classes, Cadastro, Cliente, Natureza, Produto, DBClient, SysUtils,
  Variants, Empresa;

type
  TNfEntrada = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _numero_nf_ent     : Integer   ;
    _dtemissao_nf_ent  : TDateTime ;
    _cliente_sq        : TCliente  ;
    _natureza_sq       : TNatureza ;
    _base_icms         : Double    ;
    _vlr_icms          : Double    ;
    _base_icms_subst   : Double    ;
    _vlr_icms_subst    : Double    ;
    _vlr_produtos      : Double    ;
    _vlr_frete         : Double    ;
    _vlr_seguro        : Double    ;
    _vlr_desp_acess    : Double    ;
    _vlr_ipi           : Double    ;
    _vlr_total         : Double    ;
    _observacao        : String    ;
    _transferida       : String    ;
    _dt_entrada        : Variant   ;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property numero_nf_ent    : Integer   read _numero_nf_ent    write _numero_nf_ent   ;
    property dtemissao_nf_ent : TDateTime read _dtemissao_nf_ent write _dtemissao_nf_ent;
    property cliente_sq       : TCliente  read _cliente_sq       write _cliente_sq      ;
    property natureza_sq      : TNatureza read _natureza_sq      write _natureza_sq     ;
    property base_icms        : Double    read _base_icms        write _base_icms       ;
    property vlr_icms         : Double    read _vlr_icms         write _vlr_icms        ;
    property base_icms_subst  : Double    read _base_icms_subst  write _base_icms_subst ;
    property vlr_icms_subst   : Double    read _vlr_icms_subst   write _vlr_icms_subst  ;
    property vlr_produtos     : Double    read _vlr_produtos     write _vlr_produtos    ;
    property vlr_frete        : Double    read _vlr_frete        write _vlr_frete       ;
    property vlr_seguro       : Double    read _vlr_seguro       write _vlr_seguro      ;
    property vlr_desp_acess   : Double    read _vlr_desp_acess   write _vlr_desp_acess  ;
    property vlr_ipi          : Double    read _vlr_ipi          write _vlr_ipi         ;
    property vlr_total        : Double    read _vlr_total        write _vlr_total       ;
    property observacao       : String    read _observacao       write _observacao      ;
    property transferida      : String    read _transferida      write _transferida     ;
    property dt_entrada       : Variant   read _dt_entrada       write _dt_entrada      ;
  public
    constructor Create; override;
    destructor Destroy; override;
    procedure entradaEstoque();
    procedure cancelaEntrada();
    function listaItens(): TClientDataSet;
  end;

type
  TNfEntradaItem = class(TCadastro)
  private
    _nf_entrada_sq : TNfEntrada;
    _item          : Integer   ;
    _produto_sq    : TProduto  ;
    _nr_serie_item : String    ;
    _qtde_item     : Integer   ;
    _vlr_unit_item : Double    ;
    _vlr_total_item: Double    ;
    _aliq_icms_item: Double    ;
    _aliq_ipi_item : Double    ;
    _vlr_icms_item : Double    ;
    _vlr_ipi_item  : Double    ;
    _numero_estoque: Integer   ;
  published
    property nf_entrada_sq : TNfEntrada read _nf_entrada_sq  write _nf_entrada_sq ;
    property item          : Integer    read _item           write _item          ;
    property produto_sq    : TProduto   read _produto_sq     write _produto_sq    ;
    property nr_serie_item : String     read _nr_serie_item  write _nr_serie_item ;
    property qtde_item     : Integer    read _qtde_item      write _qtde_item     ;
    property vlr_unit_item : Double     read _vlr_unit_item  write _vlr_unit_item ;
    property vlr_total_item: Double     read _vlr_total_item write _vlr_total_item;
    property aliq_icms_item: Double     read _aliq_icms_item write _aliq_icms_item;
    property aliq_ipi_item : Double     read _aliq_ipi_item  write _aliq_ipi_item ;
    property vlr_icms_item : Double     read _vlr_icms_item  write _vlr_icms_item ;
    property vlr_ipi_item  : Double     read _vlr_ipi_item   write _vlr_ipi_item  ;
    property numero_estoque: Integer    read _numero_estoque write _numero_estoque;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

uses Kardex, Usuario, UDM;

{ TNfEntrada }

procedure TNfEntrada.cancelaEntrada;
var
  cds1, cds2, cds3: TClientDataSet;
  nfItem: TNfEntradaItem;
  listaNumeroSerie: TStringList;
  i: Integer;
begin
  cds1 := listaRegistros(' where nf_entrada_sq = ' + VarToStr(vIndice));

  if cds1.RecordCount = 0 then
    raise Exception.Create('Nota fiscal não encontrada!');

  cds2 := TNfEntradaItem.listaRegistros(' where nf_entrada_sq = ' + VarToStr(vIndice));

  While not cds2.Eof do
  begin
    nfItem := TNfEntradaItem.Create(cds2.FieldByName('nf_entrada_item_sq').Value);

    cds3 := TKardex.listaRegistros(' where produto_sq = ' + VarToStr(nfItem.produto_sq.vIndice) +
      ' and tipo_mov = ''E'' and nfiscal = ' + IntToStr(numero_nf_ent) + ' and data = ' + QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', dt_entrada)));
    cds3.Last;
    if cds3.RecordCount = 0 then
    begin
      cds2.Next;
      continue;
    end;

    if (nfItem.produto_sq.controle_numero_serie = 0) then
    begin
      with TKardex.Create do
      begin
        produto_sq := nfItem.produto_sq;
        tipo_mov   := 'E';
        qtde       := nfItem.qtde_item * -1;
        numero_estoque := nFitem.numero_estoque;
        valor      := nfItem.vlr_total_item;
        data       := Date + Time;
        nfiscal    := numero_nf_ent;
        usuario_sq := TUsuario.Create(DM.useq);
        nr_serie   := nfItem.nr_serie_item;
        salvar;
      end;
    end
    else
    begin
      listaNumeroSerie := TStringList.Create;
      Split(',', nfItem.nr_serie_item, listaNumeroSerie);

      for i := 0 to listaNumeroSerie.Count - 1 do
      begin
        with TKardex.Create do
        begin
          produto_sq := nfItem.produto_sq;
          tipo_mov   := 'E';
          qtde       := -1;
          numero_estoque := nfItem.numero_estoque;
          valor      := nfItem.vlr_total_item/nfItem.qtde_item;
          data       := Date + Time;
          nfiscal    := numero_nf_ent;
          usuario_sq := TUsuario.Create(DM.useq);
          nr_serie   := nfItem.nr_serie_item;
          salvar;
        end;
        TProdutoNumeroSerie.CreateSerie(listaNumeroSerie.Strings[i]).excluirRegistro(false);
      end;
    end;
    cds2.Next;
  end;

  transferida := 'N';
  dt_entrada  := null;
  salvar;
end;

constructor TNfEntrada.Create;
begin
  setTabela('nf_entradas');
  setLista('"Número=NUMERO_NF_ENT","Data Emissão=DTEMISSAO_NF_ENT","Data de entrada=DT_ENTRADA",' +
    '"Cliente=NOME_CLIENTE","Valor N.Fiscal=VLR_TOTAL"');
  sqlLista := 'select ne.*, c.nome_cliente ' +
         'from nf_entradas ne ' +
         'left join clientes c on (c.cliente_sq = ne.cliente_sq) ';
end;

destructor TNfEntrada.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_cliente_sq);
  FreeAndNil(_natureza_sq);

  inherited;
end;

procedure TNfEntrada.entradaEstoque;
var
  cds1, cds2: TClientDataSet;
  item: TNfEntradaItem;
  entrada: TDateTime;
  listaNumeroSerie: TStringList;
  i: Integer;
begin
  entrada := Date + Time;
  cds1 := TNfEntradaItem.listaRegistros('where nf_entrada_sq = ' + VarToStr(vIndice));
  if natureza_sq.ent_sai <> 'E' then
    raise Exception.Create('A natureza da nota fiscal não é de entrada. Impossível transferir a nota.');

  while not cds1.Eof do
  begin
    item := TNfEntradaItem.Create(cds1.FieldByName('nf_entrada_item_sq').Value);

    if (item.produto_sq.controle_numero_serie = 0) then
    begin
      cds2 := TKardex.listaRegistros('where produto_sq = ' + VarToStr(item.produto_sq.vIndice) +
        ' and tipo_mov = ''E'' and nfiscal = ' + IntToStr(numero_nf_ent) +
        ' and data = ' + FormatDateTime  ('yyyy-mm-dd', Date));

      if cds2.RecordCount = 0 then
      with TKardex.Create do
      begin
        produto_sq := item.produto_sq;
        tipo_mov   := 'E';
        qtde       := item.qtde_item;
        numero_estoque := item.numero_estoque;
        valor      := item.vlr_total_item;
        data       := entrada;
        nfiscal    := numero_nf_ent;
        usuario_sq := TUsuario.Create(DM.useq);
        nr_serie   := item.nr_serie_item;
        salvar;
      end;
    end
    else
    begin
      listaNumeroSerie := TStringList.Create;
      Split(',', item.nr_serie_item, listaNumeroSerie);

      for i := 0 to listaNumeroSerie.Count - 1 do
      begin
        TProdutoNumeroSerie.entrada(
          item.produto_sq,
          listaNumeroSerie.Strings[i],
          item.numero_estoque,
          item.vlr_total_item/item.qtde_item,
          entrada,
          numero_nf_ent);
      end;
    end;
    cds1.Next;
  end;

  transferida := 'S';
  dt_entrada := entrada;
  salvar;
end;

function TNfEntrada.listaItens: TClientDataSet;
var
  sql: String;
begin
  sql := 'SELECT NEI.*, CODIGO_PRODUTO, DESCRICAO_PRODUTO, qtde_estoque1, qtde_estoque2,' +
    ' qtde_estoque3, qtde_estoque4, qtde_estoque5, qtde_estoque6, qtde_estoque7,' +
    ' qtde_estoque8, qtde_estoque9, qtde_estoque10, CODIGO_NBM' +
    ' FROM nf_entradas_itens NEI' +
    ' LEFT OUTER JOIN produtos P ON (P.PRODUTO_SQ = NEI.PRODUTO_SQ)' +
    ' LEFT OUTER JOIN nbm N ON (N.NBM_SQ = P.NBM_SQ)' +
    ' WHERE NEI.NF_ENTRADA_SQ = ' + VarToStr(vIndice);
  result := listaPersonalizada(sql);
end;

{ TNfEntradaItem }

constructor TNfEntradaItem.Create;
begin
  setTabela('nf_entradas_itens');
end;

destructor TNfEntradaItem.Destroy;
begin
  FreeAndNil(_nf_entrada_sq);
  FreeAndNil(_produto_sq);

  inherited;
end;

end.
