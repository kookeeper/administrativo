unit Produto;

interface

uses Variants, SysUtils, Classes, Cadastro, UDM, DB, NCM, Modelo,
  Empresa, DBClient, ExtCtrls;

type
  TProduto = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_produto: String;
    _descricao_produto: String;
    _nbm_sq: TNCM;
    _un_produto: String;
    _marca_produto: String;
    _preco_unit: Double;
    _tipo_produto: Integer;
    _modelo_sq: TModelo;
    _qtde_estoque1: Integer;
    _qtde_estoque2: Integer;
    _qtde_estoque3: Integer;
    _qtde_estoque4: Integer;
    _qtde_estoque5: Integer;
    _qtde_estoque6: Integer;
    _qtde_estoque7: Integer;
    _qtde_estoque8: Integer;
    _qtde_estoque9: Integer;
    _qtde_estoque10: Integer;
    _peso_bruto: Double;
    _peso_liquido: Double;
    _origem_mercadoria: Integer;
    _descricao_completa: String;
    _codigo_upc: String;
    _codigo_dun: String;
    _largura_liquida: Double;
    _altura_liquida: Double;
    _profundidade_liquida: Double;
    _largura_bruta: Double;
    _altura_bruta: Double;
    _profundidade_bruta: Double;
    _controle_numero_serie: Integer;
    _mascara_numero_serie: String;
    _produto_ativo: String;
    _produto_sq_retorno: Variant;
    _grupo_balanco: Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_produto       : String  read _codigo_produto        write _codigo_produto        ;
    property descricao_produto    : String  read _descricao_produto     write _descricao_produto     ;
    property nbm_sq               : TNCM    read _nbm_sq                write _nbm_sq                ;
    property un_produto           : String  read _un_produto            write _un_produto            ;
    property marca_produto        : String  read _marca_produto         write _marca_produto         ;
    property preco_unit           : Double  read _preco_unit            write _preco_unit            ;
    property tipo_produto         : Integer read _tipo_produto          write _tipo_produto          ;
    property modelo_sq            : TModelo read _modelo_sq             write _modelo_sq             ;
    property qtde_estoque1        : Integer read _qtde_estoque1         write _qtde_estoque1         ;
    property qtde_estoque2        : Integer read _qtde_estoque2         write _qtde_estoque2         ;
    property qtde_estoque3        : Integer read _qtde_estoque3         write _qtde_estoque3         ;
    property qtde_estoque4        : Integer read _qtde_estoque4         write _qtde_estoque4         ;
    property qtde_estoque5        : Integer read _qtde_estoque5         write _qtde_estoque5         ;
    property qtde_estoque6        : Integer read _qtde_estoque6         write _qtde_estoque6         ;
    property qtde_estoque7        : Integer read _qtde_estoque7         write _qtde_estoque7         ;
    property qtde_estoque8        : Integer read _qtde_estoque8         write _qtde_estoque8         ;
    property qtde_estoque9        : Integer read _qtde_estoque9         write _qtde_estoque9         ;
    property qtde_estoque10       : Integer read _qtde_estoque10        write _qtde_estoque10        ;
    property peso_bruto           : Double  read _peso_bruto            write _peso_bruto            ;
    property peso_liquido         : Double  read _peso_liquido          write _peso_liquido          ;
    property origem_mercadoria    : Integer read _origem_mercadoria     write _origem_mercadoria     ;
    property descricao_completa   : String  read _descricao_completa    write _descricao_completa    ;
    property codigo_upc           : String  read _codigo_upc            write _codigo_upc            ;
    property codigo_dun           : String  read _codigo_dun            write _codigo_dun            ;
    property largura_liquida      : Double  read _largura_liquida       write _largura_liquida       ;
    property altura_liquida       : Double  read _altura_liquida        write _altura_liquida        ;
    property profundidade_liquida : Double  read _profundidade_liquida  write _profundidade_liquida  ;
    property largura_bruta        : Double  read _largura_bruta         write _largura_bruta         ;
    property altura_bruta         : Double  read _altura_bruta          write _altura_bruta          ;
    property profundidade_bruta   : Double  read _profundidade_bruta    write _profundidade_bruta    ;
    property controle_numero_serie: Integer read _controle_numero_serie write _controle_numero_serie ;
    property mascara_numero_serie : String  read _mascara_numero_serie  write _mascara_numero_serie  ;
    property produto_ativo        : String  read _produto_ativo         write _produto_ativo         ;
    property produto_sq_retorno   : Variant read _produto_sq_retorno    write _produto_sq_retorno    ;
    property grupo_balanco        : Integer read _grupo_balanco         write _grupo_balanco         ;
  public
    constructor Create; override;
    destructor Destroy; override;
    function possuiNumeroSerie: Boolean;
    function listaEstoques: TStrings;
    function listaNumeroSerie(numeroEstoque: Integer): TStrings; overload;
    function listaNumeroSerie(numeroEstoque: Integer; filtro: String; emEstoque: Boolean): TStrings; overload;
    class function listaProdutoAtivo(complemento: String=''): TClientDataSet;
    class function listarDescricao(complemento: String): TClientDataSet;
    class function buscaPorCodigo(codigo: String): TProduto;
    procedure atualizaEstoque();
    class function recuperarImagem(indice: Integer; codigo: String): TStream;
    class function buscarImagemProduto(indice: Variant): TClientDataSet;
    class function listarEstoque(tipo_produto: Integer; ordem: String): TClientDataSet;
    class function listaSugestaoCompra(tipo_produto, qtdeMeses: Integer; IntervaloCompra: Double): TClientDataSet;
    class function listaProdutoSemImagem(): TClientDataSet;
    class procedure CarregarImagem(produto_sq: Integer; codigo_produto:String);
  end;

