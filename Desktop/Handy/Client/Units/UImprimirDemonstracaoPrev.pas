unit UImprimirDemonstracaoPrev;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, Grids, DBGrids, ExtCtrls, Mask, RzEdit;

type
  TFImprimirDemonstracaoPrev = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    Label2: TLabel;
    edInicio: TRzEdit;
    edFim: TRzEdit;
    procedure edInicioChange(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirDemonstracaoPrev: TFImprimirDemonstracaoPrev;

implementation

uses UDM, UImprimirDemonstracaoPrevRpt;

{$R *.dfm}

procedure TFImprimirDemonstracaoPrev.edInicioChange(Sender: TObject);
begin
  try
    DM.cdsImprDemPrev.Close;
    StrtoDate (edInicio.Text);
    StrtoDate (edFim.Text);
    DM.cdsImprDemPrev.Params.ParamByName ('INICIO').AsString := FormatDateTime ('dd/mm/yyyy', StrtoDate (edInicio.Text));
    DM.cdsImprDemPrev.Params.ParamByName ('FIM').AsString    := FormatDateTime ('dd/mm/yyyy', StrtoDate (edFim.Text));
    DM.cdsImprDemPrev.Open;
  except
  end;
end;

procedure TFImprimirDemonstracaoPrev.bbImprimirClick(Sender: TObject);
begin
  bbImprimir.Enabled := False;
  Application.CreateForm(TFImprimirDemonstracaoPrevRpt, FImprimirDemonstracaoPrevRpt);
  FImprimirDemonstracaoPrevRpt.QRLabel1.Caption := FImprimirDemonstracaoPrevRpt.QRLabel1.Caption + ' - de ' + edInicio.Text + ' até ' + edFim.Text;
  FImprimirDemonstracaoPrevRpt.Preview;
  FImprimirDemonstracaoPrevRpt.Free;
  bbImprimir.Enabled := True;
end;

end.
