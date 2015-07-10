unit uPesquisarPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, StdCtrls, Buttons, ExtCtrls;

type
  TFPesquisarPedido = class(TForm)
    Panel1: TPanel;
    btnEscolher: TBitBtn;
    btnCancelar: TBitBtn;
    RzDBGrid1: TRzDBGrid;
    dsListaPedido: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEscolherClick(Sender: TObject);
    procedure RzDBGrid1DblClick(Sender: TObject);
  private
    Fnumero_pedido: Integer;
    procedure Setnumero_pedido(const Value: Integer);
    { Private declarations }
  public
    property numero_pedido: Integer read Fnumero_pedido write Setnumero_pedido;
    { Public declarations }
  end;

var
  FPesquisarPedido: TFPesquisarPedido;

implementation

uses Pedido;

{$R *.dfm}

procedure TFPesquisarPedido.FormCreate(Sender: TObject);
begin
  dsListaPedido.DataSet := TPedido.listaPedidoPendente;
end;

procedure TFPesquisarPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsListaPedido.DataSet.Close;
end;

procedure TFPesquisarPedido.btnEscolherClick(Sender: TObject);
begin
  numero_pedido := dsListaPedido.DataSet.FieldByName('numero_pedido').Value;  
end;

procedure TFPesquisarPedido.Setnumero_pedido(const Value: Integer);
begin
  Fnumero_pedido := Value;
end;

procedure TFPesquisarPedido.RzDBGrid1DblClick(Sender: TObject);
begin
  btnEscolher.Click;
end;

end.
