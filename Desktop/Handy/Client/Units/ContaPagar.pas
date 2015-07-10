unit ContaPagar;

interface

uses Cadastro, Fornecedor, Empresa, SysUtils;

type
  TContaPagar = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _fornecedor_sq         : TFornecedor;
    _numero_duplicata      : String;
    _valor_duplicata       : Double;
    _dtcadastro_duplicata  : TDateTime;
    _dtvencimento_duplicata: TDateTime;
    _observacao            : String;
    _conta_pagar_auto_sq   : Integer;
    _referencia_auto       : Integer;
    _dt_pgto               : TDateTime;
    _valor_pgto            : Double;
    _valor_desconto        : Double;
    _valor_juros           : Double;
    _forma_pgto            : String;
    _conta_banco_sq        : Integer;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property fornecedor_sq         : TFornecedor read _fornecedor_sq          write _fornecedor_sq         ;
    property numero_duplicata      : String      read _numero_duplicata       write _numero_duplicata      ;
    property valor_duplicata       : Double      read _valor_duplicata        write _valor_duplicata       ;
    property dtcadastro_duplicata  : TDateTime   read _dtcadastro_duplicata   write _dtcadastro_duplicata  ;
    property dtvencimento_duplicata: TDateTime   read _dtvencimento_duplicata write _dtvencimento_duplicata;
    property observacao            : String      read _observacao             write _observacao            ;
    property conta_pagar_auto_sq   : Integer     read _conta_pagar_auto_sq    write _conta_pagar_auto_sq   ;
    property referencia_auto       : Integer     read _referencia_auto        write _referencia_auto       ;
    property dt_pgto               : TDateTime   read _dt_pgto                write _dt_pgto               ;
    property valor_pgto            : Double      read _valor_pgto             write _valor_pgto            ;
    property valor_desconto        : Double      read _valor_desconto         write _valor_desconto        ;
    property valor_juros           : Double      read _valor_juros            write _valor_juros           ;
    property forma_pgto            : String      read _forma_pgto             write _forma_pgto            ;
    property conta_banco_sq        : Integer     read _conta_banco_sq         write _conta_banco_sq        ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

type
  TContaPagarAuto = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _fornecedor_sq : TFornecedor;
    _valor         : Double;
    _data_inicial  : TDateTime;
    _parcelas      : Integer;
    _observacao    : String;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property fornecedor_sq : TFornecedor  read _fornecedor_sq write _fornecedor_sq;
    property valor         : Double       read _valor         write _valor        ;
    property data_inicial  : TDateTime    read _data_inicial  write _data_inicial ;
    property parcelas      : Integer      read _parcelas      write _parcelas     ;
    property observacao    : String       read _observacao    write _observacao   ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TContaPagar }

constructor TContaPagar.Create;
begin
  setTabela('contas_pagar');
  setLista('Fornecedor=nome_fornecedor,Duplicata=numero_duplicata,Valor=valor_duplicata');
  sqlLista := 'select cp.*, nome_fornecedor from contas_pagar cp ' +
    'inner join fornecedor f on (f.fornecedor_sq=cp.fornecedor_sq)';
end;

destructor TContaPagar.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_fornecedor_sq);

  inherited;
end;

{ TContaPagarAuto }

constructor TContaPagarAuto.Create;
begin
  setTabela('contas_pagar_auto');
  setLista('"Fornecedor=nome_fornecedor","Valor=valor","Data inicial=data_inicial"');
  sqlLista := 'select cp.*, nome_fornecedor from contas_pagar_auto cp ' +
    'inner join fornecedor f on (f.fornecedor_sq=cp.fornecedor_sq)';
end;

destructor TContaPagarAuto.Destroy;
begin
  FreeAndNil(_empresa_sq);
  FreeAndNil(_fornecedor_sq);

  inherited;
end;

end.
 
