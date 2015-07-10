unit UConsultarContatos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, DBCtrls, Grids, DBGrids, ExtCtrls;

type
  TFConsultarContatos = class(TForm)
    dsListaVendedores: TDataSource;
    dsListaClientes: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    bbFechar: TBitBtn;
    Timer1: TTimer;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    dblVendedor: TDBLookupListBox;
    dblCliente: TDBLookupListBox;
    dsListaContatos: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure dblVendedorClick(Sender: TObject);
    procedure dblClienteClick(Sender: TObject);
    procedure dblVendedorKeyPress(Sender: TObject; var Key: Char);
    procedure dblClienteKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultarContatos: TFConsultarContatos;

implementation

uses UDM, Vendedor, Cliente, DBClient;

{$R *.dfm}

procedure TFConsultarContatos.FormActivate(Sender: TObject);
begin
  dsListaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
end;

procedure TFConsultarContatos.FormDeactivate(Sender: TObject);
begin
  dsListaClientes.DataSet.Close;
  dsListaContatos.DataSet.Close;
  dsListaVendedores.DataSet.Close;
end;

procedure TFConsultarContatos.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  if Timer1.Tag = 1 then
  begin
    DBGrid1.Columns.Items[0].FieldName := 'NOME_CLIENTE';
    DBGrid1.Columns.Items[0].Title.Caption := 'Cliente';
    dsListaContatos.DataSet := TContato.buscaContatosVendedor(dsListaVendedores.DataSet.FieldByName('VENDEDOR_SQ').AsInteger);
  end
  else begin
    DBGrid1.Columns.Items[0].FieldName := 'NOME_VENDEDOR';
    DBGrid1.Columns.Items[0].Title.Caption := 'Vendedor';
    dsListaContatos.DataSet := TContato.buscaContatosCliente(dsListaClientes.DataSet.FieldByName('CLIENTE_SQ').AsInteger);
  end;
end;

procedure TFConsultarContatos.dblVendedorClick(Sender: TObject);
begin
  Timer1.Tag := 1;
  Timer1.Enabled := True;
end;

procedure TFConsultarContatos.dblClienteClick(Sender: TObject);
begin
  Timer1.Tag := 2;
  Timer1.Enabled := True;
end;

procedure TFConsultarContatos.dblVendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  dblVendedorClick(nil);
end;

procedure TFConsultarContatos.dblClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  dblClienteClick(nil);
end;

procedure TFConsultarContatos.DBGrid1TitleClick(Column: TColumn);
begin
  if TClientDataSet(dsListaContatos.DataSet).IndexDefs.IndexOf(Column.FieldName) < 0 then
  With TClientDataSet(dsListaContatos.DataSet).IndexDefs.AddIndexDef do
  begin
    Fields := Column.FieldName;
    DescFields := 'DATA_CONTATO';
  end;
  TClientDataSet(dsListaContatos.DataSet).IndexName := Column.FieldName;
end;

end.
