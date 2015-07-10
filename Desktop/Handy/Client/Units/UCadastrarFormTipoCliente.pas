unit UCadastrarFormTipoCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFCadastrarFormTipoCliente = class(TFCadastrarFormComum)
    Label2: TLabel;
    edDescricao: TRzEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormTipoCliente: TFCadastrarFormTipoCliente;

implementation

uses TipoCliente, UCadastrarListaComum;

{$R *.dfm}

procedure TFCadastrarFormTipoCliente.bbOkClick(Sender: TObject);
begin
  inherited;
  With ((Owner as TFCadastrarListaComum).registro as TTipoCliente) do
  begin
    descricao_tipo := edDescricao.Text;
    salvar;
  end;
end;

procedure TFCadastrarFormTipoCliente.FormCreate(Sender: TObject);
begin
  inherited;
  if not (Owner as TFCadastrarListaComum).novo then
  begin
    edDescricao.Text := ((Owner as TFCadastrarListaComum).registro as TTipoCliente).descricao_tipo;
  end;
end;

end.
