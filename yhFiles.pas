unit yhFiles;

interface

uses
  Windows, SysUtils, Classes, Forms, Graphics, ShellAPI;

  //拡張子をなくしたファイル名を取得
	function ExtractFileNameOnly(const FileName: string): string;

  //ファイル禁則文字が含まれているかどうか
  function IncludeErrorFileChar(const FileName: string): Boolean;

  //フォルダに存在しないファイル名を取得
  function NotExistFileName(const FileName: string; Extension: Boolean): string;

  //ファイルのバージョンの取得
  function GetFileVersion(const FileName: string): string;

  //OSの取得
  function OSPlatformInfo: string;
  // 空きメモリ容量
  function MemoryActiveInfo: string;

  // 物理メモリ容量
  function MemoryTotalInfo: string;

  // メモリ使用率
  function MemoryRateOfUse: string;

  //CPUの種類
  function GetCPUName: string;

  //CPU動作周波数を求める
  function GetCPUFrequency: string;

  //解像度を取得する処理
  function GetResolution: string;

  //暗号化
  function Encryption(const s:String;decode:Boolean):string;

  //フォームを常に手前に表示させる
  function StayOnTop(const hWnd: HWND): Boolean;

  //アプリがデスクトップのワークエリア内にあるか。無かったらエリア内に移動
  procedure OnWorkArea(Form: TForm);

type
  TFileInfo = class(TObject)
  private
    FFileName:TFileName;
    FProductVersion:string;
    FCompanyName:string;
    FOriginalFileName:string;
    FFileDescription:string;
    FFileVersion:string;
    FInternalName:string;
    FProductName:string;
    FVSFixedFileInfo:TVSFixedFileInfo;
    FSmallIcon:TBitmap;
    FLargeIcon:TBitmap;
    procedure SetFileName(Value:TFileName);
    procedure GetVersionInfo;
    function GetFVSFixedFileInfo:TVSFixedFileInfo;
    procedure GetIcon;
  public
    constructor Create;
    destructor Destroy;override;
    property VSFixedFileInfo:TVSFixedFileInfo read GetFVSFixedFileInfo;
    property SmallIcon:TBitmap read FSmallIcon;
    property LargeIcon:TBitmap read FLargeIcon;
    property FileName:TFileName read FFileName write SetFileName;
    property ProductVersion:string read FProductVersion;
    property CompanyName:string read FCompanyName;
    property OriginalFileName:string read FOriginalFileName;
    property FileDescription:string read FFileDescription;
    property FileVersion:string read FFileVersion;
    property InternalName:string read FInternalName;
    property ProductName:string read FProductName;
  end;
//使用方法は、オブジェクトを生成した後にFileNameプロパティにセットすること
//で各プロパティから情報を取得することが出来ます。
//
//var
//  FInfo:TFileInfo;
//begin
//  FInfo := TFileInfo.Create;
//  try
//    FInfo.FileName := Application.ExeName;
//    WriteLn('ファイルヴァージョンは' + FileVersion +'です');
//  finally
//    FInfo.Free;
//  end;
//end;


implementation

var
	ErrorFileChar: String = '\/:;*?"<>|';

procedure OnWorkArea(Form: TForm);
var
	WRect: TRect;
const
	DEF = 50;
begin
  SystemParametersInfo(SPI_GETWORKAREA, 0, @WRect, 0);

  if Form.Left > WRect.Right - Form.Width then Form.Left := WRect.Left + DEF;
  if Form.Left < WRect.Left then Form.Left := WRect.Left + DEF;
  if Form.Top < WRect.Top then Form.Top := WRect.Top + DEF;
  if Form.Top > WRect.Bottom - Form.Height then Form.Top := WRect.Top + DEF;

end;

function GetCPUFrequency: string;
var
  TickTime: DWORD;
  MHigh, MLow, NHigh, NLow: DWORD;
  Time1, Time2, CHigh, CLow, Shr32, Clock: Comp;
begin
  Shr32 := 65535;
  Shr32 := Shr32 * 65535;
  TickTime := GetTickCount;
  while TickTime = GetTickCount do begin end;
  asm
    DB 0FH
    DB 031H
    MOV MHigh,edx
    MOV MLow, eax
  end;
  while GetTickCount < (TickTime + 1000) do begin end;
  asm
    DB 0FH
    DB 031H
    MOV NHigh,edx
    MOV NLow, eax
  end;
  CHigh := MHigh;
  CLow := MLow;
  Time1 := CHigh * Shr32 + CLow;

  CHigh := NHigh;
  CLow := NLow;
  Time2 := CHigh * Shr32 + CLow;

  Clock := (Time2 - Time1) / 1000000;
  Result := FloatToStr(Clock) + 'MHz';

