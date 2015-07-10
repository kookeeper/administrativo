unit UCadastrarFormCondPagto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls,
  RzEdit;

type
  TFCadastrarFormCondPagto = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edDescricao: TRzEdit;
    edParcelas: TRzNumericEdit;
    edD00: TRzNumericEdit;
    edD01: TRzNumericEdit;
    edD02: TRzNumericEdit;
    edD03: TRzNumericEdit;
    edD04: TRzNumericEdit;
    edD05: TRzNumericEdit;
    edD06: TRzNumericEdit;
    edD07: TRzNumericEdit;
    edD08: TRzNumericEdit;
    edD09: TRzNumericEdit;
    edP00: TRzNumericEdit;
    edP01: TRzNumericEdit;
    edP02: TRzNumericEdit;
    edP03: TRzNumericEdit;
    edP04: TRzNumericEdit;
    edP05: TRzNumericEdit;
    edP06: TRzNumericEdit;
    edP07: TRzNumericEdit;
    edP08: TRzNumericEdit;
    edP09: TRzNumericEdit;
    edCodigo: TRzNumericEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormCondPagto: TFCadastrarFormCondPagto;

implementation

uses UDM, UCadastrarListaComum, CondPagto, DateUtils, Cadastro;

{$R *.DFM}

procedure TFCadastrarFormCondPagto.bbOkClick(Sender: TObject);
var
  i: integer;
begin
  inherited;
  if (edParcelas.IntValue < 0) or (edParcelas.IntValue > 10) then
    raise Exception.Create ('O Número de Parcelas pode ser entre 0 e 10.');

  i := edP00.IntValue + edP01.IntValue + edP02.IntValue + edP03.IntValue +
       edP04.IntValue + edP05.IntValue + edP06.IntValue + edP07.IntValue +
       edP08.IntValue + edP09.IntValue;

  if (i <> 0) and (i <> 100) then
    raise Exception.Create('Soma das Porcentagens não é igual a "100%"');

  with (Owner as TFCadastrarListaComum).registro as TCondPagto do
  begin
    codigo_cond_pagto := edCodigo.IntValue;
    descricao_cond_pagto := edDescricao.Text;
    parcelas := edParcelas.IntValue;
    d00 := edD00.IntValue;
    d01 := edD01.IntValue;
    d02 := edD02.IntValue;
    d03 := edD03.IntValue;
    d04 := edD04.IntValue;
    d05 := edD05.IntValue;
    d06 := edD06.IntValue;
    d07 := edD07.IntValue;
    d08 := edD08.IntValue;
    d09 := edD09.IntValue;
    p00 := edP00.IntValue;
    p01 := edP01.IntValue;
    p02 := edP02.IntValue;
    p03 := edP03.IntValue;
    p04 := edP04.IntValue;
    p05 := edP05.IntValue;
    p06 := edP06.IntValue;
    p07 := edP07.IntValue;
    p08 := edP08.IntValue;
    p09 := edP09.IntValue;
    salvar;
  end;
end;

procedure TFCadastrarFormCondPagto.FormCreate(Sender: TObject);
begin
  inherited;
  with (Owner as TFCadastrarListaComum) do
  if not novo then
  with (registro as TCondPagto) do
  begin
    edCodigo.IntValue   := codigo_cond_pagto;
    edDescricao.Text    := descricao_cond_pagto;
    edParcelas.IntValue := parcelas;
    edD00.IntValue      :=d00;
    edD01.IntValue      :=d01;
    edD02.IntValue      :=d02;
    edD03.IntValue      :=d03;
    edD04.IntValue      :=d04;
    edD05.IntValue      :=d05;
    edD06.IntValue      :=d06;
    edD07.IntValue      :=d07;
    edD08.IntValue      :=d08;
    edD09.IntValue      :=d09;
    edP00.IntValue      :=p00;
    edP01.IntValue      :=p01;
    edP02.IntValue      :=p02;
    edP03.IntValue      :=p03;
    edP04.IntValue      :=p04;
    edP05.IntValue      :=p05;
    edP06.IntValue      :=p06;
    edP07.IntValue      :=p07;
    edP08.IntValue      :=p08;
    edP09.IntValue      :=p09;
  end
  else
    edCodigo.Text := InttoStr((registro as TCondPagto).proximo);
end;

end.
