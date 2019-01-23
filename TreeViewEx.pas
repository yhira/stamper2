unit TreeViewEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, ComCtrls, CommCtrl, Dialogs;

type
  TBoundaryStyle = (bsNone, bsTop, bsBottom);

  TTreeViewEx = class(TTreeView)
  private
		FDragging: Boolean;
    FOnMouseLeave: TNotifyEvent;
    FBoundaryLine: TBoundaryStyle;
    FTreeViewOldWndProc: TWndMethod;
    procedure CMMouseLeave(var Message: TMessage); message CM_MOUSELEAVE;
    procedure CMDrag(var Message: TCMDrag);  message CM_DRAG;
    procedure SetBoundaryLine(const Value: TBoundaryStyle);
    procedure TreeViewNewWndProc(var Message: TMessage);
  public
  published                 
    constructor Create(AOwner: TComponent); override;
  	property BoundaryLine: TBoundaryStyle read FBoundaryLine write SetBoundaryLine;
    property OnMouseLeave: TNotifyEvent read FOnMouseLeave write FOnMouseLeave;
  end;

procedure Register;

implementation

//uses main;

procedure Register;
begin
  RegisterComponents('UserCompo', [TTreeViewEx]);
end;

{ TTreeViewEx }

procedure TTreeViewEx.TreeViewNewWndProc(var Message: TMessage);
var 
  M: TMessage; 
begin 
  if (Message.Msg = TVM_SELECTITEM) and (Message.WParam = TVGN_DROPHILITE) and (FDragging) then
  begin 
    if BoundaryLine <> bsNone then begin
      if BoundaryLine = bsTop then begin
        Message.Msg := TVM_SETINSERTMARK;
        Message.WParam := integer(False); 
      end else if BoundaryLine = bsBottom then begin
        Message.Msg := TVM_SETINSERTMARK; 
        Message.WParam := integer(True); 
      end; 
    end; 
    case Message.Msg of
      TVM_SELECTITEM: begin
//      	MainForm.Memo2.Lines.Insert(0, 'TVM_SELECTITEM');
        SendMessage(Handle,TVM_SETINSERTMARK,0,0);

      end;
      TVM_SETINSERTMARK: begin
//      	MainForm.Memo2.Lines.Insert(0, 'TVM_SETINSERTMARK');
        ImageList_DragLeave(Handle);
        ImageList_DragShowNolock(False);

        M.Msg := TVM_SELECTITEM;
        M.WParam := TVGN_DROPHILITE;
        M.LParam := 0;
        FTreeViewOldWndProc(M);
      end;
    end;
  end;
  FTreeViewOldWndProc(Message);
end;


procedure TTreeViewEx.CMDrag(var Message: TCMDrag);
//var
//	p: TPoint;
//  n: TTreeNode;
begin
	inherited;

  with Message, DragRec^ do begin
    case DragMessage of
      dmDragEnter:begin
        FDragging := True;
//        Source.HideDragImage;
      end;
      dmDragLeave:begin
        FDragging := False;
//        Source.ShowDragImage;
      end;
      dmDragMove:begin

      end;
      dmDragDrop:begin

      end;
      dmDragCancel:begin

      end;
      dmFindTarget:begin

      end;
    end;
  end;





//  with Message, DragRec^ do begin
//    case Message.DragMessage of
//      dmDragEnter: MainForm.Memo1.Lines.Insert(0,'dmDragEnter');
//      dmDragLeave: MainForm.Memo1.Lines.Insert(0,'dmDragLeave');
//      dmDragMove: MainForm.Memo1.Lines.Insert(0,'dmDragMove');
//      dmDragDrop: MainForm.Memo1.Lines.Insert(0,'dmDragDrop');
//      dmDragCancel: MainForm.Memo1.Lines.Insert(0,'dmDragCancel');
//      dmFindTarget:begin
//        MainForm.Memo1.Lines.Insert(0,'dmFindTarget');
//        TreeView_SetInsertMark(Handle, 0, False);
//      end;
//    end;
//  end;

end;

procedure TTreeViewEx.CMMouseLeave(var Message: TMessage);
begin
//  inherited;
  if Assigned(FOnMouseLeave) then
    FOnMouseLeave(Self);
end;

procedure TTreeViewEx.SetBoundaryLine(const Value: TBoundaryStyle);
begin
	if FBoundaryLine <> Value then begin
  	FBoundaryLine := Value;
//    case FBoundaryLine of
//      bsNone: TreeView_SetInsertMark(Handle, 0, True);
//      bsTop: TreeView_SetInsertMark(Handle, Integer(DropTarget.ItemID), False);
//      bsBottom: TreeView_SetInsertMark(Handle, Integer(DropTarget.ItemID), True);
//    end;

  end;
end;


constructor TTreeViewEx.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FDragging := False;
  FTreeViewOldWndProc := WindowProc;
  WindowProc := TreeViewNewWndProc;
end;

end.
