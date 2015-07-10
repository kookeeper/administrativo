unit UCadastrarFormRMA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls,
  Grids, ToolWin, ComCtrls, RzEdit;

type
  TFCadastrarFormRMA = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoEquip: TSpeedButton;
    sbEditarEquip: TSpeedButton;
    sbApagarEquip: TSpeedButton;
    sgEquip: TStringGrid;
    DataSource1: TDataSource;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dblcCliente: TDBLookupComboBox;
    dblnCliente: TDBLookupComboBox;
    Label17: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    TabSheet5: TTabSheet;
    ToolBar2: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    sgItens: TStringGrid;
    cbGarantia: TCheckBox;
    cbContrato: TCheckBox;
    Label12: TLabel;
    dblcCondPagto: TDBLookupComboBox;
    dbldCondPagto: TDBLookupComboBox;
    DataSource2: TDataSource;
    Label13: TLabel;
    dblVendedor: TDBLookupComboBox;
    DataSource3: TDataSource;
    edHrInicio: TRzEdit;
    edHrFim: TRzEdit;
    edTempoTotal: TRzEdit;
    edNrAssistencia: TRzNumericEdit;
    edDtAssistencia: TRzDateTimeEdit;
    edDtChamado: TRzDateTimeEdit;
    edDolar: TRzNumericEdit;
    edDespChamado: TRzNumericEdit;
    edDespHTecAd: TRzNumericEdit;
    edDespDesloc: TRzNumericEdit;
    edDespPecas: TRzNumericEdit;
    edDespTotal: TRzNumericEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure sbNovoEquipClick(Sender: TObject);
    procedure sbEditarEquipClick(Sender: TObject);
    procedure sbApagarEquipClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure dblcClienteClick(Sender: TObject);
    procedure dblnClienteClick(Sender: TObject);
    procedure dblcCondPagtoClick(Sender: TObject);
    procedure dbldCondPagtoClick(Sender: TObject);
    procedure edDespChamadoExit(Sender: TObject);
    procedure edHrInicioExit(Sender: TObject);
    procedure edDolarExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    cLista: array of String;
    xItens, xEquip: array of Integer;

    procedure TotalizaAssistencia ();
    procedure AtualizaItens ();
  end;

var
  FCadastrarFormRMA: TFCadastrarFormRMA;

implementation

uses UDM, UEditarRMAItens, UEditarRMAEquip,
  UBuscaClientes, RMA, UCadastrarListaComum, RMAEquipamento, RMAItem,
  Produto;

{$R *.DFM}

procedure TFCadastrarFormRMA.TotalizaAssistencia ();
var
  vlr_prod: Real;
  i: integer;
begin
  if edDolar.Text       = '' then edDolar.Text       := '1';
  if edDespChamado.Text = '' then edDespChamado.Text := '0';
  if edDespHTecAd.Text  = '' then edDespHTecAd.Text  := '0';
  if edDespDesloc.Text  = '' then edDespDesloc.Text  := '0';
  
  vlr_prod := 0;
  For i := 1 to sgItens.RowCount-1 do
  begin
    sgItens.Row := i;
    if sgItens.Cells[1, sgItens.Row] <> '' then
      vlr_prod := vlr_prod   + StrtoFloat (sgItens.Cells[7, sgItens.Row]);
  end;
  edDespPecas.Value := vlr_prod;
  edDespTotal.Value := vlr_prod + edDespChamado.Value +
                      edDespHTecAd.Value + edDespDesloc.Value;
  sgItens.Row      := 1;
end;

procedure TFCadastrarFormRMA.AtualizaItens ();
var
  VlrUnit, Qtde, VlrTot, Dolar: Real;
  i: integer;
begin
//  DM.cdsListaProdutos.Open;
  For i := 1 to sgItens.RowCount-1 do
  begin
    sgItens.Row := i;
    if sgItens.Cells[2, sgItens.Row] <> '0' then
    begin
