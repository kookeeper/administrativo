unit UCorrecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, Grids, DBGrids, StdCtrls, ExtCtrls,
  ComCtrls, DBTables;

type
  TFCorrecao = class(TForm)
    IBQuery1: TIBQuery;
    IBQuery1NUMERO_PEDIDO: TIntegerField;
    IBQuery1PEDIDO_ITEM_SQ: TIntegerField;
    IBQuery1QTDE_PEDIDO_ITEM: TIntegerField;
    IBQuery1PRECO_UNIT: TIBBCDField;
    IBQuery1VLR_DESC: TIBBCDField;
    IBQuery1COTACAO_DOLAR: TIBBCDField;
    IBQuery1ALIQ_IPI_ITEM: TIBBCDField;
    IBQuery1VLR_TOTAL_ITEM: TIBBCDField;
    IBQuery1VLR_IPI_ITEM: TIBBCDField;
    IBQuery1VLR_IPI_ITEM_NEW: TIBBCDField;
    IBQuery1VLR_TOTAL_ITEM_NEW: TIBBCDField;
    DataSource1: TDataSource;
    IBQuery1ISENCAO_IPI: TIBStringField;
    IBQuery1ISENCAO_ICMS: TIBStringField;
    IBQuery1ALIQ_IPI_ITEM_NEW: TIBBCDField;
    IBQuery1ALIQ_IPI_PRODUTO: TIBBCDField;
    Panel1: TPanel;
    Button1: TButton;
    IBQuery1PEDIDO_SQ: TIntegerField;
    IBQuery2: TIBQuery;
    IBQuery1ALIQ_ICMS_ITEM: TIBBCDField;
    IBQuery1VLR_ICMS_ITEM: TIBBCDField;
    IBQuery1ALIQ_ICMS_ITEM_NEW: TIBBCDField;
    IBQuery1VLR_ICMS_ITEM_NEW: TIBBCDField;
    IBQuery1ESTADO: TIBStringField;
    IBQuery1ALIQ_ICMS_NAT: TIBBCDField;
    IBQuery1ALIQ_ICMS_PROD: TIBBCDField;
    IBQuery1INSCR_ESTADUAL: TIBStringField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    Button2: TButton;
    IBQuery3: TIBQuery;
    DataSource3: TDataSource;
    IBQuery3NFISCAL_SQ: TIntegerField;
    IBQuery3NUMERO_NFISCAL: TIntegerField;
    IBQuery3NFISCAL_ITEM_SQ: TIntegerField;
    IBQuery3QTDE_ITEM: TIntegerField;
    IBQuery3VLR_UNIT_ITEM: TIBBCDField;
    IBQuery3ALIQ_IPI_ITEM: TIBBCDField;
    IBQuery3ALIQ_ICMS_ITEM: TIBBCDField;
    IBQuery3VLR_TOTAL_ITEM: TIBBCDField;
    IBQuery3VLR_IPI_ITEM: TIBBCDField;
    IBQuery3VLR_ICMS_ITEM: TIBBCDField;
    IBQuery3ISENCAO_IPI: TIBStringField;
    IBQuery3ISENCAO_ICMS: TIBStringField;
    IBQuery3ALIQ_IPI_PRODUTO: TIBBCDField;
    IBQuery3ESTADO: TIBStringField;
    IBQuery3INSCR_ESTADUAL: TIBStringField;
    IBQuery3ALIQ_ICMS_NAT: TIBBCDField;
    IBQuery3ALIQ_ICMS_PROD: TIBBCDField;
    IBQuery3ALIQ_IPI_ITEM_NEW: TIBBCDField;
    IBQuery3ALIQ_ICMS_ITEM_NEW: TIBBCDField;
    IBQuery3VLR_IPI_ITEM_NEW: TIBBCDField;
    IBQuery3VLR_ICMS_ITEM_NEW: TIBBCDField;
    IBQuery3VLR_TOTAL_ITEM_NEW: TIBBCDField;
    TabSheet3: TTabSheet;
    DBGrid3: TDBGrid;
    IBQuery3COTACAO_DOLAR: TIBBCDField;
    Button3: TButton;
    IBQuery4: TIBQuery;
    DataSource4: TDataSource;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    Button4: TButton;
    IBQuery2PEDIDO_SQ: TIntegerField;
    IBQuery2NUMERO_PEDIDO: TIntegerField;
    IBQuery2IPI_ITEM: TIBBCDField;
    IBQuery2VLR_IPI: TIBBCDField;
    IBQuery2ICMS_ITEM: TIBBCDField;
    IBQuery2VLR_ICMS: TIBBCDField;
    IBQuery2PROD_ITEM: TIBBCDField;
    IBQuery2VLR_PRODUTOS: TIBBCDField;
    IBQuery2BASE_ICMS: TIBBCDField;
    IBQuery4NFISCAL_SQ: TIntegerField;
    IBQuery4NUMERO_NFISCAL: TIntegerField;
    IBQuery4COTACAO_DOLAR: TIBBCDField;
    IBQuery4IPI_ITEM: TIBBCDField;
    IBQuery4VLR_IPI: TIBBCDField;
    IBQuery4ICMS_ITEM: TIBBCDField;
    IBQuery4VLR_ICMS: TIBBCDField;
    IBQuery4PROD_ITEM: TIBBCDField;
    IBQuery4VLR_PRODUTOS: TIBBCDField;
    IBQuery4BASE_ICMS: TIBBCDField;
    IBQuery4VLR_DESP_ACESS: TIBBCDField;
    IBQuery4VLR_FRETE: TIBBCDField;
    IBQuery4VLR_SEGURO: TIBBCDField;
    procedure IBQuery1CalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure IBQuery3CalcFields(DataSet: TDataSet);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCorrecao: TFCorrecao;

