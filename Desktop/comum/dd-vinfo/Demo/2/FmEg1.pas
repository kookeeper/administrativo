{ ##
  @FILE                     FmEg1.pas
  @COMMENTS                 Form unit that implements example 1 from the
                            TPJVersionInfo component help file.
  @PROJECT_NAME             Version Information Component
  @PROJECT_DESC             Component that reads version information from files.
  @DEPENDENCIES             Requires component:
                            + TPJVersionInfo v3.1 or later
  @HISTORY(
    @REVISION(
      @VERSION              1.0
      @DATE                 17/02/2002
      @COMMENTS             Original version.
    )
    @REVISION(
      @VERSION              1.1
      @DATE                 11/12/2005
      @COMMENTS             + Added button that displays example's help topic.
                            + Added brief description of e.g. to form's caption.
    )
  )
}


unit FmEg1;

interface

uses
  // Delphi
  Classes, Controls, StdCtrls, Forms,
  // DelphiDabbler component
  PJVersionInfo;

type
  TEgForm1 = class(TForm)
    PJVersionInfo1: TPJVersionInfo;
    ListBox1: TListBox;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  end;

var
  EgForm1: TEgForm1;

implementation

uses
  // Delphi
  SysUtils, Windows;

{$R *.DFM}

procedure TEgForm1.FormCreate(Sender: TObject);
var
  I: Integer;
begin
  ListBox1.Clear;
  // loop thru all translations
  if PJVersionInfo1.HaveInfo then
    for I := 0 to Pred(PJVersionInfo1.NumTranslations) do
    begin
      // make the current translation current
      PJVersionInfo1.CurrentTranslation := I;
      // add language and char set info to the list box
      ListBox1.Items.Add(
        Format(
          'Language: %s (%0.4X) -- CharSet: %s (%0.4X)',
          [PJVersionInfo1.Language, PJVersionInfo1.LanguageCode,
          PJVersionInfo1.CharSet, PJVersionInfo1.CharSetCode]
        )
      );
    end
  else
    ListBox1.Items.Add('NO VERSION INFO');
end;

procedure TEgForm1.Button3Click(Sender: TObject);
  // Displays example in help
  // this event handler is not included in help example
const
  cMacro = 'AL("TPJVersionInfo_Example1",1)';
begin
  WinHelp(Handle, 'PJVersionInfo.hlp', HELP_COMMAND, LParam(PChar(cMacro)));
end;

end.
