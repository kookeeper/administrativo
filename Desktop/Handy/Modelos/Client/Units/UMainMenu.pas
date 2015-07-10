unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, Variants, PJVersionInfo, UCadastrarListaComum,
  DBClient;

type
  TFMainMenu = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    PageControl1: TPageControl;
    Cadastrar1: TMenuItem;
    Clientes1: TMenuItem;
    CondicoesdePagamento1: TMenuItem;
    Naturezas1: TMenuItem;
    Parametros1: TMenuItem;
    Pedidos1: TMenuItem;
    Produtos1: TMenuItem;
    NCM1: TMenuItem;
    Imprimir1: TMenuItem;
    Pedidos2: TMenuItem;
    Usuarios1: TMenuItem;
    StatusBar1: TStatusBar;
    MudaLogin1: TMenuItem;
    Transportadoras1: TMenuItem;
    Parametros2: TMenuItem;
    NotasFiscais1: TMenuItem;
    Estoque1: TMenuItem;
    Movimentacoes1: TMenuItem;
    Clientes2: TMenuItem;
    NotasFiscais2: TMenuItem;
    Duplicatas1: TMenuItem;
    Historico1: TMenuItem;
    Manuteno1: TMenuItem;
    NotasFiscais3: TMenuItem;
    PorEstado1: TMenuItem;
    Demonstrao1: TMenuItem;
    PJVersionInfo1: TPJVersionInfo;
    Duplicatas2: TMenuItem;
    Atualizacoes1: TMenuItem;
    Assistencias1: TMenuItem;
    Modelos1: TMenuItem;
    Vendedores1: TMenuItem;
    Acessos1: TMenuItem;
    RelacaodeVendas1: TMenuItem;
    FechamentodeNotas1: TMenuItem;
    Classificacao1: TMenuItem;
    Assistencias2: TMenuItem;
    NotasFiscaisdeServico1: TMenuItem;
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure CondicoesdePagamento1Click(Sender: TObject);
    procedure Naturezas1Click(Sender: TObject);
    procedure Pedidos1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure NCM1Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
    procedure Usuarios1Click(Sender: TObject);
    procedure MudaLogin1Click(Sender: TObject);
    procedure Transportadoras1Click(Sender: TObject);
    procedure Parametros2Click(Sender: TObject);
    procedure NotasFiscais1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure Movimentacoes1Click(Sender: TObject);
    procedure NotasFiscais2Click(Sender: TObject);
    procedure Duplicatas1Click(Sender: TObject);
    procedure Historico1Click(Sender: TObject);
    procedure NotasFiscais3Click(Sender: TObject);
    procedure PorEstado1Click(Sender: TObject);
    procedure Demonstrao1Click(Sender: TObject);
    procedure Duplicatas2Click(Sender: TObject);
    procedure Atualizacoes1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Assistencias1Click(Sender: TObject);
    procedure Modelos1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Acessos1Click(Sender: TObject);
    procedure RelacaodeVendas1Click(Sender: TObject);
    procedure FechamentodeNotas1Click(Sender: TObject);
    procedure Classificacao1Click(Sender: TObject);
    procedure Assistencias2Click(Sender: TObject);
    procedure NotasFiscaisdeServico1Click(Sender: TObject);
  private
  public
    procedure VerificaMenu ();
    procedure AbreForm2 (Form: TForm);

    function AbreForm (Form: TFCadastrarListaComum): TTabSheet;
    procedure VerificaAcesso (Programa: String; var Visualizar, Criar, Editar, Apagar: Boolean);
  end;

var
  FMainMenu: TFMainMenu;

implementation

