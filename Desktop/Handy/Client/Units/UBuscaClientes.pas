unit UBuscaClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit;

type
  TFBuscaClientes = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    DBGrid1: TDBGrid;
    dsBuscaClientes: TDataSource;
    edCodigo: TRzEdit;
    edNome: TRzEdit;
    procedure edCodigoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    { Public declarations }
  end;

var
  FBuscaClientes: TFBuscaClientes;

implementation

uses UDM, Cliente;

{$R *.DFM}

procedure TFBuscaClientes.edCodigoChange(Sender: TObject);
var
  filtro: String;
begin

  if edCodigo.Text <> '' then
    filtro := ' where upper(codigo_cliente) like upper(''%' + edCodigo.Text + '%'')';
  if edNome.Text <> '' then
  begin
    if edCodigo.Text <> '' then
      filtro := filtro + ' and '
    else filtro := filtro + ' where ';
    filtro := filtro + ' upper(nome_cliente) like upper(''%' + edNome.Text + '%'')';
  end;
  filtro := filtro + ' order by nome_cliente';
  dsBuscaClientes.DataSet := TCliente.listaRegistros(filtro);
end;

procedure TFBuscaClientes.DBGrid1DblClick(Sender: TObject);
begin
  bbOk.Click;
end;

procedure TFBuscaClientes.FormCreate(Sender: TObject);
begin
  dsBuscaClientes.DataSet := TCliente.listaRegistros('order by nome_cliente');
end;

procedure TFBuscaClientes.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_DOWN then
  begin
    DBGrid1.SetFocus;
  end;
end;

end.
