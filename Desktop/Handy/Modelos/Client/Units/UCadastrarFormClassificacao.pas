unit UCadastrarFormClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls;

type
  TFCadastrarFormClassificacao = class(TFCadastrarFormComum)
    Label1: TLabel;
    edCodigo: TEdit;
    Label3: TLabel;
    edMinimo: TEdit;
    Label4: TLabel;
    edMaximo: TEdit;
    Label5: TLabel;
    edMeses: TEdit;
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormClassificacao: TFCadastrarFormClassificacao;

implementation

uses UDMLista;

{$R *.dfm}

procedure TFCadastrarFormClassificacao.bbOkClick(Sender: TObject);
begin
  inherited;
  DMLista.cdsListaClassificacao.Open;
  DMLista.cdsListaClassificacao.First;
  While not DMLista.cdsListaClassificacao.Eof do
  begin
    if DMLista.cdsListaClassificacaoCODIGO_CLASSIFICACAO.AsString <> edCodigo.Text then
    try
      if (StrtoFloat (edMinimo.Text) >= DMLista.cdsListaClassificacaoLIMITE_MINIMO.AsFloat) and
         (StrtoFloat (edMinimo.Text) <= DMLista.cdsListaClassificacaoLIMITE_MAXIMO.AsFloat) then
      raise Exception.Create('Limite Mínimo em conflito com a Classificação ' + DMLista.cdsListaClassificacaoCODIGO_CLASSIFICACAO.AsString)
      else if (StrtoFloat (edMaximo.Text) >= DMLista.cdsListaClassificacaoLIMITE_MINIMO.AsFloat) and
              (StrtoFloat (edMaximo.Text) <= DMLista.cdsListaClassificacaoLIMITE_MAXIMO.AsFloat) then
      raise Exception.Create('Limite Máximo em conflito com a Classificação ' + DMLista.cdsListaClassificacaoCODIGO_CLASSIFICACAO.AsString)
      else if (StrtoFloat (edMinimo.Text) <= DMLista.cdsListaClassificacaoLIMITE_MINIMO.AsFloat) and
              (StrtoFloat (edMaximo.Text) >= DMLista.cdsListaClassificacaoLIMITE_MAXIMO.AsFloat) then
      raise Exception.Create('Limite Mínimo e Máximo em conflito com a Classificação ' + DMLista.cdsListaClassificacaoCODIGO_CLASSIFICACAO.AsString);
    except
      on E : Exception do
      begin
        Showmessage (E.Message);
        ModalResult := mrNone;
        DMLista.cdsListaClassificacao.Last;
      end;
    end;
    DMLista.cdsListaClassificacao.Next;
  end;
  DMLista.cdsListaClassificacao.Close;
end;

end.
