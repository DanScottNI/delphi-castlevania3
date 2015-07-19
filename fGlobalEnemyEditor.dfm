object frmGlobalEnemyEditor: TfrmGlobalEnemyEditor
  Left = 234
  Top = 113
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Global Enemy Data Editor'
  ClientHeight = 312
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 416
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Selected ID: None'
    Enabled = False
  end
  object lblEnemyType: TLabel
    Left = 416
    Top = 32
    Width = 63
    Height = 13
    Caption = 'Enemy Type:'
    Enabled = False
  end
  object lblX: TLabel
    Left = 416
    Top = 56
    Width = 10
    Height = 13
    Caption = 'X:'
    Enabled = False
  end
  object lblY: TLabel
    Left = 416
    Top = 80
    Width = 10
    Height = 13
    Caption = 'Y:'
    Enabled = False
  end
  object lblUnknown1: TLabel
    Left = 416
    Top = 104
    Width = 57
    Height = 13
    Caption = 'Unknown 1:'
    Enabled = False
  end
  object lblUnknown2: TLabel
    Left = 416
    Top = 128
    Width = 57
    Height = 13
    Caption = 'Unknown 2:'
    Enabled = False
  end
  object cmdOK: TButton
    Left = 454
    Top = 280
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 534
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object lvwEnemyData: TListView
    Left = 8
    Top = 8
    Width = 401
    Height = 265
    Columns = <
      item
        Caption = 'ID'
        MaxWidth = 40
        Width = 30
      end
      item
        Caption = 'Enemy Type'
        MaxWidth = 90
        Width = 80
      end
      item
        Caption = 'X'
        MaxWidth = 35
        Width = 30
      end
      item
        Caption = 'Y'
        MaxWidth = 35
        Width = 30
      end
      item
        Caption = 'Unknown 1'
        Width = 80
      end
      item
        Caption = 'Unknown 2'
        Width = 80
      end
      item
        Caption = 'Offset'
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnClick = lvwEnemyDataClick
  end
  object cbEnemyType: TComboBox
    Left = 496
    Top = 32
    Width = 113
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 3
  end
  object txtX: TDanHexEdit
    Left = 496
    Top = 56
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 4
    Text = '00'
  end
  object txtY: TDanHexEdit
    Left = 496
    Top = 80
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 5
    Text = '00'
  end
  object txtUnknown1: TDanHexEdit
    Left = 496
    Top = 104
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 6
    Text = '00'
  end
  object txtUnknown2: TDanHexEdit
    Left = 496
    Top = 128
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 7
    Text = '00'
  end
  object cmdPreview: TButton
    Left = 416
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Preview'
    Enabled = False
    TabOrder = 8
    OnClick = cmdPreviewClick
  end
end
