object frmCheatEditor: TfrmCheatEditor
  Left = 441
  Top = 296
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cheat Editor'
  ClientHeight = 239
  ClientWidth = 391
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lstCheats: TListBox
    Left = 8
    Top = 8
    Width = 169
    Height = 185
    ItemHeight = 13
    TabOrder = 0
  end
  object txtCheat: TEdit
    Left = 184
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cmdApply: TButton
    Left = 312
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Apply'
    TabOrder = 2
  end
  object cmdOK: TButton
    Left = 232
    Top = 208
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object cmdCancel: TButton
    Left = 312
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
end
