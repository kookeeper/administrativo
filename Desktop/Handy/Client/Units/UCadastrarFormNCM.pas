unit UCadastrarFormNCM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls,
  RzEdit, DBClient, Grids, DBGrids, RzDBGrid, ToolWin, ComCtrls, RzPanel;

type
  TFCadastrarFormNCM = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edCodigo: TRzEdit;
    Label4: TLabel;
    edICMS: TRzNumericEdit;
    edIPI: TRzNumericEdit;
    edIVA: TRzNumericEdit;
    RzGroupBox1: TRzGroupBox;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbCancelar: TSpeedButton;
    gridEstadoIva: TRzDBGrid;
    cdsEstadoIva: TClientDataSet;
    cdsEstadoIvaestado_iva_sq: TIntegerField;
    cdsEstadoIvaestado_sq: TIntegerField;
    cdsEstadoIvanbm_sq: TIntegerField;
    cdsEstadoIvaaliq_iva: TFloatField;
    cdsEstadoIvacodigo_estado: TStringField;
    cdsEstadoIvacodigo_nbm: TStringField;
    dsEstadoIva: TDataSource;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure cdsEstadoIvaAfterPost(DataSet: TDataSet);
    procedure cdsEstadoIvaAfterEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cdsEstadoIvacodigo_estadoValidate(Sender: TField);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormNCM: TFCadastrarFormNCM;

implementation

uses UDM, UCadastrarListaNCM, EstadoIva, VAriants, ncm, Cadastro, Estado;

{$R *.DFM}

procedure TFCadastrarFormNCM.sbNovoItemClick(Sender: TObject);
begin
  cdsEstadoIva.Append;
  gridEstadoIva.SetFocus;
end;

procedure TFCadastrarFormNCM.sbEditarItemClick(Sender: TObject);
begin
  if cdsEstadoIva.RecordCount > 0 then
  begin
    cdsEstadoIva.Edit;
    gridEstadoIva.SetFocus;
  end;
end;

procedure TFCadastrarFormNCM.sbSalvarClick(Sender: TObject);
begin
  cdsEstadoIva.Post;
end;

procedure TFCadastrarFormNCM.sbCancelarClick(Sender: TObject);
begin
  cdsEstadoIva.Cancel;
end;

procedure TFCadastrarFormNCM.cdsEstadoIvaAfterPost(DataSet: TDataSet);
begin
  sbSalvar.Enabled := False;
  sbCancelar.Enabled := False;
end;

procedure TFCadastrarFormNCM.cdsEstadoIvaAfterEdit(DataSet: TDataSet);
begin
  if DataSet.State in [dsInsert] then
  begin
    cdsEstadoIvaestado_iva_sq.AsInteger := 0;
    cdsEstadoIvanbm_sq.AsInteger := (FCadastrarListaNCM.registro as TNCM).vIndice;
    cdsEstadoIvacodigo_nbm.AsString := edCodigo.Text;
  end;

  sbSalvar.Enabled := True;
  sbCancelar.Enabled := True;
end;

procedure TFCadastrarFormNCM.FormCreate(Sender: TObject);
var
  opcoes: TStrings;
  estadoIva: TEstadoIva;
begin
  inherited;

  cdsEstadoIva.CreateDataSet;

  opcoes := gridEstadoIva.Columns.Items[1].PickList;
  With TEstado.listaRegistros() do
  begin
    while not Eof do
    begin
      opcoes.AddObject(FieldByName('codigo_estado').AsString, TObject(FieldByName('estado_sq').AsInteger));
      Next;
    end;
    Close;
  end;

  if not FCadastrarListaNCM.novo then
  begin
    edCodigo.Text  := (FCadastrarListaNCM.registro as TNCM).codigo_nbm;
    edICMS.Value   := (FCadastrarListaNCM.registro as TNCM).aliq_icms;
    edIPI.Value    := (FCadastrarListaNCM.registro as TNCM).aliq_ipi;
    edIVA.Value    := (FCadastrarListaNCM.registro as TNCM).aliq_iva;

    estadoIva := TEstadoIva.Create;
    With estadoIva.montaLista() do
    begin
      Filter := 'nbm_sq='+IntToStr((FCadastrarListaNCM.registro as TNCM).vIndice);
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
end;

procedure TFCadastrarFormNCM.cdsEstadoIvacodigo_estadoValidate(
  Sender: TField);
var
  i: Integer;
begin
  i := gridEstadoIva.Columns.Items[1].PickList.IndexOf(Sender.AsString);

  if i < 0 then
    raise Exception.Create('Este estado não está cadastrado.');

  cdsEstadoIvaestado_sq.Value := Integer(gridEstadoIva.Columns.Items[1].PickList.Objects[i]);
end;

procedure TFCadastrarFormNCM.bbOkClick(Sender: TObject);
var
  estadoIva: TEstadoIva;
begin
  inherited;
  (FCadastrarListaNCM.registro as TNCM).codigo_nbm := edCodigo.Text;
  (FCadastrarListaNCM.registro as TNCM).aliq_icms  := edICMS.Value;
  (FCadastrarListaNCM.registro as TNCM).aliq_ipi   := edIPI.Value;
  (FCadastrarListaNCM.registro as TNCM).aliq_iva   := edIVA.Value;
  FCadastrarListaNCM.registro.salvar;

  if FCadastrarListaNCM.Mensagem = '' then
  begin
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

  if FCadastrarListaNCM.Mensagem <> '' then
  begin
    Showmessage ('Erro ao gravar Registro: ' + FCadastrarListaNCM.Mensagem);
    DM.EnviarEmail (FCadastrarListaNCM.Tabela, 'GRAVAR', FCadastrarListaNCM.Mensagem, FCadastrarListaNCM.Novo);
  end;
end;

end.
