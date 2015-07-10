unit Balanco;

interface

uses Cadastro, Empresa, Produto, SysUtils, TypInfo, Classes, DBClient, Variants;

type
  TStatusContagem = (scPendente, scAndamento, scFinalizada);

type
  TBalancoContagemProduto = class(TCadastro)
  private
    Fbalanco_contagem_sq: Integer;
    Fproduto_sq: TProduto;
    Fqtde_estoque: Variant;
    Fqtde_contada: Variant;

    procedure Setbalanco_contagem_sq(const Value: Integer);
    procedure Setproduto_sq(const Value: TProduto);
    procedure Setqtde_estoque(const Value: Variant);
    procedure Setqtde_contada(const Value: Variant);
  published
    property balanco_contagem_sq: Integer read Fbalanco_contagem_sq write Setbalanco_contagem_sq;
    property produto_sq: TProduto read Fproduto_sq write Setproduto_sq;
    property qtde_estoque: Variant read Fqtde_estoque write Setqtde_estoque;
    property qtde_contada: Variant read Fqtde_contada write Setqtde_contada;
  public
    constructor Create(); override;
  end;

type
  TBalancoContagem = class(TCadastro)
  private
    Fbalanco_sq: Integer;
    Fdata_inicio_contagem: TDateTime;
    Fdata_termino_contagem: TDateTime;
    Fnumero_contagem: Integer;
    Fstatus_contagem: Integer;
    FlistaContagemProduto: TList;

    procedure Setbalanco_sq(const Value: Integer);
    procedure Setdata_inicio_contagem(const Value: TDateTime);
    procedure Setdata_termino_contagem(const Value: TDateTime);
    procedure Setnumero_contagem(const Value: Integer);
    function getDescricao: String;
    procedure Setstatus_contagem(const Value: Integer);
    function getDescricaoStatus: String;
  published
    property balanco_sq: Integer read Fbalanco_sq write Setbalanco_sq;
    property data_inicio_contagem: TDateTime read Fdata_inicio_contagem write Setdata_inicio_contagem;
    property data_termino_contagem: TDateTime read Fdata_termino_contagem write Setdata_termino_contagem;
    property numero_contagem: Integer read Fnumero_contagem write Setnumero_contagem;
    property status_contagem: Integer read Fstatus_contagem write Setstatus_contagem;
  public
    property listaContagemProduto: TList read FlistaContagemProduto write FlistaContagemProduto;
    property descricao: String read getDescricao;
    property descricaoStatus: String read getDescricaoStatus;
    constructor Create(); override;
    procedure salvar; override;
    procedure setIndice(const indiceP: Variant); override;
//    function listarDiferencaContagem: TClientDataSet;
  end;

type
  TBalanco = class(TCadastro)
  private
    Fempresa_sq: TEmpresa;
    Fdata_inicio_balanco: TDateTime;
    Fnumero_estoque: Integer;
    Fqtde_contagem: Integer;
    Fdata_termino_balanco: TDateTime;
    FlistaContagem: TList;
    Fgrupo_balanco: Integer;
    Fstatus_balanco: String;

    procedure Setempresa_sq(const Value: TEmpresa);
    procedure Setdata_inicio_balanco(const Value: TDateTime);
    procedure Setdata_termino_balanco(const Value: TDateTime);
    procedure Setnumero_estoque(const Value: Integer);
    procedure Setqtde_contagem(const Value: Integer);
    procedure verificarContagemAnterior(contagem: TBalancoContagem;
  status: TStatusContagem);
    procedure Setgrupo_balanco(const Value: Integer);
    procedure Setstatus_balanco(const Value: String);
  published
    property empresa_sq: TEmpresa read Fempresa_sq write Setempresa_sq;
    property data_inicio_balanco: TDateTime read Fdata_inicio_balanco write Setdata_inicio_balanco;
    property data_termino_balanco: TDateTime read Fdata_termino_balanco write Setdata_termino_balanco;
    property qtde_contagem: Integer read Fqtde_contagem write Setqtde_contagem;
    property numero_estoque: Integer read Fnumero_estoque write Setnumero_estoque;
    property grupo_balanco: Integer read Fgrupo_balanco write Setgrupo_balanco;
    property status_balanco: String read Fstatus_balanco write Setstatus_balanco;
  public
    property listaContagem: TList read FlistaContagem write FlistaContagem;
    procedure adicionarContagem(contagem: TBalancoContagem);
    procedure iniciarContagem(contagem: TBalancoContagem);
    procedure finalizarContagem(contagem: TBalancoContagem);
    constructor Create(); override;
    procedure setIndice(const indiceP: Variant); override;
    procedure salvar; override;
    procedure iniciarBalanco;
    function temContagemAberta: Boolean;
    function temContagemEmAndamento: Boolean;
  end;