type
  TProdutoNumeroSerie = class(TCadastro)
  private
    _produto_sq         : TProduto;
    _numero_estoque     : Integer;
    _numero_serie       : String;
    _data_ultima_entrada: TDateTime;
    _data_ultima_saida  : TDateTime;
    _numero_nf_ent      : Variant;
  published
    property produto_sq         : TProduto  read _produto_sq          write _produto_sq;
    property numero_estoque     : Integer   read _numero_estoque      write _numero_estoque;
    property numero_serie       : String    read _numero_serie        write _numero_serie       ;
    property data_ultima_entrada: TDateTime read _data_ultima_entrada write _data_ultima_entrada;
    property data_ultima_saida  : TDateTime read _data_ultima_saida   write _data_ultima_saida  ;
    property numero_nf_ent      : Variant   read _numero_nf_ent       write _numero_nf_ent;
  public
    constructor Create; override;
    constructor CreateSerie(numeroSerie: String);
    destructor Destroy; override;
    class function listaEstoque(): TClientDataSet; overload;
    class function listaEstoque(produto_sq: Integer): TClientDataSet; overload;
    class function listaEstoque(produto_sq, numeroEstoque: Integer): TClientDataSet; overload;
    class function listaEstoque(produto_sq, numeroEstoque: Integer;
      numeroSerie: String; emEstoque: Boolean): TClientDataSet; overload;
    class procedure entrada(produto: TProduto; numeroSerie: String;
      numeroEstoque: Integer; valorEntrada: Double; entrada: TDateTime;
      numero_nf_ent: Variant);
    class procedure saida(numeroSerie: String;
      valorSaida: Double; numeroNfiscal: Integer; saida: TDateTime);
    class function pesquisaNumeroSerie(numeroSerie: String): TProdutoNumeroSerie;
  end;

implementation

uses Math, Kardex, Usuario, NfEntrada, DBCtrls, Graphics, UrlMon, Util, ClipBrd, Jpeg;

{ TProduto }

procedure TProduto.atualizaEstoque;
begin
  if (controle_numero_serie = 1) then
  begin
    qtde_estoque1 := TProdutoNumeroSerie.listaEstoque(vIndice,  1).RecordCount;
    qtde_estoque2  := TProdutoNumeroSerie.listaEstoque(vIndice, 2).RecordCount;
    qtde_estoque3  := TProdutoNumeroSerie.listaEstoque(vIndice, 3).RecordCount;
    qtde_estoque4  := TProdutoNumeroSerie.listaEstoque(vIndice, 4).RecordCount;
    qtde_estoque5  := TProdutoNumeroSerie.listaEstoque(vIndice, 5).RecordCount;
    qtde_estoque6  := TProdutoNumeroSerie.listaEstoque(vIndice, 6).RecordCount;
    qtde_estoque7  := TProdutoNumeroSerie.listaEstoque(vIndice, 7).RecordCount;
    qtde_estoque8  := TProdutoNumeroSerie.listaEstoque(vIndice, 8).RecordCount;
    qtde_estoque9  := TProdutoNumeroSerie.listaEstoque(vIndice, 9).RecordCount;
    qtde_estoque10 := TProdutoNumeroSerie.listaEstoque(vIndice, 10).RecordCount;
    salvar;
  end;
