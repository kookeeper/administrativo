unit UCadastrarListaNCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaNCM = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNCM: TFCadastrarListaNCM;

implementation

uses UDM, UCadastrarFormNCM, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaNCM.FormCreate(Sender: TObject);
begin
  Tabela := 'tbNBM';
  Sql := 'SELECT * FROM NBM';
  SetLength (cLista, 1);
  SetLength (nLista, 1);
  SetLength (cIndice, 1);

  cIndice := 'NBM_SQ';

  cLista[0] := 'CODIGO_NBM';

  nLista[0] := 'Código';
  inherited;
end;

procedure TFCadastrarListaNCM.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormNCM, FCadastrarFormNCM);
  if not novo then
  begin
    FCadastrarFormNCM.edCodigo.Text := cdsLista.FieldByName('CODIGO_NBM').Text;
    FCadastrarFormNCM.edICMS.Text   := cdsLista.FieldByName('ALIQ_ICMS').Text;
    FCadastrarFormNCM.edIPI.Text    := cdsLista.FieldByName('ALIQ_IPI').Text;
  end;
  if FCadastrarFormNCM.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('NBM', Novo, Valores,
      VarArrayOf ([FCadastrarFormNCM.edCodigo.Text, StrtoFloat (FCadastrarFormNCM.edICMS.Text),
        StrtoFloat (FCadastrarFormNCM.edIPI.Text)]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
