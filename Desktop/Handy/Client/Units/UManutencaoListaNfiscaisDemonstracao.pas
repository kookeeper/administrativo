unit UManutencaoListaNfiscaisDemonstracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarListaComum, DB, Grids, StdCtrls, Buttons, ToolWin,
  ComCtrls, DBGrids, DBClient, Mask, RzEdit, ImgList, RzButton;

type
  TFManutencaoListaNFiscaisDemonstracao = class(TFCadastrarListaComum)
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
  FManutencaoListaNFiscaisDemonstracao: TFManutencaoListaNFiscaisDemonstracao;

implementation

uses UDM, UManutencaoFormNfiscaisDemonstracao, Empresa;

{$R *.dfm}

procedure TFManutencaoListaNFiscaisDemonstracao.FormCreate(
  Sender: TObject);
begin
  Tabela := 'Nfiscais';
  Sql := 'SELECT date(substr(dtemissao_nfiscal, 1, 10)) as DTEMISSAO_NFISCAL, N.*, C.NOME_CLIENTE, PE.NUMERO_PEDIDO, PE.DATA_PEDIDO, NA.TIPO_NFISCAL, ' +
         'date_Add(DTEMISSAO_NFISCAL, interval N.DIAS_DEMONSTRACAO day) as DATA_VENCIMENTO, ' +
         'date_Add(DTEMISSAO_NFISCAL, interval ' + IntToStr(empresaSelecionada.dias_demonstracao) + ' day) as DATA_LIMITE ' +
         'FROM nfiscais N ' +
         'LEFT JOIN pedidos    PE ON (PE.PEDIDO_SQ = N.PEDIDO_SQ) ' +
         'LEFT JOIN clientes   C  ON (C.CLIENTE_SQ = N.CLIENTE_SQ) ' +
         'LEFT JOIN naturezas  NA ON (NA.NATUREZA_SQ = N.NATUREZA_SQ) ';

  Filtro1 := 'NA.TIPO_NFISCAL = 1 AND NA.ENT_SAI = ''S'' AND N.CANCELADA <> ''S''';

  SetLength (cLista, 9);
  SetLength (nLista, 9);
  SetLength (cIndice, 1);

  cIndice := 'NFISCAL_SQ';

  cLista[0] := 'NUMERO_NFISCAL';
  cLista[1] := 'DTEMISSAO_NFISCAL';
  cLista[2] := 'NOME_CLIENTE';
  cLista[3] := 'VLR_TOTAL';
  cLista[4] := 'DIAS_DEMONSTRACAO';
  cLista[5] := 'NR_NFISCAL_RETORNO';
  cLista[6] := 'DATA_VENCIMENTO';
  cLista[7] := 'DATA_LIMITE';
  cLista[8] := 'RETORNO_PRODUTO';

  nLista[0] := 'Número';
  nLista[1] := 'Data Emissão';
  nLista[2] := 'Nome do Cliente';
  nLista[3] := 'Valor N.Fiscal';
  nLista[4] := 'Dias em Demonstração';
  nLista[5] := 'Nota de Retorno';
  nLista[6] := 'Data de Vencimento';
  nLista[7] := 'Data Limite';
  nLista[8] := 'Retorno do Produto';
  inherited;
  CriaOrdem(cLista[0], True);
end;

procedure TFManutencaoListaNFiscaisDemonstracao.sbEditarClick(
  Sender: TObject);
begin
  inherited;
  FManutencaoFormNfiscaisDemonstracao := TFManutencaoFormNfiscaisDemonstracao.Create(Self);
  FManutencaoFormNfiscaisDemonstracao.ShowModal;
end;

procedure TFManutencaoListaNFiscaisDemonstracao.cbAbertoClick(
  Sender: TObject);
begin
  inherited;
  if cbAberto.Checked then
    Filtro1 := 'na.tipo_nfiscal = 1 and n.cancelada <> ''S'' and (nr_nfiscal_retorno = 0 or nr_nfiscal_retorno is null)' else
    Filtro1 := 'na.tipo_nfiscal = 1 and n.cancelada <> ''S''';
  sbFiltro.Click;
end;

procedure TFManutencaoListaNFiscaisDemonstracao.DBGrid1DrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  try
    if (cdsLista.FieldByName('NR_NFISCAL_RETORNO').AsInteger <> 0) and // nota de retorno emitida
       (cdsLista.FieldByName('RETORNO_PRODUTO').AsString = 'S') then // retorno do produto
      DBGrid1.Canvas.Font.Color := clInactiveCaption
    else
    begin
      if (cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsString <> '') and (cdsLista.FieldByName('DIAS_DEMONSTRACAO').AsInteger + cdsLista.FieldByName('DTEMISSAO_NFISCAL').AsDateTime < Date) then
      begin
        DBGrid1.Canvas.Font.Color := clRed;
        DBGrid1.Canvas.Font.Style := [fsBold];
      end
      else DBGrid1.Canvas.Font.Color := clWindowText;
    end;
  except
    on E : Exception do
      raise Exception.Create ('Erro ao Atualizar Lista: ' + chr(13) + E.Message);
  end;
  DBGrid1.Canvas.Brush.Color := clWhite;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;

end.

