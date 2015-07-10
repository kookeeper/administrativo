unit UCadastrarListaClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient;

type
  TFCadastrarListaClientes = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaClientes: TFCadastrarListaClientes;

implementation

uses UDM, UCadastrarFormClientes, UDMLista, UClassificaClientes,
  UImprimirClientesHist, UDMImpr;

{$R *.DFM}

procedure TFCadastrarListaClientes.FormCreate(Sender: TObject);
begin
  Tabela := 'tbClientes';
  Sql := 'SELECT C.*, U.NOME_USUARIO, CL.CODIGO_CLASSIFICACAO ' +
         'FROM CLIENTES C ' +
         'LEFT OUTER JOIN USUARIOS      U  ON (U.USUARIO_SQ        = C.USUARIO_SQ_ALT) ' +
         'LEFT OUTER JOIN CLASSIFICACAO CL ON (CL.CLASSIFICACAO_SQ = C.CLASSIFICACAO_SQ)';
  SetLength (cLista, 3);
  SetLength (nLista, 3);
  SetLength (cIndice, 1);

  cIndice := 'CLIENTE_SQ';

  cLista[0] := 'CODIGO_CLIENTE';
  cLista[1] := 'NOME_CLIENTE';
  cLista[2] := 'CODIGO_CLASSIFICACAO';

  nLista[0] := 'Código';
  nLista[1] := 'Nome';
  nLista[2] := 'Classificação';
  inherited;
end;

