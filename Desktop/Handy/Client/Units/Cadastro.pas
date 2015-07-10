unit Cadastro;

interface

uses SysUtils, Controls, UDM, Dialogs, Classes, DBClient, Variants, TypInfo,
    Reflection;

type
  {$M+}
  TtipoCampo = (_varchar, _bigint, _longtext, _double, _datetime, _int,
    _timestamp, _text, _decimal, _time, _blob, _char, _date, _mediumblob);

  TCampo = record
    nome: String;
    tipo: TtipoCampo;
    tamanho: Double;
    precisao: Double;
    valor: Variant;
    temValorDefault: Boolean;
    permiteNulo: Boolean;
  end;

  TConstraint = record
    nome: String;
    campos: TStringList;
  end;

  TTabela = record
    nomeTabela: String;
    campos: array[1..1000] of TCampo;
    constraints: array of TConstraint;
  end;

  TCadastro = class(TObject)
  protected
    procedure gravaHistorico(_tipoAlt: Integer; _observacao: String='');
    procedure setTabela(const tabelaP: String); dynamic;
    procedure verificaIndice(); dynamic;
    procedure verificaNulidade; dynamic;
    procedure carregaEmpresa();
    procedure mostraErro(e: Exception; situacao: String);
    function carregaObservacao: String; dynamic;
    class function listaPersonalizada(sql: String): TClientDataSet;
  private
//    cds: TClientDataSet;
    _tabela, _sqlLista: String;
    _cLista: TStringList;
    _vIndice: Variant;
    Fcarregado: Boolean;
    procedure limpaCampos();
    function buscaValor(campo: TCampo): String;
    function buscaCampo(nomeCampo: String): TCampo;
    function getCampoNome: String;
    function buscaTabela: TTabela;
    procedure setvIndice(const Value: Variant);
    procedure Setcarregado(const Value: Boolean);
  public
    class function listaRegistros(complemento: String=''): TClientDataSet;
    class function montaLista(complemento: String=''): TClientDataSet;
    procedure excluirRegistro(confirmar: Boolean=true);
    procedure salvar(); dynamic;
    procedure setIndice(const indiceP: Variant); dynamic;
    procedure setLista(lista: String);
    constructor CreateFiltro(_filtro: String); overload;
    constructor Create(indice: Variant); overload; dynamic;
    constructor Create(); overload; virtual; abstract;
    destructor Destroy; override;
    property cIndice: String read getCampoNome;
    property vIndice: Variant read _vIndice write setvIndice;
    property cLista: TStringList read _cLista write _cLista;
    property nomeTabela: String read _tabela;
    property sqlLista: String write _sqlLista;
    property carregado: Boolean read Fcarregado write Setcarregado;
  end;

var
  tabelas: array[1..1000] of TTabela;

implementation

uses Empresa, HistoricoAlteracao, Usuario, UMainMenu;

{ TCadastro }

procedure TCadastro.excluirRegistro(confirmar: Boolean);
begin
  if (not confirmar) or (MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes) then
  try
    DM.SCServer.AppServer.ExecSQL('delete from ' + nomeTabela + ' where ' + cIndice + ' = ' + IntToStr(vIndice));
//    gravaHistorico(1);
  except
    on E: Exception do
      mostraErro(E, 'apagar');
  end;
end;

constructor TCadastro.Create(indice: Variant);
begin
  Create();
  if indice = 0 then
    indice := null;

  setIndice(indice);
end;

constructor TCadastro.CreateFiltro(_filtro: String);
begin
  Create();
  With (listaRegistros('where ' + _filtro)) do
  begin
    if RecordCount = 0 then
      Exit;
    if RecordCount > 1 then
      raise Exception.Create('Foram encontrados mais de 1 registro.');

    setIndice(FieldByName(cIndice).Value);
  end;
end;

procedure TCadastro.gravaHistorico(_tipoAlt: Integer; _observacao: String='');
var
//  sql: String;
  hist: THistoricoAlteracao;
