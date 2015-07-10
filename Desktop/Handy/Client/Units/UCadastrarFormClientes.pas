unit UCadastrarFormClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  ComCtrls, ToolWin, Grids, DBClient, Variants, SHDocVw, RzEdit, DBGrids,
  RzDBCmbo, RzCmboBx, RzButton, RzRadChk, StrUtils, RzRadGrp, RzPanel;

type
  TFCadastrarFormClientes = class(TFCadastrarFormComum)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lblCEP: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    mmObservacao: TMemo;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dsListaTransportadoras: TDataSource;
    Label30: TLabel;
    TabSheet4: TTabSheet;
    ToolBar1: TToolBar;
    sbNovoItem: TSpeedButton;
    sbEditarItem: TSpeedButton;
    sbApagarItem: TSpeedButton;
    cdsLista: TClientDataSet;
    Label31: TLabel;
    edCodigo: TRzEdit;
    edNome: TRzEdit;
    edEndereco: TRzEdit;
    edNumero: TRzEdit;
    edComplemento: TRzEdit;
    edBairro: TRzEdit;
    edCidade: TRzEdit;
    edInscricaoEstadual: TRzEdit;
    edPais: TRzEdit;
    edCadastro: TRzEdit;
    edAlteracao: TRzEdit;
    edContato: TRzEdit;
    edDDDFone1: TRzEdit;
    edFone1: TRzEdit;
    edComplFone1: TRzEdit;
    edDDDFone2: TRzEdit;
    edFone2: TRzEdit;
    edComplFone2: TRzEdit;
    edDDDFone3: TRzEdit;
    edFone3: TRzEdit;
    edComplFone3: TRzEdit;
    edDDDCelular: TRzEdit;
    edCelular: TRzEdit;
    edComplCelular: TRzEdit;
    edDDDFax: TRzEdit;
    edFax: TRzEdit;
    edComplFax: TRzEdit;
    edEmail: TRzEdit;
    edSite: TRzEdit;
    edMenorVenda: TRzEdit;
    edUltimaVenda: TRzEdit;
    edPrimeiraVenda: TRzEdit;
    edMaiorVenda: TRzEdit;
    edTotalVendas: TRzEdit;
    edMediaVendas: TRzEdit;
    edClassificacao: TRzEdit;
    dsListaContatos: TDataSource;
    cdsListaContatos: TClientDataSet;
    cdsListaContatosCONTATO_SQ: TIntegerField;
    cdsListaContatosDATA_CONTATO: TDateTimeField;
    cdsListaContatosCLIENTE_SQ: TIntegerField;
    cdsListaContatosVENDEDOR_SQ: TIntegerField;
    cdsListaContatosOBSERVACAO: TMemoField;
    cdsListaContatosTIPO_CONTATO: TStringField;
    cdsListaContatosFORMA_CONTATO: TStringField;
    cdsListaContatosNFISCAL_ITEM_SQ: TIntegerField;
    cdsListaContatosQTDE_PRODUTOS: TIntegerField;
    cdsListaContatosNOME_CLIENTE: TStringField;
    cdsListaContatosNOME_VENDEDOR: TStringField;
    cdsListaContatosDESCRICAO_PRODUTO: TStringField;
    DBGrid1: TDBGrid;
    dsListaTipoCliente: TDataSource;
    cbBiro: TRzCheckBox;
    dblTransportadora: TRzDBLookupComboBox;
    dblTipoCliente: TRzDBLookupComboBox;
    Label9: TLabel;
    dblVendedor: TRzDBLookupComboBox;
    dsListaVendedores: TDataSource;
    dsListaEstados: TDataSource;
    dblEstado: TRzDBLookupComboBox;
    edCep: TRzEdit;
    Label32: TLabel;
    edCodigoSuframa: TRzEdit;
    Label33: TLabel;
    edInscricaoMunicipal: TRzEdit;
    cdsListaContatosFINALIZADO: TStringField;
    TabSheet5: TTabSheet;
    RzGroupBox1: TRzGroupBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    edObservacaoDesconto: TRzEdit;
    rgBaseComissao: TRzRadioGroup;
    edPctPropria: TRzNumericEdit;
    edPctParceria: TRzNumericEdit;
    edPctDesconto: TRzNumericEdit;
    edCNAE: TRzEdit;
    Label38: TLabel;
    procedure bbOkClick(Sender: TObject);
    procedure edCepExit(Sender: TObject);
    procedure edPaisExit(Sender: TObject);
    procedure sbNovoItemClick(Sender: TObject);
    procedure sbEditarItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbApagarItemClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edCepKeyPress(Sender: TObject; var Key: Char);
  private
    Browser: TWebBrowser;
    procedure DocumentComplete(Sender: TObject; const pDisp: IDispatch;
      var URL: OleVariant);
    { Private declarations }
  public
    xItens: array of Integer;
    { Public declarations }
  end;

