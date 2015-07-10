unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBDatabase, IBCustomDataSet, IBTable, ComCtrls, Registry,
  DBTables, Buttons;

type
  TForm1 = class(TForm)
    btnOk: TButton;
    btnCancelar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    dtpAtual: TDateTimePicker;
    dtpNova: TDateTimePicker;
    qrEmpresas: TQuery;
    Database1: TDatabase;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregaSenha (Data: TDate);
    function VerificaSenha (): Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function TForm1.VerificaSenha (): Integer;
var
  i1: integer;
  s1, s2: string;
  r1: Real;
begin
  try
    Result := 1;
    qrEmpresas.SQL.Clear;
    qrEmpresas.SQL.Add('UPDATE empresas SET');
    qrEmpresas.SQL.Add('ACESSOS = ACESSOS + 1');
    qrEmpresas.ExecSQL;

    qrEmpresas.SQL.Clear;
    qrEmpresas.SQL.Add('SELECT * FROM empresas');
    qrEmpresas.Open;

    if qrEmpresas.FieldByName('SENHA').AsString = '' then
    begin
      CarregaSenha (Date);
      qrEmpresas.SQL.Clear;
      qrEmpresas.SQL.Add('SELECT * FROM empresas');
      qrEmpresas.Open;
    end;
    s1 := '';
    for i1 := 1 to 14 do
    begin
      s2 := InttoStr (Pos (Copy (qrEmpresas.FieldByName('SENHA').AsString, i1, 1), 'SergioPaulo'));
      if s2 <> '0' then
      begin
        if s2 = '10' then s2 := '0';
        s1 := Concat (s1, s2);
      end;
    end;
    r1 := StrToFloat (s1);
    r1 := r1-qrEmpresas.FieldByName('CODIGO_EMPRESA').AsFloat;
    r1 := Sqrt (r1);
    dtpAtual.Date := r1;
    if r1 < date then
      raise Exception.Create ('Senha desatualizada!');
    dtpNova.Date := r1 + 60;
    qrEmpresas.Close;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
      Result := 0;
    end;
  end;
end;

procedure TForm1.CarregaSenha (Data: TDate);
var
  i1, i2: integer;
  s1, s2: string;
  r1: Real;
begin
  qrEmpresas.Open;
  qrEmpresas.First;
  r1 := Int (Data);
  r1 := r1*r1;
  r1 := r1 + qrEmpresas.FieldByName('CODIGO_EMPRESA').AsFloat;
  s1 := '';
  for i1 := 1 to 14 do
  begin
    s2 := Copy (FloattoStr (r1), i1, 1);
    if s2 <> '' then
    begin
      i2 := Pos (s2, '1234567890');
      s2 := Copy ('SergioPaulo', i2, 1);
    end
    else s2 := ' ';
    s1 := Concat (s1, s2);
  end;
  qrEmpresas.SQL.Clear;
  qrEmpresas.SQL.Add('UPDATE empresas SET');
  qrEmpresas.SQL.Add('SENHA = ''' + s1 + '''');
  qrEmpresas.ExecSQL;
end;

procedure TForm1.btnOkClick(Sender: TObject);
begin
  CarregaSenha (dtpNova.Date);
  Close;
end;

procedure TForm1.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Database1.Connected := True;
  VerificaSenha ();
end;

end.
