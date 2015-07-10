unit uRegistrarVendaSenha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, StdCtrls, Mask, RzEdit, DBCtrls, RzDBCmbo;

type
  TRegistrarVendaSenha = class(TForm)
    Label54: TLabel;
    dblVendedor: TRzDBLookupComboBox;
    Label2: TLabel;
    edSenha: TRzEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    dsListaVendedores: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    FPctDescontoMaximo: Integer;
    FVendedorMaster: Integer;
    procedure SetPctDescontoMaximo(const Value: Integer);
    procedure SetVendedorMaster(const Value: Integer);
    { Private declarations }
  public
    property PctDescontoMaximo: Integer read FPctDescontoMaximo write SetPctDescontoMaximo;
    property VendedorMaster: Integer read FVendedorMaster write SetVendedorMaster;
    { Public declarations }
  end;

var
  RegistrarVendaSenha: TRegistrarVendaSenha;

implementation

uses Vendedor, Usuario, DBClient;

{$R *.dfm}

procedure TRegistrarVendaSenha.FormCreate(Sender: TObject);
begin
  dsListaVendedores.DataSet := TVendedor.listaRegistros('order by nome_vendedor');
  dblVendedor.KeyValue := dsListaVendedores.DataSet.FieldByName(dblVendedor.KeyField).Value;
end;

procedure TRegistrarVendaSenha.OKBtnClick(Sender: TObject);
begin
  PctDescontoMaximo := TVendedor.buscarDescontoMaster(dblVendedor.KeyValue, edSenha.Text);
  VendedorMaster := dblVendedor.KeyValue;
end;

procedure TRegistrarVendaSenha.SetPctDescontoMaximo(const Value: Integer);
begin
  FPctDescontoMaximo := Value;
end;

procedure TRegistrarVendaSenha.SetVendedorMaster(const Value: Integer);
begin
  FVendedorMaster := Value;
end;

end.