var
  FCadastrarFormClientes: TFCadastrarFormClientes;

implementation

uses UDM, UCadastrarListaClientes, UCadastrarFormContatos, mshtml,
  Vendedor, Cadastro, Transportadora, TipoCliente, Estado,
  UCadastrarListaComum, Cliente, Usuario;

{$R *.DFM}

procedure TFCadastrarFormClientes.bbOkClick(Sender: TObject);
var
  cds: TClientDataSet;
begin
  inherited;
  ModalResult := mrNone;

  edCodigo.Text := Trim(edCodigo.Text);
  edPais.Text   := Trim(UpperCase(edPais.Text));
  if edPais.Text <> 'BRASIL' then
    dblEstado.ClearKeyValue;

  if (edPais.Text = 'BRASIL') and (dblEstado.KeyValue = '') then
  begin
    PageControl1.ActivePage := TabSheet1;
    dblEstado.SetFocus;
    raise Exception.Create ('Escolha um estado!');
  end;

  if edPais.Text = '' then
  begin
    PageControl1.ActivePage := TabSheet1;
    edPais.SetFocus;
    raise Exception.Create ('País Inválido!');
  end
  else if dblTransportadora.KeyValue = null then
  begin
    PageControl1.ActivePage := TabSheet1;
    dblTransportadora.SetFocus;
    raise Exception.Create ('Selecionar uma Transportadora Padrão!');
  end
  else if ((Length(edCodigo.Text) = 14) and (not DM.TestaCNPJ(edCodigo.Text))) or
          ((Length(edCodigo.Text) = 11) and (not DM.TestaCPF(edCodigo.Text))) or
          ((Length(edCodigo.Text) <> 11) and (Length(edCodigo.Text) <> 14)) then
  begin
    if MessageDlg('CPF/CNPJ Inválido, Deseja continuar mesmo assim?', mtConfirmation, mbOKCancel, 0) = mrCancel then
      raise Exception.Create('');
  end;

  with (Owner as TFCadastrarListaComum) do
  begin
    with registro as TCliente do
    begin
      codigo_cliente := edCodigo.Text;
      nome_cliente := edNome.Text;
      inscr_estadual := edInscricaoEstadual.Text;
      inscr_municipal := edInscricaoMunicipal.Text;
      cnae := edCNAE.Text;
      endereco := edEndereco.Text;
      numero := edNumero.Text;
      bairro := edBairro.Text;
      compl_endereco := edComplemento.Text;
      cidade := edCidade.Text;
      if dblEstado.KeyValue <> null then
        estado := dblEstado.KeyValue
      else
        estado := '';
      cep := edCep.Text;
      ddd_fone1 := edDDDFone1.Text;
      numero_fone1 := edFone1.Text;
      compl_fone1 := edComplFone1.Text;
      ddd_fone2 := edDDDFone2.Text;
      numero_fone2 := edFone2.Text;
      compl_fone2 := edComplFone2.Text;
      ddd_fone3 := edDDDFone3.Text;
      numero_fone3 := edFone3.Text;
      compl_fone3 := edComplFone3.Text;
      ddd_celular := edDDDCelular.Text;
      numero_celular := edCelular.Text;
      compl_celular := edComplCelular.Text;
      ddd_fax := edDDDFax.Text;
      numero_fax := edFax.Text;
      compl_fax := edComplFax.Text;
      e_mail := edEmail.Text;
      web_site := edSite.Text;
      contato := edContato.Text;
      pais := edPais.Text;
      tipo_cliente_sq := TTipoCliente.Create(dblTipoCliente.KeyValue);
      biro := IfThen(cbBiro.Checked, 'S', 'N');
      codigo_suframa := edCodigoSuframa.Text;
      data_alt := Date+Time;
      usuario_sq_alt := TUsuario.Create(DM.useq);
      transportadora_sq := TTransportadora.Create(dblTransportadora.KeyValue);
      observacao := mmObservacao.Text;
      vendedor_sq := TVendedor.Create(dblVendedor.KeyValue);

      pct_comissao_propria  := edPctPropria.Value;
      pct_comissao_parceria := edPctParceria.Value;
      base_comissao         := Copy('FVR ', rgBaseComissao.ItemIndex + 1, 1);
      pct_comissao_desconto := edPctDesconto.Value;
      obs_comissao_desconto := edObservacaoDesconto.Text;
      salvar;
    end;

    // esta variavel deve ser carregada antes de incluir or registros no banco de dados.
    cds := TContato.listaRegistros('where cliente_sq = ' + VarToStr(registro.vIndice));

    cdsListaContatos.First;
    While not cdsListaContatos.Eof do
    begin
      with (TContato.Create(cdsListaContatosCONTATO_SQ.Value)) do
      begin
        data_contato    := cdsListaContatosDATA_CONTATO.Value;
        cliente_sq      := TCliente.Create(registro.vIndice);
        vendedor_sq     := TVendedor.Create(cdsListaContatosVENDEDOR_SQ.Value);
        observacao      := cdsListaContatosOBSERVACAO.AsString;
        tipo_contato    := cdsListaContatosTIPO_CONTATO.AsString;
        forma_contato   := cdsListaContatosFORMA_CONTATO.AsString;
        if cdsListaContatosNFISCAL_ITEM_SQ.Value > 0 then
          nfiscal_item_sq := cdsListaContatosNFISCAL_ITEM_SQ.Value;
        qtde_produtos   := cdsListaContatosQTDE_PRODUTOS.Value;
        finalizado      := cdsListaContatosFINALIZADO.Value;
        salvar;
      end;
      cdsListaContatos.Next;
    end;

    cds.First;
    while not cds.Eof do
    begin
      if not cdsListaContatos.Locate('contato_sq', cds.FieldByName('contato_sq').Value, []) then
        TContato.Create(cds.FieldByName('contato_sq').Value).excluirRegistro(false);
      cds.Next;
    end;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormClientes.edCepExit(Sender: TObject);
