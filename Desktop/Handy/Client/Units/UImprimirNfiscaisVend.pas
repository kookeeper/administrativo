unit UImprimirNfiscaisVend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls,
  ComCtrls, TeEngine, Series, TeeProcs, Chart, DbChart, Mask, RzEdit, DBClient,
  RzDTP, RzPanel, RzRadGrp, RzButton, RzRadChk, RzDBCmbo;

type
  TFImprimirNFiscaisVend = class(TForm)
    Panel2: TPanel;
    dsListaVendedores: TDataSource;
    Panel1: TPanel;
    Label3: TLabel;
    lbItens: TLabel;
    lbValor: TLabel;
    Label6: TLabel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    dsImprNfVend: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    dsImprResVend: TDataSource;
    TabSheet3: TTabSheet;
    dbcVend: TDBChart;
    BarSeries1: TBarSeries;
    Series2: TPieSeries;
    TabSheet2: TTabSheet;
    dbcProd: TDBChart;
    BarSeries2: TBarSeries;
    Series1: TPieSeries;
    edCnpj: TRzEdit;
    dsListaProdutos: TDataSource;
    dsListaEstados: TDataSource;
    dblEstado: TRzDBLookupComboBox;
    dblProduto: TRzDBLookupComboBox;
    dblVendedor: TRzDBLookupComboBox;
    cbVendedor: TRzCheckBox;
    cbCliente: TRzCheckBox;
    cbProduto: TRzCheckBox;
    cbEstado: TRzCheckBox;
    RadioGroup1: TRzRadioGroup;
    dtpInicio: TRzDateTimePicker;
    dtpFim: TRzDateTimePicker;
    lbValorLiquido: TLabel;
    Label5: TLabel;
    procedure dblVendedorClick(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Valor, IcmsSubst: Real;
    Qtde: Integer;
    tsMes: array of TTabSheet;
    cMes: array of TChart;
    { Public declarations }
  end;

var
  FImprimirNFiscaisVend: TFImprimirNFiscaisVend;

implementation

uses UDM, UImprimirNfiscaisVendRpt, UCadastrarListaNfiscais,
  UCadastrarFormNfiscais, Vendedor, Produto, Nfiscal, QuickRpt, Estado;

{$R *.dfm}

procedure TFImprimirNFiscaisVend.dblVendedorClick(Sender: TObject);
var
  i: integer;
  vendedor_sq, codigo_cliente, estado: Variant;
begin
  dblProduto.Enabled := cbProduto.Checked;
  dblVendedor.Enabled := cbVendedor.Checked;
  edCnpj.Enabled := cbCliente.Checked;
  dblEstado.Enabled := cbEstado.Checked;

  if (not dblProduto.Enabled) then
  begin
    dblProduto.KeyValue := null;
    DBGrid1.Columns.Items[4].Visible := False;
    DBGrid1.Columns.Items[5].Visible := False;
  end
  else if dblProduto.KeyValue = null then
  begin
    dblProduto.KeyValue := dsListaProdutos.DataSet.FieldByName('produto_sq').AsInteger;
    DBGrid1.Columns.Items[4].Visible := True;
    DBGrid1.Columns.Items[5].Visible := True;
  end;

  for i:=0 to High (tsMes) do
    tsMes[i].Free;

  SetLength(tsMes, 0);
  SetLength(cMes, 0);

  vendedor_sq := null;
  codigo_cliente := null;
  estado := null;

  if dblVendedor.Enabled then
    vendedor_sq := dblVendedor.KeyValue;

  if edCnpj.Enabled then
    codigo_cliente := edCnpj.Text;

  if dblEstado.Enabled then
    estado := dblEstado.GetKeyValue;

  dsImprNfVend.Enabled := False;
  dsImprNfVend.DataSet := TNfiscal.listaVendas(dtpInicio.Date, dtpFim.Date, dblProduto.KeyValue, vendedor_sq, codigo_cliente, estado);

  TBarSeries(dbcVend.Series[0]).DataSource := TNfiscal.listaVendasVendedor(dtpInicio.Date, dtpFim.Date, dblProduto.KeyValue, vendedor_sq, codigo_cliente, estado);
  TPieSeries(dbcVend.Series[1]).DataSource := TBarSeries(dbcVend.Series[0]).DataSource;

  TBarSeries(dbcProd.Series[0]).DataSource := TNfiscal.listaVendasProduto(dtpInicio.Date, dtpFim.Date, dblProduto.KeyValue, vendedor_sq, codigo_cliente, estado);
  TPieSeries(dbcProd.Series[1]).DataSource := TBarSeries(dbcProd.Series[0]).DataSource;

  Valor := 0;
  IcmsSubst := 0;
  Qtde  := 0;
  While not dsImprNfVend.DataSet.Eof do
  begin
    if dblProduto.Enabled then
    begin
      Valor := Valor + dsImprNfVend.DataSet.FieldByName('vlr_total_item').Value;
      IcmsSubst := IcmsSubst + dsImprNfVend.DataSet.FieldByName('vlr_icms_subst_item').Value;
      Qtde  := Qtde  + dsImprNfVend.DataSet.FieldByName('qtde_item').Value;
    end
    else
    begin
      Valor := Valor + dsImprNfVend.DataSet.FieldByName('vlr_total').Value;
      IcmsSubst := IcmsSubst + dsImprNfVend.DataSet.FieldByName('VLR_ICMS_SUBST').Value;
      Qtde  := Qtde  + 1;
    end;

    dsImprNfVend.DataSet.Next;
  end;
  dsImprNfVend.DataSet.First;
  lbItens.Caption := IntToStr (Qtde);
  lbValor.Caption := FloattoStrf (Valor, ffCurrency, 10, 2);
  lbValorLiquido.Caption := FloattoStrf (Valor-IcmsSubst, ffCurrency, 10, 2);
  dsImprNfVend.Enabled := True;

  if cbVendedor.Checked then
  begin
    DM.cdsImprResVendMes.Close;
    DM.cdsImprResVendMes.Params.ParamByName('ano_inicio').AsInteger  := StrtoInt(FormatDateTime ('yyyy', dtpInicio.Date));
    DM.cdsImprResVendMes.Params.ParamByName('ano_termino').AsInteger := StrtoInt(FormatDatetime ('yyyy', dtpFim.Date));
    DM.cdsImprResVendMes.Params.ParamByName('vendedor_sq').AsInteger := dblVendedor.KeyValue;
    DM.cdsImprResVendMes.Open;
    SetLength(tsMes, StrtoInt(FormatDateTime('yyyy', dtpFim.Date))-StrtoInt(FormatDateTime('yyyy', dtpInicio.Date))+1);
    SetLength(cMes,  StrtoInt(FormatDateTime('yyyy', dtpFim.Date))-StrtoInt(FormatDateTime('yyyy', dtpInicio.Date))+1);
    for i := 0 to High(tsMes) do
    begin
      tsMes[i] := TTabSheet.Create(FImprimirNFiscaisVend);
      tsMes[i].PageControl := PageControl1;
      tsMes[i].Caption := 'Ano ' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i);
      cMes[i] := TChart.Create(tsMes[i]);
      cMes[i].AddSeries(TBarSeries.Create(Self));
      cMes[i].Series[0].Marks.ArrowLength := 20;
      cMes[i].Series[0].Marks.Visible := True;
      cMes[i].Series[0].SeriesColor := clAqua;
      cMes[i].Series[0].XValues.DateTime := False;
      cMes[i].Series[0].XValues.Name := 'X';
      cMes[i].Series[0].XValues.Multiplier := 1.000000000000000000;
      cMes[i].Series[0].XValues.Order := loAscending;
      cMes[i].Series[0].YValues.DateTime := False;
      cMes[i].Series[0].YValues.Name := 'Bar';
      cMes[i].Series[0].YValues.Multiplier := 1.000000000000000000;
      cMes[i].Series[0].YValues.Order := loNone;

      DM.cdsImprResVendMes.Filtered := True;
      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/1''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Janeiro', clBlack);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/2''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Fevereiro', clMaroon);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/3''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Março', clGreen);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/4''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Abril', clOlive);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/5''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Maio', clNavy);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/6''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Junho', clPurple);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/7''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Julho', clTeal);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/8''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Agosto', clGray);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/9''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Setembro', clSilver);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/10''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Outubro', clRed);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/11''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Novembro', clLime);

      DM.cdsImprResVendMes.Filter := 'ANO_MES = ''' + InttoStr(StrtoInt(FormatDateTime('yyyy', dtpInicio.Date)) + i) + '/12''';
      cMes[i].Series[0].Add(DM.cdsImprResVendMestotal.AsInteger, 'Dezembro', clYellow);

      cMes[i].Parent := tsMes[i];
      cMes[i].Align := alClient;
    end;
  end;
      DM.cdsImprResVendMes.Filtered := False;