//      DM.cdsListaProdutos.Locate('PRODUTO_SQ', sgItens.Cells[2, sgItens.Row], []);
      VlrUnit  := StrtoFloat (sgItens.Cells[6,  sgItens.Row]);
      Qtde     := StrtoFloat (sgItens.Cells[5,  sgItens.Row]);
      Dolar    := StrtoFloat (edDolar.Text);
      VlrTot   := Dolar * VlrUnit * Qtde;

      sgItens.Cells[7,  sgItens.Row] := FloatToStrF (VlrTot  , ffFixed, 10, 2);
    end;
  end;
//  DM.cdsListaProdutos.Close;
  TotalizaAssistencia;
end;

procedure TFCadastrarFormRMA.FormCreate(Sender: TObject);
begin
  inherited;
  sgEquip.ColCount := 7;
  sgEquip.RowCount := 2;
  sgEquip.ColWidths[0]  := 10;
  sgEquip.RowHeights[0] := 20;

  sgEquip.ColWidths[1] := -1;
  sgEquip.Cells [1, 0] := 'vEquip';

  sgEquip.ColWidths[2] := -1;
  sgEquip.Cells [2, 0] := 'pEquip';

  sgEquip.ColWidths[3] := 140;
  sgEquip.Cells [3, 0] := 'Equipamento';

  sgEquip.ColWidths[4] := 200;
  sgEquip.Cells [4, 0] := 'Número de Série';

  sgEquip.ColWidths[5] := 200;
  sgEquip.Cells [5, 0] := 'Defeito';

  sgEquip.ColWidths[6] := 200;
  sgEquip.Cells [6, 0] := 'Servico';

  SetLength (xEquip, 0);

  sgItens.ColCount := 9;
  sgItens.RowCount := 2;
  sgItens.ColWidths[0]  := 10;
  sgItens.RowHeights[0] := 20;

  sgItens.ColWidths[1] := -1;
  sgItens.Cells [1, 0] := 'vItens';

  sgItens.ColWidths[2] := -1;
  sgItens.Cells [2, 0] := 'pItens';

  sgItens.ColWidths[3] := 140;
  sgItens.Cells [3, 0] := 'Equipamento';

  sgItens.ColWidths[4] := 140;
  sgItens.Cells [4, 0] := 'Peça';

  sgItens.ColWidths[5] := 70;
  sgItens.Cells [5, 0] := 'Quantidade';

  sgItens.ColWidths[6] := 70;
  sgItens.Cells [6, 0] := 'Preço Unitário';

  sgItens.ColWidths[7] := 70;
  sgItens.Cells [7, 0] := 'Preço Total';

  sgItens.ColWidths[8] := -1;
  sgItens.Cells [8, 0] := 'assistencia_equip_sq';

  SetLength (xItens, 0);

  DM.cdsListaClientes.Open;
  DM.cdsListaCondPagto.Open;
  DM.cdsListaVendedores.Open;

  edNrAssistencia.Text := '0';
  edDtAssistencia.Text := FormatDateTime ('dd/mm/yyyy',Date);
  edDtChamado.Text     := FormatDateTime ('dd/mm/yyyy',Date);
  edHrInicio.Text      := FormatDateTime ('hh:nn', Time);
end;

procedure TFCadastrarFormRMA.sbEditarItemClick(Sender: TObject);
var
  i: integer;
