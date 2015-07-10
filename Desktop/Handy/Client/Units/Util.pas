unit Util;

interface

uses Windows, Jpeg, Graphics, Math, Types, Classes;

procedure ResizeImagem(nomeArquivoJPG: String; tamanhoFinal: Integer);
procedure ConvTextOut(CV: TCanvas; const sText: String; x, y, angle:integer);
function salvarImagemLocal(url: String): String; overload;
function salvarimagemLocal(stream: TStream; codigo: String): String; overload;
function montarNomeImagem(nomeArquivo: String): String;
function buscarImagemLocal(nomeArquivo: String): String;
function ExtractUrlFileName(const AUrl: string): string;
function GetTempDir: string;

implementation

uses SysUtils, URLMon;

procedure ResizeImagem(nomeArquivoJPG: String; tamanhoFinal: Integer);
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

procedure ConvTextOut(CV: TCanvas; const sText: String; x, y, angle:integer);
var
  LogFont: TLogFont;
  SaveFont: TFont;
begin
  SaveFont := TFont.Create;
  SaveFont.Assign(CV.Font);
  GetObject(SaveFont.Handle, sizeof(TLogFont), @LogFont);
  with LogFont do
  begin
    lfEscapement := angle *10;
    lfPitchAndFamily := FIXED_PITCH or FF_DONTCARE;
  end;
  CV.Font.Handle := CreateFontIndirect(LogFont);
  SetBkMode(CV.Handle, TRANSPARENT);
  CV.TextOut(x, y, sText);
  CV.Font.Assign(SaveFont);
  SaveFont.Free;
end;

function salvarImagemLocal(url: String): String;
var
  nomeArquivo: String;
begin
  nomeArquivo := ExtractUrlFileName(url);

  if URLDownloadToFile(nil, PChar(url), PChar(montarNomeImagem(nomeArquivo)), 0, nil) = 0 then
  begin
    resizeImagem(montarNomeImagem(nomeArquivo), 19000);
    result := buscarImagemLocal(nomeArquivo);
  end
  else
    result := '';
end;

function salvarImagemLocal(stream: TStream; codigo: String): String;
var
  nomeArquivo: String;
  jpeg: TJPEGImage;
begin
  result := '';
  if (stream.Size > 0) then
  begin
    nomeArquivo := montarNomeImagem(codigo + '.jpg');
    jpeg := TJPEGImage.Create;
    jpeg.LoadFromStream(stream);
    jpeg.SaveToFile(nomeArquivo);
    result := nomeArquivo;
  end;
end;

function montarNomeImagem(nomeArquivo: String): String;
begin
  result := GetTempDir + 'imagens\' + nomeArquivo;
end;

function buscarImagemLocal(nomeArquivo: String): String;
begin
  CreateDir(GetTempDir + 'imagens');
  if (FileExists(montarNomeImagem(nomeArquivo))) then
  begin
    result := montarNomeImagem(nomeArquivo);
  end
  else
    result := '';
end;

function ExtractUrlFileName(const AUrl: string): string;
var
  i: Integer;
begin
  i := LastDelimiter('/', AUrl);
  Result := Copy(AUrl, i + 1, Length(AUrl) - (i));
end;

function GetTempDir: string;
var 
  Buffer: array[0..MAX_PATH] of Char; 
begin 
  GetTempPath(SizeOf(Buffer) - 1, Buffer); 
  Result := StrPas(Buffer); 
end; 

end.