uses UDM, UCadastrarListaClientes, UCadastrarListaCondPagto,
  UCadastrarListaNaturezas, UCadastrarListaPedidos,
  UCadastrarListaProdutos, UCadastrarListaNCM, UImprimirPedidos,
  UCadastrarListaUsuarios, UCadastrarListaTransportadoras,
  UCadastrarFormEmpresas, UCadastrarListaNfiscais, UImprimirEstoque,
  UCadastrarListaMovimentacoes, UImprimirNfiscais,
  UCadastrarListaDuplicatas, UImprimirClientesUF,
  UManutencaoListaNfiscaisDemonstracao, UDMImpr, UDMLista,
  UImprimirDemonstracaoPrev, UImprimirDuplicatas, USplash,
  UCadastrarListaAssistencias, UCadastrarListaModelos,
  UCadastrarListaVendedores, UCadastrarListaAcessos, UImprimirClientesHist,
  UImprimirNfiscaisVend, UImprimirNfiscaisFech,
  UCadastrarListaClassificacao, UImprimirAssistencias,
  UCadastrarListaNFServicos;

{$R *.DFM}

procedure TFMainMenu.VerificaMenu ();
begin
  StatusBar1.Panels[0].Text := DM.unom;
  StatusBar1.Panels[2].Text := 'Acesso - ' + FormatDateTime ('dd/mm/yyyy', Date) + FormatDateTime ('  hh:nn', Time);
  StatusBar1.Panels[3].Text := 'Limite - '    + FormatDateTime ('dd/mm/yyyy', DM.dtsenha);
  StatusBar1.Panels[4].Text := 'Versão - '    + DM.verinfo;
end;

procedure TFMainMenu.MudaLogin1Click(Sender: TObject);
begin
  DM.Login (1);
  VerificaMenu;
end;

procedure TFMainMenu.Sair1Click(Sender: TObject);
begin
  DM.SCServer.Close;
  DMImpr.SCServerImpr.Close;
  DMLista.SCServerLista.Close;
  close;
end;

procedure TFMainMenu.VerificaAcesso (Programa: String; var Visualizar, Criar, Editar, Apagar: Boolean);
begin
  Visualizar := False;
  Criar      := False;
  Editar     := False;
  Apagar     := False;
  DMLista.cdsListaAcessos.Open;
//  DMLista.SCServerLista.Close;
  if DMLista.cdsListaAcessos.Locate('NOME_PROGRAMA;USUARIO_SQ', VarArrayOf ([Programa, DM.useq]), []) then
  begin
    Visualizar := DMLista.cdsListaAcessosVISUALIZAR.AsString = 'S';
    Criar      := DMLista.cdsListaAcessosCRIAR.AsString = 'S';
    Editar     := DMLista.cdsListaAcessosEDITAR.AsString = 'S';
    Apagar     := DMLista.cdsListaAcessosAPAGAR.AsString = 'S';
  end;
  DMLista.cdsListaAcessos.Close;
end;

procedure TFMainMenu.AbreForm2 (Form: TForm);
var
  Visualizar, Criar, Editar, Apagar: Boolean;
begin
  VerificaAcesso (Form.Name, Visualizar, Criar, Editar, Apagar);
  if Visualizar then
    Form.ShowModal
  else Showmessage ('Você não tem permissões para acessar esta tela!');
end;

function TFMainMenu.AbreForm (Form: TFCadastrarListaComum): TTabSheet;
var
  i1: Integer;
  Sheet: TWinControl;
  Visualizar, Criar, Editar, Apagar: Boolean;
begin
  Result := nil;
  Sheet := nil;
  VerificaAcesso (Form.Name, Visualizar, Criar, Editar, Apagar);
  if Visualizar then
  begin
    if Form <> nil then for i1 := 1 to (Screen.FormCount-1) do
    begin
      if Screen.Forms[i1].Name = Form.Name then Sheet := Form.Parent;
    end;
    if Sheet <> nil then
    begin
      Sheet.Show;
    end
    else begin
      Result := TTabSheet.Create (self);
      Result.Caption := Form.Caption;
      Result.PageControl := PageControl1;
      PageControl1.ActivePageIndex := Result.TabIndex;
      Form.Parent := Result;
      Form.Visible := True;
    end;
    Form.SetFocus;
    Form.sbFiltro.Click;
    Form.Visualizar := Visualizar;
    Form.Criar := Criar;
    Form.Editar := Editar;
    Form.Apagar := Apagar;
    Form.sbNovo.Enabled   := Criar;
    Form.sbEditar.Enabled := Editar or Visualizar;
    Form.sbApagar.Enabled := Apagar;
  end
  else Showmessage ('Você não tem permissões para acessar esta tela!');
  if Form = FManutencaoListaNFiscaisDemonstracao then
  begin
    Form.sbNovo.Enabled := False;
    Form.sbApagar.Enabled := False;
  end;
  if Form = FCadastrarListaNfiscais then
  begin
    Form.sbApagar.Enabled := False;
    Form.SpeedButton1.Enabled := Editar;
    Form.SpeedButton2.Enabled := Editar;
  end;
  if Form = FCadastrarListaMovimentacoes then
  begin
    Form.sbApagar.Enabled := False;
  end;
  if Form = FCadastrarListaDuplicatas then
  begin
    Form.sbNovo.Enabled := False;
  end;