begin
  if DM.useq = 0 then
    exit;

  hist := THistoricoAlteracao.Create;

  if nomeTabela = hist._tabela then
    exit;

  hist.empresa_sq := TEmpresa.Create(empresaSelecionada.vIndice);
  hist.nome_tabela := nomeTabela;
  hist.chave_sq := vIndice;
  hist.tipo_alteracao := _tipoAlt;
  hist.usuario_sq := TUsuario.Create(DM.useq);
  hist.data_alteracao := Date + Time;
  hist.observacao := _observacao;
  hist.salvar;

{
  sql :='insert into hist_alteracoes (' +
          'empresa_sq, nome_tabela, chave_sq, ' +
          'tipo_alteracao, usuario_sq, ' +
          'data_alteracao, observacao) ' +
          'values (' +
          QuotedStr(empresaSelecionada.vIndice) + ', ' +
          QuotedStr(nomeTabela) + ', ' +
          QuotedStr(InttoStr(vIndice)) + ', ' +
          QuotedStr(InttoStr(tipoAlt)) + ', ' +
          QuotedStr(InttoStr(DM.useq)) + ', ' +
          QuotedStr(FormatDateTime ('yyyy-mm-dd hh:nn:ss', Date+Time)) + ', ' +
          QuotedStr(observacao) + ')';

  DM.SCServer.AppServer.ExecSQL(sql);
}
end;

class function TCadastro.listaRegistros(complemento: String=''): TClientDataSet;
var
  obj: TCadastro;
  cds: TClientDataSet;
begin
  try
    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';
    obj := Create;
    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select * from ' + obj.nomeTabela + ' ' + complemento);
    cds.Open;
    result := cds;
  finally
    FreeAndNil(obj);
  end;
end;

procedure TCadastro.mostraErro(e: Exception; situacao: String);
begin
  Showmessage ('Erro ao ' + situacao + ' registro: ' + E.Message);
  DM.EnviarEmail (nomeTabela, situacao, E.Message, vIndice=null);
  raise Exception.Create(E.Message);
end;

procedure TCadastro.salvar;
var
  observacao, sql: String;
  tipoAlt, i: Integer;
  _cds: TClientDataSet;
  tabela: ^TTabela;
  obj: TObject;
begin
  try
    observacao := carregaObservacao;

    for i := Low(tabelas) to High(tabelas) do
    begin
      if (tabelas[i].nomeTabela = _tabela) then
        break;
      if (tabelas[i].nomeTabela = '') then
        break;
    end;
    tabela := @tabelas[i];
    carregaEmpresa;

    for i := Low(tabela.campos)+1 to High(tabela.campos) do
      if tabela.campos[i].nome = '' then
        break
      else
        if GetPropInfo(Self, tabela.campos[i].nome) <> nil then
        begin
          if ((GetPropInfo(Self, tabela.campos[i].nome).PropType^.Kind = tkClass) and (GetObjectPropClass(GetPropInfo(Self, tabela.campos[i].nome)).ClassParent = TCadastro)) then
          begin
            obj := GetObjectProp(Self, tabela.campos[i].nome);
            if obj <> nil then
              tabela.campos[i].valor := TCadastro(obj).vIndice
            else
              tabela.campos[i].valor := null;
          end
          else
            tabela.campos[i].valor := GetPropValue(Self, tabela.campos[i].nome);
        end;

    verificaIndice;
    verificaNulidade;

    if vIndice = null then
    begin
      tipoAlt := 0;
      sql := 'insert into ' + nomeTabela + ' (';

      for i := Low(tabela.campos)+1 to High(tabela.campos) do
      begin
        if GetPropInfo(Self, tabela.campos[i].nome) <> nil then
        begin
          if i > Low(tabela.campos)+1 then
            sql := sql + ', ';

          sql := sql + tabela.campos[i].nome;
        end;
      end;

      sql := sql + ') values (';

      for i := Low(tabela.campos)+1 to High(tabela.campos) do
        if GetPropInfo(Self, tabela.campos[i].nome) <> nil then
        begin
          if i > Low(tabela.campos)+1 then
            sql := sql + ', ';

            sql := sql + buscaValor(tabela.campos[i]);
        end;
      sql := sql + ')';
    end
    else
    begin
      tipoAlt := 1;
      sql := 'update ' + nomeTabela + ' set ';

      for i := Low(tabela.campos)+1 to High(tabela.campos) do
        if GetPropInfo(Self, tabela.campos[i].nome) <> nil then
        begin
          if tabela.campos[i].nome = '' then
            break;

          if i > Low(tabela.campos)+1 then
            sql := sql + ', ';

          sql := sql + tabela.campos[i].nome + '=';

          sql := sql + buscaValor(tabela.campos[i]);
        end;

      sql := sql + ' where ' + cIndice + ' = ' + IntToStr(vIndice);
    end;

    DM.SCServer.AppServer.ExecSQL(sql);

    if tipoAlt=0 then
    try
      _cds := TClientDataSet.Create(DM);
      _cds.RemoteServer := DM.SCServer;
      _cds.ProviderName := 'dspLista';
      _cds.Close;
      DM.SCServer.AppServer.CriaLista('SELECT LAST_INSERT_ID() as CHAVE');
      _cds.Open;
      _vIndice := _cds.FieldByName('chave').Value;
    finally
      FreeAndNil(_cds);
    end;

    gravaHistorico(tipoAlt, observacao);
  except
    on E: Exception do
      mostraErro(E, 'gravar');
  end;
