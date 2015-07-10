unit UDiferencaBalancoContagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, RzGrids, Balanco;

type
  TFDiferencaBalancoContagem = class(TForm)
    grid: TRzStringGrid;
    Panel1: TPanel;
    btnFechar: TBitBtn;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    Fcontagem: TBalancoContagem;
    Fbalanco: TBalanco;
    procedure carregaGrid;
    { Private declarations }
  public
    constructor Create(Sender: TComponent; contagem: TBalancoContagem); overload;
    constructor Create(Sender: TComponent; balanco: TBalanco); overload;
    { Public declarations }
  end;

var
  FDiferencaBalancoContagem: TFDiferencaBalancoContagem;

implementation

uses DBClient, Kardex, UDM, Usuario, Produto;

{$R *.dfm}

{ TFDiferencaBalancoContagem }

constructor TFDiferencaBalancoContagem.Create(Sender: TComponent;
  contagem: TBalancoContagem);
begin
  Self.Create(Sender);
  Fcontagem := contagem;

  Caption := 'Diferenca da contagem do balanço (' + Fcontagem.descricao + ')';

  carregaGrid;
end;

constructor TFDiferencaBalancoContagem.Create(Sender: TComponent;
  balanco: TBalanco);
var
  i: Integer;
begin
  Self.Create(Sender);
  Fbalanco := balanco;

  for i:= balanco.listaContagem.Count - 1 downto 0 do
  begin
    if (TBalancoContagem(balanco.listaContagem.Items[i]).status_contagem = Ord(scFinalizada)) then
    begin
      Fcontagem := TBalancoContagem(balanco.listaContagem.Items[i]);
      break;
    end;
  end;

  Caption := 'Alterar estoque conforme contagem do balanço (' + Fcontagem.descricao + ')';

  carregaGrid;
  btnOk.Visible := True;
end;

procedure TFDiferencaBalancoContagem.carregaGrid;
var
  i, qtde_contada, qtde_estoque, qtde_diferenca, linha: Integer;
begin
  grid.ColCount  := 7;
  grid.FixedCols := 6;
  grid.RowCount  := 2;

  grid.ColWidths[0] := 0;
  grid.ColWidths[1] := 0;
  grid.ColWidths[2] := 0;
  grid.ColWidths[3] := 80;
  grid.ColWidths[4] := 80;
  grid.ColWidths[5] := 80;
  grid.ColWidths[6] := 0;

  grid.Cells[0, 0] := 'produto_sq';
  grid.Cells[1, 0] := 'Código';
  grid.Cells[2, 0] := 'Descrição do produto';
  grid.Cells[3, 0] := 'Estoque';
  grid.Cells[4, 0] := 'Contagem';
  grid.Cells[5, 0] := 'Diferença';

  Fcontagem.listaContagemProduto.Sort(compare);

  linha := 1;
  for i := 0 to Fcontagem.listaContagemProduto.Count - 1 do
  begin
    if (TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada = null) then
      continue;

    qtde_contada := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada;

    if (qtde_contada = TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque) then
      continue;

    qtde_estoque := 0;

    if (VarToStr(TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque) <> '') then
      qtde_estoque := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque;

    qtde_diferenca := qtde_contada - qtde_estoque;

    grid.Cells[0, linha] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.vIndice;
    grid.Cells[1, linha] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.codigo_produto;
    grid.Cells[2, linha] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.descricao_produto;
    grid.Cells[3, linha] := IntToStr(qtde_estoque);
    grid.Cells[4, linha] := IntToStr(qtde_contada);
    grid.Cells[5, linha] := IntToStr(qtde_diferenca);

    if (grid.ColWidths[1] < grid.Canvas.TextWidth(grid.Cells[1, linha]) + 4) then
      grid.ColWidths[1] := grid.Canvas.TextWidth(grid.Cells[1, linha]) + 4;
    if (grid.ColWidths[2] < grid.Canvas.TextWidth(grid.Cells[2, linha]) + 4) then
      grid.ColWidths[2] := grid.Canvas.TextWidth(grid.Cells[2, linha]) + 4;

    linha := linha + 1;
    grid.RowCount  := linha;
  end;

  Width := grid.ColWidths[1] + grid.ColWidths[2] + grid.ColWidths[3] + grid.ColWidths[4] + grid.ColWidths[5] + 40;
end;

procedure TFDiferencaBalancoContagem.btnOkClick(Sender: TObject);
var
  i, qtde_contada, qtde_estoque, qtde_diferenca, linha: Integer;
begin
  Fbalanco.salvar;

  for i := 0 to Fcontagem.listaContagemProduto.Count - 1 do
  begin
    if (TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada = null) then
      continue;

    qtde_contada := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada;

    if (qtde_contada = TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque) then
      continue;

    qtde_estoque := 0;

    if (VarToStr(TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque) <> '') then
      qtde_estoque := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque;

    qtde_diferenca := qtde_contada - qtde_estoque;

    TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq := TProduto.Create(TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.vIndice);
    With TKardex.Create do
    begin
      produto_sq := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq;
      tipo_mov   := 'E';
      qtde       := qtde_diferenca;
      data       := Date + Time;
      usuario_sq := TUsuario.Create(DM.useq);
      numero_estoque := Fbalanco.numero_estoque;

      salvar;
    end;
  end;

  Fbalanco.status_balanco := 'T';
  Fbalanco.salvar;
end;

end.
