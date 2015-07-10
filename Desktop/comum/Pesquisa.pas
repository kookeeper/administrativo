unit Pesquisa;

interface

uses
  SysUtils, Classes, Controls, ExtCtrls, StdCtrls, RzLabel, RzDBCmbo, Dialogs,
  SqlExpr, DBClient, DB, Windows, Variants;

type
  TTabela = (tbTransportadora, tbCliente);
  TPesquisa = class(TPanel)
  private
    lbPesquisa: TRzLabel;
    FCombo: TRzDBComboBox;
    SQLConn: TSQLConnection;
    FTabela: TTabela;
    FSql: String;
    function GetDataSource: TDataSource;
    procedure SetCaptionLabel(const Value: String);
    procedure SetDataSource(const Value: TDataSource);
    procedure SetTabela(const Value: TTabela);
    { Private declarations }
  protected
    { Protected declarations }
  public
    procedure carregaCombo;
    constructor Create(Owner: TComponent); override;
    { Public declarations }
  published
    property SQLConnection: TSQLConnection read SQLConn write SQLConn;
    property Tabela: TTabela read FTabela write SetTabela;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    { Published declarations }
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TPesquisa]);
end;

{ TPesquisa }

constructor TPesquisa.Create(Owner: TComponent);
begin
  inherited Create(Owner);

  Caption := ' ';
  BevelOuter := bvNone;
  Height := 22;
  
  lbPesquisa         := TRzLabel.Create(Self);
  lbPesquisa.Parent  := Self;
  lbPesquisa.Name    := 'lbPesquisa';
  lbPesquisa.Left    := 0;
  lbPesquisa.Top     := 0;
  lbPesquisa.Visible := True;

  FCombo             := TRzDBComboBox.Create(Self);
  FCombo.Parent      := Self;
  FCombo.Name        := 'dbl';
  FCombo.Top         := 0;
  FCombo.Anchors     := [akLeft, akTop, akRight];
  FCombo.Visible     := True;
  FCombo.Style       := csOwnerDrawFixed;
  FCombo.FlatButtons := True;
  FCombo.FrameHotTrack := True;
end;

procedure TPesquisa.SetCaptionLabel(const Value: String);
begin
  lbPesquisa.Caption := Value;
  FCombo.Left := lbPesquisa.Left + lbPesquisa.Width + 8;
  FCombo.Width   := Width - FCombo.Left;
end;

function TPesquisa.GetDataSource: TDataSource;
begin
  result := FCombo.DataSource;
end;

procedure TPesquisa.SetDataSource(const Value: TDataSource);
begin
  FCombo.DataSource := Value;
end;

procedure TPesquisa.SetTabela(const Value: TTabela);
begin
  FTabela := Value;

  FCombo.DataField := '';
  FSql := '';

  if Value = tbTransportadora then
  begin
    FCombo.DataField := 'transportadora_sq';
    FSql := 'select transportadora_sq, nome from transportadoras order by 2';
    SetCaptionLabel('Transportadora');
  end;
end;

procedure TPesquisa.carregaCombo;
var
  cds: TClientDataSet;
begin
  FCombo.Items.Clear;

  if SQLConnection = nil then
    Exit;

  try
    try
      SQLConn.Execute(FSql, nil, @cds);
      While not cds.Eof do
      begin
        FCombo.AddItemValue(cds.Fields.Fields[1].AsString, cds.Fields.Fields[0].AsString);
        cds.Next;
      end;
    except
      ShowMessage('Por favor, digite um comando SQL válido!');
    end;
  finally
    FreeAndNil(cds);
  end;
end;

end.
