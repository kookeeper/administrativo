unit UCadastrarFormLinha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit,
  RzButton, RzRadChk;

type
  TFCadastrarFormLinha = class(TFCadastrarFormComum)
    Label2: TLabel;
    edDescricao: TRzEdit;
    cbExclusiva: TRzCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormLinha: TFCadastrarFormLinha;

implementation

uses UCadastrarListaComum, Linha, StrUtils;

{$R *.dfm}

procedure TFCadastrarFormLinha.FormCreate(Sender: TObject);
begin
  inherited;
  with Owner as TFCadastrarListaComum do
  if not novo then
  with registro as TLinha do
  begin
    edDescricao.Text    := descricao_linha;
    cbExclusiva.Checked := exclusiva = 'S';
  end;
end;

procedure TFCadastrarFormLinha.bbOkClick(Sender: TObject);
begin
  inherited;
  with Owner as TFCadastrarListaComum do
  with registro as TLinha do
  begin
    descricao_linha := edDescricao.Text;
    exclusiva       := IfThen(cbExclusiva.Checked, 'S', 'N');
    salvar;
  end;
end;

end.
