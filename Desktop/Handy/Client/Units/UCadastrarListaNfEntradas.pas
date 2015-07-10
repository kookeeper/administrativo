unit UCadastrarListaNfEntradas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ExtCtrls, QuickRpt, Mask, RzEdit, ImgList,
  RzButton;

type
  TFCadastrarListaNfEntradas = class(TFCadastrarListaComum)
    cbAberto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbApagarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbAbertoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  FCadastrarListaNfEntradas: TFCadastrarListaNfEntradas;

implementation

uses UCadastrarFormNfEntradas, UDM, UTransferenciaEntrada, Produto,
  NfEntrada, UImportarNFe;

{$R *.dfm}

procedure TFCadastrarListaNfEntradas.FormCreate(Sender: TObject);
begin
  registro := TNfEntrada.Create;
  inherited;
  CriaOrdem('NUMERO_NF_ENT', True);
end;

procedure TFCadastrarListaNfEntradas.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormNfEntradas := TFCadastrarFormNfEntradas.Create(Self);
    FCadastrarFormNfEntradas.ShowModal;
  finally
    FreeAndNil(FCadastrarFormNfEntradas);
  end;
end;

procedure TFCadastrarListaNfEntradas.sbApagarClick(Sender: TObject);
var
  itens: TClientDataSet;
begin
  if MessageDlg ('Tem certeza que deseja excluir este registro!?',
                           mtConfirmation, [mbyes, mbno], 0) = mryes then
  try
    itens := TNfEntrada.Create(cdsLista.FieldByName(registro.cIndice).AsInteger).listaItens;
    While not itens.Eof do
    begin
      TNfEntradaItem.Create(itens.FieldByName('nf_entrada_item_sq').Value).excluirRegistro(false);
      itens.Next;
    end;
    itens.Close;

    registro.excluirRegistro(false);

    AtualizaLista;
  except
    on E: Exception do
    begin
      Showmessage (E.Message);
      DM.EnviarEmail (Tabela, 'APAGAR', Mensagem, Novo);
    end;
  end;
end;

procedure TFCadastrarListaNfEntradas.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  try
    FTransferenciaEntrada := TFTransferenciaEntrada.Create(Self);
    FTransferenciaEntrada.ShowModal;
    AtualizaLista;
  finally
    FreeAndNil(FTransferenciaEntrada);
  end;
end;

procedure TFCadastrarListaNfEntradas.cbAbertoClick(Sender: TObject);
begin
  inherited;
  if cbAberto.Checked then
    Filtro1 := 'TRANSFERIDA <> ''S''' else
    Filtro1 := '';
  sbFiltro.Click;
end;

procedure TFCadastrarListaNfEntradas.SpeedButton3Click(Sender: TObject);
begin
  try
    FImportarNFe := TFImportarNFe.Create(Self);
    FImportarNFe.ShowModal;
    AtualizaLista;
  finally
    FreeAndNil(FImportarNFe);
  end;
end;

end.