end;

procedure TCadastro.setIndice(const indiceP: Variant);
var
  props: TStringList;
  i: integer;
  PropInfo: PPropInfo;
  obj, obj2: TObject;
  cds: TClientDataSet;
begin
  if nomeTabela=null then
    raise Exception.Create('Nenhuma tabela selecionada!');

  limpaCampos;

  if indiceP <> null then
  try
    props := TStringList.Create;

    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';
    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select * from ' + nomeTabela + ' where ' + cIndice + ' = ' + IntToStr(indiceP));
    cds.Open;

    if cds.Eof then
      raise Exception.Create('Não foi possível encontrar o registro.(' + nomeTabela + '-' + IntToStr(indiceP) + ')');

    Reflection.GetPropertyNames(Self.ClassType, props);
    for i := 0 to props.Count - 1 do
    begin
      if cds.FindField(props.Strings[i]) <> nil then
      begin
        propInfo := GetPropInfo(Self, props.Strings[i]);

        if cds.FieldByName(props.Strings[i]).IsNull then
        begin
          if PropInfo.PropType^.Kind = tkInteger then
            SetPropValue(Self, props.Strings[i], 0)
          else if PropInfo.PropType^.Kind = tkFloat then
            SetPropValue(Self, props.Strings[i], 0)
          else
          begin
            if ((propInfo.PropType^.Kind = tkClass) and (GetObjectPropClass(propInfo).ClassParent = TCadastro)) then
            begin
              obj := GetObjectPropClass(propInfo).Create;
              obj2 := TCadastro(obj).Create;
              SetObjectProp(Self, props.Strings[i], obj2);
            end
            else
              SetPropValue(Self, props.Strings[i], null);
          end;
        end
        else
        begin
          if ((propInfo.PropType^.Kind = tkClass) and (GetObjectPropClass(propInfo).ClassParent = TCadastro)) then
            SetObjectProp(Self, props.Strings[i], (TCadastro(GetObjectPropClass(propInfo).Create).Create(cds.FieldByName(props.Strings[i]).Value)))
          else
            SetPropValue(Self, props.Strings[i], cds.FieldByName(props.Strings[i]).Value);
        end;
      end;
    end;
  finally
    FreeAndNil(cds);
    FreeAndNil(props);
  end;

  _vIndice := indiceP;
end;

function TCadastro.buscaTabela: TTabela;
var
  i: Integer;
begin
  for i := Low(tabelas) to High(tabelas) do
  begin
    if (tabelas[i].nomeTabela = _tabela) then
      break;
    if (tabelas[i].nomeTabela = '') then
      break;
  end;
  result := tabelas[i];
