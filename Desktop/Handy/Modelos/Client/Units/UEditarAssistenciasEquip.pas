unit UEditarAssistenciasEquip;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Db, Mask;

type
  TFEditarAssistenciasEquip = class(TForm)
    Panel1: TPanel;
    bbOk: TBitBtn;
    bbCancelar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource1: TDataSource;
    mmSerie: TMemo;
    Label1: TLabel;
    mmDefeito: TMemo;
    procedure Label5Click(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure DBLookupComboBox2Click(Sender: TObject);
  private
  public
  end;

var
  FEditarAssistenciasEquip: TFEditarAssistenciasEquip;

implementation

uses UDM, UBuscaProdutos, UDMLista, UCadastrarFormAssistencias;

{$R *.DFM}

procedure TFEditarAssistenciasEquip.Label5Click(Sender: TObject);
begin
  Application.CreateForm(TFBuscaProdutos, FBuscaProdutos);
  if FBuscaProdutos.ShowModal = mrOk then
  begin
    DBLookupComboBox1.KeyValue := DMLista.cdsBuscaPecas.FieldByName ('PECA_SQ').Value;
    DBLookupComboBox2.KeyValue := DMLista.cdsBuscaPecas.FieldByName ('PECA_SQ').Value;
    DMLista.cdsBuscaPecas.Close;
  end;
  FBuscaProdutos.Free;
end;

procedure TFEditarAssistenciasEquip.DBLookupComboBox1Click(Sender: TObject);
begin
  DBLookupComboBox2.KeyValue := DBLookupComboBox1.KeyValue;
end;

procedure TFEditarAssistenciasEquip.DBLookupComboBox2Click(Sender: TObject);
begin
  DBLookupComboBox1.KeyValue := DBLookupComboBox2.KeyValue;
end;

end.
