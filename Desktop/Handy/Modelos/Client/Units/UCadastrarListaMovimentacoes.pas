unit UCadastrarListaMovimentacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, StdCtrls, Buttons, ToolWin, ComCtrls,
  Grids, DBGrids, DBClient;

type
  TFCadastrarListaMovimentacoes = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaMovimentacoes: TFCadastrarListaMovimentacoes;

implementation

uses UDM, UCadastrarFormMovimentacoes, UDMLista, UImportaEntradas;

{$R *.dfm}

procedure TFCadastrarListaMovimentacoes.FormCreate(Sender: TObject);
begin
  Tabela := 'tbKardexPecas';
  Sql := 'SELECT K.*, P.CODIGO_PECA, P.DESCRICAO_PECA , M.CODIGO_MODELO, M.DESCRICAO_MODELO ' +
         'FROM KARDEX K LEFT JOIN PECAS P ON (K.PECA_SQ = P.PECA_SQ) LEFT JOIN MODELOS M ON (K.MODELO_SQ = M.MODELO_SQ) ';
  SetLength (cLista, 9);
  SetLength (nLista, 9);
  SetLength (cIndice, 1);

  cIndice := 'KARDEX_SQ';

  cLista[0] := 'CODIGO_PECA';
  cLista[1] := 'DESCRICAO_PECA';
  cLista[2] := 'CODIGO_MODELO';
  cLista[3] := 'DESCRICAO_MODELO';
  cLista[4] := 'DATA';
  cLista[5] := 'TIPO_MOV';
  cLista[6] := 'NFISCAL';
  cLista[7] := 'QTDE';
  cLista[8] := 'VALOR';

  nLista[0] := 'Código da Peça';
  nLista[1] := 'Descrição da Peça';
  nLista[2] := 'Código do Modelo';
  nLista[3] := 'Descrição do Modelo';
  nLista[4] := 'Data';
  nLista[5] := 'Tipo';
  nLista[6] := 'Nota Fiscal';
  nLista[7] := 'Quantidade';
  nLista[8] := 'Valor';
  inherited;
end;

procedure TFCadastrarListaMovimentacoes.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormMovimentacoes, FCadastrarFormMovimentacoes);
  DMLista.cdsListaPecas.Open;
  FCadastrarFormMovimentacoes.bbOk.Enabled := novo;
  if not novo then
  begin
    FCadastrarFormMovimentacoes.edNfiscal.Text := cdsLista.FieldByName('NFISCAL').Text;
    FCadastrarFormMovimentacoes.edData.Text    := cdsLista.FieldByName('DATA').Text;
    FCadastrarFormMovimentacoes.edQtde.Text    := cdsLista.FieldByName('QTDE').Text;
    FCadastrarFormMovimentacoes.edValor.Text   := cdsLista.FieldByName('VALOR').Text;
    FCadastrarFormMovimentacoes.mmNrSerie.Text := cdsLista.FieldByName('NR_SERIE').Text;
    FCadastrarFormMovimentacoes.rgTipoMov.ItemIndex := cdsLista.FieldByName('TIPO_ITEM').AsInteger - 1;
    if cdsLista.FieldByName('TIPO_MOV').Text = 'E'
      then FCadastrarFormMovimentacoes.rgTipoMov.ItemIndex := 0
      else FCadastrarFormMovimentacoes.rgTipoMov.ItemIndex := 1;
    if cdsLista.FieldByName('TIPO_ITEM').AsInteger = 1 then
    begin
      FCadastrarFormMovimentacoes.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('PECA_SQ').Text;
      FCadastrarFormMovimentacoes.DBLookupComboBox2.KeyValue := cdsLista.FieldByName('PECA_SQ').Text;
    end
    else begin
      FCadastrarFormMovimentacoes.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('MODELO_SQ').Text;
      FCadastrarFormMovimentacoes.DBLookupComboBox2.KeyValue := cdsLista.FieldByName('MODELO_SQ').Text;
    end;
  end
  else
  begin
    FCadastrarFormMovimentacoes.edData.Text    := FormatDateTime ('dd/mm/yyyy hh:nn:ss', Date + Time);
    FCadastrarFormMovimentacoes.rgTipoMov.ItemIndex := 0;
    FCadastrarFormMovimentacoes.rgTipoItem.ItemIndex := 0;
  end;
  if FCadastrarFormMovimentacoes.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('KARDEX', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormMovimentacoes.rgTipoItem.ItemIndex,
        FCadastrarFormMovimentacoes.DBLookupComboBox1.KeyValue,
        FCadastrarFormMovimentacoes.rgTipoMov.ItemIndex,
        FCadastrarFormMovimentacoes.edQtde.Text,
        StrToDateTime (FCadastrarFormMovimentacoes.edData.Text),
        StrtoInt (FCadastrarFormMovimentacoes.edNfiscal.Text),
        StrtoFloat (FCadastrarFormMovimentacoes.edValor.Text),
        DM.useq,
        FCadastrarFormMovimentacoes.mmNrSerie.Text]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

procedure TFCadastrarListaMovimentacoes.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 112 then // F1
    Key := 0;
  inherited;
end;

procedure TFCadastrarListaMovimentacoes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  FImportaEntradas.ShowModal;
end;

end.
