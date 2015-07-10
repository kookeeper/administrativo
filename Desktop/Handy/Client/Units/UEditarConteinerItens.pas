unit UEditarConteinerItens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, DBCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFEditarConteinerItens = class(TForm)
    Label3: TLabel;
    Label5: TLabel;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    dsListaProdutos: TDataSource;
    edQtde: TRzEdit;
    procedure DBLookupComboBox2Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEditarConteinerItens: TFEditarConteinerItens;

implementation

uses Produto;

{$R *.dfm}

procedure TFEditarConteinerItens.DBLookupComboBox2Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
end;

procedure TFEditarConteinerItens.DBLookupComboBox1Click(Sender: TObject);
begin
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
end;

procedure TFEditarConteinerItens.bbOkClick(Sender: TObject);
begin
  try
    StrtoInt (edQtde.Text);
  except
    edQtde.Text := '0';
  end;
end;

procedure TFEditarConteinerItens.FormCreate(Sender: TObject);
begin
  dsListaProdutos.DataSet := TProduto.listaProdutoAtivo('order by descricao_produto');
end;

end.
