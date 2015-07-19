object frmDamage: TfrmDamage
  Left = 438
  Top = 303
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Damage Settings'
  ClientHeight = 294
  ClientWidth = 350
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
  object lblStage1to3: TLabel
    Left = 8
    Top = 40
    Width = 129
    Height = 26
    Caption = 'Stage 1 to 3/Falling Blocks/'#13#10'Acid/Trap Door Spikes'
  end
  object lblStage4toC: TLabel
    Left = 8
    Top = 72
    Width = 64
    Height = 13
    Caption = 'Stage 4 to C:'
  end
  object lblStageDtoE: TLabel
    Left = 8
    Top = 96
    Width = 140
    Height = 13
    Caption = 'Stages D to E/Second Quest:'
  end
  object lblMovingSpikes: TLabel
    Left = 8
    Top = 120
    Width = 71
    Height = 13
    Caption = 'Moving Spikes:'
  end
  object lblDamageScheme: TLabel
    Left = 8
    Top = 8
    Width = 83
    Height = 13
    Caption = 'Damage Scheme:'
  end
  object lblCharacters: TLabel
    Left = 8
    Top = 144
    Width = 166
    Height = 13
    Caption = 'Characters which use this scheme:'
  end
  object cmdOK: TButton
    Left = 192
    Top = 264
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 272
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object imgStage1to3: TImage32
    Left = 168
    Top = 40
    Width = 160
    Height = 16
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 2
  end
  object imgStage4toC: TImage32
    Left = 168
    Top = 72
    Width = 160
    Height = 16
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 3
  end
  object imgMovingSpikes: TImage32
    Left = 168
    Top = 120
    Width = 160
    Height = 16
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 4
  end
  object imgStageDtoE: TImage32
    Left = 168
    Top = 96
    Width = 160
    Height = 16
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 5
  end
  object cbDamageScheme: TComboBox
    Left = 160
    Top = 8
    Width = 161
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 6
    Text = '1'
    OnChange = cbDamageSchemeChange
    Items.Strings = (
      '1'
      '2')
  end
  object lstCharacters: TListBox
    Left = 8
    Top = 160
    Width = 337
    Height = 65
    ExtendedSelect = False
    ItemHeight = 13
    Items.Strings = (
      'Trevor'
      'Grant'
      'Sypha'
      'Alucard')
    TabOrder = 7
    OnClick = lstCharactersClick
  end
  object cmdSwitchSchemes: TButton
    Left = 8
    Top = 232
    Width = 161
    Height = 25
    Caption = 'Switch Scheme For ...'
    TabOrder = 8
    OnClick = cmdSwitchSchemesClick
  end
  object cmdStage1to3Down: TButton
    Left = 153
    Top = 40
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = cmdStage1to3DownClick
  end
  object cmdStage4toCDown: TButton
    Left = 153
    Top = 72
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = cmdStage4toCDownClick
  end
  object cmdStageDtoEDown: TButton
    Left = 153
    Top = 96
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
    OnClick = cmdStageDtoEDownClick
  end
  object cmdMovingSpikesDown: TButton
    Left = 153
    Top = 120
    Width = 15
    Height = 16
    Caption = '<'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
    OnClick = cmdMovingSpikesDownClick
  end
  object cmdStage1to3Up: TButton
    Left = 329
    Top = 40
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 13
    OnClick = cmdStage1to3UpClick
  end
  object cmdStage4toCUp: TButton
    Left = 329
    Top = 72
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 14
    OnClick = cmdStage4toCUpClick
  end
  object cmdStageDtoEUp: TButton
    Left = 329
    Top = 96
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 15
    OnClick = cmdStageDtoEUpClick
  end
  object cmdMovingSpikesUp: TButton
    Left = 329
    Top = 120
    Width = 15
    Height = 16
    Caption = '>'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 16
    OnClick = cmdMovingSpikesUpClick
  end
  object Bitmap32List: TBitmap32List
    Bitmaps = <
      item
        Bitmap.Data = {
          0500000008000000080000FF080000FF080000FF080000FF080000FF080000FF
          0038FCFF0038FCFF0038FCFF080000FF080000FF0038FCFF0038FCFF0038FCFF
          080000FF080000FF0038FCFF0038FCFF0038FCFF080000FF080000FF0038FCFF
          0038FCFF0038FCFF080000FF080000FF0038FCFF0038FCFF0038FCFF080000FF
          080000FF0038FCFF0038FCFF0038FCFF080000FF080000FF080000FF080000FF
          080000FF080000FF}
      end
      item
        Bitmap.Data = {
          0500000008000000080000FF080000FF080000FF080000FF080000FF080000FF
          FCF8FCFFFCF8FCFFFCF8FCFF080000FF080000FFFCF8FCFF080000FFFCF8FCFF
          080000FF080000FFFCF8FCFF080000FFFCF8FCFF080000FF080000FFFCF8FCFF
          080000FFFCF8FCFF080000FF080000FFFCF8FCFF080000FFFCF8FCFF080000FF
          080000FFFCF8FCFFFCF8FCFFFCF8FCFF080000FF080000FF080000FF080000FF
          080000FF080000FF}
      end>
    Left = 240
    Top = 216
  end
end
