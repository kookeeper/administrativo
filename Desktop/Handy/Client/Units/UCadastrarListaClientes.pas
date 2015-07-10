unit UCadastrarListaClientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, Mask, RzEdit, ImgList, RzButton;

type
  TFCadastrarListaClientes = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    fonteGeral, fundoGeral, fonteNovos, fundoNovos, fonteSem, fundoSem: Integer;
    procedure AtualizaCores;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaClientes: TFCadastrarListaClientes;

implementation

uses UDM, UCadastrarFormClientes, UImprimirClientesHist,
  uConfiguraListaClientes, Registry, Classificacao, Cadastro, Cliente;

{$R *.DFM}

procedure TFCadastrarListaClientes.FormCreate(Sender: TObject);
begin
  registro := TCliente.Create;
  inherited;
  AtualizaCores;
end;

procedure TFCadastrarListaClientes.AtualizaCores;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create(KEY_READ);
  try
    fonteGeral := -1;
    fundoGeral := -1;
    fonteNovos := -1;
    fundoNovos := -1;
    fonteSem   := -1;
    fundoSem   := -1;

    reg.RootKey := HKEY_CURRENT_USER;
    if reg.OpenKey('\Software\MSystem\ListaClientes', False) then
    begin
      if reg.ValueExists('clrFonteGeral') then
      begin
        fonteGeral := reg.ReadInteger('clrFonteGeral');
        fundoGeral := reg.ReadInteger('clrFundoGeral');
      end;

      if reg.ValueExists('clrFonteNovos') then
      begin
        fonteNovos := reg.ReadInteger('clrFonteNovos');
        fundoNovos := reg.ReadInteger('clrFundoNovos');
      end;

      if reg.ValueExists('clrFonteSem') then
      begin
        fonteSem := reg.ReadInteger('clrFonteSem');
        fundoSem := reg.ReadInteger('clrFundoSem');
      end;
    end;
  finally
    reg.Free;
  end;
end;

procedure TFCadastrarListaClientes.sbEditarClick(Sender: TObject);
begin
  inherited;
  try
    FCadastrarFormClientes := TFCadastrarFormClientes.Create(Self);
    if FCadastrarFormClientes.ShowModal = mrOk then
      AtualizaLista;
  finally
    FreeAndNil(FCadastrarFormClientes);
  end;
end;

procedure TFCadastrarListaClientes.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  FImprimirClientesHist.edCodigo.Text   := cdsLista.FieldByName('CODIGO_CLIENTE').AsString;// StringGrid1.Cells[1, StringGrid1.row];
  FImprimirClientesHist.edNome.Text     := '';
  FImprimirClientesHist.dtpInicio.Date  := StrtoDate (FormatDateTime ('01/mm/yyyy', Date));
  FImprimirClientesHist.dtpTermino.Date := Date;
  FImprimirClientesHist.ShowModal;
  DM.cdsImprHistClientes3.Close;
  DM.cdsImprHistClientes2.Close;
  DM.cdsImprHistClientes1.Close;
end;

procedure TFCadastrarListaClientes.SpeedButton3Click(Sender: TObject);
begin
  try
    ConfiguraListaClientes := TConfiguraListaClientes.Create(Self);
    ConfiguraListaClientes.ShowModal;
  finally
    FreeAndNil(ConfiguraListaClientes);
  end;
  AtualizaCores;
  DBGrid1.Repaint;
//  StringGrid1.Repaint;
end;

procedure TFCadastrarListaClientes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  pinta: Boolean;
begin
  inherited;
  pinta := False;
  if not (gdSelected in State) then
  try
    if (fundoGeral >=0) and (cdsLista.RecNo mod 2 = 0) then
    begin
      DBGrid1.Canvas.Brush.Color := fundoGeral;
      DBGrid1.Canvas.Font.Color  := fonteGeral;
      pinta := True;
    end;

    // data de cadastro
    if (fundoNovos >= 0) and (cdsLista.FieldByName('DATA_CADASTRO').AsDateTime > Date-30) then
    begin
      DBGrid1.Canvas.Font.Color  := fonteNovos;
      DBGrid1.Canvas.Brush.Color := fundoNovos;
      pinta := True;
    end;

    //total de compras
    if (fundoSem >= 0) and (cdsLista.FieldByName('CODIGO_PRODUTO').AsString = '') then
    begin
      DBGrid1.Canvas.Brush.Color := fundoSem;
      DBGrid1.Canvas.Font.Color  := fonteSem;
      pinta := True;
    end;

    if pinta then
    begin
      DBGrid1.Canvas.FillRect(Rect);
      DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
  except
    on E : Exception do
      raise Exception.Create ('Erro ao Atualizar Lista: ' + chr(13) + E.Message);
  end;
end;

end.
