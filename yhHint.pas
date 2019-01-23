unit yhHint;

interface

uses
  Windows,sysutils,classes,forms,controls,extctrls,messages,menus;

type
  //ヒントの枠を変える
  THintWindowEx = class(THintwindow)
  protected
    procedure NCPaint(DC: HDC); override;
    procedure Paint; override;
    procedure WMLButtonDown(var Message: TWMLButtonDown); message WM_LBUTTONDOWN;
  public
    function CalcHintRect(MaxWidth: Integer; const AHint: string;
      AData: Pointer): TRect; override;
  end;

  //ヒントクラス
  THintWindowPlus = class(THintWindowEx)
  private
    FHideTimer: TTimer;
    FShowTimer: TTimer;

    procedure HideTimerOnTimer(Sender: TObject);
    function GetHidePause: Cardinal;
    procedure SetHidePause(const Value: Cardinal);

    procedure ShowTimerOnTimer(Sender: TObject);
    function GetPause: Cardinal;
    procedure SetPause(const Value: Cardinal);
  protected

    procedure DoShowHint; virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ShowHint(S: String); virtual;
    procedure HideHint; virtual;
    procedure MouseClick(Sender: TObject);
  published
    property HidePause: Cardinal read GetHidePause write SetHidePause;
    property Pause: Cardinal read GetPause write SetPause;
  end;

//var OldPt: TPoint;

//ヒントクラスのインスタンス
//function GlobalHintWindow: THintWindowPlus;


implementation

uses Main;

//var
//  _HintWindow_: THintWindowPlus;
//
//function GlobalHintWindow: THintWindowPlus;
//begin
//  //作成されていなければ作成
//  if not Assigned(_HintWindow_) then
//    _HintWindow_ := THintWindowPlus.Create(nil);
//
//  Result := _HintWindow_;
//end;


{ THintWindowPlus }

constructor THintWindowPlus.Create(AOwner: TComponent);
begin
  inherited;
  Color := Application.HintColor;

  FHideTimer := TTimer.Create(Self);
  FHideTimer.Enabled := False;
  FHideTimer.Interval := Application.HintHidePause;
  FHideTimer.OnTimer := HideTimerOnTimer;

  FShowTimer := TTimer.Create(Self);
  FSHowTimer.Enabled := False;
  FShowTimer.Interval := Application.HintPause;
  FShowTimer.OnTimer := ShowTimerOnTimer;

  OnClick := MouseClick;
end;

destructor THintWindowPlus.Destroy;
begin
  HideHint;
  inherited;
end;

function THintWindowPlus.GetHidePause: Cardinal;
begin
  Result := FHideTimer.Interval;
end;

procedure THintWindowPlus.HideHint;
//hintを閉じる
begin
  if FHideTimer.Enabled then
  begin
    FHideTimer.Enabled := False;
    ReleaseHandle;
  end;

  FShowTimer.Enabled := False;
end;

procedure THintWindowPlus.SetHidePause(const Value: Cardinal);
begin
  FHideTimer.Interval := Value;
end;

procedure THintWindowPlus.ShowHint(S: String);
//hint表示
begin
  HideHint;
  if S = '' then Exit;
//  GetCursorPos(OldPt);

  Caption := S;
  if Pause = 0 then
    DoShowHint
  else //timer on
    FShowTimer.Enabled := True;
end;

procedure THintWindowPlus.HideTimerOnTimer(Sender: TObject);
//時間で閉じる
begin
  HideHint;
end;

function THintWindowPlus.GetPause: Cardinal;
begin
  Result := FShowTimer.Interval;
end;

procedure THintWindowPlus.SetPause(const Value: Cardinal);
begin
  FShowTimer.Interval := Value;
end;

procedure THintWindowPlus.ShowTimerOnTimer(Sender: TObject);
//var
//	p: TPoint;
//時間で表示
begin
  FShowTimer.Enabled := False;
//	GetCursorPos(p);
//  if (OldPt.X <> p.X) and (OldPt.Y <> p.Y) then begin
//    FHideTimer.Enabled := True;
//    Exit;
//  end;
  DoShowHint;
end;

procedure THintWindowPlus.DoShowHint;
//hint表示
//var
//  rect: TRect;
//  mp: TPoint;
var
	p: TPoint;
	ARect: TRect;
begin    
//	if Trim(s) = '' then Exit;
  try
    GetCursorPos(p);
    ARect := CalcHintRect(Screen.Width, Caption, nil);
    OffsetRect(ARect, p.x + 15, p.y + 15);
    ActivateHint(ARect, Caption);
  except
    ReleaseHandle;
  end;
//  //hint window
//  rect := CalcHintRect(640,Caption,nil);
//  //調整
//  mp := Mouse.CursorPos;
//  Inc(mp.Y,25);
//
//  Inc(rect.Left,mp.X);
//  Inc(rect.Right,mp.X);
//  Inc(rect.Top,mp.Y);
//  Inc(rect.Bottom,mp.Y);
//  //表示
//  ActivateHint(rect,Caption);
  //timer
  FHideTimer.Enabled := True;
end;


procedure THintWindowPlus.MouseClick(Sender: TObject);
begin
   ReleaseHandle;
end;

{ THintWindowEx }

function THintWindowEx.CalcHintRect(MaxWidth: Integer; const AHint: string;
  AData: Pointer): TRect;
begin
  Result := Rect(0, 0, MaxWidth, 0);
  DrawText(Canvas.Handle, PChar(AHint), -1, Result, DT_CALCRECT or DT_LEFT or
    DT_WORDBREAK or DT_NOPREFIX or DrawTextBiDiModeFlagsReadingOnly);
  Inc(Result.Right,10);// 6);
  Inc(Result.Bottom,6);// 2);
end;

procedure THintWindowEx.NCPaint(DC: HDC);
//枠を塗る
var
  R: TRect;
begin
  R := Rect(0, 0, Width, Height);
  Windows.DrawEdge(DC, R, BDR_RAISEDOUTER, BF_RECT or BF_MONO);
end;

procedure THintWindowEx.Paint;
//ペイント
var
  R: TRect;
begin
  R := ClientRect;
  Inc(R.Left, 4);//2);
  Inc(R.Top, 4);//2);
  Canvas.Font.Color := Screen.HintFont.Color;
  DrawText(Canvas.Handle, PChar(Caption), -1, R, DT_LEFT or DT_NOPREFIX or
    DT_WORDBREAK or DrawTextBiDiModeFlagsReadingOnly);
end;

//
//initialization
//  //hintクラスを変える
//  HintWindowClass := THintWindowEx;
//finalization
//  //解放する
//  FreeAndNil(_HintWindow_);

procedure THintWindowEx.WMLButtonDown(var Message: TWMLButtonDown);
begin
//	inherited;
//  ReleaseHandle;
end;

end.

