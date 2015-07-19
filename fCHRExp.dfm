object frmCHRExpansion: TfrmCHRExpansion
  Left = 451
  Top = 414
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'CHR Expansion'
  ClientHeight = 73
  ClientWidth = 201
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
  object lblNumberOfCHRBanks: TLabel
    Left = 8
    Top = 8
    Width = 111
    Height = 13
    Caption = 'Number Of CHR Banks:'
  end
  object cmdOK: TButton
    Left = 40
    Top = 40
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = cmdOKClick
  end
  object cmdCancel: TButton
    Left = 120
    Top = 40
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object txtCHRBanks: TSpinEdit
    Left = 128
    Top = 8
    Width = 65
    Height = 22
    MaxValue = 32
    MinValue = 16
    TabOrder = 2
    Value = 16
  end
end
