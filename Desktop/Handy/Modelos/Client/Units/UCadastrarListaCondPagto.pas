unit UCadastrarListaCondPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaCondPagto = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaCondPagto: TFCadastrarListaCondPagto;

implementation

uses UDM, UCadastrarFormCondPagto, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaCondPagto.FormCreate(Sender: TObject);
begin
  Tabela := 'tbCond_Pagto';
  Sql := 'SELECT * FROM COND_PAGTO';
  SetLength (cLista, 13);
  SetLength (nLista, 13);
  SetLength (cIndice, 1);

  cIndice := 'COND_PAGTO_SQ';

  cLista[0]  := 'CODIGO_COND_PAGTO';
  cLista[1]  := 'DESCRICAO_COND_PAGTO';
  cLista[2]  := 'PARCELAS';
  cLista[3]  := 'D00';
  cLista[4]  := 'D01';
  cLista[5]  := 'D02';
  cLista[6]  := 'D03';
  cLista[7]  := 'D04';
  cLista[8]  := 'D05';
  cLista[9]  := 'D06';
  cLista[10] := 'D07';
  cLista[11] := 'D08';
  cLista[12] := 'D09';

  nLista[0]  := 'Código';
  nLista[1]  := 'Descrição';
  nLista[2]  := 'Parcelas';
  nLista[3]  := 'P1';
  nLista[4]  := 'P2';
  nLista[5]  := 'P3';
  nLista[6]  := 'P4';
  nLista[7]  := 'P5';
  nLista[8]  := 'P6';
  nLista[9]  := 'P7';
  nLista[10] := 'P8';
  nLista[11] := 'P9';
  nLista[12] := 'P10';
  inherited;
end;

procedure TFCadastrarListaCondPagto.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormCondPagto, FCadastrarFormCondPagto);
  if not novo then
  begin
    FCadastrarFormCondPagto.edCodigo.Text    := cdsLista.FieldByName('CODIGO_COND_PAGTO').Text;
    FCadastrarFormCondPagto.edDescricao.Text := cdsLista.FieldByName('DESCRICAO_COND_PAGTO').Text;
    FCadastrarFormCondPagto.edParcelas.Text  := cdsLista.FieldByName('PARCELAS').Text;
    FCadastrarFormCondPagto.edD00.Text       := cdsLista.FieldByName('D00').Text;
    FCadastrarFormCondPagto.edD01.Text       := cdsLista.FieldByName('D01').Text;
    FCadastrarFormCondPagto.edD02.Text       := cdsLista.FieldByName('D02').Text;
    FCadastrarFormCondPagto.edD03.Text       := cdsLista.FieldByName('D03').Text;
    FCadastrarFormCondPagto.edD04.Text       := cdsLista.FieldByName('D04').Text;
    FCadastrarFormCondPagto.edD05.Text       := cdsLista.FieldByName('D05').Text;
    FCadastrarFormCondPagto.edD06.Text       := cdsLista.FieldByName('D06').Text;
    FCadastrarFormCondPagto.edD07.Text       := cdsLista.FieldByName('D07').Text;
    FCadastrarFormCondPagto.edD08.Text       := cdsLista.FieldByName('D08').Text;
    FCadastrarFormCondPagto.edD09.Text       := cdsLista.FieldByName('D09').Text;
  end
  else begin
    DMLista.SCServerLista.Open;
    FCadastrarFormCondPagto.edCodigo.Text := InttoStr(DMLista.SCServerLista.AppServer.Maximo ('COND_PAGTO', 'CODIGO_COND_PAGTO')+1);
  end;
  if FCadastrarFormCondPagto.ShowModal = mrOk then
  try
    if FCadastrarFormCondPagto.edD00.Text = '' then
      FCadastrarFormCondPagto.edD00.Text := '0';
    if FCadastrarFormCondPagto.edD01.Text = '' then
      FCadastrarFormCondPagto.edD01.Text := '0';
    if FCadastrarFormCondPagto.edD02.Text = '' then
      FCadastrarFormCondPagto.edD02.Text := '0';
    if FCadastrarFormCondPagto.edD03.Text = '' then
      FCadastrarFormCondPagto.edD03.Text := '0';
    if FCadastrarFormCondPagto.edD04.Text = '' then
      FCadastrarFormCondPagto.edD04.Text := '0';
    if FCadastrarFormCondPagto.edD05.Text = '' then
      FCadastrarFormCondPagto.edD05.Text := '0';
    if FCadastrarFormCondPagto.edD06.Text = '' then
      FCadastrarFormCondPagto.edD06.Text := '0';
    if FCadastrarFormCondPagto.edD07.Text = '' then
      FCadastrarFormCondPagto.edD07.Text := '0';
    if FCadastrarFormCondPagto.edD08.Text = '' then
      FCadastrarFormCondPagto.edD08.Text := '0';
    if FCadastrarFormCondPagto.edD09.Text = '' then
      FCadastrarFormCondPagto.edD09.Text := '0';
      
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('COND_PAGTO', Novo, Valores,
      VarArrayOf ([FCadastrarFormCondPagto.edCodigo.Text, FCadastrarFormCondPagto.edDescricao.Text,
        FCadastrarFormCondPagto.edParcelas.Text, FCadastrarFormCondPagto.edD00.Text,
        FCadastrarFormCondPagto.edD01.Text, FCadastrarFormCondPagto.edD02.Text,
        FCadastrarFormCondPagto.edD03.Text, FCadastrarFormCondPagto.edD04.Text,
        FCadastrarFormCondPagto.edD05.Text, FCadastrarFormCondPagto.edD06.Text,
        FCadastrarFormCondPagto.edD07.Text, FCadastrarFormCondPagto.edD08.Text,
        FCadastrarFormCondPagto.edD09.Text]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
