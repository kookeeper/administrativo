unit Classificacao;

interface

uses Variants, SysUtils, Classes, Cadastro, UDM, DB, DBClient, Dialogs, Empresa;

type
  TClassificacao = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_classificacao: String;
    _limite_minimo: Double;
    _limite_maximo: Double;
    _meses_bonus: Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_classificacao : String  read _codigo_classificacao write _codigo_classificacao;
    property limite_minimo        : Double  read _limite_minimo        write _limite_minimo       ;
    property limite_maximo        : Double  read _limite_maximo        write _limite_maximo       ;
    property meses_bonus          : Integer read _meses_bonus          write _meses_bonus         ;
  public
    constructor Create; override;
    destructor Destroy; override;
    class procedure AtualizaClassificacao();
  end;

implementation

uses Cliente;

{ TClassificacao }

class procedure TClassificacao.AtualizaClassificacao();
{
var
  Faturamento: Real;
  i1, i2, aa, mm, Meses, AnoMes: Integer;
  Muda: Boolean;
  listaCliente, listaNota: TClientDataSet;
  cliente: TCliente;
  classificacao: TClassificacao;
  sql: String;
}
begin
{
  aa := StrtoInt (FormatDateTime('yyyy', Date));
  mm := StrtoInt (FormatDateTime('mm', Date));
  if mm = 1 then
  begin
    aa := aa-1;
    mm := 12;
  end else
    dec (mm);

  AnoMes := aa*100+mm;
  
  Muda := False;

  listaCliente := TCliente.listaRegistros();

  While not listaCliente.Eof do
  begin
    sql := 'select EXTRACT(YEAR_MONTH FROM n.dtemissao_nfiscal) as anomes, n.cliente_sq, sum(n.vlr_produtos) as faturamento, cl.limite_minimo, cl.limite_maximo, cl.meses_bonus' +
      ' from nfiscais n' +
      ' left outer join naturezas     na on (na.natureza_sq      = n.natureza_sq)' +
      ' left outer join clientes      c  on (c.cliente_sq        = n.cliente_sq)' +
      ' left outer join classificacao cl on (cl.classificacao_sq = c.classificacao_sq)' +
      ' where na.tipo_nfiscal = 0' +
      ' and n.cancelada <> ''S''' +
      ' and n.cliente_sq = ' + listaCliente.FieldByName ('CLIENTE_SQ').AsString +
      ' group by anomes';

    listaNota := listaPersonalizada(sql);

    if (listaNota.Locate('anomes', AnoMes, [])) then
      Faturamento := Int (listaNota.FieldByName('FATURAMENTO').AsFloat) else
      Faturamento := 0;
    if listaNota.FieldByName('LIMITE_MAXIMO').AsFloat < Faturamento then
      Muda := True
    else if listaNota.FieldByName('LIMITE_MINIMO').AsFloat > Faturamento then
    begin
      Meses := listaNota.FieldByName('MESES_BONUS').AsInteger;
      Muda := True;
      aa := StrtoInt (FloatToStr (Int (AnoMes/100)));
      mm := AnoMes - aa * 100;
      for i1 := 1 to Meses do
      begin
        i2 := mm - i1;
        if i2 <= 0 then
          i2 := (aa - 1) * 100 + i2 + 12
        else
          i2 := aa * 100 + i2;
        if listaNota.Locate('ANOMES', i2, []) then
        begin
          if listaNota.FieldByName('LIMITE_MINIMO').AsFloat < listaNota.FieldByName('FATURAMENTO').AsFloat then
            Muda := False;
          if Faturamento < listaNota.FieldByName('FATURAMENTO').AsFloat then
            Faturamento := Int (listaNota.FieldByName('FATURAMENTO').AsFloat);
        end;
      end;
    end;
    if Muda then
    begin
      classificacao := TClassificacao.CreateFiltro('classificacao.limite_minimo <= ' + FloattoStr (Faturamento) +
        ' and classificacao.limite_maximo >= ' + FloattoStr (Faturamento));
      cliente := TCliente.Create(listaCliente.FieldByName('cliente_sq').AsInteger);

      cliente.classificacao_sq := classificacao;
      cliente.salvar;
    end;
  listaCliente.Next;
  end;

  empresaSelecionada.ultima_classificacao := Date;
  empresaSelecionada.salvar;

  Showmessage ('Classificação Concluída!');
}
end;

constructor TClassificacao.Create;
begin
  setTabela('classificacao');
  setLista('"Código=CODIGO_CLASSIFICACAO",' +
    '"Limite Mínimo=LIMITE_MINIMO",' +
    '"Limite Máximo=LIMITE_MAXIMO",' +
    '"Meses de Bonus=MESES_BONUS"');
end;

destructor TClassificacao.Destroy;
begin
  FreeAndNil(_empresa_sq);
  inherited;
end;

end.

