unit UCadastrarFormTransportadoras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls;

type
  TFCadastrarFormTransportadoras = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edCodigo: TEdit;
    edNome: TEdit;
    edInscricao: TEdit;
    edEndereco: TEdit;
    edMunicipio: TEdit;
    cbEstado: TComboBox;
    Label11: TLabel;
    edDDDFone: TEdit;
    edFone: TEdit;
    edComplFone: TEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormTransportadoras: TFCadastrarFormTransportadoras;

implementation

uses UDM;

{$R *.DFM}

procedure TFCadastrarFormTransportadoras.bbOkClick(Sender: TObject);
begin
  inherited;
  cbEstado.Text := UpperCase (cbEstado.Text);
  if Pos (cbEstado.Text, DM.estados) = 0 then
  begin
    ModalResult := mrNone;
    raise Exception.Create ('Estado Inválido!');
  end;
end;

procedure TFCadastrarFormTransportadoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
