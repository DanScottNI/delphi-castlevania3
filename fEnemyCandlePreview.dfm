object frmEnemyCandlePreview: TfrmEnemyCandlePreview
  Left = 474
  Top = 285
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Enemy/Candle Preview'
  ClientHeight = 192
  ClientWidth = 256
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
  object imgPreview: TImage32
    Left = 0
    Top = 0
    Width = 256
    Height = 192
    Align = alClient
    BitmapAlign = baTopLeft
    Scale = 1.000000000000000000
    ScaleMode = smNormal
    TabOrder = 0
    OnClick = imgPreviewClick
  end
end
