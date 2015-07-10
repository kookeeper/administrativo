unit UCadastrarFormConteiner;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  ToolWin, Grids, Mask, RzEdit;

type
  TFCadastrarFormConteiner = class(TFCadastrarFormComum)
    Label1: TLabel;
    dtpRemessa: TDateTimePicker;
    dtpChegada: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    mmObservacao: TMemo;
    rgTipo: TRadioGroup;
    Panel2: TPanel;
    sgItens: TStringGrid;
    ToolBar2: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    Label2: TLabel;
    Label5: TLabel;
    cbProdutos: TCheckBox;
    cbPecas: TCheckBox;
    edConhecimento: TRzEdit;
    edInvoiceNumber: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure sgItensDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure sgItensDblClick(Sender: TObject);
    procedure cbProdutosClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    xItens: array of Integer;
    itens: array of array of String;

    procedure carregaGrid();
    { Public declarations }
  end;

var
  FCadastrarFormConteiner: TFCadastrarFormConteiner;

implementation

uses UDM, UEditarConteinerItens, Produto, DBClient, Cadastro,
  UCadastrarListaComum, Conteiner;

{$R *.dfm}

procedure TFCadastrarFormConteiner.carregaGrid();
var
  row, i1: integer;
  cadastrado: Boolean;
  item_conteiner_sq, quantidadeCadastrada: String;
  cds: TClientDataSet;
begin
  cds := TProduto.listaRegistros('order by descricao_produto');

  row := 1;
  sgItens.RowCount := 2;
  for i1 := 0 to sgItens.ColCount-1 do
    sgItens.Cells[i1,1] := '';
    
  While not cds.Eof do
  begin
    cadastrado := false;
    quantidadeCadastrada := '';
    item_conteiner_sq := '';
    for i1 := 0 to High (itens) do
      if itens[i1, 1] = cds.FieldByName('PRODUTO_SQ').AsString then
      begin
        cadastrado := true;
        item_conteiner_sq    := itens[i1, 0];
        quantidadeCadastrada := itens[i1, 2];
      end;

    if ((cds.FieldByName('TIPO_PRODUTO').AsInteger = 1) and (cbProdutos.Checked)) or
       ((cds.FieldByName('TIPO_PRODUTO').AsInteger = 2) and (cbPecas.Checked)) or
       (cadastrado) then
    begin
      inc (row);
      sgItens.RowCount := row;
      sgItens.Cells[0, row-1] := cds.FieldByName('DESCRICAO_PRODUTO').AsString;
      sgItens.Cells[1, row-1] := item_conteiner_sq;
      sgItens.Cells[2, row-1] := cds.FieldByName('PRODUTO_SQ').AsString;
      sgItens.Cells[3, row-1] := quantidadeCadastrada;
    end;
    cds.Next;
  end;
end;

procedure TFCadastrarFormConteiner.FormCreate(Sender: TObject);
var
  row: Integer;
  cds: TClientDataSet;
begin
  inherited;
  sgItens.ColCount  := 4;
  sgItens.RowCount  := 2;
  sgItens.FixedCols := 3;
  sgItens.ColWidths[0]  := 10;
  sgItens.RowHeights[0] := 20;

  sgItens.ColWidths[0] := 200;
  sgItens.Cells [0, 0] := 'Peça';

  sgItens.ColWidths[1] := -1;
  sgItens.Cells [1, 0] := 'conteiner_item_sq';

  sgItens.ColWidths[2] := -1;
  sgItens.Cells [2, 0] := 'produto_sq';

  sgItens.ColWidths[3] := 70;
  sgItens.Cells [3, 0] := 'Quantidade';

  sbNovoItem.Visible   := False;
  sbEditarItem.Visible := False;
  sbApagarItem.Visible := False;

  //carrega os produtos na tela.
  cds := TProduto.listaRegistros(' order by tipo_produto, descricao_produto');

  row := 1;
  While not cds.Eof do
  begin
    inc (row);
    sgItens.RowCount := row;
    sgItens.Cells[0, row-1] := cds.FieldByName('DESCRICAO_PRODUTO').AsString;
    sgItens.Cells[2, row-1] := cds.FieldByName('PRODUTO_SQ').AsString;
    cds.Next;
  end;

  with Owner as TFCadastrarListaComum do
  if not novo then
  with registro as TConteiner do
  begin
    edInvoiceNumber.Text := invoice_number;
    dtpRemessa.Date      := data_remessa;
    dtpChegada.Date      := data_chegada;
    rgTipo.ItemIndex     := StrToInt(tipo_envio);
    edConhecimento.Text  := conhecimento;
    mmObservacao.Lines.Text := observacao;

    With (TConteinerItem.listaRegistros('where conteiner_sq = ' + vIndice)) do
    begin
      for row := 1 to sgItens.RowCount - 1 do
      if Locate ('produto_sq', sgItens.Cells[2, row], []) then
      begin
        sgItens.Cells[1, row] := FieldByName('conteiner_item_sq').AsString;
        sgItens.Cells[3, row] := FieldByName('quantidade').AsString;
      end;
      Close;
    end;
  end
  else
  begin
    dtpRemessa.DateTime := Date;
  end;
