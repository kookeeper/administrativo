unit UCadastrarListaNFServicos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, Mask, RzEdit, ImgList, RzButton;

type
  TFCadastrarListaNFServicos = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNFServicos: TFCadastrarListaNFServicos;

implementation

uses UCadastrarFormNFServicos, UDM, NfServico;

{$R *.dfm}

procedure TFCadastrarListaNFServicos.FormCreate(Sender: TObject);
begin
  registro := TNfServico.Create;
  inherited;
end;

procedure TFCadastrarListaNFServicos.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormNFServicos := TFCadastrarFormNFServicos.Create(Self);
    FCadastrarFormNFServicos.ShowModal;
  finally
    FreeAndNil(FCadastrarFormNFServicos);
  end;
end;

end.
