unit ULiberarAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, DBCtrls;

type
  TFLiberarAcessos = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    bbAtualizar: TBitBtn;
    DataSource1: TDataSource;
    bbCancelar: TBitBtn;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure bbAtualizarClick(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
  private
    FCheck, FNoCheck: TBitmap;
    { Private declarations }
  public
    usuario_sq: Integer;
    { Public declarations }
  end;

var
  FLiberarAcessos: TFLiberarAcessos;

implementation

uses UDM;

{$R *.dfm}

procedure TFLiberarAcessos.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  if not (gdFixed in State) and (ACol <> 0) then
  begin
    With (Sender as TStringGrid).Canvas do
    begin
      brush.color := $E0E0E0;
      Fillrect (rect);
      if StringGrid1.Cells[ACol, ARow] = 'S' then
        Draw ((rect.Right + rect.Left - FCheck.Width) div 2,
        (rect.Bottom + rect.Top - FCheck.Height) div 2,
        FCheck)
      else
        Draw ((rect.Right + rect.Left - FNoCheck.Width) div 2,
        (rect.Bottom + rect.Top - FNoCheck.Height) div 2,
        FNoCheck);
    end;
  end;
end;

procedure TFLiberarAcessos.FormCreate(Sender: TObject);
var
  bmp: TBitmap;
  i1, i2: Integer;
begin
  StringGrid1.ColWidths[0] := 300;
  StringGrid1.Cells[0,0] := 'Telas';
  StringGrid1.Cells[1,0] := 'Visualizar';
  StringGrid1.Cells[2,0] := 'Criar';
  StringGrid1.Cells[3,0] := 'Editar';
  StringGrid1.Cells[4,0] := 'Apagar';

  FCheck:= TBitmap.Create;
  FNoCheck:= TBitmap.Create;
  bmp:= TBitmap.create;
  try
    bmp.handle := LoadBitmap( 0, PChar(OBM_CHECKBOXES));
    With FNoCheck do
    begin
      width := bmp.width div 4;
      height := bmp.height div 3;
      canvas.copyrect( canvas.cliprect, bmp.canvas, canvas.cliprect );
    end;
    With FCheck do
    begin
      width := bmp.width div 4;
      height := bmp.height div 3;
      canvas.copyrect(
        canvas.cliprect,
        bmp.canvas,
        rect( width, 0, 2*width, height ));
    end;
  finally
    bmp.free
  end;

  i2 := 1;
  for i1 := 1 to 255 do
    if DM.captions[i1] <> '' then
    begin
      StringGrid1.Cells[0, i2] := DM.captions[i1];
      inc (i2);
      StringGrid1.RowCount := i2;
    end;
end;

procedure TFLiberarAcessos.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if StringGrid1.Selection.Left <> 0 then
  if StringGrid1.Cells[StringGrid1.Selection.Left, StringGrid1.Selection.Top] = 'S' then
    StringGrid1.Cells[StringGrid1.Selection.Left, StringGrid1.Selection.Top] := 'N'
      else StringGrid1.Cells[StringGrid1.Selection.Left, StringGrid1.Selection.Top] := 'S';
end;

procedure TFLiberarAcessos.bbAtualizarClick(Sender: TObject);
var
  i1, i2: Integer;
  Mensagem, s1, Valores: String;
  Novo: Boolean;
begin
  StringGrid1.Enabled := False;
  bbAtualizar.Enabled := False;
  bbCancelar.Enabled := False;
  for i1 := 1 to StringGrid1.RowCount-1 do
  begin
    s1 := '';
    for i2 := 1 to 255 do
      if DM.captions[i2] = StringGrid1.Cells[0,i1] then
        s1 := DM.programas[i2];
    if DM.cdsListaAcessos.Locate('NOME_PROGRAMA;USUARIO_SQ', VarArrayOf([s1, usuario_sq]), []) then
    begin
      Novo := False;
      Valores := DM.cdsListaAcessosACESSO_SQ.AsString;
    end
    else
    begin
      Novo := True;
      Valores := '0';
    end;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('Acessos', DM.useq, Novo, Valores,
      VarArrayOf ([
      s1,
      usuario_sq,
      StringGrid1.Cells[1, i1],
      StringGrid1.Cells[2, i1],
      StringGrid1.Cells[3, i1],
      StringGrid1.Cells[4, i1]]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail ('ACESSOS', 'GRAVAR', Mensagem, Novo);
  end;
  DM.cdsListaAcessos.Refresh;
  Showmessage ('Atualizações concluídas!');
end;

procedure TFLiberarAcessos.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Key: Char;
begin
  if button = mbleft then
    StringGrid1.OnKeyPress(Sender, Key);
end;

procedure TFLiberarAcessos.FormActivate(Sender: TObject);
var
  i1, i2: Integer;
  s1: String;
begin
  for i1 := 1 to StringGrid1.RowCount-1 do
  begin
    StringGrid1.Cells[1, i1] := 'N';
    StringGrid1.Cells[2, i1] := 'N';
    StringGrid1.Cells[3, i1] := 'N';
    StringGrid1.Cells[4, i1] := 'N';
  end;

  DM.cdsListaAcessos.Filter := 'USUARIO_SQ = ' + InttoStr(usuario_sq);
  DM.cdsListaAcessos.Filtered := True;
  DM.cdsListaAcessos.First;
  While not DM.cdsListaAcessos.Eof do
  begin
//    if DM.cdsListaAcessosUSUARIO_SQ.AsInteger = DM.cdsListaUsuariosUSUARIO_SQ.AsInteger then
    for i1 := 1 to StringGrid1.RowCount-1 do
    begin
      s1 := '';
      for i2 := 1 to 255 do
        if DM.programas[i2] = DM.cdsListaAcessosNOME_PROGRAMA.AsString then
          s1 := DM.captions[i2];
      if StringGrid1.Cells[0, i1] = s1 then
      begin
        StringGrid1.Cells[1, i1] := DM.cdsListaAcessosVISUALIZAR.AsString;
        StringGrid1.Cells[2, i1] := DM.cdsListaAcessosCRIAR.AsString;
        StringGrid1.Cells[3, i1] := DM.cdsListaAcessosEDITAR.AsString;
        StringGrid1.Cells[4, i1] := DM.cdsListaAcessosAPAGAR.AsString;
      end;
    end;
    DM.cdsListaAcessos.Next;
  end;
  DM.cdsListaAcessos.Filter := '';
  DM.cdsListaAcessos.Filtered := False;
end;

end.
