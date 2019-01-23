object NameEditDlg: TNameEditDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = #12480#12452#12450#12525#12464
  ClientHeight = 102
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 33
    Height = 12
    Caption = 'Label1'
  end
  object OKBtn: TButton
    Left = 111
    Top = 68
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 191
    Top = 68
    Width = 75
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 1
    OnClick = CancelBtnClick
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 257
    Height = 20
    TabOrder = 2
    Text = 'Edit1'
  end
end
