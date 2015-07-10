unit HistoricoAlteracao;

interface

uses Cadastro, DBClient, Usuario, SysUtils, Empresa;

type
  THistoricoAlteracao = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _nome_tabela: String;
    _chave_sq: Integer;
    _tipo_alteracao: Integer;
    _usuario_sq: TUsuario;
    _data_alteracao: TDateTime;
    _observacao: String;
  protected
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property nome_tabela: String        read _nome_tabela write _nome_tabela;
    property chave_sq: Integer          read _chave_sq write _chave_sq;
    property tipo_alteracao: Integer    read _tipo_alteracao write _tipo_alteracao;
    property usuario_sq: TUsuario       read _usuario_sq write _usuario_sq;
    property data_alteracao: TDateTime  read _data_alteracao write _data_alteracao;
    property observacao: String         read _observacao write _observacao;
  public
    constructor Create(); override;
    destructor Destroy; override;
    class function listaRegistros(tabela: String; chave: Integer): TClientDataSet;
  end;

implementation

uses Classes;

{ THistoricoAlteracao }

constructor THistoricoAlteracao.Create;
begin
  setTabela('hist_alteracoes');
  setLista('"Tabela=nome_tabela"');
end;

destructor THistoricoAlteracao.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_usuario_sq);
  inherited;
end;

class function THistoricoAlteracao.listaRegistros(tabela: String;
  chave: Integer): TClientDataSet;
var
  sql: String;
begin
  sql := 'SELECT HA.*, U.NOME_USUARIO' +
    ' ,case ha.tipo_alteracao when 0 then ''Inclusão'' else ''Alteração'' end as DescricaoTipo' +
    ' FROM hist_alteracoes HA' +
    ' LEFT OUTER JOIN usuarios U ON (U.USUARIO_SQ = HA.USUARIO_SQ)' +
    ' where NOME_TABELA = ''' + Tabela + ''' AND chave_sq = ' + inttostr(chave) +
    ' order by data_Alteracao desc';
  result := listaPersonalizada(sql);
end;

end.


