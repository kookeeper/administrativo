unit Project1_TLB;

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
// File generated on 14/3/2005 16:12:45 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Delphi\TMP\Project1.tlb (1)
// LIBID: {9B3DE5FA-E5FC-4AFF-BB3C-DCAA87A3FDA2}
// LCID: 0
// Helpfile: 
// HelpString: Project1 Library
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
  Project1MajorVersion = 1;
  Project1MinorVersion = 0;

  LIBID_Project1: TGUID = '{9B3DE5FA-E5FC-4AFF-BB3C-DCAA87A3FDA2}';

  IID_IServer: TGUID = '{E86530C9-9C51-4D3B-8937-2F943E13B04E}';
  CLASS_Server: TGUID = '{DEA165E9-59EE-4923-B79C-00183B9E1EAA}';
  IID_IServerLista: TGUID = '{60905160-A5B4-45A9-867D-7A822E06C113}';
  CLASS_ServerLista: TGUID = '{61C8423B-CA93-4A31-AF78-112B45A56AAB}';
  IID_IServerImpr: TGUID = '{090893B5-3094-47F0-9750-428E5B88BD9C}';
  CLASS_ServerImpr: TGUID = '{564B5ABE-2D35-4293-BF6D-09B2047AA585}';
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
// GUID:      {E86530C9-9C51-4D3B-8937-2F943E13B04E}
// *********************************************************************//
  IServer = interface(IAppServer)
    ['{E86530C9-9C51-4D3B-8937-2F943E13B04E}']
    function VerificaSenha: TDateTime; safecall;
  end;

// *********************************************************************//
// DispIntf:  IServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E86530C9-9C51-4D3B-8937-2F943E13B04E}
// *********************************************************************//
  IServerDisp = dispinterface
    ['{E86530C9-9C51-4D3B-8937-2F943E13B04E}']
    function VerificaSenha: TDateTime; dispid 301;
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
// GUID:      {60905160-A5B4-45A9-867D-7A822E06C113}
// *********************************************************************//
  IServerLista = interface(IAppServer)
    ['{60905160-A5B4-45A9-867D-7A822E06C113}']
  end;

// *********************************************************************//
// DispIntf:  IServerListaDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {60905160-A5B4-45A9-867D-7A822E06C113}
// *********************************************************************//
  IServerListaDisp = dispinterface
    ['{60905160-A5B4-45A9-867D-7A822E06C113}']
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
// GUID:      {090893B5-3094-47F0-9750-428E5B88BD9C}
// *********************************************************************//
  IServerImpr = interface(IAppServer)
    ['{090893B5-3094-47F0-9750-428E5B88BD9C}']
  end;

// *********************************************************************//
// DispIntf:  IServerImprDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {090893B5-3094-47F0-9750-428E5B88BD9C}
// *********************************************************************//
  IServerImprDisp = dispinterface
    ['{090893B5-3094-47F0-9750-428E5B88BD9C}']
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
