unit NETCONLib_TLB;

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
// File generated on 12.08.2015 21:22:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Windows\system32\hnetcfg.dll (1)
// LIBID: {43E734CA-043D-4A70-9A2C-A8F254063D91}
// LCID: 0
// Helpfile: 
// HelpString: NetCon 1.0 Type Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// Errors:
//   Hint: Parameter 'Type' of INetSharingConfiguration.EnableSharing changed to 'Type_'
// ************************************************************************ //
// *************************************************************************//
// NOTE:                                                                      
// Items guarded by $IFDEF_LIVE_SERVER_AT_DESIGN_TIME are used by properties  
// which return objects that may need to be explicitly created via a function 
// call prior to any access via the property. These items have been disabled  
// in order to prevent accidental use from within the object inspector. You   
// may enable them by defining LIVE_SERVER_AT_DESIGN_TIME or by selectively   
// removing them from the $IFDEF blocks. However, such items must still be    
// programmatically created via a method of the appropriate CoClass before    
// they can be used.                                                          
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  NETCONLibMajorVersion = 1;
  NETCONLibMinorVersion = 0;

  LIBID_NETCONLib: TGUID = '{43E734CA-043D-4A70-9A2C-A8F254063D91}';

  IID_INetSharingManager: TGUID = '{C08956B7-1CD3-11D1-B1C5-00805FC1270E}';
  CLASS_NetSharingManager: TGUID = '{5C63C1AD-3956-4FF8-8486-40034758315B}';
  IID_INetSharingPublicConnectionCollection: TGUID = '{7D7A6355-F372-4971-A149-BFC927BE762A}';
  IID_INetSharingPrivateConnectionCollection: TGUID = '{38AE69E0-4409-402A-A2CB-E965C727F840}';
  IID_INetConnection: TGUID = '{C08956A1-1CD3-11D1-B1C5-00805FC1270E}';
  IID_INetSharingConfiguration: TGUID = '{C08956B6-1CD3-11D1-B1C5-00805FC1270E}';
  IID_INetSharingPortMappingCollection: TGUID = '{02E4A2DE-DA20-4E34-89C8-AC22275A010B}';
  IID_INetSharingPortMapping: TGUID = '{C08956B1-1CD3-11D1-B1C5-00805FC1270E}';
  IID_INetSharingPortMappingProps: TGUID = '{24B7E9B5-E38F-4685-851B-00892CF5F940}';
  IID_INetSharingEveryConnectionCollection: TGUID = '{33C4643C-7811-46FA-A89A-768597BD7223}';
  IID_INetConnectionProps: TGUID = '{F4277C95-CE5B-463D-8167-5662D9BCAA72}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library                    
// *********************************************************************//
// Constants for enum tagSHARINGCONNECTION_ENUM_FLAGS
type
  tagSHARINGCONNECTION_ENUM_FLAGS = TOleEnum;
const
  ICSSC_DEFAULT = $00000000;
  ICSSC_ENABLED = $00000001;

// Constants for enum tagNETCON_STATUS
type
  tagNETCON_STATUS = TOleEnum;
const
  NCS_DISCONNECTED = $00000000;
  NCS_CONNECTING = $00000001;
  NCS_CONNECTED = $00000002;
  NCS_DISCONNECTING = $00000003;
  NCS_HARDWARE_NOT_PRESENT = $00000004;
  NCS_HARDWARE_DISABLED = $00000005;
  NCS_HARDWARE_MALFUNCTION = $00000006;
  NCS_MEDIA_DISCONNECTED = $00000007;
  NCS_AUTHENTICATING = $00000008;
  NCS_AUTHENTICATION_SUCCEEDED = $00000009;
  NCS_AUTHENTICATION_FAILED = $0000000A;
  NCS_INVALID_ADDRESS = $0000000B;
  NCS_CREDENTIALS_REQUIRED = $0000000C;

// Constants for enum tagNETCON_MEDIATYPE
type
  tagNETCON_MEDIATYPE = TOleEnum;
