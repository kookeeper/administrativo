unit UImprimirEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, QuickRpt, QRCtrls;

type
  TFImprimirEstoque = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    RadioGroup1: TRadioGroup;
    procedure bbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirEstoque: TFImprimirEstoque;

implementation

uses UDM, UDMImpr, UImprimirEstoqueRpt;

{$R *.dfm}

procedure TFImprimirEstoque.bbImprimirClick(Sender: TObject);
begin
  DMImpr.cdsImprEst.Params.ParamByName('TIPO_PRODUTO').AsInteger := RadioGroup1.ItemIndex + 1;
  DMImpr.cdsImprEst.Open;
  Application.CreateForm(TFImprimirEstoqueRpt, FImprimirEstoqueRpt);
  FImprimirEstoqueRpt.Preview;
  FImprimirEstoqueRpt.Free;
  DMImpr.cdsImprEst.Close;
end;

end.