end;

procedure TCadastro.setTabela(const tabelaP: String);
var
  tabela: ^TTabela;
  i: Integer;
  cds: TClientDataSet;
begin
  _tabela := tabelaP;

  try
    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';

    for i := Low(tabelas) to High(tabelas) do
    begin
      if (tabelas[i].nomeTabela = _tabela) then
        break;
      if (tabelas[i].nomeTabela = '') then
        break;
    end;

    limpaCampos;

    tabela := @tabelas[i];

    if (tabela.nomeTabela <> '') then
      exit;

    tabela.nomeTabela := tabelaP;

    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select * from information_schema.tables where table_schema=' + QuotedStr(DM.DefaultSchema) + ' and table_name = ' + QuotedStr(tabelaP));
    cds.Open;

    if cds.Eof then
      raise Exception.create('Esta tabela não existe no banco de dados, favor verificar. (' + tabelaP + ')');

    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select * from information_schema.columns where table_schema=' + QuotedStr(DM.DefaultSchema) + ' and table_name = ' + QuotedStr(tabelaP) + ' order by ordinal_position');
    cds.Open;

    while not cds.Eof do
    begin
      tabela.campos[cds.FieldByName('ordinal_position').AsInteger].nome := cds.FieldByName('column_name').Value;
      tabela.campos[cds.FieldByName('ordinal_position').AsInteger].tipo := TtipoCampo(GetEnumValue(TypeInfo(TtipoCampo),'_' + cds.FieldByName('data_type').Value)) ;

      if not cds.FieldByName('character_maximum_length').IsNull then
        tabela.campos[cds.FieldByName('ordinal_position').AsInteger].tamanho := cds.FieldByName('character_maximum_length').Value;

      if not cds.FieldByName('numeric_precision').IsNull then
        tabela.campos[cds.FieldByName('ordinal_position').AsInteger].tamanho := cds.FieldByName('numeric_precision').Value;

      if not cds.FieldByName('numeric_scale').IsNull then
        tabela.campos[cds.FieldByName('ordinal_position').AsInteger].precisao := cds.FieldByName('numeric_scale').Value;

      tabela.campos[cds.FieldByName('ordinal_position').AsInteger].valor := null;
      tabela.campos[cds.FieldByName('ordinal_position').AsInteger].temValorDefault := not cds.FieldByName('column_default').IsNull;
      tabela.campos[cds.FieldByName('ordinal_position').AsInteger].permiteNulo := cds.FieldByName('is_nullable').Value = 'YES';
      cds.Next;
    end;

    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select constraint_name from information_schema.table_constraints' +
      ' where table_schema=' + QuotedStr(DM.DefaultSchema) + ' and table_name=' + QuotedStr(nomeTabela) + ' and constraint_type=''UNIQUE''');
    cds.Open;

    SetLength(tabela.constraints, cds.RecordCount);

    while not cds.Eof do
    begin
      tabela.constraints[cds.RecNo - 1].nome := cds.FieldByName('constraint_name').AsString;
      tabela.constraints[cds.RecNo - 1].campos := TStringList.Create;
      cds.Next;
    end;

    for i := Low(tabela.constraints) to High(tabela.constraints) do
    begin
      cds.Close;
      DM.SCServer.AppServer.CriaLista ('select column_name' +
        ' from information_schema.KEY_COLUMN_USAGE where table_schema=' + QuotedStr(DM.DefaultSchema) + ' and table_name=' + QuotedStr(nomeTabela) +
        ' and constraint_name=' + QuotedStr(tabela.constraints[i].nome) + ' order by ordinal_position');
      cds.Open;

      while not cds.Eof do
      begin
        tabela.constraints[i].campos.Add(cds.FieldByName('column_name').Value);
        cds.Next;
      end;
    end;
  finally
    FreeAndNil(cds);
  end;
end;

procedure TCadastro.verificaIndice;
var
  filtros: TStringList;
  sql: String;
  i, j: Integer;
  cds: TClientDataSet;
