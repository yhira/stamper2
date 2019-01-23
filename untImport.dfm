object ImportForm: TImportForm
  Left = 551
  Top = 159
  BorderStyle = bsDialog
  Caption = #12452#12531#12509#12540#12488
  ClientHeight = 301
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 174
    Top = 0
    Width = 86
    Height = 301
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Bevel1: TBevel
      Left = 2
      Top = 268
      Width = 84
      Height = 31
    end
    object Label1: TLabel
      Left = 5
      Top = 271
      Width = 33
      Height = 12
      Caption = 'Label1'
    end
    object CloseButton: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = #38281#12376#12427
      TabOrder = 0
      OnClick = CloseButtonClick
    end
    object ImportButton: TButton
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Caption = #65394#65437#65422#65439#65392#65412
      TabOrder = 1
      OnClick = ImportButtonClick
    end
    object AllImportButton: TButton
      Left = 8
      Top = 80
      Width = 75
      Height = 25
      Caption = #20840#12390#65394#65437#65422#65439#65392#65412
      TabOrder = 2
      OnClick = AllImportButtonClick
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 174
    Height = 301
    Align = alClient
    HideSelection = False
    Images = MainForm.TreeImageList
    Indent = 19
    MultiSelect = True
    MultiSelectStyle = [msControlSelect, msShiftSelect, msSiblingOnly]
    ReadOnly = True
    RowSelect = True
    ShowButtons = False
    ShowLines = False
    ShowRoot = False
    TabOrder = 1
    OnExpanding = TreeView1Expanding
  end
  object TempTreeView: TTreeView
    Left = 8
    Top = 200
    Width = 145
    Height = 97
    Indent = 19
    MultiSelect = True
    MultiSelectStyle = [msControlSelect, msShiftSelect, msSiblingOnly]
    TabOrder = 2
    Visible = False
  end
end
