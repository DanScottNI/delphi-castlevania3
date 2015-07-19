unit fObjectProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,StrUtils;

type
  TfrmObjProperties = class(TForm)
    pgcPages: TPageControl;
    tshNone: TTabSheet;
    tshStairs: TTabSheet;
    tshEntrances: TTabSheet;
    tshDoors: TTabSheet;
    tshSpecObj: TTabSheet;
    grpStairs: TGroupBox;
    cbStairScreenNumber: TComboBox;
    lblStairScreenNumber: TLabel;
    chkStairFollow: TCheckBox;
    grpNone: TGroupBox;
    lblNone: TLabel;
    grpDoors: TGroupBox;
    lblDoorsScreenNumber: TLabel;
    cbDoorScreenNumber: TComboBox;
    chkDoorFollow: TCheckBox;
    grpEntrances: TGroupBox;
    lblEntranceScreenNumber: TLabel;
    cbEntranceScreenNumber: TComboBox;
    chkEntranceFollow: TCheckBox;
    tshVerticalEnemies: TTabSheet;
    grpVerticalEnemies: TGroupBox;
    grpSpecialObjects: TGroupBox;
    tshEnemies: TTabSheet;
    grpEnemyCandle: TGroupBox;
    lblType: TLabel;
    cbEnemyType: TComboBox;
    lblID: TLabel;
    cbEnemyTypeItemDropped: TComboBox;
    lblEnemyIndex: TLabel;
    scrEnemyIndex: TScrollBar;
    chkFilterNA: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cbStairScreenNumberChange(Sender: TObject);
    procedure cbDoorScreenNumberChange(Sender: TObject);
    procedure cbEntranceScreenNumberChange(Sender: TObject);
    procedure tshEnemiesShow(Sender: TObject);
    procedure cbEnemyTypeChange(Sender: TObject);
    procedure cbEnemyTypeItemDroppedChange(Sender: TObject);
    procedure chkFilterNAClick(Sender: TObject);
    procedure scrEnemyIndexChange(Sender: TObject);
  private
    _ActiveTab : Integer;
    _CurrentObj : Integer;
    _IgnoreReset : Boolean;
    procedure SetActiveTab(pTab : Integer);
    procedure LoadSettings;
    procedure LoadEnemyItemDropped;
    procedure SetScrEnemyIndexMax;
    { Private declarations }
  public
    Property ActiveTab : Integer read _ActiveTab write SetActiveTab;
    Property CurrentObj : Integer read _CurrentObj write _CurrentObj;
    property IgnoreReset : Boolean read _IgnoreReset;
    { Public declarations }
  end;

var
  frmObjProperties: TfrmObjProperties;

implementation

{$R *.dfm}

uses fSire, uGlobal,uConsts;

procedure TfrmObjProperties.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TfrmSireMain(Owner).SetMapEditingModeOn;
  action := caFree;
end;

procedure TfrmObjProperties.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to pgcPages.PageCount - 1 do
    pgcPages.Pages[i].TabVisible := False;

  ActiveTab := 0;
end;

procedure TfrmObjProperties.SetActiveTab(pTab : Integer);
begin
  if pTab = -1 then
    _ActiveTab := 0
  else
    _ActiveTab := pTab;
  pgcPages.ActivePageIndex := _ActiveTab;
  LoadSettings;
end;

procedure TfrmObjProperties.LoadSettings;
var
  i : Integer;
begin
  if (_CurrentObj = -1) then
  begin
    _ActiveTab := 0;
    pgcPages.ActivePageIndex := _ActiveTab;
  end;

  if _ActiveTab = 0 then
    exit;
  // Load in the selected stairs data.
  if _ActiveTab = 1 then
  begin
    // Validation.
    if _CurrentObj > ROMData.CurrentBlock.Stairs.Count -1 then
    begin
      ActiveTab := 0;
      exit;
    end;

    cbStairScreenNumber.Items.Clear;
    cbStairScreenNumber.Items.BeginUpdate;
    for i := 0 to ROMData.CurrentBlock.BlockLength do
      cbStairScreenNumber.Items.Add('Screen ' + IntToStr(i + 1));
    cbStairScreenNumber.Items.EndUpdate;
    cbStairScreenNumber.ItemIndex := ROMData.BlockPosition;

  end
  // Load in the selected doors data.
  else if _ActiveTab = 2 then
  begin
    if ROMData.CurrentBlock.VerticalScroll = True then
    begin
      lblDoorsScreenNumber.Enabled := False;
      chkDoorFollow.Enabled := False;
      cbDoorScreenNumber.Enabled := False;
    end
    else
    begin
      lblDoorsScreenNumber.Enabled := True;
      chkDoorFollow.Enabled := True;
      cbDoorScreenNumber.Enabled := True;
    end;

    cbDoorScreenNumber.Items.Clear;
    cbDoorScreenNumber.Items.BeginUpdate;
    for i := 0 to ROMData.CurrentBlock.BlockLength do
      cbDoorScreenNumber.Items.Add('Screen ' + IntToStr(i + 1));
    cbDoorScreenNumber.Items.EndUpdate;
    cbDoorScreenNumber.ItemIndex := ROMData.BlockPosition;
  end
  // Load in the selected entrance data.
  else if _ActiveTab = 3 then
  begin
    if ROMData.CurrentBlock.VerticalScroll = True then
    begin
      lblEntranceScreenNumber.Enabled := False;
      chkEntranceFollow.Enabled := False;
      cbEntranceScreenNumber.Enabled := False;
    end
    else
    begin
      lblEntranceScreenNumber.Enabled := True;
      chkEntranceFollow.Enabled := True;
      cbEntranceScreenNumber.Enabled := True;
    end;

    cbEntranceScreenNumber.Items.Clear;
    for i := 0 to ROMData.CurrentBlock.BlockLength do
      cbEntranceScreenNumber.Items.Add('Screen ' + IntToStr(i + 1));
    cbEntranceScreenNumber.ItemIndex := ROMData.BlockPosition;
  end
  // Load in the selected special object data.
  else if _ActiveTab = 4 then
  begin
    if _CurrentObj > ROMData.CurrentBlock.SpecialObjects.Count -1 then
    begin
      ActiveTab := 0;
      exit;
    end;
  end;
