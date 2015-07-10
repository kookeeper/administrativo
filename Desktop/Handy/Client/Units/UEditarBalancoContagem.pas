unit UEditarBalancoContagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, RzGrids, Balanco, StdCtrls, Buttons, ExtCtrls;

type
  TFEditarBalancoContagem = class(TForm)
    grid: TRzStringGrid;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    procedure bbOkClick(Sender: TObject);
    procedure gridKeyPress(Sender: TObject; var Key: Char);
    procedure bbCancelarClick(Sender: TObject);
  private
    Fcontagem: TBalancoContagem;
    { Private declarations }
  public
    constructor Create(Sender: TComponent; contagem: TBalancoContagem); overload;
    { Public declarations }
  end;

var
  FEditarBalancoContagem: TFEditarBalancoContagem;

implementation

uses Cadastro, Produto;

{$R *.dfm}

{ TFEditarBalancoContagem }

constructor TFEditarBalancoContagem.Create(Sender: TComponent;
  contagem: TBalancoContagem);
var
  i: Integer;
begin
  Self.Create(Sender);
  Fcontagem := contagem;

  Caption := 'Digitação da contagem do balanço (' + Fcontagem.descricao + ')';

  grid.ColCount  := 4;
  grid.FixedCols := 3;
  grid.RowCount  := Fcontagem.listaContagemProduto.Count + 1;

  grid.ColWidths[0] := 0;
  grid.ColWidths[1] := 0;
  grid.ColWidths[2] := 0;
  grid.ColWidths[3] := 80;

  grid.Cells[0, 0] := 'produto_sq';
  grid.Cells[1, 0] := 'Código';
  grid.Cells[2, 0] := 'Descrição do produto';
  grid.Cells[3, 0] := 'Quantidade';

  Fcontagem.listaContagemProduto.Sort(compare);

  for i := 0 to Fcontagem.listaContagemProduto.Count - 1 do
  begin
    grid.Cells[0, i+1] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.vIndice;
    grid.Cells[1, i+1] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.codigo_produto;
    grid.Cells[2, i+1] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.descricao_produto;
    if (TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada <> null) then
      grid.Cells[3, i+1] := TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada;
    if (grid.ColWidths[1] < grid.Canvas.TextWidth(grid.Cells[1, i+1]) + 4) then
      grid.ColWidths[1] := grid.Canvas.TextWidth(grid.Cells[1, i+1]) + 4;
    if (grid.ColWidths[2] < grid.Canvas.TextWidth(grid.Cells[2, i+1]) + 4) then
      grid.ColWidths[2] := grid.Canvas.TextWidth(grid.Cells[2, i+1]) + 4;
  end;

  Width := grid.ColWidths[1] + grid.ColWidths[2] + grid.ColWidths[3] + 40;
end;

procedure TFEditarBalancoContagem.bbOkClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Fcontagem.listaContagemProduto.Count - 1 downto 0  do
  begin
    if (TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).produto_sq.vIndice <> StrToInt(grid.Cells[0, i+1])) then
      raise Exception.Create('Erro ao registrar digitação.');

    if (grid.Cells[3, i+1] <> '') then
    begin
      try
        TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada := StrToInt(grid.Cells[3, i+1]);
      except on E: EConvertError do
        begin
          raise Exception.Create('Não foi possível converter ' + QuotedStr(grid.Cells[3, i+1]) + ' para Inteiro.');
        end;
      end;
    end else
    begin
      TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_contada := null;
    end;
  end;
end;

procedure TFEditarBalancoContagem.gridKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    if (grid.Row = grid.RowCount - 1) then
      bbOk.Click
    else
      grid.Row := grid.Row + 1;
  end
end;

procedure TFEditarBalancoContagem.bbCancelarClick(Sender: TObject);
var
  i: Integer;
begin
  for i := Fcontagem.listaContagemProduto.Count - 1 downto 0  do
  begin
    if (TBalancoContagemProduto(Fcontagem.listaContagemProduto.Items[i]).qtde_estoque = null) then
      Fcontagem.listaContagemProduto.Delete(i);
  end;
end;

end.