implementation

uses UDM;

{$R *.dfm}

procedure TFCorrecao.IBQuery1CalcFields(DataSet: TDataSet);
begin
  IBQuery1ALIQ_IPI_ITEM_NEW.Value  := IBQuery1ALIQ_IPI_PRODUTO.Value;
  if IBQuery1ISENCAO_IPI.AsString  = 'S' then IBQuery1ALIQ_IPI_ITEM_NEW.Value := 0;

  if IBQuery1ESTADO.AsString = DM.estado then
    IBQuery1ALIQ_ICMS_ITEM_NEW.Value := IBQuery1ALIQ_ICMS_PROD.Value else
    IBQuery1ALIQ_ICMS_ITEM_NEW.Value := IBQuery1ALIQ_ICMS_NAT.Value;
  if (IBQuery1INSCR_ESTADUAL.AsString = '') or (Pos ('ISENT', IBQuery1INSCR_ESTADUAL.AsString) <> 0) then
    IBQuery1ALIQ_ICMS_ITEM_NEW.Value := DM.aliq_icms;
  if IBQuery1ISENCAO_ICMS.AsString  = 'S' then IBQuery1ALIQ_ICMS_ITEM_NEW.Value := 0;

  IBQuery1VLR_IPI_ITEM_NEW.AsString := FloattoStrf ((((IBQuery1QTDE_PEDIDO_ITEM.AsCurrency *
    IBQuery1PRECO_UNIT.AsCurrency) - IBQuery1VLR_DESC.AsCurrency) * IBQuery1COTACAO_DOLAR.AsCurrency) *
    IBQuery1ALIQ_IPI_ITEM_NEW.AsCurrency / (100 + IBQuery1ALIQ_IPI_ITEM_NEW.AsCurrency), ffFixed, 10, 2);

  IBQuery1VLR_ICMS_ITEM_NEW.AsString := FloattoStrf ((((((IBQuery1QTDE_PEDIDO_ITEM.AsCurrency *
    IBQuery1PRECO_UNIT.AsCurrency) - IBQuery1VLR_DESC.AsCurrency) * IBQuery1COTACAO_DOLAR.AsCurrency) - IBQuery1VLR_IPI_ITEM_NEW.AsCurrency) *
    IBQuery1ALIQ_ICMS_ITEM_NEW.AsCurrency / 100), ffFixed, 10, 2);

  IBQuery1VLR_TOTAL_ITEM_NEW.AsString := FloattoStrf (((((IBQuery1QTDE_PEDIDO_ITEM.AsCurrency *
    IBQuery1PRECO_UNIT.AsCurrency) - IBQuery1VLR_DESC.AsCurrency) * IBQuery1COTACAO_DOLAR.AsCurrency) -
    IBQuery1VLR_IPI_ITEM_NEW.AsCurrency), ffFixed, 10, 2);
end;

