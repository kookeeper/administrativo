unit _Cadastro;

interface

uses SysUtils, Controls, UDM, Dialogs, Classes, DBClient;

type
  TCampo = record
    Nome: String;
    Tipo: (FInteger, FDouble, FString, FBoolean, FDateTime, FDate, FTime);
    Tamanho: Double;
  end;

  TCadastro_ = class(TObject)
  protected
    sqlUpdate, FsqlLista: String;
    Ftabela: String;
    FvIndice: Integer;
    FcIndice: String;
    FcLista: TStringList;
    Campos: TList;

    procedure SetcIndice(const Value: String);
    procedure Settabela(const Value: String);
    procedure verificaIndice(); dynamic;
    procedure gravaHistorico(observacao: String='');
    procedure limpaCampos(); virtual; abstract;
    procedure limpaCampos2();
    function salvar(sql: String; Observacao: String=''): Boolean;
    procedure SetvIndice(const Value: Integer); virtual; abstract;
    procedure listaRegistros;
    procedure carregaRegistro(const Value: Integer);
  private
  public
    cdsLista: TClientDataSet;
    procedure apagar(confirmado: Boolean=false);
    procedure lista;
    property vIndice: Integer read FvIndice write SetvIndice;
    property cIndice: String read FcIndice write SetcIndice;
    property tabela: String read Ftabela write Settabela;
    property cLista: TStringList read FcLista;
    property sqlLista: String read FsqlLista;
  end;

  {$M+}

implementation

uses Forms, ComCtrls, UMainMenu, Reflection, TypInfo, Variants;

{ TCadastro }

procedure TCadastro_.gravaHistorico(observacao: String);
var
  sql: String;
  tipoAlteracao: Integer;
begin
  if FvIndice=0 then tipoAlteracao := 0
                else TipoAlteracao := 1;

  sql :='INSERT INTO hist_alteracoes (' +
          'NOME_TABELA, CHAVE_SQ, ' +
          'TIPO_ALTERACAO, USUARIO_SQ, ' +
          'DATA_ALTERACAO, OBSERVACAO) ' +
          'VALUES (' +
          QuotedStr('Vendedores') + ', ' +
          QuotedStr(InttoStr(FvIndice)) + ', ' +
          QuotedStr(InttoStr(tipoAlteracao)) + ', ' +
          QuotedStr(InttoStr(DM.useq)) + ', ' +
          QuotedStr(FormatDateTime ('yyyy-mm-dd hh:nn:ss', Date+Time)) + ', ' +
          QuotedStr(observacao) + ')';

  DM.SCServer.AppServer.ExecSQL(sql);
end;

function TCadastro_.salvar(sql: String; Observacao: String): Boolean;
begin
  try
    try
      verificaIndice;
    except
      on E: Exception do
      begin
        ShowMessage(e.Message);
        Result := false;
        Exit;
      end;
    end;

    DM.SCServer.AppServer.ExecSQL(sql);
    gravaHistorico(Observacao);
    result := true;
  except
    on E: Exception do
    begin
      Result := false;
      Showmessage ('Erro ao gravar Registro: ' + e.Message);
      DM.EnviarEmail (ClassName, 'GRAVAR', E.Message + chr(13) + 'Sql: ' + sql, FvIndice=0);
    end;
  end;
end;

procedure TCadastro_.apagar;
var
  sql, Mensagem: String;
begin
  if (confirmado) or (MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes) then
  try
    sql := 'DELETE FROM ' + Tabela + ' WHERE ' + FcIndice + ' = ' + IntToStr(FvIndice);
    DM.SCServer.AppServer.ExecSQL(sql);
    gravaHistorico;
  except
    on E: Exception do
    begin
      Showmessage ('Erro ao apagar registro: ' + E.Message);
      DM.EnviarEmail (Tabela, 'APAGAR', Mensagem, FvIndice=0);
    end;
  end;
end;

procedure TCadastro_.Settabela(const Value: String);
begin
  Ftabela := Value;
end;

procedure TCadastro_.SetcIndice(const Value: String);
begin
  FcIndice := Value;  
end;

procedure TCadastro_.verificaIndice;
begin

end;

procedure TCadastro_.limpaCampos2;
var
  propType: PPTypeInfo;
  props: TStringList;
  i: integer;
begin
  props := TStringList.Create;
  Reflection.GetPropertyNames(Self.ClassType, props);
  for i := 2 to props.Count - 1 do
  begin
    propType := GetPropInfo(Self, props.Strings[i]).PropType;

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
    else raise Exception.Create('Tipo não esperado: ' + propType^.Name);
  end;
end;

procedure TCadastro_.listaRegistros;
begin
  if cdsLista = nil then
  begin
    cdsLista := TClientDataSet.Create(DM);
    cdsLista.RemoteServer := DM.SCServer;
    cdsLista.ProviderName := 'dspLista';
  end;

  cdsLista.Close;
  DM.SCServer.AppServer.CriaLista ('select * from ' + tabela);
  cdsLista.Open;
end;

procedure TCadastro_.carregaRegistro(const Value: Integer);
var
  props: TStringList;
  i: integer;
begin
  FvIndice := Value;

  limpaCampos2;

  listaRegistros;

  if Value <> 0 then
  begin
    cdsLista.Locate(cIndice, Value, []);

    props := TStringList.Create;
    Reflection.GetPropertyNames(Self.ClassType, props);
    for i := 2 to props.Count - 1 do
      SetPropValue(Self, props.Strings[i], cdsLista.FieldByName(props.Strings[i]).Value);
  end;

  cdsLista.Close;
end;

procedure TCadastro_.lista;
begin
  if cdsLista = nil then
  begin
    cdsLista := TClientDataSet.Create(DM);
    cdsLista.RemoteServer := DM.SCServer;
    cdsLista.ProviderName := 'dspLista';
  end;

  cdsLista.Close;
  DM.SCServer.AppServer.CriaLista (FsqlLista);
  cdsLista.Open;
end;

end.
