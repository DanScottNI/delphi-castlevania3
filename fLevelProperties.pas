unit fLevelProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, GR32_Image, GR32;

type
  TfrmLevelProperties = class(TForm)
    pgcLevelProperties: TPageControl;
    tshNextLevel: TTabSheet;
    tshCHRSwitching: TTabSheet;
    imgBGPatternTable2Fra1: TImage32;
    lblBGPatternTable2Fra1lab: TLabel;
    scrBGPatternTable2Fra1: TScrollBar;
    imgBGPatternTable2Fra2: TImage32;
    lblBGPatternTable2Fra2lab: TLabel;
    scrBGPatternTable2Fra2: TScrollBar;
    imgBGPatternTable2Fra3: TImage32;
    lblBGPatternTable2Fra3lab: TLabel;
    scrBGPatternTable2Fra3: TScrollBar;
    lblNextLevel: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblFrameSwitchingSpeed: TLabel;
    txtFrameSwitchingSpeed: TEdit;
    lblBGPatternTable2Fra1: TLabel;
    lblBGPatternTable2Fra2: TLabel;
    lblBGPatternTable2Fra3: TLabel;
    procedure FormShow(Sender: TObject);
  private
    procedure DisplayCHRSwitch;
    procedure DrawCHRSwitchingPatternBars;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLevelProperties: TfrmLevelProperties;

implementation

{$R *.dfm}
uses uGlobal, cROMData;

procedure TfrmLevelProperties.DisplayCHRSwitch();
begin
  if ROMData.CurrentLevel.CHRSwitchOffset > 0 then
  begin
    imgBGPatternTable2Fra1.Visible := True;
    imgBGPatternTable2Fra2.Visible := True;
    imgBGPatternTable2Fra3.Visible := True;
    scrBGPatternTable2Fra1.Enabled := True;
    scrBGPatternTable2Fra2.Enabled := True;
    scrBGPatternTable2Fra3.Enabled := True;
    lblFrameSwitchingSpeed.Enabled := True;
    txtFrameSwitchingSpeed.Enabled := True;
    lblBGPatternTable2Fra1lab.Enabled := True;
    lblBGPatternTable2Fra2lab.Enabled := True;
    lblBGPatternTable2Fra3lab.Enabled := True;
    lblBGPatternTable2Fra1.Enabled := True;
    lblBGPatternTable2Fra2.Enabled := True;
    lblBGPatternTable2Fra3.Enabled := True;
    txtFrameSwitchingSpeed.Text := IntToHex(ROMData.CurrentLevel.CHRSwitchSpeed,2);
    lblBGPatternTable2Fra1.Caption := IntToHex(ROMData.CurrentLevel.CHRSwitch1,2);
    lblBGPatternTable2Fra2.Caption := IntToHex(ROMData.CurrentLevel.CHRSwitch2,2);
    lblBGPatternTable2Fra3.Caption := IntToHex(ROMData.CurrentLevel.CHRSwitch3,2);
    scrBGPatternTable2Fra1.Position := ROMData.CurrentLevel.CHRSwitch1;
    scrBGPatternTable2Fra2.Position := ROMData.CurrentLevel.CHRSwitch2;
    scrBGPatternTable2Fra3.Position := ROMData.CurrentLevel.CHRSwitch3;
    DrawCHRSwitchingPatternBars();
  end
  else
  begin
    imgBGPatternTable2Fra1.Visible := False;
    imgBGPatternTable2Fra2.Visible := False;
    imgBGPatternTable2Fra3.Visible := False;
    scrBGPatternTable2Fra1.Enabled := False;
    scrBGPatternTable2Fra2.Enabled := False;
    scrBGPatternTable2Fra3.Enabled := False;
    lblFrameSwitchingSpeed.Enabled := False;
    txtFrameSwitchingSpeed.Enabled := False;
    lblBGPatternTable2Fra1lab.Enabled := False;
    lblBGPatternTable2Fra2lab.Enabled := False;
    lblBGPatternTable2Fra3lab.Enabled := False;
    lblBGPatternTable2Fra1.Enabled := False;
    lblBGPatternTable2Fra2.Enabled := False;
    lblBGPatternTable2Fra3.Enabled := False;
  end;

end;

procedure TfrmLevelProperties.FormShow(Sender: TObject);
begin
  DisplayCHRSwitch();
end;

procedure TfrmLevelProperties.DrawCHRSwitchingPatternBars();
var
  PatTable : TBitmap32;
begin
  PatTable := TBitmap32.Create;
  try
    PatTable.Height := 32;
    PatTable.Width := 128;
    ROMData.DrawPatternBar(PatTable, scrBGPatternTable2Fra1.Position,None,0);
    imgBGPatternTable2Fra1.Bitmap := PatTable;
    ROMData.DrawPatternBar(PatTable, scrBGPatternTable2Fra2.Position,None,0);
    imgBGPatternTable2Fra2.Bitmap := PatTable;
    ROMData.DrawPatternBar(PatTable, scrBGPatternTable2Fra3.Position,None,0);
    imgBGPatternTable2Fra3.Bitmap := PatTable;
  finally
    FreeAndNil(PatTable);
  end;

end;

end.