procedure TFCorrecao.IBQuery3CalcFields(DataSet: TDataSet);
begin
  IBQuery3ALIQ_IPI_ITEM_NEW.Value  := IBQuery3ALIQ_IPI_PRODUTO.Value;
  if IBQuery3ISENCAO_IPI.AsString  = 'S' then IBQuery3ALIQ_IPI_ITEM_NEW.Value := 0;

  if IBQuery3ESTADO.AsString = DM.estado then
    IBQuery3ALIQ_ICMS_ITEM_NEW.Value := IBQuery3ALIQ_ICMS_PROD.Value else
    IBQuery3ALIQ_ICMS_ITEM_NEW.Value := IBQuery3ALIQ_ICMS_NAT.Value;
  if (IBQuery3INSCR_ESTADUAL.AsString = '') or (Pos ('ISENT', IBQuery3INSCR_ESTADUAL.AsString) <> 0) then
    IBQuery3ALIQ_ICMS_ITEM_NEW.Value := DM.aliq_icms;
  if IBQuery3ISENCAO_ICMS.AsString  = 'S' then IBQuery3ALIQ_ICMS_ITEM_NEW.Value := 0;

  IBQuery3VLR_IPI_ITEM_NEW.AsString := FloattoStrf (IBQuery3QTDE_ITEM.AsCurrency *
    IBQuery3VLR_UNIT_ITEM.AsCurrency *
    IBQuery3ALIQ_IPI_ITEM_NEW.AsCurrency / (100 + IBQuery3ALIQ_IPI_ITEM_NEW.AsCurrency), ffFixed, 10, 2);

  IBQuery3VLR_TOTAL_ITEM_NEW.AsString := FloattoStrf (((IBQuery3QTDE_ITEM.AsCurrency *
    IBQuery3VLR_UNIT_ITEM.AsCurrency) - IBQuery3VLR_IPI_ITEM_NEW.AsCurrency), ffFixed, 10, 2);

  IBQuery3VLR_ICMS_ITEM_NEW.AsString := FloattoStrf ((IBQuery3VLR_TOTAL_ITEM_NEW.AsCurrency *
    IBQuery3ALIQ_ICMS_ITEM_NEW.AsCurrency / 100), ffFixed, 10, 2);
end;

procedure TFCorrecao.FormActivate(Sender: TObject);
begin
  IBQuery1.Active := True;
  IBQuery2.Active := True;
  IBQuery3.Active := True;
  IBquery4.Active := True;
end;

procedure TFCorrecao.Button1Click(Sender: TObject);
begin
{
  ibQuery1.First;
  While not IBQuery1.Eof do
  begin
    DM.ibPedidos.Open;
    DM.ibPedidos.Filter := 'PEDIDO_SQ = ' + IBQuery1PEDIDO_SQ.AsString;
    DM.ibPedidos.Filtered := True;
    DM.ibPedidos.Last;
    if DM.ibPedidos.RecordCount <> 1 then
      raise Exception.Create ('Problema na tabela de Pedidos!');

    DM.ibPedidosItens.Open;
    DM.ibPedidosItens.Filter := 'PEDIDO_ITEM_SQ = ' + IBQuery1PEDIDO_ITEM_SQ.AsString;
    DM.ibPedidosItens.Filtered := True;
    DM.ibPedidosItens.Last;
    if DM.ibPedidosItens.RecordCount <> 1 then
      raise Exception.Create ('Problema na tabela de Itens de Pedidos!');
    DM.ibPedidosItens.Edit;
    DM.ibPedidosItensALIQ_IPI_ITEM.Value  := IBQuery1ALIQ_IPI_ITEM_NEW.Value;
    DM.ibPedidosItensVLR_IPI_ITEM.Value   := IBQuery1VLR_IPI_ITEM_NEW.Value;
    DM.ibPedidosItensVLR_TOTAL_ITEM.Value := IBQuery1VLR_TOTAL_ITEM_NEW.Value;
    DM.ibPedidosItensVLR_ICMS_ITEM.Value  := IBQuery1VLR_ICMS_ITEM_NEW.Value;
    if DM.ibPedidosItensVLR_DESC.IsNull then
      DM.ibPedidosItensVLR_DESC.Value := 0;
    DM.ibPedidosItens.Post;
    IBQuery1.Next;
  end;
  DM.IBTransaction1.Commit;
  DM.DBConn.Close;
  IBQuery2.Active := True;
  PageControl1.ActivePageIndex := 1;
}
end;

