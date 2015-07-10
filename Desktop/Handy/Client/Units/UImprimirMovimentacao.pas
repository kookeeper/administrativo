unit UImprimirMovimentacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, DB;

type
  TFImprimirMovimentacao = class(TForm)
    dbldProduto: TDBLookupComboBox;
    dblcProduto: TDBLookupComboBox;
    Label2: TLabel;
    Label4: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    dsListaProdutos: TDataSource;
    cbProduto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure cbProdutoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirMovimentacao: TFImprimirMovimentacao;

implementation

uses Produto, UImprimirMovimentacaoRpt, Kardex, DBClient;

{$R *.dfm}

procedure TFImprimirMovimentacao.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.montaLista();

  dtpInicio.Date := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  dtpFim.Date    := Date;
end;

procedure TFImprimirMovimentacao.bbImprimirClick(Sender: TObject);
var
  filtro: String;
  cds: TClientDataSet;
begin
  try
    QRImprimirMovimentacao := TQRImprimirMovimentacao.Create(Self);
    filtro := ' where data >= ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtpInicio.Date));
    filtro := filtro + ' and data < ' + QuotedStr(FormatDateTime('dd/mm/yyyy', dtpFim.Date + 1));
    if cbProduto.Checked then
      filtro := filtro + ' and produto_sq = ' + VarToStr(dbldProduto.KeyValue);
    cds := TKardex.imprimirMovimentacao(dtpInicio.Date, dtpFim.Date, dbldProduto.KeyValue);
    QRImprimirMovimentacao.DataSet := cds;
    QRImprimirMovimentacao.QRSubDetail1.DataSet := cds;
    QRImprimirMovimentacao.Preview;
  finally
    FreeAndNil(QRImprimirMovimentacao);
  end;
end;

procedure TFImprimirMovimentacao.cbProdutoClick(Sender: TObject);
begin
  if cbProduto.Checked then
  begin
    dbldProduto.KeyValue := null;
    dblcProduto.KeyValue := null;
  end;

end;

end.
