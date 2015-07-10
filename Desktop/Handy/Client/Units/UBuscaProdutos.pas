unit UBuscaProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit, Cliente;

type
  TFBuscaProdutos = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    dsBuscaProdutos: TDataSource;
    bbFalta: TBitBtn;
    edCodigo: TRzEdit;
    edDescricao: TRzEdit;
    procedure edCodigoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbFaltaClick(Sender: TObject);
  private
    _filtroLinha: String;
    procedure setFiltroLinha(const Value: String);
  public
    cliente: TCliente;
    property filtroLinha: String write setFiltroLinha;
  end;

var
  FBuscaProdutos: TFBuscaProdutos;

implementation

uses UDM, IBQuery, UCadastrarProdutosFaltantes, Variants, Produto,
  ProdutoFaltante, Cadastro;

{$R *.DFM}

procedure TFBuscaProdutos.edCodigoChange(Sender: TObject);
var
  filtro: String;
begin

  if edCodigo.Text <> '' then
    filtro := ' where upper(codigo_produto) like upper(''%' + edCodigo.Text + '%'')';
  if edDescricao.Text <> '' then
  begin
    if edCodigo.Text <> '' then
      filtro := filtro + ' and '
    else filtro := filtro + ' where ';
    filtro := filtro + ' upper(descricao_produto) like upper(''%' + edDescricao.Text + '%'')';
  end;

  if filtro <> '' then
  begin
    filtro := filtro + ' and produto_ativo = ''S''';
  end
  else
  begin
    filtro := ' where produto_ativo = ''S''';
  end;

  filtro := filtro + ' order by descricao_produto';

  dsBuscaProdutos.DataSet := TProduto.listaRegistros(filtro);
  dsBuscaProdutos.DataSet.Filter := _filtroLinha;
  dsBuscaProdutos.DataSet.Filtered := _filtroLinha <> '';
end;

procedure TFBuscaProdutos.DBGrid1DblClick(Sender: TObject);
begin
  bbOk.Click;
end;

procedure TFBuscaProdutos.FormCreate(Sender: TObject);
begin
  dsBuscaProdutos.DataSet := TProduto.listaProdutoAtivo('order by descricao_produto');
  cliente := nil;
end;

procedure TFBuscaProdutos.bbFaltaClick(Sender: TObject);
begin
  FCadastrarProdutosFaltantes := TFCadastrarProdutosFaltantes.Create(Self);
  if ((cliente <> nil) and (cliente.vIndice <> null)) then
  begin
    FCadastrarProdutosFaltantes.edCliente.Tag := cliente.vIndice;
    FCadastrarProdutosFaltantes.edCliente.Text := cliente.nome_cliente;
  end;
  if FCadastrarProdutosFaltantes.ShowModal = mrOk then
  with TProdutoFaltante.Create do
  begin
    produto_sq := TProduto.Create(FCadastrarProdutosFaltantes.dblProduto.KeyValue);
    qtde_produto_faltante := StrToInt(FCadastrarProdutosFaltantes.edQtde.Text);
    data_produto_faltante := StrToDateTime(FCadastrarProdutosFaltantes.edData.Text);
    cliente_sq := TCliente.Create(FCadastrarProdutosFaltantes.edCliente.Tag);
    salvar;
  end;
  FCadastrarProdutosFaltantes.Free;
end;

procedure TFBuscaProdutos.setFiltroLinha(const Value: String);
begin
  _filtroLinha := Value;
  dsBuscaProdutos.DataSet.Filter := Value;
  dsBuscaProdutos.DataSet.Filtered := Value <> '';
end;

end.
