unit UEditarNFiscaisItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask;

type
  TFEditarNFiscaisItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label1: TLabel;
    DataSource1: TDataSource;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label25: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    edNfiscal: TEdit;
    edItem: TEdit;
    edClass: TEdit;
    edStrib: TEdit;
    edQtde: TEdit;
    edPreco: TEdit;
    edVlrTotal: TEdit;
    edAliqICMS: TEdit;
    edVlrICMS: TEdit;
    edAliqIPI: TEdit;
    edVlrIPI: TEdit;
    mmNrSerie: TMemo;
    Label3: TLabel;
    edPrecoSIpi: TEdit;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label21: TLabel;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    edUnid: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    bbAtualizar: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure Label24Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure edPrecoSIpiExit(Sender: TObject);
    procedure bbAtualizarClick(Sender: TObject);
  private
    function AtualizaItem (): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditarNFiscaisItens: TFEditarNFiscaisItens;

implementation

uses UDM, UBuscaProdutos, UCadastrarFormNfiscais, UDMLista;

{$R *.DFM}

function TFEditarNFiscaisItens.AtualizaItem (): Boolean;
var
  VlrUnit, Qtde, VlrTot, VlrTotSIpi, AliqICMS, AliqIPI, Dolar, VlrICMS, VlrIPI,
  VlrUnitSIpi, PctDesc: Real;
begin
  try
    if (edPreco.Text = '') or (StrtoFloat (edPreco.Text) = 0) then
      edPreco.Text := FloattoStrf (DMLista.cdsListaPecasPRECO_UNIT_PECA.AsCurrency *
              StrtoFloat (FCadastrarFormNfiscais.edDolar.Text), ffFixed, 10, 2);
    edUnid.Text := DMLista.cdsListaPecasUN_PECA.Text;

    if edPreco.Text   = '' then edPreco.Text   := '0';
    if edQtde.Text    = '' then edQtde.Text    := '0';
    Dolar := 1;
    VlrUnit := StrtoFloat (edPreco.Text);
    Qtde    := StrtoFloat (edQtde.Text);

    DM.AtualizaItem (VlrUnit, 0, Dolar, Qtde, AliqICMS, AliqIPI, VlrIpi, VlrUnitSIpi,
                       VlrTot, VlrTotSIpi, PctDesc, VlrICMS);

    edQtde.Text      := FloatToStrF (Qtde    , ffFixed, 10, 0);
    edPreco.Text     := FloatToStrF (VlrUnit , ffFixed, 10, 2);
    edVlrIcms.Text   := FloatToStrF (VlrIcms , ffFixed, 10, 2);
    edVlrIpi.Text    := FloatToStrF (VlrIpi  , ffFixed, 10, 2);
    edVlrTotal.Text  := FloatToStrF (VlrTotSIpi, ffFixed, 10, 2);
    edAliqICMS.Text  := FloatToStrF (AliqICMS, ffFixed, 10, 2);
    edAliqIPI.Text   := FloatToStrF (AliqIPI , ffFixed, 10, 2);
    edPrecoSIpi.Text := FloatToStrF (VlrUnitSIpi, ffFixed, 10, 2);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFEditarNFiscaisItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if StrtoInt (edQtde.Text) <= 0 then
  begin
    Showmessage ('Informe a Quantidade!');
    edQtde.SetFocus;
  end
  else ModalResult := mrOk;
end;

procedure TFEditarNFiscaisItens.Label24Click(Sender: TObject);
begin
  Application.CreateForm(TFBuscaProdutos, FBuscaProdutos);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    DBLookupComboBox1.KeyValue := DMLista.cdsListaPecasPECA_SQ.Value;
    DBLookupComboBox2.KeyValue := DMLista.cdsListaPecasPECA_SQ.Value;
    DMLista.cdsBuscaPecas.Close;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarNFiscaisItens.DBLookupComboBox1Click(Sender: TObject);
begin
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
  edQtdeExit(nil);
end;

procedure TFEditarNFiscaisItens.DBLookupComboBox2Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
  edQtdeExit(nil);
end;

procedure TFEditarNFiscaisItens.edQtdeExit(Sender: TObject);
begin
  if not FCadastrarFormNfiscais.Manual then AtualizaItem;
  edVlrTotal.Text := FloattoStrf (StrtoFloat (edPrecoSIpi.Text) * StrtoFloat (edQtde.Text), ffFixed, 10, 2);
end;

procedure TFEditarNFiscaisItens.edPrecoSIpiExit(Sender: TObject);
var
  VlrSIPI, AliqIPI, VlrCIPI: Real;
begin
  if not FCadastrarFormNfiscais.Manual then
  begin
    VlrSIPI := StrtoFloat (edPrecoSIpi.Text);
    AliqIPI := StrtoFloat (edAliqIPI.Text);
    VlrCIPI := Int ((VlrSIPI + (AliqIPI * VlrSIPI ) / 100) * 100);
    edPreco.Text := FloattoStr (VlrCIPI / 100);
    edQtdeExit(nil);
  end;
end;

procedure TFEditarNFiscaisItens.bbAtualizarClick(Sender: TObject);
begin
  AtualizaItem;
end;

end.
