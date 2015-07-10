unit UCadastrarListaClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids;

type
  TFCadastrarListaClassificacao = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaClassificacao: TFCadastrarListaClassificacao;

implementation

uses UCadastrarFormClassificacao, UDM;

{$R *.dfm}

procedure TFCadastrarListaClassificacao.FormCreate(Sender: TObject);
begin
  Tabela := 'tbClassificacao';
  Sql := 'SELECT * FROM CLASSIFICACAO';
  SetLength (cLista, 4);
  SetLength (nLista, 4);
  SetLength (cIndice, 1);

  cIndice := 'CLASSIFICACAO_SQ';

  cLista[0] := 'CODIGO_CLASSIFICACAO';
  cLista[1] := 'LIMITE_MINIMO';
  cLista[2] := 'LIMITE_MAXIMO';
  cLista[3] := 'MESES_BONUS';

  nLista[0] := 'Código';
  nLista[1] := 'Limite Mínimo';
  nLista[2] := 'Limite Máximo';
  nLista[3] := 'Meses de Bonus';
  inherited;
end;

procedure TFCadastrarListaClassificacao.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormClassificacao, FCadastrarFormClassificacao);
  if not novo then
  begin
    FCadastrarFormClassificacao.edCodigo.Text     := cdsLista.FieldByName('CODIGO_CLASSIFICACAO').AsString;
    FCadastrarFormClassificacao.edMinimo.Text     := cdsLista.FieldByName('LIMITE_MINIMO').AsString;
    FCadastrarFormClassificacao.edMaximo.Text     := cdsLista.FieldByName('LIMITE_MAXIMO').AsString;
    FCadastrarFormClassificacao.edMeses.Text      := cdsLista.FieldByName('MESES_BONUS').AsString;
  end;
  if FCadastrarFormClassificacao.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('CLASSIFICACAO', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormClassificacao.edCodigo.Text,
        StrtoFloat (FCadastrarFormClassificacao.edMinimo.Text),
        StrtoFloat (FCadastrarFormClassificacao.edMaximo.Text),
        StrtoInt (FCadastrarFormClassificacao.edMeses.Text)]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
