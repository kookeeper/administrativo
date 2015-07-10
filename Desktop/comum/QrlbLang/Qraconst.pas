unit QrAConst;

interface

const
  STTAlertMessage = 60000;
  STTAbortMessage = 59999;

implementation

{$IFDEF WIN32}
  {$R *.R32}
{$ELSE}
  {$R *.R16}
{$ENDIF}

end.