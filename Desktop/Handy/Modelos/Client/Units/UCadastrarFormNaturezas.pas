unit UCadastrarFormNaturezas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls;

type
  TFCadastrarFormNaturezas = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCodigo: TEdit;
    edDescricao1: TEdit;
    edDescricao2: TEdit;
    edCFOP: TEdit;
    edICMS: TEdit;
    edIPI: TEdit;
    cbICMS: TCheckBox;
    cbIPI: TCheckBox;
    rgEntSai: TRadioGroup;
    edUF01: TEdit;
    edUF02: TEdit;
    edUF03: TEdit;
    edUF04: TEdit;
    edUF05: TEdit;
    edUF06: TEdit;
    edUF07: TEdit;
    edUF08: TEdit;
    edUF09: TEdit;
    edUF10: TEdit;
    edUF11: TEdit;
    edUF12: TEdit;
    edUF13: TEdit;
    edUF14: TEdit;
    edUF15: TEdit;
    edUF16: TEdit;
    edUF17: TEdit;
    edUF18: TEdit;
    edUF19: TEdit;
    edUF20: TEdit;
    edUF21: TEdit;
    edUF22: TEdit;
    edUF23: TEdit;
    edUF24: TEdit;
    edUF25: TEdit;
    edUF26: TEdit;
    edUF27: TEdit;
    edUF28: TEdit;
    edUF29: TEdit;
    edUF30: TEdit;
    edUF31: TEdit;
    edUF32: TEdit;
    edUF33: TEdit;
    mmObservacao: TMemo;
    rgTipo: TRadioGroup;
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    estado: array of string;
  end;

var
  FCadastrarFormNaturezas: TFCadastrarFormNaturezas;

implementation

uses UDM;

{$R *.DFM}

procedure TFCadastrarFormNaturezas.bbOkClick(Sender: TObject);
var
  i1, i2: integer;
  uf1, uf2: string;
begin
  inherited;
  SetLength (estado, 30);
  estado[0]  := edUF01.Text;
  estado[1]  := edUF02.Text;
  estado[2]  := edUF03.Text;
  estado[3]  := edUF04.Text;
  estado[4]  := edUF05.Text;
  estado[5]  := edUF06.Text;
  estado[6]  := edUF07.Text;
  estado[7]  := edUF08.Text;
  estado[8]  := edUF09.Text;
  estado[9]  := edUF10.Text;
  estado[10] := edUF11.Text;
  estado[11] := edUF12.Text;
  estado[12] := edUF13.Text;
  estado[13] := edUF14.Text;
  estado[14] := edUF15.Text;
  estado[15] := edUF16.Text;
  estado[16] := edUF17.Text;
  estado[17] := edUF18.Text;
  estado[18] := edUF19.Text;
  estado[19] := edUF20.Text;
  estado[20] := edUF21.Text;
  estado[21] := edUF22.Text;
  estado[22] := edUF23.Text;
  estado[23] := edUF24.Text;
  estado[24] := edUF25.Text;
  estado[25] := edUF26.Text;
  estado[26] := edUF27.Text;
  estado[27] := edUF28.Text;
  estado[28] := edUF29.Text;
  estado[29] := edUF30.Text;

  ModalResult := mrNone;

  if edICMS.Text = '' then
    edICMS.Text := '0';

  if edIPI.Text = '' then
    edIPI.Text := '0';

  if edCFOP.Text = '' then
    raise Exception.Create ('C.F.O.P. Inválido!');
    
  if edDescricao1.Text = '' then
    raise Exception.Create ('Descrição da Natureza Inválida!');

  i1 := 0;
  While i1 < 30 do
  begin
    uf1 := estado[i1];
    if uf1 <> '' then if Pos (uf1, DM.estados) = 0 then
      raise Exception.Create('Estado Inválido! (' + uf1 + ')');
    i2 := i1+1;
    While i2 < 30 do
    begin
      uf2 := estado[i2];
      if uf1 = uf2 then if uf2 <> '' then if uf1 <> '' then
        raise Exception.Create('Cadastro de Estados duplicado! (' + uf1 + ')');
    inc (i2);
    end;
    inc (i1);
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormNaturezas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