function compare(item1: Pointer; item2: Pointer): Integer;

implementation

uses DB, UDM;

{ TBalanco }

procedure TBalanco.adicionarContagem(contagem: TBalancoContagem);
begin
  listaContagem.Add(contagem);
end;

procedure TBalanco.verificarContagemAnterior(contagem: TBalancoContagem;
  status: TStatusContagem);
var
  i: Integer;
  itemLista: TBalancoContagem;
begin
  for i := 0 to listaContagem.Count - 1 do
  begin
    itemLista := TBalancoContagem(listaContagem.Items[i]);
    if (itemLista.numero_contagem < contagem.numero_contagem) then
    begin
      if (TStatusContagem(itemLista.status_contagem) in [scPendente, scAndamento]) then
        raise Exception.Create('A ' + itemLista.descricao + ' está com status ' + itemLista.descricaoStatus + '. Não é possível alterar o status da ' + contagem.descricao + '.');
    end;
  end;
end;

constructor TBalanco.Create;
begin
  setTabela('balanco');
  setLista('"Data de início=data_inicio_balanco","Estoque=descricao_estoque"');
  sqlLista := 'select b.*, (select case b.numero_estoque ' +
  'when 1 then descricao_estoque1 when 2 then descricao_estoque2 ' +
  'when 3 then descricao_estoque3 when 4 then descricao_estoque4 ' +
  'when 5 then descricao_estoque5 when 6 then descricao_estoque6 ' +
  'when 7 then descricao_estoque7 when 8 then descricao_estoque8 ' +
  'when 9 then descricao_estoque9 when 10 then descricao_estoque10 ' +
  'end from empresas e where e.empresa_Sq = b.empresa_sq) descricao_estoque ' +
  'from balanco b';
  FlistaContagem := TList.Create;
end;

procedure TBalanco.Setdata_inicio_balanco(const Value: TDateTime);
begin
  Fdata_inicio_balanco := Value;
end;

procedure TBalanco.Setdata_termino_balanco(const Value: TDateTime);
begin
  Fdata_termino_balanco := Value;
end;

procedure TBalanco.Setempresa_sq(const Value: TEmpresa);
begin
  Fempresa_sq := Value;
end;

procedure TBalanco.setIndice(const indiceP: Variant);
var
  cds: TClientDataSet;
begin
  inherited;
  if (indiceP <> null) then
  begin
    cds := TBalancoContagem.listaPersonalizada('select balanco_contagem_sq from balanco_contagem where balanco_sq = ' + IntToStr(indiceP));
    while (not cds.Eof) do
    begin
      listaContagem.Add(TBalancoContagem.Create(cds.FieldByName('balanco_contagem_sq').AsInteger));
      cds.Next;
    end;
  end;
end;

procedure TBalanco.Setnumero_estoque(const Value: Integer);
begin
  Fnumero_estoque := Value;
end;

procedure TBalanco.Setqtde_contagem(const Value: Integer);
begin
  Fqtde_contagem := Value;
end;

procedure TBalanco.iniciarContagem(contagem: TBalancoContagem);
var
  cds: TClientDataSet;
  contagemProduto: TBalancoContagemProduto;
  produto: TProduto;
  sql, produtosNaLista: String;
  i, qtde_estoque_produto: Integer;
  contagemAnterior: TBalancoContagem;
