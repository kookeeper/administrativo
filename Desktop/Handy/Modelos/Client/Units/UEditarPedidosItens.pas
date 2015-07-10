unit UEditarPedidosItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask;

type
  TFEditarPedidosItens = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label8: TLabel;
    DBEdit2: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edPedido: TEdit;
    edQtde: TEdit;
    edPreco: TEdit;
    edVlrDesc: TEdit;
    edPctDesc: TEdit;
    edVlrIcms: TEdit;
    edVlrIpi: TEdit;
    edVlrTotal: TEdit;
    mmSerie: TMemo;
    Label15: TLabel;
    Label16: TLabel;
    edAliqICMS: TEdit;
    edAliqIPI: TEdit;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Label18: TLabel;
    DBEdit4: TDBEdit;
    Label19: TLabel;
    DBEdit5: TDBEdit;
    Label20: TLabel;
    DBEdit6: TDBEdit;
    Label21: TLabel;
    DBEdit7: TDBEdit;
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
  FEditarPedidosItens: TFEditarPedidosItens;

implementation

uses UDM, UBuscaProdutos, UCadastrarFormPedidos, UDMLista;

{$R *.DFM}

function TFEditarPedidosItens.AtualizaItem (): Boolean;
var
  VlrUnit, Qtde, VlrTot, VlrTotSIpi, VlrDesc, Dolar, PctDesc, AliqICMS, AliqIPI,
  VlrUnitSIpi, VlrICMS, VlrIPI: Real;
begin
  try
    if edVlrDesc.Text = '' then edVlrDesc.Text := '0';
    if edPreco.Text   = '' then edPreco.Text   := '0';
    if edQtde.Text    = '' then edQtde.Text    := '0';
    if FCadastrarFormPedidos.edDolar.Text = '' then FCadastrarFormPedidos.edDolar.Text := '0';

    VlrDesc  := StrtoFloat (edVlrDesc.Text);
    VlrUnit  := StrtoFloat (edPreco.Text);
    Qtde     := StrtoFloat (edQtde.Text);
    Dolar    := StrtoFloat (FCadastrarFormPedidos.edDolar.Text);

    DM.AtualizaItem (VlrUnit, VlrDesc, Dolar, Qtde, AliqICMS, AliqIPI, VlrIpi, VlrUnitSIpi,
                       VlrTot, VlrTotSIpi, PctDesc, VlrICMS);

    edQtde.Text     := FloatToStrF (Qtde    , ffFixed, 10, 0);
    edPreco.Text    := FloatToStrF (VlrUnit , ffFixed, 10, 2);
    edVlrDesc.Text  := FloatToStrF (VlrDesc , ffFixed, 10, 2);
    edPctDesc.Text  := FloatToStrF (PctDesc , ffFixed, 10, 2);
    edVlrIcms.Text  := FloatToStrF (VlrIcms , ffFixed, 10, 2);
    edVlrIpi.Text   := FloatToStrF (VlrIpi  , ffFixed, 10, 2);
    edVlrTotal.Text := FloatToStrF (VlrTotSIpi, ffFixed, 10, 2);
    edAliqICMS.Text := FloatToStrF (AliqICMS, ffFixed, 10, 2);
    edAliqIPI.Text  := FloatToStrF (AliqIPI , ffFixed, 10, 2);
    Result := True;
  except
    Result := False;
  end;
end;

procedure TFEditarPedidosItens.bbOkClick(Sender: TObject);
begin
  bbOk.SetFocus;
  ModalResult := mrNone;
  if (edPctDesc.Text <> '') and (StrtoFloat (edPctDesc.Text) >= 100) then
  begin
    Showmessage ('Desconto Superior ao limite!');
    edPctDesc.SetFocus;
  end else
  if StrtoInt (edQtde.Text) <= 0 then
  begin
    Showmessage ('Informe a Quantidade!');
    edQtde.SetFocus;
  end
  else
  if AtualizaItem then ModalResult := mrOk;
end;

procedure TFEditarPedidosItens.Label5Click(Sender: TObject);
begin
  Application.CreateForm(TFBuscaProdutos, FBuscaProdutos);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    DBLookupComboBox1.KeyValue := DMLista.cdsBuscaPecas.FieldByName ('PECA_SQ').Value;
    DBLookupComboBox1Click(nil);
    DMLista.cdsBuscaPecas.Close;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarPedidosItens.DBLookupComboBox1Click(Sender: TObject);
begin
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
  edPreco.Text := DMLista.cdsListaPecasPRECO_UNIT_PECA.AsString;
  AtualizaItem;
end;

procedure TFEditarPedidosItens.DBLookupComboBox2Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
  edPreco.Text := DMLista.cdsListaPecasPRECO_UNIT_PECA.AsString;
  AtualizaItem;
end;

procedure TFEditarPedidosItens.edQtdeExit(Sender: TObject);
begin
  AtualizaItem;
end;

end.
