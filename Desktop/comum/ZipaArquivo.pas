unit ZipaArquivo;

interface

uses StdCtrls, Windows, Classes, Forms, zip32, SysUtils;

var
  Memo : TMemo; // Varivel utilizada para compactar a imagem para envio ao suporte

  function DummyPrint(Buffer: PChar; Size: ULONG): integer; stdcall ; // Funo para compactar arquivos
  function DummyPassword(P: PChar; N: Integer; M, Name: PChar): integer; stdcall ; // Funo para compactar arquivos
  function DummyComment(Buffer: PChar): PChar; stdcall ; // Funo para compactar arquivos
  procedure SetDummyInitFunctions(var Z: TZipUserFunctions);
  procedure ZipFiles(FileName: string; FileList: TStrings; Formulario: TForm); // Funo para compactar arquivos

implementation

procedure ZipFiles(FileName: string; FileList: TStrings; Formulario: TForm);
var
  i        : integer;
  ZipRec   : TZCL;
  ZUF      : TZipUserFunctions;
begin
  If Not Assigned(Memo) then
  begin
    Memo := TMemo.Create(Nil);
    Memo.Parent := Formulario;
    Memo.Visible := False;
    Memo.Lines.Clear;
  end;

  { precaution }
  if Trim(FileName) = '' then Exit;
  if FileList.Count <= 0 then Exit;

  { initialize the dll with dummy functions }
  SetDummyInitFunctions(ZUF);

  { number of files to zip }
  ZipRec.argc := FileList.Count;

  { name of zip file - allocate room for null terminated string  }
  GetMem(ZipRec.lpszZipFN, Length(FileName) + 1 );
  ZipRec.lpszZipFN := StrPCopy( ZipRec.lpszZipFN, FileName);

  { dynamic array allocation }
  SetLength(ZipRec.FNV, ZipRec.argc );

  { copy the file names from FileList to ZipRec.FNV dynamic array }
  for i := 0 to ZipRec.argc - 1 do
  begin
    GetMem(ZipRec.FNV[i], Length(FileList[i]) + 1 );
    StrPCopy( ZipRec.FNV[i], FileList[i]);
  end;

  { send the data to the dll }
  ZpArchive(ZipRec);

  { release the memory for the file list }
  for i := (ZipRec.argc - 1) downto 0 do
    FreeMem(ZipRec.FNV[i], Length(FileList[i]) + 1 );

  { release the memory for the ZipRec.FNV dynamic array
    NOTE : This line actually is useless.
           Dynamic arrays are lifitime managed, just like long strings.
           They released when they live scope}
  ZipRec.FNV := nil;

  { release the memory for the FileName }
  FreeMem(ZipRec.lpszZipFN, Length(FileName) + 1 );

end;

function DummyComment(Buffer: PChar): PChar;
begin
  Result := Buffer;
end;

function DummyPassword(P: PChar; N: Integer; M,
  Name: PChar): integer;
begin
  Result := 1;
end;

function DummyPrint(Buffer: PChar;
  Size: ULONG): integer;
begin
  Memo.Lines.Add(Buffer);
  Result := Size;
end;

procedure SetDummyInitFunctions(var Z: TZipUserFunctions);
begin
  { prepare ZipUserFunctions structure }
  with Z do
  begin
    @Print     := @DummyPrint;
    @Comment   := @DummyPassword;
    @Password  := @DummyComment;
  end;
  { send it to dll }
  ZpInit(Z);
end;

end.
