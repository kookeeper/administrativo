unit UCadastrarFormModelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls;

type
  TFCadastrarFormModelos = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    edMarca: TEdit;
    edPreco: TEdit;
    edUnidade: TEdit;
    DataSource1: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormModelos: TFCadastrarFormModelos;

implementation

{$R *.dfm}

procedure TFCadastrarFormModelos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
