object frmTextEditor: TfrmTextEditor
  Left = 503
  Top = 324
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Text Editor'
  ClientHeight = 326
  ClientWidth = 280
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblText: TLabel
    Left = 8
    Top = 8
    Width = 26
    Height = 13
    Caption = 'Text:'
  end
  object Shape1: TShape
    Left = 8
    Top = 288
    Width = 265
    Height = 1
  end
  object cbText: TComboBox
    Left = 40
    Top = 8
    Width = 233
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object mmoText: TMemo
    Left = 8
    Top = 40
    Width = 265
    Height = 209
    TabOrder = 1
  end
  object cmdOK: TButton
    Left = 120
    Top = 296
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object cmdCancel: TButton
    Left = 200
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object cmdUpdate: TButton
    Left = 200
    Top = 256
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 4
  end
end
