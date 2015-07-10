unit UImportaEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Registry;

type
  TRegistro = record
     Barcode: String;
     Modelo: String;
  end;

type
  TFImportaEntradas = class(TForm)
    Label1: TLabel;
    edArquivo: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Registros: array[0..9999] of TRegistro;
    { Private declarations }
    procedure IncluiCompra (Barcode, Modelo: String);
  public
    { Public declarations }
  end;

var
  FImportaEntradas: TFImportaEntradas;

implementation

uses UDMLista, UCadastrarFormMovimentacoes, UDM;

{$R *.dfm}

procedure TFImportaEntradas.IncluiCompra (Barcode, Modelo: String);
var
  Mensagem: String;
begin
  DMLista.cdsListaPecas.Open;
  DMLista.cdsListaPecas.Locate ('CODIGO_PECA', Modelo, []);

  DM.SCServer.Open;
  Mensagem := DM.SCServer.AppServer.CriaRegistro ('KARDEX_PECAS', True, 0,
    VarArrayOf ([DMLista.cdsListaPecasPECA_SQ.AsInteger,
      '1', //entrada
      1, //quantidade
      Date + Time,
      0, //nota fiscal
      0, //valor
      DM.useq,
      BarCode]));
  if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
  DM.EnviarEmail ('KARDEX_PECAS', 'GRAVAR', Mensagem, True);
end;

procedure TFImportaEntradas.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    edArquivo.Text := OpenDialog1.FileName;
end;

procedure TFImportaEntradas.bbOkClick(Sender: TObject);
var
  f: TextFile;
  i: integer;
  Modelo, s: String;
begin
  DMLista.cdsListaPecas.Open;
  AssignFile (F, edArquivo.Text);
  Reset (F);
  i := 0;
  While not Eof (F) do
  begin
    Readln (F, s);
    if DMLista.cdsListaPecas.Locate ('CODIGO_PECA', s, []) then
      Modelo := s else
    begin
      Registros[i].Modelo := Modelo;
      Registros[i].Barcode := s;
      inc (i);
    end;
  end;
  CloseFile(F);
  for i := Low (Registros) to High (Registros) do
  begin
    if Registros[i].Modelo <> '' then
      IncluiCompra (Registros[i].Barcode, Registros[i].Modelo);
  end;
//  DM.SCServer.Close;
//  DMLista.SCServerLista.Close;
  ShowMessage('Importação das Entradas efetuada com sucesso!');
  bbCancelar.SetFocus;
end;

procedure TFImportaEntradas.FormCreate(Sender: TObject);
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
      OpenDialog1.InitialDir := Reg.ReadString ('DirImportacao');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

procedure TFImportaEntradas.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
      Reg.WriteString ('DirImportacao', OpenDialog1.InitialDir);
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

end.
