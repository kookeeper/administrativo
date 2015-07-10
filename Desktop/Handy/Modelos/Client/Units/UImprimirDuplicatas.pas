unit UImprimirDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TFImprimirDuplicatas = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    Edit1: TEdit;
    procedure bbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirDuplicatas: TFImprimirDuplicatas;

implementation

uses UDMImpr, UImprimirDuplicatasRpt;

{$R *.dfm}

procedure TFImprimirDuplicatas.bbImprimirClick(Sender: TObject);
begin
  try
    bbImprimir.Enabled := False;
    DMImpr.cdsImprNf.Close;
    DMImpr.cdsImprNf.Params.ParamByName('NUMERO_NFISCAL').AsInteger := StrtoInt (Edit1.Text);
    DMImpr.cdsImprNf.Open;
    DMImpr.cdsImprNf.Refresh;
    DMImpr.cdsImprNfDups.Close;
    DMImpr.cdsImprNfDups.Params.ParamByName('NFISCAL_SQ').AsInteger := DMImpr.cdsImprNfNFISCAL_SQ.AsInteger;
    DMImpr.cdsImprNfDups.Open;
    DMImpr.cdsImprNfDups.Refresh;

    if DMimpr.cdsImprNfDups.RecordCount = 0 then
      raise Exception.Create ('Não há duplicatas com esta numeração!');

    Application.CreateForm(TFImprimirDuplicatasRpt, FImprimirDuplicatasRpt);
    FImprimirDuplicatasRpt.Preview;
    FImprimirDuplicatasRpt.Free;
  finally
    bbImprimir.Enabled := True;
    DMImpr.cdsImprNfDups.Close;
    DMImpr.cdsImprNf.Close;
  end;
end;

end.
