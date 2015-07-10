unit UManutencaoFormNfiscaisDemonstracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB,
  Mask, RzEdit, StrUtils;

type
  TFManutencaoFormNFiscaisDemonstracao = class(TFCadastrarFormComum)
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label4: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    mmObservacao: TMemo;
    cbRetNFiscal: TCheckBox;
    cbRetProduto: TCheckBox;
    dsListaNatDemo: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    edNrPedido: TRzEdit;
    edNrNfiscal: TRzEdit;
    edDtEmissao: TRzEdit;
    edDtSaida: TRzEdit;
    edDemonstracao: TRzEdit;
    edDolar: TRzEdit;
    edDtPedido: TRzEdit;
    edCliente: TRzEdit;
    edDtLimite: TRzEdit;
    edDtVencto: TRzEdit;
    edNrNFiscalRet: TRzNumericEdit;
    edDtNfiscalRet: TRzDateTimeEdit;
    procedure Label12Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure edNrNFiscalRetChange(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FManutencaoFormNFiscaisDemonstracao: TFManutencaoFormNFiscaisDemonstracao;

implementation

uses UCadastrarListaNfiscais, UMainMenu, UCadastrarListaPedidos, UDM,
  UCadastrarListaComum, Nfiscal, Natureza, Kardex, Produto, Usuario,
  Cadastro, Empresa, DBClient;

{$R *.dfm}

procedure TFManutencaoFormNFiscaisDemonstracao.Label12Click(
  Sender: TObject);
begin
  inherited;
  FCadastrarListaNFiscais.cbFiltro.Text := 'Número';
  FCadastrarListaNfiscais.edFiltro.Text := edNrNfiscal.Text;
  FCadastrarListaNFiscais.sbFiltro.Click;
  FCadastrarListaNFiscais.sbEditar.Click;
end;

procedure TFManutencaoFormNFiscaisDemonstracao.Label1Click(
  Sender: TObject);
begin
  inherited;
  FCadastrarListaPedidos.cbFiltro.Text := 'Número';
  FCadastrarListaPedidos.edFiltro.Text := edNrPedido.Text;
  FCadastrarListaPedidos.sbFiltro.Click;
  FCadastrarListaPedidos.sbEditar.Click;
end;

procedure TFManutencaoFormNFiscaisDemonstracao.edNrNFiscalRetChange(
  Sender: TObject);
begin
  inherited;
  cbRetNFiscal.Checked := edNrNFiscalRet.IntValue <> 0;
end;

procedure TFManutencaoFormNFiscaisDemonstracao.bbOkClick(Sender: TObject);
var
  item: TNfiscalItem;
  natureza: TNatureza;
  cdsListaItens: TClientDataSet;
begin
  inherited;
  ModalResult := mrNone;
  if cbRetNFiscal.Checked = (edDtNfiscalRet.Date = 0) then
    raise Exception.Create('Informe a data e o número da nota fiscal de retorno!');

  with TNfiscal.Create(TFCadastrarListaComum(Owner).cdsLista.FieldByName('nfiscal_sq').Value) do
  begin
    nr_nfiscal_retorno := edNrNFiscalRet.IntValue;
    dt_nfiscal_retorno := edDtNfiscalRet.Date;
    natureza           := TNatureza.Create(DBLookupComboBox1.KeyValue);
    natureza_ret_dem   := natureza;
    retorno_produto    := IfThen(cbRetProduto.Checked, 'S', 'N');
    retorno_observacao := mmObservacao.Lines.Text;
    salvar;
  end;

  if cbRetProduto.Checked then
  begin
    cdsListaItens := TNfiscal.Create(TFCadastrarListaComum(Owner).cdsLista.FieldByName ('NFISCAL_SQ').AsInteger).listaItens;

    While not cdsListaItens.Eof do
    begin
      if TKardex.listaRegistros('where produto_sq = ' + cdsListaItens.FieldByName('PRODUTO_SQ').AsString +
        ' and nfiscal = ' + TFCadastrarListaComum(Owner).cdsLista.FieldByName('NUMERO_NFISCAL').AsString +
        ' and tipo_mov = ' + QuotedStr('E')).RecordCount = 0 then
      with TKardex.Create do
      begin
        item := TNfiscalItem.Create(cdsListaItens.FieldByName('nfiscal_item_sq').Value);
        produto_sq := item.produto_sq;
        tipo_mov   := 'E';
        qtde       := item.qtde_item;
        data       := edDtNfiscalRet.Date;
        nfiscal    := TFCadastrarListaComum(Owner).cdsLista.FieldByName('numero_nfiscal').AsInteger;
        valor      := item.vlr_total_item;
        usuario_sq := TUsuario.Create(DM.useq);
        nr_serie   := item.nr_serie_item;
        numero_estoque := item.numero_estoque;
        if (numero_estoque = 0) then
          numero_estoque := natureza.numero_estoque_entrada;
        salvar;
      end;
      cdsListaItens.Next;
    end;
  end;

  ModalResult := mrOk;
end;

procedure TFManutencaoFormNFiscaisDemonstracao.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  with Owner as TFCadastrarListaComum do
  begin
    i := cdsLista.FieldByName('DIAS_DEMONSTRACAO').AsInteger;

    dsListaNatDemo.DataSet := TNatureza.demontracao;

    edNrNfiscal.Text        := cdsLista.FieldByName('NUMERO_NFISCAL').AsString;
    edNrPedido.Text         := cdsLista.FieldByName('NUMERO_PEDIDO').AsString;
    edNrPedido.Tag          := cdsLista.FieldByName('PEDIDO_SQ').AsInteger;
    edDolar.Text            := cdsLista.FieldByName('COTACAO_DOLAR').AsString;
    edDtPedido.Text         := cdsLista.FieldByName('DATA_PEDIDO').AsString;
    edDtEmissao.Text        := cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsString;
    edDtSaida.Text          := cdsLista.FieldByName('DTSAIDA_NFISCAL').AsString;
    edDtVencto.Text         := FormatDateTime('dd/mm/yyyy', cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsDateTime + i);
    edDtLimite.Text         := FormatDateTime('dd/mm/yyyy', cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsDateTime + empresaSelecionada.dias_demonstracao);
    edDemonstracao.Text     := cdsLista.FieldByName('DIAS_DEMONSTRACAO').AsString;
    edCliente.Text          := cdsLista.FieldByName('NOME_CLIENTE').AsString;
    edNrNFiscalRet.IntValue := cdsLista.FieldByName('NR_NFISCAL_RETORNO').AsInteger;
    if cdsLista.FieldByName('DT_NFISCAL_RETORNO').AsVariant <> null then
      edDtNfiscalRet.Date   := cdsLista.FieldByName('DT_NFISCAL_RETORNO').AsDateTime;
    cbRetProduto.Checked    := cdsLista.FieldByName('RETORNO_PRODUTO').AsString = 'S';
    mmObservacao.Lines.Text := cdsLista.FieldByName('RETORNO_OBSERVACAO').AsString;
    DBLookupComboBox1.KeyValue := cdsLista.FieldByName('NATUREZA_RET_DEM').AsInteger;
    if cdsLista.FieldByName('NATUREZA_RET_DEM').isNull
      then DBLookupComboBox1.KeyValue := dsListaNatDemo.DataSet.FieldByName('NATUREZA_SQ').AsInteger;
  end;
end;

end.
