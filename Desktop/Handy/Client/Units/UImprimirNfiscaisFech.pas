unit UImprimirNfiscaisFech;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Buttons, Grids, DBGrids, ComCtrls, ExtCtrls;

type
  TFImprimirNfiscaisFech = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    dtpInicio: TDateTimePicker;
    dtpFim: TDateTimePicker;
    Panel1: TPanel;
    Label3: TLabel;
    lbItens: TLabel;
    lbValor: TLabel;
    Label6: TLabel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    dsImprNfFech: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    dsImprNFServicos: TDataSource;
    DBGrid2: TDBGrid;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    dsImprNFClientes: TDataSource;
    procedure dtpInicioChange(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Valor: Real;
    Qtde: Integer;
    icms, icmssub, ipi: array[0..12] of Real;
    procedure acumulaImposto();
  end;

var
  FImprimirNfiscaisFech: TFImprimirNfiscaisFech;

implementation

uses UDM, UImprimirNfiscaisFechRpt, UCadastrarListaNfiscais, Nfiscal,
  QuickRpt;

{$R *.dfm}

procedure TFImprimirNFiscaisFech.acumulaImposto();
var
  mes, ano, i: integer;
  dti, dtf: TDateTime;
  datai, dataf: String;
begin
  for i := 0 to 12 do
  begin
    icms[i] := 0;
    icmssub[i] := 0;
    ipi[i]  := 0;
  end;

  dsImprNfFech.Enabled := False;
  dsImprNFServicos.Enabled := False;

  mes := StrtoInt (FormatDateTime ('yyyy', dtpInicio.Date)) * 12 + StrtoInt (FormatDateTime ('mm', dtpInicio.Date));
  ano := StrtoInt (FormatDateTime ('yyyy', dtpInicio.Date));
  dec (ano);

  dti := StrToDate('01/' + FormatDateTime ('mm/', dtpInicio.Date) + IntToStr(ano));
  dtf := dtpInicio.Date - 1;

  datai := InttoStr (ano) + FormatDateTime ('-mm-', dtpInicio.Date) + '01';
  dataf := FormatDatetime ('yyyy-mm-dd', dtpInicio.Date - 1);

  dsImprNfFech.DataSet := TNfiscal.listaFechamentoNota(dti, dtf);

  dsImprNFClientes.DataSet := TNfiscal.listaFechamentoNotaCliente(dti, dtf);

  dsImprNfFech.DataSet.First;
  While not dsImprNfFech.DataSet.Eof do
  begin
    if dsImprNfFech.DataSet.FieldByName('CANCELADA').AsString <> 'S' then
    begin
      i := mes - (StrtoInt (FormatDateTime ('yyyy', dsImprNfFech.DataSet.FieldByName('DTEMISSAO_NFISCAL').AsDateTime)) * 12 + StrtoInt (FormatDateTime ('mm', dsImprNfFech.DataSet.FieldByName('DTEMISSAO_NFISCAL').AsDateTime)));
      if dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'E' then
      begin
        icms[i] := icms[i] + dsImprNfFech.DataSet.FieldByName('VLR_ICMS').Value;
        icmssub[i] := icmssub[i] + dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').Value;
        ipi[i]  := ipi[i]  + dsImprNfFech.DataSet.FieldByName('VLR_IPI').Value;
      end else
      if dsImprNfFech.DataSet.FieldByName('ENT_SAI').AsString = 'S' then
      begin
        icms[i] := icms[i] - dsImprNfFech.DataSet.FieldByName('VLR_ICMS').Value;
        icmssub[i] := icmssub[i] - dsImprNfFech.DataSet.FieldByName('VLR_ICMS_SUBST').Value;
        ipi[i]  := ipi[i]  - dsImprNfFech.DataSet.FieldByName('VLR_IPI').Value;
      end;
    end;
    dsImprNfFech.DataSet.Next;
  end;

  dsImprNFClientes.DataSet.First;
  While not dsImprNFClientes.DataSet.Eof do
  begin
    i := mes - (StrtoInt (FormatDateTime ('yyyy', dsImprNFClientes.DataSet.FieldByName('DTEMISSAO').AsDateTime)) * 12 + StrtoInt (FormatDateTime ('mm', dsImprNFClientes.DataSet.FieldByName('DTEMISSAO').AsDateTime)));
    icms[i] := icms[i] + dsImprNFClientes.DataSet.FieldByName('VLR_ICMS').Value;
    ipi[i]  := ipi[i]  + dsImprNFClientes.DataSet.FieldByName('VLR_IPI').Value;
    dsImprNFClientes.DataSet.Next;
  end;

  i := 12;
  while i > 0 do
  begin
    icms[0] := icms[0] + icms[i];
    icmssub[0] := icmssub[0] + icmssub[i];
    ipi[0]  := ipi[0]  + ipi[i];
    if icms[0] < 0 then icms[0] := 0;
    if icmssub[0] < 0 then icmssub[0] := 0;
    if ipi[0]  < 0 then ipi[0]  := 0;
    dec (i);
  end;

  dsImprNfFech.Enabled := True;
  dsImprNFServicos.Enabled := True;
  dtpInicio.OnChange (self);
end;

procedure TFImprimirNfiscaisFech.dtpInicioChange(Sender: TObject);
begin
  dsImprNfFech.Enabled := False;
  dsImprNfFech.DataSet := TNfiscal.listaFechamentoNota(dtpInicio.Date, dtpFim.Date);

  Valor := 0;
  Qtde  := 0;
  While not dsImprNfFech.DataSet.Eof do
  begin
    Valor := Valor + dsImprNfFech.DataSet.FieldByName('VLR_TOTAL').Value;
    Qtde  := Qtde  + 1;
    dsImprNfFech.DataSet.Next;
  end;
  dsImprNfFech.DataSet.First;
  lbItens.Caption := IntToStr (Qtde);
  lbValor.Caption := FloattoStrf (Valor, ffCurrency, 10, 2);
  dsImprNfFech.Enabled := True;

  dsImprNFClientes.DataSet := TNfiscal.listaFechamentoNotaCliente(dtpInicio.Date, dtpFim.Date);

  dsImprNFServicos.DataSet := TNfiscal.listaFechamentoNotaServico(dtpInicio.Date, dtpFim.Date);
end;

procedure TFImprimirNfiscaisFech.bbImprimirClick(Sender: TObject);
begin
  dsImprNfFech.DataSet.DisableControls;
  dsImprNFClientes.DataSet.DisableControls;
  dsImprNFServicos.DataSet.DisableControls;
  bbImprimir.Enabled := False;
  bbFechar.Enabled := False;
  acumulaImposto;

  try
    FImprimirNFiscaisFechRpt := TFImprimirNFiscaisFechRpt.Create(Self);
    FImprimirNFiscaisFechRpt.QRLabel18.Caption := 'Fechamento de Notas - ' + FormatDateTime ('mmmm " de " yyyy', dtpInicio.Date);

    FImprimirNFiscaisFechRpt.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRSubDetail1.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText1.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText2.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText3.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText4.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText5.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText6.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText7.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText11.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText12.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText13.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText14.DataSet := dsImprNfFech.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText15.DataSet := dsImprNfFech.DataSet;

    FImprimirNFiscaisFechRpt.QRSubDetail3.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText18.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText19.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText20.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText21.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText22.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText23.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText24.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText26.DataSet := dsImprNFClientes.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText27.DataSet := dsImprNFClientes.DataSet;

    FImprimirNFiscaisFechRpt.QRSubDetail2.DataSet := dsImprNFServicos.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText16.DataSet := dsImprNFServicos.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText17.DataSet := dsImprNFServicos.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText25.DataSet := dsImprNFServicos.DataSet;
    FImprimirNFiscaisFechRpt.QRDBText30.DataSet := dsImprNFServicos.DataSet;

    FImprimirNFiscaisFechRpt.Preview;
  finally
    FreeAndNil(FImprimirNFiscaisFechRpt);
  end;

  bbImprimir.Enabled := True;
  bbFechar.Enabled := True;
  dsImprNfFech.DataSet.EnableControls;
  dsImprNFClientes.DataSet.EnableControls;
  dsImprNFServicos.DataSet.EnableControls;
end;

procedure TFImprimirNfiscaisFech.DBGrid1DblClick(Sender: TObject);
begin
  FCadastrarListaNfiscais := TFCadastrarListaNfiscais.Create(self);
  FCadastrarListaNfiscais.cbFiltro.Text := 'Número';
  FCadastrarListaNfiscais.edFiltro.Text := dsImprNfFech.DataSet.FieldByName('NUMERO_NFISCAL').AsString;
  FCadastrarListaNfiscais.sbFiltro.Click;
  FCadastrarListaNfiscais.sbEditarClick(Sender);
  FreeAndNil(FCadastrarListaNfiscais);
end;

procedure TFImprimirNfiscaisFech.FormActivate(Sender: TObject);
begin
  dtpInicio.Date := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  dtpFim.Date    := Date;
  dtpInicioChange(self);
end;

end.