const
  NCM_NONE = $00000000;
  NCM_DIRECT = $00000001;
  NCM_ISDN = $00000002;
  NCM_LAN = $00000003;
  NCM_PHONE = $00000004;
  NCM_TUNNEL = $00000005;
  NCM_PPPOE = $00000006;
  NCM_BRIDGE = $00000007;
  NCM_SHAREDACCESSHOST_LAN = $00000008;
  NCM_SHAREDACCESSHOST_RAS = $00000009;

// Constants for enum tagSHARINGCONNECTIONTYPE
type
  tagSHARINGCONNECTIONTYPE = TOleEnum;
const
  ICSSHARINGTYPE_PUBLIC = $00000000;
  ICSSHARINGTYPE_PRIVATE = $00000001;

// Constants for enum tagICS_TARGETTYPE
type
  tagICS_TARGETTYPE = TOleEnum;
const
  ICSTT_NAME = $00000000;
  ICSTT_IPADDRESS = $00000001;

type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  INetSharingManager = interface;
  INetSharingManagerDisp = dispinterface;
  INetSharingPublicConnectionCollection = interface;
  INetSharingPublicConnectionCollectionDisp = dispinterface;
  INetSharingPrivateConnectionCollection = interface;
  INetSharingPrivateConnectionCollectionDisp = dispinterface;
  INetConnection = interface;
  INetSharingConfiguration = interface;
  INetSharingConfigurationDisp = dispinterface;
  INetSharingPortMappingCollection = interface;
  INetSharingPortMappingCollectionDisp = dispinterface;
  INetSharingPortMapping = interface;
  INetSharingPortMappingDisp = dispinterface;
  INetSharingPortMappingProps = interface;
  INetSharingPortMappingPropsDisp = dispinterface;
  INetSharingEveryConnectionCollection = interface;
  INetSharingEveryConnectionCollectionDisp = dispinterface;
  INetConnectionProps = interface;
  INetConnectionPropsDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  NetSharingManager = INetSharingManager;


// *********************************************************************//
// Declaration of structures, unions and aliases.                         
// *********************************************************************//
  PUserType1 = ^tagNETCON_PROPERTIES; {*}

  tagNETCON_PROPERTIES = packed record
    guidId: TGUID;
    pszwName: PWideChar;
    pszwDeviceName: PWideChar;
    Status: tagNETCON_STATUS;
    MediaType: tagNETCON_MEDIATYPE;
    dwCharacter: LongWord;
    clsidThisObject: TGUID;
    clsidUiObject: TGUID;
  end;


