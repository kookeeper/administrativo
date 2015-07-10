unit uVisualizarAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids, DB, ExtCtrls;

type
  TVisualizarAgenda = class(TForm)
    dsListaAgenda: TDataSource;
    DBGrid1: TDBGrid;
    DBMemo1: TDBMemo;
    Splitter1: TSplitter;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VisualizarAgenda: TVisualizarAgenda;

implementation

uses UDM;

{$R *.dfm}

procedure TVisualizarAgenda.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Close;
    Key := #0;
  end;
end;

end.
