unit acRW;
 
interface
 
uses
  Classes,  SysUtils;
 
procedure AppendStringToFile (FileName :String; S :String);
// ���������� ������ s (� ������ Delphi) � ����� FileName
 
function AppendedStringFromFile (FileName :String) :String;
// ���������� ������ ��������� � ����� FileName ���������� AppendStringToFile
 
implementation
const
  MySignature = 'KEY:';
 
// ��������� ����� � ����� ��������:
//   1  <�������� ����>
//   2  <��������� ������� ����� �������>
//   3  <�������>
//   4  <������� � ����� � ������� ���������� ���� ��������� (4 ����� - Longword)>
 
procedure AppendStringToFile (FileName :String; S :String);
// ���������� ������ s (� ������ Delphi) � ����� FileName
var
  MySignaturePosition :Longword;
  MySignatureBuf      :String;
begin
  with  TFileStream.Create(FileName,fmOpenReadWrite)  do try // �������� ������ �� ������ � ������
    try
      // �������� ������� ����� ���������
      // ���������������� �� 4-� ������� ����� ���������, � ��������� ���
      if  Size < SizeOf(MySignaturePosition)  then
        Abort;  // � ����� ��� ������������ ����� ����, �.�. ���� �� ����� ����� �������
      Seek(-SizeOf(MySignaturePosition),soFromEnd);
      ReadBuffer(MySignaturePosition,SizeOf(MySignaturePosition));
      if  MySignaturePosition+Longword(Length(MySignature))+SizeOf(MySignaturePosition) > Size  then
        Abort;  // ������� ��������� �� ��������� �����, �.�. ���� �� ����� ����� �������
      // ���������������� �� �������������� ���������
      Position := MySignaturePosition;
      // ��������� ��������� � MySignatureBuf
      // ��������� String - ��� Longstring, �� ������� ���� ���������� ����������� ������ MySignatureBuf:
      SetLength(MySignatureBuf,Length(MySignature));
      ReadBuffer(MySignatureBuf[1],Length(MySignature));
      // ������ �������� ��� ����������� �������� ����� ������������� �������� ����������
      if  MySignatureBuf <> MySignature  then
        Abort;  // ����������� �������� �� ���������, �.�. ���� �� ����� ����� �������
      // ������ �� ����� ����� ��� ���� ����� ���� ���������
    except on eAbort  do begin
      // ���� �� ����� ����� �������, ������ ���� ������� �������� ���������
      MySignaturePosition := Size;     // ������� ��������� � �����
      Position := MySignaturePosition;
      WriteBuffer(MySignature[1],Length(MySignature));  // ������ ���������
      // ������ ���� ����� ���� ���������
      end;
    end;
    // ����� ��������������� ����� �� ����������, �.�. ����� ������ ������� � �
    // MySignaturePosition ������� ��������� ������� ���� ����� �������� �����
    // �������.
    // ������� s
    WriteBuffer(s[1],Length(s));
    // ������� MySignaturePosition
    WriteBuffer(MySignaturePosition,SizeOf(MySignaturePosition));
    // ��������� ����� ������ �����
    Size := Position;
    // ���
  finally
    Free;  // �������� ������
  end;
end;
 
function AppendedStringFromFile (FileName :String) :String;
// ���������� ������ ��������� � ����� FileName ���������� AppendStringToFile
var
  MySignaturePosition :Longword;
  MySignatureBuf      :String;
begin
  with  TFileStream.Create(FileName,fmOpenRead)  do try // �������� ������ �� ������
    try
      // �������� ������� ����� ���������
      // ���������������� �� 4-� ������� ����� ���������, � ��������� ���
      if  Size < SizeOf(MySignaturePosition)  then
        Abort;  // � ����� ��� ������������ ����� ����, �.�. ���� �� ����� ����� �������
      Seek(-SizeOf(MySignaturePosition),soFromEnd);
      ReadBuffer(MySignaturePosition,SizeOf(MySignaturePosition));
      if  MySignaturePosition+Longword(Length(MySignature))+SizeOf(MySignaturePosition) > Size  then
        Abort;  // ������� ��������� �� ��������� �����, �.�. ���� �� ����� ����� �������
      // ���������������� �� �������������� ���������
      Position := MySignaturePosition;
      // ��������� ��������� � MySignatureBuf
      // ��������� String - ��� Longstring, �� ������� ���� ���������� �� ����������� ������:
      SetLength(MySignatureBuf,Length(MySignature));
      ReadBuffer(MySignatureBuf[1],Length(MySignature));
      // ������ �������� ��� ����������� �������� ����� ������������� �������� ����������
      if  MySignatureBuf <> MySignature  then
        Abort;  // ����������� �������� �� ���������, �.�. ���� �� ����� ����� �������
      // ������ �� ����� ����� ��� ���� ����� ���� ���������, ������� ����� ������ ������
      // ������ �� ������ ����� Size-MySignaturePosition-Length(MySignature)-SizeOf(MySignaturePosition)
      // ����������� ������ ���� � �������������� ����� ���������������� ������� (Longstring)
      SetLength(Result,Size-MySignaturePosition-Length(MySignature)-SizeOf(MySignaturePosition));
      if  Length(Result) > 0  then  // ������� �� ������ ������
        ReadBuffer(Result[1],Length(Result));
      // ���.
    except on eAbort  do
      // ���� �� ����� ����� �������, ������ ������ ������ ������ ������
      Result := '';
    end;
  finally
    Free;  // �������� ������
  end;
end;
end.