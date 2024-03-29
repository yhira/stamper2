
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ShellApi, ExtCtrls, ShineSpdBtn, ComCtrls, StdCtrls,
  ToolWin, ActnList, IniFileCompo, ImgList, OptionRecs, AppEvnts, Clipbrd,
  sndkey32, MMSystem, CBWatch, TreeViewEx, yhHint, CommCtrl, ToolButtonEx, Consts,
  xmldom, XMLIntf, msxmldom, XMLDoc, oxmldom, jconvertex, Buttons, XPMan;

type
  TSortMode = (smNone, smFolder, smAlphaUp, smAlphaDown,
               smDayUp, smDayDown, smUseCountUp, smUseCountDown);
               
  TMainForm = class(TForm)
    TaskPopupMenu: TPopupMenu;
    ToolBar1: TToolBar;
    PageControl1: TPageControl;
    tsPaste: TTabSheet;
    tsClip: TTabSheet;
    pnlOperation: TPanel;
    pnlPaste: TPanel;
    tvPaste: TTreeViewEx;
    tvClip: TTreeViewEx;
    tbActivePaste: TToolButtonEx;
    tbActiveClip: TToolButtonEx;
    ToolButton3: TToolButtonEx;
    Exit1: TMenuItem;
    IniFileCompo1: TIniFileCompo;
    ActionList1: TActionList;
    actClose: TAction;
    actNewPasteData: TAction;
    actNewCategory: TAction;
    actNewFolder: TAction;
    TreePopupMenu: TPopupMenu;
    actNewCategory1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    TreeImageList: TImageList;
    actActivePaste: TAction;
    actActiveClip: TAction;
    actProperty: TAction;
    N3: TMenuItem;
    Property1: TMenuItem;
    actOption: TAction;
    actDelete: TAction;
    N4: TMenuItem;
    Delete1: TMenuItem;
    actEnterBtn: TAction;
    actTabBtn: TAction;
    actUndobtn: TAction;
    actDeleteBtn: TAction;
    actSpaceBtn: TAction;
    actUpBtn: TAction;
    actDownBtn: TAction;
    actLeftBtn: TAction;
    actRightBtn: TAction;
    actDayBtn: TAction;
    actTimeBtn: TAction;
    ToolButton4: TToolButtonEx;
    ToolBarImageList: TImageList;
    CaretTimer: TTimer;
    ApplicationEvents1: TApplicationEvents;
    ToolButton1: TToolButtonEx;
    actStealth: TAction;
    StealthTimer: TTimer;
    StealthDspLeftTimer: TTimer;
    StealthDspRightTimer: TTimer;
    N5: TMenuItem;
    O1: TMenuItem;
    actHelp: TAction;
    ToolButton2: TToolButtonEx;
    tbHelp: TToolButtonEx;
    HelpPopupMenu: TPopupMenu;
    actBugReport: TAction;
    actAbort: TAction;
    actBugReport1: TMenuItem;
    actAbort1: TMenuItem;
    actBackSpaceBtn: TAction;
    SpacePopupMenu: TPopupMenu;
    AllSpaseMenu: TMenuItem;
    HerfSpaceMenu: TMenuItem;
    DatePopupMenu: TPopupMenu;
    ToolButton5: TToolButtonEx;
    tbFile: TToolButtonEx;
    actFile: TAction;
    FilePopupMenu: TPopupMenu;
    actImport: TAction;
    actExport: TAction;
    About1: TMenuItem;
    E1: TMenuItem;
    N6: TMenuItem;
    actFile1: TMenuItem;
    OpenDialog1: TOpenDialog;
    ClipboardWatcher1: TClipboardWatcher;
    actAlpaUp: TAction;
    actDayUp: TAction;
    actAlphDown: TAction;
    actDayDown: TAction;
    actUseCountUp: TAction;
    actUseCountDown: TAction;
    ToolButtonEx1: TToolButtonEx;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    UPTimer: TTimer;
    DOWNTimer: TTimer;
    actClipToPasteData: TAction;
    actClipToFolder: TAction;
    actClipToCategory: TAction;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    b1: TMenuItem;
    ShineSpeedButton2: TShineSpeedButton;
    actInfo: TAction;
    actHelpView: TAction;
    actHelp1: TMenuItem;
    actClipDelete: TAction;
    ClipPopupMenu: TPopupMenu;
    D1: TMenuItem;
    actAddClipToPaste: TAction;
    P1: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    EasyEditor: TMenuItem;
    XMLDoc: TXMLDocument;
    ssbDate: TButton;
    ssbTime: TButton;
    ShineSpeedButton3: TButton;
    ShineSpeedButton4: TButton;
    ShineSpeedButton5: TButton;
    ShineSpeedButton6: TButton;
    ShineSpeedButton7: TButton;
    ShineSpeedButton8: TButton;
    ShineSpeedButton9: TButton;
    ShineSpeedButton10: TButton;
    ssbSpace: TButton;
    XPManifest1: TXPManifest;
    ClipTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actNewCategoryExecute(Sender: TObject);
    procedure tvPasteAddition(Sender: TObject; Node: TTreeNode);
    procedure actActivePasteExecute(Sender: TObject);
    procedure actActiveClipExecute(Sender: TObject);
    procedure actNewFolderExecute(Sender: TObject);
    procedure actNewPasteDataExecute(Sender: TObject);
    procedure actPropertyExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actOptionExecute(Sender: TObject);
    procedure ApplicationEvents1Activate(Sender: TObject);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure CaretTimerTimer(Sender: TObject);
    procedure tsPasteShow(Sender: TObject);
    procedure tsClipShow(Sender: TObject);
    procedure actStealthExecute(Sender: TObject);
    procedure StealthTimerTimer(Sender: TObject);
    procedure StealthDspLeftTimerTimer(Sender: TObject);
    procedure StealthDspRightTimerTimer(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actAbortExecute(Sender: TObject);
    procedure actBugReportExecute(Sender: TObject);
    procedure actDayBtnExecute(Sender: TObject);
    procedure actTimeBtnExecute(Sender: TObject);
    procedure actUpBtnExecute(Sender: TObject);
    procedure actDownBtnExecute(Sender: TObject);
    procedure actLeftBtnExecute(Sender: TObject);
    procedure actRightBtnExecute(Sender: TObject);
    procedure actEnterBtnExecute(Sender: TObject);
    procedure actTabBtnExecute(Sender: TObject);
    procedure actDeleteBtnExecute(Sender: TObject);
    procedure actBackSpaceBtnExecute(Sender: TObject);
    procedure actSpaceBtnExecute(Sender: TObject);
    procedure ssbDateMouseEnter(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ssbDateMouseLeave(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ssbSpaceMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure AllSpaseMenuClick(Sender: TObject);
    procedure HerfSpaceMenuClick(Sender: TObject);
    procedure ssbDateMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ssbTimeMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure actFileExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actImportExecute(Sender: TObject);
    procedure ClipboardWatcher1Change(Sender: TObject);
    procedure tvPasteMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tbFileMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure tbFileMouseLeave(Sender: TObject);
    procedure tvPasteMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tvPasteChange(Sender: TObject; Node: TTreeNode);
    procedure tvPasteDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure actAlpaUpExecute(Sender: TObject);
    procedure tvPasteCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure actAlphDownExecute(Sender: TObject);
    procedure actDayUpExecute(Sender: TObject);
    procedure actDayDownExecute(Sender: TObject);
    procedure actUseCountUpExecute(Sender: TObject);
    procedure actUseCountDownExecute(Sender: TObject);
    procedure tvPasteDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure FormActivate(Sender: TObject);
    procedure UPTimerTimer(Sender: TObject);
    procedure DOWNTimerTimer(Sender: TObject);
    procedure tvPasteMouseLeave(Sender: TObject);
    procedure actClipToPasteDataExecute(Sender: TObject);
    procedure actClipToCategoryExecute(Sender: TObject);
    procedure actClipToFolderExecute(Sender: TObject);
    procedure actInfoExecute(Sender: TObject);
    procedure TreePopupMenuPopup(Sender: TObject);
    procedure FilePopupMenuPopup(Sender: TObject);
    procedure actHelpViewExecute(Sender: TObject);
    procedure tvPasteMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tvPasteExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure actClipDeleteExecute(Sender: TObject);
    procedure tvClipMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ClipPopupMenuPopup(Sender: TObject);
    procedure tvPasteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvClipKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvPasteCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure actAddClipToPasteExecute(Sender: TObject);
    procedure EasyEditorClick(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure ClipTimerTimer(Sender: TObject);
    procedure tvClipAddition(Sender: TObject; Node: TTreeNode);
  private
    { Private 宣言 }
    FTrayIcon : TNotifyIconData;
    FTargetWindow: HWND;
//    FtargetControl: HWND;
//    FTID: DWORD;
    FAppRect: TRect;         //メインフォームの大きさ
    FWorkRect: TRect;        //作業領域
    FDsktopRect: TRect;      //デスクトップ領域
    FFlagStealth: Boolean;   //ステルスフラグ
    FSpaceType: Byte;        //全角か半角か
    FDateType: Byte;         //日付形式
    FTimeType: Byte;         //時間形式
    FHintWnd: THintWindow;   //ポップアップヒントウインド
    FForcedTermination: Boolean;
    FDragFlag: Boolean;     //ドラッグ判定
    FMDPt: TPoint;          //mouse down point
    FExpandFlag: Boolean;
    FCollapsedFlag: Boolean;
    FOldPasteString: string;
    FPassChangeFlag: Boolean;
//    FMouseDownNode: Integer; //マウスが下がったときのノード
//    FMousePt: TPoint;
    OptionRec: TOptionRec;   //stamperオプションレコード

    procedure IconEvent(var Msg : TMsg); message WM_USER + 1;
    procedure AppMinimize(Sender: TObject);
    procedure SaveINI;
    procedure LoadINI;
    procedure DeleteNodeData(ANode: TTreeNode);
    procedure SetOptionRec;
    procedure StealthOFF;
    procedure ShowAnimation;
    procedure HideAnimation;
//    function GetFocusInAnotherProcess(hWin: HWND): HWND;
    procedure Paste(sData: string);
    procedure PasteTab(sData: string);
    procedure PasteEnter(sData: string);
    procedure PasteUp(sData: string);
    procedure PasteDown(sData: string);
    procedure PasteLeft(sData: string);
    procedure PasteRignt(sData: string);
    procedure ToClip(sData: string);
    procedure Browse(sData: string);
    procedure Execute(sData: string);
    procedure KeyEvente(KeyString: string);
    procedure AddDate(Pop: TPopupMenu);
    procedure AddTime(Pop: TPopupMenu);
    procedure DateMenuClick(Sender: TObject);
    procedure TimeMenuClick(Sender: TObject);
//    procedure DeleteClipItemData;
    procedure SaveClipData(TreeView: TTreeView; DataFile: string);
    procedure LoadClipData(TreeView: TTreeView; DataFile: string);
//    procedure ShowTextPopup(s: string);
//		procedure WMSetCursor(var Message: TWMSetCursor); message WM_SETCURSOR;
//    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
    procedure ChangeControlBtnHint;
    procedure AppShowHintTree(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure Sort(SortMode: TSortMode);
    procedure ScrollEnd;
    procedure SetPasteData(Clip: Boolean);
    procedure SetCategoryData(Clip: Boolean);
    procedure SetFolderData(Clip: Boolean);
    procedure CheckClipBoard;
    function GetPlatformInfo: string;
    procedure PlaySound;
    procedure SaveExp;
    procedure LoadExp;
    procedure BuckUp;
//    procedure MakeSerectTree;
  public
    { Public 宣言 }
    MyDataPath: string;
    MyPasteData: string;
    MyClipData:  string;
    MySoundPath: string;
    MyExpData:   string;
    MyDefaultSoundFile: string;
    MyBuckUpPath: string;
    FModified: Boolean;
    ClipFinishTime: Cardinal;
    function SaveData(TreeView: TTreeView; DataFile: String; DataDispose, DataExport: Boolean): Boolean;
    procedure LoadData(TreeView: TTreeView; DataFile: String; DataImport: Boolean);
    procedure ExportXML(Tree: TTreeView; FileName: String);
  end;


//  function EditCheck(s, Name: string): Boolean;
var
  MainForm: TMainForm;

const
	NOT_PASS = 'パスワードは使われていないよnot pass';

  sDateType: array[0..5] of string = (
  	'yy/mm/dd',
    'yyyy/mm/dd',
    'yy"年"mm"月"dd"日"(aaa)',
    'yyyy"年"mm"月"dd"日"(aaa)',
    'gg　ee"年"mm"月"dd"日"(aaa)',
    'yymmddhhnnss'
  );

  sTimeType: array[0..6] of string = (
  	'hh:mm:ss',
    'hh:mm',
    'hh:mm:ss AM/PM',
    'hh:mm AM/PM',
    'hh"時"mm"分"ss"秒"',
    'hh"時"mm"分"',
    'hhmmss'
  );


	CATEGORY_ITEM  = 0;
  FOLDER_ITEM    = 1;
  PASTE_ITEM     = 2;

  DEF_CATEGORY_ICON = 0;
  DEF_FOLDER_ICON   = 7;
  DEF_PASTE_ICON    = 15;

  FILE_HEADER    = 'StamperFile';
  PASTE_DATA_EXT = '.stp';
  CLIP_DATA_EXT  = '.stc';
  PASTE_DATA     = 'paste' + PASTE_DATA_EXT;
  CLIP_DATA      = 'clip'  + CLIP_DATA_EXT;
  DEF_SOUND_FILE = 'click.wav';

implementation

uses
	stmItem, yhFiles, untCategory, untFolder, untPaste, HEditor,
  ListActns, untOption, untAbort, BugReport, untExport, untImport, untClipToPaste,
  untEdit;


{$R *.dfm}
       
//	function CpuInfoDialog(hWnd: HWND; Flag: Integer): Boolean; stdcall; external 'cpuinfo.dll';
//	function ProcessorName: PChar; stdcall; external 'cpuinfo.dll';
//	function GetFrequency(m_count: DWORD): Double; stdcall; external 'cpuinfo.dll';
//	function FamilyNumber: Integer; stdcall; external 'cpuinfo.dll';         
//	function ModelNumber: Integer; stdcall; external 'cpuinfo.dll';
//	function SteppingNumber: Integer; stdcall; external 'cpuinfo.dll';


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
{ TTaskForm }

procedure TMainForm.AppMinimize(Sender: TObject);
begin
  Hide;
end;


procedure TMainForm.IconEvent(var Msg: TMsg);
var
  MousePoint : TPoint;
begin
  //左クリック
  if  (Msg.wParam = WM_LBUTTONDOWN) then  begin
    if Visible = False then begin
      StealthOFF;
      Application.Restore;
      SetForegroundWindow(Application.Handle);
      ShowWindow(Application.Handle,SW_HIDE); {タスクバー非表示}
    end;
  end else
  //右クリック
  if  (Msg.wParam = WM_RBUTTONDOWN) then  begin
    GetCursorPos(MousePoint);
    TaskPopupMenu.Popup(MousePoint.x, MousePoint.y); {ポップアップを表示}
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin             
	//タスク
  Application.OnMinimize := AppMinimize;
  with FTrayIcon do begin
    cbSize  :=  SizeOf(TNotifyIconData);
    hIcon   :=  Application.Icon.Handle; //アイコンを指定
    szTip   :=  'Stamper2'; //ヒント表示
    uCallbackMessage  :=  WM_USER + 1;
    uFlags  :=  NIF_MESSAGE or NIF_ICON or NIF_TIP;
    uID     :=  1;
    Wnd     :=  Handle;
  end;
  //初期化作業
  MyDataPath := ExtractFilePath(Application.ExeName) + 'data\';
  if not DirectoryExists(MyDataPath) then
  	ForceDirectories(MyDataPath);
  MyPasteData := MyDataPath + PASTE_DATA;
  MyClipData  := MyDataPath + CLIP_DATA;
  MyExpData   := MyDataPath + 'NodeExp';
  MySoundPath := ExtractFilePath(Application.ExeName) + 'sound\';
  if not DirectoryExists(MySoundPath) then
  	ForceDirectories(MySoundPath);
  MyDefaultSoundFile := MySoundPath + DEF_SOUND_FILE;
  MyBuckUpPath := ExtractFilePath(Application.ExeName) + 'bk\';
  if not DirectoryExists(MyBuckUpPath) then
  	ForceDirectories(MyBuckUpPath);

  //help
  Application.HelpFile := ExtractFilePath(Application.ExeName) + 'STAMPER2.HLP';

  FDateType := 0;
  FTimeType := 0;
  FForcedTermination := False;
  FDragFlag := False;
  FExpandFlag := False;
  FCollapsedFlag := True;
  FOldPasteString := '';
  FModified := False;
  FPassChangeFlag := False;

  ClipFinishTime := GetTickCount;

  //コントロールボタンのヒント初期設定
  FHintWnd := THintWindowPlus.Create(Self);
  Application.HintHidePause := MaxInt;

//	tvPaste.BoundaryLine := bsTop;

//  FHintWnd.Pause := 500;
//  FHintWnd.HidePause := 5000;
//  HintWindowClass := THintWindowPlus;
//  tvPaste.OnMouseLeave := TreeViewMouseleave;
//  tvClip.OnMouseLeave  := TreeViewMouseleave;

  OpenDialog1.Filter := Application.Title + 'ファイル (*' + PASTE_DATA_EXT +
  	')|*' + PASTE_DATA_EXT + '|すべてのファイル (*.*)|*.*';
  OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);

  //フォームを常に手前に表示させる
  StayOnTop(Handle);


  LoadINI;                            
  LoadData(tvPaste, MyPasteData, False);
  if OptionRec.Clip.ReadHistory then
  	LoadClipData(tvClip, MyClipData);
  SetOptionRec;

  tvPaste.CustomSort(nil, Ord(smFolder));
  tvPaste.FullCollapse;
  if OptionRec.Standard.Expanded then LoadExp;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
	//Task
  Shell_NotifyIcon(NIM_DELETE, @FTrayIcon);
  //FHintWnd破棄
  if FHintWnd <> nil then begin
    FHintWnd.ReleaseHandle;
    FHintWnd.Free;
    FHintWnd := nil;
  end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  ShowWindow(Application.Handle,SW_HIDE); {タスクバー非表示}
//  actStealth.Execute;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
	//タスク
  Shell_NotifyIcon(NIM_ADD, @FTrayIcon);

end;

procedure TMainForm.actCloseExecute(Sender: TObject);
begin
	Close;
end;

procedure TMainForm.LoadINI;
var
	Stealths: array[0..3] of Boolean;
  sPass: string;
  bPass: Boolean;
//  s: string;
  procedure ReadPass(var PassWord: string; var Pass: Boolean);
  var
  	fs: TFileStream;
    s: string;
    i: Integer;
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
	with IniFileCompo1 do begin
    ReadForm('Window', 'Form', MainForm);
    OnWorkArea(MainForm);
    FAppRect     := Rect(Left, Top, Left + Width, Top + Height);

    with OptionRec do begin
      Standard.AutoExpand  := ReadBool('Option', 'AutoExpand',  False);
      Standard.DeleteCheck := ReadBool('Option', 'DeleteCheck', True);
      Standard.Stealth     := ReadBool('Option', 'Stealth',     False);
      Standard.Expanded    := ReadBool('Option', 'Expanded',    False);
      Standard.Sound       := ReadBool('Option', 'Sound',       True);
      Standard.SoundFile   := ReadStr ('Option', 'SoundFile',   MyDefaultSoundFile);
			ReadPass(sPass, bPass);
      Standard.Pass := bPass;
      Standard.PassWord := sPass;
//      Standard.Pass        := ReadBool('Option', 'PS',  False); False));
//			Standard.PassWord    := ReadStr('Option', 'PS2', Encryption(NOT_PASS, False));
//      Standard.PassWord    := Encryption(Standard.PassWord, True);

      Display.HotTrack  := ReadBool('Option', 'HotTrack',  True);
      Display.PopHint   := ReadBool('Option', 'PopHint',   True);
      Display.TabPos    := TTabPos(ReadInt('Option', 'TabPos', 1));
      Display.Animation := ReadBool('Option', 'Animation', True);

      Stealths[0]      := ReadBool('Option', 'TopLeft', True);
      Stealths[1]      := ReadBool('Option', 'TopRight', True);
      Stealths[2]      := ReadBool('Option', 'BottomLeft', True);
      Stealths[3]      := ReadBool('Option', 'BottomRight', True);
      Display.Stealths := [];
      if Stealths[0] then
      	Display.Stealths := Display.Stealths + [stTopLeft];
      if Stealths[1] then
      	Display.Stealths := Display.Stealths + [stTopRight];
      if Stealths[2] then
      	Display.Stealths := Display.Stealths + [stBottomLeft];
      if Stealths[3] then
      	Display.Stealths := Display.Stealths + [stBottomRight];

      Clip.Enabled     := ReadBool('Option', 'ClipEnabled', True);
      Clip.AddFirst    := ReadBool('Option', 'ClipAddFirst', False);
      Clip.ReadHistory := ReadBool('Option', 'ClipReadHistory', True);
      Clip.Count       := ReadCardinal('Option', 'ClipCount', 10);
      Clip.NotPasteData:= ReadBool('Option', 'NotPasteData', False);
    end;
    PageControl1.ActivePageIndex := ReadInt('Option', 'ActivePage', 0);
    actActivePaste.Checked := PageControl1.ActivePageIndex = 0;
    actActiveClip.Checked  := PageControl1.ActivePageIndex = 1;

    FSpaceType := ReadInt('Panel', 'Space', 0);
    SpacePopupMenu.Items[FSpaceType].Checked := True;

    FDateType := ReadInt('Panel', 'Date', 0);
    FTimeType := ReadInt('Panel', 'Time', 0);

    ChangeControlBtnHint;
  end;
end;

procedure TMainForm.ChangeControlBtnHint;
const
	SP_CHANGE   = ' [右ｸﾘｯｸで全角半角切り替え]';
  DAY_CHANGE  = ' [右ｸﾘｯｸで日付形式切り替え]';
  TIME_CHANGE = ' [右ｸﾘｯｸで時間形式切り替え]';
begin
    case FSpaceType of
      0: actSpaceBtn.Hint := '全角ｽﾍﾟｰｽ' + SP_CHANGE;
      1: actSpaceBtn.Hint := '半角ｽﾍﾟｰｽ' + SP_CHANGE;
    end;
    actDayBtn.Hint := FormatDateTime(sDateType[FDateType], Now) + #13#10 +
                      DAY_CHANGE;
    actTimeBtn.Hint := FormatDateTime(sTimeType[FTimeType], Now) + #13#10 +
                       TIME_CHANGE;
//    actInfo.Hint := GetPlatformInfo;
end;

procedure TMainForm.SaveINI;
//var
//	s: string;
//	i: Integer;
//  Obj: TObject;
begin
  with IniFileCompo1 do begin
  	if FFlagStealth then begin
      WriteInt('Window', 'Form.left',   FAppRect.Left);
      WriteInt('Window', 'Form.top',    FAppRect.Top);
      WriteInt('Window', 'Form.width',  FAppRect.Right);
      WriteInt('Window', 'Form.height', FAppRect.Bottom);
    end else begin
      WriteForm('Window', 'Form', MainForm);
    end;


    with OptionRec do begin
    	WriteBool('Option', 'AutoExpand',  Standard.AutoExpand);
      WriteBool('Option', 'DeleteCheck', Standard.DeleteCheck);
      WriteBool('Option', 'Stealth',     Standard.Stealth);
      WriteBool('Option', 'Expanded',    Standard.Expanded);
      WriteBool('Option', 'Sound',       Standard.Sound);
      WriteStr ('Option', 'SoundFile',   Standard.SoundFile);
//      WriteBool('Option', 'PS',          Standard.Pass);
//      s := Standard.PassWord;
//      s := Encryption(s, False);
//      WriteStr('Option', 'PS2', s);

      WriteBool('Option', 'HotTrack',    Display.HotTrack);
      WriteBool('Option', 'PopHint',     Display.PopHint);
      WriteInt ('Option', 'TabPos',      Ord(Display.TabPos));
      WriteBool('Option', 'Animation',   Display.Animation);
      WriteBool('Option', 'TopLeft',     stTopLeft in Display.Stealths);
      WriteBool('Option', 'TopRight',    stTopRight in Display.Stealths);
      WriteBool('Option', 'BottomLeft',  stBottomLeft in Display.Stealths);
      WriteBool('Option', 'BottomRight', stBottomRight in Display.Stealths);

      WriteBool('Option', 'ClipEnabled', Clip.Enabled);
      WriteBool('Option', 'ClipAddFirst', Clip.AddFirst);
      WriteBool('Option', 'ClipReadHistory', Clip.ReadHistory);
      WriteCardinal('Option', 'ClipCount', Clip.Count);
      WriteBool('Option', 'NotPasteData', Clip.NotPasteData);
    end;
    WriteInt('Option', 'ActivePage', PageControl1.ActivePageIndex);

    //操作パネル
    WriteInt('Panel', 'Space', FSpaceType);
    WriteInt('Panel', 'Date',  FDateType);
    WriteInt('Panel', 'Time',  FTimeType);

  end;
end;

procedure TMainForm.actNewCategoryExecute(Sender: TObject);
begin
  SetCategoryData(False);
end;

procedure TMainForm.SetCategoryData(Clip: Boolean);
var
	cItem: TCategoryItem;
  sl: TStrings;
begin
  CategoryDlg := TCategoryDlg.Create(Self);
  try
  	with CategoryDlg do begin
			if Clip then begin
        sl := TStringList.Create;
        try
          sl.Text := clipboard.AsText;
          leName.Text             := sl[0];
          if Trim(leName.Text) = '' then leName.Text := FormatDateTime('"新規 "ddddd hh:mm:ss', Now);
        finally
          sl.Free;
        end;
      end else begin
        leName.Text          := '新規カテゴリ';
      end;

      
      Caption              := 'カテゴリの新規作成';
      memComment.Text      := '';
      lblCreateDay.Caption := '';
      cbIcon.ItemIndex     := 0;

      if CategoryDlg.ShowModal = mrOK then begin
        cItem := TCategoryItem.Create;
        cItem.Name      := leName.Text;
        cItem.Comment   := memComment.Text;
        cItem.CreateDay := Now;
        cItem.Icon      := cbIcon.ItemsEx.ComboItems[cbIcon.ItemIndex].ImageIndex;

        tvPaste.Items.AddObject(nil, cItem.Name, Pointer(cItem)).Selected := True;
        FForcedTermination := False;
        FModified := True;
      end;
    end;

  finally
    CategoryDlg.Release;
  end;
end;

procedure TMainForm.actNewFolderExecute(Sender: TObject);
begin
  SetFolderData(False);
end;


procedure TMainForm.SetFolderData(Clip: Boolean);
var
	fItem: TFolderItem;
  Node: TTreeNode;
  sl: TStrings;
begin
	Node := tvPaste.Selected;
	if Node = nil then Exit;
//  if TObject(tvPaste.Selected.Data) is TPasteItem then Exit;

  FolderDlg := TFolderDlg.Create(Self);
  try
    with FolderDlg do begin
			if Clip then begin
        sl := TStringList.Create;
        try
          sl.Text := clipboard.AsText;
          leName.Text             := sl[0];
          if Trim(leName.Text) = '' then leName.Text := FormatDateTime('"新規 "ddddd hh:mm:ss', Now);
        finally
          sl.Free;
        end;
      end else begin
      	leName.Text          := '新規フォルダ';
      end;
      Caption              := 'フォルダの新規作成';
      memComment.Text      := '';
      lblCreateDay.Caption := '';
      cbIcon.ItemIndex     := 0;

      if ShowModal = mrOK then begin
        fItem := TFolderItem.Create;
        fItem.Name := leName.Text;
        fItem.Comment   := memComment.Text;
        fItem.CreateDay := Now;
        fItem.Icon      := cbIcon.ItemsEx.ComboItems[cbIcon.ItemIndex].ImageIndex;

        if TObject(Node.Data) is TPasteItem then
          tvPaste.Items.AddChildObject(Node.Parent, fItem.Name, Pointer(fItem)).Selected := True
        else
          tvPaste.Items.AddChildObject(Node,        fItem.Name, Pointer(fItem)).Selected := True;
        FForcedTermination := False;
        FModified := True;
      end;
    end;
  finally
    FolderDlg.Release;
  end;
end;


procedure TMainForm.actNewPasteDataExecute(Sender: TObject);
begin
  SetPasteData(False);
end;


procedure TMainForm.SetPasteData(Clip: Boolean);
var
	pItem: TPasteItem;
  Node: TTreeNode;
  sl: TStrings;
begin
	Node := tvPaste.Selected;
	if Node = nil then Exit;

  PasteDlg := TPasteDlg.Create(Self);
  try
    with PasteDlg do begin

      if Clip then begin
        CheckClipBoard;

      	sl := TStringList.Create;
        try
          sl.Text := Clipboard.AsText;
          leName.Text             := sl[0];
          memPasteData.Lines.Text := Clipboard.AsText;//sl.Text;
          if Trim(leName.Text) = '' then leName.Text := FormatDateTime('"新規 "ddddd hh:mm:ss', Now);
        finally
          sl.Free;
        end;

      end else begin
        leName.Text             := '新規貼り付けデータ';
        memPasteData.Lines.Text := '';
      end;
                    

      Caption                 := '貼り付けデータの新規作成';
      memComment.Text         := '';
      lblCreateDay.Caption    := '';
      lblUpdateDay.Caption    := '';
      cbPasteMode.ItemIndex   := 0;
      edtUseCount.Text        := '0';

      if ShowModal = mrOK then begin
        pItem := TPasteItem.Create;
        pItem.Name      := leName.Text;
        pItem.Comment   := memComment.Text;
        pItem.CreateDay := Now;
        pItem.UpdateDay := Now;
        pItem.Icon      := cbPasteMode.ItemsEx.ComboItems[cbPasteMode.ItemIndex].ImageIndex;
        pItem.PasteMode := TPasteMode(cbPasteMode.ItemIndex);
        pItem.PasteData := memPasteData.Lines.Text;
        pItem.UseCount  := StrToInt(edtUseCount.Text);

        if TObject(Node.Data) is TPasteItem then
          tvPaste.Items.AddChildObject(Node.Parent, pItem.Name, Pointer(pItem)).Selected := True
        else
          tvPaste.Items.AddChildObject(Node,        pItem.Name, Pointer(pItem)).Selected := True;
        FForcedTermination := False;
        FModified := True;
      end;
    end;
  finally
    PasteDlg.Release;
  end;
end;


procedure TMainForm.tvPasteAddition(Sender: TObject; Node: TTreeNode);
begin
//	if TObject(Node.Data) is TCategoryItem then begin
    Node.ImageIndex    := TBaseItem(Node.Data).Icon;
    Node.SelectedIndex := TBaseItem(Node.Data).Icon;
//  end;
end;

procedure TMainForm.actActivePasteExecute(Sender: TObject);
begin
  PageControl1.ActivePage := tsPaste;
end;

procedure TMainForm.actActiveClipExecute(Sender: TObject);
begin
	PageControl1.ActivePage := tsClip;
end;

procedure TMainForm.actPropertyExecute(Sender: TObject);
var
	Node: TTreeNode;
  cItem: TCategoryItem;
  fItem: TFolderItem;
  pItem: TPasteItem;
begin
	Node := tvPaste.Selected;
  if Assigned(Node) = False then Exit;

  //カテゴリアイテムの時
	if TObject(Node.Data) is TCategoryItem then begin
    CategoryDlg := TCategoryDlg.Create(Self);
    try
    cItem := TCategoryItem(Node.Data);
  	with CategoryDlg do begin
      Caption              := 'カテゴリのプロパティ';
      leName.Text          := cItem.Name;
      memComment.Text      := cItem.Comment;
      lblCreateDay.Caption := FormatDateTime('yyyy/mm/dd hh:nn', cItem.CreateDay);
      cbIcon.ItemIndex     := cItem.Icon;

      if ShowModal = mrOK then begin
      	//TCategoryItem側
        cItem.Name      := leName.Text;
        cItem.Comment   := memComment.Text;
        cItem.Icon      := cbIcon.ItemsEx.ComboItems[cbIcon.ItemIndex].ImageIndex;

        //TreeView側
        Node.Text          := cItem.Name;
        Node.ImageIndex    := cItem.Icon;
        Node.SelectedIndex := cItem.Icon;

        FModified := True;
      end;
    end;
    finally
      CategoryDlg.Release;
    end;
  end;

  //フォルダアイテムのとき
  if TObject(Node.Data) is TFolderItem then begin
    FolderDlg := TFolderDlg.Create(Self);
    try
    fItem := TFolderItem(Node.Data);
  	with FolderDlg do begin
      Caption              := 'フォルダのプロパティ';
      leName.Text          := fItem.Name;
      memComment.Text      := fItem.Comment;
      lblCreateDay.Caption := FormatDateTime('yyyy/mm/dd hh:nn', fItem.CreateDay);
      cbIcon.ItemIndex     := fItem.Icon - 7;

      if ShowModal = mrOK then begin
      	//TFolderItem側
        fItem.Name      := leName.Text;
        fItem.Comment   := memComment.Text;
        fItem.Icon      := cbIcon.ItemsEx.ComboItems[cbIcon.ItemIndex].ImageIndex;

        //TreeView側
        Node.Text          := fItem.Name;
        Node.ImageIndex    := fItem.Icon;
        Node.SelectedIndex := fItem.Icon;
      end;
    end;
    finally
      FolderDlg.Release;
    end;
  end;

  //ペーストアイテムのとき
  if TObject(Node.Data) is TPasteItem then begin
    PasteDlg := TPasteDlg.Create(Self);
    try
    pItem := TPasteItem(Node.Data);
  	with PasteDlg do begin
      Caption               := '貼り付けデータのプロパティ';
      leName.Text           := pItem.Name;
      memComment.Text       := pItem.Comment;
      lblCreateDay.Caption  := FormatDateTime('yyyy/mm/dd hh:nn', pItem.CreateDay);
      lblUpdateDay.Caption  := FormatDateTime('yyyy/mm/dd hh:nn', pItem.UpdateDay);
      cbPasteMode.ItemIndex := pItem.Icon - 15;
      edtUseCount.Text      := IntToStr(pItem.UseCount);
      memPasteData.Lines.Text := pItem.PasteData;

      if ShowModal = mrOK then begin
      	//TPasteItem側
        pItem.Name      := leName.Text;
        pItem.Comment   := memComment.Text;
        pItem.UpdateDay := Now;
        pItem.PasteMode := TPasteMode(cbPasteMode.ItemIndex);
        pItem.Icon      := cbPasteMode.ItemsEx.ComboItems[cbPasteMode.ItemIndex].ImageIndex;
        pItem.UseCount  := StrToInt(edtUseCount.Text);
        pItem.PasteData := memPasteData.Lines.Text;

        //TreeView側
        Node.Text          := pItem.Name;
        Node.ImageIndex    := pItem.Icon;
        Node.SelectedIndex := pItem.Icon;
      end;
    end;
    finally
      PasteDlg.Release;
    end;
  end;
end;

procedure TMainForm.LoadData(TreeView: TTreeView; DataFile: String;
  DataImport: Boolean);
  procedure NodeMove(ANode: TTreeNode; var IntA, IntB:Integer);
  begin
    if IntB > IntA then
    begin
      IntB := IntA;
      while ANode.Level > IntA do
      begin
        ANode.MoveTo(ANode.Parent, naAdd);
      end;
    end
    else
    begin
      if IntB < IntA then
      begin
        IntB := IntA;
        ANode.MoveTo(ANode.GetPrev, naAddChild);
      end;
    end;
  end;
var
	fs: TFileStream;
  Node: TTreeNode;
  cItem: TCategoryItem;
  fItem: TFolderItem;
  pItem: TPasteItem;
  s: string;
  iCount, iType: Integer;
  IntLevelA, IntLevelB: Integer;
  i: Integer;
  Msg: string;
  bPass: Boolean;
  sPassWord: string;
begin
	if FileExists(DataFile) = False then Exit;
  fs := TFileStream.Create(DataFile, fmOpenRead or fmShareExclusive);
  try
  	//ヘッダ情報
    ReadStr(fs, s);
    if s <> FILE_HEADER then
      if DataImport then begin
      	Msg := DataFile + 'に異常があります。' + #13#10 +
               Application.Title + 'のファイルでないかもしくはデータが壊れた可能性があります。';
      	Application.MessageBox(PChar(Msg),
        										   PChar(Application.Title),
                               MB_ICONEXCLAMATION);
        Exit;
      end else begin
      	Msg := DataFile + 'はインポートできません。'  + #13#10 +
               Application.Title + 'のファイルでないかもしくはデータが壊れた可能性があります。';
      	Application.MessageBox(PChar(Msg),
        										   PChar(Application.Title),
                               MB_ICONEXCLAMATION);
        Exit;
      end;
    //ノード数
    ReadInt(fs, iCount);
    //パスワードON/OFF                       
    ReadInt(fs, i);
    bPass := Boolean(i);
    //パスワード文字
    ReadStr(fs, s);
//    ShowMessage(s);
    sPassWord := Encryption(s, True);

    if (bPass = False) and (sPassWord = NOT_PASS) then begin
      if (DataImport <> True) and ((bPass <> OptionRec.Standard.Pass) or (sPassWord <> OptionRec.Standard.PassWord)) then begin
        Msg := 'データファイルが不正に変更された可能性があります。' + #13#10 +
               'このファイルは開けません。';
      	Application.MessageBox(PChar(Msg),
        										   PChar(Application.Title),
                               MB_ICONEXCLAMATION);
        FForcedTermination := True;
        Exit;
      end;
    end;

    if bPass then begin
      if (sPassWord <> OptionRec.Standard.PassWord) then begin
        Msg := 'データファイルが不正に変更されたかパスワードが違う可能性があります。' + #13#10 +
               'このファイルは開けません。';
      	Application.MessageBox(PChar(Msg),
        										   PChar(Application.Title),
                               MB_ICONEXCLAMATION); 
        FForcedTermination := True;
        Exit;
      end;
    end;


    IntLevelB := 0;
    Node := nil;

    for i := 0 to iCount -1 do begin
      ReadInt(fs, iType);

      case iType of
        CATEGORY_ITEM:
        begin
        	ReadInt(fs, IntLevelA);
          cItem := TCategoryItem.Create;
          cItem.LoadStream(fs);
          cItem.Decode;
          if DataImport then begin
            cItem.Icon := DEF_CATEGORY_ICON;
            cItem.CreateDay := Now;
          end;
          Node := TreeView.Items.AddObject(Node, cItem.Name, Pointer(cItem));
          NodeMove(Node, IntLevelA, IntLevelB);
        end;
        FOLDER_ITEM:
        begin
          ReadInt(fs, IntLevelA);
          fItem := TFolderItem.Create;
          fItem.LoadStream(fs);
          fItem.Decode;
          if DataImport then begin
            fItem.Icon := DEF_FOLDER_ICON;
            fItem.CreateDay := Now;
          end;
          Node := TreeView.Items.AddObject(Node, fItem.Name, Pointer(fItem));
          NodeMove(Node, IntLevelA, IntLevelB);
        end;
        PASTE_ITEM:
        begin
          ReadInt(fs, IntLevelA);
          pItem := TPasteItem.Create;
          pItem.LoadStream(fs);
          pItem.Decode;
          if DataImport then begin
//            pItem.Icon      := DEF_PASTE_ICON;
            pItem.CreateDay := Now;
            pItem.UpdateDay := Now;
            pItem.UseCount  := 0;
          end;
          Node := TreeView.Items.AddObject(Node, pItem.Name, Pointer(pItem));
          NodeMove(Node, IntLevelA, IntLevelB);
        end;
      end;

    end;

  finally
    fs.Free;
  end;
end;

function TMainForm.SaveData(TreeView: TTreeView; DataFile: String;
  DataDispose, DataExport: Boolean): Boolean;
var
	fs: TFileStream;
  Node: TTreeNode;
  cItem: TCategoryItem;
  fItem: TFolderItem;
  pItem: TPasteItem;
  s: string;
begin
	Result := False;
	if FForcedTermination then Exit;
  fs := TFileStream.Create(DataFile, fmCreate	or fmShareExclusive);
  try
  	//ヘッダ情報
    SaveStr(fs, FILE_HEADER);
    SaveInt(fs, TreeView.Items.Count);

    if DataExport then begin
      SaveInt(fs, Integer(False));
      SaveStr(fs, Encryption(NOT_PASS, False));
    end else begin
    	SaveInt(fs, Integer(OptionRec.Standard.Pass));

      s := OptionRec.Standard.PassWord;   // ShowMessage(s);
      s := Encryption(s, False);
      SaveStr(fs, s);
    end;

    Node := TreeView.Items.GetFirstNode;
    while Assigned(Node) do begin
    	if TObject(Node.Data) is TCategoryItem then begin
        cItem := TCategoryItem(Node.Data);
        cItem.Encode;

        SaveInt(fs, CATEGORY_ITEM);
        SaveInt(fs, Node.Level);
        cItem.SaveStream(fs);
        if DataExport then cItem.Decode;
        if DataDispose then begin
          cItem.Free;
          Node.Data := nil;
        end;
      end;

    	if TObject(Node.Data) is TFolderItem then begin
        fItem := TFolderItem(Node.Data);
        fItem.Encode;

        SaveInt(fs, FOLDER_ITEM);
        SaveInt(fs, Node.Level);
        fItem.SaveStream(fs);  
        if DataExport then fItem.Decode;
        if DataDispose then begin
          fItem.Free;
          Node.Data := nil;
        end;
      end;

    	if TObject(Node.Data) is TPasteItem then begin
        pItem := TPasteItem(Node.Data);
        pItem.Encode;

        SaveInt(fs, PASTE_ITEM);
        SaveInt(fs, Node.Level);
        pItem.SaveStream(fs);  
        if DataExport then pItem.Decode;
        if DataDispose then begin
          pItem.Free;
          Node.Data := nil;
        end;
      end;

    	Node := Node.GetNext;
    end;
    Result := True;
  finally
    fs.Free;
  end;
end;

procedure TMainForm.actDeleteExecute(Sender: TObject);
var
	Node: TTreeNode;
  Msg: string;
  res: Integer;
  i: Integer;
  bDlg: Boolean;
  procedure DeleatNodeEx(ANode: TTreeNode);
  begin
    DeleteNodeData(ANode);
    ANode.Delete;
  end;

begin
	if tvPaste.SelectionCount = 0 then Exit;
	if tvPaste.SelectionCount = 1 then begin
    Node := tvPaste.Selected;
    Msg := '"' + Node.Text + '" を削除してもいいですか？';
    if OptionRec.Standard.DeleteCheck then
      res := Application.MessageBox(PChar(Msg), '確認', MB_YESNO or MB_ICONQUESTION)
    else
      res := IDYes;

    case res of
      iDYes: begin
      	DeleatNodeEx(Node);
        FModified := True;
      end;
    end;

  end else begin
    bDlg := True;
    res := mrYes;

    for i := tvPaste.SelectionCount -1 downto 0 do begin
      Node := tvPaste.Selections[i];
      if bDlg then begin
        Msg := '"' + Node.Text + '" を削除してもいいですか？';
        if OptionRec.Standard.DeleteCheck then
          res := MessageDlg(msg, mtConfirmation, [mbYes,mbNo,mbAll,mbNoToAll], 0)
        else
          res := mrAll;

      end;
      case res of
        mrYes: begin
        	DeleatNodeEx(Node);
          FModified := True;
        end;
        mrAll: begin
          DeleatNodeEx(Node);
          bDlg := False;
          FModified := True;
        end;
        mrNoToAll: Break;
      end;
    end;
  end;
//  if not ((res = mrNoToAll) or (res = mrNo)) then SavingData;
end;

procedure TMainForm.DeleteNodeData(ANode: TTreeNode);
var
	i: Integer;
begin
	if TObject(ANode.Data) is TCategoryItem then begin
    TCategoryItem(ANode.Data).Free;
    if ANode.Count > 0 then begin
      for i := 0 to ANode.Count -1 do
        DeleteNodeData(ANode.Item[i]);
    end;
  end else if TObject(ANode.Data) is TFolderItem then begin
    TFolderItem(ANode.Data).Free;
    if ANode.Count > 0 then begin
      for i := 0 to ANode.Count -1 do
        DeleteNodeData(ANode.Item[i]);
    end;
  end else if TObject(ANode.Data) is TPasteItem then
    TPasteItem(ANode.Data).Free;
end;


procedure TMainForm.actOptionExecute(Sender: TObject);
begin
	OptionDlg := TOptionDlg.Create(Self);
  try
    with OptionDlg, OptionRec do begin
    	cbAutoExpand.Checked  := Standard.AutoExpand;
      cbDeleteCheck.Checked := Standard.DeleteCheck;
      cbStealth.Checked     := Standard.Stealth;
      cbExpanded.Checked    := Standard.Expanded;
      cbSound.Checked       := Standard.Sound;
      edtSoundFile.Text     := Standard.SoundFile;
      cbPass.Checked        := Standard.Pass;
      PassWord              := Standard.PassWord;

      cbHotTrack.Checked  := Display.HotTrack;
      cbPopHint.Checked   := Display.PopHint;
      cbTabPos.ItemIndex  := Ord(Display.TabPos);
      cbAnimation.Checked := Display.Animation;
      cbStealthTL.Checked := stTopLeft     in Display.Stealths;
      cbStealthTR.Checked := stTopRight    in Display.Stealths;
      cbStealthBL.Checked := stBottomLeft  in Display.Stealths;
      cbStealthBR.Checked := stBottomRight in Display.Stealths;

      cbClipEnabled.Checked := Clip.Enabled;
      cbReadHistory.Checked := Clip.ReadHistory;
      cbAddFirst.Checked    := Clip.AddFirst;
      seHistoryCount.Value  := Clip.Count;
      cbNotPasteData.Checked:= Clip.NotPasteData;

      if ShowModal = mrOK then begin
        Standard.AutoExpand  := cbAutoExpand.Checked;
        Standard.DeleteCheck := cbDeleteCheck.Checked;
        Standard.Stealth     := cbStealth.Checked;
        Standard.Expanded    := cbExpanded.Checked;
        Standard.Sound       := cbSound.Checked;
        Standard.SoundFile   := edtSoundFile.Text;
        if Standard.Pass <> cbPass.Checked then
        	FPassChangeFlag := True;
        Standard.Pass        := cbPass.Checked;
        Standard.PassWord    := PassWord;

        Display.HotTrack     := cbHotTrack.Checked;
        Display.PopHint      := cbPopHint.Checked;
        Display.TabPos       := TTabPos(cbTabPos.ItemIndex);
        Display.Animation    := cbAnimation.Checked;
        Display.Stealths     := [];
        if cbStealthTL.Checked then
          Display.Stealths := Display.Stealths + [stTopLeft];
        if cbStealthTR.Checked then
          Display.Stealths := Display.Stealths + [stTopRight];
        if cbStealthBL.Checked then
          Display.Stealths := Display.Stealths + [stBottomLeft];
        if cbStealthBR.Checked then
          Display.Stealths := Display.Stealths + [stBottomRight];

        if Clip.Enabled <> cbClipEnabled.Checked then
        Clip.Enabled     := cbClipEnabled.Checked;
        Clip.ReadHistory := cbReadHistory.Checked;
        Clip.AddFirst    := cbAddFirst.Checked   ;
        Clip.Count       := seHistoryCount.Value ;
        Clip.NotPasteData:= cbNotPasteData.Checked;

        SetOptionRec;  //設定反映
//	      SaveINI;
      end;
    end;
  finally
    OptionDlg.Release;
  end;
end;


procedure TMainForm.SetOptionRec;
var
	Tab: TTabSheet;
  i: Integer;
begin
  with OptionRec do begin
    tvPaste.AutoExpand := Standard.AutoExpand;

    tvPaste.HotTrack := Display.HotTrack;
    tvClip.HotTrack  := Display.HotTrack;
    Tab := PageControl1.ActivePage;
    if Display.TabPos = tpNone then begin
      tsPaste.TabVisible := False;
      tsClip.TabVisible  := False;
      PageControl1.ActivePage := Tab;
    end else begin
      tsPaste.TabVisible := True;
      tsClip.TabVisible  := True;
      case Display.TabPos of
        tpTop:    PageControl1.TabPosition := ComCtrls.tpTop;
        tpBottom: PageControl1.TabPosition := ComCtrls.tpBottom;
        tpLeft:   PageControl1.TabPosition := ComCtrls.tpLeft;
        tpRight:  PageControl1.TabPosition := ComCtrls.tpRight;
      end;
    end;
    if Display.PopHint <> ssbDate.ShowHint then
      for i := 0 to pnlOperation.ControlCount -1 do begin
        if pnlOperation.Controls[i] is TShineSpeedButton then begin
          TShineSpeedButton(pnlOperation.Controls[i]).ShowHint := Display.PopHint;
        end;
      end;
    
    if Clip.Enabled <> ClipboardWatcher1.Enabled then
    	ClipboardWatcher1.Enabled := Clip.Enabled;

    //パスワード無しのとき
    if Standard.Pass = False then begin
      Standard.PassWord := NOT_PASS;
    end;
  end;
end;

procedure TMainForm.ApplicationEvents1Activate(Sender: TObject);
begin
	CaretTimer.Enabled := False;
  StayOnTop(Handle);
end;

procedure TMainForm.ApplicationEvents1Deactivate(Sender: TObject);
begin
	CaretTimer.Enabled := True;
  FHintWnd.ReleaseHandle;
end;

procedure TMainForm.CaretTimerTimer(Sender: TObject);
begin
  FTargetWindow := GetForegroundWindow;
  
end;

procedure TMainForm.tsPasteShow(Sender: TObject);
begin
	actActivePaste.Checked := True;
  tbActivePaste.Down := True;
end;

procedure TMainForm.tsClipShow(Sender: TObject);
begin
	actActiveClip.Checked := True;
  tbActiveClip.Down := True;
end;

procedure TMainForm.actStealthExecute(Sender: TObject);
begin
  actStealth.Checked := not actStealth.Checked;
  if actStealth.Checked then begin
//  	AlphaBlend := True;
  	FAppRect     := Rect(Left, Top, Left + Width, Top + Height);
    FWorkRect    := Screen.WorkAreaRect;
    FDsktopRect  := Screen.DesktopRect;

		HideAnimation;
  	Visible := False;
    StealthTimer.Enabled := True;

    FFlagStealth := True;
  end else begin
  	StealthOFF;
  end;
end;

procedure TMainForm.StealthTimerTimer(Sender: TObject);
  procedure StealthLeft;
  begin
    Left   := FWorkRect.Left;
    Top    := FWorkRect.Top;
    Width  := (FAppRect.Right - FAppRect.Left);
    Height := (FWorkRect.Bottom - FWorkRect.Top);

		ShowAnimation;
    Show;
    StealthTimer.Enabled := False;
    StealthDspLeftTimer.Enabled := True;
  end;
  procedure StealthRight;
  begin
    Left := FWorkRect.Right - (FAppRect.Right - FAppRect.Left);
    Top := FWorkRect.Top;
    Width := FAppRect.Right - FAppRect.Left;
    Height := FWorkRect.Bottom - FWorkRect.Top;

    ShowAnimation;
    show;
    StealthTimer.Enabled := False;
    StealthDspRightTimer.Enabled := True;
  end;
var
	P: TPoint;
//  dspRect: TRect;
const
	DWIDTH = 5;
begin
  GetCursorPos(P);
  //左上
  if stTopLeft in OptionRec.Display.Stealths then
    if (P.X < FDsktopRect.Left + DWIDTH) and (P.Y < FDsktopRect.Top + DWIDTH) then begin
      StealthLeft;
    end;
  //左下
  if stBottomLeft in OptionRec.Display.Stealths then
  	if (P.X < FDsktopRect.Left + DWIDTH ) and (P.Y > FDsktopRect.Bottom - DWIDTH) then begin
      StealthLeft;
    end;
  //右上
  if stTopRight in OptionRec.Display.Stealths then
  	if (P.X > FDsktopRect.Right - DWIDTH) and (P.Y < FDsktopRect.Top + DWIDTH) then begin
      StealthRight;
    end;
  //右下
  if stBottomRight in OptionRec.Display.Stealths then
  	if (P.X > FDsktopRect.Right - DWIDTH) and (P.Y > FDsktopRect.Bottom - DWIDTH) then begin
      StealthRight;
    end;
end;

procedure TMainForm.StealthDspLeftTimerTimer(Sender: TObject);
var
	P: TPoint;
begin
  GetCursorPos(P);
  if (P.X < Left + Width) and (P.Y < FDsktopRect.Bottom) then Exit;
  HideAnimation;
  Visible := False;
  StealthDspLeftTimer.Enabled := False;
  StealthTimer.Enabled := True;
end;

procedure TMainForm.StealthDspRightTimerTimer(Sender: TObject);  
var
	P: TPoint;
begin
  GetCursorPos(P);
  if (P.X > Left) and (P.Y < FDsktopRect.Bottom) then Exit;
  HideAnimation;
  Visible := False;
  StealthDspRightTimer.Enabled := False;
  StealthTimer.Enabled := True;
end;

procedure TMainForm.StealthOFF;
begin
	if Visible then begin
    HideAnimation;
  end;
	
  StealthTimer.Enabled         := False;
  StealthDspLeftTimer.Enabled  := False;
  StealthDspRightTimer.Enabled := False;
  FFlagStealth                 := False;
  actStealth.Checked           := False;

  StayOnTop(Handle);

//  Left    := FAppRect.Left;
//  Top     := FAppRect.Top;
//  Width   := FAppRect.Right - FAppRect.Left;
//  Height  := FAppRect.Bottom - FAppRect.Top;
  SetBounds(FAppRect.Left,
  					FAppRect.Top,
            FAppRect.Right - FAppRect.Left,
            FAppRect.Bottom - FAppRect.Top);
  ShowAnimation;
  Show;
//  AlphaBlend := False;
end;

procedure TMainForm.HideAnimation;
//var
//	i: Integer;
begin
	//プラットフォームがNT系でかつWin2000,NTのとき
  if (Win32Platform <> VER_PLATFORM_WIN32_NT)	and
     (Win32MajorVersion <> 5) then Exit;
  if OptionRec.Display.Animation then begin
//  	SetLayeredExStyle(Handle, True);
    AnimateWindow(Handle, 500, AW_HIDE or AW_BLEND);
		hide;
//    SetLayeredExStyle(Handle, False);

//    i := 255;
//    while i >= 50 do begin
//      AlphaBlendValue := i;
//      Dec(i, 20);
//    end;
//    hide;
//    AlphaBlendValue := 255;
  end;
end;

procedure TMainForm.ShowAnimation;
//var
//	r: TRect;
//	i: Integer;
begin          
	//プラットフォームがNT系でかつWin2000,NTのとき
  if (Win32Platform <> VER_PLATFORM_WIN32_NT)	and
     (Win32MajorVersion <> 5) then Exit;
  if OptionRec.Display.Animation then begin
  	Hide;
    AnimateWindow(Handle, 500, AW_BLEND or AW_ACTIVATE);
    Show;
    
    RedrawWindow(handle, nil, 0, RDW_INVALIDATE or RDW_ALLCHILDREN); 


//    UpdateWindow(tvPaste.Handle);
//    Invalidate;
//    r := tvPaste.ClientRect;
//    InvalidateRect(tvPaste.Handle, @r, True);
//    tvPaste.Refresh;

//		i := 50;
//    AlphaBlendValue := i;
//    show;
//    while i <= 255 do begin
//      AlphaBlendValue := i;
//      Inc(i, 30);
//    end;
//    AlphaBlendValue := 255;
  end;
end;

procedure TMainForm.actHelpExecute(Sender: TObject);
var
	P: TPoint;
begin
  P.X := tbHelp.Left;
  P.Y := tbHelp.Top + tbHelp.Height;
  P := ClientToScreen(P);
//	GetCursorPos(P);
	HelpPopupMenu.Popup(P.X, P.Y);
end;

procedure TMainForm.actAbortExecute(Sender: TObject);
begin
	AboutBox := TAboutBox.Create(Self);
  try
//  AboutBox.Left := (Screen.Width - AboutBox.Width) div 2;
//  AboutBox.Top  := (Screen.Height - AboutBox.Height) div 2;
//  AnimateWindow(AboutBox.Handle, 300, AW_CENTER);
  	AboutBox.ShowModal;
//  AboutBox.Image1.Show;
  finally
    AboutBox.Release;
  end;
end;

procedure TMainForm.actBugReportExecute(Sender: TObject);
begin
	BugReportForm := TBugReportForm.Create(Self);
  try
    BugReportForm.ShowModal;
  finally
  	BugReportForm.Release;
  end;
end;

//function TMainForm.GetFocusInAnotherProcess(hWin: HWND): HWND;
//var //hWin: HWND;
//    TID, PID, MyID: Integer;
//begin
////  hWin := GetForegroundWindow;
//  TID := GetWindowThreadProcessID(hWin, @PID);
//  MyID := GetCurrentThreadID;
//  if AttachThreadInput(TID, MyID, True) then begin
//      SetForegroundWindow(hWin);
//      Result := GetFocus;
//      AttachThreadInput(TID, MyID, False);
//  end else Result := 0;
//end;


procedure TMainForm.Paste(sData: string);
begin

	SetForegroundWindow(FTargetWindow);
	try
    Clipboard.AsText := sData;
  except

  end;


  keybd_event(VK_CONTROL,0,0,0);
  keybd_event(Ord('V'),0,0,0);
  keybd_event(Ord('V'),0,KEYEVENTF_KEYUP,0);
  keybd_event(VK_CONTROL,0,KEYEVENTF_KEYUP,0);
//  SendKeys('^(V)', false);

end;

procedure TMainForm.Browse(sData: string);
begin
  Screen.Cursor := crHourGlass;
  try
    ShellExecute(0, 'open', PChar(sData), nil, nil, SW_SHOW);
//    HlinkNavigateString(nil,PWideChar(sData));
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.Execute(sData: string);
begin
  Screen.Cursor := crHourGlass;
  try
    ShellExecute(0, 'open', PChar(sData), nil, nil, SW_SHOWDEFAULT);
  finally
    Screen.Cursor := crDefault;
  end;                                 
end;

procedure TMainForm.PasteDown(sData: string);
begin
  Paste(sData);
  SendKeys('{DOWN}', True);
end;

procedure TMainForm.PasteEnter(sData: string);
begin
  Paste(sData);
  SendKeys('{ENTER}', True);
end;

procedure TMainForm.PasteLeft(sData: string);
begin
  Paste(sData);
  SendKeys('{LEFT}', True);
end;

procedure TMainForm.PasteRignt(sData: string);
begin
  Paste(sData);
  SendKeys('{RIGHT}', True);
end;

procedure TMainForm.PasteTab(sData: string);
begin
  Paste(sData);
  SendKeys('{TAB}', True);
end;

procedure TMainForm.PasteUp(sData: string);
begin
  Paste(sData);
  SendKeys('{UP}', True);
end;

procedure TMainForm.ToClip(sData: string);
begin
  Clipboard.AsText := sData;
end;

procedure TMainForm.actDayBtnExecute(Sender: TObject);
var
	s: string;
begin
	s := FormatDateTime(sDateType[FDateType], Now);
	Paste(s);    
  PlaySound;
end;

procedure TMainForm.actTimeBtnExecute(Sender: TObject);
var
	s: string;
begin
  s := FormatDateTime(sTimeType[FTimeType], Now);
  Paste(s);
  PlaySound;
end;

procedure TMainForm.actUpBtnExecute(Sender: TObject);
begin
	KeyEvente('{UP}');
end;

procedure TMainForm.KeyEvente(KeyString: string);
//var
//  AWH, TWH: HWND;
//  TTh, STh: DWORD;
//begin
////  TWH := GetForegroundWindow;
//  TTh := GetWindowThreadProcessId(FTargetWindow, nil);
//  STh := GetCurrentThreadId;
//  AttachThreadInput(STh, TTh, True);
//  AWH := GetFocus();
//
//  //SendChar1(AWH,s);
//  //SendChar2(AWH,s);
////  SendChar3(AWH,s);
//  SendKeys(PChar(KeyString), True);
//  AttachThreadInput(STh, TTh, False);
begin
  SetForegroundWindow(FTargetWindow);
  SendKeys(PChar(KeyString), True);
end;

procedure TMainForm.actDownBtnExecute(Sender: TObject);
begin
  KeyEvente('{DOWN}');
end;

procedure TMainForm.actLeftBtnExecute(Sender: TObject);
begin
	KeyEvente('{LEFT}');
end;

procedure TMainForm.actRightBtnExecute(Sender: TObject);
begin
	KeyEvente('{RIGHT}');
end;

procedure TMainForm.actEnterBtnExecute(Sender: TObject);
begin
	KeyEvente('{ENTER}');
end;

procedure TMainForm.actTabBtnExecute(Sender: TObject);
begin
	KeyEvente('{TAB}');
end;

procedure TMainForm.actDeleteBtnExecute(Sender: TObject);
begin
	KeyEvente('{DELETE}');
end;

procedure TMainForm.actBackSpaceBtnExecute(Sender: TObject);
begin
  KeyEvente('{BS}');
end;

procedure TMainForm.actSpaceBtnExecute(Sender: TObject);
begin
	if AllSpaseMenu.Checked then begin
    Paste('　');
  end else begin
    Paste(' ');
  end;
  
end;


procedure TMainForm.ssbDateMouseEnter(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	if TObject(Sender) is TShineSpeedButton then begin
    TShineSpeedButton(Sender).Colors.Color := clBtnHighlight;
  end;
end;

procedure TMainForm.ssbDateMouseLeave(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
	if TObject(Sender) is TShineSpeedButton then begin
    TShineSpeedButton(Sender).Colors.Color := clBtnFace;
  end;
end;

procedure TMainForm.ssbSpaceMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	P: TPoint;
begin
	if Button = mbRight then begin
  	P.X := ssbSpace.Left - 12;
    P.Y := ssbSpace.Top + ssbSpace.Height;
    P := pnlOperation.ClientToScreen(P);
    SpacePopupMenu.Popup(P.X, P.Y);
  end;
end;

procedure TMainForm.AllSpaseMenuClick(Sender: TObject);
begin
	if HerfSpaceMenu.Checked then begin
    AllSpaseMenu.Checked := not AllSpaseMenu.Checked;
    FSpaceType := 0;
  end;
end;

procedure TMainForm.HerfSpaceMenuClick(Sender: TObject);
begin
	if AllSpaseMenu.Checked then begin
    HerfSpaceMenu.Checked := not HerfSpaceMenu.Checked;
    FSpaceType := 1;
  end;
end;

procedure TMainForm.AddDate(Pop: TPopupMenu);
var
	i: Integer;
  mnuItem: TMenuItem;
begin
	DatePopupMenu.Items.Clear;
  for i := Low(sDateType) to High(sDateType) do begin
  	mnuItem := TMenuItem.Create(Pop);
  	mnuItem.Caption := FormatDateTime(sDateType[i], Now);
    mnuItem.RadioItem := True;
    mnuItem.OnClick := DateMenuClick;
    Pop.Items.Add(mnuItem);
  end;
end;

procedure TMainForm.AddTime(Pop: TPopupMenu);
var
	i: Integer;
  mnuItem: TMenuItem;
begin
	DatePopupMenu.Items.Clear;
  for i := Low(sTimeType) to High(sTimeType) do begin
  	mnuItem := TMenuItem.Create(Pop);
  	mnuItem.Caption := FormatDateTime(sTimeType[i], Now);
    mnuItem.RadioItem := True;
    mnuItem.OnClick := TimeMenuClick;
    Pop.Items.Add(mnuItem);
  end;
end;

procedure TMainForm.ssbDateMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
	P: TPoint;
begin
	if Button = mbRight then begin
  	P.X := ssbDate.Left - 105;
    P.Y := ssbDate.Top + ssbDate.Height;
    P := pnlOperation.ClientToScreen(P);
  	AddDate(DatePopupMenu);
    DatePopupMenu.Items[FDateType].Checked := True;
    DatePopupMenu.Popup(P.X, P.Y);
  end;
end;


procedure TMainForm.ssbTimeMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	P: TPoint;
begin
	if Button = mbRight then begin
  	P.X := ssbTime.Left - 60;
    P.Y := ssbTime.Top + ssbTime.Height;
    P := pnlOperation.ClientToScreen(P);
  	AddTime(DatePopupMenu);
    DatePopupMenu.Items[FTimeType].Checked := True;
    DatePopupMenu.Popup(P.X, P.Y);
  end;
end;

procedure TMainForm.DateMenuClick(Sender: TObject);
begin
	if TObject(Sender) is TMenuItem then begin
    if TMenuItem(Sender).Checked = False then begin
      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
      FDateType := TMenuItem(Sender).MenuIndex;
      ChangeControlBtnHint;
    end;
  end;
end;

procedure TMainForm.TimeMenuClick(Sender: TObject);
begin
	if TObject(Sender) is TMenuItem then begin
    if TMenuItem(Sender).Checked = False then begin
      TMenuItem(Sender).Checked := not TMenuItem(Sender).Checked;
      FTimeType := TMenuItem(Sender).MenuIndex;
      ChangeControlBtnHint;
    end;
  end;
end;
procedure TMainForm.actFileExecute(Sender: TObject);
var
	P: TPoint;
begin
  P.X := tbFile.Left;
  P.Y := tbFile.Top + tbFile.Height;
  P := ClientToScreen(P);
  FilePopupMenu.Popup(P.X, P.Y);
end;

procedure TMainForm.actExportExecute(Sender: TObject);
begin
	ExportForm := TExportForm.Create(Self);
  try
    ExportForm.ShowModal;
  finally
    ExportForm.Release;
  end;
end;

procedure TMainForm.actImportExecute(Sender: TObject);
  procedure ReadPass(FileName: string; var PassWord: string; var Pass: Boolean);
  var
  	fs: TFileStream;
    s: string;
    i: Integer;
  begin
    if FileExists(FileName) then begin
      fs := TFileStream.Create(FileName, fmOpenRead or fmShareExclusive);
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
var
	PassWord: string;
  Pass: Boolean;
begin
	if OpenDialog1.Execute then begin
		ImportForm := TImportForm.Create(Self);
    try
    	Screen.Cursor := crHourGlass;
      tvPaste.Items.BeginUpdate;
    	try
      	ReadPass(OpenDialog1.FileName, PassWord, Pass);
        if (Pass = False) and (PassWord = NOT_PASS) then begin
          LoadData(ImportForm.TreeView1, OpenDialog1.FileName, True);
        end else begin
          Application.MessageBox('このファイルはパスワードで保護されています。',
                                 PChar(Application.Title),
                                 MB_ICONEXCLAMATION);
          Exit;
        end;
        
//        LoadData(tvPaste, OpenDialog1.FileName, True);
      finally
      	tvPaste.Items.EndUpdate;
        Screen.Cursor := crDefault;
      end;

      ImportForm.ShowModal;
    finally
    	ImportForm.Release;
    end;
  end;
end;

procedure TMainForm.ClipboardWatcher1Change(Sender: TObject);
var
	Tmp: string;
  clpIem: TClipItem;
  i: Integer;
  Node: TTreeNode;
  AddFlag: Boolean;
begin             
  if ((GetTickCount - ClipFinishTime) < 200) then begin
    ClipFinishTime := GetTickCount;
    ClipboardWatcher1.Enabled := False;
    Application.ProcessMessages;
    ClipboardWatcher1.Enabled := True;
    Exit;
  end;
  //ｸﾘｯﾌﾟﾎﾞｰﾄﾞにﾃｷｽﾄﾃﾞｰﾀがあれば取得する。
  if Clipboard.HasFormat(CF_TEXT) then Tmp:= ClipBoard.AsText else Exit;
  if OptionRec.Clip.NotPasteData and (FOldPasteString = Tmp) then Exit;

  tvClip.Items.BeginUpdate;

  clpIem := TClipItem.Create;
  clpIem.Name := Tmp;
  clpIem.Data := Tmp;
  if OptionRec.Clip.AddFirst then begin
    for i := tvClip.Items.Count -1 downto 0 do begin
      Node := tvClip.Items[i];
      if TClipItem(Node.Data).Data = Tmp then begin
        TClipItem(Node.Data).Free;
        Node.Delete;
      end;
    end;
    tvClip.Items.AddObjectFirst(nil, clpIem.Name, Pointer(clpIem));
  end else begin
    AddFlag := True;
    for i := tvClip.Items.Count -1 downto 0 do begin
      Node := tvClip.Items[i];
      if TClipItem(Node.Data).Data = Tmp then begin
        AddFlag := False;
        Break;
      end;
    end;
    if AddFlag then
      tvClip.Items.AddObjectFirst(nil, clpIem.Name, Pointer(clpIem));
  end;
  if tvClip.Items.Count > Integer(OptionRec.Clip.Count) then begin
    for i := tvClip.Items.Count -1 downto OptionRec.Clip.Count do begin
      Node := tvClip.Items[i];
      TClipItem(Node.Data).Free;
      Node.Delete;
    end;
  end;

  tvClip.Items.EndUpdate;  
  ClipFinishTime := GetTickCount;


//  ShowMessage(tmp);
end;

//procedure TMainForm.DeleteClipItemData;
//var
//  Node: TTreeNode;
//begin
//  Node := tvClip.Items.GetFirstNode;
//  while Node <> nil do begin
//    TClipItem(Node.Data).Free;
//  	Node := Node.GetNext;
//  end;
//end;

procedure TMainForm.LoadClipData(TreeView: TTreeView; DataFile: string);
var
  fs: TFileStream;
  clpItem: TClipItem;
  Day: TDateTime;
  Count: Integer;
  i: Integer;
  s: string;
begin
	if FileExists(DataFile) = False then Exit;
	fs := TFileStream.Create(DataFile, fmOpenRead	or fmShareExclusive);
  try
  	ReadStr(fs, s);
    ReadInt(fs, Count);

    for i := 0 to Count -1 do begin
      clpItem := TClipItem.Create;
      ReadStr(fs, s);
      clpItem.Name := s;
      clpItem.Data := s;
      clpItem.Decode;
    	fs.read(Day, SizeOf(Day));
      clpItem.CreateDay := Day;

      TreeView.Items.AddObject(nil, clpItem.Name, Pointer(clpItem));
    end;

  finally
    fs.Free;
  end;
end;

procedure TMainForm.SaveClipData(TreeView: TTreeView; DataFile: string);
var
	Node: TTreeNode;
  fs: TFileStream;
  clpItem: TClipItem;
  Day: TDateTime;
begin
	fs := TFileStream.Create(DataFile, fmCreate	or fmShareExclusive);
  try
  	SaveStr(fs, FILE_HEADER);
    SaveInt(fs, TreeView.Items.Count);

    Node := TreeView.Items.GetFirstNode;
    while Node <> nil do begin
    	clpItem := TClipItem(Node.Data);
      clpItem.Encode;
//      SaveStr(fs, clpItem.Name);
      SaveStr(fs, clpItem.Data);
      Day := clpItem.CreateDay;
      fs.Write(day, SizeOf(day)) ;
//      SaveInt(fs, Integer(clpItem.CreateDay));
      clpItem.Free;

      Node := Node.GetNext;
    end;
  finally
    fs.Free;
  end;

end;

//procedure TMainForm.ShowTextPopup(s: string);
//var
//	p: TPoint;
//	ARect: TRect;
//begin
//	if Trim(s) = '' then Exit;
//  try
//    GetCursorPos(p);
//    ARect := FHintWnd.CalcHintRect(Screen.Width, s, nil);
//    OffsetRect(ARect, p.x + 15, p.y + 15);
//    FHintWnd.ActivateHint(ARect, s);
//  except
//    FHintWnd.ReleaseHandle;
//  end;
//
//end;

procedure TMainForm.tvPasteMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);  
//var
//	Node: TTreeNode;
begin
//	if AlphaBlend then AlphaBlend := False;
	Application.OnShowHint := AppShowHintTree;
  FHintWnd.ReleaseHandle;

  if Sender = tvPaste then begin
//    Node := tvPaste.GetNodeAt(X, Y);
//  	FMouseDownNode := Node.AbsoluteIndex;
//    Memo1.Lines.Add(IntToStr(Node.AbsoluteIndex));
    if (ssLeft in Shift) and (TTreeView(Sender).Selected <> nil) then
    begin
      if (Abs(FMDPt.X - X) > 5) or (Abs(FMDPt.Y -Y) > 5) then
      begin
        FDragFlag := True;
        TTreeView(Sender).BeginDrag(True);
      end;
    end;
  end;
  
end;


//procedure TMainForm.WMSetCursor(var Message: TWMSetCursor);
//begin
//	if Message.CursorWnd = tvPaste.Handle then Exit;
//  if Message.CursorWnd = tvClip.Handle then Exit;
//	if (IsWindowVisible(FHintWnd.Handle)) and (FHintWnd <> nil) then
//		FHintWnd.ReleaseHandle;
//	Message.Result := 1;
//	inherited;
//end;

procedure TMainForm.AppShowHintTree(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
  function GetHintComment(s: string): string;
  begin
    if Trim(s) = '' then
      Result := '' else
      Result := #13#10 + '--------------------------' + #13#10 + s;
  end;
  function GetHintCreateDay(d: TDateTime): string;
  begin
    Result := #13#10 + '作成日時: ' + FormatDateTime('yyyy/mm/dd hh:nn:ss', d);
  end;
  function GetHintUpdateDay(d: TDateTime): string;
  begin
    Result := #13#10 + '更新日時: ' + FormatDateTime('yyyy/mm/dd hh:nn:ss', d);
  end;
  function GetHintUseCount(n: Integer): string;
  begin
    Result := #13#10 + Format('使用回数: %d回', [n]);
  end;
var
  sHint: widestring;
  Node: TTreeNode;
  cItem: TCategoryItem;
  fItem: TFolderItem;
  pItem: TPasteItem;
  clpItem: TClipItem;
  p: TPoint;
  r: TRect;

begin
	if not OptionRec.Display.PopHint then Exit;
	CanShow := True;
  GetCursorPos(p);
  p := TTreeView(HintInfo.HintControl).ScreenToClient(p);
	Node := TTreeView(HintInfo.HintControl).GetNodeAt(p.X, p.Y);
//  p := tvPaste.ScreenToClient(p);
//	Node := tvPaste.GetNodeAt(p.X, p.Y);
  if (Node = nil) then begin
    Exit;
  end;
  r := Node.DisplayRect(True);
  HintInfo.CursorRect := r;
    HintInfo.HideTimeout := MaxInt;
//    HintInfo.ReshowTimeout := 300;
    HintInfo.HintMaxWidth := Screen.Width;


  if TObject(Node.Data) is TCategoryItem then begin
    cItem := TCategoryItem(Node.Data);
    sHint := cItem.Name +
             GetHintCreateDay(cItem.CreateDay) +
             GetHintComment(cItem.Comment);
  end;

  if TObject(Node.Data) is TFolderItem then begin
    fItem := TFolderItem(Node.Data);
    sHint := fItem.Name +
             GetHintCreateDay(fItem.CreateDay) +
             GetHintComment(fItem.Comment);
  end;

  if TObject(Node.Data) is TPasteItem then begin
    pItem := TPasteItem(Node.Data);
    sHint := pItem.Name +
             GetHintUseCount(pItem.UseCount) +
             GetHintCreateDay(pItem.CreateDay) +
             GetHintUpdateDay(pItem.UpdateDay) + #13#10 + 
             #13#10 + pItem.PasteData +
             GetHintComment(pItem.Comment);
  end;

  if TObject(Node.Data) is TClipItem then begin
    clpItem := TClipItem(Node.Data);
    sHint := clpItem.Data + #13#10 +
    		     '-----------------------------' +
             GetHintCreateDay(clpItem.CreateDay);
  end;
  HintStr := sHint;
//  if Length(sHint) >= 1000 then sHint := Copy(sHint, 1, 1000);

end;

procedure TMainForm.tbFileMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
	s: string;
	r: TRect;
  p: TPoint;
begin
	if not OptionRec.Display.PopHint then Exit;
  if FHintWnd.HandleAllocated then Exit;
  s := TToolButtonEx(Sender).Hint;
  if ShortCutToText(TAction(TToolButtonEx(Sender).Action).ShortCut) <> '' then
  	s := s + #13#10 + ShortCutToText(TAction(TToolButtonEx(Sender).Action).ShortCut);
  r := FHintWnd.CalcHintRect(Screen.Width, s, nil);
  p := Point(tvPaste.Left, tvPaste.Top);
  p := tvPaste.ClientToScreen(p);
  OffsetRect(r, p.X, p.Y);
  FHintWnd.ActivateHint(r, s);
end;


procedure TMainForm.tbFileMouseLeave(Sender: TObject);
begin
	if not OptionRec.Display.PopHint then Exit;
	FHintWnd.ReleaseHandle;
end;

procedure TMainForm.tvPasteMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
	Node: TTreeNode;
begin
  FDragFlag := False;
	FMDPt := Point(X, Y);

	Node := TTreeViewEx(Sender).GetNodeAt(X, Y);   //ShowMessage(IntToStr(Node.AbsoluteIndex));
  if Node = nil then Exit;
  
	if OptionRec.Standard.AutoExpand and (TObject(Node.Data) is TPasteItem) then begin
   FCollapsedFlag := False;
  end else FCollapsedFlag := True;

	if Button = mbRight then begin
    Node.Selected := True;
    Exit;
  end;
  //TCustomTreeView.AutoExpand := True;の時の意図しないノードがクリックされる
  //不具合の修正
  if tvPaste.AutoExpand then begin
    if tvPaste.Selected = Node then
      tvPaste.OnMouseUp:= tvPasteMouseUp
    else tvPaste.OnMouseUp := nil;
  end else tvPaste.OnMouseUp:= tvPasteMouseUp;

//  Memo2.Lines.Add('dwn');

//  if TObject(Node.Data) is TCategoryItem then begin
//    tvPaste.OnClick := nil;
//    Exit;
//  end;
//  if TObject(Node.Data) is TFolderItem then begin
//    tvPaste.OnClick := nil;
//    Exit;
//  end;
//  if TObject(Node.Data) is TPasteItem then tvPaste.OnClick := tvPasteClick;
end;

procedure TMainForm.tvPasteChange(Sender: TObject; Node: TTreeNode);
begin
//  tvPaste.OnClick:= tvPasteClick;
end;

procedure TMainForm.tvPasteDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
	selNode, tarNode, tmpNode: TTreeNode;
//  r{, r2}: TRect;
//  hDragImage: HIMAGELIST;
const
	INSERTMARK_HEIGHT = 6;
  PAI = 3;
begin

//	tvPaste.MultiSelect := False;
//	tvPaste.OnClick := nil;

	Accept := True;
  selNode := tvPaste.Selected;
  tarNode := tvPaste.GetNodeAt(X, Y);
//  TreeView_SelectDropTarget(tarNode.Handle, nil);
//  tarNode.DropTarget := False;
//  hDragImage := TreeView_CreateDragImage(tvPaste.Handle, selNode.ItemId);
//  ImageList_BeginDrag(hDragImage, 0,0,0);
  if tarNode = nil then begin
    Accept := False;
  	Exit;
  end;

  if TObject(selNode.Data) is TCategoryItem then begin
    if TObject(tarNode.Data) is TCategoryItem then Accept := True;
    if TObject(tarNode.Data) is TFolderItem   then Accept := False;
    if TObject(tarNode.Data) is TPasteItem    then Accept := False;
  end;

  if TObject(selNode.Data) is TFolderItem then begin
    if TObject(tarNode.Data) is TCategoryItem then Accept := True;
    if TObject(tarNode.Data) is TFolderItem   then Accept := True;
    if TObject(tarNode.Data) is TPasteItem    then Accept := False;
  end;

  if TObject(selNode.Data) is TPasteItem then begin
    if TObject(tarNode.Data) is TCategoryItem then Accept := True;
    if TObject(tarNode.Data) is TFolderItem   then Accept := True;
    if TObject(tarNode.Data) is TPasteItem    then Accept := True;
  end;

  //親ノードが子ノードにD&Dされるのを防ぐ
  tmpNode := tarNode;
  while (tmpNode.Parent <> nil) and (tmpNode <> selNode) do
    tmpNode := tmpNode.Parent;
  if tmpNode = selNode then Accept := False;

  //スクロール
  if (X >= 0) and (X <= tvPaste.Width) and (Y >= 0) and (Y <= 20) then begin
    UPTimer.Enabled := True;
    DOWNTimer.Enabled := False;
  end else if (X >= 0) and (X <= tvPaste.Width) and
              (Y >= tvPaste.Height - 20) and (Y <= tvPaste.Height) then begin
    UPTimer.Enabled := False;
    DOWNTimer.Enabled := True;
  end else begin
    ScrollEnd;
  end;

//  r := tarNode.DisplayRect(False);
//  tmpNode := tarNode.GetNextVisible;
//  if tmpNode <> nil then begin
//    r2 := tmpNode.DisplayRect(False);
//    r2 := Rect(r2.Left - PAI, r2.Top - PAI, r2.Right + PAI, r2.Bottom + PAI + 10);
//    InvalidateRect(tvPaste.Handle, @r2, false);
//  //  RedrawWindow( tvPaste.Handle, @r2, 0, RDW_INVALIDATE or RDW_UPDATENOW or RDW_ERASE );
//  end;

//	r2 := selNode.DisplayRect(True);
//  r2 := Rect(X - 20, Y, (X + (r2.Right - r2.Left)) + 30, (Y + (r2.Bottom - r2.Top)) + 12);
//	r2 := Rect(0, Y, tvPaste.Width, Y + 40);
//  InvalidateRect(tvPaste.Handle, @r2, True);

//  if (X >= r.Left) and (X <= r.Right) and
//     (Y >= r.Top) and (Y <= r.Top + INSERTMARK_HEIGHT) then begin
////    TreeView_SetInsertMark(tvPaste.Handle, Integer(tarNode.ItemID), False);
//		tvPaste.BoundaryLine := bsTop;
//  end;
//
//  if (X >= r.Left) and (X <= r.Right) and
//     (Y >= r.Bottom - INSERTMARK_HEIGHT) and (Y <= r.Bottom) then begin
////  	TreeView_SetInsertMark(tvPaste.Handle, Integer(tarNode.ItemID), True);
//		tvPaste.BoundaryLine := bsBottom;
//  end;
//
//  if (X >= r.Left) and (X <= r.Right) and
//     (Y > r.Top + INSERTMARK_HEIGHT) and (Y < r.Bottom - INSERTMARK_HEIGHT) then begin
////    TreeView_SetInsertMark(tvPaste.Handle, 0, True);
////    tarNode.Selected := False;
//		tvPaste.BoundaryLine := bsNone;
////    tarNode.DropTarget := False;
//  end;


end;

procedure TMainForm.actAlpaUpExecute(Sender: TObject);
begin
	Sort(smAlphaUp);
end;

procedure TMainForm.Sort(SortMode: TSortMode);
//var
//	SortProc: procedure (SortMode: TSortMode);
begin
with tvPaste do begin
  Items.BeginUpdate;

  CustomSort(nil,Ord(SortMode));
//  case SortMode of
//    smAlphaUp:      CustomSort(nil, Ord(smAlphaUp));
//    smAlphaDown:    CustomSort(nil, Ord(smAlphaDown));
//    smDayUp:        CustomSort(nil, Ord(smDayUp));
//    smDayDown:      CustomSort(nil, Ord(smDayDown));
//    smUseCountUp:   CustomSort(nil, Ord(smUseCountUp));
//    smUseCountDown: CustomSort(nil, Ord(smUseCountDown));
//  end;

  CustomSort(nil, Ord(smFolder));
  Items.EndUpdate;
  Application.ProcessMessages;
  FModified := True;
end;

end;

procedure TMainForm.tvPasteCompare(Sender: TObject; Node1,
  Node2: TTreeNode; Data: Integer; var Compare: Integer);

  function FolderCompare(N1, N2: TTreeNode): Integer;
  const
  	CATEGORY_ITEM = 0;
    FOLDER_ITEM = 3;
    PASTE_ITEM = 5;
  var
    No1, No2: Integer;
  begin
    if TObject(N1.Data) is TCategoryItem then
      No1 := CATEGORY_ITEM
    else if TObject(N1.Data) is TFolderItem then
      No1 := FOLDER_ITEM
    else
      No1 := PASTE_ITEM;

    if TObject(N2.Data) is TCategoryItem then
      No2 := CATEGORY_ITEM
    else if TObject(N2.Data) is TFolderItem then
      No2 := FOLDER_ITEM
    else
      No2 := PASTE_ITEM;

    Result := No1 - No2;
  end;

  function CreateDayCompare(N1, N2: TTreeNode): Integer;
  var
    No1, No2: TDateTime;
  begin
    if TObject(N1.Data) is TCategoryItem then
      No1 := TCategoryItem(N1.Data).CreateDay
    else if TObject(N1.Data) is TFolderItem then
      No1 := TFolderItem(N1.Data).CreateDay
    else
    	No1 := TPasteItem(N1.Data).CreateDay;

    if TObject(N2.Data) is TCategoryItem then
      No2 := TCategoryItem(N2.Data).CreateDay
    else if TObject(N2.Data) is TFolderItem then
      No2 := TFolderItem(N2.Data).CreateDay
    else
      No2 := TPasteItem(N2.Data).CreateDay;

    Result := DateTimeToFileDate(No1) - DateTimeToFileDate(No2);
  end;

  function UseCountCompare(N1, N2: TTreeNode): Integer;
  var
    No1, No2: Integer;
  begin
    if TObject(N1.Data) is TPasteItem then
      No1 := TPasteItem(N1.Data).UseCount
    else
      No1 := 0;
    
    if TObject(N2.Data) is TPasteItem then
      No2 := TPasteItem(N2.Data).UseCount
    else
      No2 := 0;

    Result := No1 - No2;
  end;
begin
  case TSortMode(Data) of
    smNone:         Compare := 0;
    smFolder:       Compare := FolderCompare(Node1, Node2);
    smAlphaUp:      Compare := AnsiCompareStr(Node1.Text, Node2.Text);
    smAlphaDown:    Compare := AnsiCompareStr(Node2.Text, Node1.Text);
    smDayUp:        Compare := CreateDayCompare(Node1, Node2);
    smDayDown:      Compare := CreateDayCompare(Node2, Node1);
    smUseCountUp:   Compare := UseCountCompare(Node1, Node2);
    smUseCountDown: Compare := UseCountCompare(Node2, Node1);
  end;

end;

procedure TMainForm.actAlphDownExecute(Sender: TObject);
begin
	sort(smAlphaDown);
end;

procedure TMainForm.actDayUpExecute(Sender: TObject);
begin
	Sort(smDayUp);
end;

procedure TMainForm.actDayDownExecute(Sender: TObject);
begin
	Sort(smDayDown);
end;

procedure TMainForm.actUseCountUpExecute(Sender: TObject);
begin
	Sort(smUseCountUp);
end;

procedure TMainForm.actUseCountDownExecute(Sender: TObject);
begin
	Sort(smUseCountDown);
end;

procedure TMainForm.tvPasteDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
	selNode, tarNode: TTreeNode;
begin
	selNode := tvPaste.Selected;
  tarNode := tvPaste.GetNodeAt(X, Y);
  if tarNode = nil then Exit;
                            

  if TObject(selNode.Data) is TCategoryItem then begin
    if TObject(tarNode.Data) is TCategoryItem then selNode.MoveTo(tarNode, naInsert);
    if TObject(tarNode.Data) is TFolderItem   then Exit;
    if TObject(tarNode.Data) is TPasteItem    then Exit;
  end;

  if TObject(selNode.Data) is TFolderItem then begin
    if TObject(tarNode.Data) is TCategoryItem then selNode.MoveTo(tarNode, naAddChild);
    if TObject(tarNode.Data) is TFolderItem   then selNode.MoveTo(tarNode, naAddChild);
    if TObject(tarNode.Data) is TPasteItem    then selNode.MoveTo(tarNode, naInsert);
  end;

  if TObject(selNode.Data) is TPasteItem then begin
    if TObject(tarNode.Data) is TCategoryItem then selNode.MoveTo(tarNode, naAddChild);
    if TObject(tarNode.Data) is TFolderItem   then selNode.MoveTo(tarNode, naAddChild);
    if TObject(tarNode.Data) is TPasteItem    then selNode.MoveTo(tarNode, naInsert);
  end;
  
//	tvPaste.MultiSelect := True;
  ScrollEnd;

end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  StayOnTop(Handle);
end;

procedure TMainForm.PlaySound;
begin
  //サウンド再生
  with OptionRec.Standard do
    if Sound and (FileExists(SoundFile)) then begin
      sndPlaySound(nil, SND_ASYNC);
      sndPlaySound(PChar(SoundFile), SND_ASYNC);
    end;
end;

procedure TMainForm.tvPasteMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
//	p: TPoint;
	Node: TTreeNode;
  pItem: TPasteItem;
  clpItem: TClipItem;
  s: string;
begin
  try
    if FDragFlag then Exit;
    if FExpandFlag and (OptionRec.Standard.AutoExpand = False) then Exit;
    if not (TObject(Sender) is TTreeView) then Exit;

    Node := TTreeView(Sender).GetNodeAt(X, Y);
    if Node = nil then Exit;
    //Node展開時の不具合修正
    if TObject(Node.Data) is TCategoryItem then Exit;
    if TObject(Node.Data) is TFolderItem then Exit;
    //Pasteﾃﾞｰﾀの時
    if TObject(Node.Data) is TPasteItem then begin
      pItem := TPasteItem(Node.Data);
      s := pItem.PasteData;
      FOldPasteString := s;
      case pItem.PasteMode of
        pmPaste:      Paste(s);
        pmPasteTab:   PasteTab(s);
        pmPasteEnter: PasteEnter(s);
        pmPasteUp:    PasteUp(s);
        pmPasteDown:  PasteDown(s);
        pmPasteLeft:  PasteLeft(s);
        pmPasteRight: PasteRignt(s);
        pmClip:       ToClip(s);
        pmBrowse:     Browse(s);
        pmExecute:    Execute(s);
      end;
      pItem.UseCount := pItem.UseCount + 1;

      PlaySound;
      Sleep(100);
    end;

    //Clipﾃﾞｰﾀの時
    if TObject(Node.Data) is TClipItem then begin
      clpItem := TClipItem(Node.Data);
      s := clpItem.Data;
      Paste(s);

      PlaySound;
      Sleep(100);
    end;

  finally
    FDragFlag := False;
    FExpandFlag := False;
  end;

end;


procedure TMainForm.UPTimerTimer(Sender: TObject);
begin
	SendMessage(tvPaste.Handle, WM_VSCROLL, SB_LINEUP, 0);
  tvPaste.Invalidate;
end;

procedure TMainForm.DOWNTimerTimer(Sender: TObject);
begin
	SendMessage(tvPaste.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
  tvPaste.Invalidate;
end;

procedure TMainForm.tvPasteMouseLeave(Sender: TObject);
begin
  ScrollEnd;
end;

procedure TMainForm.ScrollEnd;
begin
  UPTimer.Enabled := False;
  DOWNTimer.Enabled := False;
end;

procedure TMainForm.actClipToPasteDataExecute(Sender: TObject);
begin
	SetPasteData(True);
end;

procedure TMainForm.CheckClipBoard;
begin
  if Clipboard.AsText = '' then begin
    Application.MessageBox('クリップボードに有効なデータがありません。',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
    Abort;
  end;
end;



procedure TMainForm.actClipToCategoryExecute(Sender: TObject);
begin
	SetCategoryData(True);
end;

procedure TMainForm.actClipToFolderExecute(Sender: TObject);
begin
	SetFolderData(True);
end;

procedure TMainForm.actInfoExecute(Sender: TObject);
begin
//	CpuInfoDialog(Handle, 0);
  Paste(GetPlatformInfo);
  PlaySound;
end;

function TMainForm.GetPlatformInfo: string;
//var
//  MemStat:TMemoryStatus;
//  TotalMemory,
//  UseMemory,
//  AvailMemory,
//  MemoryLoad,
//  TotalPageFile,
//  UsePageFile,
//  AvailPageFile
//{  TotalVirtual,
//  AvailVirtual}
//  : string;
//  DskhWnd,
//  nhDc,
//  nWidth,
//  nHeight ,
//  Bit : Integer;
begin
//  {メモリ情報を得る}
//  MemStat.dwLength:=SizeOf(TMemoryStatus);
//  GlobalMemoryStatus(MemStat);
//
//  {メモリの計算}
//  //物理メモリ
//  TotalMemory := FormatFloat('#,##0KB',Round(MemStat.dwTotalPhys/1024));
//  //使用メモリ
//  UseMemory :=   FormatFloat('#,##0KB',Round((MemStat.dwTotalPhys - MemStat.dwAvailPhys)/1024));
//  //使用可能メモリ
//  AvailMemory := FormatFloat('#,##0KB',Round(MemStat.dwAvailPhys/1024));
//  //メモリ使用率
//  MemoryLoad := IntToStr(MemStat.dwMemoryLoad) + '%';
//  //ページファイル
//  TotalPageFile := FormatFloat('#,##0KB',Round(MemStat.dwTotalPageFile/1024));
//  //ページファイル使用量
//  UsePageFile := FormatFloat('#,##0KB',Round((MemStat.dwTotalPageFile - MemStat.dwAvailPageFile)/1024));
//  //ページファイル空き容量
//  AvailPageFile := FormatFloat('#,##0KB',Round(MemStat.dwAvailPageFile/1024));
//  //仮想メモリ
////  TotalVirtual := FormatFloat('#,##0KB',Round(MemStat.dwTotalVirtual/1024));
//  //未使用仮想メモリ
////  AvailVirtual := FormatFloat('#,##0KB',Round(MemStat.dwAvailVirtual/1024));
//
//  //解像度を取得する処理
//  //デスクトップのハンドルを取得
//  DskhWnd := GetDesktopWindow;
//  //デスクトップのデバイスコンテキストハンドルを取得
//  nhDc := GetDC(DskhWnd);
//  //画面の横幅を取得
//  nWidth := GetDeviceCaps(nhDc, HORZRES);
//  //画面の縦幅を取得
//  nHeight := GetDeviceCaps(nhDc, VERTRES);
//  //ピクセル当たりのビット数を取得
//  Bit := GetDeviceCaps(nhDc, BITSPIXEL);
////  ShowMessage('画面の領域' + IntTostr(nWidth) + 'X' + IntTostr(nHeight) + #13#10 +'画面の色' +IntToStr(Bit) + 'ビット');
////  s := CPUInfo1.CpuClock;
//
//  Result :=
//  				  'CPU　　　　　　　　　 : ' + string(ProcessorName) + #13#10 +
//            'CPU Clock　　　　　　 : ' + FormatFloat('#.##MHz', GetFrequency(2)) + #13#10 +
//            'CPU Family　　　　　　: ' + IntToStr(FamilyNumber) + #13#10 +
//            'CPU Model　　　　　　 : ' + IntToStr(ModelNumber) + #13#10 +
//            'CPU Step　　　　　　　: ' + IntToStr(SteppingNumber) + #13#10 +
//  				  'OS　　　　　　　　　　: ' + OSPlatformInfo + ' ' + Win32CSDVersion + #13#10 +
//            'OS Version　　　　　　: ' + Format('%d.%d',[Win32MajorVersion, Win32MinorVersion]) + #13#10 +
//            'OS Build　　　　　　　: ' + Format('%d',[Win32BuildNumber]) + #13#10 +
//            'メモリ　　　　　　　　: ' + TotalMemory + #13#10 +
//            'メモリ使用量　　　　　: ' + UseMemory + #13#10 +
//            'メモリ空き容量　　　　: ' + AvailMemory + #13#10 +
//            'メモリ使用率　　　　　: ' + MemoryLoad + #13#10 +
//            'ページファイル　　　　: ' + TotalPageFile + #13#10 +
//            'ページファイル使用量　: ' + UsePageFile + #13#10 +
//            'ページファイル空き容量: ' + AvailPageFile + #13#10 +
//            '解像度　　　　　　　　: ' + Format('%d×%d (%d ビット)', [nWidth, nHeight, Bit]) //+ #13#10
//            ;
end;

procedure TMainForm.TreePopupMenuPopup(Sender: TObject);
var
	Node: TTreeNode;
  Flag, Flag2: Boolean;
begin
  tvPaste.OnMouseUp := nil;

	Node := tvPaste.Selected;
  Flag := Node <> nil;                            
  Flag2 := Clipboard.AsText <> '';
  actNewFolder.Enabled := Flag;
  actNewPasteData.Enabled := Flag;
  actClipToCategory.Enabled := Flag2;
  actClipToFolder.Enabled := Flag and Flag2;
  actClipToPasteData.Enabled := Flag and Flag2;
  actProperty.Enabled := Flag;
  actDelete.Enabled := Flag;

//  actClipToFolder.Enabled := Flag2;
//  actClipToPasteData.Enabled := Flag2;
end;

procedure TMainForm.FilePopupMenuPopup(Sender: TObject);
begin
	actExport.Enabled := tvPaste.Items.Count <> 0;
end;

procedure TMainForm.actHelpViewExecute(Sender: TObject);
begin
  //トピックの検索を開く
  
//  if FileExists(Application.ExeName) then
  Application.HelpCommand(HELP_FINDER, 0);
end;




procedure TMainForm.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
begin
  if E.Message = SCannotOpenClipboard then Exit;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//var
//	F: Boolean;
begin
	//WM_QUERYENDSESSION
	SaveINI;
	if OptionRec.Standard.Expanded then SaveExp;
  if FModified or FPassChangeFlag or not FileExists(MyBuckUpPath + 'paste.stp') then begin
  	BuckUp;
//  	F := SaveData(tvPaste, MyPasteData, True, False);
//    if FPassChangeFlag and F then
//      BuckUp;
  end;

  SaveData(tvPaste, MyPasteData, True, False);

  if OptionRec.Clip.ReadHistory then
  	SaveClipData(tvClip, MyClipData);

end;

procedure TMainForm.tvPasteExpanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  FExpandFlag := True;
end;

procedure TMainForm.actClipDeleteExecute(Sender: TObject);
var
  res: Integer;
  Node: TTreeNode;
  Msg: string;
  procedure DeleteClip;
  var
  	i: Integer;
    Node: TTreeNode;
  begin
    for i := tvClip.SelectionCount -1 to 0 do begin
      Node := tvClip.Selections[i];
      TClipItem(Node.Data).Free;
      Node.Delete;
    end;
    tvClip.Selected := nil;
  end;
begin
	Node := tvClip.Selected;
  Msg := '"' + Node.Text + '" を削除してもいいですか？';
  if OptionRec.Standard.DeleteCheck then
//    res := MessageDlg(Msg, mtConfirmation, [mbYes,mbNo], 0)
			res := Application.MessageBox(PChar(Msg), '確認', MB_YESNO or MB_ICONQUESTION)
  else begin
  	DeleteClip;
    res := IDNo;
  end;
  if res = IDYes then begin
    DeleteClip;
  end;

end;

procedure TMainForm.tvClipMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
	Node: TTreeNode;
begin
  tvClip.OnMouseUp := tvPasteMouseUp;

	Node := TTreeViewEx(Sender).GetNodeAt(X, Y);   //ShowMessage(IntToStr(Node.AbsoluteIndex));
  if Node <> nil then begin

    if Button = mbRight then begin
      Node.Selected := True;
      Exit;
    end;
  end else
  	tvClip.Selected := nil;
end;

procedure TMainForm.ClipPopupMenuPopup(Sender: TObject);
begin
  tvClip.OnMouseUp := nil;

	actClipDelete.Enabled := not (tvClip.Selected = nil);
  actAddClipToPaste.Enabled := not (tvClip.Selected = nil);
end;

procedure TMainForm.tvPasteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if tvPaste.Selected = nil then Exit;
	if Key = Windows.VK_DELETE then begin
    actDeleteExecute(nil);
  end;
end;

procedure TMainForm.tvClipKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//	if tvClip.Selected = nil then Exit;
//	if Key = Windows.VK_DELETE then begin
//    actClipDeleteExecute(nil);
//  end;
end;

procedure TMainForm.tvPasteCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
	AllowCollapse := FCollapsedFlag;
  FExpandFlag := True;
end;

procedure TMainForm.SaveExp;
var
	sl: TStringList;
  Node: TTreeNode;
begin
  sl := TStringList.Create;
  try
    Node := tvPaste.Items.GetFirstNode;
    while Assigned(Node) do begin
      sl.Add(IntToStr(Integer(Node.Expanded)));
      Node := Node.GetNext;
    end;
    sl.SaveToFile(MyExpData);
  finally
    sl.Free;
  end;
end;

procedure TMainForm.LoadExp;
var
	sl: TStringList;
  i: Integer;
begin
	if FileExists(MyExpData) then begin
    sl := TStringList.Create;
    sl.LoadFromFile(MyExpData);
    try
      if sl.Count <> tvPaste.Items.Count then Exit;
      for i := 0 to sl.Count -1 do begin
        tvPaste.Items[i].Expanded := Boolean(StrToIntDef(sl[i], Integer(False)));
      end;
      FExpandFlag := False;
    finally
      sl.Free;
    end;
  end;

end;

procedure TMainForm.actAddClipToPasteExecute(Sender: TObject);
var
	Node,
  AddNode: TTreeNode;
  SelIdx: Integer;
  PItem: TPasteItem;
begin
	Node := tvClip.Selected;
  if Node = nil then Exit;

	ClipToPasteDlg := TClipToPasteDlg.Create(Self);
  try
    with ClipToPasteDlg do begin
      leName.Text := TClipItem(Node.Data).Name;
      memComment.Text := '';
      cbPasteMode.ItemIndex := 0;
      memPasteData.Lines.Text := TClipItem(Node.Data).Data;

//      MakeSerectTree;
      tvSelect.Items.Assign(tvPaste.Items);
      if tvPaste.Selected <> nil then begin
        SelIdx := tvPaste.Selected.AbsoluteIndex;
        tvSelect.Items[SelIdx].Selected := True;
      end;

      if ShowModal = mrOk then begin

      	PItem := TPasteItem.Create;
        PItem.Name := leName.Text;
        PItem.Comment := memComment.Text;
        PItem.CreateDay := Now;
        PItem.UpdateDay := Now;
        PItem.UseCount := 0;
        PItem.PasteData := memPasteData.Lines.Text;
        PItem.PasteMode := TPasteMode(cbPasteMode.ItemIndex);
        PItem.Icon := cbPasteMode.ItemsEx.ComboItems[cbPasteMode.ItemIndex].ImageIndex;

        if (TObject(tvSelect.Selected.Data) is TCategoryItem) or
           (TObject(tvSelect.Selected.Data) is TFolderItem) then begin
          SelIdx := tvSelect.Selected.AbsoluteIndex;
          AddNode := tvPaste.Items[selIdx];
          Node := tvPaste.Items.AddChildObject(AddNode, PItem.Name, Pointer(PItem));
          Node.Selected := True;
        end else begin
          SelIdx := tvSelect.Selected.AbsoluteIndex;
          AddNode := tvPaste.Items[selIdx];
          Node := tvPaste.Items.AddObject(AddNode, PItem.Name, Pointer(PItem));
          Node.MoveTo(AddNode, naInsert);
          Node.Selected := True;
        end;
        FModified := True;
      end;
    end;
  finally
    ClipToPasteDlg.Release;
  end;
end;

//procedure TMainForm.MakeSerectTree;
//  procedure NodeMove(ANode: TTreeNode; var IntA, IntB:Integer);
//  begin
//    if IntB > IntA then
//    begin
//      IntB := IntA;
//      while ANode.Level > IntA do
//      begin
//        ANode.MoveTo(ANode.Parent, naAdd);
//      end;
//    end
//    else
//    begin
//      if IntB < IntA then
//      begin
//        IntB := IntA;
//        ANode.MoveTo(ANode.GetPrev, naAddChild);
//      end;
//    end;
//  end;
//var
//	Node, NodeS, TempNode: TTreeNode;
//  IntLevelA,
//  IntLevelB,
//  IntAbs: Integer;
//begin
//	IntLevelB := 0;
//  NodeS := nil;
//	Node := tvPaste.Items.GetFirstNode;
//	while Node <> nil do begin
//  	IntLevelA := Node.Level;
//    IntAbs := Node.AbsoluteIndex;
//  	if TObject(Node.Data) is TCategoryItem then begin
//      NodeS := ClipToPasteDlg.tvSelect.Items.AddObject(nil, Node.Text, Pointer(Node));
//      NodeS.ImageIndex := TCategoryItem(Node.Data).Icon;
//      NodeS.SelectedIndex := TCategoryItem(Node.Data).Icon;
//      NodeMove(NodeS, IntLevelA, IntLevelB);
//    end;
//  	if TObject(Node.Data) is TFolderItem then begin
//      NodeS := ClipToPasteDlg.tvSelect.Items.AddObject(NodeS, Node.Text, Pointer(Node));
//      NodeS.ImageIndex := TFolderItem(Node.Data).Icon;
//      NodeS.SelectedIndex := TFolderItem(Node.Data).Icon;
//      NodeMove(NodeS, IntLevelA, IntLevelB);
//    end;
//    if Node.Selected then begin
//      TempNode := NodeS;
//    end;
//
//  	Node := Node.GetNext;
//  end;
//  ClipToPasteDlg.tvSelect.FullCollapse;
//  TempNode.Selected := True;
//
//end;

procedure TMainForm.BuckUp;
var
	NFile: string;
begin
	NFile := MyBuckUpPath + 'paste.stp';
	CopyFile(PChar(MyPasteData), PChar(NFile), False);
end;

procedure TMainForm.EasyEditorClick(Sender: TObject);
begin
  EditForm := TEditForm.Create(Self);
	EditForm.Show;
end;

procedure TMainForm.FormHide(Sender: TObject);
begin  
	if not OptionRec.Display.PopHint then Exit;
	FHintWnd.ReleaseHandle;

end;

procedure TMainForm.ExportXML(Tree: TTreeView; FileName: String);
  procedure SetBaseAttr(iNode: IXMLNode; Item: TBaseItem);
  begin
    if Item = nil then
      iNode.Attributes['Title'] := 'Stamper2'
    else
      iNode.Attributes['Title'] := Item.Name;
    iNode.Attributes['Icon'] := 0;
    iNode.Attributes['DispType'] := 0;
    iNode.Attributes['CharCode'] := 0;
    iNode.Attributes['Readonly'] := False;
    iNode.Attributes['Tag'] := False;
  end;
  procedure SetDirAttr(iNode: IXMLNode; Item: TFolderItem);
  begin
    SetBaseAttr(iNode, Item);
    iNode.Attributes['Paste'] := False;
  end;                                          
  procedure SetTextAttr(iNode: IXMLNode; Item: TPasteItem);
  begin
    SetBaseAttr(iNode, Item);                    
    iNode.Attributes['Icon'] := 0;
    iNode.Attributes['Extension'] := '.txt';
  end;
  procedure TreeToDom(Node: TTreeNode; iNode: IXMLNode);
  var
    BI: TBaseItem;
    diNode, iTextNode: IXMLNode;
    s: string;
  begin
    Node := Node.getFirstChild;
    while Node <> nil do begin
      BI := TBaseItem(Node.Data);
      if BI is TFolderItem then begin
        diNode := iNode.AddChild('Dir');
        SetDirAttr(diNode, TFolderItem(BI));

        TreeToDom(Node, diNode);
      end else begin
        iTextNode := iNode.AddChild('Text');
        SetTextAttr(iTextNode, TPasteItem(BI));
        if Trim(TPasteItem(BI).PasteData) = Trim(TPasteItem(BI).Name) then
          s := ''
        else s := TPasteItem(BI).PasteData;
        s := ConvertReturnCode(s, CR_R);
        iTextNode.Text := s;
      end;
      Node := Node.GetNextChild(Node);
    end;
  end;
  procedure ExportXml(Node: TTreeNode; iNode: IXMLNode);
  var
    BI: TBaseItem;
    diNode: IXMLNode;
  begin  
    BI := TBaseItem(Node.Data);
    diNode := iNode.AddChild('Dir');
    SetDirAttr(diNode, TFolderItem(BI));

    TreeToDom(Node, diNode);
  end;
var i: Integer;
  Node: TTreeNode;  
  iRoot: IXMLNode;
begin
  XMLDoc.Active := False;
  XMLDoc.XML.Text := '';
  XMLDoc.Active := True;
  // root
  XMLDoc.DocumentElement := XmlDoc.CreateNode('Dir');
  iRoot := XMLDoc.DocumentElement;
  iRoot.Attributes['Attr'] := 100;
  SetDirAttr(iRoot, nil);
  for i := 0 to Tree.Items.Count-1 do begin
    Node := Tree.Items[i];
    if Node.Level = 0 then begin
      ExportXml(Node, iRoot);
    end;
  end;
  XMLDoc.XML.SaveToFile(FileName);
end;

procedure TMainForm.ClipTimerTimer(Sender: TObject);
begin
  ClipboardWatcher1.Enabled := False;
  ClipboardWatcher1.Enabled := True;
end;

procedure TMainForm.tvClipAddition(Sender: TObject; Node: TTreeNode);
begin
  Node.ImageIndex := 15;
  Node.SelectedIndex := 15;
end;

end.