end;

procedure TFImprimirNFiscaisVend.bbImprimirClick(Sender: TObject);
begin
  bbImprimir.Enabled := False;
  bbFechar.Enabled := False;
  try
    FImprimirNFiscaisVendRpt := TFImprimirNFiscaisVendRpt.Create(Self);
    FImprimirNfiscaisVendRpt.cds := TClientDataSet(dsImprNfVend.DataSet);
    FImprimirNFiscaisVendRpt.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.QRSubDetail1.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.QRDBText1.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.QRDBText2.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.QRDBText3.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.QRDBText4.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.QRDBText11.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrdDup1.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrvDup1.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrdDup2.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrvDup2.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrdDup3.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrvDup3.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrdDup4.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrvDup4.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrdDup5.DataSet := FImprimirNFiscaisVendRpt.cds;
    FImprimirNFiscaisVendRpt.qrvDup5.DataSet := FImprimirNFiscaisVendRpt.cds;

    FImprimirNFiscaisVendRpt.Preview;
  finally
    FreeAndNil(FImprimirNFiscaisVendRpt);
    bbImprimir.Enabled := True;
    bbFechar.Enabled := True;
  end;
end;

procedure TFImprimirNFiscaisVend.DBGrid1DblClick(Sender: TObject);
begin
  if not Assigned(FCadastrarListaNfiscais) then
    FCadastrarListaNfiscais := TFCadastrarListaNfiscais.Create(Self);
  FCadastrarListaNfiscais.cbFiltro.Text := 'Número';
  FCadastrarListaNfiscais.edFiltro.Text := dsImprNfVend.DataSet.FieldByName('numero_nfiscal').AsString;
  FCadastrarListaNfiscais.sbFiltro.Click;
  FCadastrarListaNfiscais.sbEditarClick(Sender);
