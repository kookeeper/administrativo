unit UCadastrarFormNfiscais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Db, DBCtrls, ToolWin,
  ComCtrls, Grids, DBGrids, Mask, Variants, DBClient;

type
  TFCadastrarFormNfiscais = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    tsItens: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    tsMensagem: TTabSheet;
    dsListaCondPagto: TDataSource;
    dsListaNaturezas: TDataSource;
    tsCabecalho: TTabSheet;
    Label1: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label2: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox5: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    tsRodape: TTabSheet;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label11: TLabel;
    Label14: TLabel;
    DBEdit8: TDBEdit;
    dsListaClientes: TDataSource;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    Label18: TLabel;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    dsListaTransp: TDataSource;
    GroupBox2: TGroupBox;
    DBLookupComboBox6: TDBLookupComboBox;
    Label17: TLabel;
    DBEdit13: TDBEdit;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label24: TLabel;
    DBEdit20: TDBEdit;
    Label25: TLabel;
    DBEdit21: TDBEdit;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    GroupBox4: TGroupBox;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    dsListaPedidos: TDataSource;
    Label51: TLabel;
    edPedido: TEdit;
    Label52: TLabel;
    ednfat1: TEdit;
    edvfat1: TEdit;
    eddfat1: TEdit;
    eddfat2: TEdit;
    ednfat2: TEdit;
    edvfat2: TEdit;
    eddfat3: TEdit;
    ednfat3: TEdit;
    edvfat3: TEdit;
    edNrNfiscal: TEdit;
    edDtEmissao: TEdit;
    edDtSaida: TEdit;
    edDemonstracao: TEdit;
    mmMensagem: TMemo;
    edBaseICMS: TEdit;
    edVlrIcms: TEdit;
    edBaseICMSStrib: TEdit;
    edVlrICMSStrib: TEdit;
    edVlrProd: TEdit;
    edVlrTotal: TEdit;
    edVlrIPI: TEdit;
    edVlrDespAcess: TEdit;
    edVlrSeguro: TEdit;
    edVlrFrete: TEdit;
    edPlacaTransp: TEdit;
    edQtdeTransp: TEdit;
    edEspecieTransp: TEdit;
    edPBrutoTransp: TEdit;
    edMarcaTransp: TEdit;
    edNumeroTransp: TEdit;
    edPLiquidoTransp: TEdit;
    rgFrete: TRadioGroup;
    DBEdit1: TDBEdit;
    cbEstadoTransp: TComboBox;
    edClassA: TEdit;
    edClassB: TEdit;
    edClassC: TEdit;
    edClassD: TEdit;
    edClassE: TEdit;
    edClassF: TEdit;
    edClassG: TEdit;
    StringGrid1: TStringGrid;
    Label53: TLabel;
    edDolar: TEdit;
    Label54: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    dsListaVendedores: TDataSource;
    bbAtualizar: TBitBtn;
    cdsListaPedidos: TClientDataSet;
    cdsListaPedidosItens: TClientDataSet;
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure edPedidoExit(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure DBLookupComboBox4Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure edVlrFreteExit(Sender: TObject);
    procedure edVlrSeguroExit(Sender: TObject);
    procedure edVlrDespAcessExit(Sender: TObject);
    procedure DBLookupComboBox5Click(Sender: TObject);
    procedure edDemonstracaoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edNrNfiscalExit(Sender: TObject);
    procedure bbAtualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    cLista, vIndice: array of String;
    xItens, cProduto: array of Integer;
    MensagemPedido, Numero1, Numero2, Numero3, Valor1, Valor2, Valor3, Data1,
      Data2, Data3, cIndice: String;
    Demonstracao, Manual: Boolean;

    procedure TotalizaNfiscal ();
    procedure TransferePedido (Pedido: Integer);
    { Public declarations }
  end;

var
  FCadastrarFormNfiscais: TFCadastrarFormNfiscais;

implementation

uses UDM, UEditarNFiscaisItens, UCadastrarListaNfiscais, UBuscaClientes,
  UCadastrarListaComum, UDMLista;

{$R *.DFM}

procedure TFCadastrarFormNfiscais.TotalizaNfiscal ();
var
  base_icms, vlr_icms, vlr_ipi, vlr_prod: Real;
  class_fiscal: string;
  i: integer;
begin
  base_icms := 0;
  vlr_icms := 0;
  vlr_ipi  := 0;
  vlr_prod := 0;
  edClassA.Clear;
  edClassB.Clear;
  edClassC.Clear;
  edClassD.Clear;
  edClassE.Clear;
  edClassF.Clear;
  edClassG.Clear;

  For i := 0 to StringGrid1.RowCount-2 do
  begin
    if cProduto[i] <> 0 then
    begin
      StringGrid1.Row := i + 1;
      base_icms := base_icms + StrtoFloat (StringGrid1.Cells[11, StringGrid1.Row]);
      vlr_icms := vlr_icms + StrtoFloat (StringGrid1.Cells[8, StringGrid1.Row]);
      vlr_ipi  := vlr_ipi  + StrtoFloat (StringGrid1.Cells[10, StringGrid1.Row]);
      vlr_prod := vlr_prod + StrtoFloat (StringGrid1.Cells[11, StringGrid1.Row]);
      class_fiscal := 'A';
      if edClassA.Text = '' then
        edClassA.Text := StringGrid1.Cells[14, StringGrid1.Row];
      if edClassA.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
      begin
        class_fiscal := 'B';
        if edClassB.Text = '' then
          edClassB.Text := StringGrid1.Cells[14, StringGrid1.Row];
        if edClassB.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
        begin
          class_fiscal := 'C';
          if edClassC.Text = '' then
            edClassC.Text := StringGrid1.Cells[14, StringGrid1.Row];
          if edClassC.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
          begin
            class_fiscal := 'D';
            if edClassD.Text = '' then
              edClassD.Text := StringGrid1.Cells[14, StringGrid1.Row];
            if edClassD.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
            begin
              class_fiscal := 'E';
              if edClassE.Text = '' then
                edClassE.Text := StringGrid1.Cells[14, StringGrid1.Row];
              if edClassE.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
              begin
                class_fiscal := 'F';
                if edClassF.Text = '' then
                  edClassF.Text := StringGrid1.Cells[14, StringGrid1.Row];
                if edClassF.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
                begin
                  class_fiscal := 'G';
                  if edClassG.Text = '' then
                    edClassG.Text := StringGrid1.Cells[14, StringGrid1.Row];
                  if edClassG.Text <> StringGrid1.Cells[14, StringGrid1.Row] then
                  begin
                    Showmessage ('Numero insuficiente de CLASSIFICACOES FISCAIS!');
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
      StringGrid1.Cells[5, StringGrid1.Row] := class_fiscal;
    end;
  end;
  StringGrid1.Row := 1;
  if edDemonstracao.Text  = '' then edDemonstracao.Text  := '0';
  if edVlrFrete.Text      = '' then edVlrFrete.Text      := '0';
  if edVlrSeguro.Text     = '' then edVlrSeguro.Text     := '0';
  if edVlrDespAcess.Text  = '' then edVlrDespAcess.Text  := '0';
  if edDolar.Text         = '' then edDolar.Text         := '1';
  if edBaseICMSStrib.Text = '' then edBaseICMSStrib.Text := '0';
  if edVlrICMSStrib.Text  = '' then edVlrICMSStrib.Text  := '0';

  edBaseICMS.Text := FloatToStrF (base_icms, ffFixed, 10, 2);
  edVlrIcms.Text  := FloatToStrF (vlr_icms , ffFixed, 10, 2);
  edVlrIPI.Text   := FloatToStrF (vlr_ipi  , ffFixed, 10, 2);
  edVlrProd.Text  := FloatToStrF (vlr_prod , ffFixed, 10, 2);
  edVlrTotal.Text := FloatToStrF (vlr_prod + StrtoFloat (edVlrFrete.Text) + vlr_ipi + 
             StrtoFloat (edVlrSeguro.Text) + StrtoFloat (edVlrDespAcess.Text), ffFixed, 10, 2);

  DM.AtualizaCondPagto (edNrNfiscal.Text, StrtoFloat (edVlrTotal.Text), StrtoDate (edDtEmissao.Text),
    DMLista.cdsListaCondPagtoCOND_PAGTO_SQ.AsInteger, DMLista.cdsListaNaturezasNATUREZA_SQ.AsInteger,
    StrtoInt (edDemonstracao.Text), Numero1, Numero2, Numero3, Data1, Data2, Data3, Valor1, Valor2, Valor3);

  ednfat1.Text := Numero1;
  ednfat2.Text := Numero2;
  ednfat3.Text := Numero3;
  eddfat1.Text := Data1;
  eddfat2.Text := Data2;
  eddfat3.Text := Data3;
  edvfat1.Text := Valor1;
  edvfat2.Text := Valor2;
  edvfat3.Text := Valor3;
end;

procedure TFCadastrarFormNfiscais.TransferePedido (Pedido: Integer);
var
  row: integer;
begin
  if Pedido > 0 then
  begin
    cdsListaPedidos.Close;
    DMLista.SCServerLista.Open;
    DMLista.SCServerLista.AppServer.CriaLista ('SELECT * FROM PEDIDOS WHERE NUMERO_PEDIDO = ' + InttoStr (Pedido));
    cdsListaPedidos.Open;

    if cdsListaPedidos.RecordCount <> 1 then
      Showmessage ('Pedido não encontrado!')
    else begin
      if not cdsListaPedidos.FieldByName('NFISCAL_SQ').IsNull then
      begin
        Showmessage ('Pedido em outra Nota Fiscal!');
        edPedido.Clear;
        cdsListaPedidos.Close;
      end
      else begin
        edPedido.Tag                := cdsListaPedidos.FieldByName('PEDIDO_SQ').Value;
        DBLookupComboBox1.KeyValue  := cdsListaPedidos.FieldByName('CLIENTE_SQ').Value;
        DBLookupComboBox2.KeyValue  := cdsListaPedidos.FieldByName('CLIENTE_SQ').Value;
        DBLookupComboBox3.KeyValue  := cdsListaPedidos.FieldByName('COND_PAGTO_SQ').Value;
        DBLookupComboBox4.KeyValue  := cdsListaPedidos.FieldByName('COND_PAGTO_SQ').Value;
        DBLookupComboBox5.KeyValue  := cdsListaPedidos.FieldByName('NATUREZA_SQ').Value;
        DBLookupComboBox6.KeyValue  := cdsListaPedidos.FieldByName('TRANSPORTADORA_SQ').Value;
        DBLookupComboBox7.KeyValue  := cdsListaPedidos.FieldByName('VENDEDOR_SQ').Value;
        MensagemPedido              := cdsListaPedidos.FieldByName('OBSERVACAO_NF').AsString;
        mmMensagem.Text             := MensagemPedido;
        edVlrFrete.Text             := cdsListaPedidos.FieldByName('VLR_FRETE').AsString;
        edDolar.Text                := cdsListaPedidos.FieldByName('COTACAO_DOLAR').AsString;
        rgFrete.ItemIndex           := cdsListaPedidos.FieldByName('FRETE_TRANSP').AsInteger - 1;
        edDemonstracao.Text         := cdsListaPedidos.FieldByName('DIAS_DEMONSTRACAO').AsString;

        cdsListaPedidosItens.Close;
        DMLista.SCServerLista.Open;
        DMLista.SCServerLista.AppServer.CriaLista ('SELECT * FROM PEDIDOS_ITENS WHERE PEDIDO_SQ = ' + cdsListaPedidos.FieldByName('PEDIDO_SQ').AsString);
        cdsListaPedidosItens.Open;
        cdsListaPedidosItens.Last;

        if cdsListaPedidosItens.RecordCount > 0 then
        begin
          SetLength(vIndice, cdsListaPedidosItens.RecordCount);
          SetLength(cProduto, cdsListaPedidosItens.RecordCount);
        end
        else begin
          SetLength(vIndice, 1);
          SetLength(cProduto, 1);
        end;

        vIndice[0] := '';
        cProduto[0] := 0;

        DMLista.cdsListaPecas.Open;
        cdsListaPedidosItens.First;
        row := 1;
        While not cdsListaPedidosItens.Eof do
        begin
          DMLista.cdsListaPecas.Locate('PECA_SQ', cdsListaPedidosItens.FieldByName('PECA_SQ').AsInteger, []);
          inc (row);
          StringGrid1.RowCount := row;
          StringGrid1.Cells [1,  row-1] := DMLista.cdsListaPecasCODIGO_PECA.AsString;
          StringGrid1.Cells [2,  row-1] := DMLista.cdsListaPecasDESCRICAO_PECA.AsString;
          StringGrid1.Cells [3,  row-1] := cdsListaPedidosItens.FieldByName ('QTDE_PEDIDO_ITEM').AsString;
          StringGrid1.Cells [4,  row-1] := FloattoStrf (cdsListaPedidosItens.FieldByName ('PRECO_UNIT').AsCurrency *
                                            cdsListaPedidos.FieldByName ('COTACAO_DOLAR').AsCurrency, ffFixed, 10, 2);
          StringGrid1.Cells [6,  row-1] := InttoStr (DM.strib);
          StringGrid1.Cells [7,  row-1] := cdsListaPedidosItens.FieldByName ('ALIQ_ICMS_ITEM').AsString;
          StringGrid1.Cells [8,  row-1] := cdsListaPedidosItens.FieldByName ('VLR_ICMS_ITEM').AsString;
          StringGrid1.Cells [9,  row-1] := cdsListaPedidosItens.FieldByName ('ALIQ_IPI_ITEM').AsString;
          StringGrid1.Cells [10, row-1] := cdsListaPedidosItens.FieldByName ('VLR_IPI_ITEM').AsString;
          StringGrid1.Cells [11, row-1] := cdsListaPedidosItens.FieldByName ('VLR_TOTAL_ITEM').AsString;
          StringGrid1.Cells [12, row-1] := cdsListaPedidosItens.FieldByName ('NR_SERIE_ITEM').AsString;
          StringGrid1.Cells [13, row-1] := InttoStr (DMLista.cdsListaPecasQTDE_PECA_LOJA.AsInteger + DMLista.cdsListaPecasQTDE_PECA_ARMAZEM.AsInteger);
          StringGrid1.Cells [14, row-1] := DMLista.cdsListaPecasCODIGO_NBM.AsString;
          vIndice[row-2]  := '0';
          cProduto[row-2] := cdsListaPedidosItens.FieldByName ('PECA_SQ').AsInteger;
          cdsListaPedidosItens.Next;
        end;
        DMLista.cdsListaPecas.Close;
      end;
    end;
  end;
  if not Manual then
    TotalizaNfiscal;
  DBLookupComboBox5.OnClick(Self);
end;

procedure TFCadastrarFormNfiscais.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormNfiscais.sbEditarItemClick(Sender: TObject);
begin
  Application.CreateForm(TFEditarNFiscaisItens, FEditarNFiscaisItens);
  FEditarNFiscaisItens.bbAtualizar.Visible  := Manual;
  FEditarNFiscaisItens.edAliqICMS.ReadOnly  := not Manual;
  FEditarNFiscaisItens.edAliqICMS.TabStop   := Manual;
  FEditarNFiscaisItens.edAliqIPI.ReadOnly   := not Manual;
  FEditarNFiscaisItens.edAliqIPI.TabStop    := Manual;
  FEditarNFiscaisItens.edPrecoSIpi.ReadOnly := not Manual;
  FEditarNFiscaisItens.edPrecoSIpi.TabStop  := Manual;
  FEditarNFiscaisItens.edVlrICMS.ReadOnly   := not Manual;
  FEditarNFiscaisItens.edVlrICMS.TabStop    := Manual;
  FEditarNFiscaisItens.edVlrIPI.ReadOnly    := not Manual;
  FEditarNFiscaisItens.edVlrIPI.TabStop     := Manual;
  FEditarNFiscaisItens.edNfiscal.Text := edNrNfiscal.Text;
  FEditarNFiscaisItens.edStrib.Text   := InttoStr (DM.strib);
  DMLista.cdsListaPecas.Open;
  DMLista.cdsListaPecas.Locate('PECA_SQ', cProduto[StringGrid1.Row-1], []);
  if Sender <> sbNovoItem then
  begin
    FEditarNFiscaisItens.edQtde.Text          := StringGrid1.Cells [3,   StringGrid1.Row];
    FEditarNFiscaisItens.edPreco.Text         := StringGrid1.Cells [4,   StringGrid1.Row];
    FEditarNFiscaisItens.edPrecoSIpi.Text     := FloatToStrF (StrtoFloat (StringGrid1.Cells [4, StringGrid1.Row]) - (StrtoFloat (StringGrid1.Cells [10, StringGrid1.Row])/StrtoInt (StringGrid1.Cells [3,   StringGrid1.Row])) , ffFixed, 10, 2);
    FEditarNFiscaisItens.edAliqICMS.Text      := StringGrid1.Cells [7,   StringGrid1.Row];
    FEditarNFiscaisItens.edVlrICMS.Text       := StringGrid1.Cells [8,   StringGrid1.Row];
    FEditarNFiscaisItens.edAliqIPI.Text       := StringGrid1.Cells [9,   StringGrid1.Row];
    FEditarNFiscaisItens.edVlrIPI.Text        := StringGrid1.Cells [10,  StringGrid1.Row];
    FEditarNFiscaisItens.edVlrTotal.Text      := StringGrid1.Cells [11,  StringGrid1.Row];
    FEditarNFiscaisItens.edStrib.Text         := StringGrid1.Cells [6,   StringGrid1.Row];
    FEditarNFiscaisItens.mmNrSerie.Lines.Text := StringGrid1.Cells [12,  StringGrid1.Row];
    FEditarNFiscaisItens.edUnid.Text          := DMLista.cdsListaPecasUN_PECA.AsString;
    FEditarNFiscaisItens.DBLookupComboBox1.KeyValue := cProduto[StringGrid1.Row-1];
    FEditarNFiscaisItens.DBLookupComboBox2.KeyValue := cProduto[StringGrid1.Row-1];
  end;
  if edDolar.Text = '' then
    edDolar.Text := '1';
  if FEditarNFiscaisItens.ShowModal = mrOk then
  begin
    if Sender = sbNovoItem then
    begin
      if StringGrid1.RowCount <> 2 then
        StringGrid1.RowCount := StringGrid1.RowCount + 1
      else if (Length (cProduto) <> 0) and (cProduto[0] <> 0) then
        StringGrid1.RowCount := StringGrid1.RowCount + 1;
      StringGrid1.Row := StringGrid1.RowCount - 1;
      SetLength (vIndice, StringGrid1.RowCount-1);
      SetLength (cProduto, StringGrid1.RowCount-1);
      vIndice[StringGrid1.Row-1]  := '0';
    end;
    StringGrid1.Cells [1,  StringGrid1.Row] := DMLista.cdsListaPecasCODIGO_PECA.AsString;
    StringGrid1.Cells [2,  StringGrid1.Row] := DMLista.cdsListaPecasDESCRICAO_PECA.AsString;
    StringGrid1.Cells [3,  StringGrid1.Row] := FEditarNFiscaisItens.edQtde.Text;
    StringGrid1.Cells [4,  StringGrid1.Row] := FEditarNFiscaisItens.edPreco.Text;
    StringGrid1.Cells [6,  StringGrid1.Row] := FEditarNFiscaisItens.edStrib.Text;
    StringGrid1.Cells [7,  StringGrid1.Row] := FEditarNFiscaisItens.edAliqICMS.Text;
    StringGrid1.Cells [8,  StringGrid1.Row] := FEditarNFiscaisItens.edVlrIcms.Text;
    StringGrid1.Cells [9,  StringGrid1.Row] := FEditarNFiscaisItens.edAliqIPI.Text;
    StringGrid1.Cells [10, StringGrid1.Row] := FEditarNFiscaisItens.edVlrIpi.Text;
    StringGrid1.Cells [11, StringGrid1.Row] := FEditarNFiscaisItens.edVlrTotal.Text;
    StringGrid1.Cells [12, StringGrid1.Row] := FEditarNFiscaisItens.mmNrSerie.Lines.Text;
    StringGrid1.Cells [13, StringGrid1.Row] := InttoStr (DMLista.cdsListaPecasQTDE_PECA_LOJA.AsInteger + DMLista.cdsListaPecasQTDE_PECA_ARMAZEM.AsInteger);
    StringGrid1.Cells [14, StringGrid1.Row] := DMLista.cdsListaPecasCODIGO_NBM.AsString;
    cProduto[StringGrid1.Row-1]   := DMLista.cdsListaPecasPECA_SQ.AsInteger;
  end;
  if not Manual then
    TotalizaNfiscal;
  inherited;
  FEditarNFiscaisItens.Free;
end;

procedure TFCadastrarFormNfiscais.sbApagarItemClick(Sender: TObject);
var
  i1: Integer;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  begin
    SetLength (xItens, High (xItens)+2);
    xItens[High(xItens)] := StrtoInt (vIndice[StringGrid1.Row-1]);
    While (StringGrid1.Row+1) < StringGrid1.RowCount do
    begin
      For i1 := 1 to StringGrid1.ColCount do
        StringGrid1.Cells [i1, StringGrid1.Row] := StringGrid1.Cells [i1, StringGrid1.Row+1];
      vIndice[StringGrid1.Row-1] := vIndice[StringGrid1.Row];
      cProduto[StringGrid1.Row-1] := cProduto[StringGrid1.Row];
      StringGrid1.Row := StringGrid1.Row + 1;
    end;
    if StringGrid1.RowCount > 2 then
      StringGrid1.RowCount := StringGrid1.RowCount - 1
    else begin
      For i1 := 0 to StringGrid1.ColCount do
        StringGrid1.Cells [i1, 1] := '';
        vIndice[0] := '';
        cProduto[0] := 0;
    end;
    SetLength (vIndice, StringGrid1.RowCount-1);
    SetLength (cProduto, StringGrid1.RowCount-1);
    if not Manual then
      TotalizaNfiscal;
  end;
end;

procedure TFCadastrarFormNfiscais.edPedidoExit(Sender: TObject);
begin
  inherited;
  if edPedido.Text <> '' then
    TransferePedido (StrtoInt (edPedido.Text));
end;

procedure TFCadastrarFormNfiscais.Label5Click(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TFBuscaClientes, FBuscaClientes);
  if FBuscaClientes.ShowModal = mrOk then
  begin
    DBLookupComboBox1.KeyValue := DMLista.cdsListaClientesCLIENTE_SQ.Value;
    DBLookupComboBox2.KeyValue := DMLista.cdsListaClientesCLIENTE_SQ.Value;
    DMLista.cdsBuscaClientes.Close;
  end;
  FBuscaClientes.Free;
end;

procedure TFCadastrarFormNfiscais.FormCreate(Sender: TObject);
begin
  inherited;
  StringGrid1.ColCount := 15;
  StringGrid1.RowCount := 2;
  StringGrid1.ColWidths[0]  := 10;
  StringGrid1.RowHeights[0] := 20;

  StringGrid1.ColWidths[1] := 70;
  StringGrid1.Cells [1, 0] := 'Código';

  StringGrid1.ColWidths[2] := 70;
  StringGrid1.Cells [2, 0] := 'Descrição';

  StringGrid1.ColWidths[3] := 70;
  StringGrid1.Cells [3, 0] := 'Quantidade';

  StringGrid1.ColWidths[4] := 70;
  StringGrid1.Cells [4, 0] := 'Preço Unitário';

  StringGrid1.ColWidths[5] := 70;
  StringGrid1.Cells [5, 0] := 'Class Fiscal';

  StringGrid1.ColWidths[6] := 70;
  StringGrid1.Cells [6, 0] := 'Sit. Tribut.';

  StringGrid1.ColWidths[7] := 70;
  StringGrid1.Cells [7, 0] := 'Aliq. ICMS';

  StringGrid1.ColWidths[8] := 70;
  StringGrid1.Cells [8, 0] := 'Vlr. ICMS';

  StringGrid1.ColWidths[9] := 70;
  StringGrid1.Cells [9, 0] := 'Aliq. IPI';

  StringGrid1.ColWidths[10] := 70;
  StringGrid1.Cells [10, 0] := 'Vlr. IPI';

  StringGrid1.ColWidths[11] := 70;
  StringGrid1.Cells [11, 0] := 'Vlr Total';

  StringGrid1.ColWidths[12] := 70;
  StringGrid1.Cells [12, 0] := 'Nr. Serie';

  StringGrid1.ColWidths[13] := 70;
  StringGrid1.Cells [13, 0] := 'Estoque Disp.';

  StringGrid1.ColWidths[14] := 70;
  StringGrid1.Cells [14, 0] := 'Codigo NCM';

  SetLength (cIndice, 1);
  SetLength (vIndice, 1);
  SetLength (xItens, 1);
  SetLength (cProduto, 1);
//  MensagemPedido := TStrings.Create;
end;

procedure TFCadastrarFormNfiscais.bbOkClick(Sender: TObject);
var
  i1: integer;
begin
  inherited;
  ModalResult := mrNone;
  cbEstadoTransp.Text := UpperCase (cbEstadoTransp.Text);
  if (Pos (cbEstadoTransp.Text, DM.estados) = 0) and (cbEstadoTransp.Text <> '') then
  begin
    PageControl1.ActivePage := tsRodape;
    cbEstadoTransp.Setfocus;
    raise Exception.Create ('Estado Inválido!');
  end;
  if (DMLista.cdsListaNaturezasTIPO_NFISCAL.AsString = 'D') and
     ((edDemonstracao.Text = '') or (edDemonstracao.Text = '0')) then
  begin
    PageControl1.ActivePage := tsCabecalho;
    edDemonstracao.SetFocus;
    raise Exception.Create ('Dias em Demonstração: Informação Obrigatória para Esta Natureza!');
  end;
  if DBLookupComboBox1.KeyValue = Null then
    raise Exception.Create('Cliente não selecionado!');
  if DBLookupComboBox3.KeyValue = Null then
    raise Exception.Create('Condição de Pagamento não selecionada!');
  if DBLookupComboBox5.KeyValue = Null then
    raise Exception.Create('Natureza da Operação não selecionada!');
  if DBLookupComboBox6.KeyValue = Null then
    raise Exception.Create('Transportadora não selecionado!');
  if DBLookupComboBox7.KeyValue = Null then
    raise Exception.Create('Vendedor não selecionada!');
  i1 := 1;
  While i1 <= 30 do
  begin
    if DMLista.cdsListaClientesESTADO.Value = DMLista.cdsListaNaturezas.FieldByName ('UF' + FormatFloat ('00', i1)).AsString then
      i1 := 99;
    inc (i1);
  end;
  if i1 <> 100 then
    raise Exception.Create ('Natureza Inválida para este Estado!');
  if FCadastrarListaNfiscais.novo and (StrtoInt (edNrNfiscal.Text) <> 0) then
  begin
    DM.SCServer.Open;
    if DM.SCServer.AppServer.VerificaIndice ('NFISCAIS', 'NUMERO_NFISCAL', edNrNfiscal.Text) = 1 then
      raise Exception.Create ('Nota Fiscal já Cadastrada!');
//    DM.SCServer.Close;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormNfiscais.DBLookupComboBox3Click(Sender: TObject);
begin
  inherited;
  if Sender <> DBLookupComboBox4 then
    DBLookupComboBox4.KeyValue := DBLookupComboBox3.KeyValue;
  if not Demonstracao then
  begin
    if not Manual then
      TotalizaNfiscal;
    DM.AtualizaCondPagto (edNrNfiscal.Text, StrtoFloat (edVlrTotal.Text), StrtoDate (edDtEmissao.Text),
      DMLista.cdsListaCondPagtoCOND_PAGTO_SQ.AsInteger, DMLista.cdsListaNaturezasNATUREZA_SQ.AsInteger,
      StrtoInt (edDemonstracao.Text), Numero1, Numero2, Numero3, Data1, Data2, Data3, Valor1, Valor2, Valor3);
  end
  else begin
    if edDemonstracao.Text = '' then
      edDemonstracao.Text := '0';
    Numero1 := edNrNfiscal.Text + ' 1/1';
    Numero2 := '';
    Numero3 := '';
    Data1   := FormatDateTime ('dd/mm/yyyy', StrtoDate (edDtEmissao.Text) + StrtoInt (edDemonstracao.Text));
    Data2   := '';
    Data3   := '';
    Valor1  := edVlrTotal.Text;
    Valor2  := '0';
    Valor3  := '0';
  end;
  ednfat1.Text := Numero1;
  ednfat2.Text := Numero2;
  ednfat3.Text := Numero3;
  eddfat1.Text := Data1;
  eddfat2.Text := Data2;
  eddfat3.Text := Data3;
  edvfat1.Text := Valor1;
  edvfat2.Text := Valor2;
  edvfat3.Text := Valor3;
end;

procedure TFCadastrarFormNfiscais.DBLookupComboBox4Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox3.KeyValue := DBLookupComboBox4.KeyValue;
  DBLookupComboBox3.OnClick (Sender);
end;

procedure TFCadastrarFormNfiscais.DBLookupComboBox2Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
end;

procedure TFCadastrarFormNfiscais.DBLookupComboBox1Click(Sender: TObject);
begin
  inherited;
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
end;

procedure TFCadastrarFormNfiscais.edVlrFreteExit(Sender: TObject);
begin
  inherited;
  if not Manual then
    TotalizaNfiscal;
end;

procedure TFCadastrarFormNfiscais.edVlrSeguroExit(Sender: TObject);
begin
  inherited;
  if not Manual then
    TotalizaNfiscal;
end;

procedure TFCadastrarFormNfiscais.edVlrDespAcessExit(Sender: TObject);
begin
  inherited;
  if not Manual then
    TotalizaNfiscal;
end;

procedure TFCadastrarFormNfiscais.DBLookupComboBox5Click(Sender: TObject);
begin
  inherited;
  mmMensagem.Lines.Clear;
  mmMensagem.Lines.Add(MensagemPedido);
  mmMensagem.Lines.Add(DMLista.cdsListaNaturezasOBSERVACAO.Value);
  Demonstracao := DMLista.cdsListaNaturezasTIPO_NFISCAL.AsString = 'D';
  DBLookupComboBox3.OnClick (Sender);
end;

procedure TFCadastrarFormNfiscais.edDemonstracaoExit(Sender: TObject);
begin
  inherited;
  DBLookupComboBox3.OnClick (Sender);
end;

procedure TFCadastrarFormNfiscais.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFCadastrarFormNfiscais.edNrNfiscalExit(Sender: TObject);
begin
  inherited;
  if (FCadastrarListaNfiscais.novo) and (edNrNfiscal.Text <> '') and (edNrNfiscal.Text <> '0') then
  begin
    DM.SCServer.Open;
    if DM.SCServer.AppServer.VerificaIndice ('NFISCAIS', 'NUMERO_NFISCAL', edNrNfiscal.Text) = 1 then
      edNrNfiscal.Font.Color := clRed
      else edNrNfiscal.Font.Color := clWindowText;
//    DM.SCServer.Close;
  end;
end;

procedure TFCadastrarFormNfiscais.bbAtualizarClick(Sender: TObject);
begin
  inherited;
  TotalizaNfiscal;
end;

end.
