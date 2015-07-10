unit UCadastrarListaAgenda;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, DBClient, Grids, StdCtrls, Buttons,
  ToolWin, ComCtrls, DBGrids, ImgList, Mask, RzEdit, RzButton;

type
  TFCadastrarListaAgenda = class(TFCadastrarListaComum)
    cbAberto: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure cbAbertoClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaAgenda: TFCadastrarListaAgenda;

implementation

uses UCadastrarFormAgenda, UDM, Math, Agenda;

{$R *.dfm}

procedure TFCadastrarListaAgenda.FormCreate(Sender: TObject);
begin
  registro := TAgenda.Create;
  FiltroInicial := 'U.USUARIO_SQ = ' + IntToStr(DM.useq) + ' OR A.VENDEDOR_SQ = ' + IntToStr(DM.uvend);
  inherited;
end;

procedure TFCadastrarListaAgenda.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormAgenda := TFCadastrarFormAgenda.Create(Self);
    FCadastrarFormAgenda.ShowModal;
  finally
    FreeAndNil(FCadastrarFormAgenda);
  end;
end;

procedure TFCadastrarListaAgenda.cbAbertoClick(Sender: TObject);
begin
  inherited;
  if cbAberto.Checked then
    Filtro1 := 'REALIZADO = ''N''' else
    Filtro1 := '';
  sbFiltro.Click;
end;

procedure TFCadastrarListaAgenda.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if (cdsLista.FieldByName('REALIZADO').AsString = 'S') or
     ((cdsLista.FieldByName('DATA_AGENDA').AsString <> '') and (cdsLista.FieldByName('DATA_AGENDA').AsDateTime < Date + Time)) then
  try
    if cdsLista.FieldByName('REALIZADO').AsString = 'S' then
      DBGrid1.Canvas.Font.Color := clInactiveCaption
    else
    if (cdsLista.FieldByName('DATA_AGENDA').AsString <> '') and (cdsLista.FieldByName('DATA_AGENDA').AsDateTime < Date + Time) then
    begin
      DBGrid1.Canvas.Font.Color := clRed;
      DBGrid1.Canvas.Font.Style := [fsBold];
    end;
    DBGrid1.Canvas.Brush.Color := clWhite;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  except
    on E : Exception do
      raise Exception.Create ('Erro ao Atualizar Lista: ' + chr(13) + E.Message);
  end;
end;

end.
