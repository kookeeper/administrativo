unit UCadastrarFormClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFCadastrarFormClassificacao = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edCodigo: TRzEdit;
    edMinimo: TRzNumericEdit;
    edMaximo: TRzNumericEdit;
    edMeses: TRzNumericEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormClassificacao: TFCadastrarFormClassificacao;

implementation

uses UDM, Classificacao, UCadastrarListaComum, DBClient;

{$R *.dfm}

procedure TFCadastrarFormClassificacao.bbOkClick(Sender: TObject);
var
  lista: TClientDataSet;
begin
  inherited;
  lista := TClassificacao.listaRegistros('order by codigo_classificacao');
  try
    while not lista.Eof do
    begin
      if lista.FieldByName('codigo_classificacao').Value <> edCodigo.Text then
        if (edMinimo.Value >= lista.FieldByName('limite_minimo').Value) and
           (edMinimo.Value <= lista.FieldByName('limite_maximo').Value) then
        raise Exception.Create('Limite Mínimo em conflito com a Classificação ' + lista.FieldByName('codigo_classificacao').Value)
        else if (edMaximo.Value >= lista.FieldByName('limite_minimo').Value) and
                (edMaximo.Value <= lista.FieldByName('LIMITE_MAXIMO').Value) then
        raise Exception.Create('Limite Máximo em conflito com a Classificação ' + lista.FieldByName('CODIGO_CLASSIFICACAO').Value)
        else if (edMinimo.Value <= lista.FieldByName('LIMITE_MINIMO').Value) and
                (edMaximo.Value >= lista.FieldByName('LIMITE_MAXIMO').Value) then
        raise Exception.Create('Limite Mínimo e Máximo em conflito com a Classificação ' + lista.FieldByName('CODIGO_CLASSIFICACAO').Value);
      lista.Next;
    end;

    With ((Owner as TFCadastrarListaComum).registro as TClassificacao) do
    begin
      codigo_classificacao := edCodigo.Text;
      limite_minimo        := edMinimo.Value;
      limite_maximo        := edMaximo.Value;
      meses_bonus          := edMeses.IntValue;
      salvar;
    end;
  except
    on E : Exception do
    begin
      Showmessage (E.Message);
      ModalResult := mrNone;
    end;
  end;
end;

procedure TFCadastrarFormClassificacao.FormCreate(Sender: TObject);
begin
  inherited;
  if not (Owner as TFCadastrarListaComum).novo then
  With ((Owner as TFCadastrarListaComum).registro as TClassificacao) do
  begin
    edCodigo.Text    := codigo_classificacao;
    edMinimo.Value   := limite_minimo;
    edMaximo.Value   := limite_maximo;
    edMeses.IntValue := meses_bonus;
  end;
end;

end.
