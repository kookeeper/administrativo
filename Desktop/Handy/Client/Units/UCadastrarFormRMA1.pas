unit UCadastrarFormRMA1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls,
  Grids, ToolWin, ComCtrls, RzEdit, Assistencias;

type
  TFCadastrarFormRMA1 = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoEquip: TSpeedButton;
    sbEditarEquip: TSpeedButton;
    sbApagarEquip: TSpeedButton;
    sgEquip: TStringGrid;
    dsListaClientes: TDataSource;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    dblcCliente: TDBLookupComboBox;
    dblnCliente: TDBLookupComboBox;
    Label17: TLabel;
    TabSheet5: TTabSheet;
    ToolBar2: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    sgItens: TStringGrid;
    cbGarantia: TCheckBox;
    cbFrete: TCheckBox;
    Label13: TLabel;
    dblVendedor: TDBLookupComboBox;
    dsListaVendedores: TDataSource;
    edNrAssistencia: TRzNumericEdit;
    edDtAssistencia: TRzDateTimeEdit;
    edDtChamado: TRzDateTimeEdit;
    btnImportar: TBitBtn;
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
    procedure edDolarExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    procedure carregaAssistencia(const Value: TAssistencias);
  public
    cLista: array of String;
    xItens, xEquip: array of Integer;

    procedure AtualizaItens ();
    property assistencia: TAssistencias write carregaAssistencia;
  end;

var
  FCadastrarFormRMA1: TFCadastrarFormRMA1;

implementation

uses UDM, UEditarRMAItens, UEditarRMAEquip, UBuscaClientes,
  UCadastrarListaComum, AssistenciasEquipamento, AssistenciasItem, Produto,
  Vendedor, StrUtils, Cadastro, Cliente, uPesquisaNF, Nfiscal;

{$R *.DFM}

procedure TFCadastrarFormRMA1.AtualizaItens ();
var
  VlrUnit, Qtde, VlrTot: Real;
  i: integer;
begin
  For i := 1 to sgItens.RowCount-1 do
  begin
    sgItens.Row := i;
    if sgItens.Cells[2, sgItens.Row] <> '0' then
    begin
      VlrUnit  := StrtoFloat (sgItens.Cells[6,  sgItens.Row]);
      Qtde     := StrtoFloat (sgItens.Cells[5,  sgItens.Row]);
      VlrTot   := VlrUnit * Qtde;

      sgItens.Cells[7,  sgItens.Row] := FloatToStrF (VlrTot  , ffFixed, 10, 2);
    end;
  end;
end;

procedure TFCadastrarFormRMA1.FormCreate(Sender: TObject);
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

  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');

  edNrAssistencia.IntValue := 0;
  edDtAssistencia.Date := Date;
  edDtChamado.Date     := Date;
  dblcCliente.KeyValue := dsListaClientes.DataSet.FieldByName('cliente_sq').Value;
  dblnCliente.KeyValue := dsListaClientes.DataSet.FieldByName('cliente_sq').Value;
  dblVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName('vendedor_sq').Value;
end;

procedure TFCadastrarFormRMA1.sbEditarItemClick(Sender: TObject);
var
  i: integer;
begin
  FEditarRMAItens := TFEditarRMAItens.Create(Self);

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
    dblcProduto.KeyValue := sgItens.Cells [2, sgItens.Row];
    dbldProduto.KeyValue := sgItens.Cells [2, sgItens.Row];
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
    sgItens.Cells[2, sgItens.Row] := FEditarRMAItens.dsListaProdutos.DataSet.FieldByName('PRODUTO_SQ').AsString;
    sgitens.Cells[3, sgItens.Row] := FEditarRMAItens.cbEquipamento.Text;
    sgItens.Cells[4, sgItens.Row] := FEditarRMAItens.dsListaProdutos.DataSet.FieldByName('DESCRICAO_PRODUTO').AsString;
    sgItens.Cells[5, sgItens.Row] := FEditarRMAItens.edQtde.Text;
    sgItens.Cells[6, sgItens.Row] := '0';
    sgItens.Cells[7, sgItens.Row] := '0';
    sgItens.Cells[8, sgItens.Row] := InttoStr(FEditarRMAItens.cbEquipamento.ItemIndex);
  end;
  AtualizaItens;
  inherited;
  FEditarRMAItens.Free;
end;

procedure TFCadastrarFormRMA1.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormRMA1.sbApagarItemClick(Sender: TObject);
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
  end;
end;

procedure TFCadastrarFormRMA1.sbNovoEquipClick(Sender: TObject);
begin
  sbEditarEquip.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormRMA1.sbEditarEquipClick(Sender: TObject);
