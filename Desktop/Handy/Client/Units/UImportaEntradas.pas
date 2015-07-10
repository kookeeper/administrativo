unit UImportaEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Registry, Mask, RzEdit;

type
  TRegistro = record
     Barcode: String;
     Modelo: String;
  end;

type
  TFImportaEntradas = class(TForm)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    edArquivo: TRzEdit;
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

uses UDM, UCadastrarFormMovimentacoes, Produto, DBClient, Cadastro, Kardex,
  ProdutoFaltante, Usuario;

{$R *.dfm}

procedure TFImportaEntradas.IncluiCompra (Barcode, Modelo: String);
var
//  Mensagem: String;
  cds: TClientDataSet;
begin
  cds := TProduto.listaRegistros(' where codigo_produto = ' + QuotedStr(Modelo));

  with TKardex.Create do
  begin
    produto_sq  := TProduto.Create(cds.FieldByName('produto_sq').Value);
    tipo_mov    := 'E';
    valor       := 0;
    data        := Date + Time;
    nfiscal     := 0;
    usuario_sq  := TUsuario.Create(DM.useq);
    nr_serie    := Barcode;
    qtde        := 1;
    numero_estoque := 1;
    salvar;
  end;
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
  cds: TClientDataSet;
begin
  AssignFile (F, edArquivo.Text);
  Reset (F);
  i := 0;
  While not Eof (F) do
  begin
    Readln (F, s);
    cds := TProduto.listaRegistros(' where codigo_produto = ' + QuotedStr(Modelo));
    if cds.RecordCount > 0 then
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
