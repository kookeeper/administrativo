unit UCadastrarListaTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaTransportadoras = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaTransportadoras: TFCadastrarListaTransportadoras;

implementation

uses UDM, UCadastrarFormTransportadoras, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaTransportadoras.FormCreate(Sender: TObject);
begin
  Tabela := 'tbTransportadoras';
  Sql := 'SELECT * FROM TRANSPORTADORAS';
  SetLength (cLista, 2);
  SetLength (nLista, 2);
  SetLength (cIndice, 1);

  cIndice := 'TRANSPORTADORA_SQ';

  cLista[0] := 'CODIGO_TRANSPORTADORA';
  cLista[1] := 'NOME_TRANSPORTADORA';

  nLista[0] := 'Código';
  nLista[1] := 'Nome';
  inherited;
end;

procedure TFCadastrarListaTransportadoras.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormTransportadoras, FCadastrarFormTransportadoras);
  if not novo then
  begin
    FCadastrarFormTransportadoras.edCodigo.Text    := cdsLista.FieldByName('CODIGO_TRANSPORTADORA').AsString;
    FCadastrarFormTransportadoras.edNome.Text      := cdsLista.FieldByName('NOME_TRANSPORTADORA').AsString;
    FCadastrarFormTransportadoras.edInscricao.Text := cdsLista.FieldByName('INSCR_ESTADUAL').AsString;
    FCadastrarFormTransportadoras.edEndereco.Text  := cdsLista.FieldByName('ENDERECO_TRANSPORTADORA').AsString;
    FCadastrarFormTransportadoras.edMunicipio.Text := cdsLista.FieldByName('MUNICIPIO_TRANSPORTADORA').AsString;
    FCadastrarFormTransportadoras.cbEstado.Text    := cdsLista.FieldByName('ESTADO_TRANSPORTADORA').AsString;
    FCadastrarFormTransportadoras.edDDDFone.Text   := cdsLista.FieldByName('DDD_FONE').AsString;
    FCadastrarFormTransportadoras.edFone.Text      := cdsLista.FieldByName('NUMERO_FONE').AsString;
    FCadastrarFormTransportadoras.edComplFone.Text := cdsLista.FieldByName('COMPL_FONE').AsString;
  end;
  if FCadastrarFormTransportadoras.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('TRANSPORTADORAS', Novo, Valores,
      VarArrayOf ([FCadastrarFormTransportadoras.edCodigo.Text, FCadastrarFormTransportadoras.edNome.Text,
        FCadastrarFormTransportadoras.edEndereco.Text, FCadastrarFormTransportadoras.edMunicipio.Text,
        FCadastrarFormTransportadoras.edInscricao.Text, FCadastrarFormTransportadoras.cbEstado.Text,
        FCadastrarFormTransportadoras.edDDDFone.Text, FCadastrarFormTransportadoras.edFone.Text,
        FCadastrarFormTransportadoras.edComplFone.Text]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
