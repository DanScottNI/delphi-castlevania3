object frmEnemyDataInspector: TfrmEnemyDataInspector
  Left = 192
  Top = 111
  BorderStyle = bsSingle
  Caption = 'Enemy Data Inspector'
  ClientHeight = 360
  ClientWidth = 232
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cmdOK: TButton
    Left = 152
    Top = 328
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
  end
  object lstEnemyData: TListBox
    Left = 8
    Top = 8
    Width = 217
    Height = 313
    ItemHeight = 13
    TabOrder = 1
  end
end
