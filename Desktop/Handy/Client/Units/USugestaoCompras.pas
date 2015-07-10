unit USugestaoCompras;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ExtCtrls, StdCtrls;

type
  TFSugestaoCompras = class(TForm)
    dsSugestaoCompra: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    rgMeses: TRadioGroup;
    rgSugestao: TRadioGroup;
    rgTipo: TRadioGroup;
    pnLinha: TPanel;
    procedure rgMesesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSugestaoCompras: TFSugestaoCompras;

implementation

uses Produto;

{$R *.dfm}

procedure TFSugestaoCompras.rgMesesClick(Sender: TObject);
var
  fatorCompra: Double;
begin

  if rgSugestao.ItemIndex = 0 then fatorCompra := 0.25;
  if rgSugestao.ItemIndex = 1 then fatorCompra := 0.5;
  if rgSugestao.ItemIndex = 2 then fatorCompra := 1;
  if rgSugestao.ItemIndex = 3 then fatorCompra := 2;

  dsSugestaoCompra.DataSet := TProduto.listaSugestaoCompra(rgTipo.ItemIndex + 1, rgMeses.ItemIndex + 1, fatorCompra);

  DBGrid1.Columns.Items[4].Visible  := rgMeses.ItemIndex >= 90;
  DBGrid1.Columns.Items[5].Visible  := rgMeses.ItemIndex >= 91;
  DBGrid1.Columns.Items[6].Visible  := rgMeses.ItemIndex >= 92;
  DBGrid1.Columns.Items[7].Visible  := rgMeses.ItemIndex >= 93;
  DBGrid1.Columns.Items[8].Visible  := rgMeses.ItemIndex >= 94;
  DBGrid1.Columns.Items[9].Visible  := rgMeses.ItemIndex >= 95;
  DBGrid1.Columns.Items[10].Visible := rgMeses.ItemIndex >= 96;
  DBGrid1.Columns.Items[11].Visible := rgMeses.ItemIndex >= 97;
  DBGrid1.Columns.Items[12].Visible := rgMeses.ItemIndex >= 98;
  DBGrid1.Columns.Items[13].Visible := rgMeses.ItemIndex >= 99;
  DBGrid1.Columns.Items[14].Visible := rgMeses.ItemIndex >= 910;
  DBGrid1.Columns.Items[15].Visible := rgMeses.ItemIndex >= 911;
end;

end.