end;

procedure TFCadastrarFormConteiner.sgItensDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;
  if ARow = 0 then
  begin
    sgItens.Canvas.Font.Style := [fsBold];
    sgItens.Canvas.FillRect(Rect);
    sgItens.Canvas.TextOut(Rect.Left+2,Rect.Top+2, sgItens.Cells[ACol, ARow]);
  end;

end;

procedure TFCadastrarFormConteiner.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormConteiner.sbEditarItemClick(Sender: TObject);
begin
  FEditarConteinerItens := TFEditarConteinerItens.Create(Self);
  if Sender <> sbNovoItem then
  begin
    FEditarConteinerItens.edQtde.Text                := sgItens.Cells [3, sgItens.Row];
    FEditarConteinerItens.DBLookupComboBox1.KeyValue := sgItens.Cells [2, sgItens.Row];
    FEditarConteinerItens.DBLookupComboBox2.KeyValue := sgItens.Cells [2, sgItens.Row];
  end;
  if FEditarConteinerItens.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
    begin
      if (sgItens.RowCount <> 2) or (sgItens.Cells[1,1] <> '') then
        sgItens.RowCount := sgItens.RowCount + 1;
      sgItens.Row := sgItens.RowCount - 1;
      sgItens.Cells[1,  sgItens.Row] := '0';
    end;
    sgItens.Cells[0,  sgItens.Row] := FEditarConteinerItens.dsListaProdutos.DataSet.FieldByName('DESCRICAO_PRODUTO').AsString;
    sgItens.Cells[2,  sgItens.Row] := FEditarConteinerItens.dsListaProdutos.DataSet.FieldByName('PRODUTO_SQ').AsString;
    sgItens.Cells[3,  sgItens.Row] := FEditarConteinerItens.edQtde.Text;
  end;
  inherited;
  FEditarConteinerItens.Free;
end;

procedure TFCadastrarFormConteiner.sbApagarItemClick(Sender: TObject);
var
  i1: Integer;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    SetLength (xItens, High (xItens)+2);
    xItens[High(xItens)] := StrtoInt (sgItens.Cells[1, sgItens.Row]);
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

procedure TFCadastrarFormConteiner.sgItensDblClick(Sender: TObject);
begin
  inherited;
  if sbEditarItem.Visible then
    sbEditarItem.Click;
end;

procedure TFCadastrarFormConteiner.cbProdutosClick(Sender: TObject);
var
  row, i1: integer;
begin
  sgItens.Visible := False;
  i1 := 1;
  for row := 1 to sgItens.RowCount-1 do
  begin
    sgItens.Row := row;
    if sgItens.Cells[3, sgItens.Row] <> '' then
    begin
      SetLength (itens, i1);
      SetLength (itens[i1-1], 3);
      itens[i1-1, 0] := sgItens.Cells[1, sgItens.Row];
      itens[i1-1, 1] := sgItens.Cells[2, sgItens.Row];
      itens[i1-1, 2] := sgItens.Cells[3, sgItens.Row];
      inc (i1);
    end;
  end;
  carregaGrid();
  sgItens.Visible := True;
end;

procedure TFCadastrarFormConteiner.bbOkClick(Sender: TObject);
var
  apoio, i: Integer;
//  cds: TClientDataSet;
begin
  inherited;

  with Owner as TFCadastrarListaComum do
  with registro as TConteiner do
  begin
    invoice_number := edInvoiceNumber.Text;
    data_remessa   := dtpRemessa.Date;
    data_chegada   := dtpChegada.Date;
    tipo_envio     := InttoStr(rgTipo.ItemIndex);
    conhecimento   := edConhecimento.Text;
    observacao     := mmObservacao.Lines.Text;
    salvar;
  end;

//  cds := TConteinerItem.listaRegistros(' where conteiner_sq = ' + VarToStr((Owner as TFCadastrarListaComum).registro.vIndice));

  for i := 0 to (sgItens.RowCount-2) do
  begin
    if sgItens.Cells [1, i+1] = '' then apoio := 0
    else apoio := StrtoInt (sgItens.Cells [1, i+1]);
    if sgItens.Cells [3, i+1] <> '' then
    with TConteinerItem.Create(apoio) do
    begin
      conteiner_sq := TConteiner.Create((Owner as TFCadastrarListaComum).registro.vIndice);
      produto_sq   := TProduto.Create(sgItens.Cells [2, i+1]);
      quantidade   := StrToInt(sgItens.Cells [3, i+1]);
      salvar;
    end;
  end;

  for i := 0 to (sgItens.RowCount-2) do
  if (sgItens.Cells [3,  i+1] = '') and (sgItens.Cells [1,  i+1] <> '') then
    TConteinerItem.Create(sgItens.Cells [1, i+1]).excluirRegistro(false);

end;

end.
