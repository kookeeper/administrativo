unit UCadastrarFormAcessos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DB, DBCtrls;

type
  TFCadastrarFormAcessos = class(TForm)
    StringGrid1: TStringGrid;
    Panel1: TPanel;
    bbAtualizar: TBitBtn;
    dsListaUsuarios: TDataSource;
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
  FCadastrarFormAcessos: TFCadastrarFormAcessos;

implementation

uses UDM, UCadastrarListaComum, Usuario, Acesso, Cadastro;

{$R *.dfm}

procedure TFCadastrarFormAcessos.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
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

procedure TFCadastrarFormAcessos.FormCreate(Sender: TObject);
var
  bmp: TBitmap;
  i1: Integer;
begin
  inherited;
  dsListaUsuarios.DataSet := TUsuario.listaRegistros('order by nome_usuario');
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

  StringGrid1.RowCount := 1 + Round(DM.programas.Count/2);
  for i1 := 0 to Round(DM.programas.Count/2)-1 do
    StringGrid1.Cells[0, i1+1] := DM.programas.Strings[i1*2+1];

  usuario_sq := TFCadastrarListaComum(Owner).cdsLista.FieldByName('USUARIO_SQ').AsInteger;
end;

procedure TFCadastrarFormAcessos.StringGrid1KeyPress(Sender: TObject; var Key: Char);
begin
if StringGrid1.Selection.Left <> 0 then
  if StringGrid1.Cells[StringGrid1.Selection.Left, StringGrid1.Selection.Top] = 'S' then
    StringGrid1.Cells[StringGrid1.Selection.Left, StringGrid1.Selection.Top] := 'N'
      else StringGrid1.Cells[StringGrid1.Selection.Left, StringGrid1.Selection.Top] := 'S';
end;

procedure TFCadastrarFormAcessos.bbAtualizarClick(Sender: TObject);
  function BuscaPrograma(cap: String): String;
  begin
    if DM.programas.IndexOf(cap) < 0 then
      Result := ''
    else
      Result := DM.programas.Strings[DM.programas.IndexOf(cap)-1];
  end;
var
  i1, Valores: Integer;
  s1: String;
  Novo: Boolean;
  acesso: TAcesso;
begin
  StringGrid1.Enabled := False;
  bbAtualizar.Enabled := False;
  bbCancelar.Enabled := False;
  for i1 := 1 to StringGrid1.RowCount-1 do
  begin
    s1 := BuscaPrograma(StringGrid1.Cells[0,i1]);
    acesso := TAcesso.CreateFiltro('lower(nome_programa) = lower(' + QuotedStr(s1) + ') and usuario_sq = ' + IntToStr(usuario_sq));
    if acesso.vIndice <> Null then
    begin
      Novo := False;
      Valores := acesso.vIndice;
    end
    else
    begin
      Novo := True;
      Valores := 0;
    end;
    if Novo or (StringGrid1.Cells[1, i1] <> acesso.visualizar)
            or (StringGrid1.Cells[2, i1] <> acesso.criar)
            or (StringGrid1.Cells[3, i1] <> acesso.editar)
            or (StringGrid1.Cells[4, i1] <> acesso.apagar) then
    begin
      acesso := TAcesso.Create;
      if (Valores <> 0) then
        acesso.setIndice(Valores);
      acesso.nome_programa := s1;
      acesso.usuario_sq := TUsuario.Create(usuario_sq);
      acesso.visualizar := StringGrid1.Cells[1, i1];
      acesso.criar      := StringGrid1.Cells[2, i1];
      acesso.editar     := StringGrid1.Cells[3, i1];
      acesso.apagar     := StringGrid1.Cells[4, i1];
      acesso.salvar;
{
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
}
    end;
  end;
  Showmessage ('Atualizações concluídas!');
end;

procedure TFCadastrarFormAcessos.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Key: Char;
begin
  if button = mbleft then
    StringGrid1.OnKeyPress(Sender, Key);
end;

procedure TFCadastrarFormAcessos.FormActivate(Sender: TObject);
  function BuscaCaption(pro: String): String;
  begin
    if DM.programas.IndexOf(pro) < 0 then
      Result := ''
    else
      Result := DM.programas.Strings[DM.programas.IndexOf(pro)+1];
  end;
var
  i1: Integer;
  s1: String;
begin
  for i1 := 1 to StringGrid1.RowCount-1 do
  begin
    StringGrid1.Cells[1, i1] := 'N';
    StringGrid1.Cells[2, i1] := 'N';
    StringGrid1.Cells[3, i1] := 'N';
    StringGrid1.Cells[4, i1] := 'N';
  end;

  With TAcesso.listaRegistros('where usuario_sq = ' + IntToStr(usuario_sq)) do
  begin
    While not Eof do
    begin
      for i1 := 1 to StringGrid1.RowCount-1 do
      begin
        s1 := BuscaCaption(FieldByName('NOME_PROGRAMA').AsString);
        if StringGrid1.Cells[0, i1] = s1 then
        begin
          StringGrid1.Cells[1, i1] := FieldByName('VISUALIZAR').AsString;
          StringGrid1.Cells[2, i1] := FieldByName('CRIAR').AsString;
          StringGrid1.Cells[3, i1] := FieldByName('EDITAR').AsString;
          StringGrid1.Cells[4, i1] := FieldByName('APAGAR').AsString;
        end;
      end;
      Next;
    end;
    Close;
  end;
end;

end.
