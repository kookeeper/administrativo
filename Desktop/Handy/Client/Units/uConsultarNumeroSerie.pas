unit uConsultarNumeroSerie;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, StdCtrls, Buttons, ExtCtrls,
  RzButton, RzRadChk, RzCmboBx, DBCtrls, RzDBCmbo, Mask, RzEdit, RzPanel,
  RzRadGrp;

type
  TFConsultarNumeroSerie = class(TForm)
    Panel1: TPanel;
    bbCancelar: TBitBtn;
    BitBtn1: TBitBtn;
    RzDBGrid1: TRzDBGrid;
    dsListaEstoque: TDataSource;
    Panel2: TPanel;
    comboProduto: TRzDBLookupComboBox;
    dsListaProdutos: TDataSource;
    comboNumeroEstoque: TRzComboBox;
    cbProduto: TRzCheckBox;
    cbEstoque: TRzCheckBox;
    edNumeroSerie: TRzEdit;
    Label1: TLabel;
    cbEmEstoque: TRzCheckBox;
    lbItens: TLabel;
    Label3: TLabel;
    rgCampoPesquisa: TRzRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbProdutoClick(Sender: TObject);
    procedure RzDBGrid1DblClick(Sender: TObject);
    procedure rgCampoPesquisaClick(Sender: TObject);
  private
    procedure AtualizaLista();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultarNumeroSerie: TFConsultarNumeroSerie;

implementation

uses Produto, UDM, Empresa, UMainMenu, UCadastrarListaNfiscais;

{$R *.dfm}

procedure TFConsultarNumeroSerie.BitBtn1Click(Sender: TObject);
begin
  DM.ExpExcel (dsListaEstoque.DataSet, '');
end;

procedure TFConsultarNumeroSerie.FormCreate(Sender: TObject);
begin
  comboNumeroEstoque.Items := empresaSelecionada.listaEstoques;
  dsListaProdutos.DataSet := TProduto.montaLista();
  comboNumeroEstoque.ItemIndex := 0;
  comboProduto.KeyValue := dsListaProdutos.DataSet.FieldByName('produto_sq').Value;
end;

procedure TFConsultarNumeroSerie.AtualizaLista;
var
  produto_sq, numeroEstoque: Integer;
begin
  comboProduto.Enabled := cbProduto.Checked;
  comboNumeroEstoque.Enabled := cbEstoque.Checked;

  if (cbProduto.Checked) then
    produto_sq := comboProduto.KeyValue
  else
    produto_sq := 0;

  if (cbEstoque.Checked) then
    numeroEstoque := Integer(comboNumeroEstoque.Items.Objects[comboNumeroEstoque.ItemIndex])
  else
    numeroEstoque := 0;

  dsListaEstoque.DataSet := TProdutoNumeroSerie.listaEstoque(produto_sq, numeroEstoque,
    edNumeroSerie.Text, cbEmEstoque.Checked);

  lbItens.Caption := IntToStr(dsListaEstoque.DataSet.RecordCount);
end;

procedure TFConsultarNumeroSerie.cbProdutoClick(Sender: TObject);
begin
  AtualizaLista;
end;

procedure TFConsultarNumeroSerie.RzDBGrid1DblClick(Sender: TObject);
begin
  if RzDBGrid1.DataSource.DataSet.FieldByName('numero_nfiscal').AsInteger > 0 then
  begin
    FMainMenu.NotasFiscais1.Click;
    FCadastrarListaNfiscais.cbFiltro.Text := 'n.nfiscal_sq';
    FCadastrarListaNfiscais.edFiltro.Text := RzDBGrid1.DataSource.DataSet.FieldByName('nfiscal_sq').AsString;
    FCadastrarListaNfiscais.sbFiltro.Click;
    FCadastrarListaNfiscais.sbEditarClick(Sender);
    FCadastrarListaNfiscais.sbSair.Click;
  end;
end;

procedure TFConsultarNumeroSerie.rgCampoPesquisaClick(Sender: TObject);
begin
  dsListaProdutos.DataSet.Close;
  comboProduto.ListFieldIndex := rgCampoPesquisa.ItemIndex;
  dsListaProdutos.DataSet := TProduto.montaLista();
end;

end.