// *********************************************************************//
// Interface: INetSharingManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C08956B7-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetSharingManager = interface(IDispatch)
    ['{C08956B7-1CD3-11D1-B1C5-00805FC1270E}']
    function Get_SharingInstalled: WordBool; safecall;
    function Get_EnumPublicConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPublicConnectionCollection; safecall;
    function Get_EnumPrivateConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPrivateConnectionCollection; safecall;
    function Get_INetSharingConfigurationForINetConnection(const pNetConnection: INetConnection): INetSharingConfiguration; safecall;
    function Get_EnumEveryConnection: INetSharingEveryConnectionCollection; safecall;
    function Get_NetConnectionProps(const pNetConnection: INetConnection): INetConnectionProps; safecall;
    property SharingInstalled: WordBool read Get_SharingInstalled;
    property EnumPublicConnections[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPublicConnectionCollection read Get_EnumPublicConnections;
    property EnumPrivateConnections[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPrivateConnectionCollection read Get_EnumPrivateConnections;
    property INetSharingConfigurationForINetConnection[const pNetConnection: INetConnection]: INetSharingConfiguration read Get_INetSharingConfigurationForINetConnection;
    property EnumEveryConnection: INetSharingEveryConnectionCollection read Get_EnumEveryConnection;
    property NetConnectionProps[const pNetConnection: INetConnection]: INetConnectionProps read Get_NetConnectionProps;
  end;

// *********************************************************************//
// DispIntf:  INetSharingManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C08956B7-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetSharingManagerDisp = dispinterface
    ['{C08956B7-1CD3-11D1-B1C5-00805FC1270E}']
    property SharingInstalled: WordBool readonly dispid 1;
    property EnumPublicConnections[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPublicConnectionCollection readonly dispid 2;
    property EnumPrivateConnections[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPrivateConnectionCollection readonly dispid 3;
    property INetSharingConfigurationForINetConnection[const pNetConnection: INetConnection]: INetSharingConfiguration readonly dispid 6;
    property EnumEveryConnection: INetSharingEveryConnectionCollection readonly dispid 7;
    property NetConnectionProps[const pNetConnection: INetConnection]: INetConnectionProps readonly dispid 8;
  end;

// *********************************************************************//
// Interface: INetSharingPublicConnectionCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7D7A6355-F372-4971-A149-BFC927BE762A}
// *********************************************************************//
  INetSharingPublicConnectionCollection = interface(IDispatch)
    ['{7D7A6355-F372-4971-A149-BFC927BE762A}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  INetSharingPublicConnectionCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {7D7A6355-F372-4971-A149-BFC927BE762A}
// *********************************************************************//
  INetSharingPublicConnectionCollectionDisp = dispinterface
    ['{7D7A6355-F372-4971-A149-BFC927BE762A}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Interface: INetSharingPrivateConnectionCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {38AE69E0-4409-402A-A2CB-E965C727F840}
// *********************************************************************//
  INetSharingPrivateConnectionCollection = interface(IDispatch)
    ['{38AE69E0-4409-402A-A2CB-E965C727F840}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  INetSharingPrivateConnectionCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {38AE69E0-4409-402A-A2CB-E965C727F840}
// *********************************************************************//
  INetSharingPrivateConnectionCollectionDisp = dispinterface
    ['{38AE69E0-4409-402A-A2CB-E965C727F840}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Interface: INetConnection
// Flags:     (0)
// GUID:      {C08956A1-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetConnection = interface(IUnknown)
    ['{C08956A1-1CD3-11D1-B1C5-00805FC1270E}']
    function Connect: HResult; stdcall;
    function Disconnect: HResult; stdcall;
    function Delete: HResult; stdcall;
    function Duplicate(pszwDuplicateName: PWideChar; out ppCon: INetConnection): HResult; stdcall;
    function GetProperties(out ppProps: PUserType1): HResult; stdcall;
    function GetUiObjectClassId(out pclsid: TGUID): HResult; stdcall;
    function Rename(pszwNewName: PWideChar): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: INetSharingConfiguration
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C08956B6-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetSharingConfiguration = interface(IDispatch)
    ['{C08956B6-1CD3-11D1-B1C5-00805FC1270E}']
    function Get_SharingEnabled: WordBool; safecall;
    function Get_SharingConnectionType: tagSHARINGCONNECTIONTYPE; safecall;
    procedure DisableSharing; safecall;
    procedure EnableSharing(Type_: tagSHARINGCONNECTIONTYPE); safecall;
    function Get_InternetFirewallEnabled: WordBool; safecall;
    procedure DisableInternetFirewall; safecall;
    procedure EnableInternetFirewall; safecall;
    function Get_EnumPortMappings(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPortMappingCollection; safecall;
    function AddPortMapping(const bstrName: WideString; ucIPProtocol: Byte; usExternalPort: Word; 
                            usInternalPort: Word; dwOptions: LongWord; 
                            const bstrTargetNameOrIPAddress: WideString; 
                            eTargetType: tagICS_TARGETTYPE): INetSharingPortMapping; safecall;
    procedure RemovePortMapping(const pMapping: INetSharingPortMapping); safecall;
    property SharingEnabled: WordBool read Get_SharingEnabled;
    property SharingConnectionType: tagSHARINGCONNECTIONTYPE read Get_SharingConnectionType;
    property InternetFirewallEnabled: WordBool read Get_InternetFirewallEnabled;
    property EnumPortMappings[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPortMappingCollection read Get_EnumPortMappings;
  end;

// *********************************************************************//
// DispIntf:  INetSharingConfigurationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C08956B6-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetSharingConfigurationDisp = dispinterface
    ['{C08956B6-1CD3-11D1-B1C5-00805FC1270E}']
    property SharingEnabled: WordBool readonly dispid 1;
    property SharingConnectionType: tagSHARINGCONNECTIONTYPE readonly dispid 2;
    procedure DisableSharing; dispid 3;
    procedure EnableSharing(Type_: tagSHARINGCONNECTIONTYPE); dispid 4;
    property InternetFirewallEnabled: WordBool readonly dispid 5;
    procedure DisableInternetFirewall; dispid 6;
    procedure EnableInternetFirewall; dispid 7;
    property EnumPortMappings[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPortMappingCollection readonly dispid 8;
    function AddPortMapping(const bstrName: WideString; ucIPProtocol: Byte; 
                            usExternalPort: {??Word}OleVariant; usInternalPort: {??Word}OleVariant; 
                            dwOptions: LongWord; const bstrTargetNameOrIPAddress: WideString; 
                            eTargetType: tagICS_TARGETTYPE): INetSharingPortMapping; dispid 9;
    procedure RemovePortMapping(const pMapping: INetSharingPortMapping); dispid 10;
  end;

// *********************************************************************//
// Interface: INetSharingPortMappingCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02E4A2DE-DA20-4E34-89C8-AC22275A010B}
// *********************************************************************//
  INetSharingPortMappingCollection = interface(IDispatch)
    ['{02E4A2DE-DA20-4E34-89C8-AC22275A010B}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  INetSharingPortMappingCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {02E4A2DE-DA20-4E34-89C8-AC22275A010B}
// *********************************************************************//
  INetSharingPortMappingCollectionDisp = dispinterface
    ['{02E4A2DE-DA20-4E34-89C8-AC22275A010B}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Interface: INetSharingPortMapping
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C08956B1-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetSharingPortMapping = interface(IDispatch)
    ['{C08956B1-1CD3-11D1-B1C5-00805FC1270E}']
    procedure Disable; safecall;
    procedure Enable; safecall;
    function Get_Properties: INetSharingPortMappingProps; safecall;
    procedure Delete; safecall;
    property Properties: INetSharingPortMappingProps read Get_Properties;
  end;

// *********************************************************************//
// DispIntf:  INetSharingPortMappingDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C08956B1-1CD3-11D1-B1C5-00805FC1270E}
// *********************************************************************//
  INetSharingPortMappingDisp = dispinterface
    ['{C08956B1-1CD3-11D1-B1C5-00805FC1270E}']
    procedure Disable; dispid 1;
    procedure Enable; dispid 2;
    property Properties: INetSharingPortMappingProps readonly dispid 3;
    procedure Delete; dispid 4;
  end;

// *********************************************************************//
// Interface: INetSharingPortMappingProps
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {24B7E9B5-E38F-4685-851B-00892CF5F940}
// *********************************************************************//
  INetSharingPortMappingProps = interface(IDispatch)
    ['{24B7E9B5-E38F-4685-851B-00892CF5F940}']
    function Get_Name: WideString; safecall;
    function Get_IPProtocol: Byte; safecall;
    function Get_ExternalPort: Integer; safecall;
    function Get_InternalPort: Integer; safecall;
    function Get_Options: Integer; safecall;
    function Get_TargetName: WideString; safecall;
    function Get_TargetIPAddress: WideString; safecall;
    function Get_Enabled: WordBool; safecall;
    property Name: WideString read Get_Name;
    property IPProtocol: Byte read Get_IPProtocol;
    property ExternalPort: Integer read Get_ExternalPort;
    property InternalPort: Integer read Get_InternalPort;
    property Options: Integer read Get_Options;
    property TargetName: WideString read Get_TargetName;
    property TargetIPAddress: WideString read Get_TargetIPAddress;
    property Enabled: WordBool read Get_Enabled;
  end;

// *********************************************************************//
// DispIntf:  INetSharingPortMappingPropsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {24B7E9B5-E38F-4685-851B-00892CF5F940}
// *********************************************************************//
  INetSharingPortMappingPropsDisp = dispinterface
    ['{24B7E9B5-E38F-4685-851B-00892CF5F940}']
    property Name: WideString readonly dispid 1;
    property IPProtocol: Byte readonly dispid 2;
    property ExternalPort: Integer readonly dispid 3;
    property InternalPort: Integer readonly dispid 4;
    property Options: Integer readonly dispid 5;
    property TargetName: WideString readonly dispid 6;
    property TargetIPAddress: WideString readonly dispid 7;
    property Enabled: WordBool readonly dispid 8;
  end;

// *********************************************************************//
// Interface: INetSharingEveryConnectionCollection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {33C4643C-7811-46FA-A89A-768597BD7223}
// *********************************************************************//
  INetSharingEveryConnectionCollection = interface(IDispatch)
    ['{33C4643C-7811-46FA-A89A-768597BD7223}']
    function Get__NewEnum: IUnknown; safecall;
    function Get_Count: Integer; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  INetSharingEveryConnectionCollectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {33C4643C-7811-46FA-A89A-768597BD7223}
// *********************************************************************//
  INetSharingEveryConnectionCollectionDisp = dispinterface
    ['{33C4643C-7811-46FA-A89A-768597BD7223}']
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
  end;

// *********************************************************************//
// Interface: INetConnectionProps
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F4277C95-CE5B-463D-8167-5662D9BCAA72}
// *********************************************************************//
  INetConnectionProps = interface(IDispatch)
    ['{F4277C95-CE5B-463D-8167-5662D9BCAA72}']
    function Get_Guid: WideString; safecall;
    function Get_Name: WideString; safecall;
    function Get_DeviceName: WideString; safecall;
    function Get_Status: tagNETCON_STATUS; safecall;
    function Get_MediaType: tagNETCON_MEDIATYPE; safecall;
    function Get_Characteristics: LongWord; safecall;
    property Guid: WideString read Get_Guid;
    property Name: WideString read Get_Name;
    property DeviceName: WideString read Get_DeviceName;
    property Status: tagNETCON_STATUS read Get_Status;
    property MediaType: tagNETCON_MEDIATYPE read Get_MediaType;
    property Characteristics: LongWord read Get_Characteristics;
  end;

// *********************************************************************//
// DispIntf:  INetConnectionPropsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F4277C95-CE5B-463D-8167-5662D9BCAA72}
// *********************************************************************//
  INetConnectionPropsDisp = dispinterface
    ['{F4277C95-CE5B-463D-8167-5662D9BCAA72}']
    property Guid: WideString readonly dispid 1;
    property Name: WideString readonly dispid 2;
    property DeviceName: WideString readonly dispid 3;
    property Status: tagNETCON_STATUS readonly dispid 4;
    property MediaType: tagNETCON_MEDIATYPE readonly dispid 5;
    property Characteristics: LongWord readonly dispid 6;
  end;

// *********************************************************************//
// The Class CoNetSharingManager provides a Create and CreateRemote method to          
// create instances of the default interface INetSharingManager exposed by              
// the CoClass NetSharingManager. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoNetSharingManager = class
    class function Create: INetSharingManager;
    class function CreateRemote(const MachineName: string): INetSharingManager;
  end;


// *********************************************************************//
// OLE Server Proxy class declaration
// Server Object    : TNetSharingManager
// Help String      : NetSharingManager Class
// Default Interface: INetSharingManager
// Def. Intf. DISP? : No
// Event   Interface: 
// TypeFlags        : (2) CanCreate
// *********************************************************************//
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  TNetSharingManagerProperties= class;
{$ENDIF}
  TNetSharingManager = class(TOleServer)
  private
    FIntf:        INetSharingManager;
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    FProps:       TNetSharingManagerProperties;
    function      GetServerProperties: TNetSharingManagerProperties;
{$ENDIF}
    function      GetDefaultInterface: INetSharingManager;
  protected
    procedure InitServerData; override;
    function Get_SharingInstalled: WordBool;
    function Get_EnumPublicConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPublicConnectionCollection;
    function Get_EnumPrivateConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPrivateConnectionCollection;
    function Get_INetSharingConfigurationForINetConnection(const pNetConnection: INetConnection): INetSharingConfiguration;
    function Get_EnumEveryConnection: INetSharingEveryConnectionCollection;
    function Get_NetConnectionProps(const pNetConnection: INetConnection): INetConnectionProps;
  public
    constructor Create(AOwner: TComponent); override;
    destructor  Destroy; override;
    procedure Connect; override;
    procedure ConnectTo(svrIntf: INetSharingManager);
    procedure Disconnect; override;
    property DefaultInterface: INetSharingManager read GetDefaultInterface;
    property SharingInstalled: WordBool read Get_SharingInstalled;
    property EnumPublicConnections[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPublicConnectionCollection read Get_EnumPublicConnections;
    property EnumPrivateConnections[Flags: tagSHARINGCONNECTION_ENUM_FLAGS]: INetSharingPrivateConnectionCollection read Get_EnumPrivateConnections;
    property INetSharingConfigurationForINetConnection[const pNetConnection: INetConnection]: INetSharingConfiguration read Get_INetSharingConfigurationForINetConnection;
    property EnumEveryConnection: INetSharingEveryConnectionCollection read Get_EnumEveryConnection;
    property NetConnectionProps[const pNetConnection: INetConnection]: INetConnectionProps read Get_NetConnectionProps;
  published
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
    property Server: TNetSharingManagerProperties read GetServerProperties;
{$ENDIF}
  end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
// *********************************************************************//
// OLE Server Properties Proxy Class
// Server Object    : TNetSharingManager
// (This object is used by the IDE's Property Inspector to allow editing
//  of the properties of this server)
// *********************************************************************//
 TNetSharingManagerProperties = class(TPersistent)
  private
    FServer:    TNetSharingManager;
    function    GetDefaultInterface: INetSharingManager;
    constructor Create(AServer: TNetSharingManager);
  protected
    function Get_SharingInstalled: WordBool;
    function Get_EnumPublicConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPublicConnectionCollection;
    function Get_EnumPrivateConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPrivateConnectionCollection;
    function Get_INetSharingConfigurationForINetConnection(const pNetConnection: INetConnection): INetSharingConfiguration;
    function Get_EnumEveryConnection: INetSharingEveryConnectionCollection;
    function Get_NetConnectionProps(const pNetConnection: INetConnection): INetConnectionProps;
  public
    property DefaultInterface: INetSharingManager read GetDefaultInterface;
  published
  end;
{$ENDIF}


procedure Register;

resourcestring
  dtlServerPage = 'ActiveX';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

class function CoNetSharingManager.Create: INetSharingManager;
begin
  Result := CreateComObject(CLASS_NetSharingManager) as INetSharingManager;
end;

class function CoNetSharingManager.CreateRemote(const MachineName: string): INetSharingManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NetSharingManager) as INetSharingManager;
end;

procedure TNetSharingManager.InitServerData;
const
  CServerData: TServerData = (
    ClassID:   '{5C63C1AD-3956-4FF8-8486-40034758315B}';
    IntfIID:   '{C08956B7-1CD3-11D1-B1C5-00805FC1270E}';
    EventIID:  '';
    LicenseKey: nil;
    Version: 500);
begin
  ServerData := @CServerData;
end;

procedure TNetSharingManager.Connect;
var
  punk: IUnknown;
begin
  if FIntf = nil then
  begin
    punk := GetServer;
    Fintf:= punk as INetSharingManager;
  end;
end;

procedure TNetSharingManager.ConnectTo(svrIntf: INetSharingManager);
begin
  Disconnect;
  FIntf := svrIntf;
end;

procedure TNetSharingManager.DisConnect;
begin
  if Fintf <> nil then
  begin
    FIntf := nil;
  end;
end;

function TNetSharingManager.GetDefaultInterface: INetSharingManager;
begin
  if FIntf = nil then
    Connect;
  Assert(FIntf <> nil, 'DefaultInterface is NULL. Component is not connected to Server. You must call ''Connect'' or ''ConnectTo'' before this operation');
  Result := FIntf;
end;

constructor TNetSharingManager.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps := TNetSharingManagerProperties.Create(Self);
{$ENDIF}
end;

destructor TNetSharingManager.Destroy;
begin
{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
  FProps.Free;
{$ENDIF}
  inherited Destroy;
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
function TNetSharingManager.GetServerProperties: TNetSharingManagerProperties;
begin
  Result := FProps;
end;
{$ENDIF}

function TNetSharingManager.Get_SharingInstalled: WordBool;
begin
    Result := DefaultInterface.SharingInstalled;
end;

function TNetSharingManager.Get_EnumPublicConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPublicConnectionCollection;
begin
    Result := DefaultInterface.EnumPublicConnections[Flags];
end;

function TNetSharingManager.Get_EnumPrivateConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPrivateConnectionCollection;
begin
    Result := DefaultInterface.EnumPrivateConnections[Flags];
end;

function TNetSharingManager.Get_INetSharingConfigurationForINetConnection(const pNetConnection: INetConnection): INetSharingConfiguration;
begin
    Result := DefaultInterface.INetSharingConfigurationForINetConnection[pNetConnection];
end;

function TNetSharingManager.Get_EnumEveryConnection: INetSharingEveryConnectionCollection;
begin
    Result := DefaultInterface.EnumEveryConnection;
end;

function TNetSharingManager.Get_NetConnectionProps(const pNetConnection: INetConnection): INetConnectionProps;
begin
    Result := DefaultInterface.NetConnectionProps[pNetConnection];
end;

{$IFDEF LIVE_SERVER_AT_DESIGN_TIME}
constructor TNetSharingManagerProperties.Create(AServer: TNetSharingManager);
begin
  inherited Create;
  FServer := AServer;
end;

function TNetSharingManagerProperties.GetDefaultInterface: INetSharingManager;
begin
  Result := FServer.DefaultInterface;
end;

function TNetSharingManagerProperties.Get_SharingInstalled: WordBool;
begin
    Result := DefaultInterface.SharingInstalled;
end;

function TNetSharingManagerProperties.Get_EnumPublicConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPublicConnectionCollection;
begin
    Result := DefaultInterface.EnumPublicConnections[Flags];
end;

function TNetSharingManagerProperties.Get_EnumPrivateConnections(Flags: tagSHARINGCONNECTION_ENUM_FLAGS): INetSharingPrivateConnectionCollection;
begin
    Result := DefaultInterface.EnumPrivateConnections[Flags];
end;

function TNetSharingManagerProperties.Get_INetSharingConfigurationForINetConnection(const pNetConnection: INetConnection): INetSharingConfiguration;
begin
    Result := DefaultInterface.INetSharingConfigurationForINetConnection[pNetConnection];
end;

function TNetSharingManagerProperties.Get_EnumEveryConnection: INetSharingEveryConnectionCollection;
begin
    Result := DefaultInterface.EnumEveryConnection;
end;

function TNetSharingManagerProperties.Get_NetConnectionProps(const pNetConnection: INetConnection): INetConnectionProps;
begin
    Result := DefaultInterface.NetConnectionProps[pNetConnection];
end;

{$ENDIF}

procedure Register;
begin
  RegisterComponents(dtlServerPage, [TNetSharingManager]);
end;

end.
