unit UCadastrarFormCondPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls;

type
  TFCadastrarFormCondPagto = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edParcelas: TEdit;
    edD00: TEdit;
    edD01: TEdit;
    edD02: TEdit;
    edD03: TEdit;
    edD04: TEdit;
    edD05: TEdit;
    edD06: TEdit;
    edD07: TEdit;
    edD08: TEdit;
    edD09: TEdit;
    Label4: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormCondPagto: TFCadastrarFormCondPagto;

implementation

uses UDM;

{$R *.DFM}

procedure TFCadastrarFormCondPagto.bbOkClick(Sender: TObject);
begin
  inherited;
  try
    if (StrtoInt (edParcelas.Text) = 0) or (StrtoInt (edParcelas.Text) > 3) then
      raise Exception.Create ('');
  except
    Showmessage ('Cadastre o Número de Parcelas');
    edParcelas.Setfocus;
    ModalResult := mrNone;
  end;
end;

procedure TFCadastrarFormCondPagto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
