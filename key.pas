unit key;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DCPcrypt2, DCPblockciphers, DCPrijndael,
  DCPsha512;

type
  Tkeys = class(TForm)
    EdtCertValidToS1: TEdit;
    btn1: TButton;
    tmr1: TTimer;
    procedure btn1Click(Sender: TObject);
    procedure EdtCertValidToS1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  keys: Tkeys;
  MyStream :TFilestream;
  SerialNum,dtyp:DWORD;
  sn,crc,ds:string;
  KeyRelease:string = 'DJFDKSFghjyg;KH9bn6CRTXCx4hUGLB.8.nkVTJ6FJfjylk7gl7GLUHm'+
                      'HG7gnkBk8jhKkKJHK87HkjkFGF6PCbV9KaK81WWYgP[CR[yjILWv2_SBE]AsLEz_8sBZ3LV5N'+
                      'Go0NLL1om4XbALjhgkk7sda823r23;d923NrUdkzPp5DkJ2_8JvYmWFnLR3CRxyfswsto'+
                      'HG7gnkBk8jhKkKJHK87HkjkFGF6PCbV9KaK8UTJ6FJfjylk7gl7GLUHmLR3CRxyfswsto'+
                      'cvnkscv78h2lk8HHKhlkjdfvsd;vlkvsd0vvds;ldvhyB[NXzl5y5Z';


implementation

{$R *.dfm}

uses acRW, clipbrd, sts;

//Узнать номер диска
function GetHDDSerialNumber(ADisk: char): String;
var
  SerialNum           : dword;
  VolumeName, FSName  : array [0..255] of char;
  MaximumFNameLength,
  FileSystemFlags     : dword;
begin
   Result := '';
   if GetVolumeInformation( PChar( ADisk + ':\' ),
                            VolumeName, SizeOf( VolumeName ),
                            @SerialNum,
                            MaximumFNameLength,
                            FileSystemFlags,
                            FSName, SizeOf( FSName ) ) then
   Result := Format( '%.8x', [SerialNum] );
end;

//Зашифрование/расшифрование файла:
function EncryptFile(Source, Dest, Password: string): Boolean;
var
  DCP_rijndael1: TDCP_rijndael;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rijndael1 := TDCP_rijndael.Create(nil);
    DCP_rijndael1.InitStr(Password, TDCP_sha512);
    DCP_rijndael1.EncryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rijndael1.Burn;
    DCP_rijndael1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

function DecryptFile(Source, Dest, Password: string): Boolean;
var
  DCP_rijndael1: TDCP_rijndael;
  SourceStream, DestStream: TFileStream;
begin
  Result := True;
  try
    SourceStream := TFileStream.Create(Source, fmOpenRead);
    DestStream := TFileStream.Create(Dest, fmCreate);
    DCP_rijndael1 := TDCP_rijndael.Create(nil);
    DCP_rijndael1.InitStr(Password, TDCP_sha512);
    DCP_rijndael1.DecryptStream(SourceStream, DestStream, SourceStream.Size);
    DCP_rijndael1.Burn;
    DCP_rijndael1.Free;
    DestStream.Free;
    SourceStream.Free;
  except
    Result := False;
  end;
end;

//Для зашифрования строки
function EncryptString(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // создаём объект
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // инициализируем
  Result := DCP_rijndael1.EncryptString(Source); // шифруем
  DCP_rijndael1.Burn;                            // стираем инфо о ключе
  DCP_rijndael1.Free;                            // уничтожаем объект
end;

//Для расшифрования строки
function DecryptString(Source, Password: string): string;
var
  DCP_rijndael1: TDCP_rijndael;
begin
  DCP_rijndael1 := TDCP_rijndael.Create(nil);   // создаём объект
  DCP_rijndael1.InitStr(Password, TDCP_sha512);    // инициализируем
  Result := DCP_rijndael1.DecryptString(Source); // дешифруем
  DCP_rijndael1.Burn;                            // стираем инфо о ключе
  DCP_rijndael1.Free;                            // уничтожаем объект
end;

procedure Tkeys.btn1Click(Sender: TObject);
var
 i : integer;
 fL : TStringList;
 k: TStringList;
 a,b:DWORD;
 Buffer :Array[0..255]of char;
begin
  //========================================
   ExpandEnvironmentStrings(PChar('%systemdrive%'),Buffer,SizeOf(Buffer));
   ds:=Buffer;
   ds:=GetHDDSerialNumber(ds[1]);
   dtyp:=GetDriveType('c:/');
   dtyp := DRIVE_REMOVABLE;
   GetVolumeInformation('c:/',Buffer,sizeof(Buffer),@SerialNum,a,b,nil,0);
   sn:=IntToStr(SerialNum);
  //========================================
   crc:=sn+'-'+ds;
  //========================================
  if EdtCertValidToS1.Text = crc then
   begin
    fL := TStringList.Create;
   try
    fL.Delimiter := '-';
    fL.DelimitedText := EdtCertValidToS1.Text;
    for i := 0 to fl.Count - 1 do
     begin
       sn:=fL[i];
       ds:=fL[i+1];
       Break;
     end;
   finally
    fL.Free
   end;
   if crc <> EdtCertValidToS1.Text then Application.Terminate;
   if FileExists(ExtractFilePath(ParamStr(0))+'lic.lic') then
    begin
      crc:=AppendedStringFromFile(ExtractFilePath(ParamStr(0))+'lic.lic');
      crc:=DecryptString(crc,KeyRelease);
      macx.grp1.Caption:=crc;
      keys.Close;
    end else
    begin
     //создание объекта для записи в файл drive
     k:= TStringList.Create;
     //запись в файл
     k.SaveToFile(ExtractFilePath(ParamStr(0))+'lic.lic');
     k.Free;
     crc:=sn+'-'+ds;
     macx.grp1.Caption:='lic: '+crc;
     crc:=EncryptString(crc,KeyRelease);
    //запись в файл
     AppendStringToFile(ExtractFilePath(ParamStr(0))+'lic.lic',crc);
     macx.Show;
     keys.Close;
    end;
   end else Application.Terminate;
end;

procedure Tkeys.EdtCertValidToS1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure Tkeys.FormCreate(Sender: TObject);
var
  crc: string;
begin
  if FileExists(ExtractFilePath(ParamStr(0))+'lic.lic') then
   begin
     crc:=AppendedStringFromFile(ExtractFilePath(ParamStr(0))+'lic.lic');
     crc:=DecryptString(crc,KeyRelease);
     macx.grp1.Caption:='lic: '+crc;
     MyStream := TFilestream.Create(ExtractFilePath(ParamStr(0))+'lic.lic',fmOpenRead or fmShareExclusive);
     macx.Show;
   end else close;
end;

end.
