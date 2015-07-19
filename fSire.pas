unit fSire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, ActnList, Menus, StdCtrls, ToolWin, ImgList, gr32,
  gr32_layers, clipbrd, shellapi,XPMan, JvComponent, JvDragDrop,
  FileCtrl, uConsts, ComCtrls, JvComponentBase;

type
  TfrmSireMain = class(TForm)
    imgLevel: TImage32;
    imgCurTile: TImage32;
    TileScrollBar: TScrollBar;
    StatusBar: TStatusBar;
    ActionList: TActionList;
    actAbout: TAction;
    actOpenROM: TAction;
    actSaveROM: TAction;
    actCloseROM: TAction;
    Bitmap32List: TBitmap32List;
    ImageList: TImageList;
    horzScrollBar: TScrollBar;
    vertScrollbar: TScrollBar;
    actTSA: TAction;
    actPalette: TAction;
    actBlockProperties: TAction;
    actPreferences: TAction;
    actTextEditor: TAction;
    actLevelProperties: TAction;
    actCHRExpansion: TAction;
    actMapEditingMode: TAction;
    actObjectEditingMode: TAction;
    actCopyScreenToClipboard: TAction;
    actDamage: TAction;
    actDebug: TAction;
    XPManifest: TXPManifest;
    actSaveAsIPS: TAction;
    JvDragDrop: TJvDragDrop;
    actGlobalCandleData: TAction;
    actGlobalEnemyData: TAction;
    actLevelStats: TAction;
    actGridlines: TAction;
    OpenDialog: TOpenDialog;
    Toolbar: TToolBar;
    tlbOpenROM: TToolButton;
    tlbSaveROM: TToolButton;
    tlbCloseROM: TToolButton;
    tlbSep1: TToolButton;
    tlbTSAEditor: TToolButton;
    tlbShowBlockProperties: TToolButton;
    tlbPaletteEditor: TToolButton;
    tlbLevelProperties: TToolButton;
    tlbTextEditor: TToolButton;
    tlbSep2: TToolButton;
    tlbMapEditingMode: TToolButton;
    tlbStairsEditingMode: TToolButton;
    tlbSep3: TToolButton;
    tlbEnableGridlines: TToolButton;
    MainMenu: TMainMenu;
    mnuFile: TMenuItem;
    mnuOpenROM: TMenuItem;
    mnuRecent: TMenuItem;
    mnuRecentItem1: TMenuItem;
    mnuRecentItem2: TMenuItem;
    mnuRecentItem3: TMenuItem;
    mnuRecentItem4: TMenuItem;
    mnuRecentItem5: TMenuItem;
    mnuSaveROM: TMenuItem;
    mnuCloseROM: TMenuItem;
    mnuSaveAsIPS: TMenuItem;
    N1: TMenuItem;
    mnuPreferences: TMenuItem;
    mnuLaunchAssociatedEmulator: TMenuItem;
    N2: TMenuItem;
    mnuExit: TMenuItem;
    mnuEdit: TMenuItem;
    mnuMapEditingMode: TMenuItem;
    mnuObjectEditingMode: TMenuItem;
    N3: TMenuItem;
    mnuCopyScreenImagetoClipboard: TMenuItem;
    mnuView: TMenuItem;
    mnuViewStairs: TMenuItem;
    mnuViewEntrances: TMenuItem;
    mnuViewDoors: TMenuItem;
    mnuViewVerticalEnemies: TMenuItem;
    mnuViewSpecialObjects: TMenuItem;
    mnuGridlines: TMenuItem;
    mnuTools: TMenuItem;
    mnuTSAEditor: TMenuItem;
    mnuPaletteEditor: TMenuItem;
    mnuLevelProperties: TMenuItem;
    mnuBlockProperties: TMenuItem;
    mnuGlobalEnemyDataEditor: TMenuItem;
    mnuGlobalCandleData: TMenuItem;
    mnuDamageEditor: TMenuItem;
    mnuTextEditor: TMenuItem;
    mnuAdvanced: TMenuItem;
    mnuCHRExpansion: TMenuItem;
    mnuEnableDebug: TMenuItem;
    mnuLevelStatistics: TMenuItem;
    mnuHelp: TMenuItem;
    mnuVisitSireHomepage: TMenuItem;
    mnuAbout: TMenuItem;
    tlbGlobalEnemyEditor: TToolButton;
    tlbGlobalCandleEditor: TToolButton;
    tlbEnemyEditingMode: TToolButton;
    actEnemyEditingMode: TAction;
    actEnemyDataInspector: TAction;
    mnuEnemyDataInspector: TMenuItem;
    actPresetObj: TAction;
    PresetObjects1: TMenuItem;
    procedure FormCanResize(Sender: TObject; var NewWidth, NewHeight: Integer;
      var Resize: Boolean);
    procedure FormShow(Sender: TObject);
    procedure actGlobalEnemyDataExecute(Sender: TObject);
    procedure actOpenROMExecute(Sender: TObject);
    procedure TileScrollBarChange(Sender: TObject);
    procedure horzScrollBarChange(Sender: TObject);
    procedure imgLevelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure vertScrollbarChange(Sender: TObject);
    procedure imgCurTileMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure FormCreate(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actTSAExecute(Sender: TObject);
    procedure actPaletteExecute(Sender: TObject);
    procedure imgLevelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgLevelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer; Layer: TCustomLayer);
    procedure mnuExitClick(Sender: TObject);
    procedure actBlockPropertiesExecute(Sender: TObject);
    procedure actCloseROMExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actPreferencesExecute(Sender: TObject);
    procedure actTextEditorExecute(Sender: TObject);
    procedure actLevelPropertiesExecute(Sender: TObject);
    procedure actCHRExpansionExecute(Sender: TObject);
    procedure actMapEditingModeExecute(Sender: TObject);
    procedure actObjectEditingModeExecute(Sender: TObject);
    procedure actCopyScreenToClipboardExecute(Sender: TObject);
    procedure actDamageExecute(Sender: TObject);
    procedure mnuLaunchAssociatedEmulatorClick(Sender: TObject);
    procedure actDebugExecute(Sender: TObject);
    procedure actSaveROMExecute(Sender: TObject);
    procedure mnuRecentItem1Click(Sender: TObject);
    procedure horzScrollBarScroll(Sender: TObject; ScrollCode: TScrollCode;
      var ScrollPos: Integer);
    procedure actSaveAsIPSExecute(Sender: TObject);
    procedure mnuVisitSireHomepageClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TileScrollBarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure horzScrollBarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure JvDragDropDrop(Sender: TObject; Pos: TPoint;
      Value: TStrings);
    procedure actGlobalCandleDataExecute(Sender: TObject);
    procedure actLevelStatsExecute(Sender: TObject);
    procedure actGridlinesExecute(Sender: TObject);
    procedure actEnemyEditingModeExecute(Sender: TObject);
    procedure mnuViewStairsClick(Sender: TObject);
    procedure actEnemyDataInspectorExecute(Sender: TObject);
    procedure actPresetObjExecute(Sender: TObject);
  private
    // The tiles that have been assigned to the left
    // click and the middle click.
    _CurTileLeft, _CurTileMid,_CurTilePos : Integer;
    TSA, ObjProp : TForm;
    _EditingMode : Byte;
