object frmBlockProperties: TfrmBlockProperties
  Left = 365
  Top = 248
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Block Properties'
  ClientHeight = 344
  ClientWidth = 438
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cmdOK: TButton
    Left = 277
    Top = 312
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 357
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object pgcBlockProperties: TPageControl
    Left = 8
    Top = 8
    Width = 425
    Height = 297
    ActivePage = tshGenSettings
    MultiLine = True
    TabOrder = 2
    object tshGenSettings: TTabSheet
      Caption = 'General Settings'
      object lblTime: TLabel
        Left = 8
        Top = 8
        Width = 26
        Height = 13
        Caption = 'Time:'
      end
      object lblScroll: TLabel
        Left = 8
        Top = 40
        Width = 132
        Height = 13
        Caption = 'Scroll (Only vertical blocks):'
      end
      object cbTime: TComboBox
        Left = 48
        Top = 8
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '100'
        Items.Strings = (
          '100'
          '200'
          '300'
          '400'
          '500'
          '600'
          '700'
          '800'
          '900')
      end
      object cbScroll: TComboBox
        Left = 152
        Top = 40
        Width = 169
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Normal'
        Items.Strings = (
          'Normal'
          'Automatic'
          'Slow, Row By Row')
      end
      object cmdMirrorWithVerticallyScrollingBlock: TButton
        Left = 8
        Top = 72
        Width = 169
        Height = 25
        Caption = 'Mirror with Up/Down Equivalent'
        TabOrder = 2
      end
    end
    object tshBGPatternTable: TTabSheet
      Caption = 'BG Pattern Table'
      ImageIndex = 1
      object lblBGPatternTable2lab: TLabel
        Left = 8
        Top = 72
        Width = 94
        Height = 13
        Caption = 'BG Pattern Table 2:'
      end
      object lblBGPatternTable3lab: TLabel
        Left = 8
        Top = 168
        Width = 94
        Height = 13
        Caption = 'BG Pattern Table 3:'
      end
      object lblBGPatternTable2: TLabel
        Left = 136
        Top = 72
        Width = 12
        Height = 13
        Caption = '00'
      end
      object lblBGPatternTable3: TLabel
        Left = 136
        Top = 168
        Width = 12
        Height = 13
        Caption = '00'
      end
      object imgBGPatternTable3: TImage32
        Left = 8
        Top = 101
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 0
      end
      object imgBGPatternTable2: TImage32
        Left = 8
        Top = 5
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 1
      end
      object rgpViewBG: TRadioGroup
        Left = 0
        Top = 195
        Width = 321
        Height = 49
        Caption = 'View Type:'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'None'
          '4 Interleave'
          '8 Interleave')
        TabOrder = 2
        OnClick = rgpViewBGClick
      end
      object scrBGPatternTable2: TScrollBar
        Left = 152
        Top = 72
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 3
        OnChange = scrBGPatternTable2Change
      end
      object scrBGPatternTable3: TScrollBar
        Left = 152
        Top = 168
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 4
        OnChange = scrBGPatternTable3Change
      end
    end
    object tshSpritePatternTable: TTabSheet
      Caption = 'Sprite Pattern Table'
      ImageIndex = 2
      object lblSpritePatternTable2: TLabel
        Left = 8
        Top = 72
        Width = 109
        Height = 13
        Caption = 'Sprite Pattern Table 2:'
      end
      object lblSpritePatternTable3: TLabel
        Left = 8
        Top = 168
        Width = 109
        Height = 13
        Caption = 'Sprite Pattern Table 3:'
      end
      object lblSprPatternTable2: TLabel
        Left = 136
        Top = 72
        Width = 12
        Height = 13
        Caption = '00'
      end
      object lblSprPatternTable3: TLabel
        Left = 136
        Top = 168
        Width = 12
        Height = 13
        Caption = '00'
      end
      object imgSpritePatternTable2: TImage32
        Left = 8
        Top = 5
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 0
      end
      object imgSpritePatternTable3: TImage32
        Left = 8
        Top = 101
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 1
      end
      object rgpViewSprite: TRadioGroup
        Left = 0
        Top = 195
        Width = 321
        Height = 49
        Caption = 'View Type:'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'None'
          '4 Interleave'
          '8 Interleave')
        TabOrder = 2
        OnClick = rgpViewSpriteClick
      end
      object scrSprPatternTable2: TScrollBar
        Left = 152
        Top = 72
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 3
        OnChange = scrSprPatternTable2Change
      end
      object scrSprPatternTable3: TScrollBar
        Left = 152
        Top = 168
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 4
        OnChange = scrSprPatternTable3Change
      end
    end
    object tshSecondQuest: TTabSheet
      Caption = 'Second Quest'
      ImageIndex = 4
      object lblSecondQuestPatternTablelab: TLabel
        Left = 8
        Top = 72
        Width = 139
        Height = 13
        Caption = 'Second Quest Pattern Table:'
      end
      object lblSecondQuestPatternTable: TLabel
        Left = 160
        Top = 72
        Width = 12
        Height = 13
        Caption = '00'
      end
      object imgSecondQuestPatternTable: TImage32
        Left = 8
        Top = 5
        Width = 256
        Height = 64
        BitmapAlign = baTopLeft
        Scale = 2.000000000000000000
        ScaleMode = smScale
        TabOrder = 0
      end
      object scrSecondQuestPatternTable: TScrollBar
        Left = 176
        Top = 72
        Width = 121
        Height = 17
        Max = 127
        PageSize = 0
        TabOrder = 1
        OnChange = scrSecondQuestPatternTableChange
      end
      object rdgSecondQuest: TRadioGroup
        Left = 8
        Top = 99
        Width = 321
        Height = 49
        Caption = 'View Type:'
        Columns = 3
        ItemIndex = 0
        Items.Strings = (
          'None'
          '4 Interleave'
          '8 Interleave')
        TabOrder = 2
        OnClick = rdgSecondQuestClick
      end
    end
    object tshInfo: TTabSheet
      Caption = 'Block Information'
      ImageIndex = 3
      object lblBlockPointer: TLabel
        Left = 8
        Top = 8
        Width = 65
        Height = 13
        Caption = 'Block Pointer:'
      end
      object lblBlockLength: TLabel
        Left = 8
        Top = 56
        Width = 64
        Height = 13
        Caption = 'Block Length:'
      end
      object lblBlockOffset: TLabel
        Left = 8
        Top = 32
        Width = 62
        Height = 13
        Caption = 'Block Offset:'
      end
      object lblNumberOfStairs: TLabel
        Left = 8
        Top = 104
        Width = 86
        Height = 13
        Caption = 'Number Of Stairs:'
      end
      object lblEnemyPointer: TLabel
        Left = 8
        Top = 128
        Width = 73
        Height = 13
        Caption = 'Enemy Pointer:'
      end
      object lblEnemyOffset: TLabel
        Left = 8
        Top = 152
        Width = 70
        Height = 13
        Caption = 'Enemy Offset:'
      end
      object lblStairPointer: TLabel
        Left = 8
        Top = 80
        Width = 63
        Height = 13
        Caption = 'Stair Pointer:'
      end
      object lblEntranceOffset: TLabel
        Left = 8
        Top = 176
        Width = 81
        Height = 13
        Caption = 'Entrance Offset:'
      end
      object lblDoorOffset: TLabel
        Left = 8
        Top = 200
        Width = 61
        Height = 13
        Caption = 'Door Offset:'
      end
      object lblSpritePaletteOffset: TLabel
        Left = 8
        Top = 224
        Width = 103
        Height = 13
        Caption = 'Sprite Palette Offset:'
      end
    end
  end
end