begin
  if (TStatusContagem(contagem.status_contagem) <> scAndamento) then
  begin
    verificarContagemAnterior(contagem, scAndamento);
    contagem.status_contagem := Ord(scAndamento);
    contagem.data_inicio_contagem := Date + Time;

    if (contagem.numero_contagem > 1) then
    begin
      contagemAnterior := TBalancoContagem(listaContagem.Items[listaContagem.IndexOf(contagem)-1]);

      for i := 0 to contagemAnterior.listaContagemProduto.Count - 1 do
      begin
        if (TBalancoContagemProduto(contagemAnterior.listaContagemProduto.Items[i]).qtde_contada <> null) then
        begin
          if (TBalancoContagemProduto(contagemAnterior.listaContagemProduto.Items[i]).qtde_estoque <> TBalancoContagemProduto(contagemAnterior.listaContagemProduto.Items[i]).qtde_contada) then
          begin
            sql := sql + ',' + VarToStr(TBalancoContagemProduto(contagemAnterior.listaContagemProduto.Items[i]).produto_sq.vIndice);
          end;
        end;
      end;
      if (contagemAnterior.listaContagemProduto.Count >= 1) then
        sql := ' and produto_sq in (' + Copy(sql, 2, Length(sql)) + ')';
    end;

    try
      sql := sql + ' and grupo_balanco = ' + IntToStr(grupo_balanco);

      cds := TProduto.listaProdutoAtivo(sql);
      while not cds.Eof do
      begin
        produto := TProduto.Create;
        produto.vIndice := cds.FieldByName('produto_sq').Value;
        produto.codigo_produto := cds.FieldByName('codigo_produto').Value;
        produto.descricao_produto := cds.FieldByName('descricao_produto').Value;

        qtde_estoque_produto := cds.FieldByName('qtde_estoque' + IntToStr(numero_estoque)).Value;

        contagemProduto := TBalancoContagemProduto.Create;
        contagemProduto.Fproduto_sq := produto;
        contagemProduto.Fqtde_estoque := qtde_estoque_produto;
        contagem.listaContagemProduto.Add(contagemProduto);

        cds.Next;
      end;
    finally
      FreeAndNil(cds);
    end;
  end;
end;

procedure TBalanco.finalizarContagem(contagem: TBalancoContagem);
begin
  verificarContagemAnterior(contagem, scFinalizada);
  contagem.status_contagem := Ord(scFinalizada);
  contagem.data_termino_contagem := Date + Time;
end;

procedure TBalanco.salvar;
var
  i: Integer;
begin
  inherited;

  for i := 0 to listaContagem.Count - 1 do
  begin
    TBalancoContagem(listaContagem.Items[i]).balanco_sq := vIndice;
    TBalancoContagem(listaContagem.Items[i]).salvar;
  end;
end;

procedure TBalanco.iniciarBalanco;
var
  i: Integer;
  contagem: TBalancoContagem;
begin
  listaContagem.Clear;
  for i := 1 to qtde_contagem do
  begin
    contagem := TBalancoContagem.Create;
    contagem.numero_contagem := i;
    adicionarContagem(contagem);
  end;
  data_inicio_balanco := Date + Time;
end;

function TBalanco.temContagemAberta: Boolean;
var
  i: Integer;
begin
  if (listaContagem.Count = 0) then
  begin
    result := false;
    exit;
  end;

  for i := 0 to listaContagem.Count - 1 do
  begin
    if (TBalancoContagem(listaContagem.Items[i]).Fstatus_contagem <> Ord(scFinalizada)) then
    begin
      result := true;
      exit;
    end;
  end;
  result := false;
end;

function TBalanco.temContagemEmAndamento: Boolean;
var
  i: Integer;
