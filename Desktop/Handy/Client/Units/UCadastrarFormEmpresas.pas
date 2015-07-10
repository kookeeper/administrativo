unit UCadastrarFormEmpresas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrls, RzEdit, RzTabs, RzPanel,
  RzRadGrp;

type
  TFCadastrarFormEmpresas = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Label3: TLabel;
    edUNfiscal: TRzEdit;
    Label9: TLabel;
    edDiasDemonstr: TRzEdit;
    Label14: TLabel;
    Label15: TLabel;
    Label11: TLabel;
    edPIS: TRzNumericEdit;
    edCOFINS: TRzNumericEdit;
    edISS: TRzNumericEdit;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label10: TLabel;
    edICMSProd1: TRzNumericEdit;
    edICMSPec1: TRzNumericEdit;
    cbAltDtNfiscal: TCheckBox;
    cbAltNrNFiscal: TCheckBox;
    TabSheet2: TRzTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edCodigo: TRzEdit;
    edRazao: TRzEdit;
    edSenha: TRzEdit;
    Label8: TLabel;
    Label13: TLabel;
    Label18: TLabel;
    edSTribut: TRzEdit;
    edUAssistencia: TRzEdit;
    edBancoImagens: TRzEdit;
    Label5: TLabel;
    edEstado: TRzEdit;
    Label16: TLabel;
    edClassificacao: TRzEdit;
    Label19: TLabel;
    edJuros: TRzNumericEdit;
    Label6: TLabel;
    edUPedido: TRzEdit;
    cbAltDtPedido: TCheckBox;
    cbAltNrPedido: TCheckBox;
    TabSheet3: TRzTabSheet;
    rgBaixarEstoque: TRadioGroup;
    cbEstoqueNegativo: TCheckBox;
    Label12: TLabel;
    edDescricaoEstoque1: TRzEdit;
    Label17: TLabel;
    Label21: TLabel;
    edDescricaoEstoque2: TRzEdit;
    Label22: TLabel;
    edDescricaoEstoque3: TRzEdit;
    Label23: TLabel;
    edDescricaoEstoque4: TRzEdit;
    Label24: TLabel;
    edDescricaoEstoque5: TRzEdit;
    Label25: TLabel;
    edDescricaoEstoque6: TRzEdit;
    Label26: TLabel;
    edDescricaoEstoque7: TRzEdit;
    Label27: TLabel;
    edDescricaoEstoque8: TRzEdit;
    Label28: TLabel;
    edDescricaoEstoque9: TRzEdit;
    Label29: TLabel;
    edDescricaoEstoque10: TRzEdit;
    Label20: TLabel;
    rgCodigoRegimeTributario: TRzRadioGroup;
    edCodigoSituacaoOperacao: TRzNumericEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rgCodigoRegimeTributarioChanging(Sender: TObject;
      NewIndex: Integer; var AllowChange: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormEmpresas: TFCadastrarFormEmpresas;

implementation

uses UDM, Empresa, StrUtils, Variants;

{$R *.DFM}

procedure TFCadastrarFormEmpresas.bbOkClick(Sender: TObject);
begin
  if edICMSPec1.Text     = '' then edICMSPec1.Text     := '0';
  if edPIS.Text          = '' then edPIS.Text          := '0';
  if edCOFINS.Text       = '' then edCOFINS.Text       := '0';
  if edISS.Text          = '' then edISS.Text          := '0';
  if edICMSProd1.Text    = '' then edICMSProd1.Text    := '0';
  if edUNfiscal.Text     = '' then edUNfiscal.Text     := '0';
  if edUPedido.Text      = '' then edUPedido.Text      := '0';
  if edUAssistencia.Text = '' then edUAssistencia.Text := '0';

  edEstado.Text := UpperCase (edEstado.Text);
  if (not DM.estadoValido(edEstado.Text)) then
  begin
    ModalResult := mrNone;
    raise Exception.Create ('Estado Inválido!');
  end;

  with empresaSelecionada do
  begin
    codigo_empresa    := edCodigo.Text;
    nome_empresa      := edRazao.Text;
    senha             := edSenha.Text;
    estado            := edEstado.Text;
    numero_nfiscal    := StrToInt(edUNfiscal.Text);
    numero_pedido     := StrToInt(edUPedido.Text);
    numero_assistencia:= StrToInt(edUAssistencia.Text);
    aliq_icms_prod1   := edICMSProd1.Value;
    aliq_icms_pec1    := edICMSPec1.Value;
    stribut           := StrToInt(edSTribut.Text);
    dias_demonstracao := StrToInt(edDiasDemonstr.Text);
    alt_data_pedido   := ifThen(cbAltDtPedido.Checked, 'S', 'N');
    alt_dtemissao_nfiscal:= ifThen(cbAltDtNfiscal.Checked, 'S', 'N');
    alt_nr_pedido     := ifThen(cbAltNrPedido.Checked, 'S', 'N');
    alt_nr_nfiscal    := ifThen(cbAltNrNFiscal.Checked, 'S', 'N');
    aliq_pis          := edPIS.Value;
    aliq_cofins       := edCOFINS.Value;
    aliq_iss          := edISS.Value;
    banco_imagens     := edBancoImagens.Text;
    baixa_estoque_pedido:= IfThen(rgBaixarEstoque.ItemIndex = 1, 'S', 'N');
    juros_receber     := edJuros.Value;
    estoque_negativo  := IfThen(cbEstoqueNegativo.Checked, 'S', 'N');
    descricao_estoque1 := edDescricaoEstoque1.Text;
    descricao_estoque2 := edDescricaoEstoque2.Text;
    descricao_estoque3 := edDescricaoEstoque3.Text;
    descricao_estoque4 := edDescricaoEstoque4.Text;
    descricao_estoque5 := edDescricaoEstoque5.Text;
    descricao_estoque6 := edDescricaoEstoque6.Text;
    descricao_estoque7 := edDescricaoEstoque7.Text;
    descricao_estoque8 := edDescricaoEstoque8.Text;
    descricao_estoque9 := edDescricaoEstoque9.Text;
    descricao_estoque10:= edDescricaoEstoque10.Text;
    codigo_regime_tributario := rgCodigoRegimeTributario.ItemIndex + 1;
    if rgCodigoRegimeTributario.ItemIndex = 2 then
      codigo_situacao_operacao := Null
    else
      codigo_situacao_operacao := edCodigoSituacaoOperacao.IntValue;

    salvar;
    VerificaSenha;
  end;
  empresaSelecionada.Atualizar;
end;

procedure TFCadastrarFormEmpresas.FormCreate(Sender: TObject);
begin
  edCodigo.Text          := empresaSelecionada.codigo_empresa;
  edRazao.Text           := empresaSelecionada.nome_empresa;
  edSenha.Text           := empresaSelecionada.senha;
  edEstado.Text          := empresaSelecionada.estado;
  edUNfiscal.Text        := IntToStr(empresaSelecionada.numero_nfiscal);
  edUPedido.Text         := IntToStr(empresaSelecionada.numero_pedido);
  edUAssistencia.Text    := IntToStr(empresaSelecionada.numero_assistencia);
  edICMSProd1.Text       := FloatToStr(empresaSelecionada.aliq_icms_prod1);
  edICMSPec1.Text        := FloatToStr(empresaSelecionada.aliq_icms_pec1);
  edSTribut.Text         := IntToStr(empresaSelecionada.stribut);
  edDiasDemonstr.Text    := IntToStr(empresaSelecionada.dias_demonstracao);
  cbAltDtPedido.Checked  := empresaSelecionada.alt_data_pedido       = 'S';
  cbAltDtNfiscal.Checked := empresaSelecionada.alt_dtemissao_nfiscal = 'S';
  cbAltNrPedido.Checked  := empresaSelecionada.alt_nr_pedido         = 'S';
  cbAltNrNfiscal.Checked := empresaSelecionada.alt_nr_nfiscal        = 'S';
  edPIS.Text             := FloatToStr(empresaSelecionada.aliq_pis);
  edCOFINS.Text          := FloatToStr(empresaSelecionada.aliq_cofins);
  edISS.Text             := FloatToStr(empresaSelecionada.aliq_iss);
  edClassificacao.Text   := DateToStr(empresaSelecionada.ultima_classificacao);
  edBancoImagens.Text    := empresaSelecionada.banco_imagens;
  edJuros.Value          := empresaSelecionada.juros_receber;
  cbEstoqueNegativo.Checked := empresaSelecionada.estoque_negativo = 'S';
  edDescricaoEstoque1.Text := empresaSelecionada.descricao_estoque1;
  edDescricaoEstoque2.Text := empresaSelecionada.descricao_estoque2;
  edDescricaoEstoque3.Text := empresaSelecionada.descricao_estoque3;
  edDescricaoEstoque4.Text := empresaSelecionada.descricao_estoque4;
  edDescricaoEstoque5.Text := empresaSelecionada.descricao_estoque5;
  edDescricaoEstoque6.Text := empresaSelecionada.descricao_estoque6;
  edDescricaoEstoque7.Text := empresaSelecionada.descricao_estoque7;
  edDescricaoEstoque8.Text := empresaSelecionada.descricao_estoque8;
  edDescricaoEstoque9.Text := empresaSelecionada.descricao_estoque9;
  edDescricaoEstoque10.Text := empresaSelecionada.descricao_estoque10;

  rgCodigoRegimeTributario.ItemIndex := empresaSelecionada.codigo_regime_tributario - 1;
  if empresaSelecionada.codigo_situacao_operacao = Null then
    edCodigoSituacaoOperacao.Clear
  else
    edCodigoSituacaoOperacao.IntValue  := empresaSelecionada.codigo_situacao_operacao;

  if empresaSelecionada.baixa_estoque_pedido = 'S' then
    rgBaixarEstoque.ItemIndex := 1
  else
    rgBaixarEstoque.ItemIndex := 0;
end;

procedure TFCadastrarFormEmpresas.rgCodigoRegimeTributarioChanging(
  Sender: TObject; NewIndex: Integer; var AllowChange: Boolean);
begin
  edCodigoSituacaoOperacao.Visible := NewIndex <> 2;
  Label20.Visible := NewIndex <> 2;

  if NewIndex = 2 then
    edCodigoSituacaoOperacao.Clear;
end;

end.
