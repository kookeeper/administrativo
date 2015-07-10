unit UImprimirMalaDiretaRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, QuickRpt, QRCtrls;

type
  TFImprimirMalaDiretaRpt = class(TQuickRep)
    QRSubDetail1: TQRSubDetail;
    qrmCliente2: TQRMemo;
    qrmCliente1: TQRMemo;
    qrmCliente3: TQRMemo;
    qrmCliente4: TQRMemo;
    qrmCliente5: TQRMemo;
    qrmCliente6: TQRMemo;
    procedure QRSubDetail1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    procedure criaMemo(etiqueta: TQRMemo);
  public

  end;

var
  FImprimirMalaDiretaRpt: TFImprimirMalaDiretaRpt;

implementation

uses UDM, UImprimirMalaDireta;

{$R *.DFM}

procedure TFImprimirMalaDiretaRpt.criaMemo(etiqueta: TQRMemo);
var
  s :string;
begin
  etiqueta.Lines.Clear;
  if not FImprimirMalaDireta.cds.Eof then
  begin
    etiqueta.Lines.Add(FImprimirMalaDireta.cds.FieldByName('NOME_CLIENTE').AsString);

    s := FImprimirMalaDireta.cds.FieldByName('ENDERECO').AsString;
    if FImprimirMalaDireta.cds.FieldByName('NUMERO').AsString <> '' then
      s := s + ', ' + FImprimirMalaDireta.cds.FieldByName('NUMERO').AsString;
    if FImprimirMalaDireta.cds.FieldByName('COMPL_ENDERECO').AsString <> '' then
      s := s + ', ' + FImprimirMalaDireta.cds.FieldByName('COMPL_ENDERECO').AsString;
    etiqueta.Lines.Add(s);

    s               := FImprimirMalaDireta.cds.FieldByName('CEP').AsString;
    Insert ('-', s, 6);
    etiqueta.Lines.Add(s + ' ' +
                       FImprimirMalaDireta.cds.FieldByName('BAIRRO').AsString);

    etiqueta.Lines.Add(FImprimirMalaDireta.cds.FieldByName('CIDADE').AsString + ' ' +
                       FImprimirMalaDireta.cds.FieldByName('ESTADO').AsString);

    etiqueta.Lines.Add('Contato: ' + FImprimirMalaDireta.cds.FieldByName('CONTATO').AsString);
  end;
end;

procedure TFImprimirMalaDiretaRpt.QRSubDetail1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  criaMemo(qrmCliente1);
  if FImprimirMalaDireta.colunas >= 2 then
  begin
    FImprimirMalaDireta.cds.Next;
    criaMemo(qrmCliente2);
    if FImprimirMalaDireta.colunas >= 3 then
    begin
      FImprimirMalaDireta.cds.Next;
      criaMemo(qrmCliente3);
      if FImprimirMalaDireta.colunas >= 4 then
      begin
        FImprimirMalaDireta.cds.Next;
        criaMemo(qrmCliente4);
        if FImprimirMalaDireta.colunas >= 5 then
        begin
          FImprimirMalaDireta.cds.Next;
          criaMemo(qrmCliente5);
          if FImprimirMalaDireta.colunas >= 6 then
          begin
            FImprimirMalaDireta.cds.Next;
            criaMemo(qrmCliente6);
          end;
        end;
      end;
    end;
  end;
end;

end.