begin
  if (listaContagem.Count = 0) then
  begin
    result := false;
    exit;
  end;

  for i := 0 to listaContagem.Count - 1 do
  begin
    if (TBalancoContagem(listaContagem.Items[i]).Fstatus_contagem = Ord(scAndamento)) then
    begin
      result := true;
      exit;
    end;
  end;
  result := false;
end;

procedure TBalanco.Setgrupo_balanco(const Value: Integer);
begin
  Fgrupo_balanco := Value;
end;

procedure TBalanco.Setstatus_balanco(const Value: String);
begin
  Fstatus_balanco := Value;
end;

{ TBalancoContagem }

constructor TBalancoContagem.Create;
begin
  setTabela('balanco_contagem');
  FlistaContagemProduto := TList.Create;
end;

function TBalancoContagem.getDescricao: String;
begin
  if (numero_contagem = 1)  then result := 'Primeira contagem' else
  if (numero_contagem = 2)  then result := 'Segunda contagem' else
  if (numero_contagem = 3)  then result := 'Terceira contagem' else
  if (numero_contagem = 4)  then result := 'Quarta contagem' else
  if (numero_contagem = 5)  then result := 'Quinta contagem' else
  if (numero_contagem = 6)  then result := 'Sexta contagem' else
  if (numero_contagem = 7)  then result := 'Sétima contagem' else
  if (numero_contagem = 8)  then result := 'Oitava contagem' else
  if (numero_contagem = 9)  then result := 'Nona contagem' else
  if (numero_contagem = 10) then result := 'Décima contagem' else
  raise Exception.Create('Não foi possível identificar o número da contagem');
end;

function TBalancoContagem.getDescricaoStatus: String;
begin
  if (status_contagem = Ord(scPendente)) then result := 'Pendente' else
  if (status_contagem = Ord(scAndamento)) then result := 'Iniciada em ' + FormatDateTime('dd/mm/yyyy hh:nn', data_inicio_contagem) else
  if (status_contagem = Ord(scFinalizada)) then result := 'Iniciada em ' + FormatDateTime('dd/mm/yyyy hh:nn', data_inicio_contagem) + ' e finalizada em ' + FormatDateTime('dd/mm/yyyy hh:nn', data_termino_contagem) else
  result := GetEnumName(TypeInfo(TStatusContagem), Integer(status_contagem));
end;

{
function TBalancoContagem.listarDiferencaContagem: TClientDataSet;
var
  sql: String;
begin
  sql := 'select p.produto_sq, coalesce(case b.numero_estoque when 1 then p.qtde_estoque1 when 2 then p.qtde_estoque2 ' +
    'when 3 then p.qtde_estoque3 when 4 then p.qtde_estoque4 when 5 then p.qtde_estoque5 when 6 then p.qtde_estoque6 ' +
    'when 7 then p.qtde_estoque7 when 8 then p.qtde_estoque8 when 9 then p.qtde_estoque9 ' +
    'when 10 then p.qtde_estoque10 end, 0) + coalesce(sum(case k.tipo_mov when ''E'' then qtde * -1 else qtde end), 0) as qtde_estoque ' +
    'from produtos p ' +
    'inner join balanco_contagem_produto bcp on (bcp.produto_sq=p.produto_sq and bcp.qtde_estoque is not null) ' +
    'inner join balanco_contagem bc on (bc.balanco_contagem_sq=bcp.balanco_contagem_sq and bc.balanco_contagem_sq = ' + VarToStr(vIndice) + ') ' +
    'inner join balanco b on (b.balanco_sq=bc.balanco_sq) ' +
    'left join kardex k on (k.data > bc.data_termino_contagem and k.produto_sq=p.produto_sq and k.numero_estoque = b.numero_estoque) ' +
    'group by p.produto_sq';

  result := listaPersonalizada(sql);
end;
}

procedure TBalancoContagem.salvar;
var
  i: Integer;
  produtosNaLista: String;