end;

class function TProduto.buscaPorCodigo(codigo: String): TProduto;
begin
  With (listaPersonalizada('select produto_sq from produtos where codigo_produto = ' + QuotedStr(codigo))) do
  begin
    if (RecordCount = 0) then
      raise Exception.Create('Não foi possível encontrar o produto com o código ' + QuotedStr(codigo));
    result := TProduto.Create(FieldByName('produto_sq').Value);
  end;
end;

constructor TProduto.Create;
begin
  setTabela('produtos');
  setLista('Código=CODIGO_PRODUTO,Descrição=DESCRICAO_PRODUTO,Modelo=DESCRICAO_MODELO,"Possui Imagem=POSSUI_IMAGEM","Grupo do balanço=GRUPO_BALANCO",' +
    '"' + empresaSelecionada.descricao_estoque1 + '=qtde_estoque1",' +
    '"' + empresaSelecionada.descricao_estoque2 + '=qtde_estoque2",' +
    '"' + empresaSelecionada.descricao_estoque3 + '=qtde_estoque3",' +
    '"' + empresaSelecionada.descricao_estoque4 + '=qtde_estoque4",' +
    '"' + empresaSelecionada.descricao_estoque5 + '=qtde_estoque5",' +
    '"' + empresaSelecionada.descricao_estoque6 + '=qtde_estoque6",' +
    '"' + empresaSelecionada.descricao_estoque7 + '=qtde_estoque7",' +
    '"' + empresaSelecionada.descricao_estoque8 + '=qtde_estoque8",' +
    '"' + empresaSelecionada.descricao_estoque9 + '=qtde_estoque9",' +
    '"' + empresaSelecionada.descricao_estoque10 + '=qtde_estoque10"');
  sqlLista := 'select p.*, descricao_modelo, codigo_nbm, aliq_icms, aliq_ipi, aliq_iva, l.exclusiva, if (pi.produto_sq is null, ''Não'', ''Sim'') as possui_imagem ' +
    'from produtos p ' +
    'left outer join nbm n on (n.nbm_sq = p.nbm_sq) ' +
    'left outer join modelos m on (m.modelo_sq = p.modelo_sq) ' +
    'left outer join linha l on (l.linha_sq = p.linha_sq) ' +
    'left outer join produto_imagem pi on (pi.produto_sq=p.produto_sq)';
end;

destructor TProduto.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_nbm_sq);
  FreeAndNil(_modelo_sq);

  inherited;
end;

function TProduto.listaEstoques: TStrings;
var
  lista: TStrings;
begin
  lista := TStringList.Create;

  if (empresaSelecionada.descricao_estoque1 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque1 + ' - ' + IntToStr(qtde_estoque1), TObject(1));

  if (empresaSelecionada.descricao_estoque2 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque2 + ' - ' + IntToStr(qtde_estoque2), TObject(2));

  if (empresaSelecionada.descricao_estoque3 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque3 + ' - ' + IntToStr(qtde_estoque3), TObject(3));

  if (empresaSelecionada.descricao_estoque4 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque4 + ' - ' + IntToStr(qtde_estoque4), TObject(4));

  if (empresaSelecionada.descricao_estoque5 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque5 + ' - ' + IntToStr(qtde_estoque5), TObject(5));

  if (empresaSelecionada.descricao_estoque6 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque6 + ' - ' + IntToStr(qtde_estoque6), TObject(6));

  if (empresaSelecionada.descricao_estoque7 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque7 + ' - ' + IntToStr(qtde_estoque7), TObject(7));

  if (empresaSelecionada.descricao_estoque8 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque8 + ' - ' + IntToStr(qtde_estoque8), TObject(8));

  if (empresaSelecionada.descricao_estoque9 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque9 + ' - ' + IntToStr(qtde_estoque9), TObject(9));

  if (empresaSelecionada.descricao_estoque10 <> '') then
    lista.AddObject(empresaSelecionada.descricao_estoque10 + ' - ' + IntToStr(qtde_estoque10), TObject(10));

  result := lista;
