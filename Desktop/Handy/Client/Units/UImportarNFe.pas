unit UImportarNFe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrNFe, Buttons, RzSpnEdt, RzShellDialogs, StdCtrls, ExtCtrls,
  RzLabel, Mask, RzEdit, pcnNFe, ACBrNFeNotasFiscais, Cliente, Produto, ncm,
  DB, DBCtrls, RzDBCmbo, Modelo;

type
  TFImportarNFe = class(TForm)
    ACBrNFe1: TACBrNFe;
    edNomeArquivo: TRzEdit;
    RzLabel1: TRzLabel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    RzOpenDialog1: TRzOpenDialog;
    RzRapidFireButton1: TRzRapidFireButton;
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    nfe: NotaFiscal;
    item: TDetCollectionItem;
    respostaAll: Boolean;

    procedure ImportarNFe();
    function BuscaObservacao(listaObservacao: TobsContCollection): String;
    function buscarCliente(codigo: String): TCliente;
    function buscarProduto(codigo: String): TProduto;
    function buscarNCM(codigo: String): TNCM;
    function buscarModeloPadrao(): TModelo;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FImportarNFe: TFImportarNFe;

implementation

uses NfEntrada, UDM, Empresa, Natureza, Cadastro;

{$R *.dfm}

procedure TFImportarNFe.RzRapidFireButton1Click(Sender: TObject);
begin
  RzOpenDialog1.Execute;

  edNomeArquivo.Text := RzOpenDialog1.FileName;
end;

procedure TFImportarNFe.bbOkClick(Sender: TObject);
begin
  ImportarNFe();
end;

procedure TFImportarNFe.ImportarNFe;
var
  nfEntrada: TNfEntrada;
  nfEntradaItem: TNfEntradaItem;
  natureza: TNatureza;
  i: Integer;
  cfop: String;
begin

  ACBrNFe1.NotasFiscais.LoadFromFile(edNomeArquivo.Text);
  nfe := ACBrNFe1.NotasFiscais.Items[0];

  cfop := nfe.NFe.Det.Items[0].Prod.CFOP;
  if Copy(cfop, 1, 1) = '5' then
    cfop := '1' + Copy(cfop, 2, 3)
  else
    cfop := '2' + Copy(cfop, 2, 3);

  natureza := TNatureza.buscarPorCFOP(cfop);

  nfEntrada := TNfEntrada.Create;
  nfEntrada.empresa_sq       := empresaSelecionada;
  nfEntrada.numero_nf_ent    := nfe.NFe.Ide.nNF;
  nfEntrada.dtemissao_nf_ent := nfe.NFe.Ide.dEmi;
  nfEntrada.cliente_sq       := buscarCliente(nfe.NFe.Emit.CNPJCPF);
  nfEntrada.natureza_sq      := natureza;
  nfEntrada.base_icms        := nfe.NFe.Total.ICMSTot.vBC;
  nfEntrada.vlr_icms         := nfe.NFe.Total.ICMSTot.vICMS;
  nfEntrada.base_icms_subst  := nfe.NFe.Total.ICMSTot.vBCST;
  nfEntrada.vlr_icms_subst   := nfe.NFe.Total.ICMSTot.vST;
  nfEntrada.vlr_produtos     := nfe.NFe.Total.ICMSTot.vProd;
  nfEntrada.vlr_frete        := nfe.NFe.Total.ICMSTot.vFrete;
  nfEntrada.vlr_seguro       := nfe.NFe.Total.ICMSTot.vSeg;
  nfEntrada.vlr_desp_acess   := nfe.NFe.Total.ICMSTot.vOutro;
  nfEntrada.vlr_ipi          := nfe.NFe.Total.ICMSTot.vIPI;
  nfEntrada.vlr_total        := nfe.NFe.Total.ICMSTot.vNF;
  nfEntrada.observacao       := buscaObservacao(nfe.NFe.InfAdic.obsCont);
  nfEntrada.transferida      := 'N';
  nfEntrada.dt_entrada       := Null;
  nfEntrada.salvar;

  for i := 1 to nfe.NFe.Det.Count do
  begin
    item := nfe.NFe.Det.Items[i-1];
    nfEntradaItem := TNfEntradaItem.Create;
    nfEntradaItem.nf_entrada_sq  := nfEntrada;
    nfEntradaItem.item           := i;
    nfEntradaItem.produto_sq     := buscarProduto(item.Prod.cProd);
//    nfEntradaItem.nr_serie_item  :=
    nfEntradaItem.qtde_item      := Trunc(item.Prod.qCom);
    nfEntradaItem.vlr_unit_item  := item.Prod.vUnCom;
    nfEntradaItem.vlr_total_item := item.Prod.vProd;
    nfEntradaItem.aliq_icms_item := item.Imposto.ICMS.pICMS;
    nfEntradaItem.aliq_ipi_item  := item.Imposto.IPI.pIPI;
    nfEntradaItem.vlr_icms_item  := item.Imposto.ICMS.vICMS;
    nfEntradaItem.vlr_ipi_item   := item.Imposto.IPI.vIPI;
    nfEntradaItem.numero_estoque := natureza.numero_estoque_entrada;
    nfEntradaItem.salvar;
  end;