begin
  try
    filtros := TStringList.Create;

    for i := Low(buscaTabela.constraints) to High(buscaTabela.constraints) do
    begin
      sql := 'select ' + cIndice + ' from ' + nomeTabela + ' where ';
      for j := 0 to buscaTabela.constraints[i].campos.Count - 1 do
      begin
        if j > 0 then
          sql := sql + ' and ';
        sql := sql + buscaTabela.constraints[i].campos[j] + '=' + buscaValor(buscaCampo(buscaTabela.constraints[i].campos[j]));
      end;
      filtros.Add(sql);
    end;

    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';

    for i := 0 to filtros.Count - 1 do
    begin
      cds.Close;
      DM.SCServer.AppServer.CriaLista(filtros[i]);
      cds.Open;

      if cds.RecordCount = 0 then
        continue;

      if cds.FieldByName(cIndice).Value <> vIndice then
        raise Exception.Create('Já existe um registro no banco de dados com estas informações.');
    end;
  finally
    FreeAndNil(cds);
    FreeAndNil(filtros);
  end;

end;

procedure TCadastro.setLista(lista: String);
begin
  _cLista := TStringList.Create;
  _cLista.CommaText := lista;
end;

procedure TCadastro.limpaCampos;
var
  propType: PPTypeInfo;
  propInfo: PPropInfo;
  props: TStringList;
  i: integer;
  tabela: ^TTabela;
begin
  props := TStringList.Create;

  Reflection.GetPropertyNames(Self.ClassType, props);
  for i := 1 to props.Count - 1 do
  begin
    propInfo := GetPropInfo(Self, props.Strings[i]);
    propType := propInfo.PropType;

    if propType^.Kind = tkInteger then
      SetPropValue(Self, props.Strings[i], 0)
    else if propType^.Kind = tkFloat then
      SetPropValue(Self, props.Strings[i], 0)
    else if propType^.Kind = tkString then
      SetPropValue(Self, props.Strings[i], '')
    else if propType^.Kind = tkLString then
      SetPropValue(Self, props.Strings[i], '')
    else if propType^.Kind = tkWString then
      SetPropValue(Self, props.Strings[i], '')
    else if propType^.Kind = tkVariant then
      SetPropValue(Self, props.Strings[i], null)
    else if ((propType^.Kind = tkClass) and (GetObjectPropClass(propInfo).ClassParent = TCadastro)) then
    begin
      GetObjectProp(Self, props.Strings[i]).Free;
      SetObjectProp(Self, props.Strings[i], nil);
    end
    else if (propType^.Kind = tkEnumeration) then
      SetPropValue(Self, props.Strings[i], 0)
    else
      raise Exception.Create('Tipo não esperado: ' + propType^.Name + '(' + GetEnumName(TypeInfo(TTypeKind), Integer(propType^.Kind)) + ')');
  end;

  props.Free;

  for i := Low(tabelas) to High(tabelas) do
  begin
    if (tabelas[i].nomeTabela = _tabela) then
      break;
    if (tabelas[i].nomeTabela = '') then
      break;
  end;
  tabela := @tabelas[i];

  for i := Low(tabela.campos) to High(tabela.campos) do
    tabela.campos[i].valor := null;
  _vIndice := null;
end;

function TCadastro.buscaCampo(nomeCampo: String): TCampo;
var
  i, indice: Integer;
begin
  indice := -1;
  for i := Low(buscaTabela.campos)+1 to High(buscaTabela.campos) do
  begin
    if buscaTabela.campos[i].nome = '' then
      break;

    if buscaTabela.campos[i].nome = nomeCampo then
    begin
      indice := i;
      break;
    end;
  end;
  if indice < 0 then
    raise Exception.Create('Não foi possível encontrar o campo ' + QuotedStr(nomeCampo));
  result := buscaTabela.campos[indice];
end;