begin
  FEditarRMAEquip := TFEditarRMAEquip.Create(Self);
  if Sender <> sbNovoItem then
  begin
    FEditarRMAEquip.mmSerie.Lines.Text         := sgEquip.Cells [4, sgEquip.Row];
    FEditarRMAEquip.mmDefeito.Lines.Text       := sgEquip.Cells [5, sgEquip.Row];
    FEditarRMAEquip.mmServicos.Lines.Text      := sgEquip.Cells [6, sgEquip.Row];
    FEditarRMAEquip.dblcProduto.KeyValue := sgEquip.Cells [2, sgEquip.Row];
    FEditarRMAEquip.dbldProduto.KeyValue := sgEquip.Cells [2, sgEquip.Row];
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
    sgEquip.Cells[2, sgEquip.Row] := FEditarRMAEquip.dsListaProdutos.DataSet.FieldByName('PRODUTO_SQ').AsString;
    sgEquip.Cells[3, sgEquip.Row] := FEditarRMAEquip.dsListaProdutos.DataSet.FieldByName('DESCRICAO_PRODUTO').AsString;
    sgEquip.Cells[4, sgEquip.Row] := FEditarRMAEquip.mmSerie.Lines.Text;
    sgEquip.Cells[5, sgEquip.Row] := FEditarRMAEquip.mmDefeito.Lines.Text;
    sgEquip.Cells[6, sgEquip.Row] := FEditarRMAEquip.mmServicos.Lines.Text;
  end;
  inherited;
  FEditarRMAEquip.Free;
end;

procedure TFCadastrarFormRMA1.sbApagarEquipClick(Sender: TObject);
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

procedure TFCadastrarFormRMA1.Label5Click(Sender: TObject);
begin
  inherited;
  FBuscaClientes := FBuscaClientes.Create(Self);
  if FBuscaClientes.ShowModal = mrOk then
  begin
    dblcCliente.KeyValue := FBuscaClientes.dsBuscaClientes.DataSet.FieldByName('cliente_sq').Value;
    dblnCliente.KeyValue := FBuscaClientes.dsBuscaClientes.DataSet.FieldByName('cliente_sq').Value;
  end;
  FBuscaClientes.Free;
end;

procedure TFCadastrarFormRMA1.bbOkClick(Sender: TObject);
var
  equip: TAssistenciasEquipamento;
  item: TAssistenciasItem;
  i, j: Integer;
begin
  inherited;

  With ((Owner as TFCadastrarListaComum).registro as TAssistencias) do
  begin
    numero_assistencia := edNrAssistencia.IntValue;
    data_chamado       := edDtChamado.Date;
    data_assistencia   := edDtAssistencia.Date;
    cliente_sq         := dblcCliente.KeyValue;
    garantia           := IfThen(cbGarantia.Checked, 'S', 'N');
    vendedor_sq        := dblVendedor.KeyValue;
    frete              := IfThen(cbFrete.Checked, 'S', 'N');
    Equipamentos.Clear;

    for i := 0 to sgEquip.RowCount - 2 do
    if sgEquip.Cells[1, i+1] <> '' then
    begin
      equip := TAssistenciasEquipamento.Create(sgEquip.Cells[1, i+1]);
      equip.produto_sq      := TProduto.Create(sgEquip.Cells[2, i+1]);
      equip.nr_serie_equip  := sgEquip.Cells[4, i+1];
      equip.defeito         := sgEquip.Cells[5, i+1];
      equip.servicos        := sgEquip.Cells[6, i+1];
      equip.Itens.Clear;

      for j := 0 to sgItens.RowCount - 2 do
      if sgItens.Cells[8, j+1] = IntToStr(i) then
      begin
        item := TAssistenciasItem.Create(sgItens.Cells[1, j+1]);
        item.assistencia_equip_sq  := StrToInt(sgEquip.Cells[1, i+1]);
        item.produto_sq            := TProduto.Create(sgItens.Cells[2, j+1]);
        item.qtde_assistencia_item := StrToInt(sgItens.Cells[5, j+1]);
        item.preco_unit            := StrToFloat(sgItens.Cells[6, j+1]);
        equip.Itens.Add(item);
      end;

      Equipamentos.Add(equip);
    end;

    salvar;
  end;

end;

procedure TFCadastrarFormRMA1.dblcClienteClick(
  Sender: TObject);
begin
  inherited;
  dblnCliente.KeyValue := dblcCliente.KeyValue;
end;

procedure TFCadastrarFormRMA1.dblnClienteClick(
  Sender: TObject);
begin
  inherited;
  dblcCliente.KeyValue := dblnCliente.KeyValue;
