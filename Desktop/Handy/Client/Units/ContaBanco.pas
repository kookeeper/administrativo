unit ContaBanco;

interface

uses Cadastro, Classes, DBClient, uDM, SysUtils, Empresa;

  {$M+}
type
  TContaBanco = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _nome_banco: String;
    _nome_agencia: String;
    _numero_conta: String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property nome_banco:     String  read _nome_banco   write _nome_banco;
    property nome_agencia:   String  read _nome_agencia write _nome_agencia;
    property numero_conta:   String  read _numero_conta write _numero_conta;
  public
    class function listaContaBancoPagar: TClientDataSet;
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TContaBanco }

constructor TContaBanco.Create;
begin
  setTabela('conta_banco');
  setLista('Banco=nome_banco,Agencia=nome_agencia,Conta=numero_conta');
end;

destructor TContaBanco.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

class function TContaBanco.listaContaBancoPagar(): TClientDataSet;
begin
  result := listaPersonalizada('select conta_banco_sq, concat(nome_banco, '', '', numero_conta) as numero_conta from conta_banco order by 2');
end;

end.
