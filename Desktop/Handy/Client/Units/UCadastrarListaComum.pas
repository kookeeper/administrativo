unit UCadastrarListaComum;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, ComCtrls, ToolWin, Buttons, StdCtrls, DBTables, Menus,
  ADODB, ExtCtrls, DBClient, Variants, SimpleDS, Mask, RzEdit, ImgList,
  RzButton, Cadastro;

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
    sbFiltro: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    StringGrid_Old: TStringGrid;
    cdsLista: TClientDataSet;
    Label2: TLabel;
    SpeedButton4: TSpeedButton;
    sbHistorico: TSpeedButton;
    edFiltro: TRzEdit;
    ImageList1: TImageList;
    SpeedButton5: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbSairClick(Sender: TObject);
    procedure sbApagarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbFiltroClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sbHistoricoClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Show;
  private
  public
    Tabela, Mensagem, Sql, Filtro, Filtro1, FiltroInicial, cChave,
      cIndice, CampoOrdem, Ordem{, Valores}: String;
    cLista, nLista{, vIndice}: array of String;
    Visualizar, Criar, Editar, Apagar, novo: Boolean;
    i1, Chave: Integer;
    registro: TCadastro;

    function AtualizaLista (): Boolean;
    function CriaFiltro(): String;
    procedure CriaOrdem(Campo: String; Desc: Boolean = False);
    procedure ConsultarAtualizacoes();
  end;

var
  FCadastrarListaComum: TFCadastrarListaComum;

implementation

uses UCadastrarFormComum, UMainMenu, UDM, uConsultarAlteracoes, StrUtils,
  HistoricoAlteracao, Usuario;

{$R *.DFM}

Function TFCadastrarListaComum.AtualizaLista (): Boolean;
var
  index, reg1: string;
  order: Boolean;
begin
  if registro <> nil then
  begin
    Result := False;
    try
      if (not novo) and (cdsLista.Active) then
        reg1 := cdsLista.FieldByName (registro.cIndice).AsString else
        reg1 := '';

      order := False;
      if cdsLista.IndexName <> '' then
      begin
        index := cdsLista.IndexDefs.Find(cdsLista.IndexName).Fields;
        order := ixDescending in cdsLista.IndexDefs.Find(cdsLista.IndexName).Options;
      end;
      FreeAndNil(cdsLista);
      cdsLista := registro.montaLista(Filtro);
      if index <> '' then
        CriaOrdem(index, order);
      DataSource1.DataSet := cdsLista;

      if reg1 <> '' then
        cdsLista.Locate(registro.cIndice, reg1, []);
      Result := True;
    except
      on E: Exception do
        MessageDlg('Erro ao Atualizar Lista: ' + chr(13) + E.Message, mtInformation, [mbOK], 0);
    end;
  end
  else
  begin
    Result := False;
    try
      if (not novo) and (cdsLista.Active) then
        reg1 := cdsLista.FieldByName (cIndice).AsString else
        reg1 := '';

      cdsLista.Close;
      DM.SCServer.AppServer.CriaLista (Sql + ' ' + Filtro);
      cdsLista.Open;

      if reg1 <> '' then
        cdsLista.Locate(cIndice, reg1, []);
      Result := True;
    except
      on E : Exception do
        MessageDlg('Erro ao Atualizar Lista: ' + chr(13) + E.Message, mtInformation, [mbOK], 0);
    end;
  end;
end;

function TFCadastrarListaComum.CriaFiltro (): String;
var
  s3: String;
  i1: Integer;