//    _CurrentObject : Integer;
//    _ObjType : Byte;
    _ObjType : TObjDetect;
    _MouseDown : Boolean;
    _Filter : Byte;
    _EnemyID : Byte;
    procedure DisplayScreenInfo;
    procedure SetVisibleStatus(pVisible: Boolean);
    procedure DrawTileSelector();
    procedure UpdateBlock;
    procedure ResizeFormForHorizontal;
    procedure ResizeFormForVertical;
    procedure LoadROM(pROMFile,pDataFile : String;pAutoCheck : Boolean);
    procedure SetIconTransparency;
    procedure ExecuteEmulator;
    procedure SetEmuMenuText();
    function AutoCheckROMType(pFilename : String) : String;
    procedure CreateRecentMenu();
    procedure CloseROM(pDisableCancel : Boolean);
    procedure SetImageIndex();
    procedure SetIPSEnabled();
    function RunFolderFileCheck : Boolean;
    procedure DisableImages;
    procedure LoadEmulatorIcon;
    { Private declarations }
  public
    CurTSABlock : Integer;
    procedure RedrawScreen;
    procedure UpdateTitleCaption;
    procedure SetMapEditingModeOn;
    procedure DrawLevelData();
    procedure ResetObjects;
    property EnemyFilter : Byte read _Filter write _Filter;
    property EnemyID : Byte read _EnemyID write _EnemyID;
    { Public declarations }
  end;

var
  frmSireMain: TfrmSireMain;


implementation


uses fOpenDialog,fAbout, fTSA, fPalette, fBlockProperties, fPreferences,
  fTextEditor, uLunarCompress, fLevelProperties, fCHRExp,fDamageSettings,
  uGlobal, cROMData, cConfiguration,MemINIHexFile,iNESImage,
  fObjectProp, fGlobalCandleEditor, uResourcestrings, fLevelStats,
  fGlobalEnemyEditor, fEnemyDataInspector,fPresetObj;

{$R *.dfm}


procedure TfrmSireMain.actOpenROMExecute(Sender: TObject);
var
  OpDlg : TfrmOpenDialog;
begin

  if EditorConfig.CustomOpenDialog = uConsts.OPD_CUSTOM then
  begin

    OpDlg := TfrmOpenDialog.Create(self);
    try
      if (EditorConfig.RecentFile[0] <> '') and (FileExists(EditorConfig.RecentFile[0])) then
        OpDlg.OpenDir := ExtractFileDir(EditorConfig.RecentFile[0]);

      if OpDlg.ShowModal = mrOK then
      begin

        if FileExists(OpDlg.Filename) = true then
        begin
          LoadROM(OpDlg.Filename,OpDlg.DataFile,OpDlg.AutoCheck);
        end;

      end;
    finally
      FreeAndNil(OpDlg);
    end;
  end
  else if EditorConfig.CustomOpenDialog = uConsts.OPD_STANDARD then
  begin
    if (EditorConfig.RecentFile[0] <> '') and (FileExists(EditorConfig.RecentFile[0])) then
      OpenDialog.InitialDir := ExtractFileDir(EditorConfig.RecentFile[0]);

    if OpenDialog.Execute then
      if FileExists(OpenDialog.Filename) then
        LoadROM(OpenDialog.Filename,EditorConfig.FullDataFileName,EditorConfig.AutoCheck);


  end;

end;

procedure TfrmSireMain.LoadROM(pROMFile,pDataFile : String;pAutoCheck : Boolean);
var
  TempFilename : String;
begin
  // If the ROM file does not exist then exit the subroutine.
  if FileExists(pROMFile) = False then
    exit;
  // Transfer the datafile's filename over to another variable.
  TempFilename := pDataFile;
  // If the user wants to automatically check the ROM type then
  // check it. If there is no matches, reset the TempFileName variable
  // back to pDataFile (Usually the default datafile).
  if pAutoCheck = True then
  begin
    TempFilename := AutoCheckROMType(pROMFile);
    if TempFilename = '' then
      TempFilename := pDataFile
    else
      TempFilename := ExtractFileDir(Application.ExeName) + '\Data\' + TempFilename;
  end;

  if Assigned(ROMData) then
    CloseROM(True);

  ROMData := TROMData.Create(pROMFile,pDataFile);

  if ROMData.DataFileProblems = True then
  begin
    showmessage('There has been a datafile problem. Most likely, the datafile doesn''t exist.');
    FreeAndNil(ROMData);
    exit;
  end;

  // Mapper, PRG and CHR check
  if ROMData.IsCV3ROM = False then
  begin
    // If the user elects to not load the ROM, then
    // display a prompt informing the user that the ROM will
    // not be loaded, free the ROM, and exit the subroutine.
    if EditorConfig.MapperWarnings = 0 then
    begin
        Messagebox(handle,PChar(MAPPERWARNINGSTRICT),PChar(Application.Title),0);
        FreeAndNil(ROMData);
        exit;
    end
    // If the user has elected to be prompted about the
    // ROM not conforming to the standard Castlevania III/Akumajou Densetsu settings
    // tell the user, and give them the choice of whether or not to load it.
    else if EditorConfig.MapperWarnings = 1 then
    begin
      if MessageBox(Handle,PChar(MAPPERWARNINGPROMPT + CRLF + DOCONTINUE),
            PChar(Application),MB_YESNO) = IDNO	then
      begin
        FreeAndNil(ROMData);
        exit;
      end;
    end;
  end;

  if FileExists(EditorConfig.FullPaletteName) then
    ROMData.LoadPaletteFile(EditorConfig.FullPaletteName)
  else
    ROMData.LoadDefaultPalette;

  ROMData.Level := 0;
  UpdateTitleCaption;
  DisplayScreenInfo;

  actDebug.Checked := ROMData.DebugMode;
  SetEmuMenuText();
  SetIPSEnabled();

  EditorConfig.AddRecentFile(pROMFile);
  SetVisibleStatus(True);
  actMapEditingMode.Execute;
  CreateRecentMenu;
  DrawLevelData();
  ResizeFormForHorizontal();
  UpdateBlock();

end;

procedure TfrmSireMain.SetEmuMenuText();
begin
  if (EditorConfig.EmulatorPath <> '') and (FileExists(EditorConfig.EmulatorPath) = True) then
  begin
    mnuLaunchAssociatedEmulator.Caption := LAUNCH + ExtractFileName(EditorConfig.EmulatorPath);
    mnuLaunchAssociatedEmulator.Enabled := True;
  end
  else
  begin
    mnuLaunchAssociatedEmulator.Caption := NOEMUASSOCIATED;
    mnuLaunchAssociatedEmulator.Enabled := False;
  end;

  LoadEmulatorIcon;
  
  if Assigned(ROMData) = False then
    mnuLaunchAssociatedEmulator.Enabled := False
  else
    mnuLaunchAssociatedEmulator.Enabled := True;
end;

