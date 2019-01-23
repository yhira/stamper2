unit untOption;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, yhOthers, Spin, Main, yhFiles;


type
  TOptionDlg = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tsStan: TTabSheet;
    tsDsp: TTabSheet;
    tsClip: TTabSheet;
    OKBtn: TButton;
    CancelBtn: TButton;
    HelpBtn: TButton;
    cbHotTrack: TCheckBox;
    gbSound: TGroupBox;
    cbSound: TCheckBox;
    Label1: TLabel;
    edtSoundFile: TEdit;
    btnSound: TButton;
    cbAutoExpand: TCheckBox;
    cbDeleteCheck: TCheckBox;
    cbPopHint: TCheckBox;
    gbStealth: TGroupBox;
    pnlStealth: TPanel;
    cbStealthTL: TCheckBox;
    cbStealthTR: TCheckBox;
    cbStealthBL: TCheckBox;
    cbStealthBR: TCheckBox;
    cbTabPos: TComboBox;
    GroupBox1: TGroupBox;
    PaintBox1: TPaintBox;
    OpenDialog1: TOpenDialog;
    cbAnimation: TCheckBox;
    gbClip: TGroupBox;
    cbClipEnabled: TCheckBox;
    Label2: TLabel;
    seHistoryCount: TSpinEdit;
    cbReadHistory: TCheckBox;
    cbAddFirst: TCheckBox;
    lblClipAddFirst: TLabel;
    gbPass: TGroupBox;
    cbPass: TCheckBox;
    btnPass: TButton;
    cbStealth: TCheckBox;
    cbNotPasteData: TCheckBox;
    cbExpanded: TCheckBox;
    StealthLabel: TLabel;
    procedure PaintBox1Paint(Sender: TObject);
    procedure cbStealthTLClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSoundClick(Sender: TObject);
    procedure cbClipEnabledClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbPassClick(Sender: TObject);
    procedure cbPassMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnPassClick(Sender: TObject);
    procedure HelpBtnClick(Sender: TObject);
  private
    { Private 宣言 }
    FClose: Boolean; //クローズチェックフラグ
    procedure CheckContents;
    procedure CheckClipEnabled;
  public
    { Public 宣言 }
    Pass: Boolean;
    PassWord: string;
  end;

var
  OptionDlg: TOptionDlg;

implementation

uses PassEdit;

{$R *.dfm}

procedure TOptionDlg.PaintBox1Paint(Sender: TObject);
var
	r: TRect;
const
  HIDE_RECT = 12;
begin
	with PaintBox1.Canvas do begin 
    Brush.Style := bsSolid;
    Brush.Color := clBackground;
    Pen.Width := 0;
    Rectangle(PaintBox1.ClientRect);
  	Pen.Color := clWhite;
    Pen.Width := 2;
    Brush.Style := bsSolid;
    Brush.Color := clRed;
    r := PaintBox1.ClientRect;
		//左上
    if cbStealthTL.Checked then begin
      Rectangle(r.Left,
      					r.Top,
                r.Left + HIDE_RECT,
                r.Top + HIDE_RECT);
    end;
    //右上
    if cbStealthTR.Checked then begin
      Rectangle(r.Right -HIDE_RECT,
                r.Top,
                r.Right,
                r.Top + HIDE_RECT);
    end;
    //左下
    if cbStealthBL.Checked then begin
      Rectangle(r.Left,
      					r.Bottom -HIDE_RECT,
                r.Left + HIDE_RECT,
                r.Bottom);
    end;
    //右下
    if cbStealthBR.Checked then begin
      Rectangle(r.Right -HIDE_RECT,
      					r.Bottom -HIDE_RECT,
                r.Right,
                r.Bottom);
    end;
  end;
end;

procedure TOptionDlg.cbStealthTLClick(Sender: TObject);
begin
	PaintBox1.Invalidate;
end;

procedure TOptionDlg.FormActivate(Sender: TObject);
begin
  FClose := True;
  SetMouseCursor(OKBtn);
//  StayOnTop(Handle);
end;

procedure TOptionDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	CanClose := FClose;
  FClose := True;
end;

procedure TOptionDlg.CheckContents;
begin
  if (cbSound.Checked) and
     (FileExists(edtSoundFile.Text) = False) then begin
    Application.MessageBox('サウンドファイルが存在しません。',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
  	PageControl1.ActivePage := tsStan;
    edtSoundFile.SelectAll;
    edtSoundFile.SetFocus;
    FClose := False;
    Abort;
  end;
  if (cbStealthTL.Checked = False) and
     (cbStealthTR.Checked = False) and
     (cbStealthBL.Checked = False) and
     (cbStealthBR.Checked = False) then begin
    Application.MessageBox('ステルス表示位置は最低１つは選択されていなければなりません。',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
//    MessageDlg('ステルス表示位置は最低１つは選択されていなければなりません。', mtInformation, [mbOK], 0);
  	PageControl1.ActivePage := tsDsp;
    FClose := False;
    Abort;
  end;

end;

procedure TOptionDlg.OKBtnClick(Sender: TObject);
begin
	CheckContents;
end;

procedure TOptionDlg.FormCreate(Sender: TObject);
begin
	lblClipAddFirst.Caption := '(＊全く同ﾃﾞｰﾀがｸﾘｯﾌﾟﾎﾞｰﾄﾞ履歴にある場合、以前のﾃﾞｰﾀを消して先頭に' + #13#10 +
													   '                                                                        追加するかどうか)';
  btnPass.Enabled := cbPass.Checked;
  PaintBox1.Color := clBackground;
//	OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName) + 'sound';
end;

procedure TOptionDlg.btnSoundClick(Sender: TObject);
begin
  OpenDialog1.FileName := edtSoundFile.Text;
  if OpenDialog1.Execute then begin
    edtSoundFile.Text := OpenDialog1.FileName;
  end;
end;

procedure TOptionDlg.cbClipEnabledClick(Sender: TObject);
begin
  CheckClipEnabled;
end;

procedure TOptionDlg.CheckClipEnabled;
var
	i: Integer;
begin
	if cbClipEnabled.Checked then begin
    for i := 0 to gbClip.ControlCount -1 do
      gbClip.Controls[i].Enabled := True;
  end else begin
    for i := 0 to gbClip.ControlCount -1 do
      gbClip.Controls[i].Enabled := False;
  end;

end;

procedure TOptionDlg.FormShow(Sender: TObject);
begin
	CheckClipEnabled;
end;

procedure TOptionDlg.cbPassClick(Sender: TObject);
begin
	btnPass.Enabled := cbPass.Checked;
end;

procedure TOptionDlg.cbPassMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if cbPass.Checked then
  begin
    PassEditForm := TPassEditForm.Create(Self);
    try
      PassEditForm.ShowModal;
    finally
      PassEditForm.Release;
    end;
  end;
end;

procedure TOptionDlg.btnPassClick(Sender: TObject);
begin
  PassEditForm := TPassEditForm.Create(Self);
  PassEditForm.PassEdit.Text := PassWord;
  try
    PassEditForm.ShowModal;
  finally
    PassEditForm.Release;
  end;
end;

procedure TOptionDlg.HelpBtnClick(Sender: TObject);
begin
	case PageControl1.ActivePageIndex of
    0: Application.HelpCommand(HELP_CONTEXT, 36);
    1: Application.HelpCommand(HELP_CONTEXT, 38);
    2: Application.HelpCommand(HELP_CONTEXT, 43);
  end;

end;

end.

