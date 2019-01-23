unit untInputCategory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, stmItem;

type
  TInputCategory = class(TForm)
    InputEdit: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    Label1: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure InputEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  InputCategory: TInputCategory;

implementation

{$R *.dfm}

uses untClipToPaste, Main;

procedure TInputCategory.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TInputCategory.OKBtnClick(Sender: TObject); 
var
  CItem: TCategoryItem;
begin
  if InputEdit.Text = '' then begin
    Application.MessageBox('ÉJÉeÉSÉäñºÇ™ãÛóìÇ≈Ç∑ÅB',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
    abort;
  end;

  CItem := TCategoryItem.Create;
  CItem.Name := InputEdit.Text;
  CItem.Icon := DEF_CATEGORY_ICON;
  CItem.Comment := '';
  CItem.CreateDay := now;

  ClipToPasteDlg.tvSelect.Items.AddObject(nil, CItem.Name, Pointer(CItem)).Selected := True;
  MainForm.tvPaste.Items.AddObject(nil, CItem.Name, Pointer(CItem)).Selected := True;
  MainForm.FModified := True;
  Close;
end;

procedure TInputCategory.InputEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
	if Key = Windows.VK_RETURN then begin
    OKBtnClick(nil);
  end;
end;

end.
