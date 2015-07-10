program Scanners;

uses
  Forms,
  Principal in 'Principal.pas' {FPrincipal},
  Usuarios in 'Usuarios.pas' {FCadastroUsuarios},
  Parametros in 'Parametros.pas' {FParametros},
  Scanner in 'Scanner.pas' {FScanner},
  Zip32 in '..\..\comum\Zip32.pas',
  ZipaArquivo in '..\..\comum\ZipaArquivo.pas',
  tnpdf in '..\..\comum\tnpdf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.Run;
end.
