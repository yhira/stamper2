unit PassEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Main;

type
  TPassEditForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    PassEdit: TEdit;
    RePassEdit: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    OKButton: TButton;
    CancelButton: TButton;
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure PassEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  PassEditForm: TPassEditForm;

implementation

{$R *.dfm}

uses untOption;

procedure TPassEditForm.OKButtonClick(Sender: TObject);
begin
  if (PassEdit.Text = '') and (RePassEdit.Text = '') then
  begin
    Application.MessageBox('�p�X���[�h���ݒ肳��Ă��܂���B'
      + #13#10 + '�p�X���[�h��ݒ肵�ĉ������B',
      PChar(Application.Title), MB_ICONINFORMATION);
    PassEdit.SetFocus;
    Abort;
  end;

  if PassEdit.Text = RePassEdit.Text then
  begin
//    MainForm.BasicSetup.PassWord := PassEdit.Text;
		OptionDlg.PassWord := PassEdit.Text;
    Self.Close;
  end
  else
  begin
    Application.MessageBox('�ݒ肵���p�X���[�h���A�m�F�p�̂��̂ƈ�v���܂���B'
      + #13#10 + '������x�p�X���[�h��ݒ肵�ĉ������B',
      PChar(Application.Title), MB_ICONINFORMATION);
    PassEdit.Clear;
    RePassEdit.Clear;
    PassEdit.SetFocus;
  end;

end;

procedure TPassEditForm.FormShow(Sender: TObject);
begin


  PassEdit.SetFocus;
  PassEdit.SelectAll;
end;

procedure TPassEditForm.CancelButtonClick(Sender: TObject);
begin
  Self.Close;
//  if OptionDlg.PassWord = NOT_PASS then
    OptionDlg.cbPass.Checked := False;
end;

procedure TPassEditForm.PassEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: OKButton.Click;
  end;
end;

procedure TPassEditForm.FormActivate(Sender: TObject);
var
  Q: TPoint;
begin
  //�}�E�X�|�C���^��C�ӂ̈ʒu�Ɉړ�
  Q := Point(OKButton.Width div 2, OKButton.Height div 2);
  Q := OKButton.ClientToScreen(Q);
  SetCursorPos(Q.X, Q.Y);
end;

end.
