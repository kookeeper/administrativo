unit PrServer_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 30/3/2006 17:50:56 from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\msys\Delphi\Handy\Server\PrServer.tlb (1)
// LIBID: {8261428C-B579-450F-A9AD-7C9DB4B52519}
// LCID: 0
// Helpfile: 
// HelpString: PrServer Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PrServerMajorVersion = 1;
  PrServerMinorVersion = 0;

  LIBID_PrServer: TGUID = '{8261428C-B579-450F-A9AD-7C9DB4B52519}';

  IID_IServer: TGUID = '{F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}';
  CLASS_Server: TGUID = '{A655A3E7-D825-4A1B-BE06-453254930503}';
  IID_IServerLista: TGUID = '{27539786-90F9-448F-AADD-1D5AE312C612}';
  CLASS_ServerLista: TGUID = '{F42F0CFA-A587-45F4-ACD0-C64157557715}';
  IID_IServerImpr: TGUID = '{7832A1E0-583C-4A5B-AEA0-533B61E4D888}';
  CLASS_ServerImpr: TGUID = '{25DA1343-565C-4793-9C40-FE82C204EE0C}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IServer = interface;
  IServerDisp = dispinterface;
  IServerLista = interface;
  IServerListaDisp = dispinterface;
  IServerImpr = interface;
  IServerImprDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Server = IServer;
  ServerLista = IServerLista;
  ServerImpr = IServerImpr;


// *********************************************************************//
// Interface: IServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}
// *********************************************************************//
  IServer = interface(IAppServer)
    ['{F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}']
    function VerificaSenha: TDateTime; safecall;
    function CriaRegistro(const TABELA: WideString; Novo: Byte; Chave: Integer; CAMPOS: OleVariant): WideString; safecall;
    function VerificaIndice(const TABELA: WideString; const Campo: WideString; 
                            const VALOR: WideString): Integer; safecall;
    function ApagaRegistro(CAMPOS: OleVariant): WideString; safecall;
    function CancelaNFiscal(VALOR: Integer): WideString; safecall;
    function FinalizaNfiscal(NFiscal: Integer): WideString; safecall;
    function Classificacao(Cliente_sq: Integer; AnoMes: Integer): Integer; safecall;
    function RegistraLogin(Usuario: Integer; Data: TDateTime; const IP: WideString): WideString; safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}
// *********************************************************************//
  IServerDisp = dispinterface
    ['{F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}']
    function VerificaSenha: TDateTime; dispid 302;
    function CriaRegistro(const TABELA: WideString; Novo: Byte; Chave: Integer; CAMPOS: OleVariant): WideString; dispid 303;
    function VerificaIndice(const TABELA: WideString; const Campo: WideString; 
                            const VALOR: WideString): Integer; dispid 304;
    function ApagaRegistro(CAMPOS: OleVariant): WideString; dispid 305;
    function CancelaNFiscal(VALOR: Integer): WideString; dispid 306;
    function FinalizaNfiscal(NFiscal: Integer): WideString; dispid 307;
    function Classificacao(Cliente_sq: Integer; AnoMes: Integer): Integer; dispid 308;
    function RegistraLogin(Usuario: Integer; Data: TDateTime; const IP: WideString): WideString; dispid 301;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IServerLista
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {27539786-90F9-448F-AADD-1D5AE312C612}
// *********************************************************************//
  IServerLista = interface(IAppServer)
    ['{27539786-90F9-448F-AADD-1D5AE312C612}']
    procedure CriaLista(const Sql: WideString); safecall;
    function Maximo(const TABELA: WideString; const Campo: WideString): Integer; safecall;
    procedure BuscaPecas(const Sql: WideString); safecall;
    procedure BuscaClientes(const Sql: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerListaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {27539786-90F9-448F-AADD-1D5AE312C612}
// *********************************************************************//
  IServerListaDisp = dispinterface
    ['{27539786-90F9-448F-AADD-1D5AE312C612}']
    procedure CriaLista(const Sql: WideString); dispid 301;
    function Maximo(const TABELA: WideString; const Campo: WideString): Integer; dispid 302;
    procedure BuscaPecas(const Sql: WideString); dispid 303;
    procedure BuscaClientes(const Sql: WideString); dispid 304;
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// Interface: IServerImpr
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7832A1E0-583C-4A5B-AEA0-533B61E4D888}
// *********************************************************************//
  IServerImpr = interface(IAppServer)
    ['{7832A1E0-583C-4A5B-AEA0-533B61E4D888}']
  end;

// *********************************************************************//
// DispIntf:  IServerImprDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7832A1E0-583C-4A5B-AEA0-533B61E4D888}
// *********************************************************************//
  IServerImprDisp = dispinterface
    ['{7832A1E0-583C-4A5B-AEA0-533B61E4D888}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoServer provides a Create and CreateRemote method to          
// create instances of the default interface IServer exposed by              
// the CoClass Server. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServer = class
    class function Create: IServer;
    class function CreateRemote(const MachineName: string): IServer;
  end;

// *********************************************************************//
// The Class CoServerLista provides a Create and CreateRemote method to          
// create instances of the default interface IServerLista exposed by              
// the CoClass ServerLista. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerLista = class
    class function Create: IServerLista;
    class function CreateRemote(const MachineName: string): IServerLista;
  end;

// *********************************************************************//
// The Class CoServerImpr provides a Create and CreateRemote method to          
// create instances of the default interface IServerImpr exposed by              
// the CoClass ServerImpr. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerImpr = class
    class function Create: IServerImpr;
    class function CreateRemote(const MachineName: string): IServerImpr;
  end;

implementation

uses ComObj;

class function CoServer.Create: IServer;
begin
  Result := CreateComObject(CLASS_Server) as IServer;
end;

class function CoServer.CreateRemote(const MachineName: string): IServer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Server) as IServer;
end;

class function CoServerLista.Create: IServerLista;
begin
  Result := CreateComObject(CLASS_ServerLista) as IServerLista;
end;

class function CoServerLista.CreateRemote(const MachineName: string): IServerLista;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerLista) as IServerLista;
end;

class function CoServerImpr.Create: IServerImpr;
begin
  Result := CreateComObject(CLASS_ServerImpr) as IServerImpr;
end;

class function CoServerImpr.CreateRemote(const MachineName: string): IServerImpr;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerImpr) as IServerImpr;
end;

end.
