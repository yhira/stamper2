unit untEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ToolWin, Clipbrd, ExtCtrls;

type
  TEditForm = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  EditForm: TEditForm;

implementation

{$R *.dfm}

procedure TEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
	Action := caFree;
end;

procedure TEditForm.Button1Click(Sender: TObject);
begin
  Clipboard.AsText := Memo1.Text;
  Memo1.SetFocus;
end;

procedure TEditForm.Button2Click(Sender: TObject);
begin
  Clipboard.AsText := Memo1.Text;
  Memo1.Clear;
  Memo1.SetFocus;
end;

end.