procedure TfrmSireMain.UpdateBlock();
begin
  tilescrollbar.Max := ROMData.CurrentLevel.NumberOfTiles - 5;

  if ROMData.CurrentBlock.VerticalScroll = true then
  begin
    if ROMData.CurrentBlock.BlockLength > 0 then
    begin
      vertScrollBar.Enabled := True;
      vertscrollbar.Max := ROMData.CurrentBlock.BlockLength;

      horzScrollBar.Enabled := False;
    end
    else if ROMData.CurrentBlock.BlockLength = 0 then
    begin
      vertScrollBar.Enabled := False;
      horzScrollBar.Enabled := False;
    end;
  end
  else if ROMData.CurrentBlock.VerticalScroll = false then
  begin
    if ROMData.CurrentBlock.BlockLength > 0 then
    begin
      horzScrollBar.Enabled := True;
      horzScrollBar.Max := ROMData.CurrentBlock.BlockLength;
      vertScrollBar.Max := 0;
      vertScrollBar.Enabled := False;
    end
    else if ROMData.CurrentBlock.BlockLength = 0 then
    begin

      vertScrollBar.Max := 0;
      vertScrollBar.Enabled := False;
      horzScrollBar.Enabled := False;
    end;
  end;
  TileScrollBar.Position := 0;
  DrawTileSelector();
end;

procedure TfrmSireMain.SetVisibleStatus(pVisible : Boolean);
begin
  imgLevel.Visible := pVisible;
  imgCurTile.Visible := pVisible;
  TileScrollBar.Visible := pVisible;
  vertScrollbar.Visible := pVisible;
  horzScrollbar.Visible := pVisible;
  actSaveROM.Enabled := pVisible;
  actCloseROM.Enabled := pVisible;
  actTSA.Enabled := pVisible;
  actPalette.Enabled := pVisible;
  actBlockProperties.Enabled := pVisible;
  actMapEditingMode.Enabled := pVisible;
  actObjectEditingMode.Enabled := pVisible;
  actEnemyEditingMode.Enabled := pVisible;
  actGridlines.Enabled := pVisible;
  actTextEditor.Enabled := pVisible;
  actLevelProperties.Enabled := pVisible;
  actCHRExpansion.Enabled := pVisible;
  actCopyScreenToClipboard.Enabled := pVisible;
  actPresetObj.Enabled := pVisible;
  actDamage.Enabled := pVisible;
  mnuAdvanced.Enabled := pVisible;
  actDebug.Enabled := pVisible;
  actGlobalCandleData.Enabled := pVisible;
  actGlobalEnemyData.Enabled := pVisible;

  mnuLaunchAssociatedEmulator.Enabled := pVisible;
  mnuViewStairs.Enabled := pVisible;
  mnuViewEntrances.Enabled := pVisible;
  mnuViewDoors.Enabled := pVisible;
  mnuViewVerticalEnemies.Enabled := pVisible;
  mnuViewSpecialObjects.Enabled := pVisible;

  if DEBUG then
  begin
    actEnemyDataInspector.Enabled := pVisible;
    actLevelStats.Enabled := pVisible;
  end
  else
  begin
    actEnemyDataInspector.Enabled := False;
    actLevelStats.Enabled := False;
    actEnemyDataInspector.Visible := False;
    actLevelStats.Visible := False;
  end;
end;

procedure TfrmSireMain.ResizeFormForVertical();
begin
  imgLevel.Height := 480;
  horzScrollbar.Top := 510;
  vertScrollBar.Height := 480;
  clientHeight := 550;
end;

procedure TfrmSireMain.ResizeFormForHorizontal();
begin
  imgLevel.Height := 384;
  horzScrollbar.Top := 414;
  vertScrollBar.Height := 384;
  clientHeight := 453;
end;

procedure TfrmSireMain.DrawLevelData();
var
  LevelBMP : TBitmap32;
  i : Integer;
  Height : Byte;
  ObjectFilter : Byte;
begin
  LevelBMP := TBitmap32.Create;
  try
    if ROMData.CurrentBlock.VerticalScroll = false then
      LevelBMP.Height := 192
    else
      LevelBMP.Height := 240;

    LevelBMP.Width := 256;

    ObjectFilter := 0;

    if mnuViewStairs.Checked = True then
      ObjectFilter := ObjectFilter + uConsts.DRAWSTAIRS;
    if mnuViewEntrances.Checked = True then
      ObjectFilter := ObjectFilter + uConsts.DRAWENTRANCES;
    if mnuViewDoors.Checked = True then
      ObjectFilter := ObjectFilter + uConsts.DRAWDOORS;
    if mnuViewSpecialObjects.Checked = True then
      ObjectFilter := ObjectFilter + uConsts.DRAWSPECIALOBJECTS;
    if mnuViewVerticalEnemies.Checked = True then
      ObjectFilter := ObjectFilter + uConsts.DRAWVERTICALENEMIES;



    if (_EditingMode = ENEMYEDITINGMODE) and (ROMData.CurrentBlock.VerticalScroll = False) then
    begin
      ROMData.DrawCurrentScreen(LevelBMP,Bitmap32List,$00, _ObjType.ObjIndex,_ObjType.ObjType);
      ROMData.DrawEnemyData(LevelBMP,_Filter,_EnemyID, TfrmObjProperties(ObjProp).scrEnemyIndex.Position);
    end
    else
    begin
      ROMData.DrawCurrentScreen(LevelBMP,Bitmap32List,ObjectFilter, _ObjType.ObjIndex,_ObjType.ObjType);
    end;


    if EditorConfig.GridlinesOn = True then
    begin

      if ROMData.CurrentBlock.VerticalScroll = True then
        Height := 7
      else
        Height := 5;

      for i := 1 to 7 do
        LevelBMP.Line(i*32,0,i*32,LevelBMP.Height,EditorConfig.GridlineColour);
      for i := 1 to Height do
        LevelBMP.Line(0,i*32,LevelBMP.Width,i*32,EditorConfig.GridlineColour);
    end;

    imgLevel.Bitmap := LevelBMP;

  finally
    FreeAndNil(LevelBMP);
  end;
end;

procedure TfrmSireMain.DrawTileSelector();
var
  TileSelector : TBitmap32;
  tlFont : TFont;
begin
  TileSelector := TBitmap32.Create;
  try
    TileSelector.Height := 192;
    TileSelector.Width := 32;
    ROMData.DrawTileSelector(TileScrollbar.Position,TileSelector);
    tlFont := TFont.Create;
    tlFont.Name := 'Tahoma';
    tlFont.Size := 7;

    tlFont.Color := wincolor(EditorConfig.LeftTextColour);;
    TileSelector.Font := tlFont;
    if (_CurTileLeft >= TileScrollbar.Position) and (_CurTileLeft <= TileScrollbar.Position + 5) then
    begin
      if _CurTileLeft = _CurTileMid then
      begin
        TileSelector.Line(0,(_CurTileLeft - TileScrollBar.Position)*32,0,(_CurTileLeft-TileScrollBar.Position)* 32 + 32,EditorConfig.LeftTextColour);
        TileSelector.Line(0,(_CurTileLeft - TileScrollBar.Position)*32,32,(_CurTileLeft-TileScrollBar.Position)* 32,EditorConfig.LeftTextColour);
      end
      else
        TileSelector.FrameRectS(0,(_CurTileLeft - TileScrollBar.Position)*32,32,(_CurTileLeft-TileScrollBar.Position)* 32 + 32,EditorConfig.LeftTextColour);
      if EditorConfig.DispLeftMidText = true then
        TileSelector.Textout(1,(_CurTileLeft - TileScrollBar.Position)*32,LEFTTEXT);
    end;
    TileSelector.Font.Color := wincolor(EditorConfig.MiddleTextColour);
    if (_CurTileMid >= TileScrollbar.Position) and (_CurTileMid <= TileScrollbar.Position + 5) then
    begin
      if _CurTileLeft = _CurTileMid then
      begin
        TileSelector.Line(31,(_CurTileMid - TileScrollBar.Position)*32,31,(_CurTileMid-TileScrollBar.Position)* 32 + 32,EditorConfig.MiddleTextColour);
        TileSelector.Line(0,(_CurTileMid - TileScrollBar.Position)*32+31,32,(_CurTileMid-TileScrollBar.Position)* 32+31,EditorConfig.MiddleTextColour);
      end
      else
        TileSelector.FrameRectS(0,(_CurTileMid - TileScrollBar.Position)*32,32,(_CurTileMid-TileScrollBar.Position)* 32 + 32,EditorConfig.MiddleTextColour);
      if EditorConfig.DispLeftMidText = true then
        TileSelector.Textout(1,(_CurTileMid - TileScrollBar.Position)*32+16,MIDDLETEXT);
    end;
    imgCurTile.Bitmap := TileSelector;
  finally
    FreeAndNil(TileSelector);
    FreeAndNil(tlFont);
  end;
