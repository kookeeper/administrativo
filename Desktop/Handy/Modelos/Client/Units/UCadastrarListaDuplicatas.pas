unit UCadastrarListaDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, StdCtrls, Buttons, ToolWin, ComCtrls,
  Grids, DBGrids, DBClient;

type
  TFCadastrarListaDuplicatas = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaDuplicatas: TFCadastrarListaDuplicatas;

implementation

uses UDM, UCadastrarFormDuplicatas, UDMLista;

{$R *.dfm}

procedure TFCadastrarListaDuplicatas.FormCreate(Sender: TObject);
begin
  Tabela := 'tbDuplicatas';
  Sql := 'SELECT D.*, N.NUMERO_NFISCAL FROM DUPLICATAS D ' +
         'LEFT OUTER JOIN NFISCAIS N ON (N.NFISCAL_SQ = D.NFISCAL_SQ)';
  Filtro1 := 'Where SEQ_DUPLICATA = 0';

  SetLength (cLista, 9);
  SetLength (nLista, 9);
  SetLength (cIndice, 1);

  cIndice := 'DUPLICATA_SQ';

  cLista[0] := 'NUMERO_DUPLICATA';
  cLista[1] := 'ITEM_DUPLICATA';
  cLista[2] := 'SEQ_DUPLICATA';
  cLista[3] := 'NUMERO_NFISCAL';
  cLista[4] := 'VALOR_DUPLICATA';
  cLista[5] := 'DTEMISSAO_DUPLICATA';
  cLista[6] := 'DTVENCTO_DUPLICATA';
  cLista[7] := 'DTPGTO_DUPLICATA';
  cLista[8] := 'VALORPG_DUPLICATA';

  nLista[0] := 'Duplicata';
  nLista[1] := 'Item';
  nLista[2] := 'Sequencia';
  nLista[3] := 'Nfiscal';
  nLista[4] := 'Valor';
  nLista[5] := 'Dt Emissão';
  nLista[6] := 'Dt Vencto';
  nLista[7] := 'Dt Pagto';
  nLista[8] := 'Valor Pg';
  inherited;
end;

procedure TFCadastrarListaDuplicatas.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormDuplicatas, FCadastrarFormDuplicatas);
  if not novo then
  begin
    FCadastrarFormDuplicatas.edNumero.Text    := cdsLista.FieldByName('NUMERO_DUPLICATA').Text;
    FCadastrarFormDuplicatas.edItem.Text      := cdsLista.FieldByName('ITEM_DUPLICATA').Text;
    FCadastrarFormDuplicatas.edNfiscal.Text   := cdsLista.FieldByName('NUMERO_NFISCAL').Text;
    FCadastrarFormDuplicatas.edValor.Text     := cdsLista.FieldByName('VALOR_DUPLICATA').Text;
    FCadastrarFormDuplicatas.edDtEmissao.Text := cdsLista.FieldByName('DTEMISSAO_DUPLICATA').Text;
    FCadastrarFormDuplicatas.edDtVencto.Text  := cdsLista.FieldByName('DTVENCTO_DUPLICATA').Text;
    FCadastrarFormDuplicatas.edDtPagto.Text   := cdsLista.FieldByName('DTPGTO_DUPLICATA').Text;
    FCadastrarFormDuplicatas.edValorPg.Text   := cdsLista.FieldByName('VALORPG_DUPLICATA').Text;
  end;
  if FCadastrarFormDuplicatas.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('DUPLICATAS', Novo, Valores,
      VarArrayOf ([FCadastrarFormDuplicatas.edNumero.Text, FCadastrarFormDuplicatas.edItem.Text,
        FCadastrarFormDuplicatas.edNfiscal.Tag, StrtoFloat (FCadastrarFormDuplicatas.edValor.Text),
        StrtoDate (FCadastrarFormDuplicatas.edDtEmissao.Text), StrtoDate (FCadastrarFormDuplicatas.edDtVencto.Text),
        StrtoDate (FCadastrarFormDuplicatas.edDtPagto.Text), StrtoFloat (FCadastrarFormDuplicatas.edValorPg.Text)]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
