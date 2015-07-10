  unit UCadastrarFormVendedores;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UCadastrarFormComum, StdCtrls, Buttons, ExtCtrls, Mask, RzEdit,
  RzRadGrp, RzPanel, Vendedor, RzTabs;

type
  TFCadastrarFormVendedores = class(TFCadastrarFormComum)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edObservacao: TRzEdit;
    rgBaseComissao: TRzRadioGroup;
    edPctPropria: TRzNumericEdit;
    edPctParceria: TRzNumericEdit;
    edPctDesconto: TRzNumericEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    edNome: TRzEdit;
    edCodigo: TRzNumericEdit;
    rgTipo: TRzRadioGroup;
    edDataCadastro: TRzDateTimeEdit;
    edDataInativacao: TRzDateTimeEdit;
    Label9: TLabel;
    edPorcentagemDesconto: TRzNumericEdit;
    Label10: TLabel;
    edPctDescontoMaster: TRzNumericEdit;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCadastrarFormVendedores: TFCadastrarFormVendedores;

implementation

uses UCadastrarListaComum, Cadastro;

{$R *.dfm}

procedure TFCadastrarFormVendedores.bbOkClick(Sender: TObject);
begin
  inherited;
  With ((Owner as TFCadastrarListaComum).registro as TVendedor) do
  begin
    codigo_vendedor       := edCodigo.IntValue;
    nome_vendedor         := edNome.Text;
    pct_comissao_propria  := edPctPropria.Value;
    pct_comissao_parceria := edPctParceria.Value;
    pct_comissao_desconto := edPctDesconto.Value;
    obs_comissao_desconto := edObservacao.Text;
    base_comissao         := Copy('FVR', rgBaseComissao.ItemIndex + 1, 1);
    tipo_vendedor         := Copy('VR', rgTipo.ItemIndex + 1, 1);
    data_cadastro         := edDataCadastro.Date;
    data_inativacao       := edDataInativacao.Date;
    pct_desconto          := edPorcentagemDesconto.IntValue;
    pct_desconto_master   := edPctDescontoMaster.IntValue;
    salvar;
  end;
end;

procedure TFCadastrarFormVendedores.FormCreate(Sender: TObject);
begin
  inherited;
  if not FListaVendedores.novo then
  begin
    edCodigo.IntValue   := (FListaVendedores.registro as TVendedor).codigo_vendedor;
    edNome.Text         := (FListaVendedores.registro as TVendedor).nome_vendedor;
    edPctPropria.Value  := (FListaVendedores.registro as TVendedor).pct_comissao_propria;
    edPctParceria.Value := (FListaVendedores.registro as TVendedor).pct_comissao_parceria;
    edPctDesconto.Value := (FListaVendedores.registro as TVendedor).pct_comissao_desconto;
    edObservacao.Text   := (FListaVendedores.registro as TVendedor).obs_comissao_desconto;
    rgBaseComissao.ItemIndex  := Pos((FListaVendedores.registro as TVendedor).base_comissao, 'FVR') - 1;
    rgTipo.ItemIndex      := Pos((FListaVendedores.registro as TVendedor).tipo_vendedor, 'VR') - 1;
    if (FListaVendedores.registro as TVendedor).data_cadastro <> 0 then
      edDataCadastro.Date   := (FListaVendedores.registro as TVendedor).data_cadastro;
    if (FListaVendedores.registro as TVendedor).data_inativacao <> 0 then
      edDataInativacao.Date := (FListaVendedores.registro as TVendedor).data_inativacao;
    edPorcentagemDesconto.IntValue := TVendedor(FListaVendedores.registro).pct_desconto;
    edPctDescontoMaster.IntValue   := TVendedor(FListaVendedores.registro).pct_desconto_master;
  end;
end;

end.