end;

function TProduto.listaNumeroSerie(numeroEstoque: Integer): TStrings;
begin
  result := listaNumeroSerie(numeroEstoque, '', True);
end;

function TProduto.listaNumeroSerie(numeroEstoque: Integer;
  filtro: String; emEstoque: Boolean): TStrings;
var
  lista: TStrings;
  cds: TClientDataSet;
begin
  lista := TStringList.Create;

  cds := TProdutoNumeroSerie.listaEstoque(vIndice, numeroEstoque, filtro, emEstoque);
  cds.First;
  While not cds.Eof do
  begin
    lista.AddObject(cds.FieldByName('numero_serie').AsString + ' (' +
        FormatDateTime('dd/mm/yyyy', cds.FieldByName('data_ultima_entrada').AsDateTime) + ' - nf: ' + cds.FieldByName('numero_nf_ent').AsString + ')',
        TProdutoNumeroSerie.Create(cds.FieldByName('produto_numero_serie_sq').AsInteger));
    cds.Next;
  end;
  cds.Close;

  result := lista;
end;

class function TProduto.listaProdutoAtivo(
  complemento: String): TClientDataSet;
begin
  result := listaRegistros(' where produto_ativo = ''S'' ' + complemento);
end;

function TProduto.possuiNumeroSerie: Boolean;
begin
  result := TProdutoNumeroSerie.listaEstoque(vIndice).RecordCount > 0;
end;

class function TProduto.listarDescricao(complemento: String): TClientDataSet;
begin
  result := TProduto.listaPersonalizada('select p.produto_sq, p.modelo_sq, p.codigo_produto, p.descricao_produto, p.preco_unit from produtos p ' + complemento);
end;

class function TProduto.recuperarImagem(indice: Integer; codigo: String): TStream;
var
  cds: TClientDataSet;
  imagem: TImage;
  produto: TProduto;
  picture: TPicture;
  jpeg: TJpegImage;
  arquivo, nomeArquivo: String;
  stream: TStream;
begin

  // busca a imagem localmente
  arquivo := buscarImagemLocal(codigo + '.jpg');

  // se não achar a imagem
  if (arquivo = '') then
  begin
    //busca registro da imagem na base de dados
    cds := buscarImagemProduto(indice);

    //verifica se existe url
    if (not cds.FieldByName('produto_imagem_url').IsNull) then
    begin
      //busca a imagem da url e salva localmente
      arquivo := salvarImagemLocal(cds.FieldByName('produto_imagem_url').AsString);
    end;

    // se não baixou a imagem / se não existe url
    if (arquivo = '') then
    begin
      stream := cds.CreateBlobStream(cds.FieldByName('produto_imagem'), bmRead);
      stream.Seek(0, soFromBeginning);

      arquivo := salvarImagemLocal(stream, codigo);
      stream := nil;
    end;
  end;

  //se nao achou a imagem em lugar algum, tenta a URL fixa: http://www.magnumsa.com.br/imagens/
  if (arquivo = '') then
  begin
    arquivo := salvarImagemLocal('http://www.magnumsa.com.br/imagens/' + codigo + '.jpg');
  end;

  if (arquivo <> '') then
  begin
    result := TMemoryStream.Create;

    jpeg := TJPEGImage.Create;
    jpeg.LoadFromFile(arquivo);

    imagem := TImage.Create(nil);
    imagem.Picture.Bitmap.Assign(jpeg);
    imagem.Picture.Bitmap.SaveToStream(result);
  end
  else
  begin
    produto := TProduto.Create(indice);
    result := TMemoryStream.Create;
    imagem := TImage.Create(nil);
    imagem.Canvas.Font.Size := 16;
    imagem.Height := 1000;
    imagem.Width := 1000;
    ConvTextOut(imagem.Canvas, 'Produto', 10, 40, 0);
    ConvTextOut(imagem.Canvas, produto.codigo_produto, 10, 70, 0);
    imagem.Picture.Bitmap.SaveToStream(result);
  end;
  FreeAndNil(cds);
end;