end;

procedure TfrmSireMain.TileScrollBarChange(Sender: TObject);
begin
  DrawTileSelector();
end;

procedure TfrmSireMain.horzScrollBarChange(Sender: TObject);
begin

  if (Assigned(ObjProp)) and (_EditingMode = OBJEDITINGMODE) then
  begin
    if TfrmObjProperties(ObjProp).IgnoreReset = False then
      ResetObjects;
  end;
  ROMData.BlockPosition := horzScrollBar.Position;
  DrawLevelData();
  UpdateTitleCaption;
  DisplayScreenInfo;
end;

procedure TfrmSireMain.imgLevelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  _MouseDown := False;
  UpdateTitleCaption;
end;

procedure TfrmSireMain.vertScrollbarChange(Sender: TObject);
begin
  if (Assigned(ObjProp)) and (_EditingMode = OBJEDITINGMODE) then
    ResetObjects;

  ROMData.BlockPosition := vertScrollBar.Position;
  DrawLevelData();
  UpdateTitleCaption;
  DisplayScreenInfo;
end;

procedure TfrmSireMain.imgCurTileMouseDown(Sender: TObject;Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer;Layer: TCustomLayer);
begin
  if CurTSABlock = -1 then
  begin
    if ((Button = mbLeft) and (ssShift in Shift)) or (Button = mbMiddle) then
      _CurTileMid := TileScrollBar.Position + (Y div 64)
    else if Button = mbLeft then
      _CurTileLeft := TileScrollBar.Position + (Y div 64);
    DrawTileSelector();
  end
  else
  begin
    if Button = mbLeft then
    begin
      ROMData.EditTSA(TileScrollBar.Position + (Y div 64),(y mod 64) div 16,x div 16,CurTSABlock);

    end
    else if Button = mbRight then
    begin
      ROMData.IncrementBlockAttributes(TileScrollBar.Position + (Y div 64),(y mod 64) div 32, x div 32);
    end;
    DrawLevelData();
    DrawTileSelector();
    UpdateTitleCaption;
  end;
end;

procedure TfrmSireMain.FormCreate(Sender: TObject);
begin

  if ParamCount = 2 then
    if ParamStr(2) = '-d' then
      DEBUG := True
    else
      DEBUG := False;

  if RunFolderFileCheck = False then
  begin
    showmessage(DATAFILESDAMAGED + CRLF + PLEASEREINSTALL);
    exit;
  end;

  //MemCheckLogFileName := ExtractFileDir(Application.EXEname) + '\memory.txt';
  //MemChk();

  Application.Title := APPLICATIONTITLE;
  EditorConfig := TSireConfig.Create(ExtractFileDir(Application.EXEName) + '\options.ini');
  CurTSABlock := -1;
  _ObjType.ObjType := uConsts.NONETYPE;
  _ObjType.ObjIndex := -1;
  SetEmuMenuText();
  SetIPSEnabled();
  UpdateTitleCaption;
  DisplayScreenInfo;
  SetIconTransparency();
  CreateRecentMenu;
  SetImageIndex;
  // Now look up the commandline parameters. If the user has
  // passed a ROM's filename along with EXE name, open the ROM.
  if ParamCount > 0 then
    if FileExists(ParamStr(1)) then
      LoadROM(ParamStr(1),EditorConfig.FullDataFileName, EditorConfig.AutoCheck);
  DisableImages;
  SetVisibleStatus(false);
end;

function TfrmSireMain.RunFolderFileCheck : Boolean;
begin

  result := True;

  if DirectoryExists(ExtractFileDir(Application.ExeName) + '\Data') = false then
  begin
    result := False;
    exit;
  end;


end;

procedure TfrmSireMain.actAboutExecute(Sender: TObject);
var
  About : TfrmAbout;
begin
  About := TfrmAbout.Create(self);
  try
    About.ShowModal;
  finally
    FreeAndNil(About);
  end;

end;

procedure TfrmSireMain.actTSAExecute(Sender: TObject);
begin
  if CurTSABlock = -1 then
    TSA := TfrmTSAEditor.Create(self);

  TSA.Show;

end;

procedure TfrmSireMain.actPaletteExecute(Sender: TObject);
var
  Palette : TfrmPaletteEditor;
begin
  Palette := TfrmPaletteEditor.Create(self);
  try
    Palette.ShowModal;
  finally
    FreeAndNil(Palette);
  end;
end;

procedure TfrmSireMain.RedrawScreen();
begin
  ROMData.RefreshOnScreenTiles(TileScrollBar.Position,False);
  DrawLevelData();
  DrawTileSelector();
end;

procedure TfrmSireMain.imgLevelMouseDown(Sender: TObject;Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer;Layer: TCustomLayer);
var
  GlobalEditor : TForm;
  IDUnderMouse : Integer;
