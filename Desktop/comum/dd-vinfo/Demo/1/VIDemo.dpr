{ ##
  @FILE                     VIDemo.dpr
  @COMMENTS                 Project file for TPJVersionInfo component demo
                            application.
  @PROJECT_NAME             Version Information Component
  @PROJECT_DESC             Component that reads version information from files.
  @AUTHOR                   Peter Johnson, LLANARTH, Ceredigion, Wales, UK
  @EMAIL                    peter.johnson@openlink.org
  @WEBSITE                  http://www.delphidabbler.com/
  @COPYRIGHT                © 2002, Peter D Johnson
  @LEGAL_NOTICE             This demo program is placed in the public domain. It
                            may be freely copied and circulated on a not for
                            profit basis providing that the code is unmodified
                            and this notice and information about the author and
                            his copyright remains attached to the source code.
  @HISTORY(
    @REVISION(
      @VERSION              1.0
      @DATE                 17/02/2002
      @COMMENTS             Original version.
    )
  )
}


program VIDemo;

uses
  Forms,
  FmVIDemo in 'FmVIDemo.pas' {MainForm};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Version Info Component Demo';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
