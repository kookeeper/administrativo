unit UCadastrarFormPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, DBCtrls, Db, StdCtrls, Mask, Buttons, ExtCtrls,
  ToolWin, ComCtrls, Grids, DBGrids;

type
  TFCadastrarFormPedidos = class(TFCadastrarFormComum)
    Label1: TLabel;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label7: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    Label9: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DataSource2: TDataSource;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    DataSource3: TDataSource;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    Label10: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    Label11: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    edNrPedido: TEdit;
    edDtPedido: TEdit;
    edDolar: TEdit;
    edDemonstracao: TEdit;
    edFrete: TEdit;
    edPctJuros: TEdit;
    edVlrJuros: TEdit;
    DataSource4: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    mmObservacaoPed: TMemo;
    rgFrete: TRadioGroup;
    TabSheet3: TTabSheet;
    Label15: TLabel;
    Label34: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label41: TLabel;
    edPctDesc: TEdit;
    edVlrDesc: TEdit;
    edBaseIcms: TEdit;
    edVlrIcms: TEdit;
    edVlrIpi: TEdit;
    edVlrProd: TEdit;
    StringGrid1: TStringGrid;
    Label16: TLabel;
    edVlrProdIpi: TEdit;
    Label17: TLabel;
    DBLookupComboBox8: TDBLookupComboBox;
    DataSource5: TDataSource;
    mmObservacaoNf: TMemo;
    Panel2: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure DBLookupComboBox6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edPctJurosExit(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure edVlrJurosExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edDolarExit(Sender: TObject);
    procedure edFreteExit(Sender: TObject);
  private
    { Private declarations }
  public
    cIndice: String;
    AliqICMS: Real;
    cLista, vIndice: array of String;
    xItens, cProduto: array of Integer;

    procedure TotalizaPedido ();
    procedure AtualizaItens ();
  end;

var
  FCadastrarFormPedidos: TFCadastrarFormPedidos;

implementation

uses UDM, UEditarPedidosItens, UBuscaClientes, UCadastrarListaPedidos,
  UDMLista, Variants;

{$R *.DFM}

procedure TFCadastrarFormPedidos.TotalizaPedido ();
var
  vlr_desc, base_icms, vlr_icms, vlr_ipi, vlr_prod, pct_desc: Real;
  i: integer;
begin
  AliqICMS  := 0;
  vlr_desc  := 0;
  base_icms := 0;
  vlr_icms  := 0;
  vlr_ipi   := 0;
  vlr_prod  := 0;
  For i := 0 to StringGrid1.RowCount-2 do
  begin
    if cProduto[i] <> 0 then
    begin
      StringGrid1.Row := i + 1;
      if StrtoFloat (StringGrid1.Cells[7, StringGrid1.Row]) > AliqICMS then
        AliqICMS := StrtoFloat (StringGrid1.Cells[7, StringGrid1.Row]);
      vlr_desc := vlr_desc   + StrtoFloat (StringGrid1.Cells[5,  StringGrid1.Row]);
      base_icms := base_icms + StrtoFloat (StringGrid1.Cells[11, StringGrid1.Row]);
      vlr_icms := vlr_icms   + StrtoFloat (StringGrid1.Cells[8,  StringGrid1.Row]);
      vlr_ipi  := vlr_ipi    + StrtoFloat (StringGrid1.Cells[10, StringGrid1.Row]);
      vlr_prod := vlr_prod   + StrtoFloat (StringGrid1.Cells[11, StringGrid1.Row]);
    end;
  end;
  try
    if vlr_prod <> 0 then
      edPctJuros.Text := FloatToStrF (StrtoFloat (edVlrJuros.Text) / vlr_prod * 100, ffFixed, 10, 2);
    StrtoFloat (edVlrJuros.Text);
  except
    edVlrJuros.Text := '0';
  end;

  if edFrete.Text <> '' then
  begin
    base_icms := base_icms + StrtoFloat (edFrete.Text);
    vlr_icms  := vlr_icms + StrtoFloat (edFrete.Text) * AliqICMS / 100;
  end;

  if vlr_prod <> 0 then
    pct_desc  := 100 * vlr_desc / vlr_prod
  else pct_desc := 0;
  edVlrDesc.Text    := FloatToStrF (vlr_desc , ffFixed, 10, 2);
  edBaseIcms.Text   := FloatToStrF (base_icms, ffFixed, 10, 2);
  edVlrIcms.Text    := FloatToStrF (vlr_icms , ffFixed, 10, 2);
  edVlrIpi.Text     := FloatToStrF (vlr_ipi  , ffFixed, 10, 2);
  edVlrProd.Text    := FloatToStrF (vlr_prod , ffFixed, 10, 2);
  edVlrProdIpi.Text := FloatToStrF ((base_icms+vlr_ipi), ffFixed, 10, 2);
  edPctDesc.Text    := FloatToStrF (pct_desc , ffFixed, 10, 2);
  StringGrid1.Row   := 1;
end;

procedure TFCadastrarFormPedidos.AtualizaItens ();
var
  VlrUnit, Qtde, VlrTot, VlrTotSIpi, VlrDesc, Dolar, PctDesc, AliqICMS, AliqIPI,
  VlrUnitSIpi, VlrICMS, VlrIPI: Real;
  i: integer;
begin
  DMLista.cdsListaPecas.Open;
  For i := 0 to StringGrid1.RowCount-2 do
  begin
    if cProduto[i] <> 0 then
    begin
      StringGrid1.Row := i + 1;
      DMLista.cdsListaPecas.Locate('PECA_SQ', cProduto[i], []);
      VlrDesc  := StrtoFloat (StringGrid1.Cells[5,  StringGrid1.Row]);
      VlrUnit  := StrtoFloat (StringGrid1.Cells[4,  StringGrid1.Row]);
      Qtde     := StrtoFloat (StringGrid1.Cells[3,  StringGrid1.Row]);
      Dolar    := StrtoFloat (edDolar.Text);
      DM.AtualizaItem (VlrUnit, VlrDesc, Dolar, Qtde, AliqICMS, AliqIPI, VlrIpi, VlrUnitSIpi,
                       VlrTot, VlrTotSIpi, PctDesc, VlrICMS);

      StringGrid1.Cells[3,  StringGrid1.Row] := FloatToStrF (Qtde    , ffFixed, 10, 0);
      StringGrid1.Cells[4,  StringGrid1.Row] := FloatToStrF (VlrUnit , ffFixed, 10, 2);
      StringGrid1.Cells[5,  StringGrid1.Row] := FloatToStrF (VlrDesc , ffFixed, 10, 2);
      StringGrid1.Cells[6,  StringGrid1.Row] := FloatToStrF (PctDesc , ffFixed, 10, 2);
      StringGrid1.Cells[8,  StringGrid1.Row] := FloatToStrF (VlrIcms , ffFixed, 10, 2);
      StringGrid1.Cells[10, StringGrid1.Row] := FloatToStrF (VlrIpi  , ffFixed, 10, 2);
      StringGrid1.Cells[11, StringGrid1.Row] := FloatToStrF (VlrTotSIpi, ffFixed, 10, 2);
      StringGrid1.Cells[7,  StringGrid1.Row] := FloatToStrF (AliqICMS, ffFixed, 10, 2);
      StringGrid1.Cells[9,  StringGrid1.Row] := FloatToStrF (AliqIPI , ffFixed, 10, 2);
    end;
  end;
  DMLista.cdsListaPecas.Close;
  TotalizaPedido;
end;

procedure TFCadastrarFormPedidos.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormPedidos.sbEditarItemClick(Sender: TObject);
begin
  Application.CreateForm(TFEditarPedidosItens, FEditarPedidosItens);
  FEditarPedidosItens.edPedido.Text := edNrPedido.Text;
  DMLista.cdsListaPecas.Open;
  if Sender <> sbNovoItem then
  begin
    FEditarPedidosItens.edQtde.Text        := StringGrid1.Cells [3,   StringGrid1.Row];
    FEditarPedidosItens.edPreco.Text       := StringGrid1.Cells [4,   StringGrid1.Row];
    FEditarPedidosItens.edVlrDesc.Text     := StringGrid1.Cells [5,   StringGrid1.Row];
    FEditarPedidosItens.edPctDesc.Text     := StringGrid1.Cells [6,   StringGrid1.Row];
    FEditarPedidosItens.edAliqICMS.Text    := StringGrid1.Cells [7,   StringGrid1.Row];
    FEditarPedidosItens.edVlrIcms.Text     := StringGrid1.Cells [8,   StringGrid1.Row];
    FEditarPedidosItens.edAliqIPI.Text     := StringGrid1.Cells [9,   StringGrid1.Row];
    FEditarPedidosItens.edVlrIpi.Text      := StringGrid1.Cells [10,  StringGrid1.Row];
    FEditarPedidosItens.edVlrTotal.Text    := StringGrid1.Cells [11,  StringGrid1.Row];
    FEditarPedidosItens.mmSerie.Lines.Text := StringGrid1.Cells [12,  StringGrid1.Row];
    FEditarPedidosItens.DBLookupComboBox1.KeyValue := cProduto[StringGrid1.Row-1];
    FEditarPedidosItens.DBLookupComboBox2.KeyValue := cProduto[StringGrid1.Row-1];
  end;
  if FEditarPedidosItens.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
    begin
      if (StringGrid1.RowCount <> 2) or (cProduto[0] <> 0) then
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Row := StringGrid1.RowCount - 1;
      SetLength (vIndice, StringGrid1.RowCount-1);
      SetLength (cProduto, StringGrid1.RowCount-1);
      vIndice[StringGrid1.Row-1]  := '0';
    end;
    StringGrid1.Cells[1,  StringGrid1.Row] := DMLista.cdsListaPecasCODIGO_PECA.AsString;
    StringGrid1.Cells[2,  StringGrid1.Row] := DMLista.cdsListaPecasDESCRICAO_PECA.AsString;
    StringGrid1.Cells[3,  StringGrid1.Row] := FEditarPedidosItens.edQtde.Text;
    StringGrid1.Cells[4,  StringGrid1.Row] := FEditarPedidosItens.edPreco.Text;
    StringGrid1.Cells[5,  StringGrid1.Row] := FEditarPedidosItens.edVlrDesc.Text;
    StringGrid1.Cells[6,  StringGrid1.Row] := FEditarPedidosItens.edPctDesc.Text;
    StringGrid1.Cells[7,  StringGrid1.Row] := FEditarPedidosItens.edAliqICMS.Text;
    StringGrid1.Cells[8,  StringGrid1.Row] := FEditarPedidosItens.edVlrIcms.Text;
    StringGrid1.Cells[9,  StringGrid1.Row] := FEditarPedidosItens.edAliqIPI.Text;
    StringGrid1.Cells[10, StringGrid1.Row] := FEditarPedidosItens.edVlrIpi.Text;
    StringGrid1.Cells[11, StringGrid1.Row] := FEditarPedidosItens.edVlrTotal.Text;
    StringGrid1.Cells[12, StringGrid1.Row] := FEditarPedidosItens.mmSerie.Lines.Text;
    StringGrid1.Cells[13, StringGrid1.Row] := InttoStr (DMLista.cdsListaPecasQTDE_PECA_LOJA.AsInteger + DMLista.cdsListaPecasQTDE_PECA_ARMAZEM.AsInteger);
    StringGrid1.Cells[14, StringGrid1.Row] := DMLista.cdsListaPecasCODIGO_NBM.AsString;
    cProduto[StringGrid1.Row-1]   := DMLista.cdsListaPecasPECA_SQ.AsInteger;
  end;
  TotalizaPedido;
  inherited;
  FEditarPedidosItens.Free;
end;

procedure TFCadastrarFormPedidos.sbApagarItemClick(Sender: TObject);
var
  i1: Integer;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    SetLength (xItens, High (xItens)+2);
    xItens[High(xItens)] := StrtoInt (vIndice[StringGrid1.Row-1]);
    While (StringGrid1.Row+1) < StringGrid1.RowCount do
    begin
      For i1 := 1 to StringGrid1.ColCount do
        StringGrid1.Cells [i1, StringGrid1.Row] := StringGrid1.Cells [i1, StringGrid1.Row+1];
      vIndice[StringGrid1.Row-1] := vIndice[StringGrid1.Row];
      cProduto[StringGrid1.Row-1] := cProduto[StringGrid1.Row];
      StringGrid1.Row := StringGrid1.Row + 1;
    end;
    if StringGrid1.RowCount > 2 then
      StringGrid1.RowCount := StringGrid1.RowCount - 1
    else begin
      For i1 := 0 to StringGrid1.ColCount do
        StringGrid1.Cells [i1, 1] := '';
        vIndice[0] := '';
        cProduto[0] := 0;
    end;
    SetLength (vIndice, StringGrid1.RowCount-1);
    SetLength (cProduto, StringGrid1.RowCount-1);
    TotalizaPedido;
  end;
end;

procedure TFCadastrarFormPedidos.bbOkClick(Sender: TObject);
var
  i1: integer;
begin
  inherited;
  ModalResult := mrNone;
  if DBLookupComboBox1.KeyValue = Null then
    raise Exception.Create('Cliente não selecionado!');
  if DBLookupComboBox3.KeyValue = Null then
    raise Exception.Create('Condição de Pagamento não selecionada!');
  if DBLookupComboBox5.KeyValue = Null then
    raise Exception.Create('Natureza da Operação não selecionada!');
  if DBLookupComboBox7.KeyValue = Null then
    raise Exception.Create('Transportadora não selecionada!');
  if DBLookupComboBox8.KeyValue = Null then
    raise Exception.Create('Vendedor não selecionado!');

  if edFrete.Text = '' then
    edFrete.Text := '0';
  if edPctJuros.Text = '' then
    edPctJuros.Text := '0';
  if edVlrJuros.Text = '' then
    edVlrJuros.Text := '0';

  i1 := 1;
  While i1 <= 30 do
  begin
    if DMLista.cdsListaClientesESTADO.Value = DMLista.cdsListaNaturezas.FieldByName ('UF' + FormatFloat ('00', i1)).AsString then
      i1 := 99;
    inc (i1);
  end;
  if i1 <> 100 then
    raise Exception.Create ('Natureza Inválida para este Estado!');
  if (DMLista.cdsListaNaturezasTIPO_NFISCAL.AsString = 'D') and
     ((edDemonstracao.Text = '') or (edDemonstracao.Text = '0')) then
  begin
    edDemonstracao.SetFocus;
    raise Exception.Create ('Dias em Demonstração: Informação Obrigatória para Esta Natureza!');
  end;
  if FCadastrarListaPedidos.novo and (StrtoInt (edNrPedido.Text) <> 0) then
  begin
    DM.SCServer.Open;
    if DM.SCServer.AppServer.VerificaIndice ('PEDIDOS', 'NUMERO_PEDIDO', edNrPedido.Text) = 1 then
    begin
      edNrPedido.SetFocus;
      raise Exception.Create ('Pedido já Cadastrado!');
    end;
//    DM.SCServer.Close;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormPedidos.DBLookupComboBox1Click(Sender: TObject);
begin
  inherited;
  DMLista.cdsListaNaturezas.Filter := 'UF01 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF02 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF03 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF04 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF05 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF06 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF07 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF08 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF09 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF10 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF11 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF12 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF13 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF14 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF15 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF16 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF17 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF18 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF19 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF20 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF21 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF22 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF23 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF24 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF25 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF26 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF27 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF28 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF29 = ''' + DMLista.cdsListaClientesESTADO.AsString + ''' OR ' +
                                      'UF30 = ''' + DMLista.cdsListaClientesESTADO.AsString + '''';
  DMLista.cdsListaNaturezas.Filtered := True;
  DBLookupComboBox5.KeyValue := DMLista.cdsListaNaturezasNATUREZA_SQ.Value;
  DBLookupComboBox6.KeyValue := DMLista.cdsListaNaturezasNATUREZA_SQ.Value;
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
  DBLookupComboBox7.KeyValue := DMLista.cdsListaClientesTRANSPORTADORA_SQ.Value;
  AtualizaItens;
end;

procedure TFCadastrarFormPedidos.DBLookupComboBox2Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
  DBLookupComboBox7.KeyValue := DMLista.cdsListaClientesTRANSPORTADORA_SQ.Value;
  AtualizaItens;
end;

procedure TFCadastrarFormPedidos.DBLookupComboBox3Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox4.KeyValue := DBLookupComboBox3.KeyValue;
end;

procedure TFCadastrarFormPedidos.DBLookupComboBox4Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox3.KeyValue := DBLookupComboBox4.KeyValue;
end;

procedure TFCadastrarFormPedidos.DBLookupComboBox5Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox6.KeyValue := DBLookupComboBox5.KeyValue;
  AtualizaItens;
end;

procedure TFCadastrarFormPedidos.DBLookupComboBox6Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox5.KeyValue := DBLookupComboBox6.KeyValue;
  AtualizaItens;
end;

procedure TFCadastrarFormPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  StringGrid1.ColCount := 15;
  StringGrid1.RowCount := 2;
  StringGrid1.ColWidths[0]  := 10;
  StringGrid1.RowHeights[0] := 20;

  StringGrid1.ColWidths[1] := 70;
  StringGrid1.Cells [1, 0] := 'Código';

  StringGrid1.ColWidths[2] := 70;
  StringGrid1.Cells [2, 0] := 'Descrição';

  StringGrid1.ColWidths[3] := 70;
  StringGrid1.Cells [3, 0] := 'Quantidade';

  StringGrid1.ColWidths[4] := 70;
  StringGrid1.Cells [4, 0] := 'Preço Unitário';

  StringGrid1.ColWidths[5] := 70;
  StringGrid1.Cells [5, 0] := 'Vlr Desconto';

  StringGrid1.ColWidths[6] := 70;
  StringGrid1.Cells [6, 0] := '% Desconto';

  StringGrid1.ColWidths[7] := 70;
  StringGrid1.Cells [7, 0] := 'Aliq. ICMS';

  StringGrid1.ColWidths[8] := 70;
  StringGrid1.Cells [8, 0] := 'Vlr. ICMS';

  StringGrid1.ColWidths[9] := 70;
  StringGrid1.Cells [9, 0] := 'Aliq. IPI';

  StringGrid1.ColWidths[10] := 70;
  StringGrid1.Cells [10, 0] := 'Vlr. IPI';

  StringGrid1.ColWidths[11] := 70;
  StringGrid1.Cells [11, 0] := 'Vlr Total';

  StringGrid1.ColWidths[12] := 70;
  StringGrid1.Cells [12, 0] := 'Nr. Serie';

  StringGrid1.ColWidths[13] := 70;
  StringGrid1.Cells [13, 0] := 'Estoque Disp.';

  StringGrid1.ColWidths[14] := 70;
  StringGrid1.Cells [14, 0] := 'Codigo NCM';

  SetLength (cIndice, 1);
  SetLength (vIndice, 1);
  SetLength (xItens, 0);
  SetLength (cProduto, 1);
end;

procedure TFCadastrarFormPedidos.edPctJurosExit(Sender: TObject);
begin
  inherited;
  if edPctJuros.Text = '' then
    edPctJuros.Text := '0';
  edVlrJuros.Text := FloatToStrF (StrtoFloat (edPctJuros.Text) * StrtoFloat (edVlrProd.Text) / 100, ffFixed, 10, 2);
  TotalizaPedido;
end;

procedure TFCadastrarFormPedidos.Label5Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFBuscaClientes, FBuscaClientes);
  DMLista.cdsBuscaClientes.Open;
  if FBuscaClientes.ShowModal = mrOk then
  begin
    DBLookupComboBox1.KeyValue := DMLista.cdsBuscaClientesCLIENTE_SQ.Value;
    DBLookupComboBox2.KeyValue := DMLista.cdsBuscaClientesCLIENTE_SQ.Value;
    DMLista.cdsBuscaClientes.Close;
  end;
  FBuscaClientes.Free;
end;

procedure TFCadastrarFormPedidos.edVlrJurosExit(Sender: TObject);
begin
  inherited;
  TotalizaPedido;
end;

procedure TFCadastrarFormPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFCadastrarFormPedidos.edDolarExit(Sender: TObject);
begin
  inherited;
  AtualizaItens;
end;

procedure TFCadastrarFormPedidos.edFreteExit(Sender: TObject);
begin
  inherited;
  TotalizaPedido;
end;

end.