begin
  if _EditingMode = MAPEDITINGMODE then
  begin

    if Button = mbLeft then
    begin
      ROMData.RoomData[y div 64, x div 64] := _CurTileLeft;

      DrawLevelData();
    end
    else if ((Button = mbLeft) and (ssShift in Shift)) or (Button = mbMiddle) then
    begin
      ROMData.RoomData[y div 64, x div 64] := _CurTileMid;

      DrawLevelData();
    end
    else if Button = mbRight then
    begin
      _CurTilePos := ROMData.RoomData[y div 64,x div 64];
      showmessage(IntToHex(ROMData.RoomData[y div 64,x div 64],2));
      if ssShift in Shift then
        _CurTileMid := _CurTilePos
      else
        _CurTileLeft := _CurTilePos;
      if _CurTilePos > TileScrollBar.Max then _CurTilePos := TileScrollBar.Max;
      if (_CurTilePos <= TileScrollBar.Position) or (_CurTilePos >= TileScrollBar.Position + 5) then
        TileScrollBar.Position := _CurTilePos;
      DrawTileSelector();
    end;

    UpdateTitleCaption;
  end
  else if _EditingMode = OBJEDITINGMODE then
  begin
    _ObjType := ROMData.DetectObjUnderMouse(x div 2,y div 2);

    TfrmObjProperties(ObjProp).CurrentObj := _ObjType.ObjIndex;
    TfrmObjProperties(ObjProp).ActiveTab := _ObjType.ObjType;

    _MouseDown := True;

    if _ObjType.ObjType = uConsts.STAIRTYPE then
    begin
      if Button = mbRight then
      begin
        ROMData.IncrementStairDirection(_ObjType.ObjIndex);
        DrawLevelData();
        _MouseDown := False;
      end;
    end
    else if _ObjType.ObjType = uConsts.DOORTYPE then
    begin
      if Button = mbRight then
      begin
        ROMData.ChangeDoorDirection();
        _MouseDown := False;
        DrawLevelData();
      end;
    end
    else if _ObjType.ObjType = uConsts.ENTRANCETYPE then
    begin

    end
    else if _ObjType.ObjType = uConsts.SPECOBJTYPE then
    begin

    end;

    DrawLevelData;

    UpdateTitleCaption;
  end
  else if _EditingMode = uConsts.ENEMYEDITINGMODE then
  begin
    if Button = mbLeft then
    begin
      ROMData.EditEnemyData(x div 2,y div 2,EnemyFilter,EnemyID,TfrmObjProperties(ObjProp).scrEnemyIndex.Position);
      DrawLevelData;
      UpdateTitleCaption;
    end
    else if (Button = mbRight) and (ssShift in Shift) then
    begin
      IDUnderMouse := ROMData.GetEnemyCandleUnderMouse(x div 2,y div 2,EnemyFilter,EnemyID,TfrmObjProperties(ObjProp).scrEnemyIndex.Position);
      if IDUnderMouse > -1 then
      begin
        if EnemyFilter = 0 then
        begin
          GlobalEditor := TfrmGlobalEnemyEditor.Create(self);
          try
            JvDragDrop.AcceptDrag := False;
            TfrmGlobalEnemyEditor(GlobalEditor).InitialSelected := IDUnderMouse;
            if GlobalEditor.ShowModal = mrOk then
            begin
              DrawLevelData;
              UpdateTitleCaption;
            end
            else
            begin
              ROMData.LoadGlobalEnemyData;
            end;

            JvDragDrop.AcceptDrag := True;
          finally
            FreeAndNil(GlobalEditor);
          end;

        end
        else
        begin
          GlobalEditor := TfrmGlobalCandleEditor.Create(self);
          try
            JvDragDrop.AcceptDrag := False;
            TfrmGlobalCandleEditor(GlobalEditor).InitialSelected := IDUnderMouse;
            if GlobalEditor.ShowModal = mrOk then
            begin
              DrawLevelData;
              UpdateTitleCaption;
            end
            else
            begin
              ROMData.LoadGlobalCandleData;
            end;

            JvDragDrop.AcceptDrag := True;
          finally
            FreeAndNil(GlobalEditor);
          end;
        end;
      end;

    end;
  end;
end;

procedure TfrmSireMain.imgLevelMouseMove(Sender: TObject;Shift: TShiftState;
  X, Y: Integer; Layer: TCustomLayer);
var
  Draw : Boolean;
  TempX, TempY : Integer;
begin

  if _EditingMode = MAPEDITINGMODE then
  begin
    
    if ((ssLeft in Shift) and (ssShift in Shift)) or (ssMiddle in Shift) then
    begin
      ROMData.RoomData[y div (32 * 2), x div (32 * 2)] := _CurTileMid;
      DrawLevelData();
    end
    else if ssLeft in Shift then
    begin
      ROMData.RoomData[y div (32 * 2), x div (32 * 2)] := _CurTileLeft;
      DrawLevelData();
    end
    else if ssright in Shift then
    begin
      _CurTilePos := ROMData.RoomData[y div 64,x div 64];
      if ssShift in Shift then
        _CurTileMid := _CurTilePos
      else
        _CurTileLeft := _CurTilePos;
      if _CurTilePos > TileScrollBar.Max then _CurTilePos := TileScrollBar.Max;
      if (_CurTilePos <= TileScrollBar.Position) or (_CurTilePos >= TileScrollBar.Position + 5) then
        TileScrollBar.Position := _CurTilePos;
      DrawTileSelector();
    end
  end
  else if (_EditingMode = OBJEDITINGMODE) and (_MouseDown = True) then
  begin
    if (_ObjType.ObjType = STAIRTYPE) and (_ObjType.ObjIndex > -1) then
    begin

      if ROMData.CurrentBlock.VerticalScroll = false then
      begin
        TempX := (X div 2) and $F8;
        TempY := (Y div 2) and $F0;
      end
      else
      begin
        TempX := (X div 2) and $F8;
        TempY := (Y div 2) and $F0;
      end;

      if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
      Draw := False;
      if ROMData.CurrentBlock.Stairs[_ObjType.ObjIndex].X <> TempX then
      begin
        ROMData.CurrentBlock.Stairs[_ObjType.ObjIndex].X := TempX;

        Draw := True;
      end;

      if ROMData.CurrentBlock.Stairs[_ObjType.ObjIndex].Y <> TempY then
      begin
        ROMData.CurrentBlock.Stairs[_ObjType.ObjIndex].Y := TempY;

        Draw := True;
      end;

      if Draw = true then DrawLevelData();
    end
    else if (_ObjType.ObjType = DOORTYPE) and (_ObjType.ObjIndex > -1) then
    begin

      TempY := (Y div 2) and $F0;

      if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;

      Draw := False;

      if _ObjType.ObjIndex = 0 then
      begin
        if ROMData.CurrentBlock.Doors.Y1 <> TempY then
        begin
          ROMData.CurrentBlock.Doors.Y1 := TempY;
          Draw := True;
        end;
      end
      else if _ObjType.ObjIndex = 1 then
      begin
        if ROMData.CurrentBlock.Doors.Y2 <> TempY then
        begin
          ROMData.CurrentBlock.Doors.Y2 := TempY;
          Draw := True;
        end;
      end;

      if Draw = true then DrawLevelData();

    end
    else if (_ObjType.ObjType = ENTRANCETYPE) then
    begin

      TempX := (X div 2) and $F0;
      TempY := (Y div 2) and $F0;

      if (X >= imgLevel.Width) or (Y >= imgLevel.Height) then exit;
      Draw := False;
      if ROMData.CurrentBlock.Entrance.X <> TempX then
      begin
        ROMData.CurrentBlock.Entrance.X := TempX;

        Draw := True;
      end;

      if ROMData.CurrentBlock.Entrance.Y <> TempY then
      begin
        ROMData.CurrentBlock.Entrance.Y := TempY;
        Draw := True;
      end;

      if Draw = true then DrawLevelData();

    end;
  end;

end;

procedure TfrmSireMain.mnuExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmSireMain.actBlockPropertiesExecute(Sender: TObject);
var
  BlockProp : TfrmBlockProperties;
begin
  BlockProp := TfrmBlockProperties.Create(self);
  try
    BlockProp.ShowModal;
    if BlockProp.ModalResult = mrOk then
    begin
      ROMData.RefreshOnScreenTiles(TileScrollbar.Position,True);
      DrawLevelData();
      DrawTileSelector();
    end;
  finally
    FreeAndNil(BlockProp);
  end;
end;

procedure TfrmSireMain.actCloseROMExecute(Sender: TObject);
begin
  CloseROM(False);
end;

procedure TfrmSireMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  if EditorConfig.Changed = True then
    EditorConfig.Save;

  FreeAndNil(EditorConfig);

  if Assigned(ROMData) = True then
  begin
    if ROMData.Changed = True then
    begin
      if MessageDlg(ROMCHANGESSAVE,mtConfirmation,[mbYes, mbNo],0) = mrYes then
        ROMData.Save;
    end;
    if (_EditingMode = OBJEDITINGMODE) and (Assigned(ObjProp)) then
    begin
      _ObjType.ObjIndex := -1;
      _ObjType.ObjType := NONETYPE;
      FreeAndNil(ObjProp);
    end;
    FreeAndNil(ROMData);
  end;
