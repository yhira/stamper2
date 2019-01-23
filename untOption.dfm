object OptionDlg: TOptionDlg
  Left = 577
  Top = 125
  BorderStyle = bsDialog
  Caption = 'stamper2'#12398#35373#23450
  ClientHeight = 300
  ClientWidth = 427
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 427
    Height = 266
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 5
    ParentColor = True
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 417
      Height = 256
      ActivePage = tsDsp
      Align = alClient
      TabOrder = 0
      object tsStan: TTabSheet
        Caption = #27161#28310#35373#23450
        object gbSound: TGroupBox
          Left = 0
          Top = 160
          Width = 409
          Height = 65
          Caption = #38899#35373#23450
          TabOrder = 0
          object Label1: TLabel
            Left = 8
            Top = 43
            Width = 56
            Height = 12
            Caption = #12501#12449#12452#12523'(&F)'
            FocusControl = edtSoundFile
          end
          object cbSound: TCheckBox
            Left = 8
            Top = 16
            Width = 265
            Height = 17
            Caption = #36028#12426#20184#12369#12427#12392#12365#38899#12434#40180#12425#12377'(&S)'
            TabOrder = 0
          end
          object edtSoundFile: TEdit
            Left = 72
            Top = 40
            Width = 305
            Height = 20
            TabOrder = 1
            Text = 'edtSoundFile'
          end
          object btnSound: TButton
            Left = 376
            Top = 40
            Width = 20
            Height = 20
            Caption = '...'
            TabOrder = 2
            OnClick = btnSoundClick
          end
        end
        object cbAutoExpand: TCheckBox
          Left = 8
          Top = 8
          Width = 345
          Height = 17
          Caption = '1'#12463#12522#12483#12463#12391#12484#12522#12540#12450#12452#12486#12512#12434#23637#38283#12539#32302#23567#12377#12427'(&E)'
          TabOrder = 1
        end
        object cbDeleteCheck: TCheckBox
          Left = 8
          Top = 32
          Width = 273
          Height = 17
          Caption = #12450#12452#12486#12512#12434#21066#38500#12377#12427#12392#12365#30906#35469#12377#12427'(&C)'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object gbPass: TGroupBox
          Left = 0
          Top = 112
          Width = 409
          Height = 41
          Caption = #31777#26131#12475#12461#12517#12522#12486#12451#12540#35373#23450
          TabOrder = 3
          object cbPass: TCheckBox
            Left = 8
            Top = 16
            Width = 193
            Height = 17
            Caption = #36215#21205#12497#12473#12527#12540#12489#35373#23450
            TabOrder = 0
            OnClick = cbPassClick
            OnMouseUp = cbPassMouseUp
          end
          object btnPass: TButton
            Left = 328
            Top = 11
            Width = 75
            Height = 25
            Caption = #22793#26356
            TabOrder = 1
            OnClick = btnPassClick
          end
        end
        object cbStealth: TCheckBox
          Left = 8
          Top = 56
          Width = 241
          Height = 17
          Caption = 'Stamper2'#36215#21205#26178#12473#12486#12523#12473#12514#12540#12489#12391#36215#21205'(&L)'
          TabOrder = 4
        end
        object cbExpanded: TCheckBox
          Left = 8
          Top = 80
          Width = 393
          Height = 17
          Caption = #12484#12522#12540#12398#23637#38283#29366#24907#12434#20445#23384#12375#27425#22238#36215#21205#26178#24489#20803#12377#12427'(&T)'
          TabOrder = 5
        end
      end
      object tsDsp: TTabSheet
        Caption = #34920#31034#35373#23450
        object cbHotTrack: TCheckBox
          Left = 8
          Top = 16
          Width = 281
          Height = 17
          Caption = #12484#12522#12540#12450#12452#12486#12512#12395#12510#12454#12473#12364#37325#12394#12427#12392#24375#35519#34920#31034#12377#12427'(&H)'
          TabOrder = 0
        end
        object cbPopHint: TCheckBox
          Left = 8
          Top = 40
          Width = 305
          Height = 17
          Caption = #12509#12483#12503#12450#12483#12503#12498#12531#12488#12434#34920#31034#12377#12427'(&P)'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object gbStealth: TGroupBox
          Left = 224
          Top = 84
          Width = 177
          Height = 137
          Caption = #12473#12486#12523#12473#20301#32622
          TabOrder = 2
          object pnlStealth: TPanel
            Left = 30
            Top = 34
            Width = 113
            Height = 73
            Color = clBackground
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindow
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            object PaintBox1: TPaintBox
              Left = 1
              Top = 1
              Width = 111
              Height = 71
              Align = alClient
              Color = clBackground
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindow
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              OnPaint = PaintBox1Paint
            end
            object StealthLabel: TLabel
              Left = 15
              Top = 32
              Width = 86
              Height = 12
              Caption = #12487#12451#12473#12503#12524#12452#30011#38754
              Color = clWindow
              Font.Charset = SHIFTJIS_CHARSET
              Font.Color = clWindow
              Font.Height = -12
              Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
          end
          object cbStealthTL: TCheckBox
            Left = 16
            Top = 16
            Width = 97
            Height = 17
            Caption = #24038#19978
            Checked = True
            State = cbChecked
            TabOrder = 1
            OnClick = cbStealthTLClick
          end
          object cbStealthTR: TCheckBox
            Left = 120
            Top = 16
            Width = 41
            Height = 17
            Alignment = taLeftJustify
            Caption = #21491#19978
            Checked = True
            State = cbChecked
            TabOrder = 2
            OnClick = cbStealthTLClick
          end
          object cbStealthBL: TCheckBox
            Left = 16
            Top = 112
            Width = 97
            Height = 17
            Caption = #24038#19979
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = cbStealthTLClick
          end
          object cbStealthBR: TCheckBox
            Left = 120
            Top = 112
            Width = 41
            Height = 17
            Alignment = taLeftJustify
            Caption = #21491#19979
            Checked = True
            State = cbChecked
            TabOrder = 4
            OnClick = cbStealthTLClick
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 164
          Width = 169
          Height = 57
          Caption = #12479#12502#20301#32622
          TabOrder = 3
          object cbTabPos: TComboBox
            Left = 8
            Top = 21
            Width = 145
            Height = 20
            Style = csDropDownList
            ItemHeight = 12
            ItemIndex = 1
            TabOrder = 0
            Text = #19978#37096
            Items.Strings = (
              #12394#12375
              #19978#37096
              #19979#37096
              #24038#20596
              #21491#20596)
          end
        end
        object cbAnimation: TCheckBox
          Left = 8
          Top = 64
          Width = 249
          Height = 17
          Caption = #12450#12491#12513#12540#12471#12519#12531#12434#34892#12358'(&A)  *Win2000'#12289'XP'#12398#12415
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
      end
      object tsClip: TTabSheet
        Caption = #65400#65432#65391#65420#65439#65422#65438#65392#65412#65438#23653#27508#35373#23450
        object gbClip: TGroupBox
          Left = 8
          Top = 8
          Width = 393
          Height = 209
          Caption = 'gbClip'
          TabOrder = 0
          object Label2: TLabel
            Left = 8
            Top = 24
            Width = 180
            Height = 12
            Caption = #65400#65432#65391#65420#65439#65422#65438#65392#65412#65438#23653#27508#20445#23384#20491#25968'(10 - 500)'
            FocusControl = seHistoryCount
          end
          object lblClipAddFirst: TLabel
            Left = 5
            Top = 91
            Width = 457
            Height = 12
            Caption = '('#65290#20840#12367#21516#65411#65438#65392#65408#12364#65400#65432#65391#65420#65439#65422#65438#65392#65412#65438#23653#27508#12395#12354#12427#22580#21512#12289#20197#21069#12398#65411#65438#65392#65408#12434#28040#12375#12390#20808#38957#12395#36861#21152#12377#12427#12363#12393#12358#12363')'
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            ParentFont = False
          end
          object seHistoryCount: TSpinEdit
            Left = 198
            Top = 19
            Width = 49
            Height = 21
            MaxValue = 500
            MinValue = 10
            TabOrder = 0
            Value = 10
          end
          object cbReadHistory: TCheckBox
            Left = 8
            Top = 48
            Width = 289
            Height = 17
            Caption = #21069#22238#20351#29992#12375#12383#23653#27508#12487#12540#12479#12434#35501#12415#36796#12416'(&R)'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object cbAddFirst: TCheckBox
            Left = 8
            Top = 72
            Width = 369
            Height = 17
            Caption = #24120#12395#65410#65432#65392#12398#20808#38957#12395#65400#65432#65391#65420#65439#65422#65438#65392#65412#65438#65411#65438#65392#65408#12434#36861#21152'(&A)'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
          object cbNotPasteData: TCheckBox
            Left = 8
            Top = 120
            Width = 361
            Height = 17
            Caption = #12506#12540#12473#12488#12487#12540#12479#12363#12425#36028#12426#20184#12369#12383#26178#12398#23653#27508#12399#35352#37682#12375#12394#12356'(&P)'
            TabOrder = 3
          end
        end
        object cbClipEnabled: TCheckBox
          Left = 16
          Top = 8
          Width = 153
          Height = 17
          Caption = #65400#65432#65391#65420#65439#65422#65438#65392#65412#65438#12434#30435#35222#12377#12427'(&C)'
          Checked = True
          State = cbChecked
          TabOrder = 1
          OnClick = cbClipEnabledClick
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 266
    Width = 427
    Height = 34
    Align = alBottom
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 1
    object OKBtn: TButton
      Left = 187
      Top = 2
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = OKBtnClick
    end
    object CancelBtn: TButton
      Left = 267
      Top = 2
      Width = 75
      Height = 25
      Cancel = True
      Caption = #12461#12515#12531#12475#12523
      ModalResult = 2
      TabOrder = 1
    end
    object HelpBtn: TButton
      Left = 347
      Top = 2
      Width = 75
      Height = 25
      Caption = #12504#12523#12503'(&H)'
      TabOrder = 2
      OnClick = HelpBtnClick
    end
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.wav'
    Filter = #12469#12454#12531#12489#12501#12449#12452#12523'(*.wav)|*.wav|'#12377#12409#12390#12398#12501#12449#12452#12523'(*.*)|*.*'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofEnableSizing]
    Left = 8
    Top = 264
  end
end
