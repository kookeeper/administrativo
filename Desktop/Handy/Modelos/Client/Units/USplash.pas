unit USplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, Registry, DBTables, IBTable, StdCtrls, ComCtrls, jpeg, ExtCtrls,
  DB, DBClient;

type
  TFSplash = class(TForm)
    Image1: TImage;
    StatusBar1: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cdsLista: TClientDataSet;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  FSplash: TFSplash;

implementation

uses UDM, uSetup, UMainMenu, UCadastrarListaComum, UCadastrarFormComum,
  UCadastrarListaClientes, UCadastrarListaCondPagto,
  UCadastrarListaNaturezas, UCadastrarListaPedidos,
  UCadastrarListaProdutos, UCadastrarListaNCM, UCadastrarListaUsuarios,
  UCadastrarListaTransportadoras, UCadastrarListaNfiscais,
  UCadastrarListaMovimentacoes, UCadastrarListaDuplicatas,
  UManutencaoListaNfiscaisDemonstracao, UImprimirClientesUF,
  UImprimirNfiscais, UImprimirEstoque,
  UImprimirPedidos, UDMImpr, UDMLista, UImprimirDemonstracaoPrev,
  UImprimirDuplicatas, UCadastrarListaAssistencias, UImportaEntradas,
  UCadastrarListaModelos, UCadastrarListaVendedores,
  UCadastrarListaAcessos, UImprimirClientesHist, UImprimirNfiscaisVend,
  UCadastrarFormEmpresas, ULiberarAcessos, UConsultarNfiscaisSerie,
  UImprimirNfiscaisFech, UCadastrarListaClassificacao, UClassificaClientes,
  UImprimirAssistencias, UCadastrarListaNFServicos;

{$R *.dfm}

procedure TFSplash.FormActivate(Sender: TObject);
var
  ip: string;
  reg: TRegistry;
  mm, aa: integer;