end;

procedure TfrmSireMain.actPreferencesExecute(Sender: TObject);
var
  Pref : TfrmPreferences;
begin
  Pref := TfrmPreferences.Create(self);
  try
    if Pref.ShowModal = mrOK then
    begin
      EditorConfig.Save;
      SetEmuMenuText();
      SetIPSEnabled();
      SetIconTransparency();

      if assigned(ROMData) then
      begin
        ROMData.LoadPaletteFile(EditorConfig.FullPaletteName);
        ROMData.RefreshOnScreenTiles(TileScrollbar.Position,False);
        DrawLevelData();
        DrawTileSelector();
      end;

    end;
  finally
    FreeAndNil(Pref);
  end;

end;

procedure TfrmSireMain.ExecuteEmulator();
begin
  if Assigned(ROMData) = False then
  begin
    messagebox(handle,PChar(LOADROMFIRST),PChar(Application.Title),0);
    exit;
  end;

  if (FileExists(EditorConfig.EmulatorPath) = false) or (EditorConfig.EmulatorPath = '') then
  begin
    messagebox(handle,PChar(NOEMUSETUP),PChar(Application.Title),0);
    exit;
  end;
  if EditorConfig.EmulatorDisplaySaveWarning = true then
  begin
    if MessageDlg(PChar(SAVEWARNINGPROMPT + CRLF + CRLF + DISABLESAVEPROMPT),mtWarning,[mbYes, mbNo],0) = mrNo then
      exit;
  end;

  ROMData.Save;
  if EditorConfig.EmulatorFileSettings = 0 then
    ShellExecute(Handle,'open',PChar(EditorConfig.EmulatorPath),PChar(' ' + ROMData.Filename),'',SW_SHOW)
  else if EditorConfig.EmulatorFileSettings = 1 then
    ShellExecute(Handle,'open',PChar(EditorConfig.EmulatorPath),PChar(' ' + ExtractShortPathName(ROMData.Filename)),'',SW_SHOW)
  else if EditorConfig.EmulatorFileSettings = 2 then
    ShellExecute(Handle,'open',PChar(EditorConfig.EmulatorPath),PChar(' "' + ROMData.Filename + '"'),'',SW_SHOW);

end;

procedure TfrmSireMain.SetIconTransparency();
var
  i : Integer;
begin

  for i := 0 to Bitmap32List.Bitmaps.Count - 1 do
  begin
    if EditorConfig.DrawTransparentIcons = True then
      Bitmap32List.Bitmap[i].DrawMode := dmBlend
    else
      Bitmap32List.Bitmap[i].DrawMode := dmOpaque;

    Bitmap32List.Bitmap[i].MasterAlpha := EditorConfig.IconTransparency;
  end;

end;

procedure TfrmSireMain.actTextEditorExecute(Sender: TObject);
var
  TextEd : TfrmTextEditor;
begin
  TextEd := TfrmTextEditor.Create(self);
  try
    TextEd.ShowModal;
  finally
    FreeAndNil(TextEd);
  end;
end;

procedure TfrmSireMain.actLevelPropertiesExecute(Sender: TObject);
var
  LevelProp : TfrmLevelProperties;
begin
  LevelProp := TfrmLevelProperties.Create(self);
  try
    LevelProp.ShowModal;
  finally
    FreeAndNil(LevelProp);
  end;

end;

procedure TfrmSireMain.actCHRExpansionExecute(Sender: TObject);
var
  CHR : TfrmCHRExpansion;
begin
  CHR := TfrmCHRExpansion.Create(self);
  try
    CHR.ShowModal;
  finally
    FreeAndNil(CHR);
  end;

end;

procedure TfrmSireMain.actMapEditingModeExecute(Sender: TObject);
begin
  if (_EditingMode = OBJEDITINGMODE) or (_EditingMode = ENEMYEDITINGMODE) then
  begin
    ResetObjects;
    DrawLevelData;
    FreeAndNil(ObjProp);
  end;

  actMapEditingMode.Checked := True;
  actEnemyEditingMode.Checked := False;
  actObjectEditingMode.Checked := False;
  _EditingMode := MAPEDITINGMODE;
  StatusBar.Panels[0].Text := MAPEDITINGMODETEXT;
  DrawLevelData;
end;

procedure TfrmSireMain.actEnemyEditingModeExecute(Sender: TObject);
begin
  if _EditingMode = OBJEDITINGMODE then
  begin
    ResetObjects;
    DrawLevelData;
  end
  else if _EditingMode = MAPEDITINGMODE then
  begin
    ObjProp := TfrmObjProperties.Create(self);
    ObjProp.Left := Left + 540;
    ObjProp.Top := Top + 108;
  end;
  TfrmObjProperties(ObjProp).ActiveTab := 6;

  ObjProp.Show;

  actMapEditingMode.Checked := False;
  actEnemyEditingMode.Checked := True;
  actObjectEditingMode.Checked := False;
  _EditingMode := ENEMYEDITINGMODE;
  StatusBar.Panels[0].Text := ENEMYEDITINGMODETEXT;
  DrawLevelData;
end;

procedure TfrmSireMain.SetMapEditingModeOn;
begin
  actMapEditingMode.Checked := True;
  actObjectEditingMode.Checked := False;
  _EditingMode := MAPEDITINGMODE;
  StatusBar.Panels[0].Text := MAPEDITINGMODETEXT;
  ResetObjects;
  DrawLevelData;
end;

procedure TfrmSireMain.actObjectEditingModeExecute(Sender: TObject);
begin

  actMapEditingMode.Checked := False;
  actEnemyEditingMode.Checked := False;
  actObjectEditingMode.Checked := True;
  if _EditingMode = MAPEDITINGMODE then
  begin
    ObjProp := TfrmObjProperties.Create(self);
    ObjProp.Left := Left + 540;
    ObjProp.Top := Top + 108;
  end;
  ObjProp.Show;
  _EditingMode := OBJEDITINGMODE;
  StatusBar.Panels[0].Text := OBJECTEDITINGMODETEXT;
  DrawLevelData;
end;

procedure TfrmSireMain.actCopyScreenToClipboardExecute(Sender: TObject);
begin
  Clipboard.Open;
  try
    Clipboard.Assign(imgLevel.Bitmap);
  finally
    ClipBoard.Close;
  end;
end;

procedure TfrmSireMain.actDamageExecute(Sender: TObject);
var
  Damage : TfrmDamage;
begin
  Damage := TfrmDamage.Create(self);
  try
    Damage.ShowModal;
  finally
    FreeAndNil(Damage);
  end;
end;

procedure TfrmSireMain.mnuLaunchAssociatedEmulatorClick(Sender: TObject);
begin
  ExecuteEmulator();
end;

procedure TfrmSireMain.actDebugExecute(Sender: TObject);
begin
  ROMData.DebugMode := not(ROMData.DebugMode);

  actDebug.Checked := ROMData.DebugMode;
end;

procedure TfrmSireMain.actSaveROMExecute(Sender: TObject);
begin
  ROMData.Save;
  messagebox(Handle,PChar(CHANGESSAVED),PChar(APPLICATIONTITLE),0+MB_ICONINFORMATION);
