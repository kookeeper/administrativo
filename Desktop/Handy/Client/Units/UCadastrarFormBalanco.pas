unit UCadastrarFormBalanco;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  RzDBCmbo, Mask, RzEdit, RzLabel, RzPanel, RzCmboBx, RzSpnEdt, ComCtrls,
  RzListVw, RzTreeVw, RzLstBox, Balanco, RzButton;

type
  TFCadastrarFormBalanco = class(TFCadastrarFormComum)
    RzGroupBox1: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    cbEstoque: TRzComboBox;
    edGrupoBalanco: TRzSpinner;
    RzLabel4: TRzLabel;
    RzGroupBox2: TRzGroupBox;
    RzTreeView1: TRzTreeView;
    bbIniciar: TBitBtn;
    bbTerminar: TBitBtn;
    Panel2: TPanel;
    btnIniciarContagem: TBitBtn;
    btnTerminarContagem: TBitBtn;
    dtInicio: TRzEdit;
    dtTermino: TRzEdit;
    btnMostrarDiferenca: TBitBtn;
    RzLabel5: TRzLabel;
    edQtdeContagem: TRzSpinner;
    btnCorrigirEstoque: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure bbIniciarClick(Sender: TObject);
    procedure bbTerminarClick(Sender: TObject);
    procedure btnIniciarContagemClick(Sender: TObject);
    procedure btnTerminarContagemClick(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure RzTreeView1DblClick(Sender: TObject);
    procedure btnMostrarDiferencaClick(Sender: TObject);
    procedure btnCorrigirEstoqueClick(Sender: TObject);
  private
    procedure atualizarNode(node: TTreeNode);
    procedure atualizarListaContagem();
    function buscarContagemFinalizada: TTreeNode;
    function buscarContagemEmAndamento: TTreeNode;
    function buscarContagemPendente: TTreeNode;
    procedure atualizaEdicao;
    procedure mostrarDiferencaContagem(contagem: TBalancoContagem);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormBalanco: TFCadastrarFormBalanco;

implementation

uses Produto, Empresa, TypInfo, UEditarBalancoContagem,
  UCadastrarListaComum, UDiferencaBalancoContagem;

{$R *.dfm}

procedure TFCadastrarFormBalanco.FormCreate(Sender: TObject);
begin
  inherited;
  cbEstoque.Clear;
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque1, TObject(1));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque2, TObject(2));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque3, TObject(3));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque4, TObject(4));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque5, TObject(5));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque6, TObject(6));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque7, TObject(7));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque8, TObject(8));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque9, TObject(9));
  cbEstoque.AddObject(empresaSelecionada.descricao_estoque10, TObject(10));
  cbEstoque.ItemIndex := 0;

  registro := TFCadastrarListaComum(Owner).registro;

  if (registro.vIndice <> null) then
  begin
    dtInicio.Text         := FormatDateTime('dd/mm/yyyy hh:nn', TBalanco(registro).data_inicio_balanco);
    dtTermino.Text        := FormatDateTime('dd/mm/yyyy hh:nn', TBalanco(registro).data_termino_balanco);
    cbEstoque.ItemIndex   := cbEstoque.Items.IndexOfObject(TObject(TBalanco(registro).numero_estoque));
    edQtdeContagem.Value  := TBalanco(registro).qtde_contagem;
  end;
  atualizaEdicao;
  atualizarListaContagem;
end;

procedure TFCadastrarFormBalanco.bbIniciarClick(Sender: TObject);
begin
  TBalanco(registro).qtde_contagem := edQtdeContagem.Value;
  TBalanco(registro).numero_estoque := Integer(cbEstoque.Items.Objects[cbEstoque.ItemIndex]);
  TBalanco(registro).grupo_balanco := edGrupoBalanco.Value;
  TBalanco(registro).iniciarBalanco;
  dtInicio.Text := FormatDateTime('dd/mm/yyyy hh:nn', TBalanco(registro).data_inicio_balanco);
  atualizarListaContagem;
  atualizaEdicao;
end;

procedure TFCadastrarFormBalanco.bbTerminarClick(Sender: TObject);
begin
  inherited;
  TBalanco(registro).data_termino_balanco := Date + Time;
  dtTermino.Text := FormatDateTime('dd/mm/yyyy hh:nn', TBalanco(registro).data_termino_balanco);
  atualizaEdicao;
end;

procedure TFCadastrarFormBalanco.btnIniciarContagemClick(Sender: TObject);
var
  node: TTreeNode;
begin
  node := buscarContagemPendente;
  TBalanco(registro).IniciarContagem(TBalancoContagem(node.Data));
  atualizarNode(node);
  atualizaEdicao;

  try
    FEditarBalancoContagem := TFEditarBalancoContagem.Create(Self, TBalancoContagem(node.Data));
    FEditarBalancoContagem.ShowModal;
  finally
    FreeAndNil(FEditarBalancoContagem);
  end;
end;

procedure TFCadastrarFormBalanco.btnTerminarContagemClick(
  Sender: TObject);
var
  node: TTreeNode;
begin
  node := buscarContagemEmAndamento;
  if (node <> nil) then
  begin
    TBalanco(registro).FinalizarContagem(TBalancoContagem(node.Data));
    mostrarDiferencaContagem(TBalancoContagem(node.Data));
    atualizarNode(node);
    atualizaEdicao;
  end;
end;

function TFCadastrarFormBalanco.buscarContagemPendente: TTreeNode;
var
  i: Integer;
  node: TTreeNode;
