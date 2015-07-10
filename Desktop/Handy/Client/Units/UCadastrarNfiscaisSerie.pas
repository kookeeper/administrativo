unit UCadastrarNfiscaisSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TFCadastrarNfiscaisSerie = class(TForm)
    lbNfiscal: TLabel;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    bbFechar: TBitBtn;
    dsListaNfiscaisItens: TDataSource;
    BitBtn1: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarNfiscaisSerie: TFCadastrarNfiscaisSerie;

implementation

uses UDM, UCadastrarNfiscaisSerie2, Nfiscal;

{$R *.dfm}

procedure TFCadastrarNfiscaisSerie.DBGrid1DblClick(Sender: TObject);
var
//  mensagem: string;
  item: TNfiscalItem;
begin
  FCadastrarNfiscaisSerie2 := TFCadastrarNfiscaisSerie2.Create(Self);
  FCadastrarNfiscaisSerie2.mmSerie.Text := dsListaNfiscaisItens.DataSet.FieldByName('NR_SERIE_ITEM').AsString;
  if FCadastrarNfiscaisSerie2.ShowModal = mrOk then
  begin
    item := TNfiscalItem.Create(dsListaNfiscaisItens.DataSet.FieldByName('NFISCAL_ITEM_SQ').asInteger);
    item.nr_serie_item := FCadastrarNfiscaisSerie2.mmSerie.Text;
    item.salvar;

    dsListaNfiscaisItens.DataSet := TNfiscal.Create(item.nfiscal_sq).listaItens;
  end;
  FCadastrarNfiscaisSerie2.Free;
end;

end.
