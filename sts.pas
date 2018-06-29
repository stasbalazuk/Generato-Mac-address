{
HELP
var
NetSharingManager: INetSharingManager;
NetSharingEveryConnectionCollection: INetSharingEveryConnectionCollection;
dEnum: IEnumVariant;
shcfg: INetSharingConfiguration;
VarArr: OleVariant;
Value: LongWord;
begin
NetSharingManager := CoNetSharingManager.Create;
try
NetSharingEveryConnectionCollection := NetSharingManager.EnumEveryConnection;
dEnum := NetSharingEveryConnectionCollection._NewEnum as IEnumVariant;
while (dEnum.Next(1, VarArr, Value) = S_OK) do
begin
shcfg := NetSharingManager.INetSharingConfigurationForINetConnection[IUnknown(varArr) as INetConnection];
if shcfg.InternetFirewallEnabled then
ShowMessage('yes')
else
ShowMessage('no');
end;
FreeMemory(@dEnum);
varArr := unassigned;
finally
//VarArr := nil;
dEnum := nil;
shcfg := nil;
NetSharingEveryConnectionCollection := nil;
NetSharingManager := nil;
end;
}
unit sts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleServer, NETCONLib_TLB, XPMan, COMObj, activeX, registry, StdCtrls, Mask,
  CoolTrayIcon, Menus, Buttons;

const
  MacLocation ='SYSTEM\CurrentControlSet\Control\Class\{4D36E972-E325-11CE-BFC1-08002bE10318}';