//  messagedlg(CHANGESSAVED, mtInformation,[mbOK],0);
end;

procedure TfrmSireMain.UpdateTitleCaption;
begin
  if Assigned(ROMData) = True then
  begin
    Caption := APPLICATIONTITLE + ' - [' + ExtractFilename(ROMData.Filename) + ']';
    if ROMData.Changed = True then Caption := Caption + ' *';
  end
  else
  begin
    Caption := APPLICATIONTITLE;
  end;

end;

procedure TfrmSireMain.CreateRecentMenu();
begin
  if EditorConfig.NumberOfRecentlyOpenedFiles = 0 then
    mnuRecent.Visible := False
  else
    mnuRecent.Visible := True;

  if EditorConfig.RecentFile[0] = '' then
    mnuRecentItem1.Visible := False
  else
    mnuRecentItem1.Visible := True;

  if EditorConfig.RecentFile[1] = '' then
    mnuRecentItem2.Visible := False
  else
    mnuRecentItem2.Visible := True;

  if EditorConfig.RecentFile[2] = '' then
    mnuRecentItem3.Visible := False
  else
    mnuRecentItem3.Visible := True;

  if EditorConfig.RecentFile[3] = '' then
    mnuRecentItem4.Visible := False
  else
    mnuRecentItem4.Visible := True;
    
  if EditorConfig.RecentFile[4] = '' then
    mnuRecentItem5.Visible := False
  else
    mnuRecentItem5.Visible := True;

//  mnuRecentItem1.Caption := '1. ' + EditorConfig.RecentFile[0];
//  mnuRecentItem2.Caption := '2. ' + EditorConfig.RecentFile[1];
//  mnuRecentItem3.Caption := '3. ' + EditorConfig.RecentFile[2];
//  mnuRecentItem4.Caption := '4. ' + EditorConfig.RecentFile[3];
//  mnuRecentItem5.Caption := '5. ' + EditorConfig.RecentFile[4];

    mnuRecentItem1.Caption := MinimizeName(EditorConfig.RecentFile[0],self.Canvas,400);
    mnuRecentItem2.Caption := MinimizeName(EditorConfig.RecentFile[1],self.Canvas,400);
    mnuRecentItem3.Caption := MinimizeName(EditorConfig.RecentFile[2],self.Canvas,400);
    mnuRecentItem4.Caption := MinimizeName(EditorConfig.RecentFile[3],self.Canvas,400);
    mnuRecentItem5.Caption := MinimizeName(EditorConfig.RecentFile[4],self.Canvas,400);

end;

function TfrmSireMain.AutoCheckROMType(pFilename : String) : String;
var
  DataFiles : TStringList;
  INI : TMemINIHexFile;
  i : Integer;
  Loc : Integer;
  Auto1,Auto2,Auto3,Auto4 : Byte;
  TempROM : TiNESImage;
begin
  result := '';
  exit;
  DataFiles := TStringList.Create;
  try
    DataFiles.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');

    for i := 0 to DataFiles.Count -1 do
    begin
      INI := TMemINIHexFile.Create(ExtractFileDir(Application.ExeName) + '\Data\' + DataFiles[i]);
      try
        Loc := INI.ReadHexValue('AutoCheck','Location');
        Auto1 := INI.ReadHexValue('AutoCheck','Auto1');
        Auto2 := INI.ReadHexValue('AutoCheck','Auto2');
        Auto3 := INI.ReadHexValue('AutoCheck','Auto3');
        Auto4 := INI.ReadHexValue('AutoCheck','Auto4');
        TempROM := TiNESImage.Create(pFilename);
        if TempROM.ROM[Loc] = Auto1 then
          if TempROM.ROM[Loc+1] = Auto2 then
            if TempROM.ROM[Loc+2] = Auto3 then
              if TempROM.ROM[Loc+3] = Auto4 then
              begin
                result := DataFiles[i];
                break;
              end;
      finally
        FreeAndNil(TempROM);
        FreeAndNil(INI);
      end;
    end;
  finally
    FreeAndNil(DataFiles);
  end;
end;

procedure TfrmSireMain.mnuRecentItem1Click(Sender: TObject);
begin
  LoadROM(EditorConfig.RecentFile[TMenuItem(sender).MenuIndex],EditorConfig.FullDataFileName,EditorConfig.AutoCheck);
end;

procedure TfrmSireMain.CloseROM(pDisableCancel : Boolean);
var
  MsgRes : Integer;
begin
  if EditorConfig.Changed = True then
    EditorConfig.Save;

  if Assigned(ROMData) = True then
  begin
    if ROMData.Changed = True then
    begin
      if pDisableCancel = True then
        MsgRes := MessageDlg(ROMCHANGESSAVE,mtConfirmation,[mbYes, mbNo],0)
      else
        MsgRes := MessageDlg(ROMCHANGESSAVE,mtConfirmation,[mbYes, mbNo,mbCancel],0);
      if MsgRes = mrYes then
        ROMData.Save;

      if MsgRes <> mrCancel then
      begin
        FreeAndNil(ROMData);
        if (_EditingMode = OBJEDITINGMODE) and (Assigned(ObjProp)) then
        begin
          _ObjType.ObjIndex := -1;
          _ObjType.ObjType := NONETYPE;
          FreeAndNil(ObjProp);
        end;
        UpdateTitleCaption;
        if pDisableCancel = True then
          SetVisibleStatus(False);
      end;
    end
    else
    begin
      FreeAndNil(ROMData);
      UpdateTitleCaption;
      if (_EditingMode = OBJEDITINGMODE) and (Assigned(ObjProp)) then
      begin
          _ObjType.ObjIndex := -1;
          _ObjType.ObjType := NONETYPE;
        FreeAndNil(ObjProp);
      end;
      if pDisableCancel = True then
        SetVisibleStatus(False);
    end;
  end;

end;

procedure TfrmSireMain.SetImageIndex();
begin
  mnuObjectEditingMode.ImageIndex := -1;
  mnuMapEditingMode.ImageIndex := -1;
end;

procedure TfrmSireMain.horzScrollBarScroll(Sender: TObject;
  ScrollCode: TScrollCode; var ScrollPos: Integer);
begin
  ROMData.BlockPosition := horzScrollBar.Position;
  DrawLevelData();
  UpdateTitleCaption;
  DisplayScreenInfo;
end;

procedure TfrmSireMain.ResetObjects;
begin
  _ObjType.ObjIndex := -1;
  _ObjType.ObjType  := 0;
  _MouseDown := False;

  if (Assigned(ObjProp)) and (_EditingMode = OBJEDITINGMODE) then
    TfrmObjProperties(ObjProp).ActiveTab := 0;
end;

procedure TfrmSireMain.actSaveAsIPSExecute(Sender: TObject);
var
  output : String;
begin
  if Assigned(ROMData) then
  begin
    if (FileExists(EditorConfig.OriginalROMFile) = true) then
    begin
      if EditorConfig.IPSOutput = '' then
        Output := ChangeFileExt(ROMData.Filename,'.ips')
      else
        Output := EditorConfig.IPSOutput;

      ROMData.Save;
      LunarIPSCreate(handle,PChar(Output),PChar(EditorConfig.OriginalROMFile),PChar(ROMData.Filename),0);
      UpdateTitleCaption;
    end;
  end;
end;

procedure TfrmSireMain.SetIPSEnabled();
begin
  if FileExists(EditorConfig.OriginalROMFile) = True then
    actSaveAsIPS.Enabled := True
  else
    actSaveAsIPS.Enabled := False;

  if Assigned(ROMData) = False then
    actSaveAsIPS.Enabled := False;
end;

procedure TfrmSireMain.mnuVisitSireHomepageClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('http://dan.panicus.org'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmSireMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  CurrentBlockVert : Boolean;
begin
  if assigned(ROMData) then
  begin
    CurrentBlockVert := ROMData.CurrentBlock.VerticalScroll;

    if Key = VK_PRIOR then
    begin
      if ssShift in Shift then
      begin
        if ROMData.Block = ROMData.CurrentLevel.Blocks.Count -1 then
          ROMData.Block := 0
        else
          ROMData.Block := ROMData.Block + 1;
      end
      else
      begin
        if ROMData.Level = ROMData.Levels.Count - 1 then
          ROMData.Level := 0
        else
          ROMData.Level := ROMData.Level + 1;
      end;
    end
    else if Key = VK_NEXT then
    begin
      if ssShift in Shift then
      begin
        if ROMData.Block = 0 then
          ROMData.Block := ROMData.CurrentLevel.Blocks.Count -1
        else
          ROMData.Block := ROMData.Block - 1;
      end
      else
      begin
        if ROMData.Level = 0 then
          ROMData.Level := ROMData.Levels.Count -1
        else
          ROMData.Level := ROMData.Level -1;
      end;
    end
    else
      exit;

    if CurrentBlockVert <> ROMData.CurrentBlock.VerticalScroll then
    begin
      if ROMData.CurrentBlock.VerticalScroll = true then
        ResizeFormForVertical()
      else
        ResizeFormForHorizontal();
    end;

    horzScrollBar.Position := 0;
    vertScrollBar.Position := 0;
    ResetObjects;
    UpdateBlock();
    DrawLevelData();
    UpdateTitleCaption;
    DisplayScreenInfo;
  end;

end;


procedure TfrmSireMain.TileScrollBarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_PRIOR) or (Key = VK_NEXT) or (Key = VK_LEFT) or (Key = VK_RIGHT)  then
    Key := 0;
end;

procedure TfrmSireMain.horzScrollBarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_PRIOR) or (Key = VK_NEXT) or (Key = VK_LEFT) or (Key = VK_RIGHT) then
    Key := 0;