end;

procedure TFMainMenu.Clientes1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaClientes);
end;

procedure TFMainMenu.CondicoesdePagamento1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaCondPagto);
end;

procedure TFMainMenu.Naturezas1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaNaturezas);
end;

procedure TFMainMenu.Pedidos1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaPedidos);
end;

procedure TFMainMenu.Produtos1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaProdutos);
end;

procedure TFMainMenu.NCM1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaNCM);
end;

procedure TFMainMenu.Pedidos2Click(Sender: TObject);
begin
  FImprimirPedidos.edData.Text := FormatDateTime ('dd/mm/yyyy', Date-10);
  FImprimirPedidos.btnPesquisar.OnClick (FMainMenu);
  AbreForm2(FImprimirPedidos);
end;

procedure TFMainMenu.Usuarios1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaUsuarios);
  VerificaMenu;
end;

procedure TFMainMenu.Transportadoras1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaTransportadoras);
end;

procedure TFMainMenu.Parametros2Click(Sender: TObject);
var
  Mensagem, senha: string;
  cdsLista: TClientDataSet;
begin
  DMLista.AtualizaVariaveis (cdsLista);
  senha := cdsLista.FieldByName ('SENHA').Value;
  FCadastrarFormEmpresas.edCodigo.Text          := cdsLista.FieldByName ('CODIGO_EMPRESA').AsString;
  FCadastrarFormEmpresas.edRazao.Text           := cdsLista.FieldByName ('NOME_EMPRESA').AsString;
  FCadastrarFormEmpresas.edSenha.Text           := cdsLista.FieldByName ('SENHA').AsString;
  FCadastrarFormEmpresas.edEstado.Text          := cdsLista.FieldByName ('ESTADO').AsString;
  FCadastrarFormEmpresas.edUNfiscal.Text        := cdsLista.FieldByName ('NUMERO_NFISCAL').AsString;
  FCadastrarFormEmpresas.edUPedido.Text         := cdsLista.FieldByName ('NUMERO_PEDIDO').AsString;
  FCadastrarFormEmpresas.edUAssistencia.Text    := cdsLista.FieldByName ('NUMERO_ASSISTENCIA').AsString;
  FCadastrarFormEmpresas.edICMSProd1.Text       := cdsLista.FieldByName ('ALIQ_ICMS_PROD1').AsString;
  FCadastrarFormEmpresas.edICMSPec1.Text        := cdsLista.FieldByName ('ALIQ_ICMS_PEC1').AsString;
  FCadastrarFormEmpresas.edSTribut.Text         := cdsLista.FieldByName ('STRIBUT').AsString;
  FCadastrarFormEmpresas.edDiasDemonstr.Text    := cdsLista.FieldByName ('DIAS_DEMONSTRACAO').AsString;
  FCadastrarFormEmpresas.cbAltDtPedido.Checked  := cdsLista.FieldByName ('ALT_DATA_PEDIDO').AsString       = 'S';
  FCadastrarFormEmpresas.cbAltDtNfiscal.Checked := cdsLista.FieldByName ('ALT_DTEMISSAO_NFISCAL').AsString = 'S';
  FCadastrarFormEmpresas.cbAltNrPedido.Checked  := cdsLista.FieldByName ('ALT_NR_PEDIDO').AsString         = 'S';
  FCadastrarFormEmpresas.cbAltNrNfiscal.Checked := cdsLista.FieldByName ('ALT_NR_NFISCAL').AsString        = 'S';
  FCadastrarFormEmpresas.edPIS.Text             := cdsLista.FieldByName ('ALIQ_PIS').AsString;
  FCadastrarFormEmpresas.edCOFINS.Text          := cdsLista.FieldByName ('ALIQ_COFINS').AsString;
  FCadastrarFormEmpresas.edISS.Text             := cdsLista.FieldByName ('ALIQ_ISS').AsString;
  FCadastrarFormEmpresas.edClassificacao.Text   := cdsLista.FieldByName ('ULTIMA_CLASSIFICACAO').AsString;
  if FCadastrarFormEmpresas.ShowModal = mrOk then
  try
    if FCadastrarFormEmpresas.edICMSPec1.Text     = '' then
      FCadastrarFormEmpresas.edICMSPec1.Text     := '0';
    if FCadastrarFormEmpresas.edPIS.Text          = '' then
      FCadastrarFormEmpresas.edPIS.Text          := '0';
    if FCadastrarFormEmpresas.edCOFINS.Text       = '' then
      FCadastrarFormEmpresas.edCOFINS.Text       := '0';
    if FCadastrarFormEmpresas.edISS.Text          = '' then
      FCadastrarFormEmpresas.edISS.Text          := '0';
    if FCadastrarFormEmpresas.edICMSProd1.Text    = '' then
      FCadastrarFormEmpresas.edICMSProd1.Text    := '0';
    if FCadastrarFormEmpresas.edUNfiscal.Text     = '' then
      FCadastrarFormEmpresas.edUNfiscal.Text     := '0';
    if FCadastrarFormEmpresas.edUPedido.Text      = '' then
      FCadastrarFormEmpresas.edUPedido.Text      := '0';
    if FCadastrarFormEmpresas.edUAssistencia.Text = '' then
      FCadastrarFormEmpresas.edUAssistencia.Text := '0';

    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('EMPRESAS', False, 0,
      VarArrayOf ([
        FCadastrarFormEmpresas.edCodigo.Text,
        FCadastrarFormEmpresas.edRazao.Text,
        FCadastrarFormEmpresas.edSenha.Text,
        FCadastrarFormEmpresas.edEstado.Text,
        FCadastrarFormEmpresas.edUNfiscal.Text,
        FCadastrarFormEmpresas.edUPedido.Text,
        FCadastrarFormEmpresas.edUAssistencia.Text,
        FCadastrarFormEmpresas.edICMSProd1.Text,
        FCadastrarFormEmpresas.edICMSPec1.Text,
        FCadastrarFormEmpresas.edSTribut.Text,
        FCadastrarFormEmpresas.edDiasDemonstr.Text,
        FCadastrarFormEmpresas.cbAltDtPedido.Checked,
        FCadastrarFormEmpresas.cbAltDtNfiscal.Checked,
        FCadastrarFormEmpresas.cbAltNrPedido.Checked,
        FCadastrarFormEmpresas.cbAltNrNFiscal.Checked,
        FCadastrarFormEmpresas.edPIS.Text,
        FCadastrarFormEmpresas.edCOFINS.Text,
        FCadastrarFormEmpresas.edISS.Text]));
    if Mensagem <> '' then
    begin
      Showmessage ('Registro nao gravado: ' + Mensagem);
      DM.EnviarEmail ('EMPRESAS', 'GRAVAR', Mensagem, False);
    end
    else DMLista.AtualizaVariaveis (cdsLista);
  finally
