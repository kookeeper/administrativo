unit uConsultarAlteracoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB;

type
  TfConsultarAlteracoes = class(TForm)
    DBGrid1: TDBGrid;
    dsListaHistAlteracoes: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Tabela: String;
    chave: integer;
    { Public declarations }
  end;

var
  fConsultarAlteracoes: TfConsultarAlteracoes;

implementation

uses UDM, HistoricoAlteracao;

{$R *.dfm}

procedure TfConsultarAlteracoes.DBGrid1DblClick(Sender: TObject);
begin
  Showmessage(dsListaHistAlteracoes.DataSet.FieldByName('observacao').AsString);
end;

procedure TfConsultarAlteracoes.FormCreate(Sender: TObject);
begin
  dsListaHistAlteracoes.DataSet := THistoricoAlteracao.listaRegistros(tabela, chave);
end;

end.