begin
  inherited;
  if edCep.Text = '' then
    Exit;

    Browser.Navigate('http://cep.republicavirtual.com.br/web_cep.php?cep=' + edCep.Text + '&formato=query_string');
end;

procedure TFCadastrarFormClientes.edPaisExit(Sender: TObject);
begin
  inherited;
  dblEstado.Enabled := edPais.Text = 'BRASIL';
  if edPais.Text <> 'BRASIL' then
    dblEstado.ClearKeyValue;
end;

procedure TFCadastrarFormClientes.sbNovoItemClick(Sender: TObject);
begin
  sbEditarItem.onClick (sbNovoItem);
  inherited;
end;

procedure TFCadastrarFormClientes.sbEditarItemClick(Sender: TObject);
begin
  FCadastrarFormContatos := TFCadastrarFormContatos.Create(Self);
  if Sender <> sbNovoItem then
  begin
    With FCadastrarFormContatos do
    begin
      Data                       := cdsListaContatosDATA_CONTATO.AsDateTime;
      DBLookupComboBox1.KeyValue := cdsListaContatosVENDEDOR_SQ.AsInteger;
      rgTipo.ItemIndex           := cdsListaContatosTIPO_CONTATO.AsInteger;
      rgForma.ItemIndex          := cdsListaContatosFORMA_CONTATO.AsInteger;
      mmObservacao.Text          := cdsListaContatosOBSERVACAO.AsString;
      if cdsListaContatosNFISCAL_ITEM_SQ.AsInteger <> 0 then
        DBLookupComboBox2.KeyValue := cdsListaContatosNFISCAL_ITEM_SQ.AsInteger;
      edQtdeProdutos.Text        := cdsListaContatosQTDE_PRODUTOS.AsString;
      cbFinalizado.Checked       := cdsListaContatosFINALIZADO.AsString = 'S';
    end;
  end;
  if FCadastrarFormContatos.ShowModal in [mrOk, mrYes] then
  begin
    if Sender = sbNovoItem then
    begin
      cdsListaContatos.Append;
      cdsListaContatosCONTATO_SQ.AsInteger := 0;
    end;
    cdsListaContatos.Edit;
    cdsListaContatosDATA_CONTATO.AsDateTime := FCadastrarFormContatos.Data;
    cdsListaContatosCLIENTE_SQ.AsInteger    := FCadastrarListaClientes.registro.vIndice;
    cdsListaContatosVENDEDOR_SQ.AsInteger   := FCadastrarFormContatos.DBLookupComboBox1.KeyValue;
    cdsListaContatosOBSERVACAO.AsString     := FCadastrarFormContatos.mmObservacao.Text;
    cdsListaContatosTIPO_CONTATO.AsInteger  := FCadastrarFormContatos.rgTipo.ItemIndex;
    cdsListaContatosFORMA_CONTATO.AsInteger := FCadastrarFormContatos.rgForma.ItemIndex;
    cdsListaContatosQTDE_PRODUTOS.AsInteger := StrToInt(FCadastrarFormContatos.edQtdeProdutos.Text);
    cdsListaContatosNOME_VENDEDOR.AsString  := FCadastrarFormContatos.dsListaVendedores.DataSet.FieldByName('NOME_VENDEDOR').AsString;

    if FCadastrarFormContatos.DBLookupComboBox2.KeyValue <> null then
    begin
      cdsListaContatosNFISCAL_ITEM_SQ.AsInteger := FCadastrarFormContatos.DBLookupComboBox2.KeyValue;
      cdsListaContatosDESCRICAO_PRODUTO.AsString := FCadastrarFormContatos.dsListaNfiscaisItens.DataSet.FieldByName ('DESCRICAO_PRODUTO').AsString;
    end
    else
      cdsListaContatosNFISCAL_ITEM_SQ.Clear;

    if FCadastrarFormContatos.cbFinalizado.Checked then
      cdsListaContatosFINALIZADO.AsString := 'S'
    else
      cdsListaContatosFINALIZADO.AsString := 'N';

    cdsListaContatos.Post;
  end;
  inherited;
  FCadastrarFormContatos.Free;
