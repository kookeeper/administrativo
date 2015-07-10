unit UCadastrarFormProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Variants;

type
  TFCadastrarFormProdutos = class(TFCadastrarFormComum)
    Label1: TLabel;
    DataSource1: TDataSource;
    Label2: TLabel;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edCodigo: TEdit;
    edDescricao: TEdit;
    edMarca: TEdit;
    edPreco: TEdit;
    edUnidade: TEdit;
    rgTipoProduto: TRadioGroup;
    DataSource2: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label10: TLabel;
    edQtdeLoja: TEdit;
    edQtdeArmazem: TEdit;
    Label9: TLabel;
    Label11: TLabel;
    edQtdeDemo: TEdit;
    edQtdeDefeito: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    edQtdeEmUso: TEdit;
    edQtdeBackup: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edQtdeDemoCli: TEdit;
    edQtdeHLC: TEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormProdutos: TFCadastrarFormProdutos;

implementation

uses UDM, UDMLista;

{$R *.DFM}

procedure TFCadastrarFormProdutos.bbOkClick(Sender: TObject);
begin
  inherited;
  if edQtdeLoja.Text = '' then
    edQtdeLoja.Text := '0';
  if edQtdeArmazem.Text = '' then
    edQtdeArmazem.Text := '0';
  if edQtdeDemo.Text = '' then
    edQtdeDemo.Text := '0';
  if edQtdeDefeito.Text = '' then
    edQtdeDefeito.Text := '0';
  if edQtdeEmUso.Text = '' then
    edQtdeEmUso.Text := '0';
  if edQtdeBackup.Text = '' then
    edQtdeBackup.Text := '0';
  if edQtdeDemoCli.Text = '' then
    edQtdeDemoCli.Text := '0';
  if edQtdeHLC.Text = '' then
    edQtdeHLC.Text := '0';
  if DBLookupComboBox1.KeyValue = Null then
  begin
    ModalResult := mrNone;
    ShowMessage('Escolha um N.C.M.!');
    DBLookupComboBox1.SetFocus;
  end;
end;

procedure TFCadastrarFormProdutos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

end.
