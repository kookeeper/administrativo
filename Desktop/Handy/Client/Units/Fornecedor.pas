unit Fornecedor;

interface

uses Cadastro, SysUtils, UDM, DB, Variants, Dialogs, Classes, Controls, DBClient,
    Empresa;

  {$M+}
type
  TFornecedor = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _cnpj_fornecedor: String;
    _nome_fornecedor: String;
    _inscr_municipal: String;
    _inscr_estadual: String;
    _logradouro: String;
    _numero: String;
    _bairro: String;
    _complemento: String;
    _cep: String;
    _cidade: String;
    _estado: String;
    _pais: String;
    _telefone: String;
    _celular: String;
    _e_mail: String;
    _contato: String;
    _observacao: String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property cnpj_fornecedor: String  read _cnpj_fornecedor write _cnpj_fornecedor;
    property nome_fornecedor: String  read _nome_fornecedor write _nome_fornecedor;
    property inscr_municipal: String  read _inscr_municipal write _inscr_municipal;
    property inscr_estadual:  String  read _inscr_estadual  write _inscr_estadual;
    property logradouro:      String  read _logradouro      write _logradouro;
    property numero:          String  read _numero          write _numero;
    property bairro:          String  read _bairro          write _bairro;
    property complemento:     String  read _complemento     write _complemento;
    property cep:             String  read _cep             write _cep;
    property cidade:          String  read _cidade          write _cidade;
    property estado:          String  read _estado          write _estado;
    property pais:            String  read _pais            write _pais;
    property telefone:        String  read _telefone        write _telefone;
    property celular:         String  read _celular         write _celular;
    property e_mail:          String  read _e_mail          write _e_mail;
    property contato:         String  read _contato         write _contato;
    property observacao:      String  read _observacao      write _observacao;
  protected
  public
    constructor Create; override;
    destructor Destroy; override;
  private
  end;

implementation

{ TFornecedor }

constructor TFornecedor.Create;
begin
  setTabela('fornecedor');
  setLista('C.N.P.J=cnpj_fornecedor,Nome=nome_fornecedor');
end;

destructor TFornecedor.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

end.

