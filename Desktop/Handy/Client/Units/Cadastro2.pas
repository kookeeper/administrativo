unit Cadastro2;

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
  end;

  TCadastro2 = class(TObject)
  protected
    procedure gravaHistorico(tipoAlt: Integer; observacao: String='');
    procedure setTabela(const tabelaP: String); dynamic;
    procedure verificaIndice(); dynamic;
    procedure mostraErro(e: Exception; situacao: String);
    function carregaObservacao: String; dynamic;
  private
    cds: TClientDataSet;
    _tabela, _sqlLista: String;
    campos: array[1..50] of TCampo;
    _cLista: TStringList;
    procedure limpaCampos();
    function buscaValor(campo: TCampo): String;
    function buscaCampo(nomeCampo: String): TCampo;
  public
    class function listaRegistros(filtro: String=''): TClientDataSet;
    class function montaLista(filtro: String=''): TClientDataSet;
    procedure apagar(confirmar: Boolean=true);
    procedure salvar(); dynamic;
    procedure setIndice(const indiceP: Variant); dynamic;
    procedure setLista(lista: String);
    constructor Create(indice: Variant); overload; dynamic;
    constructor Create(); overload; virtual; abstract;
    property cIndice: String read campos[1].nome;
    property vIndice: Variant read campos[1].valor;
    property cLista: TStringList read _cLista write _cLista;
    property tabela: String read _tabela;
    property sqlLista: String write _sqlLista;
  end;

implementation

{ TCadastro2 }

procedure TCadastro2.apagar(confirmar: Boolean);
begin
  if (not confirmar) or (MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes) then
  try
    DM.SCServer.AppServer.ExecSQL('delete from ' + tabela + ' where ' + campos[1].nome + ' = ' + IntToStr(campos[1].valor));
    gravaHistorico(1);
  except
    on E: Exception do
      mostraErro(E, 'apagar');
  end;
end;

constructor TCadastro2.Create(indice: Variant);
begin
  Create();
  if indice = 0 then
    indice := null;
  setIndice(indice);
end;

procedure TCadastro2.gravaHistorico(tipoAlt: Integer; observacao: String='');
var
  sql: String;
begin
  sql :='insert into hist_alteracoes (' +
          'nome_tabela, chave_sq, ' +
          'tipo_alteracao, usuario_sq, ' +
          'data_alteracao, observacao) ' +
          'values (' +
          QuotedStr(tabela) + ', ' +
          QuotedStr(InttoStr(campos[1].valor)) + ', ' +
          QuotedStr(InttoStr(tipoAlt)) + ', ' +
          QuotedStr(InttoStr(DM.useq)) + ', ' +
          QuotedStr(FormatDateTime ('yyyy-mm-dd hh:nn:ss', Date+Time)) + ', ' +
          QuotedStr(observacao) + ')';

  DM.SCServer.AppServer.ExecSQL(sql);
end;

class function TCadastro2.listaRegistros(filtro: String=''): TClientDataSet;
var
  obj: TCadastro2;
begin
  obj := Create;

  obj.cds.Close;
  DM.SCServer.AppServer.CriaLista ('select * from ' + obj.tabela + ' ' + filtro);
  obj.cds.Open;
  result := obj.cds;
end;

procedure TCadastro2.mostraErro(e: Exception; situacao: String);
begin
  Showmessage ('Erro ao ' + situacao + ' registro: ' + E.Message);
  DM.EnviarEmail (tabela, situacao, E.Message, campos[1].valor=null);
  raise E;
end;

procedure TCadastro2.salvar;
var
  observacao, sql: String;
  tipoAlt, i: Integer;
  _cds: TClientDataSet;
