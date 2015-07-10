unit UCadastrarFormModelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls,
  Mask, RzEdit, RzDBCmbo;

type
  TFCadastrarFormModelos = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TRzEdit;
    edDescricao: TRzEdit;
    Label5: TLabel;
    dblModelo: TRzDBLookupComboBox;
    dsListaModelos: TDataSource;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormModelos: TFCadastrarFormModelos;

implementation

uses UDM, UCadastrarListaModelos, UCadastrarListaComum, Modelo;

{$R *.dfm}

procedure TFCadastrarFormModelos.bbOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;

  with ((Owner as TFCadastrarListaComum).registro as TModelo) do
  begin
    codigo_modelo := edCodigo.Text;
    descricao_modelo := edDescricao.Text;
    modelo_sq_pai := dblModelo.KeyValue;
    salvar;
  end;

  ModalResult := mrOk;
end;

procedure TFCadastrarFormModelos.FormCreate(Sender: TObject);
var
  complemento: String;
begin
  inherited;
  complemento := 'order by descricao_modelo';
  with TFCadastrarListaComum(Owner) do
  begin
    if not novo then
    with TModelo(registro) do
    begin
      edCodigo.Text      := codigo_modelo;
      edDescricao.Text   := descricao_modelo;
      dblModelo.KeyValue := modelo_sq_pai;
      complemento := 'where modelo_sq <> ' + VarToStr(vIndice) + ' ' + complemento;
    end;
  end;
  dsListaModelos.DataSet := TModelo.listaRegistros(complemento);
end;

procedure TFCadastrarFormModelos.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaModelos.DataSet.Close;
end;

end.
