program genmac;

uses
  Forms,
  Windows,
  sts in 'sts.pas' {macx},
  key in 'key.pas' {keys};

{$R *.res}

var
  HM: THandle;
function Check: boolean;
begin
  HM := OpenMutex(MUTEX_ALL_ACCESS, false, 'genmac');
  Result := (HM <> 0);
  if HM = 0 then HM := CreateMutex(nil, false, 'genmac');
end;

begin
  if Check then Exit;
  Application.Initialize;
  Application.CreateForm(Tmacx, macx);
  Application.CreateForm(Tkeys, keys);
  Application.ShowMainForm:=False;
  Application.Run;
end.
