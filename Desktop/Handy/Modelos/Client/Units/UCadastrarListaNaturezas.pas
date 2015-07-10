unit UCadastrarListaNaturezas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaNaturezas = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNaturezas: TFCadastrarListaNaturezas;

implementation

uses UDM, UCadastrarFormNaturezas, UDMLista;

{$R *.DFM}

procedure TFCadastrarListaNaturezas.FormCreate(Sender: TObject);
begin
  Tabela := 'tbNaturezas';
  Sql := 'SELECT * FROM NATUREZAS';
  SetLength (cLista, 2);
  SetLength (nLista, 2);
  SetLength (cIndice, 1);

  cIndice := 'NATUREZA_SQ';

  cLista[0] := 'CODIGO_NATUREZA';
  cLista[1] := 'DESCRICAO_NATUREZA';

  nLista[0] := 'Código';
  nLista[1] := 'Descrição';
  inherited;
end;

procedure TFCadastrarListaNaturezas.sbEditarClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  Application.CreateForm (TFCadastrarFormNaturezas, FCadastrarFormNaturezas);
  if not novo then
  begin
    FCadastrarFormNaturezas.edCodigo.Text     := cdsLista.FieldByName('CODIGO_NATUREZA').Text;
    FCadastrarFormNaturezas.edDescricao1.Text := cdsLista.FieldByName('DESCRICAO_NATUREZA').Text;
    FCadastrarFormNaturezas.edDescricao2.Text := cdsLista.FieldByName('DESCRICAO_NATUREZA_NFISCAL').Text;
    FCadastrarFormNaturezas.edCFOP.Text       := cdsLista.FieldByName('CFO').Text;
    FCadastrarFormNaturezas.edICMS.Text       := cdsLista.FieldByName('ALIQ_ICMS').Text;
    FCadastrarFormNaturezas.edIPI.Text        := cdsLista.FieldByName('ALIQ_IPI').Text;

    for i := 0 to FCadastrarFormNaturezas.rgTipo.Items.Count - 1 do
      if cdsLista.FieldByName('TIPO_NFISCAL').AsInteger = StrtoInt (Copy (FCadastrarFormNaturezas.rgTipo.Items[i], 1, 2)) then
        FCadastrarFormNaturezas.rgTipo.ItemIndex := i;

    if cdsLista.FieldByName('ENT_SAI').Text = 'E' then
      FCadastrarFormNaturezas.rgEntSai.ItemIndex := 0 else
      FCadastrarFormNaturezas.rgEntSai.ItemIndex := 1;
    FCadastrarFormNaturezas.mmObservacao.Lines.Text := cdsLista.FieldByName('OBSERVACAO').AsString;
    FCadastrarFormNaturezas.cbICMS.Checked    := cdsLista.FieldByName('ISENCAO_ICMS').Text = 'S';
    FCadastrarFormNaturezas.cbIPI.Checked     := cdsLista.FieldByName('ISENCAO_IPI').Text = 'S';
    FCadastrarFormNaturezas.edUF01.Text       := cdsLista.FieldByName('UF01').Text;
    FCadastrarFormNaturezas.edUF02.Text       := cdsLista.FieldByName('UF02').Text;
    FCadastrarFormNaturezas.edUF03.Text       := cdsLista.FieldByName('UF03').Text;
    FCadastrarFormNaturezas.edUF04.Text       := cdsLista.FieldByName('UF04').Text;
    FCadastrarFormNaturezas.edUF05.Text       := cdsLista.FieldByName('UF05').Text;
    FCadastrarFormNaturezas.edUF06.Text       := cdsLista.FieldByName('UF06').Text;
    FCadastrarFormNaturezas.edUF07.Text       := cdsLista.FieldByName('UF07').Text;
    FCadastrarFormNaturezas.edUF08.Text       := cdsLista.FieldByName('UF08').Text;
    FCadastrarFormNaturezas.edUF09.Text       := cdsLista.FieldByName('UF09').Text;
    FCadastrarFormNaturezas.edUF10.Text       := cdsLista.FieldByName('UF10').Text;
    FCadastrarFormNaturezas.edUF11.Text       := cdsLista.FieldByName('UF11').Text;
    FCadastrarFormNaturezas.edUF12.Text       := cdsLista.FieldByName('UF12').Text;
    FCadastrarFormNaturezas.edUF13.Text       := cdsLista.FieldByName('UF13').Text;
    FCadastrarFormNaturezas.edUF14.Text       := cdsLista.FieldByName('UF14').Text;
    FCadastrarFormNaturezas.edUF15.Text       := cdsLista.FieldByName('UF15').Text;
    FCadastrarFormNaturezas.edUF16.Text       := cdsLista.FieldByName('UF16').Text;
    FCadastrarFormNaturezas.edUF17.Text       := cdsLista.FieldByName('UF17').Text;
    FCadastrarFormNaturezas.edUF18.Text       := cdsLista.FieldByName('UF18').Text;
    FCadastrarFormNaturezas.edUF19.Text       := cdsLista.FieldByName('UF19').Text;
    FCadastrarFormNaturezas.edUF20.Text       := cdsLista.FieldByName('UF20').Text;
    FCadastrarFormNaturezas.edUF21.Text       := cdsLista.FieldByName('UF21').Text;
    FCadastrarFormNaturezas.edUF22.Text       := cdsLista.FieldByName('UF22').Text;
    FCadastrarFormNaturezas.edUF23.Text       := cdsLista.FieldByName('UF23').Text;
    FCadastrarFormNaturezas.edUF24.Text       := cdsLista.FieldByName('UF24').Text;
    FCadastrarFormNaturezas.edUF25.Text       := cdsLista.FieldByName('UF25').Text;
    FCadastrarFormNaturezas.edUF26.Text       := cdsLista.FieldByName('UF26').Text;
    FCadastrarFormNaturezas.edUF27.Text       := cdsLista.FieldByName('UF27').Text;
    FCadastrarFormNaturezas.edUF28.Text       := cdsLista.FieldByName('UF28').Text;
    FCadastrarFormNaturezas.edUF29.Text       := cdsLista.FieldByName('UF29').Text;
    FCadastrarFormNaturezas.edUF30.Text       := cdsLista.FieldByName('UF30').Text;
  end
  else begin
    FCadastrarFormNaturezas.rgTipo.ItemIndex := 0;
    FCadastrarFormNaturezas.rgEntSai.ItemIndex := 0;
    DMLista.SCServerLista.Open;
    FCadastrarFormNaturezas.edCodigo.Text := InttoStr(DMLista.SCServerLista.AppServer.Maximo ('NATUREZAS', 'CODIGO_NATUREZA')+1);
//    DMLista.SCServerLista.Close;
  end;
  if FCadastrarFormNaturezas.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('NATUREZAS', Novo, Valores,
      VarArrayOf ([FCadastrarFormNaturezas.edCodigo.Text, FCadastrarFormNaturezas.edDescricao1.Text,
        FCadastrarFormNaturezas.edDescricao2.Text, FCadastrarFormNaturezas.edCFOP.Text,
        StrtoFloat (FCadastrarFormNaturezas.edICMS.Text), StrtoFloat (FCadastrarFormNaturezas.edIPI.Text),
        Copy (FCadastrarFormNaturezas.rgTipo.Items[FCadastrarFormNaturezas.rgTipo.ItemIndex], 1, 2),
        FCadastrarFormNaturezas.rgEntSai.ItemIndex, FCadastrarFormNaturezas.mmObservacao.Text,
        FCadastrarFormNaturezas.cbICMS.Checked, FCadastrarFormNaturezas.cbIPI.Checked,
        FCadastrarFormNaturezas.estado]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

end.
