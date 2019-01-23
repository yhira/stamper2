unit untExport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Main, stmItem;

type
  TExportForm = class(TForm)
    Panel1: TPanel;
    TreeView1: TTreeView;
    CloseButton: TButton;
    ExportButton: TButton;
    AllExportButton: TButton;
    SaveDialog1: TSaveDialog;
    TempTreeView: TTreeView;
    Label1: TLabel;
    Bevel1: TBevel;
    ExportXMLButton: TButton;
    XmlSaveDialog: TSaveDialog;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure ExportButtonClick(Sender: TObject);
    procedure AllExportButtonClick(Sender: TObject);
    procedure ExportXMLButtonClick(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  ExportForm: TExportForm;

implementation

{$R *.dfm}

procedure TExportForm.CloseButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TExportForm.FormCreate(Sender: TObject);
begin
	with MainForm do begin
    TreeView1.Items.Assign(tvPaste.Items);
  end;
  //フォームを常に手前に表示させる
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0,
                             SWP_NOMOVE or SWP_NOSIZE);

  SaveDialog1.Filter := Application.Title + 'ファイル (*' + PASTE_DATA_EXT +
  	')|*' + PASTE_DATA_EXT + '|すべてのファイル (*.*)|*.*';
  SaveDialog1.InitialDir := ExtractFilePath(Application.ExeName);
	Label1.Caption := '複数選択' + #13#10 +
                    '[Shift] or [Ctrl]';
end;

procedure TExportForm.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
  AllowExpansion := False;
end;

procedure TExportForm.ExportButtonClick(Sender: TObject);
var
//  TempTreeView: TTreeView;
  i: Integer;
//  Node: TTreeNode;
begin
	if TreeView1.SelectionCount = 0 then begin
    Application.MessageBox('カテゴリを一つ以上選択してください。',
    											 PChar(Application.Title),
                           MB_ICONINFORMATION);
    Exit;
  end;
  with SaveDialog1 do begin
    FileName := 'PasteData' + PASTE_DATA_EXT;
    if Execute then begin
      if ExtractFileExt(FileName) <> PASTE_DATA_EXT then
        FileName := FileName + PASTE_DATA_EXT;

      TempTreeView.Items.Assign(TreeView1.Items);
      for i := TreeView1.Items.Count -1 downto 0 do begin
        if (TreeView1.Items[i].Level = 0) and (TreeView1.Items[i].Selected = False) then begin
          TempTreeView.Items[i].Delete;
        end;
      end;
      MainForm.SaveData(TempTreeView, FileName, False, True);
    end;
  end;

end;


procedure TExportForm.AllExportButtonClick(Sender: TObject);
begin
  with SaveDialog1 do begin
    FileName := 'PasteData' + PASTE_DATA_EXT;
    if Execute then begin
      if ExtractFileExt(FileName) <> PASTE_DATA_EXT then
        FileName := FileName + PASTE_DATA_EXT;
      MainForm.SaveData(TreeView1, FileName, False, True);
    end;
  end;
  Close;
end;

procedure TExportForm.ExportXMLButtonClick(Sender: TObject);
var
  i: Integer;
begin
	if TreeView1.SelectionCount = 0 then begin
    Application.MessageBox('カテゴリを一つ以上選択してください。',
    											 PChar(Application.Title),
                           MB_ICONINFORMATION);
    Exit;
  end;
  with XmlSaveDialog do begin
    FileName := 'PasteData.xml';
    if Execute then begin

      TempTreeView.Items.Assign(TreeView1.Items);
      for i := TreeView1.Items.Count -1 downto 0 do begin
        if (TreeView1.Items[i].Level = 0) and (TreeView1.Items[i].Selected = False) then begin
          TempTreeView.Items[i].Delete;
        end;
      end;
      Screen.Cursor := crHourGlass;
      try
        MainForm.ExportXML(TempTreeView, FileName);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

end.
