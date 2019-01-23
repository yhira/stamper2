unit untClipToPaste;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, HEditor, hOleddEditor, EditorEx, ComCtrls, Main, yhOthers,
  Menus, StdActns, ActnList, Buttons, untInputCategory, untInputFolder;


type
  TClipToPasteDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    lblComment: TLabel;
    leName: TLabeledEdit;
    Label3: TLabel;
    memComment: TMemo;
    memPasteData: TEditorEx;
    Label4: TLabel;
    Bevel1: TBevel;
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
    tvSelect: TTreeView;
    Label1: TLabel;
    sbCreateCategory: TSpeedButton;
    sbCreateFolder: TSpeedButton;
    procedure FormActivate(Sender: TObject);
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
    procedure tvSelectAddition(Sender: TObject; Node: TTreeNode);
    procedure sbCreateCategoryClick(Sender: TObject);
    procedure sbCreateFolderClick(Sender: TObject);
    procedure leNameDblClick(Sender: TObject);
    procedure memCommentChange(Sender: TObject);
  private
    { Private 宣言 } 
    FClose: Boolean; //クローズチェックフラグ
  public
    { Public 宣言 }
  end;

var
  ClipToPasteDlg: TClipToPasteDlg;

implementation

{$R *.dfm}

uses stmItem;

procedure TClipToPasteDlg.FormActivate(Sender: TObject);
begin
  FClose := True;
	leName.SelectAll;
  leName.SetFocus;
  SetMouseCursor(OKBtn);
end;

procedure TClipToPasteDlg.OKBtnClick(Sender: TObject);
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
  if tvSelect.Selected = nil then begin
    Application.MessageBox('追加する場所を選択してください。',
                            PChar(Application.Title),
                            MB_ICONINFORMATION);
    FClose := False;
    Exit;
  end;
  MainForm.IniFileCompo1.WriteBool('Paste', 'Sigh', cbSign.Checked);
end;

procedure TClipToPasteDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
	CanClose := FClose;
  FClose := True;
end;

procedure TClipToPasteDlg.EditCut1Execute(Sender: TObject);
begin
	memPasteData.CutToClipboard;
end;

procedure TClipToPasteDlg.EditCopy1Execute(Sender: TObject);
begin
	memPasteData.CopyToClipboard;
end;

procedure TClipToPasteDlg.EditPaste1Execute(Sender: TObject);
begin
	memPasteData.PasteFromClipboard;
end;

procedure TClipToPasteDlg.EditSelectAll1Execute(Sender: TObject);
begin
	memPasteData.SelectAll;
end;

procedure TClipToPasteDlg.EditUndo1Execute(Sender: TObject);
begin
	memPasteData.Undo;
end;

procedure TClipToPasteDlg.EditDelete1Execute(Sender: TObject);
begin
	memPasteData.SelText := '';
end;

procedure TClipToPasteDlg.PopupMenu1Popup(Sender: TObject);
var
	bSelscted: Boolean;
begin
	bSelscted := memPasteData.SelLength > 0;
	EditCut1.Enabled := bSelscted;
  EditCopy1.Enabled := bSelscted;
  EditDelete1.Enabled := bSelscted;

  EditUndo1.Enabled := memPasteData.CanUndo;
end;

procedure TClipToPasteDlg.cbSignClick(Sender: TObject);
var
  f: Boolean;
begin
  f := cbSign.Checked;
  memPasteData.ExMarks.DBSpaceMark.Visible := f;
  memPasteData.ExMarks.SpaceMark.Visible   := f;
  memPasteData.ExMarks.TabMark.Visible     := f;
  memPasteData.Marks.RetMark.Visible       := f;
end;

procedure TClipToPasteDlg.FormCreate(Sender: TObject);
begin
  cbSign.Checked := MainForm.IniFileCompo1.ReadBool('Paste', 'Sigh', True);
end;

procedure TClipToPasteDlg.tvSelectAddition(Sender: TObject;
  Node: TTreeNode);
begin
  Node.ImageIndex    := TBaseItem(Node.Data).Icon;
  Node.SelectedIndex := TBaseItem(Node.Data).Icon;
end;

procedure TClipToPasteDlg.sbCreateCategoryClick(Sender: TObject);
//var
//  CItem: TCategoryItem;
//  s: string;
begin
//  s := '新規カテゴリ';
//  if InputQuery('カテゴリ名', 'カテゴリ名を入力して下さい。', s) then begin
//    CItem := TCategoryItem.Create;
//    CItem.Name := s;
//    CItem.Icon := 0;
//    CItem.Comment := '';
//    CItem.CreateDay := now;
//
//    tvSelect.Items.AddObject(nil, CItem.Name, Pointer(CItem)).Selected := True;
//    MainForm.tvPaste.Items.AddObject(nil, CItem.Name, Pointer(CItem)).Selected := True;
//  end;
  InputCategory := TInputCategory.Create(Self);
  try
    InputCategory.ShowModal;
  finally
    InputCategory.Release;
  end;
end;

procedure TClipToPasteDlg.sbCreateFolderClick(Sender: TObject);
begin
  if tvSelect.Selected = nil then begin
    Application.MessageBox('フォルダのを追加する場所を選択して下さい。',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
    Abort;
  end;
  InputFolder := TInputFolder.Create(Self);
  try
    InputFolder.ShowModal;
  finally
    InputFolder.Release;
  end;
end;

procedure TClipToPasteDlg.leNameDblClick(Sender: TObject);
begin
  leName.SelectAll;
end;

procedure TClipToPasteDlg.memCommentChange(Sender: TObject);
begin
  memComment.SelectAll;
end;

end.
