object frmObjProperties: TfrmObjProperties
  Left = 692
  Top = 348
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Object Properties'
  ClientHeight = 384
  ClientWidth = 193
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPages: TPageControl
    Left = 0
    Top = 0
    Width = 193
    Height = 384
    ActivePage = tshEnemies
    Align = alClient
    Style = tsButtons
    TabOrder = 0
    object tshNone: TTabSheet
      Caption = 'None'
      object grpNone: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'No selected objects'
        TabOrder = 0
        object lblNone: TLabel
          Left = 24
          Top = 72
          Width = 147
          Height = 13
          Caption = 'There are no objects selected.'
        end
      end
    end
    object tshStairs: TTabSheet
      Caption = 'Stairs'
      ImageIndex = 1
      object grpStairs: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'Stairs:'
        TabOrder = 0
        object lblStairScreenNumber: TLabel
          Left = 8
          Top = 24
          Width = 77
          Height = 13
          Caption = 'Screen Number:'
        end
        object cbStairScreenNumber: TComboBox
          Left = 8
          Top = 40
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = cbStairScreenNumberChange
        end
        object chkStairFollow: TCheckBox
          Left = 8
          Top = 72
          Width = 169
          Height = 17
          Caption = 'Follow when changing screen'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
    end
    object tshDoors: TTabSheet
      Caption = 'Doors'
      ImageIndex = 3
      object grpDoors: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'Doors:'
        TabOrder = 0
        object lblDoorsScreenNumber: TLabel
          Left = 8
          Top = 24
          Width = 77
          Height = 13
          Caption = 'Screen Number:'
        end
        object cbDoorScreenNumber: TComboBox
          Left = 8
          Top = 40
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = cbDoorScreenNumberChange
        end
        object chkDoorFollow: TCheckBox
          Left = 8
          Top = 72
          Width = 169
          Height = 17
          Caption = 'Follow when changing screen'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
    end
    object tshEntrances: TTabSheet
      Caption = 'Entrances'
      ImageIndex = 2
      object grpEntrances: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'Entrances'
        TabOrder = 0
        object lblEntranceScreenNumber: TLabel
          Left = 8
          Top = 24
          Width = 77
          Height = 13
          Caption = 'Screen Number:'
        end
        object cbEntranceScreenNumber: TComboBox
          Left = 8
          Top = 40
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnChange = cbEntranceScreenNumberChange
        end
        object chkEntranceFollow: TCheckBox
          Left = 8
          Top = 72
          Width = 169
          Height = 17
          Caption = 'Follow when changing screen'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
    end
    object tshSpecObj: TTabSheet
      Caption = 'SpecObj'
      ImageIndex = 4
      object grpSpecialObjects: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'Special Objects'
        TabOrder = 0
      end
    end
    object tshVerticalEnemies: TTabSheet
      Caption = 'VertEne'
      ImageIndex = 5
      object grpVerticalEnemies: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'Vertical Enemies'
        TabOrder = 0
      end
    end
    object tshEnemies: TTabSheet
      Caption = 'Enemies:'
      ImageIndex = 6
      OnShow = tshEnemiesShow
      object grpEnemyCandle: TGroupBox
        Left = 0
        Top = 0
        Width = 185
        Height = 353
        Align = alClient
        Caption = 'Enemy/Candle Editor'
        TabOrder = 0
        object lblType: TLabel
          Left = 8
          Top = 24
          Width = 28
          Height = 13
          Caption = 'Type:'
        end
        object lblID: TLabel
          Left = 8
          Top = 56
          Width = 133
          Height = 13
          Caption = 'Enemy Type/Item Dropped:'
        end
        object lblEnemyIndex: TLabel
          Left = 8
          Top = 128
          Width = 71
          Height = 13
          Caption = 'Index (0-100):'
        end
        object cbEnemyType: TComboBox
          Left = 40
          Top = 24
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Enemy'
          OnChange = cbEnemyTypeChange
          Items.Strings = (
            'Enemy'
            'Candles'
            'Candle-stand'
            'Lantern')
        end
        object cbEnemyTypeItemDropped: TComboBox
          Left = 8
          Top = 72
          Width = 169
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = cbEnemyTypeItemDroppedChange
        end
        object scrEnemyIndex: TScrollBar
          Left = 8
          Top = 144
          Width = 169
          Height = 15
          PageSize = 0
          TabOrder = 2
          OnChange = scrEnemyIndexChange
        end
        object chkFilterNA: TCheckBox
          Left = 8
          Top = 104
          Width = 121
          Height = 17
          Caption = 'Filter N/A Entries'
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = chkFilterNAClick
        end
      end
    end
  end
end
