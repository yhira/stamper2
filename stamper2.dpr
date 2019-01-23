program stamper2;

{%File 'Readme.txt'}
{%ToDo 'stamper2.todo'}

uses
  Windows,
  IniFiles,
  SysUtils,
  Dialogs,
  Classes,
  Forms,
  Main in 'Main.pas' {MainForm},
  stmItem in 'stmItem.pas',
  yhFiles in 'yhFiles.pas',
  untFolder in 'untFolder.pas' {FolderDlg},
  untCategory in 'untCategory.pas' {CategoryDlg},
  yhOthers in 'yhOthers.pas',
  untOption in 'untOption.pas' {OptionDlg},
  OptionRecs in 'OptionRecs.pas',
  untAbort in 'untAbort.pas' {AboutBox},
  BugReport in 'BugReport.pas' {BugReportForm},
  untExport in 'untExport.pas' {ExportForm},
  untImport in 'untImport.pas' {ImportForm},
  TreeViewEx in 'TreeViewEx.pas',
  PassEdit in 'PassEdit.pas' {PassEditForm},
  TreeSave in 'TreeSave.pas',
  untPaste in 'untPaste.pas' {PasteDlg},
  untClipToPaste in 'untClipToPaste.pas' {ClipToPasteDlg},
  untInputCategory in 'untInputCategory.pas' {InputCategory},
  untInputFolder in 'untInputFolder.pas' {InputFolder},
  untEdit in 'untEdit.pas' {EditForm},
  ToolButtonEx in 'ToolButtonEx.pas',
  jconvertex in 'jconvertex.pas';

{$R *.res}
const
 MutexName = 'stamper2_Mutex';
var
 hMutex: THANDLE;   
 INI: TIniFile;
 Pass: Boolean;
 PassWord: string;
 sRes: string;
 path: string;
 fs: TFileStream;
 s: string;
 i: Integer;

  //関数
  procedure SaveInt(Stream: TFileStream; Int: Integer);
  begin
    Stream.Write(int, SizeOf(Int));
  end;
  procedure SaveStr(Stream: TFileStream; s: string);
  var
  	len: Integer;
  begin
  	with Stream do begin
      len := Length(s);
      Write(len, SizeOf(len));
      Write(PChar(s)^, len);
    end;
  end;
  procedure ReadInt(Stream: TFileStream; var Int: Integer);
  begin
    Stream.Read(Int, SizeOf(Int));
  end;
  procedure ReadStr(Stream: TFileStream; var s: string);
  var
  	len: Integer;
  begin
  	with Stream do begin
      read(len, SizeOf(len));
      SetLength(s, len);
      Read(PChar(s)^, len);
    end;
  end;

  procedure ReadPass(var PassWord: string; var Pass: Boolean);
  begin
    if FileExists(MainForm.MyPasteData) then begin
      fs := TFileStream.Create(MainForm.MyPasteData, fmOpenRead or fmShareExclusive);
      try
        //ヘッダ情報
        ReadStr(fs, s);

        //ノード数
        ReadInt(fs, i);
        //パスワードON/OFF
        ReadInt(fs, i);
        Pass := Boolean(i);
        //パスワード文字
        ReadStr(fs, s);
        PassWord := Encryption(s, True);

      finally
        fs.Free;
      end;
    end;
  end;

begin

  //本文
  hMutex := OpenMutex(MUTEX_ALL_ACCESS, False, MutexName);
  if hMutex <> 0 then
  begin
   CloseHandle(hMutex);
   Exit;
  end;





  hMutex := CreateMutex(nil, False, MutexName);

  try
    Application.Initialize;
    Application.CreateForm(TMainForm, MainForm);
  path := MainForm.MyPasteData;

//    if FileExists('D:\Delphi\stamper2\stamper2_040b01\stamper2.ini') then begin
    if FileExists(path) then begin

//      Pass := ReadBool('Option', 'PS',  False);
//      PassWord := ReadString('Option', 'PS2', Encryption(NOT_PASS, False));
//      PassWord := Encryption(PassWord, True);
      ReadPass(PassWord, Pass);
      if Pass then begin
        repeat

          if InputQuery('stamper2', 'パスワードを入力してください。', sRes) then begin
            if PassWord <> sRes then begin
              MessageDlg('パスワードが違います。', mtInformation, [mbOK], 0);
              sRes := '';
              continue;
            end;
          end else Exit;

        until PassWord = sRes;
      end else begin
        if PassWord <> NOT_PASS then begin
          MessageDlg('設定ファイルが不正に操作された可能性があります。'+#13+#10+
                     'アプリは起動しません。', mtWarning, [mbOK], 0);
          Exit;
        end;
      end;
    end;

    INI := TIniFile.Create(ChangeFileExt(Application.ExeName, '.ini'));
    try
      if INI.ReadBool('Option', 'Stealth', False) then begin
        Application.ShowMainForm := False;
        MainForm.actStealthExecute(nil);
        MainForm.FormShow(nil);
      end;
    finally
      INI.Free;
    end;

    Application.Run;  
  finally
     ReleaseMutex(hMutex);
  end;


end.
