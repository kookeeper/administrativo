unit uConsultarPedidosSemEstoque;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, RzDBGrid, StdCtrls, Buttons, ExtCtrls;

type
  TFConsultarPedidosSemEstoque = class(TForm)
    Panel1: TPanel;
    bbCancelar: TBitBtn;
    RzDBGrid1: TRzDBGrid;
    dsListaPedIns: TDataSource;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultarPedidosSemEstoque: TFConsultarPedidosSemEstoque;

implementation

uses UDM, Pedido;

{$R *.dfm}

procedure TFConsultarPedidosSemEstoque.BitBtn1Click(Sender: TObject);
begin
  DM.ExpExcel (dsListaPedIns.DataSet, '');
end;

procedure TFConsultarPedidosSemEstoque.FormCreate(Sender: TObject);
begin
  dsListaPedIns.DataSet := TPedido.listaSemEstoque();
end;

end.