end;

function GetCPUName: string;
const
  {Whoops!  These constants are used by the GetSystemInfo function,
   but they are not defined in the Delphi source code, so we must do it ourselves}
  PROCESSOR_INTEL_386 = 386;
  PROCESSOR_INTEL_486 = 486;
  PROCESSOR_INTEL_PENTIUM = 586;
  PROCESSOR_MIPS_R4000 = 4000;
  PROCESSOR_ALPHA_21064 = 21064;

  PROCESSOR_ARCHITECTURE_INTEL = 0;
  PROCESSOR_ARCHITECTURE_MIPS = 1;
  PROCESSOR_ARCHITECTURE_ALPHA = 2;
  PROCESSOR_ARCHITECTURE_PPC  = 3;
  PROCESSOR_ARCHITECTURE_UNKNOWN = $FFFF;
var
  MySysInfo: TSystemInfo;   // holds the system information
  sArch,
  sType: string;
begin
  {retrieve information about the system}
  GetSystemInfo(MySysInfo);

  {display the system's processor architecture}
  case MySysInfo.wProcessorArchitecture of
    PROCESSOR_ARCHITECTURE_INTEL: begin
      {dislay the processor architecture}
      sArch := 'Intel Processor Architecture';

      {display the processor type}
      case MySysInfo.dwProcessorType of
        PROCESSOR_INTEL_386:     sType := ' 80386';
        PROCESSOR_INTEL_486:     sType := ' 80486';
        PROCESSOR_INTEL_PENTIUM: sType := ' Pentium';
        else sType := '';
      end;
    end;
    PROCESSOR_ARCHITECTURE_MIPS:
      sArch := 'MIPS Processor Architecture';
    PROCESSOR_ARCHITECTURE_ALPHA:
      sArch := 'DEC ALPHA Processor Architecture';
    PROCESSOR_ARCHITECTURE_PPC:
      sArch := 'PPC Processor Architecture';
    PROCESSOR_ARCHITECTURE_UNKNOWN:
      sArch := 'Unknown Processor Architecture';
  end;
  Result := sArch + sType;
end;

function GetResolution: string;
var
  DskhWnd,
  nhDc,
  nWidth,
  nHeight ,
  Bit : Integer;
begin
  //デスクトップのハンドルを取得
  DskhWnd := GetDesktopWindow;
  //デスクトップのデバイスコンテキストハンドルを取得
  nhDc := GetDC(DskhWnd);
  //画面の横幅を取得
  nWidth := GetDeviceCaps(nhDc, HORZRES);
  //画面の縦幅を取得
  nHeight := GetDeviceCaps(nhDc, VERTRES);
  //ピクセル当たりのビット数を取得
  Bit := GetDeviceCaps(nhDc, BITSPIXEL);

  Result := Format('%d×%d (%d ビット)', [nWidth, nHeight, Bit]);
end;

function StayOnTop(const hWnd: HWND): Boolean;
begin
  Result := SetWindowPos(hWnd, HWND_TOPMOST, 0, 0, 0, 0,
                             SWP_NOMOVE or SWP_NOSIZE);
end;

function Encryption(const s:String;decode:Boolean):string;
var i,n,m,siz,r:Integer;
const k='極秘';
begin
  RandSeed:=(ord(k[3])*$10000+ord(k[1])*$100+ord(k[2]));
  Result:='';
  siz:=Length(s);
  r:=random($FFFF);
  if decode then siz:=siz div 2;
  for i:=1 to siz do begin
    if decode then n:= StrToInt('$'+copy(s,i*2-1,2))
    else n:= ord(s[i]);
    m:= ( n xor ord(k[1+(i mod Length(k))]) xor random(256)) xor (r and $FF);
    if decode then r:=(r*331 + m) else r:=(r*331 +n) ;
    if decode then Result:=Result+Char(m)
    else Result:=Result+IntToHex(m,2);
  end;
end;

function ExtractFileNameOnly(const FileName: string): string;
var
	Ext: string;
  fName: string;
begin
  Ext := ExtractFileExt(FileName);
  fName := ExtractFileName(FileName);
  Result := Copy(fName, 1, Length(fName) - Length(Ext));
end;

function IncludeErrorFileChar(const FileName: string): Boolean;
var
	i: Integer;
begin
  Result := False;
  for i := 1 to Length(FileName) do begin
    if AnsiPos(FileName[i], ErrorFileChar) <> 0 then begin
      Result := True;
      Break;
    end;
  end;
end;

function NotExistFileName(const FileName: string; Extension: Boolean): string;
var
	Dir, Name, Ext, nName: string;
  i: Integer;
begin
  if ExtractFileName(FileName) = FileName then
  	Dir := ExtractFilePath(Application.ExeName)
  else
  	Dir := ExtractFilePath(FileName);
  Name := ExtractFileNameOnly(FileName);
  Ext := ExtractFileExt(FileName);

  if FileExists(FileName) then begin
    i := 2;
    nName := Name;
    while FileExists(Dir + nName + Ext) do begin
      nName := Name + '(' + IntToStr(i) + ')';
      if Extension then
        Result := nName + Ext
      else
        Result := nName;
      Inc(i);
    end;
  end else begin
  	if Extension then
      Result := Name + Ext
    else
      Result := Name;
	end;
end;

function GetFileVersion(const FileName: string): string;
var
  FileInfo: TFileInfo;
begin
  if FileName = '' then Exit;
  FileInfo := TFileInfo.Create;
  try
    FileInfo.FileName := FileName;
    Result := FileInfo.FileVersion;
  finally
    FileInfo.Free;
  end;
end;

//OSの取得
function OSPlatformInfo: String;
var
  OSver : TOSVERSIONINFO;
begin
  OSver.dwOSVersionInfoSize  :=  SizeOf(OSver);
  GetVersionEx(OSver);
  case OSver.dwPlatformId of
    VER_PLATFORM_WIN32s: Result := 'Windows 3.1';  //VER_PLATFORM_WIN32s 		Win32s on Windows 3.1.
    VER_PLATFORM_WIN32_WINDOWS: //VER_PLATFORM_WIN32_WINDOWS 	Windows 95, Windows 98, or Windows Me.
    begin
      case OSver.dwMinorVersion of
        0{95}: Result := 'Windows 95';
        10{98}: Result := 'Windows 98';
        90{Me}: Result := 'Windows Me';
      end;
    end;
    VER_PLATFORM_WIN32_NT://VER_PLATFORM_WIN32_NT Windows NT 3.51, Windows NT 4.0, Windows 2000, Windows XP, or Windows .NET Server.
    begin
      case OSver.dwMajorVersion of
        3{3.51}: Result := 'Windows NT 3.51';
        4{4.0}: Result := 'Windows NT 4.0';
        5{2000, XP, .NET Server}:
        begin
          case OSver.dwMinorVersion of
            0{2000}: Result := 'Windows 2000';
            1{XP or .NET Server}: Result := 'Windows XP';
          end;

        end;
      end;

    end;
  else Result := 'Windows??';
  end;
end;

// 空きメモリ容量
function MemoryActiveInfo: String;
var
  MemStatus : TMemoryStatus;
begin
  MemStatus.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MemStatus);

  Result := FormatFloat('#,##0KB',Round(MemStatus.dwAvailPhys/1024));
