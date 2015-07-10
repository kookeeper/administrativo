unit Agenda;

interface

uses Variants, SysUtils, Classes, Cadastro, UDM, DB, DBClient, Usuario,
    Vendedor, Cliente, Controls, Empresa;

type
  TAgenda = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _data_agenda: TDateTime;
    _vendedor_sq: TVendedor;
    _cliente_sq: TCliente;
    _observacao: String;
    _realizado: String;
    _usuario_pai_sq: TUsuario;
  protected
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property data_agenda: TDateTime read _data_agenda write _data_agenda;
    property vendedor_sq: TVendedor read _vendedor_sq write _vendedor_sq;
    property cliente_sq: TCliente read _cliente_sq write _cliente_sq;
    property observacao: String read _observacao write _observacao;
    property realizado: String read _realizado write _realizado;
    property usuario_pai_sq: TUsuario read _usuario_pai_sq write _usuario_pai_sq;
  public
    constructor Create(); override;
    destructor Destroy; override;

    class function listaVendedor(vendedor_sq: Integer; data_agenda: TDate; realizado: String): TClientDataSet;
  end;

implementation

{ TAgenda }

constructor TAgenda.Create;
begin
  setTabela('agenda');
  setLista(
      '"Vendedor=NOME_VENDEDOR"' 
    + ',"Data=DATA_AGENDA"'
    + ',"Cliente=NOME_CLIENTE"'
    + ',"Realizado?=REALIZADO"'
    + ',"Cadastrado por=NOME_VENDEDOR"'
    );
  sqlLista := 'SELECT A.*, NOME_CLIENTE, SUBSTRING(NOME_VENDEDOR, 1, 20) as NOME_VENDEDOR, U.NOME_USUARIO ' +
         'FROM agenda A ' +
         'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = A.CLIENTE_SQ) ' +
         'LEFT OUTER JOIN vendedores V ON (V.VENDEDOR_SQ = A.VENDEDOR_SQ) ' +
         'LEFT OUTER JOIN usuarios U ON (U.USUARIO_SQ = A.USUARIO_PAI_SQ)';

{
  Ftabela   := 'Agenda';
  FsqlLista := 'SELECT A.*, NOME_CLIENTE, SUBSTRING(NOME_VENDEDOR, 1, 20) as NOME_VENDEDOR, U.NOME_USUARIO ' +
         'FROM agenda A ' +
         'LEFT OUTER JOIN clientes C ON (C.CLIENTE_SQ = A.CLIENTE_SQ) ' +
         'LEFT OUTER JOIN vendedores V ON (V.VENDEDOR_SQ = A.VENDEDOR_SQ) ' +
         'LEFT OUTER JOIN usuarios U ON (U.USUARIO_SQ = A.USUARIO_PAI_SQ)';
  FcIndice := 'AGENDA_SQ';
  FcLista := TStringList.Create;
  FcLista.CommaText := '"Vendedor=NOME_VENDEDOR",' +
    '"Data=DATA_AGENDA",' +
    '"Cliente=NOME_CLIENTE",' +
    '"Realizado?=REALIZADO",' +
    '"Quem cadastrou=NOME_USUARIO"';
}
end;

destructor TAgenda.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_vendedor_sq);
  FreeAndNil(_cliente_sq);
  FreeAndNil(_usuario_pai_sq);

  inherited;
end;

class function TAgenda.listaVendedor(vendedor_sq: Integer;
  data_agenda: TDate; realizado: String): TClientDataSet;
begin
  result := listaPersonalizada('select a.*, nome_vendedor, nome_cliente ' +
    'from agenda a left outer join vendedores v on (v.vendedor_sq=a.vendedor_sq) ' +
    'left outer join clientes c on (c.cliente_sq=a.cliente_sq) ' +
    'where a.vendedor_sq = ' + IntToStr(vendedor_sq) +
    ' and a.data_agenda > ' + QuotedStr(FormatDateTime('dd/mm/yyyy', data_agenda)) +
    ' and a.realizado <> ' + QuotedStr(realizado));
end;

end.

