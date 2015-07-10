unit uTransferenciaEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RzLstBox, RzCmboBx, DB, DBCtrls,
  RzDBCmbo, Produto, Mask, RzEdit;

type
  TFTransferenciaEstoque = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblQtde: TLabel;
    lblNumeroSerie: TLabel;
    listBoxNumerosSerie: TRzListBox;
    comboNumeroEstoqueOrigem: TRzComboBox;
    comboNumeroEstoqueDestino: TRzComboBox;
    dsListaProdutos: TDataSource;
    edProduto: TRzEdit;
    edQtde: TRzNumericEdit;
    procedure comboNumeroEstoqueOrigemChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
  private
    _produto: TProduto;
    procedure setProduto(const Value: TProduto);
    { Private declarations }
  public
    property produto: TProduto write setProduto;
    { Public declarations }
  end;

var
  FTransferenciaEstoque: TFTransferenciaEstoque;

implementation

uses Kardex, UDM, Usuario;

{$R *.dfm}

procedure TFTransferenciaEstoque.comboNumeroEstoqueOrigemChange(
  Sender: TObject);
var
  item: Integer;
begin
  item := Integer(TRzComboBox(Sender).Items.Objects[TRzComboBox(Sender).ItemIndex]);

  listBoxNumerosSerie.Items := _produto.listaNumeroSerie(item);
end;

procedure TFTransferenciaEstoque.setProduto(const Value: TProduto);
begin
  _produto := Value;
  edProduto.Text := _produto.descricao_produto;
  comboNumeroEstoqueOrigem.Items := _produto.listaEstoques;
  comboNumeroEstoqueDestino.Items := _produto.listaEstoques;

  lblQtde.Visible := _produto.controle_numero_serie = 0;
  edQtde.Visible  := _produto.controle_numero_serie = 0;

  lblNumeroSerie.Visible      := _produto.controle_numero_serie = 1;
  listBoxNumerosSerie.Visible := _produto.controle_numero_serie = 1;
end;

procedure TFTransferenciaEstoque.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_produto);
end;

procedure TFTransferenciaEstoque.bbOkClick(Sender: TObject);
var
  agora: TDateTime;
  i: Integer;
  numeroSerie: TProdutoNumeroSerie;
begin
  agora := Date + Time;

  if (_produto.controle_numero_serie = 0) then
  begin
    With TKardex.Create do
    begin
      produto_sq := _produto;
      tipo_mov   := 'S';
      qtde       := edQtde.IntValue;
      numero_estoque := Integer(comboNumeroEstoqueOrigem.Items.Objects[comboNumeroEstoqueOrigem.ItemIndex]);
      data       := agora;
      usuario_sq := TUsuario.Create(DM.useq);
      salvar;
    end;
    With TKardex.Create do
    begin
      produto_sq := _produto;
      tipo_mov   := 'E';
      qtde       := edQtde.IntValue;
      numero_estoque := Integer(comboNumeroEstoqueDestino.Items.Objects[comboNumeroEstoqueDestino.ItemIndex]);
      data       := agora;
      usuario_sq := TUsuario.Create(DM.useq);
      salvar;
    end;
  end
  else
  begin
    for i := 0 to listBoxNumerosSerie.Items.Count - 1 do
    begin
      if (listBoxNumerosSerie.Selected[i]) then
      begin
        numeroSerie := TProdutoNumeroSerie(listBoxNumerosSerie.Items.Objects[i]);
        numeroSerie.numero_estoque := Integer(comboNumeroEstoqueDestino.Items.Objects[comboNumeroEstoqueDestino.ItemIndex]);
        numeroSerie.salvar;

        With TKardex.Create do
        begin
          produto_sq := _produto;
          tipo_mov   := 'S';
          qtde       := 1;
          numero_estoque := Integer(comboNumeroEstoqueOrigem.Items.Objects[comboNumeroEstoqueOrigem.ItemIndex]);
          data       := agora;
          usuario_sq := TUsuario.Create(DM.useq);
          nr_serie   := numeroSerie.numero_serie;
          salvar;
        end;
        With TKardex.Create do
        begin
          produto_sq := _produto;
          tipo_mov   := 'E';
          qtde       := 1;
          numero_estoque := Integer(comboNumeroEstoqueDestino.Items.Objects[comboNumeroEstoqueDestino.ItemIndex]);
          data       := agora;
          usuario_sq := TUsuario.Create(DM.useq);
          nr_serie   := numeroSerie.numero_serie;
          salvar;
        end;
      end;
    end;
  end;
end;

end.
