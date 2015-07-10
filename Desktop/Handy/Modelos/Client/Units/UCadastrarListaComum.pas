unit UCadastrarListaComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ComCtrls, ToolWin, Buttons, StdCtrls, DBTables, Menus,
  ADODB, ExtCtrls, DBClient, Variants, SimpleDS;

type
  TFCadastrarListaComum = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    DataSource1: TDataSource;
    sbSair: TSpeedButton;
    sbApagar: TSpeedButton;
    sbEditar: TSpeedButton;
    sbNovo: TSpeedButton;
    cbFiltro: TComboBox;
    edFiltro: TEdit;
    sbFiltro: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StringGrid1: TStringGrid;
    cbOrdem: TComboBox;
    Label1: TLabel;
    cdsLista: TClientDataSet;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure sbApagarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbFiltroClick(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1KeyPress(Sender: TObject; var Key: Char);
  private
  public
    Tabela, Mensagem, Sql, Ordem, Filtro, Filtro1, cChave, cIndice, Valores: String;
    cLista, nLista, vIndice: array of String;
    Visualizar, Criar, Editar, Apagar, novo, geral: Boolean;
    {Database, }i1: Integer;

    function AtualizaLista (): Boolean;
    function CriaFiltro(): String;
    function CriaOrdem(): String;
  end;

var
  FCadastrarListaComum: TFCadastrarListaComum;

implementation

uses UCadastrarFormComum, UMainMenu, UDM, UDMLista;

{$R *.DFM}

Function TFCadastrarListaComum.AtualizaLista (): Boolean;
var
  reg1: string;
  i, row, reg2: integer;
begin
Result := False;
try
  if cdsLista.Active then
    reg1 := cdsLista.FieldByName (cIndice).AsString else
    reg1 := '';
  reg2 := 0;

  cdsLista.Close;
  DMLista.SCServerLista.Open;
  DMLista.SCServerLista.AppServer.CriaLista (Sql + ' ' + Filtro + ' ' + Ordem);
  cdsLista.Open;

  cdsLista.Last;
  SetLength(vIndice, cdsLista.RecordCount);

  StringGrid1.RowCount := 2;
  For i := 0 to High (cLista) do
    StringGrid1.Cells [i+1,1] := '';

  cdsLista.First;
  row := 1;
  While not cdsLista.Eof do
  begin
    inc (row);
    StringGrid1.RowCount := row;
    For i := 0 to High (cLista) do
      StringGrid1.Cells [i+1, row-1] := cdsLista.fieldByName (cLista[i]).AsString;
    vIndice[row-2] := cdsLista.FieldByName (cIndice).AsString;
    if vIndice[row-2] = reg1 then reg2 := row-1;
    cdsLista.Next;
  end;
  StringGrid1.FixedRows := 1;
  if (reg1 <> '') and (reg2 <> 0) then
    StringGrid1.Row := reg2;

  Result := True;
except
  on E : Exception do
    MessageDlg('Erro ao Atualizar Lista: ' + chr(13) + E.Message, mtInformation, [mbOK], 0);
  end;
end;

function TFCadastrarListaComum.CriaFiltro (): String;
var
  s3: String;
  i1: Integer;
begin
  Filtro := '';
  s3 := cbFiltro.Text;
  for i1:=0 to High (nLista) do
    if cbFiltro.Text = nLista[i1] then s3 := cLista[i1];

  if Filtro1 <> '' then
  begin
    if edFiltro.Text <> '' then
      Filtro := ' ' + Filtro1 + ' and '
    else Filtro := Filtro1;
  end
  else
    if edFiltro.Text <> '' then
      Filtro := ' where ';

  if geral then
  begin
    if edFiltro.Text <> '' then Filtro := Filtro + 'UPPER(' + s3 + ') like UPPER(''%'+ edFiltro.Text + '%'') ';
  end
  else
  begin
    if edFiltro.Text <> '' then Filtro := Filtro + 'UPPER(' + s3 + ') like UPPER(''%'+ edFiltro.Text + '%'') ';
  end;
end;

function TFCadastrarListaComum.CriaOrdem (): String;
var
  s3: String;
  i1: Integer;
begin
  for i1:=0 to High (nLista) do
    if cbOrdem.Text = nLista[i1] then s3 := cLista[i1];
  if s3 = '' then
    s3 := cLista[0];

  Ordem := 'order by ' + s3;
end;


procedure TFCadastrarListaComum.FormCreate(Sender: TObject);
var
  i: integer;
  s: string;
begin
//  Tabela := nil;
//  Sql := '';
//  SetLength (cLista, 0);
//  SetLength (nLista, 0);
//  SetLength (cIndice, 0);
//  Ordem  := '';

  Filtro := Filtro1;
  SetLength (Valores, 1);
  SetLength (vIndice, 1);

  For i := 0 to High (cLista) do
  begin
    cbFiltro.Items.Add (nLista[i]);
    cbOrdem.Items.Add (nLista[i]);
  end;

  if Sql = '' then Abort;

  StringGrid1.ColCount := High (cLista) + 2;
  StringGrid1.ColWidths[0]  := 10;
  StringGrid1.RowHeights[0] := 20;

  s := Sql;
  insert (' first 1 ', s, 7);
  cdsLista.Close;
  DMLista.SCServerLista.Open;
  DMLista.SCServerLista.AppServer.CriaLista (s);
  cdsLista.Open;
  Datasource1.DataSet := cdsLista;

  cdsLista.First;
  For i := 0 to High (cLista) do
  begin
    if cdsLista.FieldByName(cLista[i]).DataType = ftDateTime then
      StringGrid1.ColWidths[i+1] := 20 * 6 else
    if cdsLista.FieldByName(cLista[i]).DataType = ftBCD then
      StringGrid1.ColWidths[i+1] := 15 * 6 else
    if cdsLista.FieldByName(cLista[i]).Size <> 0 then
      StringGrid1.ColWidths[i+1] := cdsLista.FieldByName(cLista[i]).Size * 6 else
      StringGrid1.ColWidths[i+1] := 15 * 6;
    StringGrid1.Cells [i+1, 0] := nLista[i];
    if Length (StringGrid1.Cells[i+1, 0]) * 6 > StringGrid1.ColWidths[i+1] then
      StringGrid1.ColWidths[i+1] := Length (StringGrid1.Cells[i+1, 0]) * 6;
  end;
//  cdsLista.Close;
end;

procedure TFCadastrarListaComum.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  Par: TWinControl;
begin
  FMainMenu.Caption := 'Menu Principal';
  Visible := False;
  cdsLista.Close;
  Action := caHide;
  Par := Parent;
  Parent := nil;
  Par.Free;
end;

procedure TFCadastrarListaComum.sbSairClick(Sender: TObject);
begin
  close;
end;

procedure TFCadastrarListaComum.sbApagarClick(Sender: TObject);
var
  Mensagem: String;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.ApagaRegistro (VarArrayOf ([Tabela,
      cIndice, vIndice[StringGrid1.row-1]]));
//    DM.SCServer.Close;

    if Mensagem <> '' then
      raise Exception.Create('Houve um erro ao tentar apagar este registro!' + chr(13) + Mensagem);

    cdsLista.Close;
    AtualizaLista;
  except
    on E: Exception do
    begin
      Showmessage (E.Message);
      DM.EnviarEmail (Tabela, 'APAGAR', Mensagem, Novo);
    end;
  end;
end;

procedure TFCadastrarListaComum.sbEditarClick(Sender: TObject);
var
  s1, s2: string;
begin
  novo := (Sender = sbNovo);
  if novo then
    Valores := '0'
  else
  if sbEditar.Enabled then
  begin
    s1 := cbFiltro.Text;
    s2 := edFiltro.Text;

    cbFiltro.Text := cIndice;
    if Tabela = 'tbNfiscais' then
      cbFiltro.Text := 'N.' + cbFiltro.Text;
    edFiltro.Text := vIndice[StringGrid1.row-1];

    CriaFiltro;
    CriaOrdem;

    While Pos('%', Filtro) <> 0 do
      Delete (Filtro, Pos ('%', Filtro), 1);

    cdsLista.Close;
    DMLista.SCServerLista.Open;
    DMLista.SCServerLista.AppServer.CriaLista (Sql + ' ' + Filtro + ' ' + Ordem);
    cdsLista.Open;

    cbFiltro.Text := s1;
    edFiltro.Text := s2;

    CriaFiltro;
    CriaOrdem;

    Valores := cdsLista.FieldByName(cIndice).Value;
  end;
end;

procedure TFCadastrarListaComum.sbNovoClick(Sender: TObject);
begin
  if sbNovo.Enabled then
    sbEditar.onClick (sbNovo);
end;

procedure TFCadastrarListaComum.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    sbFiltro.OnClick (Sender);
  end
end;

procedure TFCadastrarListaComum.sbFiltroClick(Sender: TObject);
begin
  CriaFiltro;
  CriaOrdem;
  AtualizaLista ();
end;

procedure TFCadastrarListaComum.edFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    sbFiltro.OnClick (Sender);
  end
end;

procedure TFCadastrarListaComum.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then
    sbSair.Click;

  if Shift = [ssCtrl] then
  begin
     if (char (key) = 'N') and sbNovo.Enabled   then sbNovo.Click;
     if (char (key) = 'E') and sbEditar.Enabled then sbEditar.Click;
     if (char (key) = 'X') and sbApagar.Enabled then sbApagar.Click;
  end;
end;

procedure TFCadastrarListaComum.FormShow(Sender: TObject);
begin
  if Caption <> '' then
    FMainMenu.Caption := 'Menu Principal - ' + Caption;
end;

procedure TFCadastrarListaComum.StringGrid1DrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if (ARow <> 0) and
     (State <> [gdSelected]) and
     (State <> [gdFocused]) and
     (State <> [gdFixed]) then
  begin
    if ARow mod 2 = 0 then
      StringGrid1.Canvas.Brush.Color := TColor($F0CAA6) else // clSkyBlue
      StringGrid1.Canvas.Brush.Color := clWhite;
  end;
  StringGrid1.Canvas.TextRect(Rect, Rect.Left, Rect.Top, StringGrid1.Cells [ACol, ARow]);
end;

procedure TFCadastrarListaComum.StringGrid1DblClick(Sender: TObject);
begin
  if sbEditar.Enabled then
    sbEditar.Click;
end;

procedure TFCadastrarListaComum.StringGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    sbEditar.OnClick (Sender);
  end
end;

end.