class function TProduto.buscarImagemProduto(indice: Variant): TClientDataSet;
var
  int: Integer;
begin
  if (indice = null) then
    int := 0
  else
    int := indice;

  DM.SCServer.AppServer.BurcarImagemProduto(int);

  result := TClientDataSet.Create(DM);
  result.RemoteServer := DM.SCServer;
  result.ProviderName := 'dspProdutoImagem';

  result.Open;

  if not result.Locate('produto_sq', int, []) then
  begin
    result.Append;
    result.FieldByName('produto_sq').Value := int;
  end;
end;


class function TProduto.listarEstoque(
  tipo_produto: Integer; ordem: String): TClientDataSet;
begin
  result := listaPersonalizada('SELECT P.*, DESCRICAO_MODELO, CODIGO_NBM, ' +
    ' (qtde_estoque1+qtde_estoque2+qtde_estoque3+qtde_estoque4+qtde_estoque5 ' +
    ' +qtde_estoque6+qtde_estoque7+qtde_estoque8+qtde_estoque9+qtde_estoque10)*P.PRECO_UNIT as PRECO_TOTAL ' +
    ' FROM produtos P ' +
    ' LEFT JOIN nbm N ON (N.NBM_SQ = P.NBM_SQ) ' +
    ' LEFT JOIN modelos M ON (M.MODELO_SQ = P.MODELO_SQ) ' +
    ' WHERE TIPO_PRODUTO = ' + IntToStr(tipo_produto) +
    ' ORDER BY ' + ordem);
end;

class function TProduto.listaSugestaoCompra(tipo_produto,
  qtdeMeses: Integer; IntervaloCompra: Double): TClientDataSet;
