unit UExportarRMA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, DB, OleServer, ExcelXP, StdCtrls,
  Buttons, RzCmboBx, RzLabel, Mask, RzEdit;

type
  TFExportarRMA = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    bbFechar: TBitBtn;
    SaveDialog1: TSaveDialog;
    Excel: TExcelApplication;
    RzLabel1: TRzLabel;
    cbReferencia: TRzComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbReferenciaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ExpExcel(Dataset : TDataSet);//; ArqNome : String);
    function PegaLetraColuna(IntNumber : Integer) : String;
  public
    { Public declarations }
  end;

var
  FExportarRMA: TFExportarRMA;

implementation

uses UDM;

{$R *.dfm}

procedure TFExportarRMA.ExpExcel(Dataset : TDataSet);//; ArqNome : String);
var
  NumLinha, NumColuna, LCID, Campo, NumCampo : Integer;
  StrCell : String;
//  FileName : OleVariant;
  exporta : Boolean;
//  AdtoMru, CreateBck, ROREcommended : OleVariant;
begin
  LCID := GetUserDefaultLCID;
  with Excel do
  begin
    Connect;
    try
      Visible[LCID] := True;
      Workbooks.Add(EmptyParam, LCID);
      NumLinha := 1;
      NumColuna := 1;

      with Dataset do
      begin
        for NumCampo := 1 to Fields.Count do
        begin
          exporta := false;
          for Campo := 0 to DBGrid1.Columns.Count - 1 do
            if Fields[NumCampo - 1].FieldName = DBGrid1.Columns.Items[Campo].FieldName then exporta := true;

          if exporta then
          begin
            StrCell := PegaLetraColuna(NumColuna) + IntToStr(NumLinha);

            if Fields[NumCampo - 1].DisplayLabel <> '' then
              Range[StrCell,StrCell].Value2 := Fields[NumCampo - 1].DisplayLabel
            else
              Range[StrCell,StrCell].Value2 := Fields[NumCampo - 1].FieldName;
            Range[StrCell,StrCell].Interior.Color := clGray;
            Range[StrCell,StrCell].Font.Color := clWhite;
            Range[StrCell,StrCell].Font.Bold := True;
            Range[StrCell,StrCell].Font.Name := 'Verdana';
            Range[StrCell,StrCell].Font.Size := 10;
            Range[StrCell,StrCell].VerticalAlignment := 2;
            Range[StrCell,StrCell].Borders.Weight := 2;
            Range[StrCell,StrCell].RowHeight := 34;
            Inc (NumColuna);
          end;
        end;
      end;

      NumLinha := 2;

      with Dataset do
      begin
        First;
        while not Eof do
        begin
          NumColuna := 1;
          for NumCampo := 1 to Fields.Count do
          begin
            exporta := false;
            for Campo := 0 to DBGrid1.Columns.Count - 1 do
              if Fields[NumCampo - 1].FieldName = DBGrid1.Columns.Items[Campo].FieldName then exporta := true;

            if exporta then
            begin
              StrCell := PegaLetraColuna(NumColuna) + IntToStr(NumLinha);
              Range[StrCell, StrCell].Value2 := Fields.Fields[NumCampo - 1].DisplayText;
              Range[StrCell,StrCell].Font.Bold := True;
              Range[StrCell,StrCell].Font.Name := 'Verdana';
              Range[StrCell,StrCell].Font.Size := 10;
              Range[StrCell,StrCell].VerticalAlignment := 2;
              Range[StrCell,StrCell].Borders.Weight := 2;
              Range[StrCell,StrCell].RowHeight := 24;
              Inc (NumColuna);
            end;
          end;
          Next;
          Inc(NumLinha);
        end;
      end;
      Range['A1', StrCell].EntireColumn.Autofit;
//      FileName := ArqNome;
//      ActiveWorkbook.SaveAs(FileName, xlNormal, '', '', False, False, xlNoChange,
//                            xlUserResolution, False, EmptyParam, EmptyParam, EmptyParam, LCID);
//      Quit;
    finally
      Disconnect;
    end;
  end;
end;

function TFExportarRMA.PegaLetraColuna(IntNumber : Integer) : String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 256 then
      Result:='IV'
    else
    begin
      if IntNumber > 26 then
      begin
        Result:=Chr(64 + (IntNumber div 26));
        Result:=Result+Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;

procedure TFExportarRMA.BitBtn1Click(Sender: TObject);
begin
//  if SaveDialog1.Execute then
    EXPEXCEL
     (DataSource1.DataSet);//, SaveDialog1.FileName);
end;

procedure TFExportarRMA.FormActivate(Sender: TObject);
begin
  DM.cdsImprRMA.Open;
end;

procedure TFExportarRMA.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.cdsImprRMA.Close;
  DM.cdsImprRMA.Filter := '';
  DM.cdsImprRMA.Filtered := False;
end;

procedure TFExportarRMA.cbReferenciaChange(Sender: TObject);
begin
  DM.cdsImprRMA.Filter := 'referencia = ' + QuotedStr(cbReferencia.Text);
  DM.cdsImprRMA.Filtered := True;
end;

procedure TFExportarRMA.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  With cbReferencia do
  begin
    Clear;
    for i := -5 to 20 do
    begin
      Add(FormatDateTime('mm/yyyy', IncMonth(date, i)));
      if i = 0 then
      begin
        ItemIndex := Items.Count-1;
        cbReferenciaChange(Sender);
      end;
    end;
  end;
end;

end.
