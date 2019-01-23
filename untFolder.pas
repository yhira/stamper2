unit untFolder;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, yhOthers;


type
  TFolderDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    lblComment: TLabel;
    Label1: TLabel;
    lblCreateDay: TLabel;
    Label2: TLabel;
    leName: TLabeledEdit;
    memComment: TMemo;
    cbIcon: TComboBoxEx;
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure leNameDblClick(Sender: TObject);
    procedure memCommentDblClick(Sender: TObject);
  private
    { Private �錾 } 
    FClose: Boolean; //�N���[�Y�`�F�b�N�t���O
  public
    { Public �錾 }
  end;

var
  FolderDlg: TFolderDlg;

implementation

{$R *.dfm}

procedure TFolderDlg.FormActivate(Sender: TObject);
begin
  FClose := True;
	leName.SelectAll;
  leName.SetFocus;
  SetMouseCursor(OKBtn);
end;

procedure TFolderDlg.OKBtnClick(Sender: TObject);
begin
  if leName.Text = '' then begin
    Application.MessageBox('���O���󗓂ł��B', PChar(Application.Title), MB_ICONINFORMATION);
    leName.SelectAll;
    leName.SetFocus;
    FClose := False;
  end;
end;

procedure TFolderDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	CanClose := FClose;
  FClose := True;
end;

procedure TFolderDlg.leNameDblClick(Sender: TObject);
begin
  leName.SelectAll;
end;

procedure TFolderDlg.memCommentDblClick(Sender: TObject);
begin
  memComment.SelectAll;
end;

end.