begin
  FEditarRMAItens := TFEditarRMAItens.Create(Self);
  DM.cdsListaProdutos.Open;

  with FEditarRMAItens do
  begin
    cbEquipamento.Items.Clear;
    for i := 1 to sgEquip.RowCount-1 do
      cbEquipamento.Items.Add(sgEquip.Cells[3, i]);
  end;

  if Sender <> sbNovoItem then
  with FEditarRMAItens do
  begin
    cbEquipamento.ItemIndex := StrtoInt(sgitens.Cells [8, sgItens.Row]);
    edQtde.Text             := sgItens.Cells [5, sgItens.Row];
    edPreco.Text            := sgItens.Cells [6, sgItens.Row];
    edVlrTotal.Text         := sgItens.Cells [7, sgItens.Row];
    DBLookupComboBox1.KeyValue := sgItens.Cells [2, sgItens.Row];
    DBLookupComboBox2.KeyValue := sgItens.Cells [2, sgItens.Row];
  end;

  if FEditarRMAItens.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
    begin
      if (sgItens.RowCount <> 2) or (sgItens.Cells [2, sgItens.Row] <> '') then
        sgItens.RowCount := sgItens.RowCount + 1;
      sgItens.Row := sgItens.RowCount - 1;
      sgItens.Cells[1, sgItens.Row] := '0';
    end;
    sgItens.Cells[2, sgItens.Row] := DM.cdsListaProdutos.FieldByName('PRODUTO_SQ').AsString;
    sgitens.Cells[3, sgItens.Row] := FEditarRMAItens.cbEquipamento.Text;
    sgItens.Cells[4, sgItens.Row] := DM.cdsListaProdutos.FieldByName('DESCRICAO_PRODUTO').AsString;
    sgItens.Cells[5, sgItens.Row] := FEditarRMAItens.edQtde.Text;
    sgItens.Cells[6, sgItens.Row] := FEditarRMAItens.edPreco.Text;
    sgItens.Cells[7, sgItens.Row] := FEditarRMAItens.edVlrTotal.Text;
    sgItens.Cells[8, sgItens.Row] := InttoStr(FEditarRMAItens.cbEquipamento.ItemIndex);
  end;
  AtualizaItens;
  inherited;
  FEditarRMAItens.Free;
end;

procedure TFCadastrarFormRMA.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormRMA.sbApagarItemClick(Sender: TObject);
var
  i1: Integer;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    SetLength (xItens, High (xItens)+2);
    xItens[High(xItens)] := StrtoInt(sgItens.Cells[1, sgItens.Row]);
    While (sgItens.Row+1) < sgItens.RowCount do
    begin
      For i1 := 1 to sgItens.ColCount do
        sgItens.Cells [i1, sgItens.Row] := sgItens.Cells [i1, sgItens.Row+1];
      sgItens.Row := sgItens.Row + 1;
    end;
    if sgItens.RowCount > 2 then
      sgItens.RowCount := sgItens.RowCount - 1
    else begin
      For i1 := 0 to sgItens.ColCount do
        sgItens.Cells [i1, 1] := '';
    end;
    TotalizaAssistencia;
  end;
end;

procedure TFCadastrarFormRMA.sbNovoEquipClick(Sender: TObject);
begin
  sbEditarEquip.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormRMA.sbEditarEquipClick(Sender: TObject);
begin
  FEditarRMAEquip := TFEditarRMAEquip.Create(Self);
  DM.cdsListaProdutos.Open;
  if Sender <> sbNovoItem then
  begin
    FEditarRMAEquip.mmSerie.Lines.Text         := sgEquip.Cells [4, sgEquip.Row];
    FEditarRMAEquip.mmDefeito.Lines.Text       := sgEquip.Cells [5, sgEquip.Row];
    FEditarRMAEquip.mmServicos.Lines.Text      := sgEquip.Cells [6, sgEquip.Row];
    FEditarRMAEquip.DBLookupComboBox1.KeyValue := sgEquip.Cells [2, sgEquip.Row];
    FEditarRMAEquip.DBLookupComboBox2.KeyValue := sgEquip.Cells [2, sgEquip.Row];
  end;
  if FEditarRMAEquip.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
    begin
      if (sgEquip.RowCount <> 2) or (sgEquip.Cells [2, sgEquip.Row] <> '') then
        sgEquip.RowCount := sgEquip.RowCount + 1;
      sgEquip.Row := sgEquip.RowCount - 1;
      sgEquip.Cells[1, sgEquip.Row] := '0';
      sgEquip.Cells[2, sgEquip.Row] := '0';
    end;
    sgEquip.Cells[2, sgEquip.Row] := DM.cdsListaProdutos.FieldByName('PRODUTO_SQ').AsString;
    sgEquip.Cells[3, sgEquip.Row] := DM.cdsListaProdutos.FieldByName('DESCRICAO_PRODUTO').AsString;
    sgEquip.Cells[4, sgEquip.Row] := FEditarRMAEquip.mmSerie.Lines.Text;
    sgEquip.Cells[5, sgEquip.Row] := FEditarRMAEquip.mmDefeito.Lines.Text;
    sgEquip.Cells[6, sgEquip.Row] := FEditarRMAEquip.mmServicos.Lines.Text;
  end;
  inherited;
  FEditarRMAEquip.Free;
