


unit UMainMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, ExtCtrls, ComCtrls, Variants, PJVersionInfo, UCadastrarListaComum,
  DBClient, Buttons, RzBHints, DB, StdCtrls;

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
    Duplicatas1: TMenuItem;
    Historico1: TMenuItem;
    NotasFiscais3: TMenuItem;
    PorEstado1: TMenuItem;
    Demonstrao1: TMenuItem;
    PJVersionInfo1: TPJVersionInfo;
    Duplicatas2: TMenuItem;
    Atualizacoes1: TMenuItem;
    RMA1: TMenuItem;
    Modelos1: TMenuItem;
    Vendedores1: TMenuItem;
    Acessos1: TMenuItem;
    RelacaodeVendas1: TMenuItem;
    FechamentodeNotas1: TMenuItem;
    Classificacao1: TMenuItem;
    Assistencias2: TMenuItem;
    NotasFiscaisdeServico1: TMenuItem;
    NotasFiscaisdeEntrada1: TMenuItem;
    SugestaodeCompras1: TMenuItem;
    Consultar1: TMenuItem;
    Contatos1: TMenuItem;
    NrSerie1: TMenuItem;
    Conteiner1: TMenuItem;
    Conteiners1: TMenuItem;
    MalaDireta1: TMenuItem;
    Novos1: TMenuItem;
    Agenda1: TMenuItem;
    ProdutosFaltantes1: TMenuItem;
    Clientes3: TMenuItem;
    sbAgenda: TSpeedButton;
    RzBalloonHints1: TRzBalloonHints;
    ipodecliente1: TMenuItem;
    Comisso1: TMenuItem;
    Contasapagar1: TMenuItem;
    ContasapagarManuteno1: TMenuItem;
    NotasFiscaisEletrnicas1: TMenuItem;
    Estados1: TMenuItem;
    Pedidossemestoque1: TMenuItem;
    Fornecedor1: TMenuItem;
    ContaBanco1: TMenuItem;
    ExportarRMA1: TMenuItem;
    Movimentaodeestoque1: TMenuItem;
    EstoqueNmerodesrie1: TMenuItem;
    CartaCorrecao1: TMenuItem;
    RelacaodeVendaAcumulado1: TMenuItem;
    RegistrarVenda1: TMenuItem;
    Balanco1: TMenuItem;
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
    procedure Duplicatas1Click(Sender: TObject);
    procedure Historico1Click(Sender: TObject);
    procedure NotasFiscais3Click(Sender: TObject);
    procedure PorEstado1Click(Sender: TObject);
    procedure Demonstrao1Click(Sender: TObject);
    procedure Duplicatas2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RMA1Click(Sender: TObject);
    procedure Modelos1Click(Sender: TObject);
    procedure Vendedores1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Acessos1Click(Sender: TObject);
    procedure RelacaodeVendas1Click(Sender: TObject);
    procedure FechamentodeNotas1Click(Sender: TObject);
    procedure Classificacao1Click(Sender: TObject);
    procedure Assistencias2Click(Sender: TObject);
    procedure NotasFiscaisdeServico1Click(Sender: TObject);
    procedure NotasFiscaisdeEntrada1Click(Sender: TObject);
    procedure SugestaodeCompras1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NrSerie1Click(Sender: TObject);
    procedure Contatos1Click(Sender: TObject);
    procedure Conteiner1Click(Sender: TObject);
    procedure Conteiners1Click(Sender: TObject);
    procedure MalaDireta1Click(Sender: TObject);
    procedure Novos1Click(Sender: TObject);
    procedure RMA2Click(Sender: TObject);
    procedure Agenda1Click(Sender: TObject);
    procedure ProdutosFaltantes1Click(Sender: TObject);
    procedure Clientes3Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure sbAgendaClick(Sender: TObject);
    procedure ipodecliente1Click(Sender: TObject);
    procedure Comisso1Click(Sender: TObject);
    procedure Contasapagar1Click(Sender: TObject);
    procedure ContasapagarManuteno1Click(Sender: TObject);
    procedure NotasFiscaisEletrnicas1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Pedidossemestoque1Click(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure ContaBanco1Click(Sender: TObject);
    procedure ExportarRMA1Click(Sender: TObject);
    procedure Movimentaodeestoque1Click(Sender: TObject);
    procedure EstoqueNmerodesrie1Click(Sender: TObject);
    procedure CartaCorrecao1Click(Sender: TObject);
    procedure RelacaodeVendaAcumulado1Click(Sender: TObject);
    procedure RegistrarVenda1Click(Sender: TObject);
    procedure Balanco1Click(Sender: TObject);
  private
  public
    procedure VerificaMenu ();
    procedure AbreForm2 (Form: TForm);

    function AbreForm (Form: TFCadastrarListaComum): TTabSheet;
  end;

var
  FMainMenu: TFMainMenu;

implementation

uses UDM, UCadastrarListaClientes, UCadastrarListaCondPagto,
  UCadastrarListaNaturezas, UCadastrarListaPedidos,
  UCadastrarListaProdutos, UCadastrarListaNCM, UImprimirPedidos,
  UCadastrarFormEmpresas, UCadastrarListaNfiscais, UImprimirEstoque,
  UCadastrarListaMovimentacoes, 
  UCadastrarListaDuplicatas, UImprimirClientesUF,
  UManutencaoListaNfiscaisDemonstracao,
  UImprimirDemonstracaoPrev, UImprimirDuplicatas, USplash,
  UCadastrarListaRMA, UCadastrarListaModelos,
  UCadastrarListaAcessos, UImprimirClientesHist,
  UImprimirNfiscaisVend, UImprimirNfiscaisFech,
  UCadastrarListaClassificacao, UImprimirAssistencias,
  UCadastrarListaNFServicos, UCadastrarListaNfEntradas, USugestaoCompras,
  UConsultarNfiscaisSerie, UConsultarContatos, UCadastrarListaConteiner,
  UConsultarConteiners, UImprimirMalaDireta, UImprimirClientesNovos,
  Registry, UCadastrarListaAgenda,
  UCadastrarListaProdutosFaltantes, UConsultarListaClientes,
  uVisualizarAgenda, UCadastrarListaTipoCliente,
  UImprimirComissao, uCadastrarListaContasPagar,
  uCadastrarListaContasPagarAuto, uImprimirNFe, uCadastrarListaEstados,
  Vendedor, Usuario, Transportadora, uConsultarPedidosSemEstoque,
  UExportarRMA, UImprimirRMA, uCadastrarListaFornecedor,
  uCadastrarListaContaBanco, Empresa, Agenda, Cadastro, Nfiscal,
  UImprimirMovimentacao, uConsultarNumeroSerie,
  UCadastrarListaCartaCorrecao, UImprimirVendaAcumulado, URegistrarVenda,
  UCadastrarListaBalanco;

{$R *.DFM}

procedure TFMainMenu.VerificaMenu ();
begin
  StatusBar1.Panels[0].Text := DM.unom;
  StatusBar1.Panels[1].Text := 'Acesso - ' + FormatDateTime ('dd/mm/yyyy', Date) + FormatDateTime ('  hh:nn', Time);
  StatusBar1.Panels[2].Text := 'Limite - '    + FormatDateTime ('dd/mm/yyyy', DM.dtsenha);
  StatusBar1.Panels[3].Text := 'Versão - '    + DM.verinfo;
end;

procedure TFMainMenu.MudaLogin1Click(Sender: TObject);
begin
  DM.Login;
  VerificaMenu;
end;

procedure TFMainMenu.Sair1Click(Sender: TObject);
begin
  close;
end;

procedure TFMainMenu.AbreForm2 (Form: TForm);
var
  Visualizar, Criar, Editar, Apagar: Boolean;
begin
  DM.VerificaAcesso (Form, Visualizar, Criar, Editar, Apagar);
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
  DM.VerificaAcesso (Form, Visualizar, Criar, Editar, Apagar);

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
      if Form = FCadastrarListaNfiscais then
        Form.FiltroInicial := 'DTEMISSAO_NFISCAL > ''' + FormatDateTime('yyyy-mm-dd', Date-30) + ''''
      else if Form = FCadastrarListaPedidos then
        Form.FiltroInicial := 'DATA_PEDIDO > ''' + FormatDateTime('yyyy-mm-dd', Date-30) + ''''
      else if Form = FCadastrarListaMovimentacoes then
        Form.FiltroInicial := 'DATA > ''' + FormatDateTime('yyyy-mm-dd', Date-30) + '''';
    end;
    if Form = FCadastrarListaNfiscais then
    begin
      Form.SpeedButton1.Enabled := Editar;
      Form.SpeedButton2.Enabled := Editar;
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
end;

procedure TFMainMenu.Clientes1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaClientes) then
    FCadastrarListaClientes := TFCadastrarListaClientes.Create(Self);
  Abreform (FCadastrarListaClientes);
end;

procedure TFMainMenu.CondicoesdePagamento1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaCondPagto) then
    FCadastrarListaCondPagto := TFCadastrarListaCondPagto.Create(Self);
  Abreform (FCadastrarListaCondPagto);
end;

procedure TFMainMenu.Naturezas1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaNaturezas) then
    FCadastrarListaNaturezas := TFCadastrarListaNaturezas.Create(Self);
  Abreform (FCadastrarListaNaturezas);
end;

procedure TFMainMenu.Pedidos1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaPedidos) then
    FCadastrarListaPedidos := TFCadastrarListaPedidos.Create(Self);
  Abreform (FCadastrarListaPedidos);
end;

procedure TFMainMenu.Produtos1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaProdutos) then
    FCadastrarListaProdutos := TFCadastrarListaProdutos.Create(Self);
  Abreform (FCadastrarListaProdutos);
end;

procedure TFMainMenu.NCM1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaNCM) then
    FCadastrarListaNCM := TFCadastrarListaNCM.Create(Self);
  Abreform (FCadastrarListaNCM);
end;

procedure TFMainMenu.Pedidos2Click(Sender: TObject);
begin
  try
    FImprimirPedidos := TFImprimirPedidos.Create(Self);
    AbreForm2(FImprimirPedidos);
  finally
    FreeAndNil(FImprimirPedidos);
  end;
end;

procedure TFMainMenu.Usuarios1Click(Sender: TObject);
begin
  if not Assigned(FListaUsuarios) then
    FListaUsuarios := TFListaUsuarios.Create(Self);
  Abreform (FListaUsuarios);
  VerificaMenu;
end;

procedure TFMainMenu.Transportadoras1Click(Sender: TObject);
begin
  if not Assigned(FListaTransportadoras) then
    FListaTransportadoras := TFListaTransportadoras.Create(Self);
  Abreform (FListaTransportadoras);
end;

procedure TFMainMenu.Parametros2Click(Sender: TObject);
var
  senha: string;
begin
  try
    empresaSelecionada.Atualizar;
    senha := empresaSelecionada.senha;
    FCadastrarFormEmpresas := TFCadastrarFormEmpresas.Create(Self);
    FCadastrarFormEmpresas.ShowModal;
  finally
    FreeAndNil(FCadastrarFormEmpresas);
  end;
end;

procedure TFMainMenu.NotasFiscais1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaNfiscais) then
    FCadastrarListaNfiscais := TFCadastrarListaNfiscais.Create(Self);
  Abreform (FCadastrarListaNfiscais);
end;

procedure TFMainMenu.Estoque1Click(Sender: TObject);
begin
  try
    FImprimirEstoque := TFImprimirEstoque.Create(Self);
    AbreForm2(FImprimirEstoque);
  finally
    FreeAndNil(FImprimirEstoque);
  end;
end;

procedure TFMainMenu.Movimentacoes1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaMovimentacoes) then
    FCadastrarListaMovimentacoes := TFCadastrarListaMovimentacoes.Create(Self);
  AbreForm (FCadastrarListaMovimentacoes)
end;

procedure TFMainMenu.Duplicatas1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaDuplicatas) then
    FCadastrarListaDuplicatas := TFCadastrarListaDuplicatas.Create(Self);
  Abreform (FCadastrarListaDuplicatas);
end;

procedure TFMainMenu.Historico1Click(Sender: TObject);
begin
  try
    FImprimirClientesHist := TFImprimirClientesHist.Create(Self);
    AbreForm2(FImprimirClientesHist);
  finally
    FreeAndNil(FImprimirClientesHist);
  end;
end;

procedure TFMainMenu.NotasFiscais3Click(Sender: TObject);
begin
  if not Assigned(FManutencaoListaNFiscaisDemonstracao) then
    FManutencaoListaNFiscaisDemonstracao := TFManutencaoListaNFiscaisDemonstracao.Create(Self);
  Abreform (FManutencaoListaNfiscaisDemonstracao);
end;

procedure TFMainMenu.PorEstado1Click(Sender: TObject);
begin
  try
    FImprimirClientesUF := TFImprimirClientesUF.Create(Self);
    AbreForm2(FImprimirClientesUF);
  finally
    FreeAndNil(FImprimirClientesUF);
  end;
end;

procedure TFMainMenu.Demonstrao1Click(Sender: TObject);
begin
  try
    FImprimirDemonstracaoPrev := TFImprimirDemonstracaoPrev.Create(Self);
    AbreForm2(FImprimirDemonstracaoPrev);
  finally
    FreeAndNil(FImprimirDemonstracaoPrev);
  end;
end;

procedure TFMainMenu.Duplicatas2Click(Sender: TObject);
begin
  try
    FImprimirDuplicatas := TFImprimirDuplicatas.Create(Self);
    AbreForm2(FImprimirDuplicatas);
  finally
    FreeAndNil(FImprimirDuplicatas);
  end;
end;

procedure TFMainMenu.FormCreate(Sender: TObject);
var
  host: String;
  reg: TRegistry;
begin
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
      host := Reg.ReadString ('HostIP');
//    host := 'serpa.ddns.com.br';

    Reg.CloseKey;
  finally
    FreeAndNil(Reg);
  end;
  PJVersionInfo1.FileName := Application.ExeName;
  DM.verinfo := PJVersionInfo1.FileVersion;
  DM.SCServer.Host := host;
  DM.SCServer.Open;
{
  Mensagem := DM.SCServer.AppServer.VerificaVersao(DM.verinfo);
  if mensagem <> '' then
  begin
    ShowMessage(mensagem);
    DM.IdTrivialFTP1.Host := DM.host_email;
    DM.IdTrivialFTP1.Active := True;
    DM.IdTrivialFTP1.Get('PrUpdate.exe', 'Update.exe');
    DM.IdTrivialFTP1.Active := False;
    WinExec ('Update.exe', SW_MINIMIZE);
    Halt;
  end;
}
  FSplash.StatusBar1.Panels[2].Text := 'Versão ' + DM.verinfo;
  FSplash.Label3.Caption := Application.Title;

  //colocando o botao no statusbar
  StatusBar1.Panels[4].Style := psOwnerDraw;
  sbAgenda.Parent := StatusBar1;

  Application.UpdateFormatSettings := True;
  DateSeparator := Char('/');
  ShortDateFormat := 'dd/mm/yyyy';
  Application.UpdateFormatSettings := False;
end;

procedure TFMainMenu.RMA1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaRMA) then
    FCadastrarListaRMA := TFCadastrarListaRMA.Create(Self);
  Abreform (FCadastrarListaRMA);
end;

procedure TFMainMenu.Modelos1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaModelos) then
    FCadastrarListaModelos := TFCadastrarListaModelos.Create(Self);
  Abreform (FCadastrarListaModelos);
end;

procedure TFMainMenu.Vendedores1Click(Sender: TObject);
begin
  if not Assigned(FListaVendedores) then
    FListaVendedores := TFListaVendedores.Create(Self);
  Abreform(FListaVendedores);
end;

procedure TFMainMenu.FormActivate(Sender: TObject);
  procedure Adiciona(s1, s2: String);
  begin
    DM.programas.Add(s1);
    DM.programas.Add(s2);
  end;
begin
  DM.programas := TStringList.Create;
  Adiciona('FCadastrarFormEmpresas', 'Cadastrar empresas');
  Adiciona('FCadastrarListaAcessos', 'Cadastrar acessos');
  Adiciona('FCadastrarListaRMA', 'Cadastrar RMA');
  Adiciona('FCadastrarListaClassificacao', 'Cadastrar classificacao');
  Adiciona('FCadastrarListaClientes', 'Cadastrar clientes');
  Adiciona('FCadastrarListaCondPagto', 'Cadastrar condPagto');
  Adiciona('FCadastrarListaDuplicatas', 'Cadastrar duplicatas');
  Adiciona('FCadastrarListaEstados', 'Cadastrar estados');
  Adiciona('FCadastrarListaModelos', 'Cadastrar modelos');
  Adiciona('FCadastrarListaMovimentacoes', 'Cadastrar movimentacoes');
  Adiciona('FCadastrarListaNaturezas', 'Cadastrar naturezas');
  Adiciona('FCadastrarListaNfiscais', 'Cadastrar nfiscais');
  Adiciona('FCadastrarListaNFServicos', 'Cadastrar nf servicos');
  Adiciona('FCadastrarListaNCM', 'Cadastrar NCM');
  Adiciona('FCadastrarListaPedidos', 'Cadastrar pedidos');
  Adiciona('FCadastrarListaProdutos', 'Cadastrar produtos');
  Adiciona('FCadastrarListaTransportadoras', 'Cadastrar transportadoras');
  Adiciona('FCadastrarListaUsuarios', 'Cadastrar usuarios');
  Adiciona('FCadastrarListaVendedores', 'Cadastrar vendedores');
  Adiciona('FClassificaClientes', 'Classifica clientes');
  Adiciona('FImportaEntradas', 'Importa entradas');
  Adiciona('FManutencaoListaNfiscaisDemonstracao', 'Manutencao nfiscais demonstração');
  Adiciona('FCadastrarListaNfEntradas', 'Cadastrar nf entradas');
  Adiciona('FCadastrarNfiscaisSerie', 'Cadastrar nfiscais serie');
  Adiciona('FCadastrarListaConteiner', 'Cadastrar conteiner');
  Adiciona('fDuplicaPedido', 'Duplica pedido');
  Adiciona('FTransferenciaEntrada', 'Transferencia entrada');
  Adiciona('FSugestaoCompras', 'Sugestao compras');
  Adiciona('FConsultarContatos', 'Consultar contatos');
  Adiciona('FConsultarConteiners', 'Consultar conteiners');
  Adiciona('FConsultarAlteracoes', 'Consultar alteracoes');
  Adiciona('FCadastrarListaAgenda', 'Cadastrar agenda');
  Adiciona('FCadastrarListaProdutosFaltantes', 'Cadastrar produtos faltantes');
  Adiciona('FConsultarListaClientes', 'Consultar clientes');
  Adiciona('FCadastrarListaLinha', 'Cadastrar linha');
  Adiciona('FCadastrarListaTipoCliente', 'Tipo de cliente');
  Adiciona('FCadastrarListaContasPagar', 'Contas a pagar');
  Adiciona('FCadastrarListaContasPagarAuto', 'Contas a pagar - Manutenção');
  Adiciona('FConsultarPedidosSemEstoque', 'Pedidos sem estoque');
  Adiciona('FCadastrarListaFornecedor', 'Fornecedor');
  Adiciona('FCadastrarListaContaBanco', 'ContaBanco');
  Adiciona('FCadastrarListaEstoque', 'Estoque');
  Adiciona('FCadastrarListaCartaCorrecao', 'Carta de correção');
  Adiciona('FRegistrarVenda', 'Registrar Venda');
  Adiciona('FCadastrarListaBalanco', 'Balanco do estoque');

  Adiciona('FConsultarNFiscaisSerie', 'Consultar nfiscais serie');
  Adiciona('FConsultarNumeroSerie', 'Consulta número de série');
  Adiciona('FImprimirAssistencias', 'Imprimir assistencias');
  Adiciona('FImprimirClientesUF', 'Imprimir clientes UF');
  Adiciona('FImprimirClientesHist', 'Imprimir clientes Histórico');
  Adiciona('FImprimirDemonstracaoPrev', 'Imprimir demonstracao prévia');
  Adiciona('FImprimirEstoque', 'Imprimir estoque');
  Adiciona('FImprimirDuplicatas', 'Imprimir duplicatas');
  Adiciona('FImprimirNFiscais', 'Imprimir nfiscais');
  Adiciona('fImprimirNFe', 'Imprimir NF-e');
  Adiciona('FImprimirNFiscaisVend', 'Imprimir nfiscais vendas');
  Adiciona('FImprimirVendaAcumulado', 'Imprimir venda acumulada');
  Adiciona('FImprimirNfiscaisFech', 'Imprimir nfiscais fechamento');
  Adiciona('FImprimirPedidos', 'Imprimir pedidos');
  Adiciona('FImprimirMalaDireta', 'Imprimir mala direta');
  Adiciona('FImprimirClientesNovos', 'Imprimir clientes novos');
  Adiciona('FExportarRMA', 'Exportar RMA');
  Adiciona('FImprimirRMA', 'Imprimir RMA');
  Adiciona('FImprimirComissao', 'Imprimir Comissão');
  Adiciona('FImprimirMovimentacao', 'Imprimir movimentação');
end;

procedure TFMainMenu.Acessos1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaAcessos) then
    FCadastrarListaAcessos := TFCadastrarListaAcessos.Create(Self);
  AbreForm(FCadastrarListaAcessos);
end;

procedure TFMainMenu.RelacaodeVendas1Click(Sender: TObject);
begin
  try
    FImprimirNFiscaisVend := TFImprimirNFiscaisVend.Create(Self);
    AbreForm2(FImprimirNFiscaisVend);
  finally
    FreeAndNil(FImprimirNFiscaisVend);
  end;
end;

procedure TFMainMenu.FechamentodeNotas1Click(Sender: TObject);
begin
  try
    FImprimirNFiscaisFech := TFImprimirNFiscaisFech.Create(Self);
    AbreForm2(FImprimirNFiscaisFech);
  finally
    FreeAndNil(FImprimirNFiscaisFech);
  end;
end;

procedure TFMainMenu.Classificacao1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaClassificacao) then
    FCadastrarListaClassificacao := TFCadastrarListaClassificacao.Create(Self);
  AbreForm (FCadastrarListaClassificacao);
end;

procedure TFMainMenu.Assistencias2Click(Sender: TObject);
begin
  try
    FImprimirAssistencias := TFImprimirAssistencias.Create(Self);
    AbreForm2(FImprimirAssistencias);
  finally
    FreeAndNil(FImprimirAssistencias);
  end;
end;

procedure TFMainMenu.NotasFiscaisdeServico1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaNFServicos) then
    FCadastrarListaNFServicos := TFCadastrarListaNFServicos.Create(Self);
  Abreform (FCadastrarListaNFServicos);
end;

procedure TFMainMenu.NotasFiscaisdeEntrada1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaNfEntradas) then
    FCadastrarListaNfEntradas := TFCadastrarListaNfEntradas.Create(Self);
  Abreform (FCadastrarListaNfEntradas);
end;

procedure TFMainMenu.SugestaodeCompras1Click(Sender: TObject);
begin
  try
    FSugestaoCompras := TFSugestaoCompras.Create(Self);
    AbreForm2(FSugestaoCompras);
  finally
    FreeAndNil(FSugestaoCompras);
  end;
end;

procedure TFMainMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DM.SCServer.Connected := False;
end;

procedure TFMainMenu.NrSerie1Click(Sender: TObject);
begin
  try
    FConsultarNfiscaisSerie := TFConsultarNFiscaisSerie.Create(Self);
    AbreForm2(FConsultarNfiscaisSerie);
  finally
    FreeAndNil(FConsultarNFiscaisSerie);
  end;
end;

procedure TFMainMenu.Contatos1Click(Sender: TObject);
begin
  try
    FConsultarContatos := TFConsultarContatos.Create(Self);
    AbreForm2(FConsultarContatos);
  finally
    FreeAndNil(FConsultarContatos);
  end;
end;

procedure TFMainMenu.Conteiner1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaConteiner) then
    FCadastrarListaConteiner := TFCadastrarListaConteiner.Create(Self);
  AbreForm(FCadastrarListaConteiner);
end;

procedure TFMainMenu.Conteiners1Click(Sender: TObject);
begin
  try
    FConsultarConteiners := TFConsultarConteiners.Create(Self);
    AbreForm2(FConsultarConteiners);
  finally
    FreeAndNil(FConsultarConteiners);
  end;
end;

procedure TFMainMenu.MalaDireta1Click(Sender: TObject);
begin
  try
    FImprimirMalaDireta := TFImprimirMalaDireta.Create(Self);
    AbreForm2(FImprimirMalaDireta);
  finally
    FreeAndNil(FImprimirMalaDireta);
  end;
end;

procedure TFMainMenu.Novos1Click(Sender: TObject);
begin
  try
    FImprimirClientesNovos := TFImprimirClientesNovos.Create(Self);
    AbreForm2(FImprimirClientesNovos);
  finally
    FreeAndNil(FImprimirClientesNovos);
  end;
end;

procedure TFMainMenu.RMA2Click(Sender: TObject);
begin
  try
    FImprimirRMA := TFImprimirRMA.Create(Self);
    AbreForm2(FImprimirRMA);
  finally
    FreeAndNil(FImprimirRMA);
  end;
end;

procedure TFMainMenu.Agenda1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaAgenda) then
    FCadastrarListaAgenda := TFCadastrarListaAgenda.Create(Self);
  AbreForm(FCadastrarListaAgenda);
end;

procedure TFMainMenu.ProdutosFaltantes1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaProdutosFaltantes) then
    FCadastrarListaProdutosFaltantes := TFCadastrarListaProdutosFaltantes.Create(Self);
  AbreForm(FCadastrarListaProdutosFaltantes);
end;

procedure TFMainMenu.Clientes3Click(Sender: TObject);
begin
  if not Assigned(FConsultarListaClientes) then
    FConsultarListaClientes := TFConsultarListaClientes.Create(Self);
  Abreform (FConsultarListaClientes);
end;

procedure TFMainMenu.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 4 then
  begin
    sbAgenda.Top := Rect.Top;
    sbAgenda.Left := Rect.Left;
    sbAgenda.Width := Rect.Right - Rect.Left - 15;
    sbAgenda.Height := Rect.Bottom - Rect.Top;
  end;
end;

procedure TFMainMenu.sbAgendaClick(Sender: TObject);
var
  cdsAgenda: TClientDataSet;
begin
  cdsAgenda := TAgenda.listaVendedor(DM.uvend, Now, 'S');

  if not cdsAgenda.Eof then
  try
    VisualizarAgenda := TVisualizarAgenda.Create(Self);
    VisualizarAgenda.dsListaAgenda.DataSet := cdsAgenda;
    VisualizarAgenda.ShowModal;
  finally
    cdsAgenda.Close;
    FreeAndNil(VisualizarAgenda);
  end;
end;

procedure TFMainMenu.ipodecliente1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaTipoCliente) then
    FCadastrarListaTipoCliente := TFCadastrarListaTipoCliente.Create(Self);
  AbreForm(FCadastrarListaTipoCliente);
end;

procedure TFMainMenu.Comisso1Click(Sender: TObject);
begin
  try
    FImprimirComissao := TFImprimirComissao.Create(Self);
    AbreForm2(FImprimirComissao);
  finally
    FreeAndNil(FImprimirComissao);
  end;
end;

procedure TFMainMenu.Contasapagar1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaContasPagar) then
    FCadastrarListaContasPagar := TFCadastrarListaContasPagar.Create(Self);
  AbreForm(FCadastrarListaContasPagar);
end;

procedure TFMainMenu.ContasapagarManuteno1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaContasPagarAuto) then
    FCadastrarListaContasPagarAuto := TFCadastrarListaContasPagarAuto.Create(Self);
  AbreForm(FCadastrarListaContasPagarAuto);
end;

procedure TFMainMenu.NotasFiscaisEletrnicas1Click(Sender: TObject);
begin
  try
    fImprimirNFe := TfImprimirNFe.Create(self);
    AbreForm2(fImprimirNFe);
  finally
    FreeAndNil(fImprimirNFe);
  end;
end;

procedure TFMainMenu.Estados1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaEstados) then
    FCadastrarListaEstados := TFCadastrarListaEstados.Create(Self);
  AbreForm(FCadastrarListaEstados);
end;

procedure TFMainMenu.Pedidossemestoque1Click(Sender: TObject);
begin
  try
    FConsultarPedidosSemEstoque := TFConsultarPedidosSemEstoque.Create(Self);
    AbreForm2(FConsultarPedidosSemEstoque);
  finally
    FreeAndNil(FConsultarPedidosSemEstoque);
  end;
end;

procedure TFMainMenu.Fornecedor1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaFornecedor) then
    FCadastrarListaFornecedor := TFCadastrarListaFornecedor.Create(Self);
  AbreForm(FCadastrarListaFornecedor);
end;

procedure TFMainMenu.ContaBanco1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaContaBanco) then
    FCadastrarListaContaBanco := TFCadastrarListaContaBanco.Create(Self);
  AbreForm(FCadastrarListaContaBanco);
end;

procedure TFMainMenu.ExportarRMA1Click(Sender: TObject);
begin
  if not Assigned(FExportarRMA) then
    FExportarRMA := TFExportarRMA.Create(Self);
  AbreForm2(FExportarRMA);
end;

procedure TFMainMenu.Movimentaodeestoque1Click(Sender: TObject);
begin
  try
    FImprimirMovimentacao := TFImprimirMovimentacao.Create(self);
    AbreForm2(FImprimirMovimentacao);
  finally
    FreeAndNil(FImprimirMovimentacao);
  end;
end;

procedure TFMainMenu.EstoqueNmerodesrie1Click(Sender: TObject);
begin
  if not Assigned(FConsultarNumeroSerie) then
    FConsultarNumeroSerie := TFConsultarNumeroSerie.Create(Self);
  AbreForm2(FConsultarNumeroSerie);
end;

procedure TFMainMenu.CartaCorrecao1Click(Sender: TObject);
begin
  if not Assigned(FCadastrarListaCartaCorrecao) then
    FCadastrarListaCartaCorrecao := TFCadastrarListaCartaCorrecao.Create(Self);
  AbreForm(FCadastrarListaCartaCorrecao);
end;

procedure TFMainMenu.RelacaodeVendaAcumulado1Click(Sender: TObject);
begin
  try
    FImprimirVendaAcumulado := TFImprimirVendaAcumulado.Create(Self);
    AbreForm2(FImprimirVendaAcumulado);
  finally
    FreeAndNil(FImprimirVendaAcumulado);
  end;

end;

procedure TFMainMenu.RegistrarVenda1Click(Sender: TObject);
begin
  try
    FRegistrarVenda := TFRegistrarVenda.Create(Self);
    AbreForm2(FRegistrarVenda);
  finally
    FreeAndNil(FRegistrarVenda);
  end;
end;

procedure TFMainMenu.Balanco1Click(Sender: TObject);
begin
  if (not Assigned(FCadastrarListaBalanco)) then
    FCadastrarListaBalanco := TFCadastrarListaBalanco.Create(Self);
  FCadastrarListaBalanco.Show;
end;

end.
