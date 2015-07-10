unit NfServico;

interface

uses Cadastro, Cliente, Empresa, SysUtils;

type
  TNfServico = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _numero_nf_servico   : Integer;
    _data_nf_servico     : TDateTime;
    _cliente_sq          : TCliente;
    _ttl_nf_servico      : Double;
    _aliq_iss_nf_servico : Double;
    _vlr_iss_nf_servico  : Double;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property numero_nf_servico   : Integer   read _numero_nf_servico   write _numero_nf_servico  ;
    property data_nf_servico     : TDateTime read _data_nf_servico     write _data_nf_servico    ;
    property cliente_sq          : TCliente  read _cliente_sq          write _cliente_sq         ;
    property ttl_nf_servico      : Double    read _ttl_nf_servico      write _ttl_nf_servico     ;
    property aliq_iss_nf_servico : Double    read _aliq_iss_nf_servico write _aliq_iss_nf_servico;
    property vlr_iss_nf_servico  : Double    read _vlr_iss_nf_servico  write _vlr_iss_nf_servico ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TNfServico }

constructor TNfServico.Create;
begin
  setTabela('nf_servicos');
  setLista('Número=NUMERO_NF_SERVICO,Data=DATA_NF_SERVICO,Cliente=NOME_CLIENTE');
  sqlLista := 'select nf.*, c.nome_cliente from nf_servicos nf ' +
         'left outer join clientes c on (c.cliente_sq = nf.cliente_sq)';
end;

destructor TNfServico.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_cliente_sq);

  inherited;
end;

end.
 
