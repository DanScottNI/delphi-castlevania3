object frmPaletteEditor: TfrmPaletteEditor
  Left = 331
  Top = 488
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Palette Editor'
  ClientHeight = 358
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
  object lbl000F: TLabel
    Left = 352
    Top = 9
    Width = 34
    Height = 13
    Caption = '00 - 0F'
  end
  object lbl101F: TLabel
    Left = 352
    Top = 27
    Width = 34
    Height = 13
    Caption = '10 - 1F'
  end
  object lbl202F: TLabel
    Left = 352
    Top = 45
    Width = 34
    Height = 13
    Caption = '20 - 2F'
  end
  object lbl303F: TLabel
    Left = 352
    Top = 63
    Width = 34
    Height = 13
    Caption = '30 - 3F'
  end
  object lblCurrentPalette: TLabel
    Left = 64
    Top = 88
    Width = 133
    Height = 13
    Caption = 'Current Palette Colour: $00'
  end
  object imgNESColours: TImage32
    Left = 64
    Top = 8
    Width = 286
    Height = 73
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnMouseMove = imgNESColoursMouseMove
    OnMouseUp = imgNESColoursMouseUp
  end
  object cmdOK: TButton
    Left = 280
    Top = 328
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    DragCursor = crDefault
    ModalResult = 1
    TabOrder = 1
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 360
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdCancelClick
  end
  object pgcPalettes: TPageControl
    Left = 8
    Top = 112
    Width = 425
    Height = 209
    ActivePage = tshBGPalettes
    TabOrder = 3
    object tshBGPalettes: TTabSheet
      Caption = 'BG Palette'
      object lblBGPalType: TLabel
        Left = 2
        Top = 16
        Width = 81
        Height = 13
        Caption = 'BG Palette Type:'
      end
      object lblPalettes: TLabel
        Left = 2
        Top = 46
        Width = 43
        Height = 13
        Caption = 'Palettes:'
      end
      object lblBGNotice: TLabel
        Left = 2
        Top = 104
        Width = 287
        Height = 52
        Caption = 
          'Additional Information:'#13#10#13#10'The first background palette is mirro' +
          'red. '#13#10'You cannot edit the first colour of each background palet' +
          'te.'
      end
      object imgBGPal1: TImage32
        Left = 2
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseUp = imgBGPal1MouseUp
      end
      object imgBGPal2: TImage32
        Left = 106
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseUp = imgBGPal2MouseUp
      end
      object imgBGPal3: TImage32
        Left = 210
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseUp = imgBGPal3MouseUp
      end
      object imgBGPal4: TImage32
        Left = 314
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseUp = imgBGPal4MouseUp
      end
      object cbBGPalType: TComboBox
        Left = 112
        Top = 16
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 4
        Text = '00'
        OnChange = cbBGPalTypeChange
        Items.Strings = (
          '00'
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '0A'
          '0B'
          '0C'
          '0D'
          '0E'
          '0F'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '1A'
          '1B'
          '1C'
          '1D'
          '1E'
          '1F'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '2A'
          '2B')
      end
    end
    object tshSprPalettes: TTabSheet
      Caption = 'Sprite Palette'
      ImageIndex = 1
      object lblSprPalType: TLabel
        Left = 2
        Top = 16
        Width = 96
        Height = 13
        Caption = 'Sprite Palette Type:'
      end
      object lblSprPal: TLabel
        Left = 2
        Top = 46
        Width = 43
        Height = 13
        Caption = 'Palettes:'
      end
      object lblCharacterPalettes: TLabel
        Left = 2
        Top = 103
        Width = 94
        Height = 13
        Caption = 'Character Palettes:'
      end
      object lblTrevorPal: TLabel
        Left = 2
        Top = 128
        Width = 73
        Height = 13
        Caption = 'Trevor Palette:'
      end
      object lblGrantPal: TLabel
        Left = 106
        Top = 128
        Width = 68
        Height = 13
        Caption = 'Grant Palette:'
      end
      object lblSyphaPal: TLabel
        Left = 210
        Top = 128
        Width = 71
        Height = 13
        Caption = 'Sypha Palette:'
      end
      object lblAlucardPal: TLabel
        Left = 314
        Top = 128
        Width = 77
        Height = 13
        Caption = 'Alucard Palette:'
      end
      object lblSpriteNotice: TLabel
        Left = 200
        Top = 16
        Width = 186
        Height = 13
        Caption = 'Only affects the second sprite palette.'
      end
      object cbSprPalType: TComboBox
        Left = 112
        Top = 16
        Width = 81
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = '00'
        OnChange = cbSprPalTypeChange
        Items.Strings = (
          '00'
          '01'
          '02'
          '03'
          '04'
          '05'
          '06'
          '07'
          '08'
          '09'
          '0A'
          '0B'
          '0C'
          '0D'
          '0E'
          '0F'
          '10'
          '11'
          '12'
          '13'
          '14'
          '15'
          '16'
          '17'
          '18'
          '19'
          '1A'
          '1B'
          '1C'
          '1D'
          '1E'
          '1F'
          '20'
          '21'
          '22'
          '23'
          '24'
          '25'
          '26'
          '27'
          '28'
          '29'
          '2A'
          '2B')
      end
      object imgSprPal1: TImage32
        Left = 2
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseUp = imgSprPal1MouseUp
      end
      object imgSprPal2: TImage32
        Left = 106
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseUp = imgSprPal2MouseUp
      end
      object imgSprPal3: TImage32
        Left = 210
        Top = 70
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseUp = imgSprPal3MouseUp
      end
      object imgTrevorPal: TImage32
        Left = 2
        Top = 144
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseUp = imgTrevorPalMouseUp
      end
      object imgGrantPal: TImage32
        Left = 106
        Top = 144
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseUp = imgGrantPalMouseUp
      end
      object imgSyphaPal: TImage32
        Left = 210
        Top = 144
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseUp = imgSyphaPalMouseUp
      end
      object imgAlucardPal: TImage32
        Left = 314
        Top = 144
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseUp = imgAlucardPalMouseUp
      end
    end
    object tshPrayingIntro: TTabSheet
      Caption = 'Praying Intro'
      ImageIndex = 2
      object lblPrayIntroNotice: TLabel
        Left = 4
        Top = 80
        Width = 361
        Height = 52
        Caption = 
          'Additional Information:'#13#10#13#10'The first colour of the first sprite ' +
          'palette sets all the rest of the first colours'#13#10'in this palette.'
      end
      object imgPraIntBG1: TImage32
        Left = 2
        Top = 14
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 0
        OnMouseDown = imgPraIntBG1MouseDown
      end
      object imgPraIntBG2: TImage32
        Left = 106
        Top = 14
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 1
        OnMouseDown = imgPraIntBG2MouseDown
      end
      object imgPraIntBG3: TImage32
        Left = 210
        Top = 14
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 2
        OnMouseDown = imgPraIntBG3MouseDown
      end
      object imgPraIntBG4: TImage32
        Left = 314
        Top = 14
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 3
        OnMouseDown = imgPraIntBG4MouseDown
      end
      object imgPraIntSpr1: TImage32
        Left = 2
        Top = 46
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 4
        OnMouseDown = imgPraIntSpr1MouseDown
      end
      object imgPraIntSpr2: TImage32
        Left = 106
        Top = 46
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 5
        OnMouseDown = imgPraIntSpr2MouseDown
      end
      object imgPraIntSpr3: TImage32
        Left = 210
        Top = 46
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 6
        OnMouseDown = imgPraIntSpr3MouseDown
      end
      object imgPraIntSpr4: TImage32
        Left = 314
        Top = 46
        Width = 100
        Height = 25
        BitmapAlign = baTopLeft
        ParentShowHint = False
        Scale = 1.000000000000000000
        ScaleMode = smNormal
        ShowHint = True
        TabOrder = 7
        OnMouseDown = imgPraIntSpr4MouseDown
      end
    end
  end
end