end;

procedure TfrmObjProperties.cbStairScreenNumberChange(Sender: TObject);
begin
  if _CurrentObj > ROMData.CurrentBlock.Stairs.Count -1 then
    exit;
  ROMData.CurrentBlock.Stairs[_CurrentObj].ScreenNumber := cbStairScreenNumber.ItemIndex;

  if chkStairFollow.Checked = True then
  begin
    ROMData.BlockPosition := cbStairScreenNumber.ItemIndex;
    if ROMData.CurrentBlock.VerticalScroll = True then
    begin
      _IgnoreReset := True;
      TfrmSireMain(Owner).vertScrollBar.Position := ROMData.BlockPosition;
      _IgnoreReset := False;
    end
    else
    begin
      _IgnoreReset := True;
      TfrmSireMain(Owner).horzScrollBar.Position := ROMData.BlockPosition;
      _IgnoreReset := False;
    end;
  end
  else
  begin
    TfrmSireMain(Owner).ResetObjects;
  end;
  TfrmSireMain(Owner).DrawLevelData;

end;

procedure TfrmObjProperties.cbDoorScreenNumberChange(Sender: TObject);
begin
  if Assigned(ROMData.CurrentBlock.Doors) = False then
    exit;
  ROMData.CurrentBlock.Doors.ScreenNumber := cbDoorScreenNumber.ItemIndex;

  if chkDoorFollow.Checked = True then
  begin
    ROMData.BlockPosition := cbDoorScreenNumber.ItemIndex;
    if ROMData.CurrentBlock.VerticalScroll = True then
    begin
      _IgnoreReset := True;
      TfrmSireMain(Owner).vertScrollBar.Position := ROMData.BlockPosition;
      _IgnoreReset := False;
    end
    else
    begin
      _IgnoreReset := True;
      TfrmSireMain(Owner).horzScrollBar.Position := ROMData.BlockPosition;
      _IgnoreReset := False;
    end;
  end
  else
  begin
    TfrmSireMain(Owner).ResetObjects;
  end;
  TfrmSireMain(Owner).DrawLevelData;
end;

procedure TfrmObjProperties.cbEntranceScreenNumberChange(Sender: TObject);
begin
  if Assigned(ROMData.CurrentBlock.Entrance) = False then
    exit;
  ROMData.CurrentBlock.Entrance.ScreenNumber := cbEntranceScreenNumber.ItemIndex;
  if chkEntranceFollow.Checked = True then
  begin
    ROMData.BlockPosition := cbEntranceScreenNumber.ItemIndex;
    if ROMData.CurrentBlock.VerticalScroll = True then
    begin
      _IgnoreReset := True;
      TfrmSireMain(Owner).vertScrollBar.Position := ROMData.BlockPosition;
      _IgnoreReset := False;
    end
    else
    begin
      _IgnoreReset := True;
      TfrmSireMain(Owner).horzScrollBar.Position := ROMData.BlockPosition;
      _IgnoreReset := False;
    end;
  end
  else
  begin
    TfrmSireMain(Owner).ResetObjects;
  end;
  TfrmSireMain(Owner).DrawLevelData;


end;

procedure TfrmObjProperties.LoadEnemyItemDropped;
var
  i : Integer;
