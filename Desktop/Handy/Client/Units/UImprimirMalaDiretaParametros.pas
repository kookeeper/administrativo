unit UImprimirMalaDiretaParametros;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TFImprimirMalaDiretaParametros = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    meMargemEsq: TMaskEdit;
    meMargemDir: TMaskEdit;
    meMargemSup: TMaskEdit;
    meAlturaEti: TMaskEdit;
    meCompriEti: TMaskEdit;
    meColunas: TMaskEdit;
    Label9: TLabel;
    meFonte: TMaskEdit;
    Panel1: TPanel;
    bbFechar: TBitBtn;
    bbImprimir: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImprimirMalaDiretaParametros: TFImprimirMalaDiretaParametros;

implementation

{$R *.dfm}

end.