procedure TFCorrecao.Button2Click(Sender: TObject);
begin
{
  ibQuery2.First;
  While not IBQuery2.Eof do
  begin
    DM.ibPedidos.Open;
    DM.ibPedidos.Filter := 'PEDIDO_SQ = ' + IBQuery2PEDIDO_SQ.AsString;
    DM.ibPedidos.Filtered := True;
    DM.ibPedidos.Last;
    if DM.ibPedidos.RecordCount <> 1 then
      raise Exception.Create ('Problema na tabela de Pedidos!');
    DM.ibPedidos.Edit;
    DM.ibPedidosVLR_IPI.Value := IBQuery2IPI_ITEM.AsCurrency;
    DM.ibPedidosVLR_ICMS.Value :=  IBQuery2ICMS_ITEM.AsCurrency;
    DM.ibPedidosVLR_PRODUTOS.Value := IBQuery2PROD_ITEM.AsCurrency;
    DM.ibPedidosBASE_ICMS.Value := IBQuery2PROD_ITEM.AsCurrency;
    DM.ibPedidos.Post;
    IBQuery2.Next;
  end;
  DM.IBTransaction1.Commit;
  DM.DBConn.Close;
  IBQuery3.Active := True;
  PageControl1.ActivePageIndex := 2;
}
end;

procedure TFCorrecao.Button3Click(Sender: TObject);
begin
{
  ibQuery3.First;
  While not IBQuery3.Eof do
  begin
    DM.ibNFiscais.Open;
    DM.ibNFiscais.Filter := 'NFISCAL_SQ = ' + IBQuery3NFISCAL_SQ.AsString;
    DM.ibNFiscais.Filtered := True;
    DM.ibNFiscais.Last;
    if DM.ibNFiscais.RecordCount <> 1 then
      raise Exception.Create ('Problema na tabela de NFiscais!');

    DM.ibNFiscaisItens.Open;
    DM.ibNFiscaisItens.Filter := 'NFISCAL_ITEM_SQ = ' + IBQuery3NFISCAL_ITEM_SQ.AsString;
    DM.ibNFiscaisItens.Filtered := True;
    DM.ibNFiscaisItens.Last;
    if DM.ibNFiscaisItens.RecordCount <> 1 then
      raise Exception.Create ('Problema na tabela de Itens de NFiscais!');
    DM.ibNFiscaisItens.Edit;
    DM.ibNfiscaisItensALIQ_IPI_ITEM.Value  := IBQuery3ALIQ_IPI_ITEM_NEW.Value;
    DM.ibNfiscaisItensVLR_IPI_ITEM.Value   := IBQuery3VLR_IPI_ITEM_NEW.Value;
    DM.ibNfiscaisItensVLR_TOTAL_ITEM.Value := IBQuery3VLR_TOTAL_ITEM_NEW.Value;
    DM.ibNfiscaisItensVLR_ICMS_ITEM.Value  := IBQuery3VLR_ICMS_ITEM_NEW.Value;
    DM.ibNFiscaisItens.Post;
    IBQuery3.Next;
  end;
  DM.IBTransaction1.Commit;
  DM.DBConn.Close;
  IBquery4.Active := True;
  PageControl1.ActivePageIndex := 3;
}
end;

procedure TFCorrecao.Button4Click(Sender: TObject);
begin
{
  ibQuery4.First;
  While not IBQuery4.Eof do
  begin
    DM.ibNFiscais.Open;
    DM.ibNFiscais.Filter := 'NFISCAL_SQ = ' + IBQuery4NFISCAL_SQ.AsString;
    DM.ibNFiscais.Filtered := True;
    DM.ibNFiscais.Last;
    if DM.ibNFiscais.RecordCount <> 1 then
      raise Exception.Create ('Problema na tabela de NFiscais!');
    DM.ibNFiscais.Edit;
    DM.ibNfiscaisCOTACAO_DOLAR.Value := IBQuery4COTACAO_DOLAR.AsCurrency;
    DM.ibNFiscaisVLR_IPI.Value := IBQuery4IPI_ITEM.AsCurrency;
    DM.ibNFiscaisVLR_ICMS.Value :=  IBQuery4ICMS_ITEM.AsCurrency;
    DM.ibNFiscaisVLR_PRODUTOS.Value := IBQuery4PROD_ITEM.AsCurrency;
    DM.ibNfiscaisBASE_ICMS.Value := IBQuery4PROD_ITEM.AsCurrency;
    DM.ibNfiscaisVLR_TOTAL.Value := IBQuery4PROD_ITEM.AsCurrency + IBQuery4VLR_IPI.AsCurrency +
      IBQuery4VLR_FRETE.AsCurrency + IBQuery4VLR_SEGURO.AsCurrency + IBQuery4VLR_DESP_ACESS.AsCurrency;
    DM.ibNFiscais.Post;
    IBQuery4.Next;
  end;
  DM.IBTransaction1.Commit;
  DM.DBConn.Close;
}
end;

end.
