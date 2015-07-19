object frmGlobalCandleEditor: TfrmGlobalCandleEditor
  Left = 264
  Top = 135
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Global Candle Data Editor'
  ClientHeight = 310
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblID: TLabel
    Left = 376
    Top = 8
    Width = 87
    Height = 13
    Caption = 'Selected ID: None'
    Enabled = False
  end
  object lblCandleType: TLabel
    Left = 376
    Top = 32
    Width = 64
    Height = 13
    Caption = 'Candle Type:'
    Enabled = False
  end
  object lblDroppedItem: TLabel
    Left = 376
    Top = 56
    Width = 70
    Height = 13
    Caption = 'Dropped Item:'
    Enabled = False
  end
  object lblX: TLabel
    Left = 376
    Top = 80
    Width = 10
    Height = 13
    Caption = 'X:'
    Enabled = False
  end
  object lblY: TLabel
    Left = 376
    Top = 104
    Width = 10
    Height = 13
    Caption = 'Y:'
    Enabled = False
  end
  object cmdOK: TButton
    Left = 416
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
    Left = 496
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object lvwCandleData: TListView
    Left = 8
    Top = 8
    Width = 361
    Height = 265
    Columns = <
      item
        Caption = 'ID'
        MaxWidth = 40
        Width = 30
      end
      item
        Caption = 'Candle Type'
        MaxWidth = 90
        Width = 80
      end
      item
        Caption = 'Item'
        MaxWidth = 110
        Width = 100
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
        Caption = 'Offset'
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 2
    ViewStyle = vsReport
    OnClick = lvwCandleDataDblClick
  end
  object cbCandleType: TComboBox
    Left = 456
    Top = 32
    Width = 113
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 3
  end
  object cbDroppedItem: TComboBox
    Left = 456
    Top = 56
    Width = 113
    Height = 21
    Style = csDropDownList
    Enabled = False
    ItemHeight = 13
    TabOrder = 4
  end
  object txtX: TDanHexEdit
    Left = 456
    Top = 80
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 5
    Text = '00'
  end
  object txtY: TDanHexEdit
    Left = 456
    Top = 104
    Width = 41
    Height = 21
    Enabled = False
    MaxLength = 2
    TabOrder = 6
    Text = '00'
  end
  object cmdPreview: TButton
    Left = 376
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Preview'
    Enabled = False
    TabOrder = 7
    OnClick = cmdPreviewClick
  end
end