begin
  result := listaPersonalizada(
'	select p.produto_sq, p.descricao_produto, (qtde_estoque1 + qtde_estoque2 + qtde_estoque3 + qtde_estoque4 + qtde_estoque5 + qtde_estoque6 + ' +
'   qtde_estoque7 + qtde_estoque8 + qtde_estoque9 + qtde_estoque10) as estoque_total, qtde1, qtde2, qtde3, qtde4, qtde5, qtde6, ' +
'		qtde7, qtde8, qtde9, qtde10, qtde11, qtde12, ' +
'		floor((case ' + IntToStr(qtdeMeses) + ' when 1 then qtde1 ' +
'			when  2 then (qtde1 + qtde2) / 2 ' +
'			when  3 then (qtde1 + qtde2 + qtde3) / 3 ' +
'			when  4 then (qtde1 + qtde2 + qtde3 + qtde4) / 4 ' +
'			when  5 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5) / 5 ' +
'			when  6 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6) / 6 ' +
'			when  7 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6 + qtde7) / 7 ' +
'			when  8 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6 + qtde7 + qtde8) / 8 ' +
'			when  9 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6 + qtde7 + qtde8 + qtde9) / 9 ' +
'			when 10 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6 + qtde7 + qtde8 + qtde9 + qtde10) / 10 ' +
'			when 11 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6 + qtde7 + qtde8 + qtde9 + qtde10 + qtde11) / 11 ' +
'			when 12 then (qtde1 + qtde2 + qtde3 + qtde4 + qtde5 + qtde6 + qtde7 + qtde8 + qtde9 + qtde10 + qtde11 + qtde12) / 12 ' +
'		end) * ' + FloatToStr(IntervaloCompra * 100) + '/100) + 1 - (qtde_estoque1 + qtde_estoque2 + qtde_estoque3 + qtde_estoque4 + qtde_estoque5 + qtde_estoque6 + ' +
'   qtde_estoque7 + qtde_estoque8 + qtde_estoque9 + qtde_estoque10) as sugestao ' +
'	from produtos p ' +
'	inner join ( ' +
'		select n.produto_sq, ' +
'			sum(case when aamm_venda = 0 then qtde_baixa else 0 end) as qtde1, ' +
'			sum(case when aamm_venda = 1 then qtde_baixa else 0 end) as qtde2, ' +
'			sum(case when aamm_venda = 2 then qtde_baixa else 0 end) as qtde3, ' +
'			sum(case when aamm_venda = 3 then qtde_baixa else 0 end) as qtde4, ' +
'			sum(case when aamm_venda = 4 then qtde_baixa else 0 end) as qtde5, ' +
'			sum(case when aamm_venda = 5 then qtde_baixa else 0 end) as qtde6, ' +
'			sum(case when aamm_venda = 6 then qtde_baixa else 0 end) as qtde7, ' +
'			sum(case when aamm_venda = 7 then qtde_baixa else 0 end) as qtde8, ' +
'			sum(case when aamm_venda = 8 then qtde_baixa else 0 end) as qtde9, ' +
'			sum(case when aamm_venda = 9 then qtde_baixa else 0 end) as qtde10, ' +
'			sum(case when aamm_venda = 10 then qtde_baixa else 0 end) as qtde11, ' +
'			sum(case when aamm_venda = 11 then qtde_baixa else 0 end) as qtde12, ' +
'			sum(case when aamm_venda = 12 then qtde_baixa else 0 end) as qtde13, ' +
'			sum(case when aamm_venda = 13 then qtde_baixa else 0 end) as qtde14, ' +
'			sum(case when aamm_venda = 14 then qtde_baixa else 0 end) as qtde15 ' +
'		from ( ' +
'			select n.produto_sq, n.aamm_venda, sum(n.qtde_baixa) as qtde_baixa ' +
'			from ( ' +
'				select pi.produto_sq, PERIOD_DIFF(date_format(current_date(), ''%Y%m''), date_format(p.data_pedido, ''%Y%m'')) as aamm_venda, ' +
'					sum(pi.qtde_pedido_item-COALESCE(ni.qtde_faturado,0)) as qtde_baixa ' +
'				from pedidos_itens pi ' +
'				inner join pedidos p on (p.pedido_Sq = pi.pedido_sq) ' +
'				left outer join ( ' +
'					select ni.produto_sq, n.pedido_sq, sum(ni.qtde_item) as qtde_faturado ' +
'					from nfiscais_itens ni ' +
'					inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq) ' +
'					where n.dtemissao_nfiscal >= DATE_ADD(CURRENT_DATE(), INTERVAL -' + IntToStr(qtdeMeses) + ' MONTH) ' +
'					group by ni.produto_sq, n.pedido_sq) ni on (ni.pedido_sq=pi.pedido_sq and pi.produto_sq=ni.produto_sq) ' +
'				group by pi.produto_sq ' +
'				union ' +
'				select ni.produto_sq, PERIOD_DIFF(date_format(current_date(), ''%Y%m''), date_format(n.dtemissao_nfiscal, ''%Y%m'')) as aamm_venda, ' +
'					sum(ni.qtde_item) as qtde_vendido ' +
'				from nfiscais_itens ni ' +
'				inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq and n.cancelada <> ''S'') ' +
'				inner join naturezas nat on (nat.natureza_sq = n.natureza_sq and nat.tipo_nfiscal = 0) ' +
'				where n.dtemissao_nfiscal >= DATE_ADD(CURRENT_DATE(), INTERVAL -' + IntToStr(qtdeMeses) + ' MONTH) ' +
'				group by ni.produto_sq, aamm_venda) n ' +
'			group by n.produto_sq, n.aamm_venda) n ' +
'		group by n.produto_sq) n on (n.produto_sq = p.produto_sq) '
);
end;

class function TProduto.listaProdutoSemImagem: TClientDataSet;
begin
  result := listaPersonalizada('select p.* from produtos p left join produto_imagem pi on (pi.produto_sq=p.produto_sq) where pi.produto_sq is null');
end;

class procedure TProduto.CarregarImagem;
var
  repositorio: String;
  arquivo: String;
  imagem: TPicture;
  ds: TDataSource;
  cds: TClientDataSet;
  dbimage1: TDBImage;
begin
  repositorio := 'http://www.magnumsa.com.br/imagens/';
  arquivo := codigo_produto + '.jpg';

  try
    if URLDownloadToFile(nil, PChar(repositorio + arquivo), PChar(arquivo), 0, nil) = 0 then
    begin
      resizeImagem(arquivo, 30000);

      imagem := TPicture.Create();
      imagem.LoadFromFile(arquivo);
      clipboard.Assign(imagem);

      cds := BuscarImagemProduto(produto_sq);

      ds := TDataSource.Create(nil);
      ds.DataSet := cds;

      dbimage1 := TDBImage.Create(nil);
      dbimage1.DataSource := ds;
      dbimage1.DataField := 'produto_imagem';

      dbimage1.PasteFromClipboard;
      cds.Post;
      cds.ApplyUpdates(0);
    end;
  finally
    DeleteFile(arquivo);
  end;
