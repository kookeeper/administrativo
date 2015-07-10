unit UImprimirEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, QuickRpt, QRCtrls, Grids, DBGrids,
  DB, Series, TeEngine, TeeProcs, Chart, DbChart, ComCtrls, OleServer,
  ExcelXP, DBClient;

type
  TFImprimirEstoque = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    rgTipo: TRadioGroup;
    dsImprEst: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    DBChart1: TDBChart;
    BarSeries1: TBarSeries;
    Series2: TPieSeries;
    DBGrid1: TDBGrid;
    rgGrafico: TRadioGroup;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    rgEstoque: TRadioGroup;
    rgOrdenacao: TRadioGroup;
    cdsImprEst: TClientDataSet;
    procedure bbImprimirClick(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgGraficoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Filtro : String;
  public
    { Public declarations }
  end;

var
  FImprimirEstoque: TFImprimirEstoque;

implementation

uses UDM, UImprimirEstoqueRpt2, UImprimirEstoqueRpt, Empresa, Produto;

{$R *.dfm}

procedure TFImprimirEstoque.bbImprimirClick(Sender: TObject);
begin
  TProduto.listarEstoque(rgTipo.ItemIndex + 1, 'descricao_modelo').CloneCursor(cdsImprEst, false);

  if rgTipo.ItemIndex = 0 then
  begin
    Application.CreateForm(TFImprimirEstoqueRpt, FImprimirEstoqueRpt);
    FImprimirEstoqueRpt.Preview;
    FImprimirEstoqueRpt.Free;
  end
  else begin
    Application.CreateForm(TFImprimirEstoqueRpt2, FImprimirEstoqueRpt2);
    FImprimirEstoqueRpt2.Preview;
    FImprimirEstoqueRpt2.Free;
  end;

  cdsImprEst.Close;
end;

procedure TFImprimirEstoque.rgTipoClick(Sender: TObject);
begin
  case rgEstoque.ItemIndex of
    0 : cdsImprEst.Filter := Filtro;
    1 : cdsImprEst.Filter := '(not ' + Filtro + ')';
    2 : cdsImprEst.Filter := '';
  end;

  TProduto.listarEstoque(rgTipo.ItemIndex + 1, 'preco_total').CloneCursor(cdsImprEst, false);

  if (rgOrdenacao.ItemIndex = 0) then
    cdsImprEst.IndexFieldNames := 'CODIGO_PRODUTO'
  else
    cdsImprEst.IndexFieldNames := 'DESCRICAO_PRODUTO';
end;

procedure TFImprimirEstoque.FormActivate(Sender: TObject);
begin
  Filtro := '(qtde_estoque1+qtde_estoque2+qtde_estoque3+qtde_estoque4+qtde_estoque5' +
    '+qtde_estoque6+qtde_estoque7+qtde_estoque8+qtde_estoque9+qtde_estoque10 <> 0)';

  cdsImprEst.Filtered := True;
  rgTipo.OnClick(self);
  rgGrafico.OnClick(self);
end;

procedure TFImprimirEstoque.rgGraficoClick(Sender: TObject);
begin
  DBChart1.Series[0].Active := rgGrafico.ItemIndex = 0;
  DBChart1.Series[1].Active := rgGrafico.ItemIndex = 1;
end;

procedure TFImprimirEstoque.BitBtn1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
    DM.ExpExcel (dsImprEst.DataSet, SaveDialog1.FileName);
end;

procedure TFImprimirEstoque.FormCreate(Sender: TObject);
begin
  DBGrid1.Columns.Items[2].Title.Caption  := empresaSelecionada.descricao_estoque1;
  DBGrid1.Columns.Items[3].Title.Caption  := empresaSelecionada.descricao_estoque2;
  DBGrid1.Columns.Items[4].Title.Caption  := empresaSelecionada.descricao_estoque3;
  DBGrid1.Columns.Items[5].Title.Caption  := empresaSelecionada.descricao_estoque4;
  DBGrid1.Columns.Items[6].Title.Caption  := empresaSelecionada.descricao_estoque5;
  DBGrid1.Columns.Items[7].Title.Caption  := empresaSelecionada.descricao_estoque6;
  DBGrid1.Columns.Items[8].Title.Caption  := empresaSelecionada.descricao_estoque7;
  DBGrid1.Columns.Items[9].Title.Caption  := empresaSelecionada.descricao_estoque8;
  DBGrid1.Columns.Items[10].Title.Caption := empresaSelecionada.descricao_estoque9;
  DBGrid1.Columns.Items[11].Title.Caption := empresaSelecionada.descricao_estoque10;
end;

end.
