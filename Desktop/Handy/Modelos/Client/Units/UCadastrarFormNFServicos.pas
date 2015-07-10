unit UCadastrarFormNFServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB;

type
  TFCadastrarFormNFServicos = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DataSource1: TDataSource;
    dblCliente: TDBLookupComboBox;
    edNumero: TEdit;
    edData: TEdit;
    edTotal: TEdit;
    edAliqISS: TEdit;
    edVlrISS: TEdit;
    procedure edAliqISSExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormNFServicos: TFCadastrarFormNFServicos;

implementation

uses UDMLista;

{$R *.dfm}

procedure TFCadastrarFormNFServicos.edAliqISSExit(Sender: TObject);
begin
  inherited;
  try
    edVlrISS.Text := FloattoStr (StrtoFloat (edTotal.Text) * StrtoFloat (edAliqISS.Text) / 100);
  except
    edVlrISS.Text := '0';
  end;
end;

end.
