unit UCadastrarFormNaturezas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UCadastrarFormComum, Db, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  FMTBcd, DBClient, Provider, SqlExpr, RzEdit, StrUtils, Math, RzButton,
  RzRadChk, RzPanel, RzRadGrp, RzTabs;

type
  TFCadastrarFormNaturezas = class(TFCadastrarFormComum)
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mmObservacao: TMemo;
    edCodigo: TRzEdit;
    edDescricao: TRzEdit;
    edDescricaoNF: TRzEdit;
    edUF01: TRzEdit;
    edUF02: TRzEdit;
    edUF03: TRzEdit;
    edUF04: TRzEdit;
    edUF05: TRzEdit;
    edUF06: TRzEdit;
    edUF07: TRzEdit;
    edUF08: TRzEdit;
    edUF09: TRzEdit;
    edUF10: TRzEdit;
    edUF11: TRzEdit;
    edUF12: TRzEdit;
    edUF13: TRzEdit;
    edUF14: TRzEdit;
    edUF15: TRzEdit;
    edUF16: TRzEdit;
    edUF17: TRzEdit;
    edUF18: TRzEdit;
    edUF19: TRzEdit;
    edUF20: TRzEdit;
    edUF21: TRzEdit;
    edUF22: TRzEdit;
    edUF23: TRzEdit;
    edUF24: TRzEdit;
    edUF25: TRzEdit;
    edUF26: TRzEdit;
    edUF27: TRzEdit;
    edUF28: TRzEdit;
    edUF29: TRzEdit;
    edUF30: TRzEdit;
    edUF31: TRzEdit;
    edUF32: TRzEdit;
    edUF33: TRzEdit;
    edICMS: TRzNumericEdit;
    edIPI: TRzNumericEdit;
    edCFOP: TRzEdit;
    edCFOPSubst: TRzEdit;
    rgEstoqueEntrada: TRzRadioGroup;
    rgEstoqueSaida: TRzRadioGroup;
    rgTipo: TRzRadioGroup;
    rgEntSai: TRzRadioGroup;
    cbICMS: TRzCheckBox;
    cbIPI: TRzCheckBox;
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    estado: array of string;
  end;

var
  FCadastrarFormNaturezas: TFCadastrarFormNaturezas;

implementation

uses UDM, UCadastrarListaComum, Natureza, Empresa;

{$R *.DFM}

procedure TFCadastrarFormNaturezas.bbOkClick(Sender: TObject);
var
  i1, i2: integer;
  uf1, uf2: string;
begin
  inherited;
  ModalResult := mrNone;

  SetLength (estado, 30);
  estado[0]  := edUF01.Text;
  estado[1]  := edUF02.Text;
  estado[2]  := edUF03.Text;
  estado[3]  := edUF04.Text;
  estado[4]  := edUF05.Text;
  estado[5]  := edUF06.Text;
  estado[6]  := edUF07.Text;
  estado[7]  := edUF08.Text;
  estado[8]  := edUF09.Text;
  estado[9]  := edUF10.Text;
  estado[10] := edUF11.Text;
  estado[11] := edUF12.Text;
  estado[12] := edUF13.Text;
  estado[13] := edUF14.Text;
  estado[14] := edUF15.Text;
  estado[15] := edUF16.Text;
  estado[16] := edUF17.Text;
  estado[17] := edUF18.Text;
  estado[18] := edUF19.Text;
  estado[19] := edUF20.Text;
  estado[20] := edUF21.Text;
  estado[21] := edUF22.Text;
  estado[22] := edUF23.Text;
  estado[23] := edUF24.Text;
  estado[24] := edUF25.Text;
  estado[25] := edUF26.Text;
  estado[26] := edUF27.Text;
  estado[27] := edUF28.Text;
  estado[28] := edUF29.Text;
  estado[29] := edUF30.Text;

  if edCFOP.Text = '' then
    raise Exception.Create ('C.F.O.P. Inválido!');

  if edDescricao.Text = '' then
    raise Exception.Create ('Descrição da Natureza Inválida!');

  i1 := 0;
  While i1 < 30 do
  begin
    uf1 := estado[i1];
    if ((uf1 <> '') and (not DM.estadoValido(uf1))) then
      raise Exception.Create('Estado Inválido! (' + uf1 + ')');
    i2 := i1+1;
    While i2 < 30 do
    begin
      uf2 := estado[i2];
      if uf1 = uf2 then if uf2 <> '' then if uf1 <> '' then
        raise Exception.Create('Cadastro de Estados duplicado! (' + uf1 + ')');
    inc (i2);
    end;
    inc (i1);
  end;

  with TNatureza(TFCadastrarListaComum(Owner).registro) do
  begin
    codigo_natureza := StrToInt(edCodigo.Text);
    descricao_natureza := edDescricao.Text;
    descricao_natureza_nfiscal := edDescricaoNF.Text;
    cfo := edCFOP.Text;
    aliq_icms := edICMS.Value;
    aliq_ipi  := edIPI.Value;
    tipo_nfiscal := StrToInt(Copy(rgTipo.Items[rgTipo.ItemIndex], 1, 2));
    ent_sai := IfThen(rgEntSai.ItemIndex = 0, 'E', 'S');
    observacao := mmObservacao.Text;
    isencao_icms := ifThen(cbICMS.Checked, 'S', 'N');
    isencao_ipi  := ifThen(cbIPI.Checked, 'S', 'N');
    uf01 := edUF01.Text;
    uf02 := edUF02.Text;
    uf03 := edUF03.Text;
    uf04 := edUF04.Text;
    uf05 := edUF05.Text;
    uf06 := edUF06.Text;
    uf07 := edUF07.Text;
    uf08 := edUF08.Text;
    uf09 := edUF09.Text;
    uf10 := edUF10.Text;
    uf11 := edUF11.Text;
    uf12 := edUF12.Text;
    uf13 := edUF13.Text;
    uf14 := edUF14.Text;
    uf15 := edUF15.Text;
    uf16 := edUF16.Text;
    uf17 := edUF17.Text;
    uf18 := edUF18.Text;
    uf19 := edUF19.Text;
    uf20 := edUF20.Text;
    uf21 := edUF21.Text;
    uf22 := edUF22.Text;
    uf23 := edUF23.Text;
    uf24 := edUF24.Text;
    uf25 := edUF25.Text;
    uf26 := edUF26.Text;
    uf27 := edUF27.Text;
    uf28 := edUF28.Text;
    uf29 := edUF29.Text;
    uf30 := edUF30.Text;
    cfo_subst := edCFOPSubst.Text;
    numero_estoque_entrada := rgEstoqueEntrada.ItemIndex;
    numero_estoque_saida   := rgEstoqueSaida.ItemIndex;
    salvar;
  end;
  ModalResult := mrOk;
