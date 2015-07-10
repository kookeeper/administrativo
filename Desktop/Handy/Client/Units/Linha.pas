unit Linha;

interface

uses Cadastro, Empresa, SysUtils;

type
  TLinha = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _descricao_linha : String;
    _exclusiva : String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property descricao_linha: String read _descricao_linha write _descricao_linha;
    property exclusiva: String read _exclusiva write _exclusiva;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
implementation

{ TLinha }

constructor TLinha.Create;
begin
  setTabela('linha');
  setLista('Descrição=descricao_linha,Exclusiva=exclusiva');
end;

destructor TLinha.Destroy;
begin
  FreeAndNil(_empresa_sq);
  inherited;
end;

end.
 