begin
  if registro <> nil then
  begin
    Filtro := '';
    s3 := registro.cLista.Values[cbFiltro.Text];
    if s3 = '' then
      s3 := cbFiltro.Text;
    if s3 = '' then
      s3 := registro.cLista.ValueFromIndex[0];

    if edFiltro.Text <> '' then
      Filtro := ' HAVING UPPER(' + s3 + ') like UPPER(''%'+ edFiltro.Text + '%'') ';

    if Filtro1 <> '' then
    begin
      if Filtro <> '' then Filtro := Filtro + ' and ' + Filtro1
                      else Filtro := ' HAVING ' + Filtro1;
    end;

    if FiltroInicial <> '' then
    begin
      if Filtro <> '' then Filtro := Filtro + ' and ' + FiltroInicial
                      else Filtro := ' HAVING ' + FiltroInicial;
      FiltroInicial := '';
    end;
  end
  else
  begin
    Filtro := '';
    s3 := cbFiltro.Text;
    for i1:=0 to High (nLista) do
      if cbFiltro.Text = nLista[i1] then s3 := cLista[i1];
    if s3 = '' then s3 := cLista[0];

    if edFiltro.Text <> '' then
      Filtro := ' HAVING UPPER(' + s3 + ') like UPPER(''%'+ edFiltro.Text + '%'') ';

    if Filtro1 <> '' then
    begin
      if Filtro <> '' then Filtro := Filtro + ' and ' + Filtro1
                      else Filtro := ' HAVING ' + Filtro1;
    end;

    if FiltroInicial <> '' then
    begin
      if Filtro <> '' then Filtro := Filtro + ' and ' + FiltroInicial
                      else Filtro := ' HAVING ' + FiltroInicial;
      FiltroInicial := '';
    end;
  end;
end;

procedure TFCadastrarListaComum.CriaOrdem;
var
  nome: String;
begin
  cdsLista.IndexDefs.Update;
  nome := Campo + IfThen(Desc, ' desc');

  if cdsLista.IndexDefs.IndexOf(nome) < 0 then
  begin
    if Desc then
      cdsLista.IndexDefs.Add(nome, Campo, [ixDescending])
    else
      cdsLista.IndexDefs.Add(nome, Campo, []);
  end;

  cdsLista.IndexName := nome;
end;

procedure TFCadastrarListaComum.ConsultarAtualizacoes();
begin
end;

procedure TFCadastrarListaComum.FormCreate(Sender: TObject);
var
  i: integer;
  s: string;
  col: TColumn;
begin
  if registro <> nil then
  begin
    Filtro := Filtro1;

    For i := 0 to registro.cLista.Count - 1 do
    if (registro.cLista.Names[i] <> '') then
    begin
      cbFiltro.Items.Add (registro.cLista.Names[i]);

      if (i = 0) or
         (Pos(registro.cLista.Names[i], 'Nome, Descrição') > 0) then
        cbFiltro.Text := registro.cLista.Names[i];

      if Pos(registro.cLista.Names[i], 'Cliente') > 0 then
        cbFiltro.Text := registro.cLista.Names[i];
    end;

    cdsLista := registro.montaLista(' limit 1');
    Datasource1.DataSet := cdsLista;

    DBGrid1.Columns.Clear;
    For i := 0 to registro.cLista.Count - 1 do
    begin
      col := DBGrid1.Columns.Add;

      if cdsLista.FieldByName(registro.cLista.ValueFromIndex[i]).DataType = ftDateTime then
        col.Width := 20 * 6 else
      if cdsLista.FieldByName(registro.cLista.ValueFromIndex[i]).DataType = ftBCD then
        col.Width := 15 * 6 else
      if cdsLista.FieldByName(registro.cLista.ValueFromIndex[i]).Size <> 0 then
        col.Width := cdsLista.FieldByName(registro.cLista.ValueFromIndex[i]).Size * 6 else
        col.Width := 15 * 6;
      col.Title.Caption := registro.cLista.Names[i];
      col.FieldName := registro.cLista.ValueFromIndex[i];
      if Length (col.Title.Caption) * 6 > col.Width then
        col.Width := Length (col.Title.Caption) * 6;
    end;
  end
  else
  begin
//  Tabela := nil;
//  Sql := '';
//  SetLength (cLista, 0);
//  SetLength (nLista, 0);
//  SetLength (cIndice, 0);

    Filtro := Filtro1;
//  SetLength (Valores, 1);
//  SetLength (vIndice, 1);

    For i := 0 to High (cLista) do
    begin
      cbFiltro.Items.Add (nLista[i]);
//    cbOrdem.Items.Add (nLista[i]);

      if (i = 0) or
         (Pos(nLista[i], 'Nome, Descrição') > 0) then
      begin
        cbFiltro.Text := nLista[i];