end;

// 物理メモリ容量
function MemoryTotalInfo: String;
var
  MemStatus : TMemoryStatus;
begin
  MemStatus.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MemStatus);

  Result := FormatFloat('#,##0KB',Round(MemStatus.dwTotalPhys/1024));
end;

// メモリ使用率
function MemoryRateOfUse: String;
var
  MemStatus : TMemoryStatus;
begin
  MemStatus.dwLength := SizeOf(TMemoryStatus);
  GlobalMemoryStatus(MemStatus);

  Result := IntToStr(MemStatus.dwMemoryLoad);
end;

//TFileInfo
constructor TFileInfo.Create;
begin
 inherited Create;
 FFileName:='';
 FProductVersion:= '';
 FCompanyName:= '';
 FOriginalFileName:= '';
 FFileDescription:= '';
 FFileVersion:= '';
 FInternalName:= '';
 FProductName:= '';
 FLargeIcon := TBitmap.Create;
 FSmallIcon := TBitmap.Create;
 FLargeIcon.Height := 32;
 FLargeIcon.Width := 32;
 FSmallIcon.Height := 16;
 FSmallIcon.Width := 16;
end;

destructor TFileInfo.Destroy;
begin
 FLargeIcon.Free;
 FSmallIcon.Free;
 inherited Destroy;
end;

