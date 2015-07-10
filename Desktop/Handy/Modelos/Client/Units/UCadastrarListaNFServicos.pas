unit UCadastrarListaNFServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids;

type
  TFCadastrarListaNFServicos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNFServicos: TFCadastrarListaNFServicos;

implementation

uses UCadastrarFormNFServicos, UDM, UDMLista;

{$R *.dfm}

procedure TFCadastrarListaNFServicos.FormCreate(Sender: TObject);
begin
  Tabela := 'tbNFServicos';
  Sql := 'SELECT NF.*, C.NOME_CLIENTE FROM NF_SERVICOS NF ' +
         'LEFT OUTER JOIN CLIENTES C ON (C.CLIENTE_SQ = NF.CLIENTE_SQ)';
  SetLength (cLista, 3);
  SetLength (nLista, 3);
  SetLength (cIndice, 1);

  cIndice := 'NF_SERVICO_SQ';

  cLista[0] := 'NUMERO_NF_SERVICO';
  cLista[1] := 'DATA_NF_SERVICO';
  cLista[2] := 'NOME_CLIENTE';

  nLista[0] := 'Número';
  nLista[1] := 'Data';
  nLista[2] := 'Cliente';
  inherited;
end;

procedure TFCadastrarListaNFServicos.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormNFServicos, FCadastrarFormNFServicos);
  DMLista.cdsListaCLientes.Open;
  if not novo then
  begin
    FCadastrarFormNFServicos.edNumero.Text  := cdsLista.FieldByName('NUMERO_NF_SERVICO').Text;
    FCadastrarFormNFServicos.edData.Text    := cdsLista.FieldByName('DATA_NF_SERVICO').Text;
    FCadastrarFormNFServicos.edTotal.Text   := cdsLista.FieldByName('TTL_NF_SERVICO').Text;
    FCadastrarFormNFServicos.edAliqISS.Text := cdsLista.FieldByName('ALIQ_ISS_NF_SERVICO').Text;
    FCadastrarFormNFServicos.edVlrISS.Text  := cdsLista.FieldByName('VLR_ISS_NF_SERVICO').Text;
    FCadastrarFormNFServicos.dblCliente.KeyValue := cdsLista.FieldByName('CLIENTE_SQ').Value;
  end else
  begin
     FCadastrarFormNFServicos.edAliqISS.Text := FloattoStr (DM.aliq_iss);
  end;
  if FCadastrarFormNFServicos.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('NF_SERVICOS', Novo, Valores,
      VarArrayOf ([
      StrtoInt (FCadastrarFormNFServicos.edNumero.Text),
      StrtoDate (FCadastrarFormNFServicos.edData.Text),
      FCadastrarFormNFServicos.dblCliente.KeyValue,
      StrtoFloat (FCadastrarFormNFServicos.edTotal.Text),
      StrtoFloat (FCadastrarFormNFServicos.edAliqISS.Text),
      StrtoFloat (FCadastrarFormNFServicos.edVlrISS.Text)]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