begin
  inherited;

  produtosNaLista := '';
  for i := 0 to listaContagemProduto.Count - 1 do
  begin
    TBalancoContagemProduto(listaContagemProduto.Items[i]).balanco_contagem_sq := vIndice;
    TBalancoContagemProduto(listaContagemProduto.Items[i]).salvar;
    produtosNaLista := produtosNaLista + ',' + VarToStr(TBalancoContagemProduto(listaContagemProduto.Items[i]).vIndice);
  end;

  if (produtosNaLista <> '') then
  begin
    produtosNaLista := Copy(produtosNaLista, 2, 1000);

    DM.SCServer.AppServer.ExecSQL('delete from balanco_contagem_produto ' +
      'where balanco_contagem_sq = ' + VarToStr(vIndice) +
      ' and balanco_contagem_produto_sq not in (' + produtosNaLista + ')');
  end;

end;

procedure TBalancoContagem.Setbalanco_sq(const Value: Integer);
begin
  Fbalanco_sq := Value;
end;

procedure TBalancoContagem.Setdata_inicio_contagem(const Value: TDateTime);
begin
  Fdata_inicio_contagem := Value;
end;

procedure TBalancoContagem.Setdata_termino_contagem(
  const Value: TDateTime);
begin
  Fdata_termino_contagem := Value;
end;

procedure TBalancoContagem.setIndice(const indiceP: Variant);
var
  cds: TClientDataSet;
begin
  inherited;
  if (indiceP <> null) then
  begin
    cds := TBalancoContagemProduto.listaPersonalizada('select balanco_contagem_produto_sq from balanco_contagem_produto where balanco_contagem_sq = ' + IntToStr(indiceP));
    while (not cds.Eof) do
    begin
      listaContagemProduto.Add(TBalancoContagemProduto.Create(cds.FieldByName('balanco_contagem_produto_sq').AsInteger));
      cds.Next;
    end;
  end;
end;

procedure TBalancoContagem.Setnumero_contagem(const Value: Integer);
begin
  Fnumero_contagem := Value;
end;

procedure TBalancoContagem.Setstatus_contagem(
  const Value: Integer);
begin
  if (Value < Fstatus_contagem) then
    raise Exception.Create('Não é possível alterar o status da contagem selecionada');

  Fstatus_contagem := Value;
end;

{ TBalancoContagemProduto }

constructor TBalancoContagemProduto.Create;
begin
  setTabela('balanco_contagem_produto');
end;

procedure TBalancoContagemProduto.Setbalanco_contagem_sq(
  const Value: Integer);
begin
  Fbalanco_contagem_sq := Value;
end;

procedure TBalancoContagemProduto.Setproduto_sq(const Value: TProduto);
begin
  Fproduto_sq := Value;
end;

procedure TBalancoContagemProduto.Setqtde_contada(const Value: Variant);
begin
  Fqtde_contada := Value;
end;

procedure TBalancoContagemProduto.Setqtde_estoque(const Value: Variant);
begin
  Fqtde_estoque := Value;
end;

function compare(item1: Pointer; item2: Pointer): Integer;
var
  contagemProduto1, contagemProduto2: TBalancoContagemProduto;
begin
  // We start by viewing the object pointers as TCustomer objects
  contagemProduto1 := TBalancoContagemProduto(Item1);
  contagemProduto2 := TBalancoContagemProduto(Item2);

  // Now compare
  if (contagemProduto1.produto_sq.descricao_produto > contagemProduto2.produto_sq.descricao_produto) then
    Result := 1
  else if (contagemProduto1.produto_sq.descricao_produto < contagemProduto2.produto_sq.descricao_produto) then
    Result := -1
  else if (contagemProduto1.produto_sq.codigo_produto > contagemProduto2.produto_sq.codigo_produto) then
    Result := 1
  else if (contagemProduto1.produto_sq.codigo_produto < contagemProduto2.produto_sq.codigo_produto) then
    Result := -1
  else if (contagemProduto1.produto_sq.vIndice > contagemProduto2.produto_sq.vIndice) then
    Result := 1
  else if (contagemProduto1.produto_sq.vIndice < contagemProduto2.produto_sq.vIndice) then
    Result := -1
  else
    Result := 0;
end;

end.
