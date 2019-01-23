unit untImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Main, stmItem;

type
  TImportForm = class(TForm)
    Panel1: TPanel;
    CloseButton: TButton;
    ImportButton: TButton;
    AllImportButton: TButton;
    TreeView1: TTreeView;
    TempTreeView: TTreeView;
    Bevel1: TBevel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure CloseButtonClick(Sender: TObject);
    procedure AllImportButtonClick(Sender: TObject);
    procedure ImportButtonClick(Sender: TObject);
  private
    { Private éŒ¾ }
    procedure ImportNode(Tree: TTreeView);
  public
    { Public éŒ¾ }
  end;

var
  ImportForm: TImportForm;

implementation

{$R *.dfm}

procedure TImportForm.FormCreate(Sender: TObject);
begin
  Label1.Caption := '•¡”‘I‘ð' + #13#10 +
                  '[Shift] or [Ctrl]';
end;

procedure TImportForm.TreeView1Expanding(Sender: TObject; Node: TTreeNode;
  var AllowExpansion: Boolean);
begin
	AllowExpansion := False;
end;

procedure TImportForm.CloseButtonClick(Sender: TObject);
begin
	Close;
end;

procedure TImportForm.AllImportButtonClick(Sender: TObject);
begin
  ImportNode(TreeView1);
  MainForm.FModified := True;
  Close;
end;


procedure TImportForm.ImportButtonClick(Sender: TObject);
var
	i: Integer;
begin
	if TreeView1.SelectionCount = 0 then
  	Application.MessageBox('‚Ç‚ê‚©ˆê‚Â‘I‘ð‚µ‚Ä‚­‚¾‚³‚¢B',
                           PChar(Application.Title),
                           MB_ICONINFORMATION);
	TempTreeView.Items.Assign(TreeView1.Items);
  for i := TreeView1.Items.Count -1 downto 0 do begin
    if (TreeView1.Items[i].Selected = False) and
       (TreeView1.Items[i].Level = 0) then begin
      TempTreeView.Items[i].Delete;
    end;
  end;
  ImportNode(TempTreeView);
  for i := TreeView1.SelectionCount -1 downto 0 do begin
    if TreeView1.Selections[i].Level = 0 then begin
      TreeView1.Selections[i].Delete;
    end;
  end;
  MainForm.FModified := True;
  if TreeView1.Items.Count = 0 then Close;
end;

procedure TImportForm.ImportNode(Tree: TTreeView);
  procedure NodeMove(ANode: TTreeNode; var IntA, IntB:Integer);
  begin
    if IntB > IntA then
    begin
      IntB := IntA;
      while ANode.Level > IntA do
      begin
        ANode.MoveTo(ANode.Parent, naAdd);
      end;
    end
    else
    begin
      if IntB < IntA then
      begin
        IntB := IntA;
        ANode.MoveTo(ANode.GetPrev, naAddChild);
      end;
    end;
  end;
var
	Node, impNode: TTreeNode;
  IntLevelA, IntLevelB: Integer;
begin
  IntLevelB := 0;
	impNode := nil;

  Node := Tree.Items.GetFirstNode;
  while Node <> nil do begin
    	IntLevelA := Node.Level;

      impNode := MainForm.tvPaste.Items.AddObject(impNode, Node.Text, Node.Data);
      NodeMove(impNode, IntLevelA, IntLevelB);

  	Node := Node.GetNext;
  end;
  MainForm.tvPaste.FullCollapse;
end;

end.
