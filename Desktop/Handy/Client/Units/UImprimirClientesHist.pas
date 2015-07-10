unit UImprimirClientesHist;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, DB, ComCtrls, Mask,
  RzEdit;

type
  TFImprimirClientesHist = class(TForm)
    Panel1: TPanel;
    bbImprimir: TBitBtn;
    bbFechar: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label3: TLabel;
    lbItens: TLabel;
    lbValor: TLabel;
    Label6: TLabel;
    Timer1: TTimer;
    Label4: TLabel;
    dtpInicio: TDateTimePicker;
    dtpTermino: TDateTimePicker;
    Label5: TLabel;
    edCodigo: TRzEdit;
    edNome: TRzEdit;
    Button1: TButton;
    procedure edCodigoChange(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    todosClientes: Boolean;
    procedure beforeOpenItens(DataSet: TDataSet);
    procedure beforeOpenNotas(DataSet: TDataSet);
    { Private declarations }
  public
    procedure CalculaTotais ();
  end;

var
  FImprimirClientesHist: TFImprimirClientesHist;

implementation

uses UDM, UImprimirClientesHistRpt, DBClient;

{$R *.dfm}

procedure TFImprimirClientesHist.CalculaTotais ();
var
  Qtde: Integer;
  Valor: Real;
begin
  if not (DM.cdsImprHistClientes2.Active and DM.cdsImprHistClientes3.Active) then
    Exit;
    
  DataSource2.Enabled := False;
  DataSource3.Enabled := False;
  Qtde := 0;
  Valor := 0;
  While not DM.cdsImprHistClientes2.Eof do
  begin
    While not DM.cdsImprHistClientes3.Eof do
    begin
      Qtde := Qtde + DM.cdsImprHistClientes3.FieldByName('QTDE_ITEM').AsInteger;
      Valor := Valor + DM.cdsImprHistClientes3.FieldByName('VLR_TOTAL_ITEM').Value;
      DM.cdsImprHistClientes3.Next;
    end;
    DM.cdsImprHistClientes2.Next;
  end;
  lbItens.Caption := InttoStr (Qtde);
  lbValor.Caption := FloatToStrF (Valor, ffCurrency, 10, 2);
  if DM.cdsImprHistClientes2.RecordCount > 0 then
    DM.cdsImprHistClientes2.First;
  DataSource2.Enabled := True;
  DataSource3.Enabled := True;
end;

procedure TFImprimirClientesHist.edCodigoChange(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFImprimirClientesHist.bbImprimirClick(Sender: TObject);
var
  Codigo: String;
begin
  Codigo := DM.cdsImprHistClientes1.FieldByName('CODIGO_CLIENTE').AsString;
  DataSource1.Enabled := False;
  DataSource2.Enabled := False;
  DataSource3.Enabled := False;

  FImprimirClientesHistRpt := TFImprimirClientesHistRpt.Create(Self);
  FImprimirClientesHistRpt.Preview;
  FreeAndNil(FImprimirClientesHistRpt);

  DataSource1.Enabled := True;
  DataSource2.Enabled := True;
  DataSource3.Enabled := True;
end;

procedure TFImprimirClientesHist.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  DM.cdsImprHistClientes1.Close;
  DM.cdsImprHistClientes2.Close;
  DM.cdsImprHistClientes3.Close;

  DM.cdsImprHistClientes1.Params.ParamByName ('CODIGO_CLIENTE').Value := '%' + edCodigo.Text + '%';
  DM.cdsImprHistClientes1.Params.ParamByName ('NOME_CLIENTE').Value   := '%' + edNome.Text   + '%';
  DM.cdsImprHistClientes1.Open;

  DM.cdsImprHistClientes2.Params.ParamByName ('DT_INICIO').AsString  := FormatDateTime ('dd/mm/yyyy', dtpInicio.Date);
  DM.cdsImprHistClientes2.Params.ParamByName ('DT_TERMINO').AsString := FormatDateTime ('dd/mm/yyyy', dtpTermino.Date);
  DM.cdsImprHistClientes2.Open;

  CalculaTotais;
end;

procedure TFImprimirClientesHist.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DM.cdsImprHistClientes3.Close;
  DM.cdsImprHistClientes2.Close;
  DM.cdsImprHistClientes1.Close;
end;

procedure TFImprimirClientesHist.FormCreate(Sender: TObject);
begin
  DataSource1.DataSet.AfterScroll := beforeOpenNotas;
  DataSource2.DataSet.AfterScroll := beforeOpenItens;
  dtpInicio.Date := StrToDate(FormatDateTime('01/mm/yyyy', Date));
  dtpTermino.Date := Date;
end;

procedure TFImprimirClientesHist.beforeOpenNotas(DataSet: TDataSet);
var
  filtro: String;
begin
  if todosClientes then
  begin
    DataSource1.DataSet.AfterScroll := nil;
    DataSource1.Enabled := False;
    DataSource1.DataSet.First;
    While not DataSource1.DataSet.Eof do
    begin
      filtro := filtro + ' or cliente_sq=' + DataSource1.DataSet.FieldByName('cliente_sq').AsString;
      DataSource1.DataSet.Next;
    end;
    filtro := Copy(filtro, 4, length(filtro));

    DataSource1.DataSet.First;
    DataSource1.DataSet.AfterScroll := beforeOpenNotas;
    DataSource1.Enabled := True;
  end
  else
    filtro := 'cliente_sq=' + DataSource1.DataSet.FieldByName('cliente_sq').AsString;

  DataSource2.DataSet.Close;
  DataSource3.DataSet.Close;
//  (DataSource2.DataSet as TClientDataSet).Params.ParamByName('cliente_sq').AsInteger := DataSource1.DataSet.FieldByName('cliente_sq').AsInteger;
  DataSource2.DataSet.Filter := filtro;
  DataSource2.DataSet.Filtered := True;
  DataSource2.DataSet.Open;
  CalculaTotais;
end;

procedure TFImprimirClientesHist.beforeOpenItens(DataSet: TDataSet);
begin
  DataSource3.DataSet.Close;
  (DataSource3.DataSet as TClientDataSet).Params.ParamByName('nfiscal_sq').AsInteger := DataSource2.DataSet.FieldByName('nfiscal_sq').AsInteger;
  DataSource3.DataSet.Open;
end;

procedure TFImprimirClientesHist.Button1Click(Sender: TObject);
begin
  todosClientes := not todosClientes;
  Button1.Caption := 'Consultar cliente selecionado';
  if not todosClientes then
    Button1.Caption := 'Consultar todos os clientes';
  DBGrid1.Enabled := not todosClientes;
  DataSource1.DataSet.AfterScroll(DataSource1.DataSet);
end;

end.
