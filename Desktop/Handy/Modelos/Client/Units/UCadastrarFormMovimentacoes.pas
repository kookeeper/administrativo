unit UCadastrarFormMovimentacoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask,
  DB;

type
  TFCadastrarFormMovimentacoes = class(TFCadastrarFormComum)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    rgTipoMov: TRadioGroup;
    edData: TEdit;
    edQtde: TEdit;
    edValor: TEdit;
    edNfiscal: TEdit;
    DataSource1: TDataSource;
    Label6: TLabel;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    DBEdit2: TDBEdit;
    mmNrSerie: TMemo;
    rgTipoItem: TRadioGroup;
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgTipoItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormMovimentacoes: TFCadastrarFormMovimentacoes;

implementation

uses UDM, UDMLista;

{$R *.dfm}

procedure TFCadastrarFormMovimentacoes.DBLookupComboBox2Click(
  Sender: TObject);
begin
  inherited;
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
end;

procedure TFCadastrarFormMovimentacoes.DBLookupComboBox1Click(
  Sender: TObject);
begin
  inherited;
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
end;

procedure TFCadastrarFormMovimentacoes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFCadastrarFormMovimentacoes.rgTipoItemClick(Sender: TObject);
begin
  inherited;
  if rgTipoItem.ItemIndex = 0 then
  begin
    Label7.Caption := 'Peça';
    DBLookupComboBox1.ListField := 'CODIGO_PECA';
    DBLookupComboBox1.KeyField  := 'DESCRICAO_PECA';
    DataSource1.DataSet := DMLista.cdsListaPecas;
    Label8.Visible  := True;
    DBEdit5.Visible := True;
    DBEdit2.Visible := True;
  end
  else begin
    Label7.Caption := 'Modelo';
    DBLookupComboBox1.ListField := 'CODIGO_MODELO';
    DBLookupComboBox1.KeyField  := 'DESCRICAO_MODELO';
    DataSource1.DataSet := DMLista.cdsListaModelos;
    Label8.Visible  := False;
    DBEdit5.Visible := False;
    DBEdit2.Visible := False;
  end;                      
end;

end.
