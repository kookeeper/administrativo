unit WaitForm;

interface

uses Windows, Forms, Controls, Messages;

type
  TStatusWindowHandle = type HWND;

function CreateStatusWindow(const Text: string; Handle: HWND): TStatusWindowHandle;
procedure RemoveStatusWindow(StatusWindow: TStatusWindowHandle);

implementation

function CreateStatusWindow(const Text: string; Handle: HWND): TStatusWindowHandle;
var
  FormWidth,
  FormHeight: integer;
begin
  FormWidth := 400;
  FormHeight := 164;
  result := CreateWindow('STATIC',
                         PChar(Text),
                         WS_OVERLAPPED or WS_POPUPWINDOW or WS_THICKFRAME or SS_CENTER or SS_CENTERIMAGE,
                         (Screen.Width - FormWidth) div 2,
                         (Screen.Height - FormHeight) div 2,
                         FormWidth,
                         FormHeight,
//                         Application.MainForm.Handle,
                         Handle,
                         0,
                         HInstance,
                         nil);

  ShowWindow(result, SW_SHOWNORMAL);
  UpdateWindow(result);
end;

procedure RemoveStatusWindow(StatusWindow: TStatusWindowHandle);
begin
  DestroyWindow(StatusWindow);
end;

end.