procedure TFileInfo.GetVersionInfo;
var
 InfoSize:DWORD;
 //Wnd:HWND;
 SFI:string;
 Buf,Trans,Value:Pointer;
 VSF:PVSFixedFileInfo;
begin
 if FFileName = '' then Exit;
 FProductVersion:= '';
 FCompanyName:= '';
 FOriginalFileName:= '';
 FFileDescription:= '';
 FFileVersion:= '';
 FInternalName:= '';
 FProductName:= '';
 InfoSize := GetFileVersionInfoSize(PChar(FFileName),InfoSize);
 if InfoSize <> 0 then
 begin
  GetMem(Buf,InfoSize);
  try
   if GetFileVersionInfo(PChar(FFileName),0,InfoSize,Buf) then
   begin
    if VerQueryValue(Buf,'\',Pointer(VSF),InfoSize) then
    begin
     FVSFixedFileInfo := VSF^;
    end;
    if VerQueryValue(Buf,'\VarFileInfo\Translation',Trans,InfoSize) then
    begin
     SFI := Format('\StringFileInfo\%4.4x%4.4x\ProductVersion',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FProductVersion := PChar(Value);
     end else
     begin
      FProductVersion := 'UnKnown';
     end;
     SFI := Format('\StringFileInfo\%4.4x%4.4x\ProductName',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FProductName := PChar(Value);
     end else
     begin
      FProductName := 'UnKnown';
     end;
     SFI := Format('\StringFileInfo\%4.4x%4.4x\CompanyName',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FCompanyName := PChar(Value);
     end else
     begin
      FCompanyName := 'UnKnown';
     end;
     SFI := Format('\StringFileInfo\%4.4x%4.4x\OriginalFilename',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FOriginalFileName := PChar(Value);
     end else
     begin
      FOriginalFileName := 'UnKnown';
     end;
     SFI := Format('\StringFileInfo\%4.4x%4.4x\FileDescription',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FFileDescription := PChar(Value);
     end else
     begin
      FFileDescription := 'UnKnown';
     end;
     SFI := Format('\StringFileInfo\%4.4x%4.4x\FileVersion',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FFileVersion := PChar(Value);
     end else
     begin
      FFileVersion := 'UnKnown';
     end;
     SFI := Format('\StringFileInfo\%4.4x%4.4x\InternalName',
            [LOWORD(DWORD(Trans^)),HIWORD(DWORD(Trans^))]);
     if VerQueryValue(Buf,PChar(SFI),Value,InfoSize) then
     begin
      FInternalName := PChar(Value);
     end else
     begin
      FInternalName := 'UnKnown';
     end;
    end;
   end;
  finally
   FreeMem(Buf);
  end;
 end;
end;

procedure TFileInfo.GetIcon;
var
 IconHandle:HICON;
 SHFileInfo:TSHFileInfo;
 Temp:TPicture;
begin
 IconHandle := 0;
 Temp := TPicture.Create;
 try
//SMALL
  Temp.Bitmap.Height := FSmallIcon.Height;
  Temp.Bitmap.Width := FSmallIcon.Width;
  FSmallIcon.Canvas.Draw(0,0,Temp.Graphic);
  SHGetFileInfo(PChar(FFileName),0,
                SHFileInfo,SizeOf(SHFileInfo),
                SHGFI_ICON or SHGFI_SMALLICON);
  IconHandle := SHFileInfo.hIcon;
  DrawIconEx(FSmallIcon.Canvas.Handle,0,0,
             IconHandle,16,16,0,0, DI_NORMAL);
//LARGE
  Temp.Bitmap.Height := FLargeIcon.Height;
  Temp.Bitmap.Width := FLargeIcon.Width;
  FLargeIcon.Canvas.Draw(0,0,Temp.Graphic);
  SHGetFileInfo(PChar(FFileName),0,
                SHFileInfo,SizeOf(SHFileInfo),
                SHGFI_ICON or SHGFI_LARGEICON);
  IconHandle := SHFileInfo.hIcon;
  DrawIconEx(FLargeIcon.Canvas.Handle,0,0,
             IconHandle,32,32,0,0,DI_NORMAL);
 finally
  DestroyIcon(IconHandle);
  Temp.Free;
 end;
end;

procedure TFileInfo.SetFileName(Value:TFileName);
begin
 if Value <> FFileName then
 begin
  FFileName := Value;
  GetVersionInfo;
  GetIcon;
 end;
end;

function TFileInfo.GetFVSFixedFileInfo;
begin
 if FFileName <> '' then
  Result := FVSFixedFileInfo;
end;
end.