end;

{ TProdutoNumeroSerie }

constructor TProdutoNumeroSerie.Create;
begin
  setTabela('produto_numero_serie');
  setLista('Código=CODIGO_PRODUTO,Descrição=DESCRICAO_PRODUTO,"Número de série=numero_serie"');
  sqlLista := 'select p.codigo_produto, p.descricao_produto, e.* ' +
    'from produto_numero_serie e ' +
    ' inner join produtos p on (p.produto_sq = e.produto_sq)';
end;

constructor TProdutoNumeroSerie.CreateSerie(numeroSerie: String);
begin
  CreateFiltro('numero_serie = ' + QuotedStr(numeroSerie));
end;

destructor TProdutoNumeroSerie.Destroy;
begin
  FreeAndNil(_produto_sq);

  inherited;
end;

class procedure TProdutoNumeroSerie.entrada(produto: TProduto; numeroSerie: String;
      numeroEstoque: Integer; valorEntrada: Double; entrada: TDateTime;
      numero_nf_ent: Variant);
var
  registro: TProdutoNumeroSerie;
begin
  registro := pesquisaNumeroSerie(numeroSerie);

  if (registro = nil) then
  begin
    registro := TProdutoNumeroSerie.Create;
    registro.produto_sq := produto;
    registro.numero_serie := numeroSerie;
    registro.numero_estoque := numeroEstoque;
  end
  else if (registro.data_ultima_saida = 0) then
    raise Exception.Create('O número de série informado já está no estoque.');

  registro.data_ultima_entrada := entrada;
  registro.numero_nf_ent       := numero_nf_ent;
  registro.data_ultima_saida   := 0;

  registro.salvar;

  with TKardex.Create do
  begin
    produto_sq := produto;
    tipo_mov   := 'E';
    qtde       := 1;
    numero_estoque := numeroEstoque;
    valor      := valorEntrada;
    data       := entrada;
    nfiscal    := numero_nf_ent;
    usuario_sq := TUsuario.Create(DM.useq);
    nr_serie   := numeroSerie;
    salvar;
  end;

end;

class function TProdutoNumeroSerie.listaEstoque(produto_sq, numeroEstoque: Integer): TClientDataSet;
begin
  result := listaEstoque(produto_sq, numeroEstoque, '', True);
end;

class function TProdutoNumeroSerie.listaEstoque(produto_sq: Integer): TClientDataSet;
begin
  result := listaEstoque(produto_sq, 0);
end;

class function TProdutoNumeroSerie.listaEstoque: TClientDataSet;
begin
  result := listaEstoque(0);
end;

class function TProdutoNumeroSerie.listaEstoque(produto_sq, numeroEstoque: Integer;
  numeroSerie: String; emEstoque: Boolean): TClientDataSet;
var
  select, filtroEstoque, filtroSaida: String;
  cds: TClientDataSet;
