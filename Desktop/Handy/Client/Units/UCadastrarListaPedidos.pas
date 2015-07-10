unit UCadastrarListaPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, Mask, RzEdit, ImgList, RzButton, ExtCtrls;

type
  TFCadastrarListaPedidos = class(TFCadastrarListaComum)
    cdsListaPedidosItens: TClientDataSet;
    cbAberto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbApagarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cbAbertoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaPedidos: TFCadastrarListaPedidos;

implementation

uses UDM, UCadastrarFormPedidos, DBCtrls, Pedido, HistoricoAlteracao,
  Cadastro, Usuario;

{$R *.DFM}

procedure TFCadastrarListaPedidos.FormCreate(Sender: TObject);
begin
  registro := TPedido.Create;
  inherited;
  CriaOrdem('numero_pedido', True);
end;

procedure TFCadastrarListaPedidos.sbEditarClick(Sender: TObject);
begin
  registro := TPedido.Create;
  inherited;
  try
    FCadastrarFormPedidos := TFCadastrarFormPedidos.Create(Self, TPedido(registro));
    FCadastrarFormPedidos.ShowModal;
  finally
    FreeAndNil(FCadastrarFormPedidos);
  end;
end;

procedure TFCadastrarListaPedidos.sbApagarClick(Sender: TObject);
begin
  if //(not cdsLista.Locate('PEDIDO_SQ', vIndice[StringGrid1.row-1], [])) or
    (cdsLista.FieldByName('NFISCAL_SQ').AsInteger <> 0) then
    raise Exception.Create('Pedido Vinculado a uma Nota Fiscal! Não pode ser Excluído!');

  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  try
    cdsListaPedidosItens.Close;
    DM.SCServer.AppServer.CriaLista ('SELECT * FROM pedidos_itens WHERE PEDIDO_SQ = ' + cdsLista.FieldByName('PEDIDO_SQ').AsString);
    cdsListaPedidosItens.Open;

    While not cdsListaPedidosItens.Eof do
    begin
      TPedidoItem.Create(cdsListaPedidosItens.FieldByName('PEDIDO_ITEM_SQ').AsInteger).excluirRegistro(false);
      cdsListaPedidosItens.Next;
    end;
    cdsListaPedidosItens.Close;

    TPedido.Create(cdsLista.FieldByName(registro.cIndice).AsInteger).excluirRegistro(false);
    AtualizaLista;
  except
    on E: Exception do
    begin
      Showmessage (E.Message);
      DM.EnviarEmail (Tabela, 'APAGAR', Mensagem, Novo);
    end;
  end;
end;

procedure TFCadastrarListaPedidos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  With DBGrid1 do
  begin
    if Column.FieldName = 'statusDescricao' then
    begin
      if cdsLista.FieldByName('status').AsString = 'F' then
      begin
        Canvas.Font.Color := clWhite;
        Canvas.Brush.Color := clGreen;
      end
      else if cdsLista.FieldByName('status').AsString = 'C' then
      begin
        Canvas.Font.Color := clWhite;
        Canvas.Brush.Color := clRed;
      end
      else if cdsLista.FieldByName('notas').AsInteger = 0 then
      begin
        Canvas.Font.Color := clBlack;
        Canvas.Brush.Color := clYellow;
      end;
    end;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFCadastrarListaPedidos.cbAbertoClick(Sender: TObject);
begin
  Filtro1 := '';
  if cbAberto.Checked then
    Filtro1 := 'p.status is null';
  sbFiltro.Click;
end;

end.
