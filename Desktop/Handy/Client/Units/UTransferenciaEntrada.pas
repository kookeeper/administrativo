unit UTransferenciaEntrada;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, StdCtrls, Buttons, ExtCtrls;

type
  TFTransferenciaEntrada = class(TForm)
    dsListaNfEntradas: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    BitBtn1: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTransferenciaEntrada: TFTransferenciaEntrada;

implementation

uses UDM, NfEntrada, Cadastro;

{$R *.dfm}

procedure TFTransferenciaEntrada.FormActivate(Sender: TObject);
begin
  if dsListaNfEntradas.DataSet.RecordCount = 0 then
    Close;
end;

procedure TFTransferenciaEntrada.bbOkClick(Sender: TObject);
begin
  TNfEntrada.Create(dsListaNfEntradas.DataSet.FieldByName('NF_ENTRADA_SQ').Value).entradaEstoque;
end;

procedure TFTransferenciaEntrada.FormCreate(Sender: TObject);
begin
  dsListaNfEntradas.DataSet := TNfEntrada.listaRegistros(' where transferida = ''N''');
end;

procedure TFTransferenciaEntrada.BitBtn1Click(Sender: TObject);
begin
  dsListaNfEntradas.DataSet.First;
  While not dsListaNfEntradas.DataSet.Eof do
  begin
    TNfEntrada.Create(dsListaNfEntradas.DataSet.FieldByName('NF_ENTRADA_SQ').Value).entradaEstoque;
    dsListaNfEntradas.DataSet.Next;
  end;
end;

end.
