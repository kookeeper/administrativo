unit UConsultarNfiscaisSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls,
  ComCtrls;

type
  TFConsultarNFiscaisSerie = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    bbFechar: TBitBtn;
    edSerie: TEdit;
    Timer1: TTimer;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure edSerieChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    Valor: Real;
    Qtde: Integer;
    { Public declarations }
  end;

var
  FConsultarNFiscaisSerie: TFConsultarNFiscaisSerie;

implementation

uses UDMLista, UDMImpr, UImprimirNfiscaisVendRpt, UCadastrarListaNfiscais,
  UCadastrarFormNfiscais;

{$R *.dfm}

procedure TFConsultarNFiscaisSerie.DBGrid1DblClick(Sender: TObject);
begin
  FCadastrarListaNfiscais.cbFiltro.Text := 'Número';
  FCadastrarListaNfiscais.edFiltro.Text := DMImpr.cdsImprNfSerieNUMERO_NFISCAL.AsString;
  FCadastrarListaNfiscais.sbFiltro.Click;
  FCadastrarListaNfiscais.sbEditarClick(Sender);
end;

procedure TFConsultarNFiscaisSerie.DBGrid1DrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
  if DataSource1.DataSet.FieldByName('CANCELADA').AsString = 'S' then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.Canvas.Font.Style := [fsBold];
  end
  else DBGrid1.Canvas.Font.Color := clWindowText;

  DBGrid1.Canvas.TextRect(Rect, Rect.Left, Rect.Top, Field.Text);
end;

procedure TFConsultarNFiscaisSerie.edSerieChange(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFConsultarNFiscaisSerie.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  DMImpr.cdsImprNfSerie.Close;
  DMImpr.cdsImprNfSerie.Params.ParamByName('NR_SERIE_ITEM').AsString := edSerie.Text;
  DMImpr.cdsImprNfSerie.Open;
end;

end.
