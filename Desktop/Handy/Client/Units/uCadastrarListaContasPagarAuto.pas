unit uCadastrarListaContasPagarAuto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaContasPagarAuto = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaContasPagarAuto: TFCadastrarListaContasPagarAuto;

implementation

uses uCadastrarFormContasPagarAuto, uGerarContasPagar, ContaPagar;

{$R *.dfm}

procedure TFCadastrarListaContasPagarAuto.FormCreate(Sender: TObject);
begin
  registro := TContaPagarAuto.Create;
  inherited;
end;

procedure TFCadastrarListaContasPagarAuto.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormContasPagarAuto := TFCadastrarFormContasPagarAuto.Create(Self);
    FCadastrarFormContasPagarAuto.ShowModal;
  finally
    FreeAndNil(FCadastrarFormContasPagarAuto);
  end;
end;

procedure TFCadastrarListaContasPagarAuto.SpeedButton1Click(
  Sender: TObject);
begin
  try
    FGerarContasPagar := TFGerarContasPagar.Create(self);
    FGerarContasPagar.ShowModal;
  finally
    FreeAndNil(FGerarContasPagar);
  end;
end;

end.
