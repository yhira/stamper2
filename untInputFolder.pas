unit untInputFolder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, stmItem, ComCtrls;

type
  TInputFolder = class(TForm)
    InputEdit: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  InputFolder: TInputFolder;

implementation

{$R *.dfm}

uses untClipToPaste, Main;

procedure TInputFolder.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TInputFolder.OKBtnClick(Sender: TObject);
var
  FItem: TFolderItem;
  Idx: Integer;
  NodeS, NodeP: TTreeNode;
begin
  if InputEdit.Text = '' then begin
    Application.MessageBox('フォルダ名が空欄です。',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
    abort;
  end;

  FItem := TFolderItem.Create;
  FItem.Name := InputEdit.Text;
  FItem.Icon := DEF_FOLDER_ICON;
  FItem.Comment := '';
  FItem.CreateDay := now;

  Idx := ClipToPasteDlg.tvSelect.Selected.AbsoluteIndex;
  NodeS := ClipToPasteDlg.tvSelect.Selected;
  NodeP := MainForm.tvPaste.Items[Idx];
  if TObject(NodeS.Data) is TPasteItem then begin
    NodeS := NodeS.Parent;
    NodeP := NodeP.Parent;
  end;
  ClipToPasteDlg.tvSelect.Items.AddChildObject(NodeS, FItem.Name, Pointer(FItem)).Selected := True;
  MainForm.tvPaste.Items.AddChildObject(NodeP, FItem.Name, Pointer(FItem)).Selected := True;
  MainForm.FModified := True;
  Close;
end;

procedure TInputFolder.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = Windows.VK_RETURN then begin
    OKBtnClick(nil);
  end;
end;

end.
