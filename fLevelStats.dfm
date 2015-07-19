object frmLevelStatistics: TfrmLevelStatistics
  Left = 249
  Top = 174
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Level Statistics'
  ClientHeight = 495
  ClientWidth = 616
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
  object lvwBlocksData: TListView
    Left = 8
    Top = 8
    Width = 601
    Height = 449
    Columns = <
      item
        Caption = 'Name'
        Width = 150
      end
      item
        Caption = 'Length'
      end
      item
        Caption = 'Block Offset'
        Width = 100
      end
      item
        Caption = 'Stairs'
      end
      item
        Caption = 'Special Objects'
        Width = 100
      end>
    GridLines = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object cmdOK: TButton
    Left = 536
    Top = 464
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