end;

procedure TFCadastrarFormRMA.sbApagarEquipClick(Sender: TObject);
var
  i, i1: Integer;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    SetLength (xEquip, High (xEquip)+2);
    xEquip[High(xEquip)] := StrtoInt (sgEquip.Cells[1,  sgEquip.Row]);

// apaga as peças do equipamento
    for i1 := 1 to sgItens.RowCount-1 do
      if StrtoInt(sgItens.Cells[8, i1])+1 = sgEquip.Row then
        for i := 0 to sgItens.ColCount do
          sgItens.Cells [i, i1] := '';
          
// organiza as peças que sobraram
    sgItens.Row := 1;
    While (sgItens.Row+1 < sgItens.RowCount) do
    begin
      if sgItens.Cells[1, sgItens.Row] = '' then
      begin
        for i := sgItens.Row+1 to sgItens.RowCount do
        if sgItens.Cells[1, i] <> '' then
        begin
          for i1 := 0 to sgItens.ColCount do
          begin
            sgItens.Cells[i1, sgItens.Row] := sgItens.Cells[i1, i];
            if (sgItens.Cells[8, sgItens.Row] <> '') and (StrtoInt(sgItens.Cells[8, sgItens.Row])+1 > sgEquip.Row) then
              sgItens.Cells[8, sgItens.Row] := InttoStr(StrtoInt(sgItens.Cells[8, sgItens.Row])-1);
            sgItens.Cells[i1, i] := '';
          end;
          break;
        end;
      end;
      sgItens.Row := sgItens.Row + 1;
    end;

// tira as linhas em branco que sobraram
    sgItens.Row := sgItens.RowCount-1;
    While (sgItens.Cells[1, sgItens.Row] = '') and (sgItens.RowCount > 2) do
      sgItens.RowCount := sgItens.RowCount - 1;

    While (sgEquip.Row+1) < sgEquip.RowCount do
    begin
      For i1 := 1 to sgEquip.ColCount do
        sgEquip.Cells [i1, sgEquip.Row] := sgEquip.Cells [i1, sgEquip.Row+1];
      sgEquip.Row := sgEquip.Row + 1;
    end;
    if sgEquip.RowCount > 2 then
      sgEquip.RowCount := sgEquip.RowCount - 1
    else begin
      For i1 := 0 to sgEquip.ColCount do
        sgEquip.Cells [i1, 1] := '';
    end;
  end;
end;

procedure TFCadastrarFormRMA.Label5Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFBuscaClientes, FBuscaClientes);
  DM.cdsBuscaClientes.Open;
  if FBuscaClientes.ShowModal = mrOk then
  begin
    dblcCliente.KeyValue := DM.cdsBuscaClientes.FieldByName('CLIENTE_SQ').Value;
    dblnCliente.KeyValue := DM.cdsBuscaClientes.FieldByName('CLIENTE_SQ').Value;
    DM.cdsBuscaClientes.Close;
  end;
  FBuscaClientes.Free;
end;

procedure TFCadastrarFormRMA.bbOkClick(Sender: TObject);
var
  equip: TRMAEquipamento;
  item: TRMAItem;
  i: Integer;
