unit CartaCorrecao;

interface

uses Cadastro, Nfiscal, DBClient, Variants, Registry, Windows, SysUtils, Dialogs;

type
  TCartaCorrecao = class(TCadastro)
  private
    _nfiscal_sq: TNfiscal;
    _chave: String;
    _cod_orgao: String;
    _cnpj: String;
    _n_seq_evento: Integer;
    _correcao: String;
    _dh_evento: TDateTime;
  published
    property nfiscal_sq: TNfiscal read _nfiscal_sq write _nfiscal_sq;
    property chave: String read _chave write _chave;
    property cod_orgao: String read _cod_orgao write _cod_orgao;
    property cnpj: String read _cnpj write _cnpj;
    property n_seq_evento: Integer read _n_seq_evento write _n_seq_evento;
    property correcao: String read _correcao write _correcao;
    property dh_evento: TDateTime read _dh_evento write _dh_evento;
  public
    constructor Create; override;
    class function ProximaSequencia(numero_nfe: Integer): Integer;
    procedure gerarCCe;
  end;


implementation

{ TCartaCorrecao }

constructor TCartaCorrecao.Create;
begin
  setTabela('carta_correcao');
  setLista('"NFe=numero_nfe","Sequencia=n_seq_evento","Data emissão=dh_evento"');
  sqlLista := 'select c.*, n.numero_nfe from carta_correcao c inner join nfiscais n on (n.nfiscal_sq=c.nfiscal_sq)';
end;

class function TCartaCorrecao.ProximaSequencia(numero_nfe: Integer): Integer;
var
  cds: TClientDataSet;
begin
//  cds := listaPersonalizada('select COALESCE(max(n_seq_evento), 0)+1 as proximo from carta_correcao where nfiscal_sq = ' + VarToStr(TNfiscal.CreateNFe(numero_nfe).vIndice));
// Fiz um teste com a Rebecca e a sequencia parece ser para todas as notas, não por nota.

  cds := listaPersonalizada('select COALESCE(max(n_seq_evento), 0)+1 as proximo from carta_correcao');
  result := cds.FieldByName('proximo').AsInteger;
end;

procedure TCartaCorrecao.gerarCCe;
var
  reg : TRegistry;
  diretorio: String;
  formaEmissao, ambiente, tipoDanfe: Integer;
  arquivo: String;
  f: TextFile;
begin
  try
    Reg := TRegistry.Create;
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\MSystem', True) then
    begin
      diretorio := reg.ReadString('GeralPathLer');
//      formaEmissao := Reg.ReadInteger('GeralFormaEmissao') + 1;
//      ambiente := Reg.ReadInteger('WebServiceAmbiente') + 1;
//      tipoDanfe := Reg.ReadInteger('GeralDANFE') + 1;
      if reg.ReadString('CertificadoNumSerie') = '' then
        raise Exception.Create('Não há um certificado configurado.');
    end
    else
      Exit;

    try
      if not DirectoryExists(diretorio) then
        raise Exception.Create('Diretorio não existe (' + diretorio + ').');

      if arquivo = '' then
        arquivo := diretorio + '\' + IntToStr(n_seq_evento) + '._cce';

      AssignFile(f, arquivo);
      Rewrite(f);

      Writeln(f, 'Chave ', chave);
      Writeln(f, 'codOrgao ', cod_orgao);
      Writeln(f, 'CNPJ ', cnpj);
      Writeln(f, 'nSeqEvento ', n_seq_evento);
      Writeln(f, 'Correcao ', StringReplace(correcao, char(13) + char(10), '\n', [rfReplaceAll]));

      CloseFile(f);

      MoveFileEx(PAnsiChar(diretorio + '\' + IntToStr(n_seq_evento) + '._cce'), PAnsiChar(diretorio + '\' + IntToStr(n_seq_evento) + '.cce'), MOVEFILE_REPLACE_EXISTING);
    except on E: Exception do
      begin
        CloseFile(f);
        DeleteFile(diretorio + '\' + IntToStr(nfiscal_sq.numero_nfiscal) + '._cce');
        ShowMessage(e.Message);
      end;
    end;
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
end;

end.
