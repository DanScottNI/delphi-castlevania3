object frmPresetObj: TfrmPresetObj
  Left = 192
  Top = 114
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Preset Object Editor'
  ClientHeight = 393
  ClientWidth = 382
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
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 361
    Height = 345
    ActivePage = tshCogs
    MultiLine = True
    TabOrder = 0
    object tshCogs: TTabSheet
      Caption = 'Cogs'
      object lblCogType: TLabel
        Left = 8
        Top = 40
        Width = 50
        Height = 13
        Caption = 'Cog Type:'
      end
      object lblDirection: TLabel
        Left = 8
        Top = 64
        Width = 68
        Height = 13
        Caption = 'Cog Direction:'
      end
      object lblX: TLabel
        Left = 8
        Top = 88
        Width = 10
        Height = 13
        Caption = 'X:'
      end
      object lblY: TLabel
        Left = 8
        Top = 112
        Width = 10
        Height = 13
        Caption = 'Y:'
      end
      object lblScreen: TLabel
        Left = 8
        Top = 136
        Width = 37
        Height = 13
        Caption = 'Screen:'
      end
      object lblCogID: TLabel
        Left = 8
        Top = 16
        Width = 37
        Height = 13
        Caption = 'Cog ID:'
      end
    end
    object tshTrapdoors: TTabSheet
      Caption = 'Trapdoors'
      ImageIndex = 1
      object lblTrapdoorID: TLabel
        Left = 8
        Top = 16
        Width = 65
        Height = 13
        Caption = 'lblTrapdoorID'
      end
      object lblTrapdoorX: TLabel
        Left = 8
        Top = 40
        Width = 57
        Height = 13
        Caption = 'Trapdoor X:'
      end
      object lblTrapdoorY: TLabel
        Left = 8
        Top = 64
        Width = 10
        Height = 13
        Caption = 'Y:'
      end
    end
    object tshTrapdoorsWithSpikes: TTabSheet
      Caption = 'Trapdoors With Spikes'
      ImageIndex = 2
    end
    object tshAcid: TTabSheet
      Caption = 'Acid'
      ImageIndex = 3
    end
    object tshTiltingLedges: TTabSheet
      Caption = 'Tilting Ledges'
      ImageIndex = 4
    end
    object tshPendulums: TTabSheet
      Caption = 'Pendulum'
      ImageIndex = 5
    end
  end
  object cmdOK: TButton
    Left = 296
    Top = 360
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
