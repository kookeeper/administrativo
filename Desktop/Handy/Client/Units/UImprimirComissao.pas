unit UImprimirComissao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, DBCtrls,
  ExtCtrls;

type
  TFImprimirComissao = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    dblVendedor: TDBLookupComboBox;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    cbVendedor: TCheckBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label3: TLabel;
    lbItens: TLabel;
    lbValor: TLabel;
    Label6: TLabel;
    bbFechar: TBitBtn;
    dsListaVendedores: TDataSource;
    dsImprComissao: TDataSource;
    btnExportar: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure dblVendedorClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarClick(Sender: TObject);
  private
    Valor: Real;
    Qtde: Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirComissao: TFImprimirComissao;

implementation

uses UDM, Vendedor, Nfiscal;

{$R *.dfm}

procedure TFImprimirComissao.dblVendedorClick(Sender: TObject);
//var
//  Filtro: String;
begin
  if Sender = cbVendedor then
    dblVendedor.Enabled := cbVendedor.Checked;

  if not dblVendedor.Enabled then
    dblVendedor.KeyValue := null;

  dsImprComissao.Enabled := False;
  dsImprComissao.DataSet := TNfiscal.buscarComissao(dtpInicio.Date, dtpFim.Date, dblVendedor.KeyValue);

  Valor := 0;
  Qtde  := 0;
  While not dsImprComissao.DataSet.Eof do
  begin
    Valor := Valor + dsImprComissao.DataSet.FieldByName('comissao').Value;
    Qtde  := Qtde  + 1;
    dsImprComissao.DataSet.Next;
  end;
  dsImprComissao.DataSet.First;
  lbItens.Caption := IntToStr (Qtde);
  lbValor.Caption := FloattoStrf (Valor, ffCurrency, 10, 2);
  dsImprComissao.Enabled := True;
end;

procedure TFImprimirComissao.FormActivate(Sender: TObject);
begin
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  dblVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName('VENDEDOR_SQ').AsInteger;
  dtpInicio.Date := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  dtpFim.Date    := Date;
  dblVendedorClick(Sender);
end;

procedure TFImprimirComissao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsImprComissao.DataSet.Close;
end;

procedure TFImprimirComissao.btnExportarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    DM.ExpExcel (dsImprComissao.DataSet, SaveDialog1.FileName);
end;

end.
