unit UCadastrarFormDuplicatas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DB, Mask,
  DBCtrls, RzEdit, Grids, DBGrids, RzDBGrid, ToolWin, ComCtrls, RzPanel,
  DBClient;

type
  TFCadastrarFormDuplicatas = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    cdsPgto: TClientDataSet;
    dsPgto: TDataSource;
    cdsPgtoduplicata_pgto_sq: TIntegerField;
    cdsPgtoduplicata_sq: TIntegerField;
    RzGroupBox1: TRzGroupBox;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    gridPgto: TRzDBGrid;
    sbCancelar: TSpeedButton;
    sbSalvar: TSpeedButton;
    cdsPgtovalor_pgto: TBCDField;
    cdsPgtodt_pgto: TDateTimeField;
    edValor: TRzNumericEdit;
    edDtEmissao: TRzDateTimeEdit;
    edDtVencto: TRzDateTimeEdit;
    edNumero: TRzNumericEdit;
    edItem: TRzNumericEdit;
    edNfiscal: TRzNumericEdit;
    cdsPgtoforma_pgto: TStringField;
    cdsPgtoobservacao: TStringField;
    Label3: TLabel;
    edJuros: TRzNumericEdit;
    Label8: TLabel;
    edDesconto: TRzNumericEdit;
    procedure bbOkClick(Sender: TObject);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cdsPgtoAfterEdit(DataSet: TDataSet);
    procedure cdsPgtoAfterPost(DataSet: TDataSet);
    procedure sbSalvarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure edNfiscalChange(Sender: TObject);
  private
    function valorReceber: Double;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormDuplicatas: TFCadastrarFormDuplicatas;

implementation

uses UDM, UCadastrarListaDuplicatas, UCadastrarListaComum, Duplicata,
  Cadastro, Nfiscal;

{$R *.dfm}

procedure TFCadastrarFormDuplicatas.bbOkClick(Sender: TObject);
var
  valor : Currency;
  cds: TClientDataSet;
begin
  inherited;
  ModalResult := mrNone;
  valor := 0;
  cdsPgto.First;
  While not cdsPgto.Eof do
  begin
    valor := valor + cdsPgtovalor_pgto.AsCurrency;
    cdsPgto.Next;
  end;

  if valor > (edValor.Value+edJuros.Value-edDesconto.Value) then
    raise Exception.Create('A soma dos pagamentos não pode ser maior que o valor da duplicata!');

  if edNfiscal.Tag = 0 then
  begin
    With TNfiscal.CreateFiltro('numero_nfiscal = ' + edNfiscal.Text) do
    begin
      if numero_nfiscal = 0 then
        raise Exception.Create('Nota Fiscal Inválida!');
      edNfiscal.Tag := vIndice;
    end;
  end;

  with Owner as TFCadastrarListaComum do
  with registro as TDuplicata do
  begin
    numero_duplicata    := edNumero.IntValue;
    item_duplicata      := edItem.IntValue;
    nfiscal_sq          := edNfiscal.Tag;
    valor_duplicata     := edValor.Value;
    dtemissao_duplicata := edDtEmissao.Date;
    dtvencto_duplicata  := edDtVencto.Date;
    juros_duplicata     := edJuros.Value;
    desconto_duplicata  := edDesconto.Value;
    salvar;
  end;

  // esta linha deve estar antes de gravar os registro no banco de dados.
  cds := TDuplicataPgto.listaRegistros(' where duplicata_sq = ' + VarToStr((Owner as TFCadastrarListaComum).registro.vIndice));

  cdsPgto.First;
  while not cdsPgto.Eof do
  begin
    with TDuplicataPgto.Create(cdsPgtoduplicata_pgto_sq.Value) do
    begin
      duplicata_sq := TDuplicata.Create(cdsPgtoduplicata_sq.Value);
      dt_pgto      := cdsPgtodt_pgto.AsDateTime;
      valor_pgto   := cdsPgtovalor_pgto.AsCurrency;
      forma_pgto   := cdsPgtoforma_pgto.AsString;
      observacao   := cdsPgtoobservacao.AsString;
      salvar;
    end;
    cdsPgto.Next;
  end;

  while not cds.Eof do
  begin
    if not cdsPgto.Locate('duplicata_pgto_sq', cds.FieldByName('duplicata_pgto_sq').Value, []) then
      TDuplicataPgto.Create(cds.FieldByName('duplicata_pgto_sq').Value).excluirRegistro(false);
    cds.Next;
  end;

  ModalResult := mrOk;