end;

procedure TFCadastrarFormClientes.FormCreate(Sender: TObject);
begin
  inherited;
  SetLength (xItens, 0);

  Browser := TWebBrowser.Create(self);
  Browser.OnDocumentComplete := DocumentComplete;
  Browser.Left := Width; // para ele nao aparecer
  Browser.Enabled := False;
  TWinControl(Browser).Name := 'browser';
  TWinControl(Browser).Parent := Self;

  dsListaTransportadoras.DataSet := TTransportadora.listaRegistros('order by nome_transportadora');
  dsListaTipoCliente.DataSet := TTipoCliente.listaRegistros('order by descricao_tipo');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  dsListaEstados.DataSet := TEstado.listaRegistros('order by codigo_estado');
  cdsListaContatos.CreateDataSet;

  with TCliente(TFCadastrarListaComum(Owner).registro) do
  if not TFCadastrarListaComum(Owner).novo then
  begin
    CloneCDS(TContato.buscaContatosCliente(vIndice), cdsListaContatos);

    edCodigo.Text       := codigo_cliente;
    edNome.Text         := nome_cliente;
    edInscricaoEstadual.Text  := inscr_estadual;
    edInscricaoMunicipal.Text := inscr_municipal;
    edCNAE.Text         := cnae;
    edEndereco.Text     := endereco;
    edNumero.Text       := numero;
    edBairro.Text       := bairro;
    edComplemento.Text  := compl_endereco;
    edCidade.Text       := cidade;
    dblEstado.KeyValue  := estado;
    edCep.Text          := cep;
    edDDDFone1.Text     := ddd_fone1;
    edFone1.Text        := numero_fone1;
    edComplFone1.Text   := compl_fone1;
    edDDDFone2.Text     := ddd_fone2;
    edFone2.Text        := numero_fone2;
    edComplFone2.Text   := compl_fone2;
    edDDDFone3.Text     := ddd_fone3;
    edFone3.Text        := numero_fone3;
    edComplFone3.Text   := compl_fone3;
    edDDDCelular.Text   := ddd_celular;
    edCelular.Text      := numero_celular;
    edComplCelular.Text := compl_celular;
    edDDDFax.Text       := ddd_fax;
    edFax.Text          := numero_fax;
    edComplFax.Text     := compl_fax;
    edEmail.Text        := e_mail;
    edSite.Text         := web_site;
    edContato.Text      := contato;
    edPais.Text         := pais;
    cbBiro.Checked      := biro = 'S';
    edCodigoSuframa.Text:= codigo_suframa;
    if (data_cadastro > 0) then
      edCadastro.Text     := DateToStr(data_cadastro);
    if (data_alt > 0) then
      edAlteracao.Text    := DateToStr(data_alt) + ' - ' + usuario_sq_alt.nome_usuario;
    mmObservacao.Text   := observacao;

    edPctPropria.Value        := pct_comissao_propria;
    edPctParceria.Value       := pct_comissao_parceria;
    rgBaseComissao.ItemIndex  := Pos(base_comissao, 'FVR ') - 1;
    edPctDesconto.Value       := pct_comissao_desconto;
    edObservacaoDesconto.Text := obs_comissao_desconto;

    dblTipoCliente.KeyValue := tipo_cliente_sq.vIndice;
    dblTransportadora.KeyValue := transportadora_sq.vIndice;
    dblVendedor.KeyValue := vendedor_sq.vIndice;

    with (NfiscaisTotais) do
    begin
      edPrimeiraVenda.Text := FieldByName('PRIMEIRA_VENDA').AsString;
      edUltimaVenda.Text   := FieldByName('ULTIMA_VENDA').AsString;
      edMaiorVenda.Text    := FloattoStrf (FieldByName('MAIOR_VENDA').AsCurrency, ffCurrency, 10, 2);
      edMenorVenda.Text    := FloattoStrf (FieldByName('MENOR_VENDA').AsCurrency, ffCurrency, 10, 2);
      edTotalVendas.Text   := FloattoStrf (FieldByName('TOTAL_VENDA').AsCurrency, ffCurrency, 10, 2);
      if FieldByName('MESES').Value > 0 then
        edMediaVendas.Text   := FloattoStrf (FieldByName('TOTAL_VENDA').AsCurrency / FieldByName('MESES').Value, ffCurrency, 10, 2);
    end;
    edClassificacao.Text := classificacao_sq.codigo_classificacao;
  end;
