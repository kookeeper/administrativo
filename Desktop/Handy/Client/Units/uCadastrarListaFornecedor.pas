unit uCadastrarListaFornecedor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaFornecedor = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaFornecedor: TFCadastrarListaFornecedor;

implementation

uses Fornecedor, uCadastrarFormFornecedor, Reflection;

{$R *.dfm}

procedure TFCadastrarListaFornecedor.FormCreate(Sender: TObject);
begin
  registro := TFornecedor.Create;
  inherited;
end;

procedure TFCadastrarListaFornecedor.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormFornecedor := TFCadastrarFormFornecedor.Create(Self);
    FCadastrarFormFornecedor.ShowModal;
  finally
    FreeAndNil(FCadastrarFormFornecedor);
  end;
end;

end.
