unit Assistencias;

interface

uses SysUtils, Classes, Cadastro, UDM, DB, AssistenciasEquipamento,
  AssistenciasItem, Variants, DBClient, Empresa;

type
  TAssistencias = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _numero_assistencia: Integer;
    _data_chamado: TDateTime;
    _data_assistencia: TDateTime;
    _cotacao_dolar: Double;
    _cliente_sq: Integer;
    _cond_pagto_sq: Variant;
    _desp_chamado: Double;
    _desp_htec_ad: Double;
    _desp_desloc: Double;
    _vlr_pecas: Double;
    _vlr_total: Double;
    _hora_inicio: TDateTime;
    _hora_fim: TDateTime;
    _garantia: String;
    _contrato: String;
    _vendedor_sq: Integer;
    _frete: String;
    procedure proximaAssistencia;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property numero_assistencia : Integer   read _numero_assistencia write _numero_assistencia ;
    property data_chamado       : TDateTime read _data_chamado       write _data_chamado       ;
    property data_assistencia   : TDateTime read _data_assistencia   write _data_assistencia   ;
    property cotacao_dolar      : Double    read _cotacao_dolar      write _cotacao_dolar      ;
    property cliente_sq         : Integer   read _cliente_sq         write _cliente_sq         ;
    property cond_pagto_sq      : Variant   read _cond_pagto_sq      write _cond_pagto_sq      ;
    property desp_chamado       : Double    read _desp_chamado       write _desp_chamado       ;
    property desp_htec_ad       : Double    read _desp_htec_ad       write _desp_htec_ad       ;
    property desp_desloc        : Double    read _desp_desloc        write _desp_desloc        ;
    property vlr_pecas          : Double    read _vlr_pecas          write _vlr_pecas          ;
    property vlr_total          : Double    read _vlr_total          write _vlr_total          ;
    property hora_inicio        : TDateTime read _hora_inicio        write _hora_inicio        ;
    property hora_fim           : TDateTime read _hora_fim           write _hora_fim           ;
    property garantia           : String    read _garantia           write _garantia           ;
    property contrato           : String    read _contrato           write _contrato           ;
    property vendedor_sq        : Integer   read _vendedor_sq        write _vendedor_sq        ;
    property frete              : String    read _frete              write _frete              ;
  public
    Equipamentos: TList;
    constructor Create; override;
    destructor Destroy; override;
    procedure salvar; override;
    procedure setIndice(const indiceP: Variant); override;
  end;

implementation

{ TAssistencias }

constructor TAssistencias.Create;
begin
  setTabela('assistencias');
  setLista('Código=numero_assistencia, Nome=nome_cliente');
  sqlLista := 'select a.*, c.nome_cliente ' +
         'from assistencias a ' +
         'left outer join clientes c on (c.cliente_sq = a.cliente_sq)';
end;

destructor TAssistencias.Destroy;
var
  i: Integer;
  obj: TAssistenciasEquipamento;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_cond_pagto_sq);
  for i := 0 to Equipamentos.Count - 1 do
  begin
    obj := TAssistenciasEquipamento(Equipamentos.Items[i]);
    FreeAndNil(obj);
  end;

  FreeAndNil(Equipamentos);
  inherited;
end;

procedure TAssistencias.proximaAssistencia;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';

  DM.SCServer.AppServer.ExecSQL('UPDATE empresas SET NUMERO_ASSISTENCIA = NUMERO_ASSISTENCIA + 1');

  cds.Close;
  DM.SCServer.AppServer.CriaLista ('SELECT NUMERO_ASSISTENCIA FROM EMPRESAS');
  cds.Open;

  DM.SCServer.AppServer.ExecSQL('update assistencias set numero_assistencia = ' +
    cds.FieldByName('NUMERO_ASSISTENCIA').AsString +
    ' where numero_assistencia = 0');
end;

procedure TAssistencias.salvar;
var
  i, j: Integer;
  lista: TList;
  apagar: Boolean;
begin
  if hora_inicio = 0 then
    hora_inicio := Time;

  if hora_fim = 0 then
    hora_fim := Time;

  inherited;

  for i := 0 to Equipamentos.Count - 1 do
  begin
    TAssistenciasEquipamento(Equipamentos.Items[i]).assistencia_sq := vIndice;
    TAssistenciasEquipamento(Equipamentos.Items[i]).salvar;
  end;

  lista := TAssistenciasEquipamento.ListaEquipamentos(vIndice);
  for i := 0 to lista.Count - 1 do
  begin
    apagar := true;
    for j := 0 to Equipamentos.Count - 1 do
      if TAssistenciasEquipamento(Equipamentos.Items[j]).vIndice = TAssistenciasEquipamento(lista.Items[i]).vIndice then
        apagar := false;
    if apagar then
      TAssistenciasEquipamento(lista.Items[i]).excluirRegistro(false);
  end;

  if numero_assistencia = 0 then
    proximaAssistencia;
end;

procedure TAssistencias.setIndice(const indiceP: Variant);
begin
  inherited;

  Equipamentos := TAssistenciasEquipamento.ListaEquipamentos(vIndice);
end;

end.