function TCadastro.buscaValor(campo: TCampo): String;
begin
       if campo.valor = null       then result := 'null'
  else if campo.tipo = _varchar    then result := QuotedStr(campo.valor)
  else if campo.tipo = _bigint     then result := FloatToStr(campo.valor, fs)
  else if campo.tipo = _longtext   then result := QuotedStr(campo.valor)
  else if campo.tipo = _double     then result := FloatToStr(campo.valor, fs)
  else if campo.tipo = _datetime   then
  begin
    if campo.valor = 0 then result := 'null'
    else result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', campo.valor));
  end
  else if campo.tipo = _int        then result := FloatToStr(campo.valor, fs)
  else if campo.tipo = _timestamp  then
  begin
    if campo.valor = 0 then result := 'null'
    else result := QuotedStr(FormatDateTime('yyyy-mm-dd hh:nn:ss', campo.valor));
  end
  else if campo.tipo = _text       then result := QuotedStr(campo.valor)
  else if campo.tipo = _decimal    then result := FloatToStr(campo.valor, fs)
  else if campo.tipo = _time       then
  begin
    if campo.valor = 0 then result := 'null'
    else result := QuotedStr(FormatDateTime('hh:nn:ss', campo.valor));
  end
  else if campo.tipo = _blob       then result := QuotedStr(campo.valor)
  else if campo.tipo = _char       then result := QuotedStr(campo.valor)
  else if campo.tipo = _date       then
  begin
    if campo.valor = 0 then result := 'null'
    else result := QuotedStr(FormatDateTime('yyyy-mm-dd', campo.valor));
  end
  else if campo.tipo = _mediumblob then result := QuotedStr(campo.valor);
end;

class function TCadastro.montaLista(complemento: String): TClientDataSet;
var
  obj: TCadastro;
  cds: TClientDataSet;
begin
  try
    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';
    obj := Create;

    if obj._sqlLista = '' then
      obj._sqlLista := 'select * from ' + obj.nomeTabela;

    cds.Close;
    DM.SCServer.AppServer.CriaLista (obj._sqlLista + ' ' + complemento);
    cds.Open;
    result := cds;
  finally
    FreeAndNil(obj);
  end;
end;

class function TCadastro.listaPersonalizada(sql: String): TClientDataSet;
var
  cds: TClientDataSet;
begin
  try
    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';

    cds.Close;
    DM.SCServer.AppServer.CriaLista (sql);
    cds.Open;
    result := cds;
  finally
  end;
end;

function TCadastro.carregaObservacao: String;
begin

end;

function TCadastro.getCampoNome: String;
begin
  result := buscaTabela.campos[1].nome;
end;

procedure TCadastro.carregaEmpresa;
begin
  if GetPropInfo(Self, 'empresa_sq') <> nil then
    SetObjectProp(Self, 'empresa_sq', TEmpresa.Create(empresaSelecionada.vIndice));
end;

destructor TCadastro.Destroy;
begin
//  FreeAndNil(cds);
  FreeAndNil(_cLista);
  inherited;
end;

procedure TCadastro.setvIndice(const Value: Variant);
begin
  _vIndice := Value;
end;

procedure TCadastro.verificaNulidade;
var
  i: Integer;
  tabela: ^TTabela;
begin
  for i := Low(tabelas) to High(tabelas) do
  begin
    if (tabelas[i].nomeTabela = _tabela) then
      break;
    if (tabelas[i].nomeTabela = '') then
      break;
  end;
  tabela := @tabelas[i];

  for i := Low(tabela.campos)+1 to High(tabela.campos) do
  begin
    if tabela.campos[i].nome = '' then
      break
    else
    begin
      if (not tabela.campos[i].permiteNulo) then
      begin
        if GetPropInfo(Self, tabela.campos[i].nome) <> nil then
        begin
          if (buscaValor(tabela.campos[i]) = 'null') then
            raise Exception.Create('Não é possível inserir ''Null'' no campo ' + tabela.campos[i].nome + '.');
        end;
      end;
    end;
  end;
end;

procedure TCadastro.Setcarregado(const Value: Boolean);
begin
  Fcarregado := Value;
end;

end.
