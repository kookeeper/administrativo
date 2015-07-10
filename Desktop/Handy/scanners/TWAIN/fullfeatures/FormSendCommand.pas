unit FormSendCommand;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DelphiTwain, Twain, TwainTable, ComCtrls;

type
  TSendCommandForm = class(TForm)
    Icon: TImage;
    MainTitle: TLabel;
    Container1: TGroupBox;
    Title1: TLabel;
    Combo1: TComboBox;
    Title2: TLabel;
    Combo2: TComboBox;
    Title3: TLabel;
    Combo3: TComboBox;
    Title4: TLabel;
    Combo4: TComboBox;
    GoSend: TButton;
    Results: TListBox;
    Title5: TLabel;
    Container2: TGroupBox;
    GoClose: TButton;
    SetCombo: TComboBox;
    SetPages: TNotebook;
    Panel1: TPanel;
    GoAddArray: TButton;
    GoRemoveArray: TButton;
    ArrayList: TListBox;
    GoRemoveEnumeration: TButton;
    GoAddEnumeration: TButton;
    EnumerationList: TListBox;
    Label1: TLabel;
    EnumDefault: TEdit;
    EnumDefaultValue: TUpDown;
    SetEnumDefault: TButton;
    Bevel1: TBevel;
    Label2: TLabel;
    RangeMin: TEdit;
    Label3: TLabel;
    RangeMax: TEdit;
    RangeStep: TEdit;
    Label4: TLabel;
    {User clicked to send the command}
    procedure GoSendClick(Sender: TObject);
    {Changing container, updates set page}
    procedure ComboSetChange(Sender: TObject);
    {Add an item to the array or to the enumeration}
    procedure GoAddItem(Sender: TObject);
    {Removes an item from the array or enumeration}
    procedure GoRemoveItem(Sender: TObject);
    {Changing the mode}
    procedure Combo3Change(Sender: TObject);
    {Set the current selected item in the enumeration as default}
    procedure SetEnumDefaultClick(Sender: TObject);
  private
    {Test the result, and display messages in case of error}
    function TestResult(Return: TCapabilityRet): Boolean;
    {Returns the current source}
    function CurSource: TTwainSource;
    {Returns the current selected mode}
    function CurrentMode: TRetrieveCap;
    {Returns the current item type}
    function CurrentItemType: TW_UINT16;
    {Returns the current selected capability}
    function CurrentCapability: TTableInfo;
    {Retrieve value for the selected capability}
    procedure GetValue;
    {Set value for the selected capability}
    procedure SetValue;
    {Update the set pages}
    procedure UpdateSetPages;
  public
    {Form being created}
    constructor Create(AOwner: TComponent); override;
  end;

var
  SendCommandForm: TSendCommandForm;

implementation

uses
  MainForm, DelphiTwainUtils {From twain};

{$R *.DFM}

{ TSendCommandForm }

{Form being created}
constructor TSendCommandForm.Create(AOwner: TComponent);
var
  i: Integer;
begin
  {Let inherited class create}
  inherited Create(AOwner);

  {Add all the capabilities for the capability combo}
  FOR i := 0 TO MAX_CAPABILITY - 1 DO
    Combo1.Items.Add(CapabilitySTR[i]);

  {Select the combo box items}
  Combo1.ItemIndex := Combo1.Items.IndexOf('CAP_SUPPORTEDCAPS');
  Combo2.ItemIndex := 2;   {TWON_ONEVALUE}
  Combo3.ItemIndex := 0;   {rcGet}
  Combo4.ItemIndex := 4;   {TWTY_UINT16}
  UpdateSetPages;
end;

{Returns the current item type}
function TSendCommandForm.CurrentItemType: TW_UINT16;
begin
  Result := Combo4.ItemIndex;
end;

{Returns the current selected capability}
function TSendCommandForm.CurrentCapability: TTableInfo;
var
  i: integer;
begin
  {Looks for the current capability in the list}
  FOR i := 0 TO MAX_CAPABILITY - 1 DO
    if CapabilitySTR[i] = Combo1.Items[Combo1.ItemIndex] then
      Result := CapabilityID[i];
end;

