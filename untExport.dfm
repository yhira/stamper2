object ExportForm: TExportForm
  Left = 414
  Top = 141
  BorderStyle = bsDialog
  Caption = #12456#12463#12473#12509#12540#12488
  ClientHeight = 303
  ClientWidth = 262
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
    Left = 176
    Top = 0
    Width = 86
    Height = 303
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 271
      Width = 33
      Height = 12
      Caption = 'Label1'
    end
    object Bevel1: TBevel
      Left = 2
      Top = 268
      Width = 84
      Height = 31
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
    object ExportButton: TButton
      Left = 8
      Top = 48
      Width = 75
      Height = 25
      Caption = #65396#65400#65405#65422#65439#65392#65412
      TabOrder = 1
      OnClick = ExportButtonClick
    end
    object AllExportButton: TButton
      Left = 8
      Top = 80
      Width = 75
      Height = 25
      Caption = #20840#12390#65396#65400#65405#65422#65439#65392#65412
      TabOrder = 2
      OnClick = AllExportButtonClick
    end
    object ExportXMLButton: TButton
      Left = 8
      Top = 240
      Width = 75
      Height = 25
      Caption = 'XML'#65396#65400#65405#65422#65439#65392#65412
      TabOrder = 3
      OnClick = ExportXMLButtonClick
    end
  end
  object TreeView1: TTreeView
    Left = 0
    Top = 0
    Width = 176
    Height = 303
    Align = alClient
    Images = MainForm.TreeImageList
    Indent = 19
    MultiSelect = True
    MultiSelectStyle = [msControlSelect, msShiftSelect]
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
    Top = 176
    Width = 81
    Height = 121
    Indent = 19
    MultiSelectStyle = [msControlSelect, msSiblingOnly]
    ReadOnly = True
    TabOrder = 2
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 232
    Top = 272
  end
  object XmlSaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML'#12501#12449#12452#12523'(*.xml)|*.xml|'#12377#12409#12390#12398#12501#12449#12452#12523'(*.*)|*.*'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 144
    Top = 272
  end
end
