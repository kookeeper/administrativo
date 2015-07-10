unit UCadastrarFormMovimentacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,
  DB, RzEdit, RzPanel, RzRadGrp, Produto, RzDBEdit, RzButton, RzRadChk,
  RzLstBox;

type
  TFCadastrarFormMovimentacoes = class(TFCadastrarFormComum)
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    rgTipoMov: TRzRadioGroup;
    mmNrSerie: TRzMemo;
    edProduto: TRzEdit;
    edNfiscal: TRzNumericEdit;
    edValor: TRzNumericEdit;
    edQtde: TRzNumericEdit;
    Label2: TLabel;
    Label8: TLabel;
    listaEstoque: TRzListBox;
    procedure FormCreate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    _produto : TProduto;
    procedure setProduto(const Value: TProduto);
  public
    property produto: TProduto read _produto write setProduto;
  end;

var
  FCadastrarFormMovimentacoes: TFCadastrarFormMovimentacoes;

implementation

uses UDM, Kardex, UCadastrarListaComum, Math, StrUtils, Usuario, Empresa;

{$R *.dfm}

procedure TFCadastrarFormMovimentacoes.FormCreate(Sender: TObject);
begin
  inherited;
  if not (TFCadastrarListaComum(Owner)).novo then
    raise Exception.Create('Não é possível alterar a movimentação');
end;

procedure TFCadastrarFormMovimentacoes.bbOkClick(Sender: TObject);
begin
  if listaEstoque.SelectedItem = '' then
  begin
    ModalResult := mrNone;
    raise Exception.Create('Por favor, selecione um estoque.');
  end;

  inherited;
  with Owner as TFCadastrarListaComum do
  with registro as TKardex do
  begin
    produto_sq := produto;
    tipo_mov   := IfThen(rgTipoMov.ItemIndex = 0, 'E', 'S');
    qtde       := edQtde.IntValue;
    valor      := edValor.Value;
    data       := Date + Time;
    nfiscal    := edNfiscal.IntValue;
    usuario_sq := TUsuario.Create(DM.useq);
    nr_serie   := mmNrSerie.Text;

    numero_estoque := Integer(listaEstoque.Items.Objects[listaEstoque.Items.IndexOf(listaEstoque.SelectedItem)]);

    salvar;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormMovimentacoes.setProduto(const Value: TProduto);
begin
  _produto := Value;
  edProduto.Text := _produto.codigo_produto + ' - ' + _produto.descricao_produto;

  if (empresaSelecionada.descricao_estoque1 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque1 + '(' + IntToStr(_produto.qtde_estoque1) + ')', TObject(1));

  if (empresaSelecionada.descricao_estoque2 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque2 + '(' + IntToStr(_produto.qtde_estoque2) + ')', TObject(2));

  if (empresaSelecionada.descricao_estoque3 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque3 + '(' + IntToStr(_produto.qtde_estoque3) + ')', TObject(3));

  if (empresaSelecionada.descricao_estoque4 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque4 + '(' + IntToStr(_produto.qtde_estoque4) + ')', TObject(4));

  if (empresaSelecionada.descricao_estoque5 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque5 + '(' + IntToStr(_produto.qtde_estoque5) + ')', TObject(5));

  if (empresaSelecionada.descricao_estoque6 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque6 + '(' + IntToStr(_produto.qtde_estoque6) + ')', TObject(6));

  if (empresaSelecionada.descricao_estoque7 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque7 + '(' + IntToStr(_produto.qtde_estoque7) + ')', TObject(7));

  if (empresaSelecionada.descricao_estoque8 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque8 + '(' + IntToStr(_produto.qtde_estoque8) + ')', TObject(8));

  if (empresaSelecionada.descricao_estoque9 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque9 + '(' + IntToStr(_produto.qtde_estoque9) + ')', TObject(9));

  if (empresaSelecionada.descricao_estoque10 <> '') then
    listaEstoque.Items.AddObject(empresaSelecionada.descricao_estoque10 + '(' + IntToStr(_produto.qtde_estoque10) + ')', TObject(10));
end;

end.