end;

procedure TFImprimirNFiscaisVend.RadioGroup1Click(Sender: TObject);
begin
  dbcProd.Series[0].Active := False;
  dbcProd.Series[1].Active := False;
  dbcProd.Series[0].Active := (RadioGroup1.ItemIndex = 0);
  dbcProd.Series[1].Active := (RadioGroup1.ItemIndex = 1);

  dbcVend.Series[0].Active := False;
  dbcVend.Series[1].Active := False;
  dbcVend.Series[0].Active := (RadioGroup1.ItemIndex = 0);
  dbcVend.Series[1].Active := (RadioGroup1.ItemIndex = 1);
end;

procedure TFImprimirNFiscaisVend.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  DM.cdsImprResVend.Close;
  dsImprNfVend.DataSet.Close;
end;

procedure TFImprimirNFiscaisVend.FormCreate(Sender: TObject);
begin
  dsListaEstados.DataSet := TEstado.listaRegistros('order by codigo_estado');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  dsListaProdutos.DataSet := TProduto.listaRegistros('order by descricao_produto');
  dblVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName('VENDEDOR_SQ').AsInteger;
  dtpInicio.Date := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  dtpFim.Date    := Date;
  RadioGroup1.OnClick(Sender);
  dblVendedor.OnClick(Sender);
end;

end.

