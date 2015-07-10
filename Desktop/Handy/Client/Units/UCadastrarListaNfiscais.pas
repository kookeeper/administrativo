unit UCadastrarListaNfiscais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarListaComum, Db, StdCtrls, Buttons, ToolWin, ComCtrls, Grids,
  DBGrids, Variants, DBClient, Mask, RzEdit, ImgList, RzButton, ExtCtrls;

type
  TFCadastrarListaNfiscais = class(TFCadastrarListaComum)
    procedure FormCreate(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarListaNfiscais: TFCadastrarListaNfiscais;

implementation

uses UDM, UCadastrarFormNfiscais, UConsultarNfiscaisSerie,
  UCadastrarNfiscaisSerie, UMainMenu, Nfiscal, Cadastro, Empresa, Produto,
  Vendedor, Transportadora, CondPagto, Natureza, Cliente;

{$R *.DFM}

procedure TFCadastrarListaNfiscais.FormCreate(Sender: TObject);
begin
  registro := TNfiscal.Create;
  inherited;
  CriaOrdem('NUMERO_NFISCAL', True);
end;

procedure TFCadastrarListaNfiscais.sbEditarClick(Sender: TObject);
var
  Manual: Boolean;
begin
  Manual := Sender = SpeedButton2;
  if Sender = SpeedButton2 then Sender := sbNovo;
  inherited;
  try
    FCadastrarFormNfiscais := TFCadastrarFormNfiscais.Create(Self);

    if not FCadastrarFormNfiscais.notaManual then
      FCadastrarFormNfiscais.notaManual := Manual;
      
    FCadastrarFormNfiscais.ShowModal;
  finally
    FreeAndNil(FCadastrarFormNfiscais);
    FreeAndNil(registro);
    registro := TNfiscal.Create;
  end;

end;

procedure TFCadastrarListaNfiscais.SpeedButton1Click(Sender: TObject);
var
  motivo: String;
  indice: Integer;
begin
  inherited;
  if (cdsLista.FieldByName('CANCELADA').AsString = 'S') then
  begin
    if (MessageDlg ('Tem certeza que deseja tornar esta Nota Fiscal ATIVA!?', mtWarning, [mbyes, mbno], 0) = mryes) then
    try
      indice := cdsLista.FieldByName(registro.cIndice).AsInteger;

      DM.CriaDuplicatas(indice, True);

      TNfiscal.Create(indice).finalizar;

      if Mensagem <> '' then
        raise Exception.Create(Mensagem);
      Showmessage('Processo concluído!');
      AtualizaLista;
    except on E: Exception do
      begin
        Showmessage ('Nota Fiscal não finalizada: ' + E.Message);
        DM.EnviarEmail ('NFISCAL', 'Finalizar', E.Message, False);
      end;
    end;
  end
  else if MessageDlg ('Tem certeza que deseja cancelar esta Nota Fiscal!?', mtWarning, [mbyes, mbno], 0) = mryes then
  try
    motivo := InputBox('Cancelamento', 'Digite o motivo do cancelamento da NFe', '');

    With (TNfiscal.Create(cdsLista.FieldByName(registro.cIndice).Value)) do
    begin
      motivo_cancelamento := motivo;
      salvar;
    end;

    DM.geraNFe(cdsLista.FieldByName('NUMERO_NFISCAL').AsInteger, '', motivo);
  finally
    AtualizaLista;
  end;
end;

procedure TFCadastrarListaNfiscais.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  DM.geraNFe(cdsLista.FieldByName('numero_nfiscal').AsInteger, '', '');
end;

procedure TFCadastrarListaNfiscais.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  FMainMenu.NrSerie1.Click;
end;

procedure TFCadastrarListaNfiscais.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  if not Assigned(FCadastrarNfiscaisSerie) then
    FCadastrarNfiscaisSerie := TFCadastrarNfiscaisSerie.Create(Self);

  FCadastrarNfiscaisSerie.dsListaNfiscaisItens.DataSet := TNfiscal.Create(cdsLista.FieldByName(registro.cIndice).AsInteger).listaItens;
  FCadastrarNfiscaisSerie.lbNfiscal.Caption := 'Nota Fiscal - ' + cdsLista.FieldByName('NUMERO_NFISCAL').AsString;//StringGrid1.Cells[1,StringGrid1.row];
  FMainMenu.AbreForm2 (FCadastrarNfiscaisSerie);
end;

procedure TFCadastrarListaNfiscais.SpeedButton5Click(Sender: TObject);
begin
  try
    if DM.buscaNF(cdsLista.FieldByName('nfiscal_sq').AsInteger).FieldByName('nfe_chave').AsString <> '' then
      raise Exception.Create('Nota fiscal eletrônica já gerada, não é possível gerar outra.');

    DM.geraNFe(cdsLista.FieldByName('NUMERO_NFISCAL').AsInteger, '', '');

  except on E: Exception do
    begin
      MessageDlg('Problema na geração da NF-e: ' + E.Message, mtError, [mbOk], 0);
    end;
  end;
end;

procedure TFCadastrarListaNfiscais.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if cdsLista.FieldByName('CANCELADA').AsString = 'S' then
  begin
    DBGrid1.Canvas.Font.Color := clRed;
    DBGrid1.Canvas.Font.Style := [fsBold];
    DBGrid1.Canvas.Brush.Color := clWhite;
    DBGrid1.Canvas.FillRect(Rect);
    DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
  end;
end;

end.