//    DM.SCServer.Close;
  end;
end;

procedure TFMainMenu.NotasFiscais1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaNfiscais);
end;

procedure TFMainMenu.Estoque1Click(Sender: TObject);
begin
  AbreForm2(FImprimirEstoque);
end;

procedure TFMainMenu.Movimentacoes1Click(Sender: TObject);
begin
  AbreForm (FCadastrarListaMovimentacoes)
end;

procedure TFMainMenu.NotasFiscais2Click(Sender: TObject);
begin
  AbreForm2(FImprimirNfiscais);
end;

procedure TFMainMenu.Duplicatas1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaDuplicatas);
end;

procedure TFMainMenu.Historico1Click(Sender: TObject);
begin
  AbreForm2(FImprimirClientesHist);
  DMImpr.cdsImprHistClientes3.Close;
  DMImpr.cdsImprHistClientes2.Close;
  DMImpr.cdsImprHistClientes1.Close;
//  DMImpr.SCServerImpr.Close;
end;

procedure TFMainMenu.NotasFiscais3Click(Sender: TObject);
begin
  Abreform (FManutencaoListaNfiscaisDemonstracao);
end;

procedure TFMainMenu.PorEstado1Click(Sender: TObject);
begin
  AbreForm2(FImprimirClientesUF);
  DMImpr.cdsImprClientesUF.Close;