end;

procedure TFCadastrarFormClientes.sbApagarItemClick(Sender: TObject);
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
    cdsListaContatos.Delete;
end;

procedure TFCadastrarFormClientes.DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  iall : IHTMLElement;
  s, s1, s2, s3: String;
begin
  if Assigned(Browser.Document) then
  begin
    iall := (Browser.Document AS IHTMLDocument2).body;

    while iall.parentElement <> nil do
      iall := iall.parentElement;

    if Copy(iall.outerText, Pos('resultado=', iall.outerText)+10, 1) = '1' then
    begin
{
&resultado=1
&resultado_txt=sucesso+-+cep+completo
&uf=SP
&cidade=S%E3o+Paulo
&bairro=Ch%E1cara+Nossa+Senhora+do+Bom+Conselho
&tipo_logradouro=Rua
&logradouro=Nossa+Senhora+do+Bom+Conselho
}
      s := Copy(iall.outerText, Pos('uf=', iall.outerText), 999999);
      s := StringReplace(s, '+', ' ', [rfReplaceAll]);
      While Pos('%', s) > 0 do
      begin
        s1 := Copy(s, Pos('%', s), 3); //origem
        s2 := Copy(s, Pos('%', s)+1, 2); //origem modificada
        s3 := char(StrToInt('$' + s2)); //origem convertida
        s := StringReplace(s, s1, s3, [rfReplaceAll]);
      end;

      dblEstado.KeyValue := UpperCase(Copy(s, Pos('uf=', s)+3, Pos('&', s)-4));
      Delete(s, 1, Pos('&', s)); // remove o 'uf'

      edCidade.Text   := Copy(UpperCase(Copy(s, Pos('cidade=', s)+7, Pos('&', s)-8)), 0, edCidade.MaxLength);
      Delete(s, 1, Pos('&', s)); // remove o 'cidade'

      edBairro.Text   := Copy(UpperCase(Copy(s, Pos('bairro=', s)+7, Pos('&', s)-8)), 0, edBairro.MaxLength);
      Delete(s, 1, Pos('&', s)); // remove o 'bairro'

      edEndereco.Text   := Copy(UpperCase(Copy(s, Pos('tipo_logradouro=', s)+16, Pos('&', s)-17)), 0, edEndereco.MaxLength);
      Delete(s, 1, Pos('&', s)); // remove o 'tipo_logradouro'

      edEndereco.Text   := Copy(edEndereco.Text + ' ' + UpperCase(Copy(s, Pos('logradouro=', s)+11, 99)), 0, edEndereco.MaxLength);

      edPais.Text := 'BRASIL';
    end
    else
      ShowMessage('Não foi possível encontrar o CEP.');

   end;
end;

procedure TFCadastrarFormClientes.FormDestroy(Sender: TObject);
begin
  inherited;
  dsListaEstados.DataSet.Close;
end;

procedure TFCadastrarFormClientes.edCepKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Pos(Key, '0123456789')=0) and (Key <> #8)then
    Key := #0;
end;

end.
