unit untAbort;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, yhFiles, ShellAPI, DateUtils;

type
  TAboutBox = class(TForm)
    Image1: TImage;
    VersionLabel: TLabel;
    URLLabel: TLabel;
    CopyRightLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure URLLabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure URLLabelMouseLeave(Sender: TObject);
    procedure URLLabelClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TAboutBox.Image1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  VersionLabel.Caption := 'Version ' + GetFileVersion(Application.ExeName);
  CopyRightLabel.Caption := 'Copyright (C) 2003-' + IntToStr(YearOf(now)) + ' by yhira';
  URLLabel.Caption := 'http://mousist.cside.com/';
  URLLabel.Font.Color := $1709CE;
end;

procedure TAboutBox.FormPaint(Sender: TObject);
//var
//	r: TRect;
begin
//  r := ClientRect;
//  with Canvas do begin
//  	Pen.Color := cl3DLight;
////    Rectangle(r);
//    MoveTo(r.Left, r.Top);
//    LineTo(r.Right, r.Top);
//
//    MoveTo(r.Left, r.Top);
//    LineTo(r.Left, r.Bottom);
//
//    Pen.Color := cl3DDkShadow;
//
//    MoveTo(r.Right, r.Top);
//    LineTo(r.Right, r.Bottom);
//
//    MoveTo(r.Left, r.Bottom);
//    LineTo(r.Right, r.Bottom);
//  end;
end;

procedure TAboutBox.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	Close;
end;

procedure TAboutBox.URLLabelMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  with URLLabel do begin
    Font.Style := [fsUnderline];
    Cursor := crHandPoint;
  end;
end;

procedure TAboutBox.URLLabelMouseLeave(Sender: TObject);
begin
  with URLLabel do begin
    Font.Style := [];
    Cursor := crDefault;
  end;
end;

procedure TAboutBox.URLLabelClick(Sender: TObject);
begin
  with URLLabel do
  begin
    ShellExecute(Application.Handle,
                 PChar('open'), PChar(URLLabel.Caption),
                 PChar(0), nil, SW_NORMAL);
  end;
end;

end.

