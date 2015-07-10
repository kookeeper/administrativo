unit UCadastrarFormContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, DBCtrls, DB,
  Mask, RzEdit, DBClient;

type
  TFCadastrarFormContatos = class(TFCadastrarFormComum)
    Label1: TLabel;
    dsListaVendedores: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    mmObservacao: TMemo;
    rgTipo: TRadioGroup;
    rgForma: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    dsListaNfiscaisItens: TDataSource;
    edData: TRzEdit;
    edQtdeProdutos: TRzNumericEdit;
    cbFinalizado: TCheckBox;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FData: TDateTime;
    procedure SetData(const Value: TDateTime);
  public
    property Data: TDateTime read FData write SetData;
  end;

var
  FCadastrarFormContatos: TFCadastrarFormContatos;

implementation

uses UDM, UCadastrarFormClientes, UCadastrarListaClientes, Vendedor,
  Nfiscal;

{$R *.dfm}

procedure TFCadastrarFormContatos.bbOkClick(Sender: TObject);
begin
  inherited;
  if DBLookupComboBox1.KeyValue = null then
  begin
    ModalResult := mrNone;
    raise Exception.Create('Selecione um vendedor.');
  end;
end;

procedure TFCadastrarFormContatos.FormCreate(Sender: TObject);
begin
  inherited;
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  Data := Date + Time;
  dsListaNfiscaisItens.DataSet := TNfiscal.listaVendas(FCadastrarListaClientes.registro.vIndice);
end;

procedure TFCadastrarFormContatos.SetData(const Value: TDateTime);
begin
  FData := Value;
  edData.Text := FormatDateTime('dd/mm/yyyy hh:mm:ss', FData);
end;

end.
