object InputFolder: TInputFolder
  Left = 381
  Top = 128
  BorderStyle = bsDialog
  Caption = #12501#12457#12523#12480#21517
  ClientHeight = 104
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 149
    Height = 12
    Caption = #12501#12457#12523#12480#21517#12434#20837#21147#12375#12390#19979#12373#12356#12290
  end
  object InputEdit: TEdit
    Left = 8
    Top = 32
    Width = 193
    Height = 20
    TabOrder = 0
    Text = #26032#35215#12501#12457#12523#12480
    OnKeyDown = InputEditKeyDown
  end
  object OKBtn: TButton
    Left = 48
    Top = 64
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 128
    Top = 64
    Width = 75
    Height = 25
    Caption = #12461#12515#12531#12475#12523
    TabOrder = 2
    OnClick = CancelBtnClick
  end
end