begin
  if cbEnemyType.ItemIndex = 0 then
  begin
    cbEnemyTypeItemDropped.Items := ROMData.GlobalEnemyNames;

    if chkFilterNA.Checked = True then
    begin
      cbEnemyTypeItemDropped.Items.BeginUpdate;
      for i := cbEnemyTypeItemDropped.Items.Count - 1 downto 0 do
      begin
        if PosEx('N/A', cbEnemyTypeItemDropped.Items[i]) > 0 then
          cbEnemyTypeItemDropped.Items.Delete(i);
      end;
      cbEnemyTypeItemDropped.Items.EndUpdate;
    end;

    cbEnemyTypeItemDropped.ItemIndex := 0;

  end
  else
  begin
    cbEnemyTypeItemDropped.Items := ROMData.GlobalCandleItems;

    if chkFilterNA.Checked = True then
    begin
      cbEnemyTypeItemDropped.Items.BeginUpdate;
      for i := cbEnemyTypeItemDropped.Items.Count - 1 downto 0 do
      begin
        if PosEx('N/A', cbEnemyTypeItemDropped.Items[i]) > 0 then
          cbEnemyTypeItemDropped.Items.Delete(i);
      end;
      cbEnemyTypeItemDropped.Items.EndUpdate;
    end;

    cbEnemyTypeItemDropped.ItemIndex := 0;
  end;
end;

procedure TfrmObjProperties.tshEnemiesShow(Sender: TObject);
begin
  LoadEnemyItemDropped;
  TfrmSireMain(Owner).EnemyFilter := cbEnemyType.ItemIndex;
  if cbEnemyType.ItemIndex = 0 then
    TfrmSireMain(Owner).EnemyID := ROMData.GlobalEnemyNames.IndexOf(cbEnemyTypeItemDropped.Items[0])
  else
    TfrmSireMain(Owner).EnemyID := ROMData.GlobalCandleItems.IndexOf(cbEnemyTypeItemDropped.Items[0]);
  SetScrEnemyIndexMax;
  TfrmSireMain(Owner).DrawLevelData;  
end;

procedure TfrmObjProperties.cbEnemyTypeChange(Sender: TObject);
begin
  LoadEnemyItemDropped;
  TfrmSireMain(Owner).EnemyFilter := cbEnemyType.ItemIndex;
  if cbEnemyType.ItemIndex = 0 then
    TfrmSireMain(Owner).EnemyID := ROMData.GlobalEnemyNames.IndexOf(cbEnemyTypeItemDropped.Items[0])
  else
    TfrmSireMain(Owner).EnemyID := ROMData.GlobalCandleItems.IndexOf(cbEnemyTypeItemDropped.Items[0]);
  SetScrEnemyIndexMax;
  TfrmSireMain(Owner).DrawLevelData;
end;

procedure TfrmObjProperties.cbEnemyTypeItemDroppedChange(Sender: TObject);
begin
  if cbEnemyType.ItemIndex = 0 then
  begin
    lblEnemyIndex.Caption := 'Index ' +  IntToStr(ROMData.GetGlobalDataAmount(cbEnemyType.ItemIndex,
      ROMData.GlobalEnemyNames.IndexOf(cbEnemyTypeItemDropped.Items[cbEnemyTypeItemDropped.ItemIndex])));

    TfrmSireMain(Owner).EnemyID := ROMData.GlobalEnemyNames.IndexOf(cbEnemyTypeItemDropped.Items[cbEnemyTypeItemDropped.ItemIndex]);
    SetScrEnemyIndexMax;
    TfrmSireMain(Owner).DrawLevelData;
  end
  else
  begin
    lblEnemyIndex.Caption := 'Index ' +  IntToStr(ROMData.GetGlobalDataAmount(cbEnemyType.ItemIndex,
      ROMData.GlobalCandleItems.IndexOf(cbEnemyTypeItemDropped.Items[cbEnemyTypeItemDropped.ItemIndex])));

    TfrmSireMain(Owner).EnemyID := ROMData.GlobalCandleItems.IndexOf(cbEnemyTypeItemDropped.Items[cbEnemyTypeItemDropped.ItemIndex]);

    SetScrEnemyIndexMax;

    TfrmSireMain(Owner).DrawLevelData;
  end;
end;

procedure TfrmObjProperties.chkFilterNAClick(Sender: TObject);
begin
  LoadEnemyItemDropped;
end;

procedure TfrmObjProperties.scrEnemyIndexChange(Sender: TObject);
begin
  TfrmSireMain(Owner).DrawLevelData;
end;

procedure TfrmObjProperties.SetScrEnemyIndexMax;
var
  num : Integer;
begin

  num := 0;

  if cbEnemyType.ItemIndex = 0 then
  begin
    num := ROMData.GetGlobalDataAmount(cbEnemyType.ItemIndex,ROMData.GlobalEnemyNames.IndexOf(cbEnemyTypeItemDropped.Items[cbEnemyTypeItemDropped.ItemIndex]));
  end
  else
  begin
    num := ROMData.GetGlobalDataAmount(cbEnemyType.ItemIndex,ROMData.GlobalCandleItems.IndexOf(cbEnemyTypeItemDropped.Items[cbEnemyTypeItemDropped.ItemIndex]));
  end;

  scrEnemyIndex.Position := 0;

  if num = uConsts.NUMENEDISP then
    scrEnemyIndex.Max := 0
  else
    scrEnemyIndex.Max := num div uConsts.NUMENEDISP;



  if scrEnemyIndex.Max = 0 then
    scrEnemyIndex.Enabled := False
  else
    scrEnemyIndex.Enabled := True;

end;

end.