end;

procedure TFCadastrarFormRMA1.edDolarExit(Sender: TObject);
begin
  inherited;
  AtualizaItens;
end;

procedure TFCadastrarFormRMA1.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaClientes.DataSet.Close;
end;

procedure TFCadastrarFormRMA1.btnImportarClick(Sender: TObject);
var
  i: Integer;
begin
  try
    FPesquisaNF := TFPesquisaNF.Create(Self);
    if FPesquisaNF.ShowModal = mrOk then
    begin
      with TNfiscal.listaRegistros('where numero_nfe = ' + FPesquisaNF.edNf.Text) do
      begin
        if RecordCount = 0 then
          ShowMessage('Nota fiscal eletrônica não encontrada.')
        else With (TNfiscal.Create(FieldByName('nfiscal_sq').Value)) do
        begin
          edDtAssistencia.Date := dtemissao_nfiscal;
          dblcCliente.KeyValue := cliente_sq.vIndice;
          dblnCliente.KeyValue := cliente_sq.vIndice;
          for i := 0 to listaItem.Count - 1 do
          begin
            if (sgEquip.RowCount <> 2) or (sgEquip.Cells [2, sgEquip.Row] <> '') then
              sgEquip.RowCount := sgEquip.RowCount + 1;
            sgEquip.Row := sgEquip.RowCount - 1;
            sgEquip.Cells[1, sgEquip.Row] := '0';
            sgEquip.Cells[2, sgEquip.Row] := '0';
            sgEquip.Cells[2, sgEquip.Row] := TNfiscalItem(listaItem.Items[i]).produto_sq.vIndice;
            sgEquip.Cells[3, sgEquip.Row] := TNfiscalItem(listaItem.Items[i]).produto_sq.descricao_produto;
            sgEquip.Cells[4, sgEquip.Row] := TNfiscalItem(listaItem.Items[i]).nr_serie_item;
            sgEquip.Cells[5, sgEquip.Row] := '';
            sgEquip.Cells[6, sgEquip.Row] := '';
          end;
        end;
      end;
    end;
  finally
    FreeAndNil(FPesquisaNF);
  end;
end;

procedure TFCadastrarFormRMA1.carregaAssistencia(
  const value: TAssistencias);
var
  i, i2, row: integer;
  equipamento: TAssistenciasEquipamento;
  item: TAssistenciasItem;
begin
  edNrAssistencia.IntValue := value.numero_assistencia;
  edDtAssistencia.Date     := value.data_assistencia;
  edDtChamado.Date         := value.data_chamado;
  cbGarantia.Checked    := value.garantia='S';
  dblcCliente.KeyValue := value.cliente_sq;
  dblnCliente.KeyValue := value.cliente_sq;
  dblVendedor.KeyValue := value.vendedor_sq;
  cbFrete.Checked := value.frete='S';

  for i := 0 to value.Equipamentos.Count - 1 do
  begin
    equipamento := TAssistenciasEquipamento(value.Equipamentos.Items[i]);
    row := i + 1;
    sgEquip.RowCount := row + 1;
    sgEquip.Cells [1, row] := IntToStr(equipamento.vIndice);
    sgEquip.Cells [2, row] := IntToStr(equipamento.produto_sq.vIndice);
    sgEquip.Cells [3, row] := equipamento.produto_sq.descricao_produto;
    sgEquip.Cells [4, row] := equipamento.nr_serie_equip;
    sgEquip.Cells [5, row] := equipamento.defeito;
    sgEquip.Cells [6, row] := equipamento.servicos;

    for i2 := 0 to equipamento.Itens.Count - 1 do
    begin
      item := TAssistenciasItem(equipamento.Itens.Items[i2]);

      if (sgItens.RowCount <> 2) or (sgItens.Cells [2, sgItens.Row] <> '') then
        sgItens.RowCount := sgItens.RowCount + 1;
      row := sgItens.RowCount - 1;

      sgItens.Cells [1, row] := IntToStr(item.vIndice);
      sgItens.Cells [2, row] := IntToStr(item.produto_sq.vIndice);
      sgItens.Cells [4, row] := item.produto_sq.descricao_produto;
      sgItens.Cells [5, row] := IntToStr(item.qtde_assistencia_item);
      sgItens.Cells [6, row] := FloatToStr(item.preco_unit);
      sgItens.Cells [7, row] := FloattoStr(item.qtde_assistencia_item * item.preco_unit);
      sgItens.Cells [3, row] := equipamento.produto_sq.descricao_produto;
      sgItens.Cells [8, row] := IntToStr(i); // itemindex
    end;
  end;
end;

end.
