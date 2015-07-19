object frm8x8TileEditor: Tfrm8x8TileEditor
  Left = 571
  Top = 329
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '8x8 Tile Editor'
  ClientHeight = 207
  ClientWidth = 263
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
  object imgTile: TImage32
    Left = 8
    Top = 8
    Width = 160
    Height = 160
    Cursor = crCross
    BitmapAlign = baTopLeft
    Scale = 20.000000000000000000
    ScaleMode = smScale
    TabOrder = 0
    OnMouseDown = imgTileMouseDown
    OnMouseMove = imgTileMouseMove
  end
  object imgAvailPal: TImage32
    Left = 176
    Top = 8
    Width = 80
    Height = 50
    BitmapAlign = baTopLeft
    Scale = 2.000000000000000000
    ScaleMode = smScale
    TabOrder = 1
    OnMouseUp = imgAvailPalMouseUp
  end
  object cmdOK: TButton
    Left = 104
    Top = 176
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 184
    Top = 176
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
