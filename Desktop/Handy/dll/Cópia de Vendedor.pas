unit Vendedor;

interface

uses Cadastro, SysUtils, UDM, DB, Variants, Dialogs, Classes, Controls;

type
  TVendedor = class(TCadastro)
    vendedor_sq: Integer;
    codigo_vendedor: Integer;
    nome_vendedor: String;
    pct_comissao_propria: Double;
    pct_comissao_parceria: Double;
    base_comissao: String;
    pct_comissao_desconto: Double;
    obs_comissao_desconto: String;
  protected
    procedure SetvIndice(const Value: Integer); override;
  public
    function save: Boolean;
    constructor Create;
  end;

implementation

{ TVendedor }

constructor TVendedor.Create;
begin
  vendedor_sq := 0;
  codigo_vendedor := 0;
  nome_vendedor := '';
  pct_comissao_propria := 0;
  pct_comissao_parceria := 0;
  base_comissao := '';
  pct_comissao_desconto := 0;
  obs_comissao_desconto := '';
  tabela := 'vendedores';
  cIndice := 'vendedor_sq';
end;

function TVendedor.save: Boolean;
begin
  sql := Format(sql, [
    codigo_vendedor,
    QuotedStr(nome_vendedor),
    QuotedStr(FloatToStr(pct_comissao_propria, DM.fs)),
    QuotedStr(FloatToStr(pct_comissao_parceria, DM.fs)),
    QuotedStr(base_comissao),
    QuotedStr(FloatToStr(pct_comissao_desconto, DM.fs)),
    QuotedStr(obs_comissao_desconto)]);

  result := inherited save;
end;

procedure TVendedor.SetvIndice(const Value: Integer);
begin
  vendedor_sq := Value;
  vIndice := vendedor_sq;

  if Value <> 0 then
  begin
    DM.cdsListaVendedores.Open;
    DM.cdsListaVendedores.Locate('vendedor_sq', Value, []);

    codigo_vendedor       := DM.cdsListaVendedores.FieldByName('codigo_vendedor').AsInteger;
    nome_vendedor         := DM.cdsListaVendedores.FieldByName('nome_vendedor').AsString;
    pct_comissao_propria  := DM.cdsListaVendedores.FieldByName('pct_comissao_propria').AsFloat;
    pct_comissao_parceria := DM.cdsListaVendedores.FieldByName('pct_comissao_parceria').AsFloat;
    base_comissao         := DM.cdsListaVendedores.FieldByName('base_comissao').AsString;
    pct_comissao_desconto := DM.cdsListaVendedores.FieldByName('pct_comissao_desconto').AsFloat;
    obs_comissao_desconto := DM.cdsListaVendedores.FieldByName('obs_comissao_desconto').AsString;

    DM.cdsListaVendedores.Close;
  end;

  if vIndice = 0 then
    sql := 'INSERT INTO vendedores (CODIGO_VENDEDOR, NOME_VENDEDOR, ' +
      'pct_comissao_propria, pct_comissao_parceria, base_comissao, ' +
      'pct_comissao_desconto, obs_comissao_desconto) VALUES (%d, %s, %s, %s, %s, %s, %s)'
  else
    sql := 'UPDATE vendedores SET CODIGO_VENDEDOR = %d, NOME_VENDEDOR = %s, ' +
      'pct_comissao_propria = %s, pct_comissao_parceria = %s, base_comissao = %s, ' +
      'pct_comissao_desconto = %s, obs_comissao_desconto = %s ' +
      'WHERE VENDEDOR_SQ = ' + IntToStr(vIndice);
end;

end.