//  DMImpr.SCServerImpr.Close;
end;

procedure TFMainMenu.Demonstrao1Click(Sender: TObject);
begin
  AbreForm2(FImprimirDemonstracaoPrev);
end;

procedure TFMainMenu.Duplicatas2Click(Sender: TObject);
begin
  AbreForm2(FImprimirDuplicatas);
end;

procedure TFMainMenu.Atualizacoes1Click(Sender: TObject);
begin
  Sair1.Click;
  WinExec ('Update PrHandy', 0);
end;

procedure TFMainMenu.FormCreate(Sender: TObject);
begin
  PJVersionInfo1.FileName := Application.ExeName;
  DM.verinfo := PJVersionInfo1.FileVersion;
  FSplash.StatusBar1.Panels[1].Text := 'Versão ' + DM.verinfo;
  FSplash.Label3.Caption := Application.Title;
end;

procedure TFMainMenu.Assistencias1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaAssistencias);
end;

procedure TFMainMenu.Modelos1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaModelos);
end;

procedure TFMainMenu.Vendedores1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaVendedores);
end;

procedure TFMainMenu.FormActivate(Sender: TObject);
var
  i1, i2: integer;
begin
  i2 := 1;
  for i1 := 1 to 255 do
  begin
    DM.programas[i2] := '';
    DM.captions[i2]  := '';
    if i1 < Application.ComponentCount then
    try
      DM.programas[i2] := Application.Components[i1].Name;
      DM.captions[i2]  := TForm (Application.Components[i1]).Caption;
      inc (i2);
    except
      DM.captions[i1]  := '';
    end;
  end;
end;

procedure TFMainMenu.Acessos1Click(Sender: TObject);
begin
  AbreForm(FCadastrarListaAcessos);
end;

procedure TFMainMenu.RelacaodeVendas1Click(Sender: TObject);
begin
  DMLista.cdsListaVendedores.Open;
//  DMLista.SCServerLista.Close;
  FImprimirNFiscaisVend.DBLookupComboBox1.KeyValue := DMLista.cdsListaVendedoresVENDEDOR_SQ.Value;
  FImprimirNFiscaisVend.dtpInicio.Date := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  FImprimirNFiscaisVend.dtpFim.Date    := Date;
  AbreForm2(FImprimirNFiscaisVend);
  DMLista.cdsListaVendedores.Close;
//  DMImpr.SCServerImpr.Close;
end;

procedure TFMainMenu.FechamentodeNotas1Click(Sender: TObject);
begin
  FImprimirNFiscaisFech.dtpInicio.Date := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  FImprimirNFiscaisFech.dtpFim.Date    := Date;
  AbreForm2(FImprimirNFiscaisFech);
//  DMImpr.SCServerImpr.Close;
end;

procedure TFMainMenu.Classificacao1Click(Sender: TObject);
begin
  AbreForm (FCadastrarListaClassificacao);
end;

procedure TFMainMenu.Assistencias2Click(Sender: TObject);
begin
  AbreForm2(FImprimirAssistencias);
end;

procedure TFMainMenu.NotasFiscaisdeServico1Click(Sender: TObject);
begin
  Abreform (FCadastrarListaNFServicos);
end;

end.
