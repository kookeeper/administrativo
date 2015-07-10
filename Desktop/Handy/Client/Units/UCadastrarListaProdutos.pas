unit UCadastrarListaProdutos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, ImgList, Mask, RzEdit, RzButton, ExtCtrls;

type
  TFCadastrarListaProdutos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaProdutos: TFCadastrarListaProdutos;

implementation

uses UDM, UCadastrarFormProdutos, Produto, uTransferenciaEstoque, Unit3;

{$R *.DFM}

procedure TFCadastrarListaProdutos.FormCreate(Sender: TObject);
begin
  registro := TProduto.Create;
  inherited;
end;

procedure TFCadastrarListaProdutos.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormProdutos := TFCadastrarFormProdutos.Create(Self);
    FCadastrarFormProdutos.ShowModal;
  finally
    FreeAndNil(FCadastrarFormProdutos);
  end;
end;

procedure TFCadastrarListaProdutos.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;

  With DBGrid1 do
  begin
    if cdsLista.FieldByName('produto_ativo').AsString = 'N' then
      Canvas.Font.Color := clGrayText;

    DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

procedure TFCadastrarListaProdutos.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try
    FTransferenciaEstoque := TFTransferenciaEstoque.Create(Self);
    FTransferenciaEstoque.produto := TProduto.Create(cdsLista.FieldByName(registro.cIndice).AsInteger);
    FTransferenciaEstoque.ShowModal;
  finally
    FreeAndNil(FTransferenciaEstoque);
    AtualizaLista;
  end;
end;

procedure TFCadastrarListaProdutos.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  Form2 := TForm2.Create(Self);
  Form2.ShowModal;
end;

end.
