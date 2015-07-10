unit UImprimirMalaDireta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, QuickRpt, Qrctrls, Mask, DBCtrls, Db, Registry,
  Printers, DBClient, RzEdit;

type
  TFImprimirMalaDireta = class(TForm)
    Panel1: TPanel;
    bbFechar: TBitBtn;
    bbImprimir: TBitBtn;
    Label5: TLabel;
    lbEstados: TListBox;
    bbParametros: TBitBtn;
    Label1: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    lbNome1: TListBox;
    lbCodigo1: TListBox;
    lbCodigo2: TListBox;
    lbNome2: TListBox;
    Label3: TLabel;
    Label4: TLabel;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    BitBtn1: TBitBtn;
    SaveDialog1: TSaveDialog;
    DataSource1: TDataSource;
    edNome: TRzEdit;
    procedure bbImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbParametrosClick(Sender: TObject);
    procedure lbEstadosClick(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure lbNome2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    Reg: TRegistry;
  public
    cds: TClientDataSet;
    margemEsq, margemDir, margemSup, compriEti, colunas, fonte: Integer;
    alturaEti: Real;
    sql, filtro: String;

    procedure Filtra();
    procedure atualizaLista();
    procedure gravaRegistro();
    { Public declarations }
  end;

var
  FImprimirMalaDireta: TFImprimirMalaDireta;

implementation

uses UDM, UImprimirMalaDiretaRpt, UImprimirMalaDiretaParametros;

{$R *.DFM}

procedure TFImprimirMalaDireta.Filtra();
var
  i1: Integer;
begin
  filtro := '';
  if (not lbEstados.Selected[0]) and (lbEstados.ItemIndex > 0)  then
    for i1 := 1 to lbEstados.Items.Count-1 do
      if lbEstados.Selected[i1] then
      begin
        if filtro = '' then filtro := '(' else filtro := filtro + ' OR ';
        filtro := filtro + ' ESTADO = ''' + lbEstados.Items.Strings[i1] + '''';
      end;
  if filtro <> '' then filtro := filtro + ') AND ';
  filtro := filtro + ' (NOME_CLIENTE LIKE ''%' + edNome.Text + '%'')';
  cds.Filter := filtro;
  cds.Filtered := True;

  cds.First;
  lbNome1.Items.Clear;
  lbCodigo1.Items.Clear;
  lbNome1.Items.Add('Todos');
  lbCodigo1.Items.Add('Todos');
  While not cds.Eof do
  begin
    if Trim(cds.FieldByName('NOME_CLIENTE').AsString) <> '' then
    begin
      lbNome1.Items.Add(cds.FieldByName('NOME_CLIENTE').AsString);
      lbCodigo1.Items.Add(cds.FieldByName('CLIENTE_SQ').AsString);
    end;
    cds.Next;
  end;
end;

procedure TFImprimirMalaDireta.atualizaLista();
begin
  cds.Filter := '';
  sql := 'SELECT DISTINCT(ESTADO) as UF FROM clientes ORDER BY UF';
  DM.SCServer.AppServer.CriaLista (sql);
  cds.Open;

  lbEstados.Items.Clear;
  lbEstados.Items.Add('Todos');
  While not cds.Eof do
  begin
    if Trim(cds.FieldByName('UF').AsString) <> '' then
      lbEstados.Items.Add(cds.FieldByName('UF').AsString);
    cds.Next;
  end;
  cds.Close;
end;

procedure TFImprimirMalaDireta.bbImprimirClick(Sender: TObject);
var
  i1: integer;
begin
  bbImprimir.Enabled := False;

  sql := '';
  cds.Close;
  for i1 := 0 to lbNome2.Items.Count-1 do
  begin
    if sql = '' then sql := ' WHERE ' else sql := sql + ' OR ';
    sql := sql + ' CLIENTE_SQ = ''' + lbCodigo2.Items.Strings[i1] + '''';
  end;
  Insert ('SELECT * FROM clientes ', sql, 1);
  if ComboBox1.ItemIndex = 0 then
    sql := sql + ' ORDER BY ESTADO' else
    sql := sql + ' ORDER BY NOME_CLIENTE';
  cds.Filter := '';
  DM.SCServer.AppServer.CriaLista (sql);
  cds.Open;

  Application.CreateForm(TFImprimirMalaDiretaRpt, FImprimirMalaDiretaRpt);
  try
    FImprimirMalaDiretaRpt.DataSet := cds;
    FImprimirMalaDiretaRpt.QRSubDetail1.DataSet := cds;
    FImprimirMalaDiretaRpt.Page.LeftMargin     := margemEsq;
    FImprimirMalaDiretaRpt.Page.RightMargin    := margemDir;
    FImprimirMalaDiretaRpt.Page.TopMargin      := MargemSup;
    FImprimirMalaDiretaRpt.QRSubDetail1.Height := StrtoInt(FloattoStr(Int(3.8*alturaEti)));

    FImprimirMalaDiretaRpt.qrmCliente1.Left   :=  StrtoInt(FloattoStr(Int(0*3.8*CompriEti)));
    FImprimirMalaDiretaRpt.qrmCliente2.Left   :=  StrtoInt(FloattoStr(Int(1*3.8*CompriEti)));
    FImprimirMalaDiretaRpt.qrmCliente3.Left   :=  StrtoInt(FloattoStr(Int(2*3.8*CompriEti)));
    FImprimirMalaDiretaRpt.qrmCliente4.Left   :=  StrtoInt(FloattoStr(Int(3*3.8*CompriEti)));
    FImprimirMalaDiretaRpt.qrmCliente5.Left   :=  StrtoInt(FloattoStr(Int(4*3.8*CompriEti)));
    FImprimirMalaDiretaRpt.qrmCliente6.Left   :=  StrtoInt(FloattoStr(Int(5*3.8*CompriEti)));

    FImprimirMalaDiretaRpt.qrmCliente1.Width  :=  FImprimirMalaDiretaRpt.qrmCliente2.Left-5;
    FImprimirMalaDiretaRpt.qrmCliente2.Width  :=  FImprimirMalaDiretaRpt.qrmCliente2.Left-5;
    FImprimirMalaDiretaRpt.qrmCliente3.Width  :=  FImprimirMalaDiretaRpt.qrmCliente2.Left-5;
    FImprimirMalaDiretaRpt.qrmCliente4.Width  :=  FImprimirMalaDiretaRpt.qrmCliente2.Left-5;
    FImprimirMalaDiretaRpt.qrmCliente5.Width  :=  FImprimirMalaDiretaRpt.qrmCliente2.Left-5;
    FImprimirMalaDiretaRpt.qrmCliente6.Width  :=  FImprimirMalaDiretaRpt.qrmCliente2.Left-5;

    FImprimirMalaDiretaRpt.qrmCliente1.Visible := colunas >= 1;
    FImprimirMalaDiretaRpt.qrmCliente2.Visible := colunas >= 2;
    FImprimirMalaDiretaRpt.qrmCliente3.Visible := colunas >= 3;
    FImprimirMalaDiretaRpt.qrmCliente4.Visible := colunas >= 4;
    FImprimirMalaDiretaRpt.qrmCliente5.Visible := colunas >= 5;
    FImprimirMalaDiretaRpt.qrmCliente6.Visible := colunas >= 6;
    FImprimirMalaDiretaRpt.Font.Size := fonte;

    FImprimirMalaDiretaRpt.Preview;
  finally
    FImprimirMalaDiretaRpt.Free;
  end;
  bbImprimir.Enabled := True;
end;

procedure TFImprimirMalaDireta.FormCreate(Sender: TObject);
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True)
    then
    begin
      try margemEsq    := StrtoInt  (Reg.ReadString ('EtiMargemEsq'));
      except margemEsq := 0; end;
      try margemDir    := StrtoInt  (Reg.ReadString ('EtiMargemDir'));
      except margemDir := 0; end;
      try margemSup    := StrtoInt  (Reg.ReadString ('EtiMargemSup'));
      except margemSup := 0; end;
      try alturaEti    := StrtoFloat(Reg.ReadString ('EtiAltura'));
      except alturaEti := 0; end;
      try compriEti    := StrtoInt  (Reg.ReadString ('EtiCompri'));
      except compriEti := 0; end;
      try colunas      := StrtoInt  (Reg.ReadString ('EtiColunas'));
      except colunas   := 0; end;
      try fonte        := StrtoInt  (Reg.ReadString ('EtiFontSize'));
      except fonte     := 0; end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;

  gravaRegistro;
  
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';
  cds.FilterOptions := [foCaseInsensitive];
  atualizaLista;
end;

procedure TFImprimirMalaDireta.bbParametrosClick(Sender: TObject);
begin
  Application.CreateForm(TFImprimirMalaDiretaParametros, FImprimirMalaDiretaParametros);
  FImprimirMalaDiretaParametros.meMargemEsq.Text := InttoStr  (margemEsq);
  FImprimirMalaDiretaParametros.meMargemDir.Text := InttoStr  (margemDir);
  FImprimirMalaDiretaParametros.meMargemSup.Text := InttoStr  (margemSup);
  FImprimirMalaDiretaParametros.meAlturaEti.Text := FloatToStr(alturaEti);
  FImprimirMalaDiretaParametros.meCompriEti.Text := InttoStr  (compriEti);
  FImprimirMalaDiretaParametros.meColunas.Text   := InttoStr  (colunas);
  FImprimirMalaDiretaParametros.meFonte.Text     := InttoStr  (fonte);

  if FImprimirMalaDiretaParametros.ShowModal = mrOk then
  begin
    margemEsq := StrtoInt  (FImprimirMalaDiretaParametros.meMargemEsq.Text);
    margemDir := StrtoInt  (FImprimirMalaDiretaParametros.meMargemDir.Text);
    margemSup := StrtoInt  (FImprimirMalaDiretaParametros.meMargemSup.Text);
    alturaEti := StrtoFloat(FImprimirMalaDiretaParametros.meAlturaEti.Text);
    compriEti := StrtoInt  (FImprimirMalaDiretaParametros.meCompriEti.Text);
    colunas   := StrtoInt  (FImprimirMalaDiretaParametros.meColunas.Text);
    fonte     := StrtoInt  (FImprimirMalaDiretaParametros.meFonte.Text);

    gravaRegistro;
  end;
  FImprimirMalaDiretaParametros.Free;
end;

procedure TFImprimirMalaDireta.gravaRegistro();
begin
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey('\Software\MSystem', True)
      then
      begin
        Reg.WriteString ('EtiMargemEsq', InttoStr  (margemEsq));
        Reg.WriteString ('EtiMargemDir', InttoStr  (margemDir));
        Reg.WriteString ('EtiMargemSup', InttoStr  (margemSup));
        Reg.WriteString ('EtiAltura',    FloatToStr(alturaEti));
        Reg.WriteString ('EtiCompri',    InttoStr  (compriEti));
        Reg.WriteString ('EtiColunas'  , InttoStr  (colunas));
        Reg.WriteString ('EtiFontSize' , InttoStr  (fonte));
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
end;

procedure TFImprimirMalaDireta.lbEstadosClick(Sender: TObject);
begin
  Filtra;
end;

procedure TFImprimirMalaDireta.sbIncluirClick(Sender: TObject);
var
  i1: Integer;
begin
  for i1 := 1 to lbNome1.Items.Count-1 do
    if (lbNome1.Selected[i1]) or (lbNome1.Selected[0]) or (lbNome1.ItemIndex <= 0) then
    if lbCodigo2.Items.IndexOf(lbCodigo1.Items.Strings[i1]) = -1 then
    begin
      lbNome2.Items.Add(lbNome1.Items.Strings[i1]);
      lbCodigo2.Items.Add(lbCodigo1.Items.Strings[i1]);
    end;
end;

procedure TFImprimirMalaDireta.sbExcluirClick(Sender: TObject);
var
  i1: Integer;
begin
  i1 := 0;
  repeat
    if lbNome2.Selected[i1] then
    begin
      lbNome2.Items.Delete(i1);
      lbCodigo2.Items.Delete(i1);
      dec(i1);
    end;
    inc(i1);
    until i1 >= lbNome2.Items.Count-1;
end;

procedure TFImprimirMalaDireta.lbNome2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DELETE then sbExcluir.Click;
end;

procedure TFImprimirMalaDireta.FormActivate(Sender: TObject);
begin
  cds.Close;
  sql := 'SELECT * FROM clientes ORDER by NOME_CLIENTE';
  DM.SCServer.AppServer.CriaLista (sql);
  cds.Open;
end;

procedure TFImprimirMalaDireta.BitBtn1Click(Sender: TObject);
var
  i1: Integer;
  s1: String;
begin
  cds.Close;
  for i1 := 0 to lbNome2.Items.Count-1 do
  begin
    if s1 = '' then s1 := ' WHERE ' else s1 := s1 + ' OR ';
    s1 := s1 + ' CLIENTE_SQ = ''' + lbCodigo2.Items.Strings[i1] + '''';
  end;
  Insert ('SELECT NOME_CLIENTE, E_MAIL FROM clientes ', s1, 1);
  if ComboBox1.ItemIndex = 0 then
    s1 := s1 + ' ORDER BY ESTADO' else
    s1 := s1 + ' ORDER BY NOME_CLIENTE';
  cds.Filter := '';
  DM.SCServer.AppServer.CriaLista (s1);
  cds.Open;
  DataSource1.DataSet := cds;
  if SaveDialog1.Execute then
    DM.ExpExcel (DataSource1.DataSet, SaveDialog1.FileName);

  cds.Close;
  DataSource1.DataSet := nil;
  DM.SCServer.AppServer.CriaLista (sql);
  cds.Open;
end;

end.
