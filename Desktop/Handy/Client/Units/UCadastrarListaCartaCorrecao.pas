unit UCadastrarListaCartaCorrecao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, ImgList, DB, DBClient, StdCtrls, Mask,
  RzEdit, Buttons, ToolWin, ComCtrls, DBGrids, Grids;

type
  TFCadastrarListaCartaCorrecao = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaCartaCorrecao: TFCadastrarListaCartaCorrecao;

implementation

uses CartaCorrecao, UCadastrarFormCartaCorrecao;

{$R *.dfm}

procedure TFCadastrarListaCartaCorrecao.FormCreate(Sender: TObject);
begin
  registro := TCartaCorrecao.Create;
  inherited;
end;

procedure TFCadastrarListaCartaCorrecao.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormCartaCorrecao := TFCadastrarFormCartaCorrecao.Create(Self);
    FCadastrarFormCartaCorrecao.ShowModal;
  finally
    FreeAndNil(FCadastrarFormCartaCorrecao);
  end;
end;

procedure TFCadastrarListaCartaCorrecao.SpeedButton5Click(Sender: TObject);
var
  cartaCorrecao: TCartaCorrecao;
begin
  try
    cartaCorrecao := TCartaCorrecao.Create(cdsLista.FieldByName('carta_correcao_sq').Value);

    if (cartaCorrecao.chave = '') then
      raise Exception.Create('Carta de correção não digitada corretamente, não é possível enviar.');

    if (cartaCorrecao.dh_evento > 0) then
      raise Exception.Create('Carta de correção já enviada para SEFAZ, não é possível enviar novamente.');

    cartaCorrecao.gerarCCe;

  except on E: Exception do
    begin
      MessageDlg('Problema na geração da CC-e: ' + E.Message, mtError, [mbOk], 0);
    end;
  end;
end;

end.
