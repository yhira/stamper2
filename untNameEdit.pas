unit untNameEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, yhFiles;


type
  TNameEditDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private 宣言 }
    FClose: Boolean;
    procedure ErrorCheck;
  public
    { Public 宣言 }
  end;

var
  NameEditDlg: TNameEditDlg;

implementation

uses untCategory;

{$R *.dfm}

procedure TNameEditDlg.ErrorCheck;
var
	Msg: string;
begin
	if IncludeErrorFileChar(Edit1.Text) then begin
  	Msg := 'カテゴリ名には次の文字は使用できません。' + #13#10 + '\/:;*?"<>|';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
    Edit1.SelectAll;
    Edit1.SetFocus;
    FClose := False;
  end;

  if CategoryDlg.lbCategory.Items.IndexOf(Edit1.Text) <> -1 then begin
    Msg := '"' + Edit1.Text +  '" はすでに登録されています。別の名前を指定してください。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
    Edit1.SelectAll;
    Edit1.SetFocus;
    FClose := False;
  end;
end;

procedure TNameEditDlg.OKBtnClick(Sender: TObject);
begin
	ErrorCheck;
end;

procedure TNameEditDlg.FormCreate(Sender: TObject);
begin
	FClose := True;

end;

procedure TNameEditDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
	CanClose := FClose;
end;

procedure TNameEditDlg.CancelBtnClick(Sender: TObject);
begin
	FClose := True;
end;

procedure TNameEditDlg.FormActivate(Sender: TObject);
begin
  Edit1.SelectAll;
  Edit1.SetFocus;
end;

end.
 