end;

procedure TFCadastrarFormNaturezas.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;

  rgEstoqueEntrada.Items[1] := empresaSelecionada.descricao_estoque1;
  rgEstoqueEntrada.Items[2] := empresaSelecionada.descricao_estoque2;
  rgEstoqueEntrada.Items[3] := empresaSelecionada.descricao_estoque3;
  rgEstoqueEntrada.Items[4] := empresaSelecionada.descricao_estoque4;
  rgEstoqueEntrada.Items[5] := empresaSelecionada.descricao_estoque5;
  rgEstoqueEntrada.Items[6] := empresaSelecionada.descricao_estoque6;
  rgEstoqueEntrada.Items[7] := empresaSelecionada.descricao_estoque7;
  rgEstoqueEntrada.Items[8] := empresaSelecionada.descricao_estoque8;
  rgEstoqueEntrada.Items[9] := empresaSelecionada.descricao_estoque9;
  rgEstoqueEntrada.Items[10]:= empresaSelecionada.descricao_estoque10;

  rgEstoqueSaida.Items[1] := empresaSelecionada.descricao_estoque1;
  rgEstoqueSaida.Items[2] := empresaSelecionada.descricao_estoque2;
  rgEstoqueSaida.Items[3] := empresaSelecionada.descricao_estoque3;
  rgEstoqueSaida.Items[4] := empresaSelecionada.descricao_estoque4;
  rgEstoqueSaida.Items[5] := empresaSelecionada.descricao_estoque5;
  rgEstoqueSaida.Items[6] := empresaSelecionada.descricao_estoque6;
  rgEstoqueSaida.Items[7] := empresaSelecionada.descricao_estoque7;
  rgEstoqueSaida.Items[8] := empresaSelecionada.descricao_estoque8;
  rgEstoqueSaida.Items[9] := empresaSelecionada.descricao_estoque9;
  rgEstoqueSaida.Items[10]:= empresaSelecionada.descricao_estoque10;

  with TFCadastrarListaComum(Owner) do
  if not novo then
  with TNatureza(registro) do
  begin
    edCodigo.Text      := IntToStr(codigo_natureza);
    edDescricao.Text   := descricao_natureza;
    edDescricaoNF.Text := descricao_natureza_nfiscal;
    edCFOP.Text        := cfo;
    edCFOPSubst.Text   := cfo_subst;
    edICMS.Value       := aliq_icms;
    edIPI.Value        := aliq_ipi;

    for i := 0 to rgTipo.Items.Count - 1 do
      if tipo_nfiscal = StrtoInt (Copy (rgTipo.Items[i], 1, 2)) then
        rgTipo.ItemIndex := i;

    rgEntSai.ItemIndex := IfThen(ent_sai = 'E', 0, 1);
    mmObservacao.Lines.Text := observacao;
    cbICMS.Checked    := isencao_icms = 'S';
    cbIPI.Checked     := isencao_ipi = 'S';
    edUF01.Text       := uf01;
    edUF02.Text       := uf02;
    edUF03.Text       := uf03;
    edUF04.Text       := uf04;
    edUF05.Text       := uf05;
    edUF06.Text       := uf06;
    edUF07.Text       := uf07;
    edUF08.Text       := uf08;
    edUF09.Text       := uf09;
    edUF10.Text       := uf10;
    edUF11.Text       := uf11;
    edUF12.Text       := uf12;
    edUF13.Text       := uf13;
    edUF14.Text       := uf14;
    edUF15.Text       := uf15;
    edUF16.Text       := uf16;
    edUF17.Text       := uf17;
    edUF18.Text       := uf18;
    edUF19.Text       := uf19;
    edUF20.Text       := uf20;
    edUF21.Text       := uf21;
    edUF22.Text       := uf22;
    edUF23.Text       := uf23;
    edUF24.Text       := uf24;
    edUF25.Text       := uf25;
    edUF26.Text       := uf26;
    edUF27.Text       := uf27;
    edUF28.Text       := uf28;
    edUF29.Text       := uf29;
    edUF30.Text       := uf30;
    rgEstoqueEntrada.ItemIndex := numero_estoque_entrada;
    rgEstoqueSaida.ItemIndex := numero_estoque_saida;
  end
  else begin
    rgTipo.ItemIndex := 0;
    rgEntSai.ItemIndex := 0;
    edCodigo.Text := InttoStr(TNatureza(TFCadastrarListaComum(Owner).registro).proximo);
  end;
end;

end.
