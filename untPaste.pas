unit untPaste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, HEditor, hOleddEditor, EditorEx, ComCtrls, Main, yhOthers,
  Menus, StdActns, ActnList;


type
  TPasteDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    lblComment: TLabel;
    Label1: TLabel;
    lblCreateDay: TLabel;
    leName: TLabeledEdit;
    Label2: TLabel;
    lblUpdateDay: TLabel;
    Label3: TLabel;
    memComment: TMemo;
    memPasteData: TEditorEx;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    btnReset: TButton;
    Bevel1: TBevel;
    edtUseCount: TEdit;
    Label6: TLabel;
    cbPasteMode: TComboBoxEx;
    ActionList1: TActionList;
    EditCut1: TEditCut;
    EditCopy1: TEditCopy;
    EditPaste1: TEditPaste;
    EditSelectAll1: TEditSelectAll;
    EditUndo1: TEditUndo;
    EditDelete1: TEditDelete;
    PopupMenu1: TPopupMenu;
    Undo1: TMenuItem;
    N1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Delete1: TMenuItem;
    Paste1: TMenuItem;
    N2: TMenuItem;
    A1: TMenuItem;
    cbSign: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure btnResetClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure EditCut1Execute(Sender: TObject);
    procedure EditCopy1Execute(Sender: TObject);
    procedure EditPaste1Execute(Sender: TObject);
    procedure EditSelectAll1Execute(Sender: TObject);
    procedure EditUndo1Execute(Sender: TObject);
    procedure EditDelete1Execute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure cbSignClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure leNameDblClick(Sender: TObject);
    procedure memCommentDblClick(Sender: TObject);
  private
    { Private 宣言 } 
    FClose: Boolean; //クローズチェックフラグ
  public
    { Public 宣言 }
  end;

var
  PasteDlg: TPasteDlg;

implementation

{$R *.dfm}

procedure TPasteDlg.FormActivate(Sender: TObject);
begin
  FClose := True;
	leName.SelectAll;
  leName.SetFocus;
  SetMouseCursor(OKBtn);
end;

procedure TPasteDlg.btnResetClick(Sender: TObject);
begin
  edtUseCount.Text := '0';
end;

procedure TPasteDlg.OKBtnClick(Sender: TObject);
begin
  if leName.Text = '' then begin
    Application.MessageBox('名前が空欄です。', PChar(Application.Title), MB_ICONINFORMATION);
    leName.SelectAll;
    leName.SetFocus;
    FClose := False;
    Exit;
  end;   
  if memPasteData.Lines.Text = '' then begin
    Application.MessageBox('データが空欄です。', PChar(Application.Title), MB_ICONINFORMATION);
    memPasteData.SelectAll;
    memPasteData.SetFocus;
    FClose := False;
    Exit;
  end;
  MainForm.IniFileCompo1.WriteBool('Paste', 'Sigh', cbSign.Checked);
end;

procedure TPasteDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	CanClose := FClose;
  FClose := True;
end;

procedure TPasteDlg.EditCut1Execute(Sender: TObject);
begin
	memPasteData.CutToClipboard;
end;

procedure TPasteDlg.EditCopy1Execute(Sender: TObject);
begin
	memPasteData.CopyToClipboard;
end;

procedure TPasteDlg.EditPaste1Execute(Sender: TObject);
begin
	memPasteData.PasteFromClipboard;
end;

procedure TPasteDlg.EditSelectAll1Execute(Sender: TObject);
begin
	memPasteData.SelectAll;
end;

procedure TPasteDlg.EditUndo1Execute(Sender: TObject);
begin
	memPasteData.Undo;
end;

procedure TPasteDlg.EditDelete1Execute(Sender: TObject);
begin
	memPasteData.SelText := '';
end;

procedure TPasteDlg.PopupMenu1Popup(Sender: TObject);
var
	bSelscted: Boolean;
begin
	bSelscted := memPasteData.SelLength > 0;
	EditCut1.Enabled := bSelscted;
  EditCopy1.Enabled := bSelscted;
  EditDelete1.Enabled := bSelscted;

  EditUndo1.Enabled := memPasteData.CanUndo;
end;

procedure TPasteDlg.cbSignClick(Sender: TObject);
var
  f: Boolean;
begin
  f := cbSign.Checked;
  memPasteData.ExMarks.DBSpaceMark.Visible := f;
  memPasteData.ExMarks.SpaceMark.Visible   := f;
  memPasteData.ExMarks.TabMark.Visible     := f;
  memPasteData.Marks.RetMark.Visible       := f;
end;

procedure TPasteDlg.FormCreate(Sender: TObject);
begin
  cbSign.Checked := MainForm.IniFileCompo1.ReadBool('Paste', 'Sigh', True);
end;

procedure TPasteDlg.leNameDblClick(Sender: TObject);
begin
  leName.SelectAll;
end;

procedure TPasteDlg.memCommentDblClick(Sender: TObject);
begin
  memComment.SelectAll;
end;

end.
