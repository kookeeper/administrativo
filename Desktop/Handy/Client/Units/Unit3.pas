unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, DBCtrls;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    DBImage1: TDBImage;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure resizeImagem(nomeArquivoJPG: String; tamanhoFinal: Integer);
    procedure resizeImagemLargura(caminho, nomeArquivoJPG: String);
    procedure carregaImagem(produto_sq: Integer; codigo_produto: String);
    procedure ListFileDir(Path: string; FileList: TStringList);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses UDM, Produto, Clipbrd, DBClient, URLMon, Jpeg, Math;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  arquivo: String;
  imagem: TPicture;
  f: file of Byte;
  cds: TClientDataSet;
begin
  if (not DirectoryExists(Edit1.Text)) then
    raise Exception.Create('Diretorio inexistente.');

  cds := TProduto.listaRegistros('');

  try
    While not cds.Eof do
    begin

//      DM.cdsProdutoImagem.Open;
//      if (not DM.cdsProdutoImagem.Locate('produto_sq', cds.FieldByName('produto_sq').Value, [])) then
//      begin
//        DM.cdsProdutoImagem.Append;
//        DM.cdsProdutoImagemPRODUTO_SQ.Value := cds.FieldByName('produto_sq').Value;
//      end
//      else
//      begin
//        DM.cdsProdutoImagem.Edit;
//      end;

      arquivo := Edit1.Text + cds.FieldByName('codigo_produto').AsString + '.jpg';

      if (FileExists(arquivo)) then
      begin

        AssignFile(f, arquivo);
        Reset(f);
        try
          imagem := TPicture.Create();
        Finally
          CloseFile(f);
        end;
        imagem.LoadFromFile(arquivo);
        clipboard.Assign(imagem);

        DBImage1.PasteFromClipboard;
//        DM.cdsProdutoImagem.Post;
//        DM.cdsProdutoImagem.ApplyUpdates(0);
//        DM.cdsProdutoImagem.Close;
      end
      else
      begin
//        DM.cdsProdutoImagem.Cancel;
//        DM.cdsProdutoImagem.CancelUpdates;
//        DM.cdsProdutoImagem.Close;
      end;

      cds.Next;
    end;
  finally
  end;
end;

procedure ResizeBMP(b : TBitmap; NewWidth, NewHeight : integer);
var
  tbmp : TBitmap;
begin
  tbmp := TBitmap.Create;
  tbmp.Width := b.Width;
  tbmp.Height := b.Height;
  BitBlt(tbmp.Canvas.Handle,0,0,tbmp.Width,tbmp.Height,
  b.Canvas.Handle,0,0,SRCCOPY);
  b.Width := NewWidth;
  b.Height := NewHeight;
  StretchBlt(b.Canvas.Handle,0,0,b.Width,b.Height,tbmp.Canvas.Handle,
  0,0,tbmp.Width,tbmp.Height,SRCCOPY);
  tbmp.Free;
end;

procedure TForm2.Button2Click(Sender: TObject);
var
  cds: TClientDataSet;
  listaProduto: TStringList;
  i: Integer;
begin
  listaProduto := TStringList.Create;
  cds := TProduto.listaProdutoSemImagem;
  ShowMessage('Foram encontrados ' + IntToStr(cds.RecordCount) + ' registros. Iniciando atualização.');
  while not cds.Eof do
  begin
    listaProduto.AddObject(cds.FieldByName('codigo_produto').AsString, TObject(cds.FieldByName('produto_sq').AsInteger));
    cds.Next;
  end;
  cds.Close;
  FreeAndNil(cds);

  for i := 0 to listaProduto.Count - 1 do
  begin
    carregaImagem(Integer(listaProduto.Objects[i]), listaProduto.Strings[i]);
  end;
end;

procedure TForm2.carregaImagem(produto_sq: Integer; codigo_produto: String);
var
  arquivo: String;
  imagem: TPicture;