begin
  inherited;
  TotalizaAssistencia;

  With ((Owner as TFCadastrarListaComum).registro as TRMA) do
  begin
    numero_assistencia := edNrAssistencia.IntValue;
    data_chamado       := edDtChamado.Date;
    data_assistencia   := edDtAssistencia.Date;
    cotacao_dolar      := edDolar.Value;
    cliente_sq         := dblcCliente.KeyValue;
    cond_pagto_sq      := dblcCondPagto.KeyValue;
    desp_chamado       := edDespChamado.Value;
    desp_htec_ad       := edDespHTecAd.Value;
    desp_desloc        := edDespDesloc.Value;
    vlr_pecas          := edDespPecas.Value;
    vlr_total          := edDespTotal.Value;
    hora_inicio        := StrToDateTime(edHrInicio.Text);
    hora_fim           := StrToDateTime(edHrFim.Text);
    garantia           := cbGarantia.Checked;
    contrato           := cbContrato.Checked;
    vendedor_sq        := dblVendedor.KeyValue;
    Equipamentos.Clear;
    Itens.Clear;

    for i := 0 to sgEquip.RowCount - 2 do
    begin
      equip := TRMAEquipamento.Create;
      equip.vIndice         := StrToInt(sgEquip.Cells[1, i+1]);
      equip.assistencia_sq  := assistencia_sq;
      equip.produto.vIndice := StrToInt(sgEquip.Cells[2, i+1]);
      equip.nr_serie_equip  := sgEquip.Cells[4, i+1];
      equip.defeito         := sgEquip.Cells[5, i+1];
      equip.servicos        := sgEquip.Cells[6, i+1];
      Equipamentos.Add(equip);
    end;

    for i := 0 to sgItens.RowCount - 2 do
    begin
      item := TRMAItem.Create;
      item.vIndice               := StrToInt(sgItens.Cells[1, i+1]);
      item.produto.vIndice       := StrToInt(sgItens.Cells[2, i+1]);
      item.qtde_assistencia_item := StrToInt(sgItens.Cells[5, i+1]);
      item.preco_unit            := StrToFloat(sgItens.Cells[6, i+1]);
      item.assistencia_equip.vIndice := StrToInt(sgEquip.Cells[1, StrToInt(sgItens.Cells[8, i+1])+1]);
      Itens.Add(item);
    end;

    if not salvar then
      ModalResult := mrNone;
  end;

end;

procedure TFCadastrarFormRMA.dblcClienteClick(
  Sender: TObject);
begin
  inherited;
  dblnCliente.KeyValue := dblcCliente.KeyValue;
end;

procedure TFCadastrarFormRMA.dblnClienteClick(
  Sender: TObject);
begin
  inherited;
  dblcCliente.KeyValue := dblnCliente.KeyValue;
end;

procedure TFCadastrarFormRMA.dblcCondPagtoClick(
  Sender: TObject);
begin
  inherited;
  dbldCondPagto.KeyValue := dblcCondPagto.KeyValue;
end;

procedure TFCadastrarFormRMA.dbldCondPagtoClick(
  Sender: TObject);
begin
  inherited;
  dblcCondPagto.KeyValue := dbldCondPagto.KeyValue;
end;

procedure TFCadastrarFormRMA.edDespChamadoExit(Sender: TObject);
begin
  inherited;
  TotalizaAssistencia;
end;

procedure TFCadastrarFormRMA.edHrInicioExit(Sender: TObject);
begin
  inherited;
  if edHrInicio.Text = '' then edHrInicio.Text := '0';
  if edHrFim.Text    = '' then edHrFim.Text    := '0';
  try edTempoTotal.Text := TimeToStr(StrToTime(edHrFim.Text)-StrToTime(edHrInicio.Text));
  except
    edTempoTotal.Text := '00:00';
  end;
end;

procedure TFCadastrarFormRMA.edDolarExit(Sender: TObject);
begin
  inherited;
  AtualizaItens;
end;

procedure TFCadastrarFormRMA.FormDestroy(Sender: TObject);
begin
  inherited;
  DM.cdsListaClientes.Close;
  DM.cdsListaCondPagto.Close;
  DM.cdsListaVendedores.Close;
end;

end.
