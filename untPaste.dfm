object PasteDlg: TPasteDlg
  Left = 535
  Top = 141
  BorderStyle = bsDialog
  Caption = #12480#12452#12450#12525#12464
  ClientHeight = 345
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object OKBtn: TButton
    Left = 383
    Top = 316
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 463
    Top = 316
    Width = 75
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 537
    Height = 297
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lblComment: TLabel
      Left = 8
      Top = 56
      Width = 53
      Height = 12
      Caption = #12467#12513#12531#12488'(&C)'
    end
    object Label1: TLabel
      Left = 8
      Top = 241
      Width = 38
      Height = 12
      Caption = #20316#25104#26085':'
    end
    object lblCreateDay: TLabel
      Left = 72
      Top = 241
      Width = 66
      Height = 12
      Caption = 'lblCreateDay'
    end
    object Label2: TLabel
      Left = 8
      Top = 265
      Width = 38
      Height = 12
      Caption = #26356#26032#26085':'
    end
    object lblUpdateDay: TLabel
      Left = 72
      Top = 265
      Width = 68
      Height = 12
      Caption = 'lblUpdateDay'
    end
    object Label3: TLabel
      Left = 8
      Top = 136
      Width = 48
      Height = 12
      Caption = #12514#12540#12489'(&M)'
    end
    object Label4: TLabel
      Left = 264
      Top = 8
      Width = 99
      Height = 12
      Caption = #12487#12540#12479'(&D)  *'#35201#20837#21147
      FocusControl = memPasteData
    end
    object Bevel1: TBevel
      Left = 256
      Top = 32
      Width = 50
      Height = 233
      Shape = bsLeftLine
    end
    object leName: TLabeledEdit
      Left = 8
      Top = 24
      Width = 241
      Height = 20
      EditLabel.Width = 90
      EditLabel.Height = 12
      EditLabel.Caption = #21517#21069'(&N)  *'#35201#20837#21147
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      LabelPosition = lpAbove
      LabelSpacing = 3
      ParentFont = False
      TabOrder = 0
      OnDblClick = leNameDblClick
    end
    object memComment: TMemo
      Left = 8
      Top = 72
      Width = 241
      Height = 57
      ScrollBars = ssVertical
      TabOrder = 1
      OnDblClick = memCommentDblClick
    end
    object memPasteData: TEditorEx
      Left = 264
      Top = 24
      Width = 257
      Height = 257
      Cursor = crIBeam
      Caret.AutoCursor = True
      Caret.AutoIndent = True
      Caret.BackSpaceUnIndent = True
      Caret.Cursors.DefaultCursor = crIBeam
      Caret.Cursors.DragSelCursor = crDrag
      Caret.Cursors.DragSelCopyCursor = 2
      Caret.Cursors.InSelCursor = crDefault
      Caret.Cursors.LeftMarginCursor = 1
      Caret.Cursors.TopMarginCursor = crDefault
      Caret.FreeCaret = False
      Caret.FreeRow = False
      Caret.InTab = False
      Caret.KeepCaret = False
      Caret.LockScroll = False
      Caret.NextLine = False
      Caret.PrevSpaceIndent = False
      Caret.RowSelect = True
      Caret.SelDragMode = dmManual
      Caret.SelMove = True
      Caret.SoftTab = False
      Caret.Style = csDefault
      Caret.TabIndent = False
      Caret.TabSpaceCount = 8
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'FixedSys'
      Font.Style = []
      HitStyle = hsSelect
      Imagebar.DigitWidth = 0
      Imagebar.LeftMargin = 0
      Imagebar.MarkWidth = 0
      Imagebar.RightMargin = 2
      Imagebar.Visible = True
      Lines.Strings = (
        'EditorEx1')
      Marks.EofMark.Color = clGray
      Marks.EofMark.Visible = False
      Marks.RetMark.Color = clSilver
      Marks.RetMark.Visible = True
      Marks.WrapMark.Color = clGray
      Marks.WrapMark.Visible = False
      Marks.HideMark.Color = clGray
      Marks.HideMark.Visible = False
      Marks.Underline.Color = clGray
      Marks.Underline.Visible = False
      Margin.Character = 0
      Margin.Left = 0
      Margin.Line = 0
      Margin.Top = 2
      Leftbar.BkColor = clSilver
      Leftbar.Color = clBlack
      Leftbar.Column = 4
      Leftbar.Edge = True
      Leftbar.LeftMargin = 8
      Leftbar.RightMargin = 4
      Leftbar.ShowNumber = True
      Leftbar.ShowNumberMode = nmRow
      Leftbar.Visible = False
      Leftbar.ZeroBase = False
      Leftbar.ZeroLead = False
      PopupMenu = PopupMenu1
      ReadOnly = False
      Ruler.BkColor = clSilver
      Ruler.Color = clBlack
      Ruler.Edge = True
      Ruler.GaugeRange = 10
      Ruler.MarkColor = clBlack
      Ruler.Visible = False
      ScrollBars = ssBoth
      Speed.CaretVerticalAc = 2
      Speed.InitBracketsFull = False
      Speed.PageVerticalRange = 2
      Speed.PageVerticalRangeAc = 2
      TabOrder = 2
      UndoListMax = 64
      View.Brackets = <>
      View.Colors.Ank.BkColor = clNone
      View.Colors.Ank.Color = clNone
      View.Colors.Ank.Style = []
      View.Colors.Comment.BkColor = clNone
      View.Colors.Comment.Color = clNone
      View.Colors.Comment.Style = []
      View.Colors.DBCS.BkColor = clNone
      View.Colors.DBCS.Color = clNone
      View.Colors.DBCS.Style = []
      View.Colors.Hit.BkColor = clNone
      View.Colors.Hit.Color = clNone
      View.Colors.Hit.Style = []
      View.Colors.Int.BkColor = clNone
      View.Colors.Int.Color = clNone
      View.Colors.Int.Style = []
      View.Colors.Mail.BkColor = clNone
      View.Colors.Mail.Color = clNone
      View.Colors.Mail.Style = []
      View.Colors.Reserve.BkColor = clNone
      View.Colors.Reserve.Color = clNone
      View.Colors.Reserve.Style = []
      View.Colors.Select.BkColor = clNavy
      View.Colors.Select.Color = clWhite
      View.Colors.Select.Style = []
      View.Colors.Str.BkColor = clNone
      View.Colors.Str.Color = clNone
      View.Colors.Str.Style = []
      View.Colors.Symbol.BkColor = clNone
      View.Colors.Symbol.Color = clNone
      View.Colors.Symbol.Style = []
      View.Colors.Url.BkColor = clNone
      View.Colors.Url.Color = clNone
      View.Colors.Url.Style = []
      View.ControlCode = False
      View.Mail = False
      View.Url = False
      WantReturns = True
      WantTabs = True
      WordWrap = False
      WrapOption.FollowRetMark = False
      WrapOption.FollowPunctuation = False
      WrapOption.FollowStr = #12289#12290#65292#65294#12539#65311#65281#12443#12444#12541#12542#12445#12446#12293#12540#65289#65341#65373#12301#12303'!),.:;?]}'#65377#65379#65380#65381#65392#65438#65439
      WrapOption.Leading = False
      WrapOption.LeadStr = #65288#65339#65371#12300#12302'([{'#65378
      WrapOption.PunctuationStr = #12289#12290#65292#65294',.'#65377#65380
      WrapOption.WordBreak = False
      WrapOption.WrapByte = 80
      ExMarks.DBSpaceMark.Color = clSilver
      ExMarks.DBSpaceMark.Visible = True
      ExMarks.SpaceMark.Color = clGray
      ExMarks.SpaceMark.Visible = True
      ExMarks.TabMark.Color = clSilver
      ExMarks.TabMark.Visible = True
      ExMarks.FindMark.Color = clSilver
      ExMarks.FindMark.Visible = False
      ExSearchOptions = []
      VerticalLines = <>
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 184
      Width = 241
      Height = 49
      Caption = #20351#29992#38971#24230
      TabOrder = 3
      object Label5: TLabel
        Left = 8
        Top = 22
        Width = 48
        Height = 12
        Caption = #20351#29992#22238#25968
      end
      object Label6: TLabel
        Left = 128
        Top = 24
        Width = 12
        Height = 12
        Caption = #22238
      end
      object btnReset: TButton
        Left = 160
        Top = 16
        Width = 75
        Height = 25
        Caption = #12522#12475#12483#12488'(&R)'
        TabOrder = 0
        OnClick = btnResetClick
      end
      object edtUseCount: TEdit
        Left = 72
        Top = 19
        Width = 49
        Height = 20
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
    end
    object cbPasteMode: TComboBoxEx
      Left = 8
      Top = 152
      Width = 241
      Height = 22
      ItemsEx.CaseSensitive = False
      ItemsEx.SortType = stNone
      ItemsEx = <
        item
          Caption = 'Paste'
          ImageIndex = 15
          SelectedImageIndex = 15
        end
        item
          Caption = 'Paste + Tab'
          ImageIndex = 16
          SelectedImageIndex = 16
        end
        item
          Caption = 'Paste + Enter'
          ImageIndex = 17
          SelectedImageIndex = 17
        end
        item
          Caption = 'Paste + '#8593
          ImageIndex = 18
          SelectedImageIndex = 18
        end
        item
          Caption = 'Paste + '#8595
          ImageIndex = 19
          SelectedImageIndex = 19
        end
        item
          Caption = 'Paste + '#8592
          ImageIndex = 20
          SelectedImageIndex = 20
        end
        item
          Caption = 'Paste + '#8594
          ImageIndex = 21
          SelectedImageIndex = 21
        end
        item
          Caption = 'Clipboard'
          ImageIndex = 22
          SelectedImageIndex = 22
        end
        item
          Caption = 'Browse'
          ImageIndex = 23
          SelectedImageIndex = 23
        end
        item
          Caption = 'Execute'
          ImageIndex = 24
          SelectedImageIndex = 24
        end>
      Style = csExDropDownList
      StyleEx = []
      ItemHeight = 16
      TabOrder = 4
      Images = MainForm.TreeImageList
      DropDownCount = 15
    end
    object cbSign: TCheckBox
      Left = 448
      Top = 8
      Width = 73
      Height = 17
      Caption = #35352#21495#34920#31034
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = cbSignClick
    end
  end
  object ActionList1: TActionList
    Left = 168
    Top = 272
    object EditCut1: TEditCut
      Category = #32232#38598
      Caption = #20999#12426#21462#12426'(&T)'
      Hint = #20999#12426#21462#12426'|'#36984#25246#37096#20998#12434#20999#12426#21462#12426#12289#12463#12522#12483#12503#12508#12540#12489#12395#36865#12427
      ImageIndex = 0
      OnExecute = EditCut1Execute
    end
    object EditCopy1: TEditCopy
      Category = #32232#38598
      Caption = #12467#12500#12540'(&C)'
      Hint = #12467#12500#12540'|'#36984#25246#37096#20998#12434#12467#12500#12540#12375#12289#12463#12522#12483#12503#12508#12540#12489#12395#36865#12427
      ImageIndex = 1
      OnExecute = EditCopy1Execute
    end
    object EditPaste1: TEditPaste
      Category = #32232#38598
      Caption = #36028#12426#20184#12369'(&P)'
      Hint = #36028#12426#20184#12369'|'#12463#12522#12483#12503#12508#12540#12489#12398#20869#23481#12434#36028#12426#20184#12369#12427
      ImageIndex = 2
      OnExecute = EditPaste1Execute
    end
    object EditSelectAll1: TEditSelectAll
      Category = #32232#38598
      Caption = #12377#12409#12390#12434#36984#25246'(&A)'
      Hint = #12377#12409#12390#12434#36984#25246'|'#12489#12461#12517#12513#12531#12488#20840#20307#12434#36984#25246#12377#12427
      OnExecute = EditSelectAll1Execute
    end
    object EditUndo1: TEditUndo
      Category = #32232#38598
      Caption = #20803#12395#25147#12377'(&U)'
      Hint = #20803#12395#25147#12377'|'#30452#21069#12398#22793#26356#12434#20803#12395#25147#12377
      ImageIndex = 3
      OnExecute = EditUndo1Execute
    end
    object EditDelete1: TEditDelete
      Category = #32232#38598
      Caption = #21066#38500'(&D)'
      Hint = #21066#38500'|'#36984#25246#37096#20998#12434#21066#38500#12377#12427
      ImageIndex = 5
      OnExecute = EditDelete1Execute
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 200
    Top = 272
    object Undo1: TMenuItem
      Action = EditUndo1
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Cut1: TMenuItem
      Action = EditCut1
    end
    object Copy1: TMenuItem
      Action = EditCopy1
    end
    object Paste1: TMenuItem
      Action = EditPaste1
    end
    object Delete1: TMenuItem
      Action = EditDelete1
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object A1: TMenuItem
      Action = EditSelectAll1
    end
  end
end