begin
  if (emEstoque) then
  begin
    filtroEstoque := 'where e.data_ultima_saida is null';
    filtroSaida := 'where 1 <> 1';
  end
  else
  begin
    filtroEstoque := 'where e.data_ultima_saida is not null';
    filtroSaida := 'where ni.nr_serie_item is not null and ni.nr_serie_item <> '''' ';
  end;

  if (produto_sq > 0) then
  begin
    filtroEstoque := filtroEstoque + ' and e.produto_sq = ' + IntToStr(produto_sq);
    filtroSaida := filtroSaida + ' and ni.produto_sq = ' + IntToStr(produto_sq);
  end;

  if (numeroEstoque > 0) then
    filtroEstoque := filtroEstoque + ' and e.numero_estoque = ' + IntToStr(numeroEstoque);

  if (Trim(numeroSerie) <> '') then
  begin
    filtroEstoque := filtroEstoque + ' and e.numero_serie like ''%' + numeroSerie + '%''';
    filtroSaida := filtroSaida + ' and ni.nr_serie_item like ''%' + numeroSerie + '%''';
  end;

  select := 'select produto_numero_serie_sq, descricao_produto, numero_serie, ' +
    'data_ultima_entrada, data_ultima_saida, numero_estoque, numero_nfiscal, ' +
    'numero_nfe, nome_cliente, n.nfiscal_sq, numero_nf_ent from ' +
    '(select e.produto_numero_serie_sq, numero_Serie, data_ultima_entrada, ' +
    'data_ultima_saida, e.produto_sq, ni.nfiscal_sq, numero_nf_ent, ' +
    'case e.numero_estoque ' +
    'when 1 then (select descricao_estoque1 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 2 then (select descricao_estoque2 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 3 then (select descricao_estoque3 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 4 then (select descricao_estoque4 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 5 then (select descricao_estoque5 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 6 then (select descricao_estoque6 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 7 then (select descricao_estoque7 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 8 then (select descricao_estoque8 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 9 then (select descricao_estoque9 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'when 10 then (select descricao_estoque10 from empresas where empresa_sq=' + VarToStr(empresaSelecionada.vIndice) + ') ' +
    'end as numero_estoque ' +
    'from produto_numero_serie e ' +
    'left join nfiscais_itens_serie nie on (nie.produto_numero_serie_sq=e.produto_numero_serie_sq) ' +
    'left join nfiscais_itens ni on (ni.nfiscal_item_sq=nie.nfiscal_item_sq) ' +
    filtroEstoque +
    ' union ' +
    'select 0, substring(nr_serie_item, 1, 200), null, n.dtemissao_nfiscal, ' +
    'ni.produto_sq, ni.nfiscal_sq, n.numero_nfiscal, ni.numero_estoque ' +
    'from nfiscais_itens ni ' +
    'inner join nfiscais n on (n.nfiscal_sq=ni.nfiscal_sq) ' +
    filtroSaida +
    ') estoque ' +
    'inner join produtos p on (p.produto_sq=estoque.produto_sq) ' +
    'left join nfiscais n on (n.nfiscal_sq=estoque.nfiscal_sq) ' +
    'left join clientes c on (c.cliente_sq=n.cliente_sq)';

  cds := listaPersonalizada(select);

  cds.FieldByName('descricao_produto').DisplayLabel   := 'Produto';
  cds.FieldByName('numero_Serie').DisplayLabel        := 'Número de série';
  cds.FieldByName('data_ultima_entrada').DisplayLabel := 'Data entrada';
  cds.FieldByName('data_ultima_saida').DisplayLabel   := 'Data saída';
  cds.FieldByName('numero_estoque').DisplayLabel      := 'Estoque';
  cds.FieldByName('numero_nfe').DisplayLabel          := 'NFe';
  cds.FieldByName('numero_nfiscal').DisplayLabel      := 'Nota fiscal';
  cds.FieldByName('nome_cliente').DisplayLabel        := 'Cliente';

  result := cds;
end;

class function TProdutoNumeroSerie.pesquisaNumeroSerie(numeroSerie: String): TProdutoNumeroSerie;
var
  cds: TClientDataSet;
begin
  cds := listaRegistros('where numero_serie = ' + QuotedStr(numeroSerie));
  if (cds.RecordCount > 1) then
    raise Exception.Create('O número de série informado está duplicado na base de dados.')
  else if (cds.RecordCount = 0) then
    result := nil
  else
  begin
    cds.First;
    result := TProdutoNumeroSerie.Create(cds.FieldByName('produto_numero_serie_sq').Value);
  end;
end;

class procedure TProdutoNumeroSerie.saida(numeroSerie: String;
  valorSaida: Double; numeroNfiscal: Integer; saida: TDateTime);
var
  registro: TProdutoNumeroSerie;
begin
  registro := pesquisaNumeroSerie(numeroSerie);

  if (registro = nil) then
    raise Exception.Create('O número de série informado não existe no estoque.');

  registro.data_ultima_saida := saida;
  registro.salvar;

  With TKardex.Create do
  begin
    produto_sq := registro.produto_sq;
    tipo_mov   := 'S';
    qtde       := 1;
    numero_estoque := registro.numero_estoque;
    data       := saida;
    nfiscal    := numeroNfiscal;
    valor      := valorSaida;
    usuario_sq := TUsuario.Create(DM.useq);
    nr_serie   := numeroSerie;
    salvar;
  end;
end;

end.
