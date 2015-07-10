unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, Menus, Buttons, StdCtrls, DelphiTwain, ExtDlgs, jpeg,
  clipbrd;

type
  TFormMain = class(TForm)
    Toolbar: TPanel;
    StatusBar1: TStatusBar;
    Menu: TMainMenu;
    Menu1: TMenuItem;
    ListSources: TComboBox;
    Twain: TDelphiTwain;
    ItemExit: TMenuItem;
    Divider4: TMenuItem;
    ItemSave: TMenuItem;
    Divider3: TMenuItem;
    ItemShowInterface: TMenuItem;
    ItemAcquire: TMenuItem;
    ItemSelect: TMenuItem;
    ItemCopy: TMenuItem;
    ItemStatus1: TMenuItem;
    ItemStatus2: TMenuItem;
    Divider5: TMenuItem;
    ItemStatus3: TMenuItem;
    ItemStatus4: TMenuItem;
    ItemStatus5: TMenuItem;
    Divider6: TMenuItem;
    ItemStatus7: TMenuItem;
    ItemStatus8: TMenuItem;
    ItemStatus9: TMenuItem;
    ItemFlipVertical: TMenuItem;
    ItemFlipHorizontal: TMenuItem;
    Menu4: TMenuItem;
    Menu3: TMenuItem;
    Menu2: TMenuItem;
    Divider2: TMenuItem;
    ItemStatus6: TMenuItem;
    Divider7: TMenuItem;
    Transfer1: TMenuItem;
    Transfer2: TMenuItem;
    Transfer3: TMenuItem;
    Label1: TLabel;
    Image1: TImage;
    ContainImage: TScrollBox;
    Image: TImage;
    Bevel1: TBevel;
    Label2: TLabel;
    GoBack: TSpeedButton;
    GoForward: TSpeedButton;
    Current: TLabel;
    SavePic: TSavePictureDialog;
    GoTimer: TTimer;
    {Loads the library in memory}
    procedure ItemStatus1Click(Sender: TObject);
    {Loads the source manager}
    procedure ItemStatus2Click(Sender: TObject);
    {Loads the source}
    procedure ItemStatus3Click(Sender: TObject);
    {Send a command to the source}
    procedure ItemStatus4Click(Sender: TObject);
    {Enable source}
    procedure ItemStatus5Click(Sender: TObject);
    {Disable source}
    procedure ItemStatus6Click(Sender: TObject);
    {Unload source}
    procedure ItemStatus7Click(Sender: TObject);
    {Unload source manager}
    procedure ItemStatus8Click(Sender: TObject);
    {Source being disabled}
    procedure TwainSourceDisable(Sender: TObject; const Index: Integer);
    {Current source being changed}
    procedure ListSourcesChange(Sender: TObject);
    procedure ItemStatus9Click(Sender: TObject);
    {Changing file mode}
    procedure Transfer1Click(Sender: TObject);
    {Checking use interface}
    procedure ItemShowInterfaceClick(Sender: TObject);
    {Allow user to select the source}
    procedure ItemSelectClick(Sender: TObject);
    {Acquire source}
    procedure ItemAcquireClick(Sender: TObject);
    {Image acquired using memory and handle transferences}
    procedure TwainTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    {Image acquired file transferences}
    procedure TwainSourceFileTransfer(Sender: TObject;
      const Index: Integer; Filename: TW_STR255; Format: TTwainFormat;
      var Cancel: Boolean);
    {Previous image}
    procedure GoBackClick(Sender: TObject);
    {Next image}
    procedure GoForwardClick(Sender: TObject);
    {Flip the current image vertically}
    procedure ItemFlipVerticalClick(Sender: TObject);
    {Flip the current image horizontally}
    procedure ItemFlipHorizontalClick(Sender: TObject);
    {Dragging the image}
    procedure ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    {Click on the image}
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    {Being resized}
    procedure ContainImageResize(Sender: TObject);
    {Saving the current image}
    procedure ItemSaveClick(Sender: TObject);
    {User released one of the navigation buttons}
    procedure GoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    {Navigate between items}
    procedure GoNavigation(Sender: TObject);
    {User pressed one of the navigation buttons}
    procedure GoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    {Defines the place to save the file}
    procedure TwainSourceSetupFileXfer(Sender: TObject;
      const Index: Integer);
    {Save image to clipboard}
    procedure ItemCopyClick(Sender: TObject);
    {Closing the application}
    procedure ItemExitClick(Sender: TObject);
  public
    {Current loaded source}
    LoadedSource: Integer;
  private
    {Position when the user clicks over the image}
    ClickPos: TPoint;
    {Image list}
    ImageList: TList;
    {Transference mode}
    TransferMode: TTwainTransferMode;
    {Current selected source}
    CurrentSource: Integer;
    {Current image}
    CurrentImage: Integer;
    {Returns the checked item position in the status}
    function CheckedItem: Byte;
    {Used when changing the state to check if it's possible and}
    {to check the new item}
    function ChangeState(CanChange: Boolean; Item: TMenuItem;
      Error: String): Boolean;
    {Clear the list of images}
    procedure ClearImageList;
    {Selects the first item}
    procedure SelectFirst;
    {Adjust the buttons to navigate thru the image}
    procedure AdjustNavigate;
    {Returns the current image, if any}
    function GetCurrent(var Image: TBitmap): Boolean;
  public
    {Form being created}
    constructor Create(AOwner: TComponent); override;
    {Form being destroyed}
    destructor Destroy; override;
  end;

var
  FormMain: TFormMain;

implementation

uses FormSendCommand;

const
  HANDDRAGCURSOR = 3778;

{$R *.DFM}

{Returns the checked item position in the status}
function TFormMain.CheckedItem: Byte;
var
  i: Integer;
begin
  Result := 0;  {Default result}
  FOR i := 0 TO Menu3.Count - 1 DO
    {The item should not be a separator item}
    if (Menu3.Items[i].Caption <> '-') AND
      (Menu3.Items[i].Checked) then
      Result := Menu3.Items[i].Tag;
end;

{Used when changing the state to check if it's possible and}
{to check the new item}
function TFormMain.ChangeState(CanChange: Boolean; Item: TMenuItem;
  Error: String): Boolean;
begin
  Result := CanChange;
  if Result then Item.Checked := TRUE else ShowMessage(Error)
end;

{Loads the library in memory}
procedure TFormMain.ItemStatus1Click(Sender: TObject);
begin
  //Library must be unloaded to be loaded
  if ChangeState(CheckedItem = 9, Sender as TMenuItem,
    'The library must be unloaded to be loaded') then
  begin
    {Try loading the library}
    if not Twain.LoadLibrary then
    begin
      {Library could not be loaded}
      ItemStatus9.Checked := TRUE;
      ShowMessage('Twain library could not be loaded. Check if ' +
        'TWAIN is installed !');
    end {if not Twain.LoadLibrary}
  end {if ChangeState...}
end;

{Loads the source manager}
procedure TFormMain.ItemStatus2Click(Sender: TObject);
var
  i: Integer;
begin
  //Library must be loaded and the source
  if ChangeState(CheckedItem = 1, Sender as TMenuItem,
    'The library must be loaded and no source be loaded') then
  begin
    Twain.SourceManagerLoaded := TRUE;
    {Fill source list}
    ListSources.Items.Clear;
    FOR i := 0 TO Twain.SourceCount - 1 DO
      ListSources.Items.Add(Twain.Source[i].ProductName);
    {Select the first item}
    ListSources.ItemIndex := 0;
    CurrentSource := -1;
  end {if ChangeState...}
end;

{Loads the source}
procedure TFormMain.ItemStatus3Click(Sender: TObject);
begin
  //Source manager must be loaded
  if ChangeState(CheckedItem in [2, 6], Sender as TMenuItem,
    'Source manager must be loaded and no source enabled') then
  begin
    LoadedSource := CurrentSource;
    {Try loading source}
    if not Twain.Source[LoadedSource].LoadSource then
    begin
      {In case the source was not loaded}
      ShowMessage('The source "' + Twain.Source[LoadedSource].ProductName +
        '" could not be loaded');
      ItemStatus2.Checked := TRUE;
    end

  end {if ChangeState..}
end;

{Send a command to the source}
procedure TFormMain.ItemStatus4Click(Sender: TObject);
begin
  //Source must be loaded
  if ChangeState(CheckedItem in [3, 4, 6, 5], Sender as TMenuItem,
    'The source must be loaded') then
    SendCommandForm.ShowModal;
end;

{Enable source}
procedure TFormMain.ItemStatus5Click(Sender: TObject);
begin
  //Source must be loaded
  if ChangeState(CheckedItem in [3, 4, 5, 6], Sender as TMenuItem,
    'The source must be loaded') then
  begin
    Twain.Source[LoadedSource].TransferMode := Self.TransferMode;
    ClearImageList; {Clear list of images}
    Twain.Source[LoadedSource].EnableSource(ItemShowInterface.Checked, TRUE);
  end {if ChangeState...};
end;

{Disable source}
procedure TFormMain.ItemStatus6Click(Sender: TObject);
begin
  //Source must be loaded
  ChangeState(CheckedItem in [3, 4], Sender as TMenuItem,
    'Source must be in loaded state');
end;

{Unload source}
procedure TFormMain.ItemStatus7Click(Sender: TObject);
begin
  //Source must be loaded
  if ChangeState(CheckedItem in [3, 4, 5, 6], Sender as TMenuItem,
    'The source must be loaded') then
    Twain.Source[LoadedSource].Loaded := FALSE;
end;

{Unload source manager}
procedure TFormMain.ItemStatus8Click(Sender: TObject);
begin
  //Source must be loaded
  if ChangeState(CheckedItem in [2, 7], Sender as TMenuItem,
    'The source must be unloaded and source manager loaded') then
  begin
    {Unload source}
    Twain.SourceManagerLoaded := FALSE;
    {Clears source list}
    ListSources.Items.Clear;
  end
end;

{Unload source}
procedure TFormMain.ItemStatus9Click(Sender: TObject);
begin
  //Source must be loaded
  if ChangeState(CheckedItem in [1, 8], Sender as TMenuItem,
    'The source must be loaded and source manager unloaded') then
    Twain.LibraryLoaded := FALSE;
end;

{Form being created}
constructor TFormMain.Create(AOwner: TComponent);
begin
  {Call inherited}
  inherited Create(AOwner);
  {Create object}
  ImageList := TList.Create;
  {Avoid flickering by using double-buffering}
  ContainImage.DoubleBuffered := TRUE;
  ToolBar.DoubleBuffered := TRUE;
  {Select first source}
  TransferMode := ttmMemory;
  CurrentSource := -1;
  LoadedSource := CurrentSource;

end;

{Source being disabled}
procedure TFormMain.TwainSourceDisable(Sender: TObject;
  const Index: Integer);
begin
 ItemStatus6.Checked := TRUE;
end;

{Current source being changed}
procedure TFormMain.ListSourcesChange(Sender: TObject);
begin
  CurrentSource := ListSources.ItemIndex;
end;

{Changing transference mode}
procedure TFormMain.Transfer1Click(Sender: TObject);
begin
  TransferMode := TTwainTransferMode(TMenuItem(Sender).Tag);
  TMenuItem(Sender).Checked := TRUE;
end;

{Checking use interface}
procedure TFormMain.ItemShowInterfaceClick(Sender: TObject);
begin
  TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
end;

{Allow user to select the source}
procedure TFormMain.ItemSelectClick(Sender: TObject);
var
  NewSource: Integer;
begin
  {If user is using Status menu to execute process}
  if Twain.SourceManagerLoaded then
  begin
    NewSource := Twain.SelectSource;
    {In case some source was choosen}
    if NewSource <> -1 then
    begin
      CurrentSource := NewSource;
      ListSources.ItemIndex := CurrentSource;
    end {if NewSource <> -1}
  end
  else
  begin
    {Manually loading source}
    if Twain.LoadLibrary then
    begin
      {Load twain, show interface to select source and unload}
      Twain.LoadSourceManager;
      NewSource := Twain.SelectSource;
      if NewSource <> -1 then CurrentSource := NewSource;
      Twain.UnloadLibrary;
    end
    else
      ShowMessage('Library could not be loaded, check if source is loaded')
  end {if Twain.SourceManagerLoaded}
end;

{Acquire source}
procedure TFormMain.ItemAcquireClick(Sender: TObject);
begin
  {If user is already using Status menu}
  if Twain.LibraryLoaded then
    ItemStatus5Click(ItemStatus5)
  else
  begin
    {Load library, source manager and source}
    Twain.LoadLibrary;
    Twain.LoadSourceManager;
    Twain.Source[CurrentSource].Loaded := TRUE;
    {Enable source}
    Twain.Source[CurrentSource].TransferMode := Self.TransferMode;
    ClearImageList; {Clear list of images}
    Twain.Source[CurrentSource].EnableSource(ItemShowInterface.Checked, FALSE);
    while Twain.Source[CurrentSource].Enabled do Application.ProcessMessages;
    {Unload library}
    Twain.UnloadLibrary;
  end {if Twain.SourceLoaded}
end;

{Form being destroyed}
destructor TFormMain.Destroy;
begin
  {Call inherited method}
  inherited Destroy;
  {Free image list}
  ClearImageList;
  ImageList.Free;
end;

{Clear the list of images}
procedure TFormMain.ClearImageList;
var
  I: integer;
begin
  {Free each bitmap and then clear list}
  FOR i := 0 TO ImageList.Count - 1 DO
    TBitmap(ImageList[i]).Free;
  ImageList.Clear;
end;

{Image acquired using memory and handle transferences}
procedure TFormMain.TwainTwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
  {An image has being acquired, add to list}
  ImageList.Add(TBitmap.Create);
  TBitmap(ImageList[ImageList.Count - 1]).Assign(Image);
  {In case it's the first image, display}
  if ImageList.Count = 1 then SelectFirst;
  GoForward.Enabled := ImageList.Count - 1 > CurrentImage;
end;

{Image acquired file transferences}
procedure TFormMain.TwainSourceFileTransfer(Sender: TObject;
  const Index: Integer; Filename: TW_STR255; Format: TTwainFormat;
  var Cancel: Boolean);
var
  LoadFileName: String;
begin
  {Set file}
  LoadFileName := includetrailingbackslash(getcurrentdir) + 'picture.bmp';
  {Load and add to list}
  ImageList.Add(TBitmap.Create);
  TBitmap(ImageList[ImageList.Count - 1]).LoadFromFile(LoadFilename);
  DeleteFile(LoadFileName);
  {In case it's the first image, display}
  if ImageList.Count = 1 then SelectFirst;
  GoForward.Enabled := ImageList.Count - 1 > CurrentImage;
end;

{Selects the first image}
procedure TFormMain.SelectFirst;
begin
  Image.Picture.Assign(TBitmap(ImageList[0]));
  CurrentImage := 0;
  AdjustNavigate;
  Image.SetBounds(0, 0, 0, 0);
end;

{Adjust the buttons to navigate thru the image}
procedure TFormMain.AdjustNavigate;
begin
  {Adjust which button is enabled and the text}
  GoBack.Enabled := (CurrentImage > 0);
  GoForward.Enabled := ImageList.Count - 1 > CurrentImage;
  Current.Caption := Inttostr(CurrentImage + 1);
end;

{Previous image}
procedure TFormMain.GoBackClick(Sender: TObject);
begin
  dec(CurrentImage);
  Image.Picture.Assign(TBitmap(ImageList[CurrentImage]));
  AdjustNavigate;
  {Move image back to top}
  Image.SetBounds(0, 0, 0, 0);
end;

{Next image}
procedure TFormMain.GoForwardClick(Sender: TObject);
begin
  inc(CurrentImage);
  Image.Picture.Assign(TBitmap(ImageList[CurrentImage]));
  AdjustNavigate;
  {Move image back to top}
  Image.SetBounds(0, 0, 0, 0);
end;

{Returns the current image, if any}
function TFormMain.GetCurrent(var Image: TBitmap): Boolean;
begin
  Result := (ImageList.Count > 0);
  if Result then Image := TBitmap(ImageList[CurrentImage]);
end;

{Flip the current image vertically}
procedure TFormMain.ItemFlipVerticalClick(Sender: TObject);
var
  Image: TBitmap;
begin
  if GetCurrent(Image) then {In case there is an image}
  begin
    Image.Canvas.StretchDraw(Rect(0, Image.Height, Image.Width, 0), Image);
    Self.Image.Picture.Assign(TBitmap(ImageList[CurrentImage]));
  end {if GetCurrent}
end;

{Flip the current image horizontally}
procedure TFormMain.ItemFlipHorizontalClick(Sender: TObject);
var
  Image: TBitmap;
begin
  if GetCurrent(Image) then {In case there is an image}
  begin
    Image.Canvas.StretchDraw(Rect(Image.Width, 0, 0, Image.Height), Image);
    Self.Image.Picture.Assign(TBitmap(ImageList[CurrentImage]));
  end {if GetCurrent}
end;

{Dragging the image}
procedure TFormMain.ImageMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  NewPos: TPoint;
begin
  {The left button was pressed}
  if ssLeft in Shift then
  begin
    {Calculate new position}
    NewPos.X := Image.Left + x - ClickPos.x;
    NewPos.Y := Image.Top + y - ClickPos.y;
    if NewPos.x + Image.Width < ContainImage.Width then
      NewPos.x := ContainImage.Width - Image.Width;
    if NewPos.y + Image.Height < ContainImage.Height then
      NewPos.y := ContainImage.Height - Image.Height;
    if NewPos.X > 0 then NewPos.X := 0;
    if NewPos.Y > 0 then NewPos.Y := 0;

    Image.Top := NewPos.Y;
    Image.Left := NewPos.X;
  end {if ssLeft in Shift}
end;

{Click on the image}
procedure TFormMain.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ClickPos.x := X;
  ClickPos.y := Y;
end;

{Being resized}
procedure TFormMain.ContainImageResize(Sender: TObject);
begin
  ClickPos.X := 0; ClickPos.Y := 0;
  ImageMouseMove(Self, [ssLeft], 0, 0);
end;

{Saving the current image}
procedure TFormMain.ItemSaveClick(Sender: TObject);
var
  Image: TBitmap;
begin
  {If there is an image}
  if GetCurrent(Image) and SavePic.Execute then
    case SavePic.FilterIndex of
      {JPEG image}
      0: with tjpegimage.Create do
      begin
        assign(Image);
        SaveToFile(SavePic.FileName);
        free;
      end;
      {Bitmap}
      1: Image.SaveToFile(SavePic.FileName);
    end {case}
end;

{User released one of the navigation buttons}
procedure TFormMain.GoMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  GoTimer.Enabled := FALSE;
end;

{Navigate between items}
procedure TFormMain.GoNavigation(Sender: TObject);
begin
  if (TTimer(Sender).Tag = 1) and GoBack.Enabled then
    GoBackClick(Self)
  else if (TTimer(Sender).Tag = 2) and GoForward.Enabled then
    GoForwardClick(Self);
  TTimer(Sender).Interval := 200;
end;

{User pressed one of the navigation buttons}
procedure TFormMain.GoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
  begin
    GoTimer.Tag := TSpeedButton(Sender).Tag;
    GoTimer.Enabled := TRUE;
    GoTimer.Interval := 450;
  end
end;

{Defines the place to save the file}
procedure TFormMain.TwainSourceSetupFileXfer(Sender: TObject;
  const Index: Integer);
begin
  Twain.Source[Index].SetupFileTransfer(
    includetrailingbackslash(getcurrentdir) + 'picture.bmp', tfBmp);
end;

{Save image to clipboard}
procedure TFormMain.ItemCopyClick(Sender: TObject);
var
  Image: TBitmap;
  MyFormat: Word;
  AData: Cardinal;
  APalette : HPALETTE;
begin
  if GetCurrent(Image) then {In case there is an image}
  begin
    Image.SaveToClipboardFormat(MyFormat, AData, APalette);
    clipboard.SetAsHandle(MyFormat,AData);
  end {if GetCurrent(Image)}

end;

{Closing the application}
procedure TFormMain.ItemExitClick(Sender: TObject);
begin
  Close;
end;

initialization
  Screen.Cursors[HANDDRAGCURSOR] := LoadCursor(hInstance, MAKEINTRESOURCE(101));
finalization
  DeleteObject(Screen.Cursors[HANDDRAGCURSOR]);

end.
