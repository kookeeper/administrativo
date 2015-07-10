unit Duplicata;

interface

uses Cadastro, Empresa, SysUtils;

type
  TDuplicata = class(TCadastro)
  private
    _empresa_sq: TEmpresa;
    _numero_duplicata    : Integer;
    _item_duplicata      : Integer;
    _seq_duplicata       : Integer;
    _nfiscal_sq          : Integer;
    _valor_duplicata     : Double;
    _dtemissao_duplicata : TDateTime;
    _dtvencto_duplicata  : TDateTime;
    _juros_duplicata     : Double;
    _desconto_duplicata  : Double;
  published
    property empresa_sq: TEmpresa read _empresa_sq write _empresa_sq;
    property numero_duplicata    : Integer   read _numero_duplicata    write _numero_duplicata   ;
    property item_duplicata      : Integer   read _item_duplicata      write _item_duplicata     ;
    property seq_duplicata       : Integer   read _seq_duplicata       write _seq_duplicata      ;
    property nfiscal_sq          : Integer   read _nfiscal_sq          write _nfiscal_sq         ;
    property valor_duplicata     : Double    read _valor_duplicata     write _valor_duplicata    ;
    property dtemissao_duplicata : TDateTime read _dtemissao_duplicata write _dtemissao_duplicata;
    property dtvencto_duplicata  : TDateTime read _dtvencto_duplicata  write _dtvencto_duplicata ;
    property juros_duplicata     : Double    read _juros_duplicata     write _juros_duplicata    ;
    property desconto_duplicata  : Double    read _desconto_duplicata  write _desconto_duplicata ;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

type
  TDuplicataPgto = class(TCadastro)
  private
    _duplicata_sq : TDuplicata;
    _dt_pgto      : TDateTime;
    _valor_pgto   : Double;
    _forma_pgto   : String;
    _observacao   : String;
  published
    property duplicata_sq : TDuplicata read _duplicata_sq write _duplicata_sq;
    property dt_pgto      : TDateTime  read _dt_pgto      write _dt_pgto     ;
    property valor_pgto   : Double     read _valor_pgto   write _valor_pgto  ;
    property forma_pgto   : String     read _forma_pgto   write _forma_pgto  ;
    property observacao   : String     read _observacao   write _observacao  ;
  public
    constructor Create; override;
  end;

implementation

{ TDuplicata }

constructor TDuplicata.Create;
begin
  setTabela('duplicatas');
  setLista('"Duplicata=NUMERO_DUPLICATA","Item=ITEM_DUPLICATA",' +
    '"Nfiscal=NUMERO_NFISCAL","Valor=VALOR_DUPLICATA",' +
    '"Dt Emissão=DTEMISSAO_DUPLICATA","Dt Vencto=DTVENCTO_DUPLICATA"');

  sqlLista := 'select d.*, n.numero_nfiscal from duplicatas d ' +
         'left outer join nfiscais n on (n.nfiscal_sq = d.nfiscal_sq)';
end;

destructor TDuplicata.Destroy;
begin
  FreeAndNil(_empresa_sq);

  inherited;
end;

{ TDuplicataPgto }

constructor TDuplicataPgto.Create;
begin
  setTabela('duplicatas_pgto');
end;

end.
 
