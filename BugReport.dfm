object BugReportForm: TBugReportForm
  Left = 404
  Top = 173
  BorderStyle = bsDialog
  Caption = #12496#12464#12524#12509#12540#12488
  ClientHeight = 305
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object BugLabel: TLabel
    Left = 8
    Top = 8
    Width = 409
    Height = 33
    AutoSize = False
    Caption = 'BugLabel'
    WordWrap = True
  end
  object WebPageLabel: TLabel
    Left = 8
    Top = 272
    Width = 132
    Height = 12
    Caption = 'http://mousist.cside.com/'
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    Visible = False
    OnClick = WebPageLabelClick
    OnMouseMove = WebPageLabelMouseMove
    OnMouseLeave = WebPageLabelMouseLeave
  end
  object BugMemo: TMemo
    Left = 8
    Top = 47
    Width = 409
    Height = 217
    Lines.Strings = (
      'BugMemo')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object CloseButton: TButton
    Left = 344
    Top = 272
    Width = 75
    Height = 25
    Caption = #38281#12376#12427
    TabOrder = 1
    OnClick = CloseButtonClick
  end
  object CopyButton: TButton
    Left = 256
    Top = 272
    Width = 75
    Height = 25
    Caption = #12467#12500#12540
    TabOrder = 2
    OnClick = CopyButtonClick
  end
end