end;

procedure TfrmSireMain.JvDragDropDrop(Sender: TObject; Pos: TPoint;
  Value: TStrings);
begin
  LoadROM(Value[0],EditorConfig.FullDataFileName,EditorConfig.AutoCheck);
  EditorConfig.AddRecentFile(Value[0]);
end;

procedure TfrmSireMain.actGlobalCandleDataExecute(Sender: TObject);
var
  Candle : TfrmGlobalCandleEditor;
begin
  Candle := TfrmGlobalCandleEditor.Create(self);
  try
    JvDragDrop.AcceptDrag := False;

    if Candle.ShowModal = mrOk then
    begin
      DrawLevelData;
      UpdateTitleCaption;
    end
    else
    begin
      ROMData.LoadGlobalCandleData;
    end;

    JvDragDrop.AcceptDrag := True;
  finally
    FreeAndNil(Candle);
  end;
end;

procedure TfrmSireMain.actLevelStatsExecute(Sender: TObject);
var
  LevStats : TfrmLevelStatistics;
begin
  LevStats := TfrmLevelStatistics.Create(self);
  try
    LevStats.ShowModal;
  finally
    FreeAndNil(LevStats);
  end;
end;

procedure TfrmSireMain.DisplayScreenInfo;
begin
  if Assigned(ROMData) then
  begin
    statusBar.Panels[0].Width := 120;
    statusBar.Panels[1].Width := 300;
    statusBar.Panels[2].Width := 50;
    statusBar.Panels[1].Text := ROMData.CurrentBlock.Name + ' Screen:' + IntToStr(ROMData.BlockPosition + 1);
    statusBar.Panels[2].Text := ExtractFilename(ROMData.DataFilename);
  end
  else
  begin
    statusBar.Panels[0].Width := StatusBar.Width;
    statusBar.Panels[1].Width := 0;
    statusBar.Panels[2].Width := 0;
    statusBar.Panels[0].Text := 'No ROM loaded.';
    statusBar.Panels[1].Text := '';
    statusBar.Panels[2].Text := '';
  end;
end;

procedure TfrmSireMain.actGridlinesExecute(Sender: TObject);
begin
  EditorConfig.GridlinesOn := not(EditorConfig.GridlinesOn);
  tlbEnableGridlines.Down := EditorConfig.GridlinesOn;
  mnuGridlines.Checked := EditorConfig.GridlinesOn;
  DrawLevelData;
end;

procedure TfrmSireMain.actGlobalEnemyDataExecute(Sender: TObject);
var
  GlobEnemyEd : TfrmGlobalEnemyEditor;
begin
  GlobEnemyEd := TfrmGlobalEnemyEditor.Create(self);
  try
    JvDragDrop.AcceptDrag := False;

    if GlobEnemyEd.ShowModal = mrOk then
    begin
      DrawLevelData;
      UpdateTitleCaption;
    end
    else
    begin
      ROMData.LoadGlobalEnemyData;
    end;

    JvDragDrop.AcceptDrag := True;
  finally
    FreeAndNil(GlobEnemyEd);
  end;
end;

procedure TfrmSireMain.FormShow(Sender: TObject);
begin
  ResizeFormForHorizontal;
end;

procedure TfrmSireMain.DisableImages;
begin
  mnuGridlines.ImageIndex := -1;
end;

procedure TfrmSireMain.LoadEmulatorIcon;
var
  Icon : TIcon;
  Buffer: array[0..2048] of char;
  IconHandle: HIcon;
  IconIndex : word;
begin
  if FileExists(EditorConfig.EmulatorPath) = True then
  begin

    //get the associated icon for this file
    StrCopy(@Buffer, pchar(EditorConfig.EmulatorPath));
    IconIndex := 0;
    IconHandle := ExtractAssociatedIcon(HInstance, Buffer, IconIndex);

    begin

      //now that we have an icon, add it to the image list.
      Icon := TIcon.Create;
      try
        Icon.Handle := IconHandle;
        mnuLaunchAssociatedEmulator.ImageIndex := ImageList.AddIcon(Icon);
      finally
        FreeAndNil(Icon);
      end;

    end;
  end
  else
  begin
    // Insert the number of the default NES emulator icon here.
    mnuLaunchAssociatedEmulator.ImageIndex := 7;
  end;

end;

procedure TfrmSireMain.mnuViewStairsClick(Sender: TObject);
begin
  DrawLevelData;
end;

procedure TfrmSireMain.actEnemyDataInspectorExecute(Sender: TObject);
var
  EnemyData : TfrmEnemyDataInspector;
begin
  EnemyData := TfrmEnemyDataInspector.Create(self);
  try
    EnemyData.ShowModal;
  finally
    FreeAndNil(EnemyData);
  end;
end;

procedure TfrmSireMain.actPresetObjExecute(Sender: TObject);
var
  PresetObj : TfrmPresetObj;
begin
  PresetObj := TfrmPresetObj.Create(self);
  try
    PresetObj.ShowModal;
  finally
    FreeAndNil(PresetObj);
  end;
end;

procedure TfrmSireMain.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  Resize := False;
end;

end.