end;

function TFImportarNFe.BuscaObservacao(
  listaObservacao: TobsContCollection): String;
var
  i: Integer;
begin
  result := '';
  for i := 1 to listaObservacao.Count do
  begin
    result := result + listaObservacao.Items[i-1].xTexto + '\n';
  end;
end;

function TFImportarNFe.buscarCliente(codigo: String): TCliente;
var
  resposta: Integer;
begin
  try
    result := TCliente.buscaPorCodigo(codigo);
  except
    on E: Exception do
    begin
      if Copy(E.Message, 0, 16) = 'Não foi possível' then
      begin
        if not respostaAll then
          resposta := MessageDlg(E.Message, mtError, [mbYes, mbNo, mbAll], 0)
        else
          resposta := mrAll;

        respostaAll := resposta = mrAll;

        if (respostaAll or (resposta = mrYes)) then
        begin
          with TCliente.Create do
          begin
            codigo_cliente := nfe.NFe.Emit.CNPJCPF;
            nome_cliente   := nfe.NFe.Emit.xNome;
            nome_fantasia  := nfe.NFe.Emit.xFant;
            endereco       := nfe.NFe.Emit.EnderEmit.xLgr;
            numero         := nfe.NFe.Emit.EnderEmit.nro;
            compl_endereco := nfe.NFe.Emit.EnderEmit.xCpl;
            bairro         := nfe.NFe.Emit.EnderEmit.xBairro;
            cidade         := nfe.NFe.Emit.EnderEmit.xMun;
            estado         := nfe.NFe.Emit.EnderEmit.UF;
            cep            := IntToStr(nfe.NFe.Emit.EnderEmit.CEP);
            pais           := nfe.NFe.Emit.EnderEmit.xPais;
            numero_fone1   := nfe.NFe.Emit.EnderEmit.fone;
            inscr_estadual := nfe.NFe.Emit.IE;
            inscr_municipal:= nfe.NFe.Emit.IM;
            cnae           := nfe.NFe.Emit.CNAE;
            salvar;
            result := buscarCliente(codigo);
          end;
        end
        else raise E;
      end
      else raise E;
    end;
  end;
end;

function TFImportarNFe.buscarProduto(codigo: String): TProduto;
var
  resposta: Integer;
begin
  try
    result := TProduto.buscaPorCodigo(codigo);
  except
    on E: Exception do
    begin
      if Copy(E.Message, 0, 16) = 'Não foi possível' then
      begin
        if not respostaAll then
          resposta := MessageDlg(E.Message, mtError, [mbYes, mbNo, mbAll], 0)
        else
          resposta := mrAll;

        respostaAll := resposta = mrAll;

        if (respostaAll or (resposta = mrYes)) then
        begin
          with TProduto.Create do
          begin
            codigo_produto    := item.Prod.cProd;
            descricao_produto := Copy(item.Prod.xProd, 1, 50);
            nbm_sq            := buscarNCM(item.Prod.NCM);
            un_produto        := item.Prod.uCom;
            modelo_sq         := buscarModeloPadrao;
            produto_ativo     := 'S';
            tipo_produto      := 1;
            salvar;
            result := buscarProduto(codigo);
          end;
        end
        else raise E;
      end
      else raise E;
    end;
  end;
end;

function TFImportarNFe.buscarNCM(codigo: String): TNCM;
var
  resposta: Integer;
begin
  try
    result := TNCM.buscaPorCodigo(codigo);
  except
    on E: Exception do
    begin
      if Copy(E.Message, 0, 16) = 'Não foi possível' then
      begin
        if not respostaAll then
          resposta := MessageDlg(E.Message, mtError, [mbYes, mbNo, mbAll], 0)
        else
          resposta := mrAll;

        respostaAll := resposta = mrAll;

        if (respostaAll or (resposta = mrYes)) then
        begin
          with TNCM.Create do
          begin
            codigo_nbm := codigo;
            aliq_icms  := item.Imposto.ICMS.pICMS;
            aliq_ipi   := item.Imposto.IPI.pIPI;
            salvar;
            result := buscarNCM(codigo);
          end;
        end
        else raise E;
      end
      else raise E;
    end;
  end;
end;

function TFImportarNFe.buscarModeloPadrao: TModelo;
begin
  result := TModelo.CreateFiltro('codigo_modelo = ' + QuotedStr('DEFAULT'));
  if (result.vIndice = null) then
  begin
    result.codigo_modelo := 'DEFAULT';
    result.descricao_modelo := 'Produto sem modelo definido';
    result.salvar;
  end;
end;

end.
