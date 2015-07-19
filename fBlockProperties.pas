unit fBlockProperties;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, GR32_Image, GR32, ComCtrls;

type
  TfrmBlockProperties = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    pgcBlockProperties: TPageControl;
    tshGenSettings: TTabSheet;
    tshBGPatternTable: TTabSheet;
    tshSpritePatternTable: TTabSheet;
    imgBGPatternTable3: TImage32;
    imgBGPatternTable2: TImage32;
    lblBGPatternTable2lab: TLabel;
    lblBGPatternTable3lab: TLabel;
    lblTime: TLabel;
    imgSpritePatternTable2: TImage32;
    lblSpritePatternTable2: TLabel;
    imgSpritePatternTable3: TImage32;
    lblSpritePatternTable3: TLabel;
    cbTime: TComboBox;
    rgpViewBG: TRadioGroup;
    rgpViewSprite: TRadioGroup;
    lblScroll: TLabel;
    cbScroll: TComboBox;
    cmdMirrorWithVerticallyScrollingBlock: TButton;
    tshInfo: TTabSheet;
    lblBlockPointer: TLabel;
    lblBlockLength: TLabel;
    lblBlockOffset: TLabel;
    lblNumberOfStairs: TLabel;
    lblEnemyPointer: TLabel;
    lblEnemyOffset: TLabel;
    lblStairPointer: TLabel;
    lblEntranceOffset: TLabel;
    lblDoorOffset: TLabel;
    scrBGPatternTable2: TScrollBar;
    scrBGPatternTable3: TScrollBar;
    lblBGPatternTable2: TLabel;
    lblBGPatternTable3: TLabel;
    scrSprPatternTable2: TScrollBar;
    lblSprPatternTable2: TLabel;
    scrSprPatternTable3: TScrollBar;
    lblSprPatternTable3: TLabel;
    tshSecondQuest: TTabSheet;
    imgSecondQuestPatternTable: TImage32;
    lblSecondQuestPatternTablelab: TLabel;
    scrSecondQuestPatternTable: TScrollBar;
    lblSecondQuestPatternTable: TLabel;
    rdgSecondQuest: TRadioGroup;
    lblSpritePaletteOffset: TLabel;
    procedure FormShow(Sender: TObject);
    procedure scrBGPatternTable2Change(Sender: TObject);
    procedure scrBGPatternTable3Change(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure scrSecondQuestPatternTableChange(Sender: TObject);
    procedure scrSprPatternTable2Change(Sender: TObject);
    procedure scrSprPatternTable3Change(Sender: TObject);
    procedure rgpViewSpriteClick(Sender: TObject);
    procedure rgpViewBGClick(Sender: TObject);
    procedure rdgSecondQuestClick(Sender: TObject);
  private
    procedure PopulateGeneralSettingsTab;
    procedure PopulateBGPatternTab;
    procedure PopulateBlockInfoTab;
    procedure PopulateSpritePatternTab;
    procedure DrawPatternBarBG2;
    procedure DrawPatternBarBG3;
    procedure DrawPatternBarSpr2;
    procedure DrawPatternBarSpr3;
    procedure SaveBGPattern;
    procedure SaveSprPattern;
    procedure DrawPatternBarSecondQuest;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBlockProperties: TfrmBlockProperties;

implementation

uses uGlobal,cROMData, uResourcestrings;

{$R *.dfm}

procedure TfrmBlockProperties.PopulateGeneralSettingsTab();
begin
  if ROMData.CurrentBlock.VerticalScroll = true then
  begin
    cbScroll.Enabled := True;
    lblScroll.Enabled := True;
  end
  else
  begin
    cbScroll.Enabled := False;
    lblScroll.Enabled := False;
  end;
  // If the block does not have a mirror, disable the
  // mirror with up/down equivalent button
  if ROMData.CurrentBlock.MirrorWithBlockNo > -1 then
  begin
    cmdMirrorWithVerticallyScrollingBlock.Enabled := True;
  end
  else
  begin
    cmdMirrorWithVerticallyScrollingBlock.Enabled := False;
  end;
  if ROMData.CurrentBlock.Time >0 then
    cbTime.ItemIndex := cbTime.Items.IndexOf(IntToStr(ROMData.CurrentBlock.Time) + '00')
  else
    cbTime.ItemIndex := 0;
end;

procedure TfrmBlockProperties.PopulateBGPatternTab();
begin
  scrBGPatternTable2.Max := ROMData.NumberOfPatternBars -1;
  scrBGPatternTable3.Max := ROMData.NumberOfPatternBars -1;  
  scrBGPatternTable2.Position := ROMData.CurrentBlock.BGPatternTable2;
  scrBGPatternTable3.Position := ROMData.CurrentBlock.BGPatternTable3;
  lblBGPatternTable2.caption := IntToHex(scrBGPatternTable2.Position,2);
  lblBGPatternTable3.caption := IntToHex(scrBGPatternTable3.Position,2);
  DrawPatternBarBG2();
  DrawPatternBarBG3();
end;

procedure TfrmBlockProperties.DrawPatternBarBG2();
var
  PatTable : TBitmap32;
begin
  PatTable := TBitmap32.Create;
  try
    PatTable.Height := 32;
    PatTable.Width := 128;
    ROMData.DrawPatternBar(PatTable, scrBGPatternTable2.Position,Tinterleavetype(rgpViewBG.ItemIndex),0);
    imgBGPatternTable2.Bitmap := PatTable;
  finally
    FreeAndNil(PatTable);
  end;
end;

procedure TfrmBlockProperties.DrawPatternBarBG3();
var
  PatTable : TBitmap32;
begin
  PatTable := TBitmap32.Create;
  try
    PatTable.Height := 32;
    PatTable.Width := 128;
    ROMData.DrawPatternBar(PatTable, scrBGPatternTable3.Position,Tinterleavetype(rgpViewBG.ItemIndex),0);
    imgBGPatternTable3.Bitmap := PatTable;
  finally
    FreeAndNil(PatTable);
  end;
end;

procedure TfrmBlockProperties.DrawPatternBarSpr2();
var
  PatTable : TBitmap32;
begin
  PatTable := TBitmap32.Create;
  try
    PatTable.Height := 32;
    PatTable.Width := 128;
    ROMData.DrawPatternBar(PatTable, scrSprPatternTable2.Position,Tinterleavetype(rgpViewSprite.ItemIndex),4);
    imgSpritePatternTable2.Bitmap := PatTable;
  finally
    FreeAndNil(PatTable);
  end;
end;

procedure TfrmBlockProperties.DrawPatternBarSpr3();
var
  PatTable : TBitmap32;
begin
  PatTable := TBitmap32.Create;
  try
    PatTable.Height := 32;
    PatTable.Width := 128;
    ROMData.DrawPatternBar(PatTable, scrSprPatternTable3.Position,Tinterleavetype(rgpViewSprite.ItemIndex),4);
    imgSpritePatternTable3.Bitmap := PatTable;
  finally
    FreeAndNil(PatTable);
  end;
end;

procedure TfrmBlockProperties.DrawPatternBarSecondQuest();
var
  PatTable : TBitmap32;
begin
  PatTable := TBitmap32.Create;
  try
    PatTable.Height := 32;
    PatTable.Width := 128;
    ROMData.DrawPatternBar(PatTable, scrSecondQuestPatternTable.Position,Tinterleavetype(rdgSecondQuest.ItemIndex),4);
    imgSecondQuestPatternTable.Bitmap := PatTable;
  finally
    FreeAndNil(PatTable);
  end;

end;

procedure TfrmBlockProperties.PopulateSpritePatternTab();
begin
  scrSprPatternTable2.Max := ROMData.NumberOfPatternBars -1;
  scrSprPatternTable3.Max := ROMData.NumberOfPatternBars -1;
  scrSecondQuestPatternTable.Max := ROMData.NumberOfPatternBars -1;
  scrSprPatternTable2.Position := ROMData.CurrentBlock.SprPatternTable2;
  scrSprPatternTable3.Position := ROMData.CurrentBlock.SprPatternTable3;
  lblSprPatternTable2.caption := IntToHex(scrSprPatternTable2.Position,2);
  lblSprPatternTable3.caption := IntToHex(scrSprPatternTable3.Position,2);
  DrawPatternBarSpr2();
  DrawPatternBarSpr3();
  scrSecondQuestPatternTable.Position := ROMData.CurrentBlock.SprPatternTableSecondQuest;
  lblSecondQuestPatternTable.caption := IntToHex(scrSecondQuestPatternTable.Position,2);
  DrawPatternBarSecondQuest();

end;

procedure TfrmBlockProperties.PopulateBlockInfoTab();
begin
  lblBlockLength.Caption := BLOCKLENGTH + IntToStr(ROMData.CurrentBlock.BlockLength);
  lblNumberOfStairs.Caption := NUMSTAIRS + IntToStr(ROMData.CurrentBlock.Stairs.Count);
  lblStairPointer.Caption := STAIRPOINT + ' $' + ROMData.CurrentBlock.StairPointer;
  lblBlockPointer.Caption := BLOCKPOINT + ' $' + inttohex(ROMData.CurrentBlock.pointeroffset,5);
  lblBlockOffset.Caption := BLOCKOFFSET + ' $' + IntToHex(ROMData.CurrentBlock.BlockOffset,5);
  lblEntranceOffset.Caption := ENTRANCEOFFSET + ' $' + IntToHex(ROMData.CurrentBlock.Properties['Entrance'].Offset,5);
  lblDoorOffset.Caption := DOOROFFSET + ' $' + IntToHex(ROMData.CurrentBlock.DoorOffset,5);
  lblEnemyPointer.Caption := ENEMYPOINT + ' $' + ROMData.CurrentBlock.EnemyPointer;
  lblEnemyOffset.Caption := ENEMYOFFSET + ' $' + IntToHex(ROMData.CurrentBlock.EnemyOffset,5);
  lblSpritePaletteOffset.Caption := SPRPALOFFSET + ' $' + IntToHex(ROMData.CurrentBlock.SprPaletteOffset,3);
end;

procedure TfrmBlockProperties.FormShow(Sender: TObject);
begin
  PopulateGeneralSettingsTab();
  PopulateBGPatternTab();
  PopulateSpritePatternTab();
  PopulateBlockInfoTab();
end;

procedure TfrmBlockProperties.scrBGPatternTable2Change(Sender: TObject);
begin
  DrawPatternBarBG2();
  lblBGPatternTable2.Caption := IntToHex(scrBGPatternTable2.Position,2);
end;

procedure TfrmBlockProperties.scrBGPatternTable3Change(Sender: TObject);
begin
  DrawPatternBarBG3();
  lblBGPatternTable3.Caption := IntToHex(scrBGPatternTable3.Position,2);
end;

procedure TfrmBlockProperties.cmdOKClick(Sender: TObject);
begin
  SaveBGPattern();
  SaveSprPattern();
end;

procedure TfrmBlockProperties.SaveBGPattern();
begin
  ROMData.CurrentBlock.BGPatternTable2 := scrBGPatternTable2.Position;
  ROMData.CurrentBlock.BGPatternTable3 := scrBGPatternTable3.Position;
end;

procedure TfrmBlockProperties.SaveSprPattern();
begin
  ROMData.CurrentBlock.SprPatternTable2 := scrSprPatternTable2.Position;
  ROMData.CurrentBlock.SprPatternTable3 := scrSprPatternTable3.Position;
  ROMData.CurrentBlock.SprPatternTableSecondQuest := scrSecondQuestPatternTable.Position;
end;

procedure TfrmBlockProperties.scrSecondQuestPatternTableChange(
  Sender: TObject);
begin
  DrawPatternBarSecondQuest();
  lblSecondQuestPatternTable.Caption := IntToHex(scrSecondQuestPatternTable.Position,2);
end;

procedure TfrmBlockProperties.scrSprPatternTable2Change(Sender: TObject);
begin
  DrawPatternBarSpr2();
  lblSprPatternTable2.Caption := IntToHex(scrSprPatternTable2.Position,2);
end;

procedure TfrmBlockProperties.scrSprPatternTable3Change(Sender: TObject);
begin
  DrawPatternBarSpr3();
  lblSprPatternTable3.Caption := IntToHex(scrSprPatternTable3.Position,2);
end;

procedure TfrmBlockProperties.rgpViewSpriteClick(Sender: TObject);
begin
  DrawPatternBarSpr2();
  DrawPatternBarSpr3();
end;

procedure TfrmBlockProperties.rgpViewBGClick(Sender: TObject);
begin
  DrawPatternBarBG2();
  DrawPatternBarBG3();
end;

procedure TfrmBlockProperties.rdgSecondQuestClick(Sender: TObject);
begin
  DrawPatternBarSecondQuest();
end;

end.
