unit UCadastrarFormEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, RzLstBox, RzEdit, Mask, RzPanel,
  RzRadGrp, Buttons, ExtCtrls, Produto, RzCmboBx;

type
  TFCadastrarFormEstoque = class(TFCadastrarFormComum)
    Label3: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    rgTipoMov: TRzRadioGroup;
    edProduto: TRzEdit;
    edNfiscal: TRzNumericEdit;
    edValor: TRzNumericEdit;
    listBoxNumerosSerie: TRzListBox;
    Label1: TLabel;
    comboNumeroEstoque: TRzComboBox;
    Label2: TLabel;
    edDtMovimento: TRzDateTimeEdit;
    sbIncluir: TSpeedButton;
    sbExcluir: TSpeedButton;
    procedure bbOkClick(Sender: TObject);
    procedure rgTipoMovClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure comboNumeroEstoqueChange(Sender: TObject);
    procedure sbIncluirClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
  private
    _produto: TProduto;
    procedure setProduto(const Value: TProduto);
    { Private declarations }
  public
    property produto: TProduto read _produto write setProduto;
  end;

var
  FCadastrarFormEstoque: TFCadastrarFormEstoque;

implementation

uses UDM, UCadastrarListaComum;

{$R *.dfm}

{ TFCadastrarFormEstoque }

procedure TFCadastrarFormEstoque.setProduto(const Value: TProduto);
begin
  _produto := Value;
  edProduto.Text := _produto.codigo_produto + ' - ' + _produto.descricao_produto;
  comboNumeroEstoque.Items := _produto.listaEstoques;
end;

procedure TFCadastrarFormEstoque.bbOkClick(Sender: TObject);
var
  registro: TProdutoNumeroSerie;
  indice: Integer;
begin
  try
    if (comboNumeroEstoque.Text = '') then
      raise Exception.Create('Por favor, selecione um estoque.');

    inherited;
    if (rgTipoMov.ItemIndex = 0) then // entrada
    begin
      for indice := 0 to listBoxNumerosSerie.Items.Count - 1 do
      begin
        TProdutoNumeroSerie.entrada(_produto, listBoxNumerosSerie.Items[indice],
          Integer(comboNumeroEstoque.Items.Objects[
            comboNumeroEstoque.Items.IndexOf(comboNumeroEstoque.Text)]),
          edValor.Value,
          edDtMovimento.Date + Time,
          edNfiscal.IntValue);
      end;
    end
    else // saida
    begin
      if (listBoxNumerosSerie.SelectedItem = '') then
        raise Exception.Create('Por favor, selecione um número de série para saída do estoque.');

      registro := TProdutoNumeroSerie(listBoxNumerosSerie.Items.Objects[listBoxNumerosSerie.Items.IndexOf(listBoxNumerosSerie.SelectedItem)]);
      TProdutoNumeroSerie.saida(registro.numero_serie,
        edValor.Value,
        edNfiscal.IntValue,
        edDtMovimento.Date + Time);
    end;
  except on E: Exception do
    begin
      ShowMessage(e.Message);
      ModalResult := mrNone;
    end;
  end;
end;

procedure TFCadastrarFormEstoque.rgTipoMovClick(Sender: TObject);
begin
  inherited;
  sbIncluir.Visible := rgTipoMov.ItemIndex = 0;
  sbExcluir.Visible := sbIncluir.Visible;
  listBoxNumerosSerie.Items.Clear;
end;

procedure TFCadastrarFormEstoque.FormCreate(Sender: TObject);
begin
  inherited;
  rgTipoMovClick(nil);
  edDtMovimento.Date := Date;
end;

procedure TFCadastrarFormEstoque.comboNumeroEstoqueChange(Sender: TObject);
var
  item: Integer;
begin
  if (not sbIncluir.Visible) then
  begin
    item := Integer(TRzComboBox(Sender).Items.Objects[TRzComboBox(Sender).ItemIndex]);

    listBoxNumerosSerie.Items := _produto.listaNumeroSerie(item);
  end;
end;

procedure TFCadastrarFormEstoque.sbIncluirClick(Sender: TObject);
var
  i: Integer;
  listaNumeroSerie: TStrings;
begin
  try
    if (comboNumeroEstoque.ItemIndex < 0) then
      raise Exception.Create('Por favor, selecione um estoque.');

    listaNumeroSerie := TStringList.Create;
    InputArea('Número de série', 'Digite os números de série que deseja incluir (um por linha)', listaNumeroSerie);
    for i := 0 to listaNumeroSerie.Count - 1 do
    begin
      if (Trim(listaNumeroSerie.Strings[i]) = '') then
        continue;

      if (listBoxNumerosSerie.Items.IndexOf(Trim(listaNumeroSerie.Strings[i])) >= 0) then
        continue;

      listBoxNumerosSerie.Items.Add(Trim(listaNumeroSerie.Strings[i]));
    end;

    listBoxNumerosSerie.Sorted := True;
    listBoxNumerosSerie.SetFocus;
  finally
    FreeAndNil(listaNumeroSerie);
  end;
end;

procedure TFCadastrarFormEstoque.sbExcluirClick(Sender: TObject);
begin
  if (listBoxNumerosSerie.SelectedItem <> '') then
    listBoxNumerosSerie.Items.Delete(listBoxNumerosSerie.ItemIndex)
  else
    raise Exception.Create('Por favor, selecione uma linha para ser excluída.');
end;

end.
