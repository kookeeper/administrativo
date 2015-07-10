unit UCadastrarFormEmpresas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls;

type
  TFCadastrarFormEmpresas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edCodigo: TEdit;
    edRazao: TEdit;
    edSenha: TEdit;
    edEstado: TEdit;
    edUNfiscal: TEdit;
    edUPedido: TEdit;
    cbAltDtPedido: TCheckBox;
    cbAltDtNfiscal: TCheckBox;
    cbAltNrNFiscal: TCheckBox;
    cbAltNrPedido: TCheckBox;
    Label8: TLabel;
    edSTribut: TEdit;
    Label9: TLabel;
    edDiasDemonstr: TEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    edUAssistencia: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edPIS: TEdit;
    edCOFINS: TEdit;
    Label16: TLabel;
    edClassificacao: TEdit;
    Label7: TLabel;
    Label10: TLabel;
    edICMSProd1: TEdit;
    edICMSPec1: TEdit;
    Label11: TLabel;
    edISS: TEdit;
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormEmpresas: TFCadastrarFormEmpresas;

implementation

uses UDM;

{$R *.DFM}

procedure TFCadastrarFormEmpresas.bbOkClick(Sender: TObject);
begin
  edEstado.Text := UpperCase (edEstado.Text);
  if Pos (edEstado.Text, DM.estados) = 0 then
  begin
    ModalResult := mrNone;
    raise Exception.Create ('Estado Inválido!');
  end;
end;

end.