//      cbOrdem.Text := nLista[i];
      end;

      if Pos(nLista[i], 'Cliente') > 0 then
        cbFiltro.Text := nLista[i];
    end;

    if Sql = '' then Abort;

    s := Sql + ' limit 1';

    cdsLista.Close;
    DM.SCServer.AppServer.CriaLista (s);
    cdsLista.Open;
    Datasource1.DataSet := cdsLista;

    DBGrid1.Columns.Clear;
    For i := 0 to High (cLista) do
    begin
      col := DBGrid1.Columns.Add;

      if cdsLista.FieldByName(cLista[i]).DataType = ftDateTime then
        col.Width := 20 * 6 else
      if cdsLista.FieldByName(cLista[i]).DataType = ftBCD then
        col.Width := 15 * 6 else
      if cdsLista.FieldByName(cLista[i]).Size <> 0 then
        col.Width := cdsLista.FieldByName(cLista[i]).Size * 6 else
        col.Width := 15 * 6;
      col.Title.Caption := nLista[i];
      col.FieldName := cLista[i];
      if Length (col.Title.Caption) * 6 > col.Width then
        col.Width := Length (col.Title.Caption) * 6;
    end;
  end;
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
  if registro <> nil then
  begin
    if cdsLista.FieldByName(registro.cIndice).AsInteger = 0 then
      ShowMessage('Selecione um registro para excluir.')
    else
    begin
      registro.setIndice(cdsLista.FieldByName(registro.cIndice).AsInteger);
      registro.excluirRegistro;
      AtualizaLista;
    end;
  end
  else
  begin
    if cdsLista.FieldByName(cIndice).AsInteger = 0 then
      ShowMessage('Selecione um registro para excluir.')
    else
    if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                             mtConfirmation, [mbyes, mbno], 0) = mryes then
    try
      Mensagem := DM.SCServer.AppServer.ApagaRegistro (VarArrayOf ([Tabela,
        cIndice, cdsLista.FieldByName(cIndice).AsString, DM.useq]));

      With (THistoricoAlteracao.Create) do
      begin
        nome_tabela := Tabela;
        chave_sq := cdsLista.FieldByName(registro.cIndice).AsInteger;
        tipo_alteracao := -1;
        usuario_sq := TUsuario.Create(DM.useq);
        data_alteracao := Date;
        observacao := 'Exclusão';
        salvar;
      end;

      if Mensagem <> '' then
        MessageDlg('Houve um erro ao tentar apagar este registro!' + chr(13) + Mensagem, mtError, [mbOK], 0);

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
end;

procedure TFCadastrarListaComum.sbEditarClick(Sender: TObject);
begin
  Chave := 0;
  novo := (Sender = sbNovo);

  if ((not novo) and (cdsLista.RecordCount = 0)) then
    raise Exception.Create('Não existe registro para editar.');

  if registro <> nil then
  begin
    if (not novo) and (sbEditar.Enabled) then
      registro.setIndice(cdsLista.FieldByName(registro.cIndice).AsInteger)
    else
      registro.setIndice(null);
  end
  else
  begin
    if (not novo) and (sbEditar.Enabled) then
      Chave := cdsLista.FieldByName(cIndice).AsInteger;
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
  AtualizaLista ();
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

procedure TFCadastrarListaComum.sbHistoricoClick(Sender: TObject);
begin
  if registro <> nil then
  begin
    try
      fConsultarAlteracoes := TfConsultarAlteracoes.Create(Self);
      FConsultarAlteracoes.Tabela := registro.nomeTabela;
      FConsultarAlteracoes.chave  := cdsLista.FieldByName(registro.cIndice).AsInteger;
      FConsultarAlteracoes.Caption := Caption;
      FConsultarAlteracoes.showmodal;
    finally
      FreeAndNil(fConsultarAlteracoes);
    end;
  end
  else
  begin
    try
      fConsultarAlteracoes := TfConsultarAlteracoes.Create(Self);
      FConsultarAlteracoes.Tabela := Tabela;
      FConsultarAlteracoes.chave  := cdsLista.FieldByName(cIndice).AsInteger;
      FConsultarAlteracoes.Caption := Caption;
      FConsultarAlteracoes.showmodal;
    finally
      FreeAndNil(fConsultarAlteracoes);
    end;
  end;
end;

procedure TFCadastrarListaComum.DBGrid1TitleClick(Column: TColumn);
var
  nome: String;
