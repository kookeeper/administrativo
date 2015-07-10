program PrUpdate;

uses
  Forms,
  UAtualizacoes in 'UAtualizacoes.pas' {FAtualizacoes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFAtualizacoes, FAtualizacoes);
  Application.Run;
end.
