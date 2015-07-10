unit UImprimirDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFImprimirDuplicatas = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    Edit1: TRzNumericEdit;
    procedure bbImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirDuplicatas: TFImprimirDuplicatas;

implementation

uses UDM, UImprimirDuplicatasRpt, Nfiscal, Cadastro, Duplicata;

{$R *.dfm}

procedure TFImprimirDuplicatas.bbImprimirClick(Sender: TObject);
begin
  try
    bbImprimir.Enabled := False;
    FImprimirDuplicatasRpt := TFImprimirDuplicatasRpt.Create(Self);

    FImprimirDuplicatasRpt.nfiscal := TNfiscal.CreateNumero(Edit1.IntValue);
    FImprimirDuplicatasRpt.cdsDuplicatas := FImprimirDuplicatasRpt.nfiscal.listaDuplicatas;
    FImprimirDuplicatasRpt.DataSet := FImprimirDuplicatasRpt.cdsDuplicatas;
    FImprimirDuplicatasRpt.QRSubDetail1.DataSet := FImprimirDuplicatasRpt.cdsDuplicatas;
    FImprimirDuplicatasRpt.QRDBText13.DataSet := FImprimirDuplicatasRpt.cdsDuplicatas;
    FImprimirDuplicatasRpt.QRDBText14.DataSet := FImprimirDuplicatasRpt.cdsDuplicatas;
    FImprimirDuplicatasRpt.QRDBText15.DataSet := FImprimirDuplicatasRpt.cdsDuplicatas;
    FImprimirDuplicatasRpt.QRDBText18.DataSet := FImprimirDuplicatasRpt.cdsDuplicatas;

    if FImprimirDuplicatasRpt.cdsDuplicatas.RecordCount = 0 then
      raise Exception.Create ('Não há duplicatas com esta numeração!');

    FImprimirDuplicatasRpt.Preview;
  finally
    FreeAndNil(FImprimirDuplicatasRpt);
    bbImprimir.Enabled := True;
  end;
end;

end.
