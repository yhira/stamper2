object ClipToPasteDlg: TClipToPasteDlg
  Left = 535
  Top = 141
  BorderStyle = bsDialog
  Caption = #12480#12452#12450#12525#12464
  ClientHeight = 388
  ClientWidth = 551
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
    Top = 356
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
    Top = 356
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
    Height = 337
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object lblComment: TLabel
      Left = 8
      Top = 48
      Width = 53
      Height = 12
      Caption = #12467#12513#12531#12488'(&C)'
    end
    object Label3: TLabel
      Left = 8
      Top = 112
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
    object Label1: TLabel
      Left = 8
      Top = 168
      Width = 86
      Height = 12
      Caption = #36861#21152#12377#12427#22580#25152'(&A)'
    end
    object sbCreateCategory: TSpeedButton
      Left = 200
      Top = 160
      Width = 23
      Height = 22
      Hint = #12459#12486#12468#12522#12398#26032#35215#20316#25104
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF0021182100211821002118210021182100211821002118
        210021182100FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00211821002118210021182100211821002118210021182100211821002118
        2100211821002118210021182100FF00FF00FF00FF00FF00FF00FF00FF002118
        210021182100292931006B6BB5005263EF00637BF7006B7BF7006373F700525A
        E7006B63B500292931002118210021182100FF00FF00FF00FF00FF00FF002118
        21004A4A5A00424ADE006B7BF7007384FF007384FF007384FF007384FF007384
        FF006B7BF700394ADE00524A630021182100FF00FF00FF00FF00211821002921
        39003142DE006373F7006373F7006B73F700636BC6006B7BFF00636BBD006373
        DE006B73F7006373EF003942DE002921390021182100FF00FF00211821003942
        CE004A52DE005A6BEF005A6BEF005A63D600525ABD005A6BFF005A63C600525A
        BD005A6BF7005A6BEF004A52DE003942CE0021182100FF00FF0031214A003942
        D6004252DE00525AE700525AE7004A4A8C004A52CE004A4A6B004A5AC6004A5A
        DE004A52AD00525AE700424ADE003942DE0031215200FF00FF0039318C003942
        AD003942AD00424AB50042429400424AB500424ADE00424AE700424AA500424A
        E70042428C00424AB5003942D6003942AD0039319C00FF00FF00313184003139
        A5003139C6003131730031316B003139B50031314A0031398C00313152003131
        4A00313994003139B5003131520031399C003139A500FF00FF00313184002931
        6B00293173002929520031399C003139B5003139A5003139AD00313994003139
        A5003139730029317B0029317B0029317B0031317B00FF00FF0031297B002929
        8C0021298C004A529C004A4A94004A4A84004A4A7B004A4A84004A528C004A4A
        73004A4A73004A52A50021298C0029298C0031297B00FF00FF00392163001821
        6B00424284006B6B8C006B6B9C006B6B8C006B6BA5006B6B9C006B6B9C006B6B
        A5006B6BA5006B73A50039397B0018216B0039216300FF00FF00FF00FF001010
        4A0063638C0094949C009494AD0094949C009494AD009494AD009494AD009494
        AD009494AD009494AD004A4A730010184A00FF00FF00FF00FF00FF00FF003921
        5A0018213900CECED600BDBDBD00BDBDC600BDBDC600BDBDC600BDBDC600BDBD
        C600BDBDC600CECED6000810290039215A00FF00FF00FF00FF00FF00FF00FF00
        FF003118520052525A00F7F7F700E7E7E700DEDEE700DEDEE700DEDEE700E7E7
        E700F7F7F7003139420031184A00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00210839001808210073737B00CECECE00EFEFEF00C6CEC6006B6B
        6B001008210021103900FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCreateCategoryClick
    end
    object sbCreateFolder: TSpeedButton
      Left = 224
      Top = 160
      Width = 23
      Height = 22
      Hint = #12501#12457#12523#12480#12398#26032#35215#20316#25104
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF0063CECE0063CE
        CE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CECE0063CE
        CE0063CECE0063CECE0063CECE0063CECE0063CECE0063636300CEFFFF00CEFF
        FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
        FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00ADADAD0063636300CEFFFF00CEFF
        FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00CEFF
        FF00CEFFFF00CEFFFF00CEFFFF00CEFFFF00ADADAD0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE0063636300EFEFEF007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEFF7007BEF
        F7007BEFF7007BEFF7007BEFF7007BEFF70063CECE006363630094CECE00EFEF
        EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEF
        EF00EFEFEF00EFEFEF00EFEFEF00EFEFEF0094CECE00636363006BDEE7006BDE
        E7006BDEE7006BDEE7006BDEE7006BDEE70063CECE0063CECE0063CECE0063CE
        CE0063CECE0063CECE0063CECE0063CECE0063CECE00FF00FF00FF00FF006BDE
        E7006BDEE7006BDEE7006BDEE70063CECE00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
      ParentShowHint = False
      ShowHint = True
      OnClick = sbCreateFolderClick
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
      Top = 64
      Width = 241
      Height = 41
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = memCommentChange
    end
    object memPasteData: TEditorEx
      Left = 264
      Top = 24
      Width = 257
      Height = 305
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
    object cbPasteMode: TComboBoxEx
      Left = 8
      Top = 128
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
      TabOrder = 3
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
      TabOrder = 4
      OnClick = cbSignClick
    end
    object tvSelect: TTreeView
      Left = 8
      Top = 184
      Width = 241
      Height = 145
      AutoExpand = True
      HideSelection = False
      Images = MainForm.TreeImageList
      Indent = 19
      ReadOnly = True
      ShowRoot = False
      TabOrder = 5
      OnAddition = tvSelectAddition
    end
  end
  object ActionList1: TActionList
    Left = 304
    Top = 216
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
    Left = 376
    Top = 216
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
