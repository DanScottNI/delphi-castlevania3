object frmLevelProperties: TfrmLevelProperties
  Left = 468
  Top = 247
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Level Properties'
  ClientHeight = 384
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcLevelProperties: TPageControl
    Left = 8
    Top = 8
    Width = 321
    Height = 337
    ActivePage = tshNextLevel
    TabOrder = 0
    object tshNextLevel: TTabSheet
      Caption = 'Next Level'
      object lblNextLevel: TLabel
        Left = 8
        Top = 16
        Width = 58
        Height = 13
        Caption = 'lblNextLevel'
      end
    end
    object tshCHRSwitching: TTabSheet
      Caption = 'CHR Switching'
      ImageIndex = 1
      object lblBGPatternTable2Fra1lab: TLabel
        Left = 8
        Top = 104
        Width = 144
        Height = 13
        Caption = 'BG Pattern Table 2 (Frame 1):'
      end
      object lblBGPatternTable2Fra2lab: TLabel
        Left = 8
        Top = 192
        Width = 144
        Height = 13
        Caption = 'BG Pattern Table 2 (Frame 2):'
      end
      object lblBGPatternTable2Fra3lab: TLabel
        Left = 8
        Top = 280
        Width = 144
        Height = 13
        Caption = 'BG Pattern Table 2 (Frame 3):'
      end
      object lblFrameSwitchingSpeed: TLabel
        Left = 8
        Top = 8
        Width = 115
        Height = 13
        Caption = 'Frame Switching Speed:'
      end
      object lblBGPatternTable2Fra1: TLabel
        Left = 168
        Top = 104
        Width = 12
        Height = 13
        Caption = '00'
      end
      object lblBGPatternTable2Fra2: TLabel
        Left = 168
        Top = 192
        Width = 12
        Height = 13
        Caption = '00'
      end
      object lblBGPatternTable2Fra3: TLabel
        Left = 168
        Top = 280
        Width = 12
        Height = 13
        Caption = '00'
      end
      object imgBGPatternTable2Fra1: TImage32
        Left = 8
        Top = 37
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 0
      end
      object scrBGPatternTable2Fra1: TScrollBar
        Left = 184
        Top = 104
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 1
      end
      object imgBGPatternTable2Fra2: TImage32
        Left = 8
        Top = 125
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 2
      end
      object scrBGPatternTable2Fra2: TScrollBar
        Left = 184
        Top = 192
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 3
      end
      object imgBGPatternTable2Fra3: TImage32
        Left = 8
        Top = 213
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 4
      end
      object scrBGPatternTable2Fra3: TScrollBar
        Left = 184
        Top = 280
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 5
      end
      object txtFrameSwitchingSpeed: TEdit
        Left = 136
        Top = 8
        Width = 57
        Height = 21
        TabOrder = 6
        Text = '00'
      end
    end
  end
  object cmdOK: TButton
    Left = 160
    Top = 352
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object cmdCancel: TButton
    Left = 240
    Top = 352
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
