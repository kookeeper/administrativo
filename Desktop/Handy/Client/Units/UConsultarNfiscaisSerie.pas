unit UConsultarNfiscaisSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls,
  ComCtrls, Mask, RzEdit;

type
  TFConsultarNFiscaisSerie = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    bbFechar: TBitBtn;
    Timer1: TTimer;
    edSerie: TRzEdit;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edSerieChange(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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

uses UDM, UImprimirNfiscaisVendRpt, UCadastrarListaNfiscais,
  UCadastrarFormNfiscais, UMainMenu, Nfiscal;

{$R *.dfm}

procedure TFConsultarNFiscaisSerie.DBGrid1DblClick(Sender: TObject);
begin
  FMainMenu.NotasFiscais1.Click;
  FCadastrarListaNfiscais.cbFiltro.Text := 'Número';
  FCadastrarListaNfiscais.edFiltro.Text := DataSource1.DataSet.FieldByName('NUMERO_NFISCAL').AsString;
  FCadastrarListaNfiscais.sbFiltro.Click;
  FCadastrarListaNfiscais.sbEditarClick(Sender);
end;

procedure TFConsultarNFiscaisSerie.edSerieChange(Sender: TObject);
begin
  DataSource1.DataSet := TNfiscal.buscarNumeroSerie(edSerie.Text);
end;

procedure TFConsultarNFiscaisSerie.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if DataSource1.DataSet.FieldByName('CANCELADA').AsString = 'S' then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.Canvas.Font.Style := [fsBold];
  end
  else DBGrid1.Canvas.Font.Color := clWindowText;

  DBGrid1.Canvas.Brush.Color := clWhite;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.
