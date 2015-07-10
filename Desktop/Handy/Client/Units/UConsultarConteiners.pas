unit UConsultarConteiners;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, DBCtrls, Mask,
  RzEdit;

type
  TFConsultarConteiners = class(TForm)
    Panel2: TPanel;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel1: TPanel;
    bbFechar: TBitBtn;
    Timer1: TTimer;
    dsListaConteiner: TDataSource;
    dsListaConteinerItens: TDataSource;
    DBMemo1: TDBMemo;
    Label2: TLabel;
    edCodigo: TRzEdit;
    procedure edCodigoChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsListaConteinerDataChange(Sender: TObject; Field: TField);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConsultarConteiners: TFConsultarConteiners;

implementation

uses UDM, Conteiner, Cadastro;

{$R *.dfm}

procedure TFConsultarConteiners.edCodigoChange(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TFConsultarConteiners.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  dsListaConteiner.DataSet.Filter := 'invoice_number like ''%' + edCodigo.Text + '%''';
end;

procedure TFConsultarConteiners.FormCreate(Sender: TObject);
begin
  dsListaConteiner.DataSet := TConteiner.listaRegistros();
  dsListaConteiner.DataSet.Filtered := True;
end;

procedure TFConsultarConteiners.dsListaConteinerDataChange(Sender: TObject;
  Field: TField);
begin
  if (dsListaConteinerItens.DataSet <> nil) then
    dsListaConteinerItens.DataSet.Close;
  dsListaConteinerItens.DataSet := TConteinerItem.listaRegistros('where conteiner_sq = ' + dsListaConteiner.DataSet.FieldByName('conteiner_sq').AsString);
end;

procedure TFConsultarConteiners.FormDestroy(Sender: TObject);
begin
  dsListaConteiner.DataSet.Close;
  dsListaConteinerItens.DataSet.Close;
end;

end.
