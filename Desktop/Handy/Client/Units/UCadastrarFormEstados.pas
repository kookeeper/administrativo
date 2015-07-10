unit UCadastrarFormEstados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, RzEdit, Mask,
  DB, DBClient, Grids, DBGrids, RzDBGrid, ToolWin, ComCtrls, RzPanel;

type
  TFCadastrarFormEstados = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    edSigla: TRzEdit;
    edDescricao: TRzEdit;
    Label3: TLabel;
    Label4: TLabel;
    edAliqICMSIntra: TRzNumericEdit;
    edCodigoIBGE: TRzNumericEdit;
    RzGroupBox1: TRzGroupBox;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbCancelar: TSpeedButton;
    gridEstadoIva: TRzDBGrid;
    cdsEstadoIva: TClientDataSet;
    dsEstadoIva: TDataSource;
    cdsEstadoIvaestado_iva_sq: TIntegerField;
    cdsEstadoIvaestado_sq: TIntegerField;
    cdsEstadoIvanbm_sq: TIntegerField;
    cdsEstadoIvaaliq_iva: TFloatField;
    cdsEstadoIvacodigo_estado: TStringField;
    cdsEstadoIvacodigo_nbm: TStringField;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure cdsEstadoIvaAfterPost(DataSet: TDataSet);
    procedure cdsEstadoIvaAfterEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsEstadoIvacodigo_nbmValidate(Sender: TField);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormEstados: TFCadastrarFormEstados;

implementation

uses uCadastrarListaEstados, UDM, EstadoIva, ncm, Cadastro,
  UCadastrarListaComum, Estado;

{$R *.dfm}

procedure TFCadastrarFormEstados.sbNovoItemClick(Sender: TObject);
begin
  cdsEstadoIva.Append;
  gridEstadoIva.SetFocus;
end;

procedure TFCadastrarFormEstados.sbEditarItemClick(Sender: TObject);
begin
  if cdsEstadoIva.RecordCount > 0 then
  begin
    cdsEstadoIva.Edit;
    gridEstadoIva.SetFocus;
  end;
end;

procedure TFCadastrarFormEstados.sbSalvarClick(Sender: TObject);
begin
  cdsEstadoIva.Post;
end;

procedure TFCadastrarFormEstados.sbCancelarClick(Sender: TObject);
begin
  cdsEstadoIva.Cancel;
end;

procedure TFCadastrarFormEstados.cdsEstadoIvaAfterPost(DataSet: TDataSet);
begin
  sbSalvar.Enabled := False;
  sbCancelar.Enabled := False;
end;

procedure TFCadastrarFormEstados.cdsEstadoIvaAfterEdit(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then
  begin
    cdsEstadoIvaestado_iva_sq.AsInteger := 0;
    cdsEstadoIvaestado_sq.AsInteger := (Owner as TFCadastrarListaComum).registro.vIndice;
    cdsEstadoIvacodigo_estado.AsString := edSigla.Text;
  end;

  sbSalvar.Enabled := True;
  sbCancelar.Enabled := True;
end;

procedure TFCadastrarFormEstados.FormCreate(Sender: TObject);
var
  opcoes: TStrings;
  estadoIva: TEstadoIva;
  cds: TClientDataSet;
  _filtro: String;
begin
  inherited;
  with (Owner as TFCadastrarListaComum) do
  if not novo then
  with registro as TEstado do
  begin
    edSigla.Text          := codigo_estado;
    edSigla.ReadOnly      := True;
    edDescricao.Text      := descricao_estado;
    edAliqICMSIntra.Value := aliq_icms_intra;
    edCodigoIBGE.IntValue := codigo_ibge;
    _filtro := 'estado_sq = ' + VarToStr(vIndice);
  end;


  cdsEstadoIva.CreateDataSet;
  cdsEstadoIva.Filter := _filtro;
  cdsEstadoIva.Filtered := True;

  opcoes := gridEstadoIva.Columns.Items[1].PickList;
  cds := TNCM.listaRegistros('order by codigo_nbm');
  while not cds.Eof do
  begin
    opcoes.AddObject(cds.FieldByName('codigo_nbm').AsString, TObject(cds.FieldByName('nbm_sq').AsInteger));
    cds.Next;
  end;
  cds.Free;

  estadoIva := TEstadoIva.Create;
  With estadoIva.montaLista() do
  begin
    Filter := _filtro;
    Filtered := True;

    while not Eof do
    begin
      cdsEstadoIva.Append;
      cdsEstadoIvaestado_iva_sq.Value := FieldByName('estado_iva_sq').Value;
      cdsEstadoIvaestado_sq.Value     := FieldByName('estado_sq').Value;
      cdsEstadoIvanbm_sq.Value        := FieldByName('nbm_sq').Value;
      cdsEstadoIvaaliq_iva.Value      := FieldByName('aliq_iva').Value;
      cdsEstadoIvacodigo_estado.Value := FieldByName('codigo_estado').Value;
      cdsEstadoIvacodigo_nbm.Value    := FieldByName('codigo_nbm').Value;
      cdsEstadoIva.Post;
      Next;
    end;
  end;

end;

procedure TFCadastrarFormEstados.cdsEstadoIvacodigo_nbmValidate(
  Sender: TField);
var
  i: Integer;
begin
  i := gridEstadoIva.Columns.Items[1].PickList.IndexOf(Sender.AsString);

  if i < 0 then
    raise Exception.Create('Este código não está cadastrado.');

  cdsEstadoIvanbm_sq.Value := Integer(gridEstadoIva.Columns.Items[1].PickList.Objects[i]);
end;

procedure TFCadastrarFormEstados.bbOkClick(Sender: TObject);
var
  estadoIva: TEstadoIva;
begin
  inherited;
  with (Owner as TFCadastrarListaComum).registro as TEstado do
  begin
    codigo_estado := edSigla.Text;
    descricao_estado := edDescricao.Text;
    aliq_icms_intra := edAliqICMSIntra.Value;
    codigo_ibge := edCodigoIBGE.IntValue;
    salvar;
  end;

  cdsEstadoIva.First;
  while not cdsEstadoIva.Eof do
  begin
    estadoIva := TEstadoIva.Create(cdsEstadoIvaestado_iva_sq.Value);
    estadoIva.estado_sq := cdsEstadoIvaestado_sq.Value;
    estadoIva.nbm_sq    := TNCM.Create(cdsEstadoIvanbm_sq.Value);
    estadoIva.aliq_iva  := cdsEstadoIvaaliq_iva.Value;
    estadoIva.salvar;

    cdsEstadoIva.Next;
  end;
end;

end.