begin
  node := buscarContagemEmAndamento;

  if (node = nil) then
  begin
    for i:= 0 to RzTreeView1.Items.Count - 1 do
    begin
      if (TBalancoContagem(RzTreeView1.Items.Item[i].Data).status_contagem = Ord(scPendente)) then
      begin
        node := RzTreeView1.Items.Item[i];
        break;
      end;
    end;
  end;
  if (node = nil) then
    raise Exception.Create('Não existe nenhuma contagem pendente.');

  result := node;
end;

function TFCadastrarFormBalanco.buscarContagemEmAndamento: TTreeNode;
var
  i: Integer;
  node: TTreeNode;
begin
  node := nil;
  
  for i:= 0 to RzTreeView1.Items.Count - 1 do
  begin
    if (TBalancoContagem(RzTreeView1.Items.Item[i].Data).status_contagem = Ord(scAndamento)) then
    begin
      node := RzTreeView1.Items.Item[i];
      break;
    end;
  end;

  result := node;
end;

procedure TFCadastrarFormBalanco.atualizarNode(node: TTreeNode);
begin
  node.Text := TBalancoContagem(node.Data).descricao + ' - Status: ' + TBalancoContagem(node.Data).descricaoStatus;
end;

procedure TFCadastrarFormBalanco.bbOkClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrNone;

  With (TBalanco(registro)) do
  begin
    qtde_contagem := edQtdeContagem.Value;
    numero_estoque := Integer(cbEstoque.Items.Objects[cbEstoque.ItemIndex]);
    salvar;
  end;

  ModalResult := mrOk;
end;

procedure TFCadastrarFormBalanco.atualizarListaContagem;
var
  i: Integer;
begin
  RzTreeView1.Items.Clear;
  for i := 0 to TBalanco(registro).listaContagem.Count - 1 do
  begin
    RzTreeView1.Items.AddObject(nil, TBalancoContagem(TBalanco(registro).listaContagem.Items[i]).descricao + ' - Status: ' + TBalancoContagem(TBalanco(registro).listaContagem.Items[i]).descricaoStatus, TBalancoContagem(TBalanco(registro).listaContagem.Items[i]));
{
    With (TRzBitBtn.Create(RzPanel1)) do
    begin
      Height := 65;
      Align := alTop;
      Parent := RzPanel1;
      Name := 'RzBitBtn' + IntToStr(i);
      Top := 1000;
      HotTrack := True;
      Caption := TBalancoContagem(TBalanco(registro).listaContagem.Items[i]).descricao + #13+#10 + 'Status: ' + TBalancoContagem(TBalanco(registro).listaContagem.Items[i]).descricaoStatus;
      Alignment := taLeftJustify;
    end;
}
  end;
end;

procedure TFCadastrarFormBalanco.atualizaEdicao;
begin
  bbOk.Enabled                  := TBalanco(registro).data_termino_balanco = 0;
  edQtdeContagem.Enabled        := TBalanco(registro).data_inicio_balanco = 0;
  edGrupoBalanco.Enabled        := TBalanco(registro).data_inicio_balanco = 0;
  cbEstoque.Enabled             := TBalanco(registro).data_inicio_balanco = 0;
  bbIniciar.Enabled             := TBalanco(registro).data_inicio_balanco = 0;
  bbTerminar.Enabled            := (not TBalanco(registro).temContagemAberta) and (TBalanco(registro).data_termino_balanco = 0);
  btnIniciarContagem.Enabled    := TBalanco(registro).temContagemAberta;
  btnTerminarContagem.Enabled   := TBalanco(registro).temContagemEmAndamento;
  btnCorrigirEstoque.Enabled    := (TBalanco(registro).data_termino_balanco <> 0) and (TBalanco(registro).status_balanco <> 'T');
end;

procedure TFCadastrarFormBalanco.mostrarDiferencaContagem(
  contagem: TBalancoContagem);
begin
  try
    FDiferencaBalancoContagem := TFDiferencaBalancoContagem.Create(Self, contagem);
    FDiferencaBalancoContagem.ShowModal;
  finally
    FreeAndNil(FDiferencaBalancoContagem);
  end;
end;

procedure TFCadastrarFormBalanco.RzTreeView1DblClick(Sender: TObject);
var
  node: TTreeNode;
begin
  node := RzTreeView1.Selected;
  if (node = nil) then
  begin
    node := buscarContagemEmAndamento;
    if (node = nil) then
    begin
      node := buscarContagemFinalizada;
    end;
  end;

  if (node <> nil) then
  begin
    mostrarDiferencaContagem(TBalancoContagem(node.Data));
  end
  else
    ShowMessage('Nenhuma contagem selecionada.');
end;

procedure TFCadastrarFormBalanco.btnMostrarDiferencaClick(Sender: TObject);
begin
  RzTreeView1DblClick(nil);
end;

function TFCadastrarFormBalanco.buscarContagemFinalizada: TTreeNode;
var
  i: Integer;
  node: TTreeNode;
begin
  for i:= RzTreeView1.Items.Count - 1 downto 0 do
  begin
    if (TBalancoContagem(RzTreeView1.Items.Item[i].Data).status_contagem = Ord(scFinalizada)) then
    begin
      node := RzTreeView1.Items.Item[i];
      break;
    end;
  end;

  result := node;
end;

procedure TFCadastrarFormBalanco.btnCorrigirEstoqueClick(Sender: TObject);
begin
  try
    FDiferencaBalancoContagem := TFDiferencaBalancoContagem.Create(Self, TBalanco(registro));
    FDiferencaBalancoContagem.ShowModal;
    atualizaEdicao; 
  finally
    FreeAndNil(FDiferencaBalancoContagem);
  end;
end;

end.
