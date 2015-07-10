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
// File generated on 1/12/2012 15:42:46 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Desenvolvimento\google\msystem-administrativo\Handy\Server\PrServer.tlb (1)
// LIBID: {8261428C-B579-450F-A9AD-7C9DB4B52519}
// LCID: 0
// Helpfile: 
// HelpString: PrServer Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINDOWS\system32\midas.dll)
//   (2) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
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
  IID_IServerTeste: TGUID = '{525932DB-4B4D-44D5-9A1F-50947D59D1F6}';
  CLASS_ServerTeste: TGUID = '{2D21DFE6-064C-4D3C-9561-DECB37B86046}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IServer = interface;
  IServerDisp = dispinterface;
  IServerTeste = interface;
  IServerTesteDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Server = IServer;
  ServerTeste = IServerTeste;


// *********************************************************************//
// Interface: IServer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}
// *********************************************************************//
  IServer = interface(IAppServer)
    ['{F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}']
    function ApagaRegistro(CAMPOS: OleVariant): WideString; safecall;
    procedure CriaLista(const Sql: WideString); safecall;
    procedure ExecSQL(const Sql: WideString); safecall;
    procedure ExecSQL2(const Sql: WideString); safecall;
    procedure BurcarImagemProduto(produto_sq: Integer); safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}
// *********************************************************************//
  IServerDisp = dispinterface
    ['{F230AF25-3471-4CFE-AB30-8A1CD8E9BA43}']
    function ApagaRegistro(CAMPOS: OleVariant): WideString; dispid 305;
    procedure CriaLista(const Sql: WideString); dispid 311;
    procedure ExecSQL(const Sql: WideString); dispid 321;
    procedure ExecSQL2(const Sql: WideString); dispid 323;
    procedure BurcarImagemProduto(produto_sq: Integer); dispid 301;
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
// Interface: IServerTeste
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {525932DB-4B4D-44D5-9A1F-50947D59D1F6}
// *********************************************************************//
  IServerTeste = interface(IAppServer)
    ['{525932DB-4B4D-44D5-9A1F-50947D59D1F6}']
    function ApagaRegistro(CAMPOS: OleVariant): WideString; safecall;
    procedure CriaLista(const Sql: WideString); safecall;
    procedure ExecSQL(const Sql: WideString); safecall;
    procedure ExecSQL2(const Sql: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerTesteDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {525932DB-4B4D-44D5-9A1F-50947D59D1F6}
// *********************************************************************//
  IServerTesteDisp = dispinterface
    ['{525932DB-4B4D-44D5-9A1F-50947D59D1F6}']
    function ApagaRegistro(CAMPOS: OleVariant): WideString; dispid 305;
    procedure CriaLista(const Sql: WideString); dispid 311;
    procedure ExecSQL(const Sql: WideString); dispid 321;
    procedure ExecSQL2(const Sql: WideString); dispid 323;
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
// The Class CoServerTeste provides a Create and CreateRemote method to          
// create instances of the default interface IServerTeste exposed by              
// the CoClass ServerTeste. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoServerTeste = class
    class function Create: IServerTeste;
    class function CreateRemote(const MachineName: string): IServerTeste;
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

class function CoServerTeste.Create: IServerTeste;
begin
  Result := CreateComObject(CLASS_ServerTeste) as IServerTeste;
end;

class function CoServerTeste.CreateRemote(const MachineName: string): IServerTeste;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ServerTeste) as IServerTeste;
end;

end.
