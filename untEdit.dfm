object EditForm: TEditForm
  Left = 192
  Top = 117
  Width = 337
  Height = 286
  Caption = #31777#26131#12456#12487#12451#12479
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 329
    Height = 224
    Align = alClient
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 224
    Width = 329
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      329
      35)
    object Button1: TButton
      Left = 170
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #12467#12500#12540
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 250
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #20999#12426#21462#12426
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