begin
  if (Column.FieldName = CampoOrdem) and (Ordem = '') then
    Ordem := ' DESC'
  else
    Ordem := '';

  CampoOrdem := Column.FieldName;

  nome := CampoOrdem + Ordem;

  cdsLista.IndexDefs.Update;
  if cdsLista.IndexDefs.IndexOf(nome) < 0 then
  begin
    if Ordem = '' then
      cdsLista.IndexDefs.Add(nome, Column.FieldName, [])
    else
      cdsLista.IndexDefs.Add(nome, Column.FieldName, [ixDescending]);
  end;

  cdsLista.IndexName := nome;
end;

procedure TFCadastrarListaComum.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Bmp : TBitMap;

  function GetColsWidth: Integer;
  var
    I : Integer;
  begin
    Result := 0;
    for I := 0 to Column.Index do
    begin
      Result := Result + TDBGrid(Sender).Columns.Items[I].Width;
    end;
    Result := Result + 10 + (Column.Index);
  end;
begin
  With DBGrid1 do
  begin
    if not (gdSelected in State) then
    begin
      if cdsLista.RecNo mod 2 = 0 then
        Canvas.Brush.Color := TColor($F0CAA6) else // clSkyBlue
        Canvas.Brush.Color := clWhite;
      Canvas.FillRect(Rect);
    end;

    Canvas.Brush.Style := bsClear;
    if Column.FieldName = CampoOrdem then
    begin
      Bmp := TBitMap.Create;
      with Bmp do
      begin
        TransparentColor := clWhite;
        Transparent := True;
        TransparentMode := tmAuto
      end;
      try
        if Length(Ordem) = 0 then
          ImageList1.GetBitmap(2, Bmp)
        else
          ImageList1.GetBitmap(3, Bmp);
        Canvas.Draw((GetColsWidth-Bmp.Width), 1, Bmp);
      finally
        Bmp.Free;
      end;
    end;
    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFCadastrarListaComum.Show;
var
  i1: Integer;
  Sheet: TWinControl;
  Visualizar, Criar, Editar, Apagar: Boolean;
  tabSheet: TTabSheet;
begin
  tabSheet := nil;
  Sheet := nil;
  DM.VerificaAcesso (Self, Visualizar, Criar, Editar, Apagar);

  if Visualizar then
  begin
    if Self <> nil then for i1 := 1 to (Screen.FormCount-1) do
    begin
      if Screen.Forms[i1].Name = Self.Name then Sheet := Self.Parent;
    end;
    if Sheet <> nil then
    begin
      Sheet.Show;
    end
    else begin
      tabSheet := TTabSheet.Create (FMainMenu);
      tabSheet.Caption := Self.Caption;
      tabSheet.PageControl := FMainMenu.PageControl1;
      FMainMenu.PageControl1.ActivePageIndex := tabSheet.TabIndex;
      Self.Parent := tabSheet;
      Self.Visible := True;
      if Self.Name = 'FCadastrarListaNfiscais' then
        Self.FiltroInicial := 'DTEMISSAO_NFISCAL > ''' + FormatDateTime('yyyy-mm-dd', Date-30) + ''''
      else if Self.Name = 'FCadastrarListaPedidos' then
        Self.FiltroInicial := 'DATA_PEDIDO > ''' + FormatDateTime('yyyy-mm-dd', Date-30) + ''''
      else if Self.Name = 'FCadastrarListaMovimentacoes' then
        Self.FiltroInicial := 'DATA > ''' + FormatDateTime('yyyy-mm-dd', Date-30) + '''';
    end;
    if Self.Name = 'FCadastrarListaNfiscais' then
    begin
      Self.SpeedButton1.Enabled := Editar;
      Self.SpeedButton2.Enabled := Editar;
    end;
    Self.SetFocus;
    Self.sbFiltro.Click;
    Self.Visualizar := Visualizar;
    Self.Criar := Criar;
    Self.Editar := Editar;
    Self.Apagar := Apagar;
    Self.sbNovo.Enabled   := Criar;
    Self.sbEditar.Enabled := Editar or Visualizar;
    Self.sbApagar.Enabled := Apagar;
  end
  else Showmessage ('Você não tem permissões para acessar esta tela!');
end;

end.


