unit BugReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Clipbrd, MAIN, ComCtrls, ShellAPI, yhFiles;

type
  TBugReportForm = class(TForm)
    BugLabel: TLabel;
    BugMemo: TMemo;
    WebPageLabel: TLabel;
    CloseButton: TButton;
    CopyButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CopyButtonClick(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure WebPageLabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure WebPageLabelMouseLeave(Sender: TObject);
    procedure WebPageLabelClick(Sender: TObject);
  private
    { Private 宣言 }
//    function OSPlatformInfo: String;
//    function MemoryTotalInfo: String; // 物理メモリ容量
//    function MemoryActiveInfo: String;// 空きメモリ容量
//    function MemoryRateOfUse: String; // メモリ使用率
  public
    { Public 宣言 }
  end;

var
  BugReportForm: TBugReportForm;

implementation

{$R *.dfm}

procedure TBugReportForm.FormCreate(Sender: TObject);
var
  Partition, Title, Day, OSKind, MemTotal, MemActive, MemRateOfUse: String;
begin
  BugLabel.Caption := Application.Title + 'を使用して起きた不具合は、以下のテンプレートを' +
    '使用して報告して下さい。出来る限り対応します。';
  BugMemo.Clear;
//  WebPageLabel.Caption := '';

  Partition := '---------------------------------------------------';
  Day := FormatDateTime('yyyy/mm/dd',Now);
  Title := Application.Title + ' ' + GetFileVersion(Application.ExeName) + ' ' + 'バグレポート' + ' ' + Day;
  OSKind := OSPlatformInfo + '  ' + Win32CSDVersion;
  //OSBuild := IntToStr(OSver.dwBuildNumber);
  MemTotal := MemoryTotalInfo;
  MemActive := MemoryActiveInfo;
  MemRateOfUse := MemoryRateOfUse;

  BugMemo.Lines.Add(Partition);
  BugMemo.Lines.Add(Title);
  BugMemo.Lines.Add(Partition);
  BugMemo.Lines.Add('◇動作環境');
  BugMemo.Lines.Add('【OS】 ' + OSKind);
  BugMemo.Lines.Add('【Memory】  ' + MemTotal +
    ' ('+ MemActive + ' Free) ' + MemRateOfUse + '%');
  BugMemo.Lines.Add(Partition);
  BugMemo.Lines.Add('◇バグの状況');
  BugMemo.Lines.Add(#13);
  BugMemo.Lines.Add(Partition);
  BugMemo.Lines.Add('◇バグの発生手順');
  BugMemo.Lines.Add(#13);
  BugMemo.Lines.Add(Partition);

  BugMemo.SelStart := SendMessage(BugMemo.Handle, EM_LINEINDEX, 8, 0);

  Top := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;
end;

procedure TBugReportForm.CopyButtonClick(Sender: TObject);
begin
  Clipboard.AsText := BugMemo.Text;
end;

procedure TBugReportForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

//function TBugReportForm.OSPlatformInfo: String;
//var
//  OSver : TOSVERSIONINFO;
//begin
//  OSver.dwOSVersionInfoSize  :=  SizeOf(OSver);
//  GetVersionEx(OSver);
//  case OSver.dwPlatformId of
//    VER_PLATFORM_WIN32s: Result := 'Windows 3.1';  //VER_PLATFORM_WIN32s 		Win32s on Windows 3.1.
//    VER_PLATFORM_WIN32_WINDOWS: //VER_PLATFORM_WIN32_WINDOWS 	Windows 95, Windows 98, or Windows Me.
//    begin
//      case OSver.dwMinorVersion of
//        0{95}: Result := 'Windows 95';
//        10{98}: Result := 'Windows 98';
//        90{Me}: Result := 'Windows Me';
//      end;
//    end;
//    VER_PLATFORM_WIN32_NT://VER_PLATFORM_WIN32_NT Windows NT 3.51, Windows NT 4.0, Windows 2000, Windows XP, or Windows .NET Server.
//    begin
//      case OSver.dwMajorVersion of
//        3{3.51}: Result := 'Windows NT 3.51';
//        4{4.0}: Result := 'Windows NT 4.0';
//        5{2000, XP, .NET Server}:
//        begin
//          case OSver.dwMinorVersion of
//            0{2000}: Result := 'Windows 2000';
//            1{XP or .NET Server}: Result := 'Windows XP';
//          end;
//
//        end;
//      end;
//                
//    end;
//  else Result := 'Windows??';
//  end;
//end;
//
//// 空きメモリ容量
//function TBugReportForm.MemoryActiveInfo: String;
//var
//  MemStatus : TMemoryStatus;
//begin
//  MemStatus.dwLength := SizeOf(TMemoryStatus);
//  GlobalMemoryStatus(MemStatus);
//
//  Result := FormatFloat('#,##0KB',Round(MemStatus.dwAvailPhys/1024));
//end;
//
//// 物理メモリ容量
//function TBugReportForm.MemoryTotalInfo: String;
//var
//  MemStatus : TMemoryStatus;
//begin
//  MemStatus.dwLength := SizeOf(TMemoryStatus);
//  GlobalMemoryStatus(MemStatus);
//
//  Result := FormatFloat('#,##0KB',Round(MemStatus.dwTotalPhys/1024));
//end;
//
//// メモリ使用率
//function TBugReportForm.MemoryRateOfUse: String;
//var
//  MemStatus : TMemoryStatus;
//begin
//  MemStatus.dwLength := SizeOf(TMemoryStatus);
//  GlobalMemoryStatus(MemStatus);
//
//  Result := IntToStr(MemStatus.dwMemoryLoad);
//end;

procedure TBugReportForm.WebPageLabelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  WebPageLabel.Font.Color := clBlue;
  WebPageLabel.Font.Style := [fsUnderline];
  WebPageLabel.Cursor := crHandPoint;
end;

procedure TBugReportForm.WebPageLabelMouseLeave(Sender: TObject);
begin
  WebPageLabel.Font.Style := [];
  WebPageLabel.Cursor := crDefault;
end;

procedure TBugReportForm.WebPageLabelClick(Sender: TObject);
begin
   with WebPageLabel do
   begin
      ShellExecute(Application.Handle,
                   PChar('open'), PChar(WebPageLabel.Caption),
                   PChar(0), nil, SW_NORMAL);
   end;
end;

end.
