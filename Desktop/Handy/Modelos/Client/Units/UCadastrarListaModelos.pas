unit UCadastrarListaModelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids;

type
  TFCadastrarListaModelos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaModelos: TFCadastrarListaModelos;

implementation

uses UCadastrarFormModelos, UDM;

{$R *.dfm}

procedure TFCadastrarListaModelos.FormCreate(Sender: TObject);
begin
  Tabela := 'tbModelos';
  Sql := 'SELECT * FROM MODELOS';
  SetLength (cLista, 3);
  SetLength (nLista, 3);
  SetLength (cIndice, 1);

  cIndice := 'MODELO_SQ';

  cLista[0] := 'CODIGO_MODELO';
  cLista[1] := 'DESCRICAO_MODELO';
  cLista[2] := 'PRECO_UNIT_MODELO';

  nLista[0] := 'Código';
  nLista[1] := 'Descrição';
  nLista[2] := 'Preço Unitário';
  inherited;
end;

procedure TFCadastrarListaModelos.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormModelos, FCadastrarFormModelos);
  if not novo then
  begin
    FCadastrarFormModelos.edCodigo.Text      := cdsLista.FieldByName('CODIGO_MODELO').Text;
    FCadastrarFormModelos.edDescricao.Text   := cdsLista.FieldByName('DESCRICAO_MODELO').Text;
    FCadastrarFormModelos.edMarca.Text       := cdsLista.FieldByName('MARCA_MODELO').Text;
    FCadastrarFormModelos.edPreco.Text       := cdsLista.FieldByName('PRECO_UNIT_MODELO').Text;
    FCadastrarFormModelos.edUnidade.Text     := cdsLista.FieldByName('UN_MODELO').Text;
    FCadastrarFormModelos.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('NBM_SQ').VAlue;
  end;
  if FCadastrarFormModelos.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('MODELOS', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormModelos.edCodigo.Text,
        FCadastrarFormModelos.edDescricao.Text,
        FCadastrarFormModelos.edMarca.Text,
        FCadastrarFormModelos.edPreco.Text,
        FCadastrarFormModelos.edUnidade.Text,
        FCadastrarFormModelos.DBLookupComboBox1.KeyValue]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
