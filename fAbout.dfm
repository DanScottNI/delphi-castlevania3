object frmAbout: TfrmAbout
  Left = 313
  Top = 184
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'About Sire'
  ClientHeight = 279
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblHomepage: TLabel
    Left = 12
    Top = 248
    Width = 58
    Height = 13
    Cursor = crHandPoint
    Hint = 'http://dan.panicus.org'
    Caption = 'Dan'#39's Space'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    Transparent = True
    OnClick = lblHomepageClick
    OnMouseEnter = lblHomepageMouseEnter
    OnMouseLeave = lblHomepageMouseLeave
  end
  object lblThanks: TLabel
    Left = 12
    Top = 100
    Width = 89
    Height = 117
    Caption = 
      'Special Thanks To:'#13#10#13#10'- Rouki'#13#10'- John'#13#10'- Martin Strand'#13#10'- FuSoYa' +
      #13#10'- Ultima 4701'#13#10'- Gavin'#13#10'- The Fake God'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    Transparent = False
  end
  object lblDescription: TLabel
    Left = 12
    Top = 12
    Width = 281
    Height = 78
    Caption = 
      'Sire is a level editor for the NES game, Castlevania III. '#13#10'It w' +
      'as written by Dan (dan@panicus.org).'#13#10#13#10'This program is not in a' +
      'ny way associated with Konami, '#13#10'Nintendo, or any other stupid c' +
      'ompanies. Do not email me '#13#10'for the Castlevania III ROM, because' +
      ' it'#39's rude.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cmdOK: TButton
    Left = 246
    Top = 249
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object ScrollBox1: TScrollBox
    Left = 120
    Top = 100
    Width = 200
    Height = 134
    HorzScrollBar.Visible = False
    BorderStyle = bsNone
    TabOrder = 1
    object lblGreetings: TLabel
      Left = 0
      Top = 0
      Width = 176
      Height = 247
      Caption = 
        'Greetings To (in no particular order):'#13#10#13#10'- Disch               ' +
        '     '#13#10'- Gavin'#13#10'- Weasel                   '#13#10'- Solid T-Bone'#13#10'- G' +
        'il-Galad                '#13#10'- DahrkDaiz                '#13#10'- Mogster' +
        #13#10'- JCE3000GT'#13#10'- redrum                   '#13#10'- Vag'#13#10'- Atma       ' +
        '              '#13#10'- bbitmaster'#13#10'- Muldoon                  '#13#10'- Vag' +
        'la'#13#10'- Dragonsbretheren         '#13#10'- windwaker'#13#10'- Skiffles'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
