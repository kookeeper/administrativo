unit CondPagto;

interface

uses Cadastro, DBClient, Empresa, SysUtils;

type
  TCondPagto = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _codigo_cond_pagto   : Integer;
    _descricao_cond_pagto: String;
    _parcelas            : Integer;
    _d00                 : Integer;
    _d01                 : Integer;
    _d02                 : Integer;
    _d03                 : Integer;
    _d04                 : Integer;
    _d05                 : Integer;
    _d06                 : Integer;
    _d07                 : Integer;
    _d08                 : Integer;
    _d09                 : Integer;
    _p00                 : Integer;
    _p01                 : Integer;
    _p02                 : Integer;
    _p03                 : Integer;
    _p04                 : Integer;
    _p05                 : Integer;
    _p06                 : Integer;
    _p07                 : Integer;
    _p08                 : Integer;
    _p09                 : Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property codigo_cond_pagto   : Integer read _codigo_cond_pagto    write _codigo_cond_pagto    ;
    property descricao_cond_pagto: String  read _descricao_cond_pagto write _descricao_cond_pagto ;
    property parcelas            : Integer read _parcelas             write _parcelas             ;
    property d00                 : Integer read _d00                  write _d00                  ;
    property d01                 : Integer read _d01                  write _d01                  ;
    property d02                 : Integer read _d02                  write _d02                  ;
    property d03                 : Integer read _d03                  write _d03                  ;
    property d04                 : Integer read _d04                  write _d04                  ;
    property d05                 : Integer read _d05                  write _d05                  ;
    property d06                 : Integer read _d06                  write _d06                  ;
    property d07                 : Integer read _d07                  write _d07                  ;
    property d08                 : Integer read _d08                  write _d08                  ;
    property d09                 : Integer read _d09                  write _d09                  ;
    property p00                 : Integer read _p00                  write _p00                  ;
    property p01                 : Integer read _p01                  write _p01                  ;
    property p02                 : Integer read _p02                  write _p02                  ;
    property p03                 : Integer read _p03                  write _p03                  ;
    property p04                 : Integer read _p04                  write _p04                  ;
    property p05                 : Integer read _p05                  write _p05                  ;
    property p06                 : Integer read _p06                  write _p06                  ;
    property p07                 : Integer read _p07                  write _p07                  ;
    property p08                 : Integer read _p08                  write _p08                  ;
    property p09                 : Integer read _p09                  write _p09                  ;
  public
    function proximo: Integer;
    constructor Create; override;
    destructor Destroy; override;
  end;


implementation

uses UDM;

{ TCondPagto }

constructor TCondPagto.Create;
begin
  setTabela('cond_pagto');
  setLista('Código=CODIGO_COND_PAGTO,Descrição=DESCRICAO_COND_PAGTO' +
    ',Parcelas=PARCELAS,D1=D00,D2=D01,D3=D02,D4=D03,D5=D04,D6=D05,D7=D06,D8=D07' +
    ',D9=D08,D10=D09');
end;

destructor TCondPagto.Destroy;
begin
  FreeAndNil(_empresa_sq);
  
  inherited;
end;

function TCondPagto.proximo: Integer;
var
  cds: TClientDataSet;
begin
  cds := TClientDataSet.Create(DM);
  cds.RemoteServer := DM.SCServer;
  cds.ProviderName := 'dspLista';
  cds.Close;
  DM.SCServer.AppServer.CriaLista('select max(codigo_cond_pagto) as maximo from cond_pagto');
  cds.Open;
  result := cds.FieldByName('maximo').AsInteger + 1;
end;

end.
