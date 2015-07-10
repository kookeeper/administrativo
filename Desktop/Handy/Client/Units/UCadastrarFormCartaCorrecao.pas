unit UCadastrarFormCartaCorrecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, RzEdit, Mask,
  DBCtrls, RzDBCmbo, DB;

type
  TFCadastrarFormCartaCorrecao = class(TFCadastrarFormComum)
    Label1: TLabel;
    edChave: TRzEdit;
    Label2: TLabel;
    edCnpj: TRzEdit;
    Label4: TLabel;
    Label5: TLabel;
    edDataEvento: TRzEdit;
    Label6: TLabel;
    Label7: TLabel;
    edNFe: TRzNumericEdit;
    edSequenciaEvento: TRzNumericEdit;
    mmCorrecao: TRzMemo;
    Label8: TLabel;
    dblEstado: TRzDBLookupComboBox;
    dsListaEstados: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure edNFeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormCartaCorrecao: TFCadastrarFormCartaCorrecao;

implementation

uses CartaCorrecao, UCadastrarListaComum, Nfiscal, Empresa, Estado;

{$R *.dfm}

procedure TFCadastrarFormCartaCorrecao.FormCreate(Sender: TObject);
begin
  inherited;

  dsListaEstados.DataSet := TEstado.listaRegistros('order by codigo_estado');

  with TFCadastrarListaComum(Owner) do
  begin
    edNFe.ReadOnly := not novo;
    if not novo then
    begin
      with TCartaCorrecao(registro) do
      begin
        edNFe.OnChange := nil;
        edNFe.IntValue := nfiscal_sq.numero_nfe;
        edChave.Text := chave;
        dblEstado.KeyValue := cod_orgao;
        edCnpj.Text := cnpj;
        if (dh_evento > 0) then
          edDataEvento.Text := FormatDateTime('dd/mm/yyyy hh:nn:ss', dh_evento);
        edSequenciaEvento.IntValue := n_seq_evento;
        mmCorrecao.Lines.Text := correcao;
      end;
    end
    else begin
      edCnpj.Text := empresaSelecionada.codigo_empresa;
    end;
  end;
end;

procedure TFCadastrarFormCartaCorrecao.bbOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;
  if (edChave.Text = '') then
    raise Exception.Create('Escolha uma NFe válida.');

  with TFCadastrarListaComum(Owner) do
  with TCartaCorrecao(registro) do
  begin
    nfiscal_sq   := TNfiscal.CreateNFe(edNFe.IntValue);
    chave        := edChave.Text;
    cod_orgao    := dblEstado.KeyValue;
    cnpj         := edCnpj.Text;
    n_seq_evento := edSequenciaEvento.IntValue;
    correcao     := mmCorrecao.Lines.GetText;
    salvar;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormCartaCorrecao.edNFeChange(Sender: TObject);
var
  nfiscal: TNfiscal;
begin
  inherited;
  try
    nfiscal := TNfiscal.CreateNFe(edNFe.IntValue);
    edChave.Text := Copy(nfiscal.nfe_chave, 4, 44);
    edSequenciaEvento.IntValue := TCartaCorrecao.ProximaSequencia(edNFe.IntValue);
  except
    edChave.Text := '';
    edSequenciaEvento.IntValue := 0;
  end;
end;

end.
