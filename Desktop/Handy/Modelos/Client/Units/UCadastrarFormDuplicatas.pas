unit UCadastrarFormDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, Mask,
  DBCtrls;

type
  TFCadastrarFormDuplicatas = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    edNumero: TEdit;
    edItem: TEdit;
    edNfiscal: TEdit;
    edValor: TEdit;
    edValorPg: TEdit;
    edDtEmissao: TEdit;
    edDtVencto: TEdit;
    edDtPagto: TEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormDuplicatas: TFCadastrarFormDuplicatas;

implementation

uses UDM, UDMLista;

{$R *.dfm}

procedure TFCadastrarFormDuplicatas.bbOkClick(Sender: TObject);
begin
  inherited;
  try
    ModalResult := mrOk;
    StrtoInt (edNfiscal.Text);
    edNfiscal.Tag := 0;
    DMLista.cdsListaNfiscais.Open;
    if not DMLista.cdsListaNfiscais.Locate('NUMERO_NFISCAL', edNfiscal.Text, []) then
      raise Exception.Create('');
    edNfiscal.Tag := DMLista.cdsListaNfiscaisNFISCAL_SQ.AsInteger;
    DMLista.cdsListaNfiscais.Close;
  except
    Showmessage ('Nota Fiscal Inválida!');
    ModalResult := mrNone;
  end;
end;

procedure TFCadastrarFormDuplicatas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