{Returns the current selected mode}
function TSendCommandForm.CurrentMode: TRetrieveCap;
begin
  Result := TRetrieveCap(Combo3.ItemIndex);
end;

{Returns the current source}
function TSendCommandForm.CurSource: TTwainSource;
begin
  Result := FormMain.Twain.Source[FormMain.LoadedSource];
end;

{Filter value to replace numbers for constants strings}
function FilterValue(const Capability: TTableInfo; ItemType: TW_UINT16;
  Value: String): String;
var
  i, j: Integer;
begin
  Result := Value; {Default return in case it didn't find a match}

  {Special value for bool type}
  if (ItemType = TWTY_BOOL) then
  begin
    {Replace 1 by TRUE and -1, 0 for FALSE (or anything else than 1)}
    if Value = '1' then Result := 'True' else Result := 'False';
    exit;
  end;

  {Capability}
  if (Capability.ID = CAP_SUPPORTEDCAPS) then
  begin
    {Look in the list}
    FOR i := 0 TO MAX_CAPABILITY - 1 DO
      if CapabilityID[i].ID = StrToIntDef(Value, -1) then
        Result := CapabilitySTR[i];
    exit;
  end;

  {Check capability table}
  FOR i := low(CapabilityTable) to high(CapabilityTable) do
    if CapabilityTable[i].Cap = Capability.ID then
    begin
      {Match found, look in the new table}
      FOR j := 0 TO CapabilityTable[i].Count - 1 DO
        if CapabilityTable[i].PTR^[j].ID = StrToIntDef(Value, -1) then
          Result := CapabilityTable[i].PTR^[j].STR;
    end {if CapabilityTable[i].Cap = Capability};

end;

{Retrieve value for the selected capability}
procedure TSendCommandForm.GetValue;
var
  Capability: TTableInfo;
  Container : TW_UINT16;
  Handle    : HGLOBAL;
  i         : Integer;

  {For all containers}
  ItemType  : TW_UINT16;
  {One value}
  Value     : String;
  {Range}
  Min, Max, Step, Default, Current: String;
  {Array and enumeration}
  List: TGetCapabilityList;
  {Enumeration}
  CurrentIndex, DefaultIndex: Integer;

begin
  {Store current capability}
  Capability := CurrentCapability();
  if TestResult(CurSource.GetCapabilityRec(Capability.ID, Handle,
    CurrentMode, Container)) then
  begin
    {Update combo boxe}
    Combo2.ItemIndex := Container - 3;
    {Clear results}
    Results.Items.Clear;
    Results.Items.Add(Combo1.Items[Combo1.ItemIndex]);
    Results.Items.Add('ItemType = ' + Combo4.Items[Combo4.ItemIndex]);

    {Test the container returned}
    case Container of

      {One value container}
      TWON_ONEVALUE:
      begin
        {Call method. Result will be filled with value}
        CurSource.GetOneValue(Capability.ID, ItemType, Value, CurrentMode,
          Handle);
        {Filter value to replace numbers for constants strings}
        Value := FilterValue(Capability, ItemType, Value);
        {Show result}
        Results.Items.Add('Value = ' + Value);
      end;

      {Range container}
      TWON_RANGE:
      begin
        {Call method to get the values}
        CurSource.GetRangeValue(Capability.ID, ItemType, Min, Max, Step,
          Default, Current, Handle);
        {Replace values with constants}
        Min := FilterValue(Capability, ItemType, Min);
        Max := FilterValue(Capability, ItemType, Max);
        Step := FilterValue(Capability, ItemType, Step);
        Default := FilterValue(Capability, ItemType, Default);
        Current := FilterValue(Capability, ItemType, Current);
        {Show results}
        Results.Items.Add('Min = ' + Min);
        Results.Items.Add('Step = ' + Step);
        Results.Items.Add('Max = ' + Max);
        Results.Items.Add('Current = ' + Current);
        Results.Items.Add('Defaukt = ' + Default);
      end;

      {Enumeration container}
      TWON_ENUMERATION:
      begin
        {Call method to get the enumeration values}
        CurSource.GetEnumerationValue(Capability.ID, ItemType, List,
          CurrentIndex, DefaultIndex, CurrentMode, Handle);
        {Replace each value with constants}
        FOR i := 0 TO Length(List) - 1 DO
          List[i] := FilterValue(Capability, ItemType, List[i]);
        {Show enumeration results}
        Results.Items.Add('Current = ' + List[CurrentIndex]);
        Results.Items.Add('Default = ' + List[DefaultIndex]);
        FOR i := 0 TO Length(List) - 1 DO
          Results.Items.Add(inttostr(i + 1) + ' = ' + List[i]);
      end;

      {Array container}
      TWON_ARRAY:
      begin
        {Call method to get the array values}
        CurSource.GetArrayValue(Capability.ID, ItemType, List, Handle);
        {Replace each value with constants}
        FOR i := 0 TO Length(List) - 1 DO
          List[i] := FilterValue(Capability, ItemType, List[i]);
        {Show array results}
        FOR i := 0 TO Length(List) - 1 DO
          Results.Items.Add(inttostr(i + 1) + ' = ' + List[i]);
      end;

      {case} else GlobalFree(Handle)
    end {case};

    {Update combo box for item type}
    Combo4.ItemIndex := ItemType;
    UpdateSetPages;

  end {if TestResult(CurSource.GetCapabilityRec...}

end;

{User clicked the button to send the command}
procedure TSendCommandForm.GoSendClick(Sender: TObject);
begin
  {Test if user is setting or retrieving values}
  if Combo3.ItemIndex = Combo3.Items.Count - 1 then
    SetValue
  else
    GetValue;
end;

{Converts string constant to capability item ID}
function TranslateToID(const ID, ItemType: TW_UINT16; Value: String): String;
var
  i, j: Integer;
  UpperValue: String;
begin
  {True/False for boolean}
  if ItemType = TWTY_BOOL then
  begin
    {TRUE is '1' and FALSE '0'}
    if Uppercase(Value) = 'TRUE' then Result := '1' else Result := '0';
    exit;
  end;

  {In case not found, return same value}
  Result := Value;

  {Use search table}
  FOR i := low(CapabilityTable) to high(CapabilityTable) do
    if CapabilityTable[i].Cap = ID then
    begin
      UpperValue := Uppercase(Value);  {Value in uppercase for speed}
      {Match found, look in the new table}
      FOR j := 0 TO CapabilityTable[i].Count - 1 DO
        if CapabilityTable[i].PTR^[j].STR = UpperValue then
          Result := IntToStr(CapabilityTable[i].PTR^[j].ID);
    end {if CapabilityTable[i].Cap = Capability};

end;

{Converts string into type and return pointer to new type}
function GetID(const ID, ItemType: TW_UINT16; Value: String): Pointer;
var
  ItemSize: Integer;
begin
  {Translate constant string to string integer if needed}
  Value := TranslateToID(ID, ItemType, Value);

  {Allocate memory}
  ItemSize := TWTypeSize(ItemType);
  Result := AllocMem(ItemSize);
  Fillchar(Result^, ItemSize, #0);

  {Fill value depending on the item type}
  case ItemType of
    TWTY_INT8  :  pTW_INT8(Result)^ := StrToIntDef(Value, 0);
    TWTY_UINT8 :  pTW_UINT8(Result)^ := StrToIntDef(Value, 0);
    TWTY_INT16 :  pTW_INT16(Result)^ := StrToIntDef(Value, 0);
    TWTY_UINT16:  pTW_UINT16(Result)^ := StrToIntDef(Value, 0);
    TWTY_INT32 :  pTW_INT32(Result)^ := StrToIntDef(Value, 0);
    TWTY_UINT32:  pTW_UINT32(Result)^ := StrToIntDef(Value, 0);
    {Floating type numbers}
    TWTY_FIX32 :
    try
      pTW_FIX32(Result)^ := FloatToFix32(StrToFloat(Value));
    except
      pTW_FIX32(Result)^ := FloatToFix32(0);
    end;
    TWTY_FRAME :  begin end;
    {Special for text}
    TWTY_STR32,
    TWTY_STR64,
    TWTY_STR128,
    TWTY_STR255:
      if Length(Value) > ItemSize - 1 then
        CopyMemory(Result, @Value[1], ItemSize - 1)
      else
        CopyMemory(Result, @Value[1], Length(Value))
  end;

end;

{Set value for the selected capability}
procedure TSendCommandForm.SetValue;
var
  Capability: TTableInfo;
  i: Integer;
  {For one value}
  Value: Pointer;
  {For range}
  RMin, RStep, RMax, RCurrent: TW_FIX32;
  {Used with enumeration and array}
  SetList: TSetCapabilityList;
begin
  {Obtain current capability}
  Capability := CurrentCapability();

  {Test the container type}
  case TW_UINT16(Combo2.ItemIndex + 3) of
    {One value types}
    TWON_ONEVALUE:
    begin
      {Allocate value}
      Value := GetID(Capability.ID, CurrentItemType(), SetCombo.Text);
      {Set value}
      if TestResult(CurSource.SetOneValue(CurrentCapability.ID,
        CurrentItemType, Value)) then
        {If everything went ok, display message}
        ShowMessage(Combo1.Items[Combo1.ItemIndex] + ' set ok as ' +
          SetCombo.Text + '.');
      {Free memory}
      FreeMem(Value);
    end {TWON_ONEVALUE};

    {Enumeration}
    TWON_ENUMERATION:
    begin
      SetLength(SetList, EnumerationList.Items.Count);  {Set list size}
      {Build list}
      FOR i := 0 TO EnumerationList.Items.Count - 1 DO
        SetList[i] := GetID(Capability.ID, CurrentItemType(),
          EnumerationList.Items[i]);
      {Call method to set}
      if TestResult(CurSource.SetEnumerationValue(CurrentCapability.ID,
        CurrentItemType, EnumDefaultValue.Position, SetList)) then
        ShowMessage(Combo1.Items[Combo1.ItemIndex] + ' enumeration set ok.')
    end;

    {Array}
    TWON_ARRAY:
    begin
      SetLength(SetList, ArrayList.Items.Count);  {Set list size}
      {Build list}
      FOR i := 0 TO ArrayList.Items.Count - 1 DO
        SetList[i] := GetID(Capability.ID, CurrentItemType(),
          ArrayList.Items[i]);
      {Call method to set}
      if TestResult(CurSource.SetArrayValue(CurrentCapability.ID,
        CurrentItemType, SetList)) then
        ShowMessage(Combo1.Items[Combo1.ItemIndex] + ' array set ok.')
    end;

    {Range values}
    TWON_RANGE:
    begin
      {Try obtaining values from range}
      try
        RMin := FloatToFix32(StrToFloat(TranslateToID(Capability.ID,
          CurrentItemType(), RangeMin.Text)));
        RStep := FloatToFix32(StrToFloat(TranslateToID(Capability.ID,
          CurrentItemType(), RangeStep.Text)));
        RMax := FloatToFix32(StrToFloat(TranslateToID(Capability.ID,
          CurrentItemType(), RangeMax.Text)));
        RCurrent := FloatToFix32(StrToFloat(TranslateToID(Capability.ID,
          CurrentItemType(), SetCombo.Text)));
      except
        {In case one or more values could not be converted to integer}
        ShowMessage('One or more values from the range are not valid ' +
          'integer values.'#13#10#13#10 + 'Tip: Use comma for floating type ' +
          'numbers instead of dots');
        exit;
      end;

      {Set value}
      if CurrentItemType = TWTY_FIX32 then
        if TestResult(CurSource.SetRangeValue(CurrentCapability.ID,
          CurrentItemType, pInteger(@RMin)^, pInteger(@RMax)^,
            PInteger(@RStep)^, pInteger(@RCurrent)^)) then
          {If everything went ok, display message}
          ShowMessage(Combo1.Items[Combo1.ItemIndex] + ' range set ok.')
      else
        if TestResult(CurSource.SetRangeValue(CurrentCapability.ID,
          CurrentItemType, Integer(RMin.Whole), Integer(RMax.Whole),
            Integer(RStep.Whole), Integer(RCurrent.Whole))) then
          {If everything went ok, display message}
          ShowMessage(Combo1.Items[Combo1.ItemIndex] + ' range set ok.')
    end {TWON_RANGE};
  end {case};

  {Free pointer list if needed}
  FOR i := 0 TO Length(SetList) - 1 DO
    FreeMem(SetList[i]);

  {Clear all values}
  EnumerationList.Items.Clear;
  ArrayList.Items.Clear;
  EnumDefaultValue.Position := 0;
  SetCombo.Text := '';
end;

{Test the result, and display messages in case of error}
function TSendCommandForm.TestResult(Return: TCapabilityRet): Boolean;
const
  Messages: Array[TCapabilityRet] of String = ('', 'Unsupported capability.',
    'Bad operation performed, not supported.', 'Capability depends on another.',
    'Low memory avaliable for this operation.', 'Invalid source or manager ' +
    'state to perform operation.', 'Invalid container used for operation.');
begin
  {Only successful if value is crSuccess}
  Result := (Return = crSuccess);

  {Show appropriate message}
  if not Result then ShowMessage(Messages[Return]);

end;

{Changing container, updates set page}
procedure TSendCommandForm.ComboSetChange(Sender: TObject);
var
  i, j: Integer;
  CurCapability: TTableInfo;
begin
  {Call method to update the set pages}
  UpdateSetPages;
  {Clear combo values}
  SetCombo.Items.Clear;
  SetCombo.Text := '';
  CurCapability := CurrentCapability();

  {If it's a boolean, add boolean types to combo}
  if CurrentItemType = TWTY_BOOL then
  begin
    SetCombo.Style := csDropDownList;
    SetCombo.Items.Add('True');
    SetCombo.Items.Add('False');
    SetCombo.ItemIndex := 0;
    exit;
  end;

  FOR i := 0 TO High(CapabilityTable) DO
    if CapabilityTable[i].Cap = CurCapability.ID then
    begin
      {Set combo style}
      SetCombo.Style := csDropDown;
      {Add each item}
      FOR j := 0 TO CapabilityTable[i].Count - 1 DO
         SetCombo.Items.Add(CapabilityTable[i].PTR^[j].STR);
      SetCombo.ItemIndex := 0;
      exit;
    end;

  {No definied constant}
  SetCombo.Style := csSimple;


end;

{Update the set pages}
procedure TSendCommandForm.UpdateSetPages;
begin
  SetPages.PageIndex := Combo2.ItemIndex;
  {Set return type for this capability}
  Combo4.ItemIndex := CurrentCapability.DefType;

end;

{Add an item to the array or to the enumeration}
procedure TSendCommandForm.GoAddItem(Sender: TObject);
begin
  {First check if there is content in the edit box}
  if SetCombo.Text <> '' then
    {Add the item to the list being displayed, array or enumeration}
    if SetPages.PageIndex = 0 then
      ArrayList.Items.Add(SetCombo.Text)
    else
      EnumerationList.Items.Add(SetCombo.Text)
  else ShowMessage('Set some value before trying to add to the list.');
end;

{Removes an item from the array or enumeration}
procedure TSendCommandForm.GoRemoveItem(Sender: TObject);
begin
  {Remove item from the list being displayed}
  if SetPages.PageIndex = 0 then
    if ArrayList.ItemIndex = -1 then
      ShowMessage('There is no items selected in the list')
    else
      ArrayList.Items.Delete(ArrayList.ItemIndex)
  else
    {Enumeration}
    if EnumerationList.ItemIndex = -1 then
      ShowMessage('There is no items selected in the list')
    else
      EnumerationList.Items.Delete(EnumerationList.ItemIndex);

end;

{Changing the mode}
procedure TSendCommandForm.Combo3Change(Sender: TObject);
begin
  {If user choose setting a capability value, select TWON_ONEVALUE by default }
  if Combo3.ItemIndex = Combo3.Items.Count - 1 then
    Combo2.ItemIndex := Combo2.Items.IndexOf('TWON_ONEVALUE');
  UpdateSetPages;
end;

{Set the current selected item in the enumeration as default}
procedure TSendCommandForm.SetEnumDefaultClick(Sender: TObject);
begin
  if EnumerationList.ItemIndex <> -1 then
    EnumDefaultValue.Position := EnumerationList.ItemIndex
  else
    showmessage('You must select an item in the list first.');
end;

end.