type
  Tmacx = class(TForm)
    rb1: TRadioButton;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl1: TLabel;
    Nics: TComboBox;
    MacAddress: TMaskEdit;
    btn1: TButton;
    TrayIcon: TCoolTrayIcon;
    pm1: TPopupMenu;
    N0D1: TMenuItem;
    function HyphenateMac(const sMac: string):string;
    procedure GetConnectionList(Strings,IdList: TStrings);
    function GetMacAddress(CardID: string): String;
    procedure FormCreate(Sender: TObject);
    procedure NicsChange(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure MacAddressChange(Sender: TObject);
    function isValidMac(const sMac: string):boolean;
    procedure ResetNIC(const aConnection: string);
    function RandomMac:string;
    procedure SetMacAddress(const CardID, NewMac: string);
    procedure TrayIconClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N0D1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    GUIDList: TStringList;
  public
    SessionEnding: Boolean;
    procedure WMQueryEndSession(var Message: TMessage); message WM_QUERYENDSESSION;
  end;

var
  macx: Tmacx;

implementation

uses key;

{$R *.dfm}

//Удачно выйти из Винды
procedure Tmacx.WMQueryEndSession(var Message: TMessage);
begin
  SessionEnding := True;
  Message.Result := 1;
  Application.Terminate;
end;

function Tmacx.HyphenateMac(const sMac: string): string;
var
  i: integer;
begin
  for i := 0 to 5 do
    Result := Result+ Copy( sMac, (i*2)+1,2 )+'-';
    Result := copy(Result,1,17);
end;

function Tmacx.GetMacAddress(CardID: string): String;
var
  Reg: TRegistry;
  KeyValues: TSTringList;
  i: integer;
  CardInstanceID,CardAddress: string;
begin
  Result := '';
  Reg := TRegistry.Create;
  KeyValues := TStringList.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if Reg.OpenKey(MacLocation,false) then
    begin
      Reg.GetKeyNames(KeyValues);
      Reg.CloseKey;
      for i := 0 to KeyValues.Count-1 do
      if reg.OpenKey(MacLocation+'\'+KeyValues[i],false) then
      begin
        CardInstanceID := Reg.ReadString('NetCfgInstanceId');
        CardAddress := Reg.ReadString('NetworkAddress');
        Reg.CloseKey;
        if CardInstanceID = CardId then
        begin
          if CardAddress='' then CardAddress := 'Hardware';
          Result := CardAddress;
          break;
        end;
      end;
    end;
  finally
    Reg.Free;
    KeyValues.Free;
  end;
end;

procedure Tmacx.GetConnectionList(Strings,IdList: TStrings);
var
  NetSharingManager: INetSharingManager;
  NetSharingEveryConnectionCollection: INetSharingEveryConnectionCollection;
  pEnum: IEnumVariant;
  vNetCon: OleVARIANT;
  dwRetrieved: Cardinal;
  pUser: NETCONLib_TLB.PUserType1;
  NetCon : INetConnection;
begin
  Strings.Clear;
  IdList.Clear;
  NetSharingManager := CoNetSharingManager.Create;
  try
    NetSharingEveryConnectionCollection := NetSharingManager.EnumEveryConnection;
    pEnum := ( NetSharingManager.EnumEveryConnection._NewEnum as IEnumVariant);
  while (pEnum.Next(1, vNetCon, dwRetrieved) = S_OK) do begin
        (IUnknown(vNetCon) as INetConnection).GetProperties(pUser);
         NetCon := (IUnknown(vNetCon) as INetConnection);
     if (pUser.Status in [NCS_CONNECTED,NCS_CONNECTING])//remove if you want disabled NIC cards also
     and (pUser.MediaType in [NCM_LAN,NCM_SHAREDACCESSHOST_LAN,NCM_ISDN] )
     and (GetMacAddress(GuidToString(pUser.guidId))<>'' ) then
     begin
       Strings.Add(pUser.pszwName );
       IdList.Add(GuidToString(pUser.guidId));
     end;
  end;
  finally
    pEnum := nil;
    NetSharingEveryConnectionCollection := nil;
    NetSharingManager := nil;
  end;
end;

procedure Tmacx.FormCreate(Sender: TObject);
begin
  ActiveX.CoInitialize(nil);
  GUIDList := TStringList.Create;
  GetConnectionList(Nics.Items,GUIdList);
  if Nics.Items.Count = 0 then
  begin
    ShowMessage( 'Нет активных сетевых подключений!' );
    Application.Terminate;
  end;
  Nics.ItemIndex := 0;
  Nics.OnChange := NicsChange;
  NicsChange(Nics);
  randomize;
  rb1.Checked:=True;
  btn1.Enabled := True;
  TrayIcon.IconVisible := True;
end;

procedure Tmacx.NicsChange(Sender: TObject);
var
  sMac : string;
begin
  sMac := GetMacAddress(GUidList[Nics.itemIndex ] );
  if UpperCase(sMac)<>'HARDWARE' then
     MacAddress.Text := HyphenateMac(sMac)
  else
    MacAddress.Text := '';
    rb1.Checked := (UpperCase(sMac)<>'HARDWARE');
    MacAddress.Enabled := rb1.Checked;
    MacAddress.Text := HyphenateMac(RandomMac);
end;

procedure Tmacx.SetMacAddress(const CardID, NewMac: string);
var
  Reg: TRegistry;
  KeyValues: TSTringList;
  i: integer;
  s: string;
begin
  Reg := TRegistry.Create;
  KeyValues := TStringList.Create;
  try
    Reg.RootKey:=HKEY_LOCAL_MACHINE;
    if Reg.OpenKey(MacLocation,false) then
    begin
      Reg.GetKeyNames(KeyValues);
      Reg.CloseKey;
      for i := 0 to KeyValues.Count-1 do
      if reg.OpenKey(MacLocation+'\'+KeyValues[i],false) then
      begin
        s := Reg.ReadString('NetCfgInstanceId');
        if s = CardId then
        begin
          if NewMac='' then
             reg.DeleteValue('NetWorkAddress')
          else
            reg.WriteString('NetWorkAddress',NewMac);
            Reg.CloseKey;
            macx.btn1.Enabled := True;
            macx.MacAddress.Enabled := True;
            break;
        end;
        Reg.CloseKey;
      end;
    end;
  finally
    Reg.Free;
    KeyValues.Free;
  end;
end;

procedure Tmacx.btn1Click(Sender: TObject);
begin
     btn1.Enabled := False;
     MacAddress.Text := HyphenateMac(RandomMac);
     Sleep(3000);
  if rb1.Checked then
     SetMacAddress( GUidList[Nics.itemIndex ], StringReplace( MacAddress.Text,'-','',[rfReplaceAll]) )
  else
    SetMacAddress( GUidList[Nics.itemIndex ], '' );
    ResetNIC( Nics.Text );
end;

function Tmacx.isValidMac(const sMac: string): boolean;
var
  s: string;
  i: integer;
begin
  s := StringReplace(sMac,'-','',[rfReplaceAll]);
  Result := (Length(s)=12) and (s<>'000000000000');
  for i := 1 to 12 do
  if not (s[i] in [#48..#57,#65..#70]) then
  begin
    Result := false;
  end;
end;

procedure Tmacx.ResetNIC(const aConnection: string);
var
  NetSharingManager: INetSharingManager;
  NetSharingEveryConnectionCollection: INetSharingEveryConnectionCollection;
  pEnum: IEnumVariant;
  vNetCon: OleVARIANT;
  dwRetrieved: Cardinal;
  pUser: NETCONLib_TLB.PUserType1;
begin
  enabled := false;
  NetSharingManager := CoNetSharingManager.Create;
  try
    NetSharingEveryConnectionCollection := NetSharingManager.EnumEveryConnection;
    pEnum := ( NetSharingManager.EnumEveryConnection._NewEnum as IEnumVariant);
    while (pEnum.Next(1, vNetCon, dwRetrieved) = S_OK) do
    begin
       (IUnknown(vNetCon) as INetConnection).GetProperties(pUser);
       if pUser.pszwName = aConnection then
       begin
         lbl2.Caption := 'Отключаем сетевое подключения ...';
         lbl2.Update;
         (IUnknown(vNetCon) as INetConnection).Disconnect;
         lbl2.Caption := 'Подключаем сетевое подкючения ...';
         lbl2.Update;
         (IUnknown(vNetCon) as INetConnection).Connect;
         sleep(2000);
         break;
       end;
    end;
  finally
    enabled := true;
    lbl2.Caption := 'Сетевое подключения:';
    pEnum := nil;
    NetSharingEveryConnectionCollection := nil;
    NetSharingManager := nil;
  end;
end;

function Tmacx.RandomMac: string;
var
  i: integer;
begin
  Result := '00';
  for i := 1 to 5 do
    Result := Result+IntToHex( Random(256),2);
end;

procedure Tmacx.MacAddressChange(Sender: TObject);
var
  sMac : string;
begin
  sMac := GetMacAddress(GUidList[Nics.itemIndex ] );
  btn1.Enabled := IsValidMac(MacAddress.Text) and
       (StringReplace(MacAddress.Text,'-','',[rfReplaceAll])<>sMac );
  btn1.Enabled := False;
  MacAddress.Enabled := False;
  Sleep(3000);
end;

procedure Tmacx.TrayIconClick(Sender: TObject);
begin
 if not FileExists(ExtractFilePath(ParamStr(0))+'lic.lic') then
  begin
    keys.ShowModal;
  end;
  macx.Show;
  TrayIcon.IconVisible := False;
end;

procedure Tmacx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
    TrayIcon.IconVisible := False;
    CanClose := SessionEnding;
  if not CanClose then
  begin
    TrayIcon.HideMainForm;
    TrayIcon.IconVisible := True;
  end;
end;

procedure Tmacx.N0D1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure Tmacx.FormActivate(Sender: TObject);
var
  sMac: string;
begin
  //Определяем ваш мас адрес
  sMac := GetMacAddress(GUidList[Nics.itemIndex ]);
  if UpperCase(sMac)<>'HARDWARE' then
     MacAddress.Text := HyphenateMac(sMac)
  else MacAddress.Text := HyphenateMac(RandomMac);
       btn1.Enabled := True;
end;

end.