procedure TFCadastrarListaClientes.sbEditarClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm (TFCadastrarFormClientes, FCadastrarFormClientes);
  FCadastrarFormClientes.bbOk.Enabled := Criar or Editar;
  DMLista.cdsListaNfiscaisTotais.Close;
  DMLista.cdsListaNfiscaisTotais.Params.ParamByName('CLIENTE_SQ').AsInteger := cdsLista.FieldByName('CLIENTE_SQ').AsInteger;
  DMLista.cdsListaNfiscaisTotais.Open;
  DMLista.cdsListaTransportadoras.Open;
  if not novo then
  begin
    FCadastrarFormClientes.edCodigo.Text       := cdsLista.FieldByName('CODIGO_CLIENTE').AsString;
    FCadastrarFormClientes.edNome.Text         := cdsLista.FieldByName('NOME_CLIENTE').AsString;
    FCadastrarFormClientes.edInscricao.Text    := cdsLista.FieldByName('INSCR_ESTADUAL').AsString;
    FCadastrarFormClientes.edEndereco.Text     := cdsLista.FieldByName('ENDERECO').AsString;
    FCadastrarFormClientes.edNumero.Text       := cdsLista.FieldByName('NUMERO').AsString;
    FCadastrarFormClientes.edBairro.Text       := cdsLista.FieldByName('BAIRRO').AsString;
    FCadastrarFormClientes.edComplemento.Text  := cdsLista.FieldByName('COMPL_ENDERECO').AsString;
    FCadastrarFormClientes.edCidade.Text       := cdsLista.FieldByName('CIDADE').AsString;
    FCadastrarFormClientes.cbEstado.Text       := cdsLista.FieldByName('ESTADO').AsString;
    FCadastrarFormClientes.edCep.Text          := cdsLista.FieldByName('CEP').AsString;
    FCadastrarFormClientes.edDDDFone1.Text     := cdsLista.FieldByName('DDD_FONE1').AsString;
    FCadastrarFormClientes.edFone1.Text        := cdsLista.FieldByName('NUMERO_FONE1').AsString;
    FCadastrarFormClientes.edComplFone1.Text   := cdsLista.FieldByName('COMPL_FONE1').AsString;
    FCadastrarFormClientes.edDDDFone2.Text     := cdsLista.FieldByName('DDD_FONE2').AsString;
    FCadastrarFormClientes.edFone2.Text        := cdsLista.FieldByName('NUMERO_FONE2').AsString;
    FCadastrarFormClientes.edComplFone2.Text   := cdsLista.FieldByName('COMPL_FONE2').AsString;
    FCadastrarFormClientes.edDDDFone3.Text     := cdsLista.FieldByName('DDD_FONE3').AsString;
    FCadastrarFormClientes.edFone3.Text        := cdsLista.FieldByName('NUMERO_FONE3').AsString;
    FCadastrarFormClientes.edComplFone3.Text   := cdsLista.FieldByName('COMPL_FONE3').AsString;
    FCadastrarFormClientes.edDDDCelular.Text   := cdsLista.FieldByName('DDD_CELULAR').AsString;
    FCadastrarFormClientes.edCelular.Text      := cdsLista.FieldByName('NUMERO_CELULAR').AsString;
    FCadastrarFormClientes.edComplCelular.Text := cdsLista.FieldByName('COMPL_CELULAR').AsString;
    FCadastrarFormClientes.edDDDFax.Text       := cdsLista.FieldByName('DDD_FAX').AsString;
    FCadastrarFormClientes.edFax.Text          := cdsLista.FieldByName('NUMERO_FAX').AsString;
    FCadastrarFormClientes.edComplFax.Text     := cdsLista.FieldByName('COMPL_FAX').AsString;
    FCadastrarFormClientes.edEmail.Text        := cdsLista.FieldByName('E_MAIL').AsString;
    FCadastrarFormClientes.edSite.Text         := cdsLista.FieldByName('WEB_SITE').AsString;
    FCadastrarFormClientes.edContato.Text      := cdsLista.FieldByName('CONTATO').AsString;
    FCadastrarFormClientes.edPais.Text         := cdsLista.FieldByName('PAIS').AsString;
    FCadastrarFormClientes.cbRevenda.Checked   := cdsLista.FieldByName('REVENDA').AsString = 'S';
    FCadastrarFormClientes.cbBiro.Checked      := cdsLista.FieldByName('BIRO').AsString = 'S';
    FCadastrarFormClientes.edCadastro.Text     := cdsLista.FieldByName('DATA_CADASTRO').AsString;
    FCadastrarFormClientes.edAlteracao.Text    := cdsLista.FieldByName('DATA_ALT').AsString +
      ' - ' + cdsLista.FieldByName('NOME_USUARIO').AsString;
    FCadastrarFormClientes.mmObservacao.Text   := cdsLista.FieldByName('OBSERVACAO').AsString;

    FCadastrarFormClientes.DBLookupComboBox1.KeyValue := cdsLista.FieldByName('TRANSPORTADORA_SQ').AsInteger;

    FCadastrarFormClientes.edPrimeiraVenda.Text := DMLista.cdsListaNfiscaisTotaisPRIMEIRA_VENDA.AsString;
    FCadastrarFormClientes.edUltimaVenda.Text   := DMLista.cdsListaNfiscaisTotaisULTIMA_VENDA.AsString;
    FCadastrarFormClientes.edMaiorVenda.Text    := FloattoStrf (DMLista.cdsListaNfiscaisTotaisMAIOR_VENDA.Value, ffCurrency, 10, 2);
    FCadastrarFormClientes.edMenorVenda.Text    := FloattoStrf (DMLista.cdsListaNfiscaisTotaisMENOR_VENDA.Value, ffCurrency, 10, 2);
    FCadastrarFormClientes.edTotalVendas.Text   := FloattoStrf (DMLista.cdsListaNfiscaisTotaisTOTAL_VENDA.Value, ffCurrency, 10, 2);
    FCadastrarFormClientes.edMediaVendas.Text   := FloattoStrf (30 * DMLista.cdsListaNfiscaisTotaisTOTAL_VENDA.Value / (1 + DMLista.cdsListaNfiscaisTotaisULTIMA_VENDA.Value - DMLista.cdsListaNfiscaisTotaisPRIMEIRA_VENDA.Value), ffCurrency, 10, 2);
    FCadastrarFormClientes.edClassificacao.Text := DMLista.cdsListaClassificacaoCODIGO_CLASSIFICACAO.AsString;
  end;
  if FCadastrarFormClientes.ShowModal = mrOk then
  try
    DM.SCServer.Open;
    Mensagem := DM.SCServer.AppServer.CriaRegistro ('CLIENTES', Novo, Valores,
      VarArrayOf ([
        FCadastrarFormClientes.edCodigo.Text,
        FCadastrarFormClientes.edNome.Text,
        FCadastrarFormClientes.edInscricao.Text,
        FCadastrarFormClientes.edEndereco.Text,
        FCadastrarFormClientes.edNumero.Text,
        FCadastrarFormClientes.edBairro.Text,
        FCadastrarFormClientes.edComplemento.Text,
        FCadastrarFormClientes.edCidade.Text,
        FCadastrarFormClientes.cbEstado.Text,
        FCadastrarFormClientes.edCep.Text,
        FCadastrarFormClientes.edDDDFone1.Text,
        FCadastrarFormClientes.edFone1.Text,
        FCadastrarFormClientes.edComplFone1.Text,
        FCadastrarFormClientes.edDDDFone2.Text,
        FCadastrarFormClientes.edFone2.Text,
        FCadastrarFormClientes.edComplFone2.Text,
        FCadastrarFormClientes.edDDDFone3.Text,
        FCadastrarFormClientes.edFone3.Text,
        FCadastrarFormClientes.edComplFone3.Text,
        FCadastrarFormClientes.edDDDCelular.Text,
        FCadastrarFormClientes.edCelular.Text,
        FCadastrarFormClientes.edComplCelular.Text,
        FCadastrarFormClientes.edDDDFax.Text,
        FCadastrarFormClientes.edFax.Text,
        FCadastrarFormClientes.edComplFax.Text,
        FCadastrarFormClientes.edEmail.Text,
        FCadastrarFormClientes.edSite.Text,
        FCadastrarFormClientes.edContato.Text,
        FCadastrarFormClientes.edPais.Text,
        FCadastrarFormClientes.cbRevenda.Checked,
        FCadastrarFormClientes.cbBiro.Checked,
        Date+Time,
        DM.useq,
        FCadastrarFormClientes.DBLookupComboBox1.KeyValue]));
    if Mensagem <> '' then Showmessage ('Erro ao gravar Registro: ' + Mensagem);
    DM.EnviarEmail (Tabela, 'GRAVAR', Mensagem, Novo);
  finally
    AtualizaLista;
  end;
end;

procedure TFCadastrarListaClientes.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  cdsLista.Open;
  FClassificaClientes.ShowModal;
  sbFiltro.Click;
end;

procedure TFCadastrarListaClientes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FImprimirClientesHist.edCodigo.Text   := StringGrid1.Cells[1, StringGrid1.row];
  FImprimirClientesHist.edNome.Text     := '';
  FImprimirClientesHist.dtpInicio.Date  := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  FImprimirClientesHist.dtpTermino.Date := Date;
  FImprimirClientesHist.ShowModal;
  DMImpr.cdsImprHistClientes3.Close;
  DMImpr.cdsImprHistClientes2.Close;
  DMImpr.cdsImprHistClientes1.Close;
end;

end.
