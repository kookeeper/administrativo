program WebService;

uses
  Forms,
  FWebService in 'FWebService.pas' {formWebService},
  ufrmStatus in 'ufrmStatus.pas' {frmStatus};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformWebService, formWebService);
  Application.CreateForm(TfrmStatus, frmStatus);
  Application.Run;
end.
