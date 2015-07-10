unit teste;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ncm, Mask, RzEdit, DBClient;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    edit: TRzNumericEdit;
    Button2: TButton;
    Button3: TButton;
    ncm: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    ncmField: TNCM;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Cadastro;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  ncmField := TNCM.Create(edit.intValue);
  Memo1.Lines.Add(ncmField.codigo_nbm + '|' + FloatToStr(ncmField.aliq_icms) + '|' + FloatToStr(ncmField.aliq_ipi) + '|' + FloatToStr(ncmField.aliq_iva));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  cds: TClientDataSet;
begin
  Memo1.Clear;
  cds := TNCM.listaRegistros;
  while not cds.Eof do
  begin
    Memo1.Lines.Add(cds.FieldByName('codigo_nbm').AsString + '|' + cds.FieldByName('aliq_icms').AsString + '|' + cds.FieldByName('aliq_ipi').AsString + '|' + cds.FieldByName('aliq_iva').AsString);
    cds.Next;
  end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ncmField := TNCM.Create(edit.IntValue);
  ncmField.codigo_nbm := ncm.Text;
  ncmField.salvar;
  Button1.Click;
end;

end.