begin
  try
    observacao := carregaObservacao;

    for i := Low(campos)+1 to High(campos) do
      if campos[i].nome = '' then
        break
      else
        if GetPropInfo(Self, campos[i].nome) <> nil then
        begin
          if ((GetPropInfo(Self, campos[i].nome).PropType^.Kind = tkClass) and (GetObjectPropClass(GetPropInfo(Self, campos[i].nome)).ClassParent = TCadastro2)) then
            campos[i].valor := TCadastro2(GetObjectProp(Self, campos[i].nome)).vIndice
          else
            campos[i].valor := GetPropValue(Self, campos[i].nome);
        end;

    verificaIndice;

    if campos[1].valor = null then
    begin
      tipoAlt := 0;
      sql := 'insert into ' + tabela + ' (';

      for i := Low(campos)+1 to High(campos) do
      begin
        if GetPropInfo(Self, campos[i].nome) <> nil then
        begin
          if i > Low(campos)+1 then
            sql := sql + ', ';

          sql := sql + campos[i].nome;
        end;
      end;

      sql := sql + ') values (';

      for i := Low(campos)+1 to High(campos) do
        if GetPropInfo(Self, campos[i].nome) <> nil then
        begin
          if i > Low(campos)+1 then
            sql := sql + ', ';

            sql := sql + buscaValor(campos[i]);
        end;
      sql := sql + ')';
    end
    else
    begin
      tipoAlt := 1;
      sql := 'update ' + tabela + ' set ';

      for i := Low(campos)+1 to High(campos) do
        if GetPropInfo(Self, campos[i].nome) <> nil then
        begin
          if campos[i].nome = '' then
            break;

          if i > Low(campos)+1 then
            sql := sql + ', ';

          sql := sql + campos[i].nome + '=';

          sql := sql + buscaValor(campos[i]);
        end;

      sql := sql + ' where ' + campos[1].nome + ' = ' + IntToStr(campos[1].valor);
    end;

    DM.SCServer.AppServer.ExecSQL(sql);

    if tipoAlt=0 then
    begin
      _cds := TClientDataSet.Create(DM);
      _cds.RemoteServer := DM.SCServer;
      _cds.ProviderName := 'dspLista';
      _cds.Close;
      DM.SCServer.AppServer.CriaLista('SELECT LAST_INSERT_ID() as CHAVE');
      _cds.Open;
      campos[1].valor := _cds.FieldByName('chave').Value;
    end;

    gravaHistorico(tipoAlt, observacao);
  except
    on E: Exception do
      mostraErro(E, 'gravar');
  end;
end;

procedure TCadastro2.setIndice(const indiceP: Variant);

var
  props: TStringList;
  i: integer;
  PropInfo: PPropInfo;
begin
  if tabela=null then
    raise Exception.Create('Nenhuma tabela selecionada!');

  props := TStringList.Create;

  if indiceP <> null then
  begin
    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select * from ' + tabela + ' where ' + campos[1].nome + ' = ' + IntToStr(indiceP));
    cds.Open;

    if cds.Eof then
      raise Exception.Create('Não foi possível encontrar o registro.');

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
            if ((propInfo.PropType^.Kind = tkClass) and (GetObjectPropClass(propInfo).ClassParent = TCadastro2)) then
              SetObjectProp(Self, props.Strings[i], (TCadastro2(GetObjectPropClass(propInfo).Create).Create))
            else
              SetPropValue(Self, props.Strings[i], null);
          end;
        end
        else
        begin
          if ((propInfo.PropType^.Kind = tkClass) and (GetObjectPropClass(propInfo).ClassParent = TCadastro2)) then
            SetObjectProp(Self, props.Strings[i], (TCadastro2(GetObjectPropClass(propInfo).Create).Create(cds.FieldByName(props.Strings[i]).Value)))
          else
            SetPropValue(Self, props.Strings[i], cds.FieldByName(props.Strings[i]).Value);
        end;
      end;
    end;
  end;
  campos[1].valor := indiceP;
end;

procedure TCadastro2.setTabela(const tabelaP: String);
begin
  if cds = nil then
  begin
    cds := TClientDataSet.Create(DM);
    cds.RemoteServer := DM.SCServer;
    cds.ProviderName := 'dspLista';
  end;

  cds.Close;
  DM.SCServer.AppServer.CriaLista ('select * from information_schema.tables where table_schema=''handy'' and table_name = ' + QuotedStr(tabelaP));
  cds.Open;

  if cds.Eof then
    raise Exception.create('Esta tabela não existe no banco de dados, favor verificar.');

  cds.Close;
  DM.SCServer.AppServer.CriaLista ('select * from information_schema.columns where table_schema=''handy'' and table_name = ' + QuotedStr(tabelaP) + ' order by ordinal_position');
  cds.Open;

  while not cds.Eof do
  begin
    campos[cds.FieldByName('ordinal_position').AsInteger].nome := cds.FieldByName('column_name').Value;
    campos[cds.FieldByName('ordinal_position').AsInteger].tipo := TtipoCampo(GetEnumValue(TypeInfo(TtipoCampo),'_' + cds.FieldByName('data_type').Value)) ;

    if not cds.FieldByName('character_maximum_length').IsNull then
      campos[cds.FieldByName('ordinal_position').AsInteger].tamanho := cds.FieldByName('character_maximum_length').Value;

    if not cds.FieldByName('numeric_precision').IsNull then
      campos[cds.FieldByName('ordinal_position').AsInteger].tamanho := cds.FieldByName('numeric_precision').Value;

    if not cds.FieldByName('numeric_scale').IsNull then
      campos[cds.FieldByName('ordinal_position').AsInteger].precisao := cds.FieldByName('numeric_scale').Value;

    campos[cds.FieldByName('ordinal_position').AsInteger].valor := null;
    cds.Next;
  end;

  _tabela := tabelaP;
  limpaCampos;
