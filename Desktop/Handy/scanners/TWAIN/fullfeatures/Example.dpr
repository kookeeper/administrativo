program Example;

uses
  Forms,
  MainForm in 'MainForm.pas' {FormMain},
  FormSendCommand in 'FormSendCommand.pas' {SendCommandForm},
  TwainTable in 'TwainTable.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TDelphiTwain Example';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TSendCommandForm, SendCommandForm);
  Application.Run;
end.
