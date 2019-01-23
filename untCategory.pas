unit untCategory;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, yhOthers, ComCtrls, Main;


type
  TCategoryDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    lblComment: TLabel;
    Label1: TLabel;
    lblCreateDay: TLabel;
    leName: TLabeledEdit;
    memComment: TMemo;
    Label2: TLabel;
    cbIcon: TComboBoxEx;
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure leNameDblClick(Sender: TObject);
    procedure memCommentDblClick(Sender: TObject);
  private
    { Private 宣言 }
    FClose: Boolean; //クローズチェックフラグ
  public
    { Public 宣言 }
  end;

var
  CategoryDlg: TCategoryDlg;

implementation

{$R *.dfm}

procedure TCategoryDlg.FormActivate(Sender: TObject);
begin
	FClose := True;
	leName.SelectAll;
  leName.SetFocus;
  SetMouseCursor(OKBtn);
end;

procedure TCategoryDlg.OKBtnClick(Sender: TObject);
begin
  if leName.Text = '' then begin
    Application.MessageBox('名前が空欄です。', PChar(Application.Title), MB_ICONINFORMATION);
    leName.SelectAll;
    leName.SetFocus;
    FClose := False;
  end;
end;

procedure TCategoryDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	CanClose := FClose;
  FClose := True;
end;

procedure TCategoryDlg.leNameDblClick(Sender: TObject);
begin
  leName.SelectAll;
end;

procedure TCategoryDlg.memCommentDblClick(Sender: TObject);
begin
  memComment.SelectAll;
end;

end.
 