begin
  try
    Application.CreateForm(TFMainMenu, FMainMenu);

    StatusBar1.Panels[0].Text := 'Conectando ao Banco de Dados!';
    Application.ProcessMessages;
    Reg := TRegistry.Create;
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey('\Software\MSystem', True) then
      begin
        ip := Reg.ReadString ('HostIP');
      end;
    finally
      Reg.CloseKey;
      Reg.Free;
    end;
    While DM.SCServer.Connected = False do
    try
      DM.SCServer.Host           := ip;
      DMImpr.SCServerImpr.Host   := ip;
      DMLista.SCServerLista.Host := ip;

      DM.SCServer.Connected := True;
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
        Application.CreateForm(TFSetup, FSetup);
        FSetup.edIP.Text := ip;
        if FSetup.ShowModal = mrOk then
        begin
          Reg := TRegistry.Create;
          Reg.RootKey := HKEY_CURRENT_USER;
          Reg.OpenKey('\Software\MSystem', True);
          Reg.WriteString ('HostIP',    FSetup.edIP.Text);
          Reg.CloseKey;
          Reg.Free;
          IP := FSetup.edIP.Text;
        end
        else raise Exception.Create('');
        FSetup.Free;
      end;
    end;
    StatusBar1.Panels[0].Text := 'Validando o Sistema!';
    Application.ProcessMessages;

    DM.dtsenha := DM.SCServer.AppServer.VerificaSenha;
    if (DM.dtsenha < Date) or (DM.dtsenha > Date + 90) then
      raise Exception.Create('Falha na Validação do Sistema. Programa Finalizado!');

    if not DM.Login (0) then
      Abort;

    StatusBar1.Panels[0].Text := 'Criando Formulários!';
    Application.ProcessMessages;
    Application.CreateForm(TFCadastrarListaComum, FCadastrarListaComum);
    Application.CreateForm(TFCadastrarFormComum, FCadastrarFormComum);
    Application.CreateForm(TFCadastrarFormEmpresas, FCadastrarFormEmpresas);
    Application.CreateForm(TFCadastrarListaAcessos, FCadastrarListaAcessos);
    Application.CreateForm(TFCadastrarListaAssistencias, FCadastrarListaAssistencias);
    Application.CreateForm(TFCadastrarListaClassificacao, FCadastrarListaClassificacao);
    Application.CreateForm(TFCadastrarListaClientes, FCadastrarListaClientes);
    Application.CreateForm(TFCadastrarListaCondPagto, FCadastrarListaCondPagto);
    Application.CreateForm(TFCadastrarListaDuplicatas, FCadastrarListaDuplicatas);
    Application.CreateForm(TFCadastrarListaModelos, FCadastrarListaModelos);
    Application.CreateForm(TFCadastrarListaMovimentacoes, FCadastrarListaMovimentacoes);
    Application.CreateForm(TFCadastrarListaNaturezas, FCadastrarListaNaturezas);
    Application.CreateForm(TFCadastrarListaNfiscais, FCadastrarListaNfiscais);
    Application.CreateForm(TFCadastrarListaNFServicos, FCadastrarListaNFServicos);
    Application.CreateForm(TFCadastrarListaNCM, FCadastrarListaNCM);
    Application.CreateForm(TFCadastrarListaPedidos, FCadastrarListaPedidos);
    Application.CreateForm(TFCadastrarListaProdutos, FCadastrarListaProdutos);
    Application.CreateForm(TFCadastrarListaTransportadoras, FCadastrarListaTransportadoras);
    Application.CreateForm(TFCadastrarListaUsuarios, FCadastrarListaUsuarios);
    Application.CreateForm(TFCadastrarListaVendedores, FCadastrarListaVendedores);
    Application.CreateForm(TFClassificaClientes, FClassificaClientes);
    Application.CreateForm(TFImportaEntradas, FImportaEntradas);
    Application.CreateForm(TFLiberarAcessos, FLiberarAcessos);
    Application.CreateForm(TFManutencaoListaNfiscaisDemonstracao, FManutencaoListaNfiscaisDemonstracao);

    StatusBar1.Panels[0].Text := 'Criando Relatórios!';
    Application.ProcessMessages;
    Application.CreateForm(TFConsultarNFiscaisSerie, FConsultarNFiscaisSerie);
    Application.CreateForm(TFImprimirAssistencias, FImprimirAssistencias);
    Application.CreateForm(TFImprimirClientesUF, FImprimirClientesUF);
    Application.CreateForm(TFImprimirClientesHist, FImprimirClientesHist);
    Application.CreateForm(TFImprimirDemonstracaoPrev, FImprimirDemonstracaoPrev);
    Application.CreateForm(TFImprimirEstoque, FImprimirEstoque);
    Application.CreateForm(TFImprimirDuplicatas, FImprimirDuplicatas);
    Application.CreateForm(TFImprimirNFiscais, FImprimirNFiscais);
    Application.CreateForm(TFImprimirNFiscaisVend, FImprimirNFiscaisVend);
    Application.CreateForm(TFImprimirNfiscaisFech, FImprimirNfiscaisFech);
    Application.CreateForm(TFImprimirPedidos, FImprimirPedidos);

    aa := StrtoInt (FormatDateTime('yyyy', Date));
    mm := StrtoInt (FormatDateTime('mm', Date));
    if mm = 1 then
    begin
      aa := aa-1;
      mm := 12;
    end else
      dec (mm);
    cdsLista.Close;
    DMLista.SCServerLista.Open;
    DMLista.SCServerLista.AppServer.CriaLista ('SELECT AAMM_CLASSIFICACAO FROM EMPRESAS');
    cdsLista.Open;
    if cdsLista.FieldByName('AAMM_CLASSIFICACAO').AsInteger <> (aa*100+mm) then
    begin
      StatusBar1.Panels[0].Text := 'Classificando os Clientes...';
      Application.ProcessMessages;
      FClassificaClientes.bbClassifica.Click;
      cdsLista.Close;
      DMLista.SCServerLista.AppServer.CriaLista ('UPDATE EMPRESAS SET AAMM_CLASSIFICACAO = ' + InttoStr (aa*100+mm));
      cdsLista.Execute;
    end;

    DM.SCServer.Connected := False;
    DMImpr.SCServerImpr.Connected := False;
  except
    on E: Exception do
    begin
      Showmessage (E.Message);
      Application.Terminate;
    end;
  end;
end;

end.
