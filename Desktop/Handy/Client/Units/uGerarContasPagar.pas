unit uGerarContasPagar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, Grids, DBGrids, RzDBGrid, DB, DBClient,
  RzButton;

type
  TFGerarContasPagar = class(TForm)
    Label1: TLabel;
    cbReferencia: TRzComboBox;
    RzDBGrid1: TRzDBGrid;
    cds: TClientDataSet;
    DataSource1: TDataSource;
    bbSalvarTodos: TRzBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure cbReferenciaChange(Sender: TObject);
    procedure bbSalvarTodosClick(Sender: TObject);
  private
    procedure CarregaLancamentos(referencia: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGerarContasPagar: TFGerarContasPagar;

implementation

uses UDM, ContaPagar, Fornecedor;

{$R *.dfm}

procedure TFGerarContasPagar.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  cbReferencia.Clear;

  for i := 0 to 24 do
    cbReferencia.Add(FormatDateTime('MM/yyyy', IncMonth(Date, i)));

end;

procedure TFGerarContasPagar.cbReferenciaChange(Sender: TObject);
begin
  CarregaLancamentos(cbReferencia.Text);
end;

procedure TFGerarContasPagar.CarregaLancamentos(referencia: String);
var
  sql: String;
begin
  Delete(referencia, 3, 1);
  sql := 'select conta_pagar_sq, fornecedor_sq, numero_duplicata, valor_duplicata, dtcadastro_duplicata, dtvencimento_duplicata, observacao, conta_pagar_auto_sq, referencia_auto ' +
         'from contas_pagar ' +
         'where referencia_auto = %d ' +
         'union ' +
         'select null, fornecedor_sq, null, valor, now(), date(concat("%d-%d-", day(data_inicial))), observacao, conta_pagar_auto_sq, %d ' +
         'from contas_pagar_auto ' +
         'where YEAR(data_inicial)*100+MONTH(data_inicial) <= %d ' +
         'and year(date_add(data_inicial, interval parcelas month))*100 + MONTH(date_add(data_inicial, interval parcelas month)) >= %d ';
  sql := Format(sql, [
    StrToInt(Copy(referencia, 3, 4)+Copy(referencia, 1, 2)),
    StrToInt(Copy(referencia, 3, 4)),
    StrToInt(Copy(referencia, 1, 2)),
    StrToInt(Copy(referencia, 3, 4)+Copy(referencia, 1, 2)),
    StrToInt(Copy(referencia, 3, 4)+Copy(referencia, 1, 2)),
    StrToInt(Copy(referencia, 3, 4)+Copy(referencia, 1, 2))
    ]);
                                      
  cds.Close;
  DM.SCServer.AppServer.CriaLista (sql);
  cds.Open;
end;

procedure TFGerarContasPagar.bbSalvarTodosClick(Sender: TObject);
var
  Mensagem: String;
  conta: TContaPagar;
begin
  cds.First;
  Mensagem := '';
  while not cds.Eof do
  begin
    if cds.FieldByName('conta_pagar_sq').AsInteger = 0 then
    begin
      if DM.temIndiceContaPagar(cds.FieldByName('fornecedor_sq').Value, cds.FieldByName('numero_duplicata').Value) > 0 then
        Mensagem := 'Este número de duplicata já existe para este fornecedor.'
      else
      begin
        conta := TContaPagar.Create;
        conta.fornecedor_sq :=          TFornecedor.Create(cds.FieldByName('fornecedor_sq').AsInteger);
        conta.numero_duplicata :=       cds.FieldByName('numero_duplicata').AsString;
        conta.valor_duplicata :=        cds.FieldByName('valor_duplicata').AsFloat;
        conta.dtcadastro_duplicata :=   cds.FieldByName('dtcadastro_duplicata').AsDateTime;
        conta.dtvencimento_duplicata := cds.FieldByName('dtvencimento_duplicata').AsDateTime;
        conta.observacao :=             cds.FieldByName('observacao').AsString;
        conta.conta_pagar_auto_sq :=    cds.FieldByName('conta_pagar_auto_sq').AsInteger;
        conta.referencia_auto :=        cds.FieldByName('referencia_auto').AsInteger;
        conta.salvar;
      end;
{
        Mensagem := DM.SCServer.AppServer.CriaRegistro ('Contas_Pagar', DM.useq, True, IntToStr(0),
          VarArrayOf ([
            cds.FieldByName('fornecedor_sq').AsInteger,
            cds.FieldByName('numero_duplicata').AsInteger,
            cds.FieldByName('valor_duplicata').AsFloat,
            cds.FieldByName('dtcadastro_duplicata').AsDateTime,
            cds.FieldByName('dtvencimento_duplicata').AsDateTime,
            null,
            0,
            0,
            0,
            '',
            null,
            cds.FieldByName('observacao').AsString,
            cds.FieldByName('conta_pagar_auto_sq').AsInteger,
            cds.FieldByName('referencia_auto').AsInteger
            ]));
}
    end;
    if Mensagem <> '' then
    begin
      DM.EnviarEmail ('Contas_Pagar', 'GRAVAR', Mensagem, True);
      raise Exception.Create('Erro ao gravar Registro: ' + Mensagem);
    end;
    cds.Next;
  end;
end;

end.
