unit UCadastrarListaClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaClassificacao = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaClassificacao: TFCadastrarListaClassificacao;

implementation

uses UCadastrarFormClassificacao, UDM, Classificacao;

{$R *.dfm}

procedure TFCadastrarListaClassificacao.FormCreate(Sender: TObject);
begin
  registro := TClassificacao.Create;
  inherited;
end;

procedure TFCadastrarListaClassificacao.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormClassificacao := TFCadastrarFormClassificacao.Create(Self);
    FCadastrarFormClassificacao.ShowModal;
  finally
    FreeAndNil(FCadastrarFormClassificacao);
  end;
end;

end.