end;

procedure TCadastro2.verificaIndice;
var
  filtros, constraints: TStringList;
  sql: String;
  i: Integer;
begin
  filtros := TStringList.Create;
  constraints := TStringList.Create;

  cds.Close;
  DM.SCServer.AppServer.CriaLista ('select constraint_name from information_schema.table_constraints' +
    ' where table_schema=''handy'' and table_name=' + QuotedStr(tabela) + ' and constraint_type=''UNIQUE''');
  cds.Open;

  while not cds.Eof do
  begin
    constraints.Add(cds.FieldByName('constraint_name').AsString);
    cds.Next;
  end;

  for i := 0 to constraints.Count - 1 do
  begin
    cds.Close;
    DM.SCServer.AppServer.CriaLista ('select column_name' +
      ' from information_schema.KEY_COLUMN_USAGE where table_schema=''handy'' and table_name=' + QuotedStr(tabela) +
      ' and constraint_name=' + QuotedStr(constraints[i]) + ' order by ordinal_position');
    cds.Open;

    sql := 'select ' + campos[1].nome + ' from ' + tabela + ' where ';
    while not cds.Eof do
    begin
      if cds.RecNo > 1 then
        sql := sql + ' and ';
      sql := sql + cds.FieldByName('column_name').Value + '=' + buscaValor(buscaCampo(cds.FieldByName('column_name').Value));
      cds.Next;
    end;
    filtros.Add(sql);
  end;

  for i := 0 to filtros.Count - 1 do
  begin
    cds.Close;
    DM.SCServer.AppServer.CriaLista(filtros[i]);
    cds.Open;

    if cds.RecordCount = 0 then
      continue;

    if cds.FieldByName(campos[1].nome).Value <> campos[1].valor then
      raise Exception.Create('Já existe um registro no banco de dados com estas informações.');
  end;

end;

procedure TCadastro2.setLista(lista: String);
begin
  cLista := TStringList.Create;
  cLista.CommaText := lista;
end;

procedure TCadastro2.limpaCampos;
var
  propType: PPTypeInfo;
  propInfo: PPropInfo;
  props: TStringList;
  i: integer;
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
    else if ((propType^.Kind = tkClass) and (GetObjectPropClass(propInfo).ClassParent = TCadastro2)) then
      SetObjectProp(Self, props.Strings[i], nil)
    else
      raise Exception.Create('Tipo não esperado: ' + propType^.Name);
  end;
end;

function TCadastro2.buscaCampo(nomeCampo: String): TCampo;
var
  i, indice: Integer;
begin
  indice := -1;
  for i := Low(campos)+1 to High(campos) do
  begin
    if campos[i].nome = '' then
      break;

    if campos[i].nome = nomeCampo then
    begin
      indice := i;
      break;
    end;
  end;
  if indice < 0 then
    raise Exception.Create('Não foi possível encontrar o campo ' + QuotedStr(nomeCampo));
  result := campos[indice];
end;

function TCadastro2.buscaValor(campo: TCampo): String;
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

class function TCadastro2.montaLista(filtro: String): TClientDataSet;
var
  obj: TCadastro2;
begin
  obj := Create;

  if obj._sqlLista = '' then
    obj._sqlLista := 'select * from ' + obj.tabela;
    
  obj.cds.Close;
  DM.SCServer.AppServer.CriaLista (obj._sqlLista + ' ' + filtro);
  obj.cds.Open;
  result := obj.cds;
end;

function TCadastro2.carregaObservacao: String;
begin

end;

end.