end;

procedure TFCadastrarFormDuplicatas.sbNovoItemClick(Sender: TObject);
var
  valor: Double;
begin
  inherited;
  valor := valorReceber;

  cdsPgto.Append;
  cdsPgtovalor_pgto.Value := valor;
  gridPgto.SetFocus;
end;

procedure TFCadastrarFormDuplicatas.sbApagarItemClick(Sender: TObject);
begin
  inherited;
  cdsPgto.Delete;
end;

procedure TFCadastrarFormDuplicatas.sbEditarItemClick(Sender: TObject);
begin
  inherited;
  if cdsPgto.RecordCount > 0 then
  begin
    cdsPgto.Edit;
    gridPgto.SetFocus;
  end;
end;

procedure TFCadastrarFormDuplicatas.FormCreate(Sender: TObject);
var
  cds: TClientDataSet;
begin
  inherited;
  cdsPgto.CreateDataSet;
  cdsPgto.Filter := 'duplicata_pgto_sq >= 0';
  cdsPgto.Filtered := True;

  cds := TDuplicataPgto.listaRegistros(' where duplicata_sq = ' + VarToStr((Owner as TFCadastrarListaComum).registro.vIndice));

  cdsPgto.CloneCursor(cds, False, False);
  FreeAndNil(cds);

  with Owner as TFCadastrarListaComum do
  if not novo then
  with registro as TDuplicata do
  begin
    edNumero.IntValue  := numero_duplicata;
    edItem.IntValue    := item_duplicata;
//    edNfiscal.IntValue := NUMERO_NFISCAL;
    edNfiscal.Tag      := nfiscal_sq;
    edValor.Value      := valor_duplicata;
    edJuros.Value      := juros_duplicata;
    edDesconto.Value   := desconto_duplicata;
    edDtEmissao.Date   := dtemissao_duplicata;
    edDtVencto.Date    := dtvencto_duplicata;
  end;
end;

procedure TFCadastrarFormDuplicatas.cdsPgtoAfterEdit(DataSet: TDataSet);
begin
  cdsPgtoduplicata_pgto_sq.AsInteger := 0;
  cdsPgtoduplicata_sq.AsInteger := (Owner as TFCadastrarListaComum).registro.vIndice;
  cdsPgtodt_pgto.Value := Date;

  sbSalvar.Enabled := True;
  sbCancelar.Enabled := True;
end;

procedure TFCadastrarFormDuplicatas.cdsPgtoAfterPost(DataSet: TDataSet);
begin
  sbSalvar.Enabled := False;
  sbCancelar.Enabled := False;
end;

procedure TFCadastrarFormDuplicatas.sbSalvarClick(Sender: TObject);
begin
  cdsPgto.Post;
end;

procedure TFCadastrarFormDuplicatas.sbCancelarClick(Sender: TObject);
begin
  cdsPgto.Cancel;
end;

procedure TFCadastrarFormDuplicatas.edNfiscalChange(Sender: TObject);
begin
  inherited;
  edNfiscal.Tag := 0;
end;

function TFCadastrarFormDuplicatas.valorReceber(): Double;
var
  valor: Double;
begin
  valor := edValor.Value + edJuros.Value - edDesconto.Value;
  dsPgto.Enabled := False;
  cdsPgto.First;
  while not cdsPgto.Eof do
  begin
    valor := valor - cdsPgtovalor_pgto.Value;
    cdsPgto.Next;
  end;
  cdsPgto.First;
  dsPgto.Enabled := True;
  result := valor;
end;

end.
