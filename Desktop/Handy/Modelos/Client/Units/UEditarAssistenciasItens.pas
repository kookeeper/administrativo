unit UEditarAssistenciasItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask;

type
  TFEditarAssistenciasItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label3: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label14: TLabel;
    edQtde: TEdit;
    edPreco: TEdit;
    edVlrTotal: TEdit;
    procedure bbOkClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
  private
    function AtualizaItem (): Boolean;
  public
  end;

var
  FEditarAssistenciasItens: TFEditarAssistenciasItens;

implementation

uses UDM, UBuscaProdutos, UDMLista, UCadastrarFormAssistencias;

{$R *.DFM}

function TFEditarAssistenciasItens.AtualizaItem (): Boolean;
var
  VlrUnit, Qtde, VlrTot, Dolar: Real;
begin
  try
    if edPreco.Text   = '' then edPreco.Text   := '0';
    if edQtde.Text    = '' then edQtde.Text    := '0';
    if FCadastrarFormAssistencias.edDolar.Text = '' then FCadastrarFormAssistencias.edDolar.Text := '1';

    VlrUnit := StrtoFloat (edPreco.Text);
    Qtde    := StrtoFloat (edQtde.Text);
    Dolar   := StrtoFloat (FCadastrarFormAssistencias.edDolar.Text);
    VlrTot  := Dolar * VlrUnit * Qtde;

    edQtde.Text     := FloatToStrF (Qtde    , ffFixed, 10, 0);
    edPreco.Text    := FloatToStrF (VlrUnit , ffFixed, 10, 2);
    edVlrTotal.Text := FloatToStrF (VlrTot  , ffFixed, 10, 2);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFEditarAssistenciasItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if StrtoInt (edQtde.Text) <= 0 then
  begin
    Showmessage ('Informe a Quantidade!');
    edQtde.SetFocus;
  end
  else
  if AtualizaItem then ModalResult := mrOk;
end;

procedure TFEditarAssistenciasItens.Label5Click(Sender: TObject);
begin
  Application.CreateForm(TFBuscaProdutos, FBuscaProdutos);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    DBLookupComboBox1.KeyValue := DMLista.cdsBuscaPecas.FieldByName ('PECA_SQ').Value;
    DBLookupComboBox2.KeyValue := DMLista.cdsBuscaPecas.FieldByName ('PECA_SQ').Value;
    DMLista.cdsBuscaPecas.Close;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarAssistenciasItens.DBLookupComboBox1Click(Sender: TObject);
begin
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
  edPreco.Text := DMLista.cdsListaPecasPRECO_UNIT_PECA.AsString;
  AtualizaItem;
end;

procedure TFEditarAssistenciasItens.DBLookupComboBox2Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
  edPreco.Text := DMLista.cdsListaPecasPRECO_UNIT_PECA.AsString;
  AtualizaItem;
end;

procedure TFEditarAssistenciasItens.edQtdeExit(Sender: TObject);
begin
  AtualizaItem;
end;

end.