begin
  DataSource1.DataSet := TProduto.BuscarImagemProduto(produto_sq);

  if (DM.DefaultSchema = 'qsqchampion') then
    DM.SCServer.Connected := True;

  if ((DataSource1.DataSet.FieldByName('produto_imagem').IsNull) and (DataSource1.DataSet.FieldByName('produto_imagem_url').IsNull)) then
  begin
    arquivo := codigo_produto + '.jpg';
    if (DM.DefaultSchema = 'qsqchampion') then
    begin
      DataSource1.DataSet.Edit;
      DataSource1.DataSet.FieldByName('produto_imagem_url').AsString := Edit2.Text + arquivo;
      DataSource1.DataSet.Post;
      TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
    end
    else
    if URLDownloadToFile(nil, PChar(Edit2.Text + arquivo), PChar(arquivo), 0, nil) = 0 then
    try
      resizeImagem(arquivo, 19000);

      imagem := TPicture.Create();
      imagem.LoadFromFile(arquivo);
      clipboard.Assign(imagem);

      DM.SCServer.Connected := True;
      DBImage1.PasteFromClipboard;
      DataSource1.DataSet.Post;
      TClientDataSet(DataSource1.DataSet).ApplyUpdates(0);
    finally
      DM.SCServer.Connected := False;
    end;
  end;
end;

procedure TForm2.resizeImagem(nomeArquivoJPG: String; tamanhoFinal: Integer);
var
  f: file of Byte;
  jpeg: TJPEGImage;
  Bmp : TBitmap;
begin
  AssignFile(f, nomeArquivoJPG);
  Reset(f);
  try
    while (FileSize(f) > tamanhoFinal) do
    begin
      CloseFile(f);

      Bmp := TBitmap.Create;
      jpeg := TJPEGImage.Create;

      Jpeg.LoadFromFile(nomeArquivoJPG);

      // Copy JPEG to bitmap and resize it in one go
      Bmp.PixelFormat := pf24bit;
      Bmp.Width := Floor(Jpeg.Width / 1.1);
      Bmp.Height := FLoor(Jpeg.Height / 1.1);
      Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.Width, Bmp.Height), Jpeg);

      // Copy BMP back to JPG
      Jpeg.Assign(Bmp);
      jpeg.SaveToFile(nomeArquivoJPG);
      Jpeg.Free;
      Bmp.Free;

      AssignFile(f, nomeArquivoJPG);
      Reset(f);
    end;
  Finally
    CloseFile(f);
  end;
end;

procedure TForm2.Button3Click(Sender: TObject);
var
  listaArquivo: TStringList;
  i: Integer;
begin
  listaArquivo := TStringList.Create;
  ListFileDir(Edit1.Text, listaArquivo);

  for i := 0 to listaArquivo.Count - 1 do
  begin
    resizeImagemLargura(Edit1.Text, listaArquivo[i]);
  end;
end;

procedure TForm2.ListFileDir(Path: string; FileList: TStringList);
var
  SR: TSearchRec;
begin
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        if (Pos('.jpg',SR.Name) > 0) then
          FileList.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TForm2.resizeImagemLargura(caminho, nomeArquivoJPG: String);
var
  f: file of Byte;
  jpeg: TJPEGImage;
  Bmp : TBitmap;
  proporcao: Double;
begin
  Bmp := TBitmap.Create;
  jpeg := TJPEGImage.Create;

  Jpeg.LoadFromFile(caminho + nomeArquivoJPG);

  // Copy JPEG to bitmap and resize it in one go
  Bmp.PixelFormat := pf24bit;
  proporcao := jpeg.Height / 120;
  Bmp.Height := 120;
  Bmp.Width := Floor(jpeg.Width / proporcao);
  Bmp.Canvas.StretchDraw(Rect(0, 0, Bmp.Width, Bmp.Height), Jpeg);

  // Copy BMP back to JPG
  Jpeg.Assign(Bmp);
  jpeg.SaveToFile(caminho + 'thumbnail\' + nomeArquivoJPG);
  Jpeg.Free;
  Bmp.Free;
end;

end.
