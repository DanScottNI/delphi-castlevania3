unit cROMData;

interface

uses Sysutils, Gr32,classes, cEnemy, cLevelObj,dialogs,
  cMisc, iNESImage,gr32_image,ImgList, MemINIHexFile,ByteList,
  cSpecObj, cGraphics, cLevel, forms, OffsetList, uConsts, contnrs;

 type

//  TROMTypes = (NotAjDCV3,CV3,AjD);

  TInterLeaveType = (None,InterLeave4,Interleave8);

  { This is the class that is used by all parts of my program. }
  TROMData = class
  private
    _DataFilename : String;
    _PatternTableStart : Integer;
    _DefaultBGPattern1 : Byte;
    _DefaultBGPattern4 : Byte;
    _Palette : Array [0..10,0..3] of Byte;
    _PrayingIntroPalette : Array [0..7,0..3] of Byte;
    _PatternTable : Array [0.. 4095] of Byte;
    _Level : Integer;
    _Blocks : Integer;
    _BlocksPosition : Integer;
//    _ScreenData : Array [0 .. 7, 0..7] of Byte;
    _DrawBlock : Array [0..255] of Boolean;
    _NumGlobalCandle, _NumGlobalEnemy : Integer;
    _Tiles : TBitmap32;
    _DataFileProblems : Boolean;
    function LoadDataFile(pFilename : String) : Boolean;
    procedure SetLevel(pLevel : Integer);
    function GetLevel(): Integer;
    procedure DrawLevelTile(pTileNumber: Byte);
    procedure LoadPatternTable();
    procedure DumpPatternTable(pFilename: String);
    function GetBlock: Integer;
    procedure SetBlock(const Value: Integer);
    function GetBlockPosition: Integer;
    procedure SetBlockPosition(const Value: Integer);
    function GetNumberOfPatternBars: Integer;
    function GetFilename: String;
    function GetDebugStatus: Boolean;
    procedure SetDebugStatus(const Value: Boolean);
    function GetPal(index1, index2: Integer): Byte;
    procedure SetPal(index1, index2: Integer; const Value: Byte);
    function GetPrayPal(index1, index2: Integer): Byte;
    procedure SetPrayPal(index1, index2: Integer; const Value: Byte);
    function GetChanged : Boolean;
    procedure SetChanged(pBool : Boolean);
    procedure LoadRoomTiles;
    procedure SetRoomData(pX,pY : Integer;pTile : Byte);
    function GetRoomData(pX,pY : Integer): Byte;
    procedure LoadColonSeparatedFile(pStringList : TStringList;pFilename : String;pIncludeIndex : Boolean);
    function GetSpecialObjectUnderMouse(pX, pY: Integer): Integer;
    function GetDoorUnderMouse(pX,pY: Integer): Integer;
    function GetEntranceUnderMouse(pX,pY : integer) : Integer;
    function GetVerticalEnemyUnderMouse(pX, pY: Integer): Integer;
    function GetStairUnderMouse(pX, pY: Integer): Integer;
    procedure LoadEntranceData;
    procedure SaveEntranceData;
    procedure LoadSpecialObjectsData;
    procedure SaveSpecialObjectsData;
    procedure LoadDoorsData;
    procedure SaveDoorsData;
    procedure LoadStairsData;
    procedure SaveStairsData;
    procedure LoadEnemyData;
    procedure SaveEnemyData;
  public
    // An object that references the currently selected level
    CurrentLevel : TLevel;
    // An object that references the currently selected block
    CurrentBlock : TLevelBlock;
    { The objectlist that contains all the levels loaded from
      the datafile. }
    Levels : TLevelList;
    // An object that deals with the damage settings of the game
    Damage : TDamage;
    Properties : T1BytePropertyList;
    // A list that contains all the data for the enemies in the game.
    GlobalEnemies : TGlobalEnemyList;
    // A list that contains all the data for the candles in the game.
    GlobalCandles : TGlobalCandleList;
    { Used to store the items names that are loaded
      from candleitem.dat }
    GlobalCandleItems : TStringList;
    { Used to store the enemy names that are loaded
      from enemy.dat }
    GlobalEnemyNames : TStringList;
    // Cog preset values
    CogPresets : TObjectList;
    // the class's constructor
    constructor Create(pROMFileName,pDataFileName : string); overload;
    // the class's destructor
    destructor Destroy;override;
    //functions
    // Determines what type of object there is under a given mouse
    // co-ordinates.
    function DetectObjUnderMouse(pX,pY : Integer) : TObjDetect;
    // Draws a tile-selector
    function DrawTileSelector(pIndex: Integer;pBitmap: TBitmap32): Boolean;
    // Edits the TSA of a given block.
    function EditTSA(pBlock, pTileIndex1, pTileIndex2: Integer;
      pNewTile: Byte): Integer;
    // Exports a 8x8 graphic for the tile editor from the pattern table.
    function Export8x8Pat(pID: Integer): T8x8Graphic;
    // Increments the block's colour attributes for a specific quadrant.
    function IncrementBlockAttributes(pBlock, pTileIndex1,
      pTileIndex2: Integer): Integer;
    // Determines whether the ROM is a genuine Castlevania 3 ROM.
    function IsCV3ROM : Boolean;
    // Returns the TColor32 value of an element of the NES palette.
    function ReturnNESPal(pElement: Integer): TColor32;
    function GetEnemyCandleUnderMouse(pX,pY : Integer;pMode : Byte;pID : Integer;pIndex : Integer) : Integer;
    function PointerToOffset(pOffset : Integer; pBank: Integer = $0; pMemAddress : Integer = $8000): Integer;
    // Procedures
    procedure ChangeDoorDirection();
    procedure DrawCurrentScreen(pBitmap: TBitmap32; pImageList : TBitmap32List;
      pBitSettings : Byte;pCurrentObj : Integer;pObjType : Byte);
    procedure DrawEnemyData(pBitmap : TBitmap32;pMode : Byte;pID : Byte;pIndex : Byte);
    procedure DrawPatternBar(pBitmap : TBitmap32;pIndex : Integer; pInterLeaveType : TInterLeaveType;pPal : Integer);
    procedure DrawPatternTable(pBitmap: TBitmap32; pPal: Integer);
    procedure ExpandCHR(pNumberOfCHR : Integer);
    procedure GenerateBlockListing(pStringList : TStringList);
    // Imports an 8x8 graphic from the tile editor into the pattern table.
    procedure Import8x8Pat(pID: Integer; p8x8: T8x8Graphic);
    procedure IncrementStairDirection(pStairID: Integer);
    procedure LoadCharacterPalette();
    procedure LoadCurrentPalette();
    Procedure LoadDefaultPalette();
    procedure LoadGlobalCandleData;
    procedure LoadGlobalEnemyData;
    procedure LoadPaletteFile(pFilename : String);
    procedure LoadPrayingIntroPalette();
    procedure RefreshOnScreenTiles(pTileSelectorValue: Byte;pReloadPatternTable : Boolean);
    procedure Save;
    procedure SaveCurrentPalette();
    procedure SaveCharacterPalette();
    procedure SaveGlobalCandleData;
    procedure SaveGlobalEnemyData;
    procedure SavePatternTable();
    procedure SavePrayingIntroPalette();
    procedure EditEnemyData(pX,pY : Integer;pMode : Byte;pID : Integer;pIndex : Integer);
    property Level : Integer read GetLevel write SetLevel;
    property Block : Integer read GetBlock write SetBlock;
    property BlockPosition : Integer read GetBlockPosition write SetBlockPosition;
    property NumberOfPatternBars : Integer read GetNumberOfPatternBars;
    // Sets a part of the palette array.
    property Palette[index1 : Integer; index2 : Integer] : Byte read GetPal write SetPal;
    // Sets a part of the palette array.
    property PrayingPalette[index1 : Integer; index2 : Integer] : Byte read GetPrayPal write SetPrayPal;
    property Filename : String read GetFilename;
    property DebugMode : Boolean read GetDebugStatus write SetDebugStatus;
    property Changed : Boolean read GetChanged write SetChanged;
    property DataFilename : String read _DataFilename write _DataFilename;
    property RoomData [index1,index2 : Integer] : Byte read GetRoomData write SetRoomData;
    property DataFileProblems : Boolean read _DataFileProblems write _DataFileProblems;
    function GetGlobalDataAmount(pType,pID : Byte) : Integer;

  end;

implementation

{ TROMData }

uses uGlobal,uROM, uResourcestrings;

procedure TROMData.ChangeDoorDirection();
begin

  if CurrentLevel.Blocks[self._Blocks].Doors.Direction = 0 then
    CurrentLevel.Blocks[self._Blocks].Doors.Direction := 1
  else if CurrentLevel.Blocks[self._Blocks].Doors.Direction = 1 then
    CurrentLevel.Blocks[self._Blocks].Doors.Direction := 0;

end;

constructor TROMData.Create(pROMFileName, pDataFileName: string);
begin
  if assigned(ROM) = false then
  begin
    ROM := TiNESImage.Create(pROMFilename);
  end
  else
  begin
    FreeAndNil(ROM);
    ROM := TiNESImage.Create(pROMFilename);
  end;



  _DataFilename := pDataFilename;
  _DataFileProblems := LoadDataFile(_DataFilename);
  if _DataFileProblems = true then
    exit;

  // Load in the candle item dropped data.
  GlobalCandleItems := TStringList.Create;
  LoadColonSeparatedFile(GlobalCandleItems,ExtractFileDir(Application.ExeName) + '\Data\candleitem.dat',false);

  // Load in the enemy names
  GlobalEnemyNames := TStringList.Create;
  LoadColonSeparatedFile(GlobalEnemyNames,ExtractFileDir(Application.ExeName) + '\Data\enemy.dat',false);

  self._Level := 0;
  self.CurrentLevel := self.Levels[self._level];
  self._Blocks  := -1;
  self._BlocksPosition := 0;

  _tiles := TBitmap32.Create;
  try
    _tiles.width := 8192;
    _tiles.Height := 32;
  except
    freeandNil(_Tiles);
  end;
  LoadCharacterPalette();
  LoadGlobalEnemyData;
  LoadGlobalCandleData;

  LoadStairsData;
  LoadEntranceData;
  LoadSpecialObjectsData;
  LoadDoorsData;
  LoadEnemyData;
  
end;

destructor TROMData.Destroy;
begin
  FreeAndNil(Damage);
  FreeAndNil(_Tiles);
  FreeAndNil(Levels);
  FreeAndNil(ROM);
  FreeAndNil(Properties);
  FreeAndNil(GlobalEnemies);
  FreeAndNil(GlobalCandles);
  FreeAndNil(GlobalEnemyNames);
  FreeAndNil(GlobalCandleItems);
  FreeAndNil(CogPresets);
end;

procedure TROMData.DrawCurrentScreen(pBitmap: TBitmap32; pImageList : TBitmap32List;pBitSettings : Byte;pCurrentObj : Integer;pObjType : Byte);
var
  i, x,DoorX : Integer;
  NumbersBMP : TBitmap32;
  BlankBMP : TBitmap32;
begin

  if CurrentBlock.Verticalscroll = true then
  begin

    for i := 0 to 7 do
      for x := 0 to 7 do
//        pBitmap.Draw( bounds(x*32,i * 32,32,32),bounds(_ScreenData[i,x] * 32,0,32,32),_tiles);
        pBitmap.Draw( bounds(x*32,i * 32,32,32),bounds(ROM[CurrentBlock.BlockOffset + (self._BlocksPosition * 64) + 1 + (i * 8) + x] * 32,0,32,32),_tiles);

    if (pBitSettings and DRAWSTAIRS)= DRAWSTAIRS then
    begin
      // Now draw the stairs on screen.
      if assigned(CurrentBlock.Stairs) = true then
        for i := 0 to CurrentBlock.Stairs.Count - 1 do
          if CurrentBlock.Stairs[i].ScreenNumber = self._BlocksPosition then
            pBitmap.Draw(CurrentBlock.Stairs[i].X ,(CurrentBlock.Stairs[i].Y), pImageList.Bitmaps[CurrentBlock.Stairs[i].Direction].Bitmap);

      if (pObjType = uConsts.STAIRTYPE) and (pCurrentObj > -1) then
      begin
        if CurrentBlock.Stairs[pCurrentObj].ScreenNumber = self._BlocksPosition then
          pBitmap.FrameRectS(CurrentBlock.Stairs[pCurrentObj].X,CurrentBlock.Stairs[pCurrentObj].Y,CurrentBlock.Stairs[pCurrentObj].X + 8,CurrentBlock.Stairs[pCurrentObj].Y+8,clRed32);
      end;
    end;
    if (pBitSettings and DRAWENTRANCES)= DRAWENTRANCES then
      if assigned(CurrentBlock.Entrance) = True then
      begin
        if CurrentBlock.Entrance.ScreenNumber = self._BlocksPosition then
          pBitmap.Draw(CurrentBlock.Entrance.X, CurrentBlock.Entrance.Y,pImageList.Bitmaps[4].Bitmap);
        if (pObjType = uConsts.ENTRANCETYPE) and (pCurrentObj > -1) then
        begin
          if CurrentBlock.Entrance.ScreenNumber = self._BlocksPosition then
            pBitmap.FrameRectS(CurrentBlock.Entrance.X,CurrentBlock.Entrance.Y, CurrentBlock.Entrance.X+ 16,CurrentBlock.Entrance.Y + 16,clRed32);
        end;
      end;

    // Draw the vertical enemies.
    if (pBitSettings and DRAWVERTICALENEMIES)= DRAWVERTICALENEMIES then
      if Assigned(CurrentBlock.VerticalEnemies) = True then
      begin

        NumbersBMP := TBitmap32.Create;
        BlankBMP := TBitmap32.Create;
        try
          NumbersBMP.Width := 128;
          NumbersBMP.Height := 8;
          NumbersBMP.LoadFromFile(ExtractFileDir(Application.EXEName) + '\Data\numbers.bmp');
          BlankBMP.Width := 16;
          BlankBMP.Height := 16;
          BlankBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\blank.bmp');
          for i := 0 to CurrentBlock.VerticalEnemies.Count - 1 do
            if CurrentBlock.VerticalEnemies[i].ScreenNumber = self._BlocksPosition then
            begin
              pBitmap.Draw(CurrentBlock.VerticalEnemies[i].X,CurrentBlock.VerticalEnemies[i].Y,BlankBMP);
              pBitmap.Draw(bounds(CurrentBlock.VerticalEnemies[i].X,CurrentBlock.VerticalEnemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(CurrentBlock.VerticalEnemies[i].EnType,2)[1]) * 8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds(CurrentBlock.VerticalEnemies[i].X+8,CurrentBlock.VerticalEnemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(CurrentBlock.VerticalEnemies[i].EnType,2)[2]) * 8,0,8,8),NumbersBMP);
  //            pBitmap.Draw(CurrentBlock.VerticalEnemies[i].X, CurrentBlock.VerticalEnemies[i].Y,pImageList.Bitmaps[7].Bitmap);
              if (pObjType = uConsts.VERTICALENEMYTYPE) and (pCurrentObj > -1) then
              begin
                if CurrentBlock.VerticalEnemies[pCurrentObj].ScreenNumber = self._BlocksPosition then
                  pBitmap.FrameRectS(CurrentBlock.VerticalEnemies[pCurrentObj].X,CurrentBlock.VerticalEnemies[pCurrentObj].Y,CurrentBlock.VerticalEnemies[pCurrentObj].X + 16,CurrentBlock.VerticalEnemies[pCurrentObj].Y + 16,clRed32);
              end;
            end;
        finally
          FreeAndNil(NumbersBMP);
          FreeAndNil(BlankBMP);
        end;
      end;
    if (pBitSettings and DRAWSPECIALOBJECTS)= DRAWSPECIALOBJECTS then
      if Assigned(CurrentBlock.SpecialObjects) = True then
      begin
        NumbersBMP := TBitmap32.Create;
        BlankBMP := TBitmap32.Create;
        try
          NumbersBMP.Width := 128;
          NumbersBMP.Height := 8;
          NumbersBMP.LoadFromFile(ExtractFileDir(Application.EXEName) + '\Data\numbers.bmp');
          BlankBMP.Width := 16;
          BlankBMP.Height := 16;
          BlankBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\specialobjblank.bmp');
          for i := 0 to CurrentBlock.SpecialObjects.Count - 1 do
            if CurrentBlock.SpecialObjects[i].ScreenNumber = self._BlocksPosition then
            begin
              pBitmap.Draw(CurrentBlock.SpecialObjects[i].XMinVTile,CurrentBlock.SpecialObjects[i].YMinVTile,BlankBMP);
              pBitmap.Draw(bounds(CurrentBlock.SpecialObjects[i].XMinVTile,CurrentBlock.SpecialObjects[i].YMinVTile,8,8),bounds(StrToInt('$' + IntToHex(CurrentBlock.SpecialObjects[i].ID,2)[1]) * 8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds(CurrentBlock.SpecialObjects[i].XMinVTile+8,CurrentBlock.SpecialObjects[i].YMinVTile,8,8),bounds(StrToInt('$' + IntToHex(CurrentBlock.SpecialObjects[i].ID,2)[2]) * 8,0,8,8),NumbersBMP);
//              pBitmap.Draw(CurrentBlock.SpecialObjects[i].XMinVTile, CurrentBlock.SpecialObjects[i].YMinVTile,
//                pSpecialObjectList.Bitmaps[CurrentBlock.SpecialObjects[i].ID].Bitmap);
            end;

          if (pObjType = 4) and (pCurrentObj >-1) then
            if CurrentBlock.SpecialObjects[pCurrentObj].ScreenNumber = self._BlocksPosition then
              pBitmap.FrameRectS(CurrentBlock.SpecialObjects[pCurrentObj].XMinVTile,CurrentBlock.SpecialObjects[pCurrentObj].YMinVTile,CurrentBlock.SpecialObjects[pCurrentObj].XMinVTile + 16,CurrentBlock.SpecialObjects[pCurrentObj].YMinVTile + 16,clRed32);
        finally
          FreeAndNil(NumbersBMP);
          FreeAndNil(BlankBMP);
        end;
      end;
    // Vertically scrolling levels, don't have doors. I think.

  end
  else
  begin

    for i := 0 to 5 do
      for x := 0 to 7 do
//        pBitmap.Draw( bounds(x*32,i * 32,32,32),bounds(_ScreenData[i,x] * 32,0,32,32),_tiles);
        pBitmap.Draw( bounds(x*32,i * 32,32,32),bounds(ROM[CurrentBlock.BlockOffset + (self._BlocksPosition * 48) + 1 + (i * 8) + x] * 32,0,32,32),_tiles);

    if (pBitSettings and DRAWSTAIRS)= DRAWSTAIRS then
    begin
      // Now draw the stairs on screen.
      if Assigned(CurrentBlock.Stairs) = True then
      begin
        for i := 0 to CurrentBlock.Stairs.Count - 1 do
          if CurrentBlock.Stairs[i].ScreenNumber = self._BlocksPosition then
            pBitmap.Draw(CurrentBlock.Stairs[i].X,CurrentBlock.Stairs[i].Y, pImageList.Bitmaps[CurrentBlock.Stairs[i].Direction].Bitmap);

        if (pObjType = uConsts.STAIRTYPE) and (pCurrentObj > -1) then
        begin
          if CurrentBlock.Stairs[pCurrentObj].ScreenNumber = self._BlocksPosition then
            pBitmap.FrameRectS(CurrentBlock.Stairs[pCurrentObj].X,CurrentBlock.Stairs[pCurrentObj].Y,CurrentBlock.Stairs[pCurrentObj].X + 8,CurrentBlock.Stairs[pCurrentObj].Y + 8,clRed32);
        end;

      end;
    end;
    if (pBitSettings and DRAWDOORS)= DRAWDOORS then
    begin
      // Now draw the doors on-screen.
      if Assigned(CurrentBlock.Doors) = True then
      begin
        if CurrentBlock.Doors.ScreenNumber = self._BlocksPosition then
        begin
          if CurrentBlock.Doors.Direction = 0 then
            DoorX := 0
          else
            DoorX := 240;

          pBitmap.Draw(Doorx,CurrentBlock.Doors.Y2, pImageList.Bitmaps[6].Bitmap);
          pBitmap.Draw(Doorx,CurrentBlock.Doors.Y1, pImageList.Bitmaps[5].Bitmap);

          if (pObjType = uConsts.DOORTYPE) and (pCurrentObj > -1) then
          begin
            if CurrentBlock.Doors.ScreenNumber = self._BlocksPosition then
            begin
              if pCurrentObj = 0 then
                pBitmap.FrameRectS(Doorx,CurrentBlock.Doors.Y1,Doorx + 16,CurrentBlock.Doors.Y1 + 16,clRed32)
              else
                pBitmap.FrameRectS(Doorx,CurrentBlock.Doors.Y2,Doorx + 16,CurrentBlock.Doors.Y2 + 16,clRed32)
            end;
          end;

        end;
      end;
    end;

    if (pBitSettings and DRAWENTRANCES)= DRAWENTRANCES then
    begin
      if Assigned(CurrentBlock.Entrance) = True then
      begin
        if CurrentBlock.Entrance.ScreenNumber = _BlocksPosition then
          pBitmap.Draw(CurrentBlock.Entrance.X, CurrentBlock.Entrance.Y,pImageList.Bitmaps[4].Bitmap);

        if (pObjType = uConsts.ENTRANCETYPE) and (pCurrentObj > -1) then
          if CurrentBlock.Entrance.ScreenNumber = _BlocksPosition then
            pBitmap.FrameRectS(CurrentBlock.Entrance.X,CurrentBlock.Entrance.Y,CurrentBlock.Entrance.X + 16,CurrentBlock.Entrance.Y + 16,clRed32)
      end;

    end;
    if (pBitSettings and DRAWSPECIALOBJECTS)= DRAWSPECIALOBJECTS then
      if Assigned(CurrentBlock.SpecialObjects) = True then
      begin
        NumbersBMP := TBitmap32.Create;
        BlankBMP := TBitmap32.Create;
        try
          NumbersBMP.Width := 128;
          NumbersBMP.Height := 8;
          NumbersBMP.LoadFromFile(ExtractFileDir(Application.EXEName) + '\Data\numbers.bmp');
          BlankBMP.Width := 16;
          BlankBMP.Height := 16;
          BlankBMP.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\specialobjblank.bmp');
          for i := 0 to CurrentBlock.SpecialObjects.Count - 1 do
            if CurrentBlock.SpecialObjects[i].ScreenNumber = self._BlocksPosition then
            begin
              pBitmap.Draw(CurrentBlock.SpecialObjects[i].XMinHTile,CurrentBlock.SpecialObjects[i].YMinHTile,BlankBMP);
              pBitmap.Draw(bounds(CurrentBlock.SpecialObjects[i].XMinHTile,CurrentBlock.SpecialObjects[i].YMinHTile,8,8),bounds(StrToInt('$' + IntToHex(CurrentBlock.SpecialObjects[i].ID,2)[1]) * 8,0,8,8),NumbersBMP);
              pBitmap.Draw(bounds(CurrentBlock.SpecialObjects[i].XMinHTile+8,CurrentBlock.SpecialObjects[i].YMinHTile,8,8),bounds(StrToInt('$' + IntToHex(CurrentBlock.SpecialObjects[i].ID,2)[2]) * 8,0,8,8),NumbersBMP);
//              pBitmap.Draw(CurrentBlock.SpecialObjects[i].XMinHTile, CurrentBlock.SpecialObjects[i].YMinHTile,pSpecialObjectList.Bitmaps[CurrentBlock.SpecialObjects[i].ID].Bitmap);
            end;

          if (pObjType = 4) and (pCurrentObj > -1) then
            if CurrentBlock.SpecialObjects[pCurrentObj].ScreenNumber = self._BlocksPosition then
              pBitmap.FrameRectS(CurrentBlock.SpecialObjects[pCurrentObj].XMinHTile,CurrentBlock.SpecialObjects[pCurrentObj].YMinHTile,CurrentBlock.SpecialObjects[pCurrentObj].XMinHTile+16,CurrentBlock.SpecialObjects[pCurrentObj].YMinHTile+16,clRed32)
        finally
          FreeAndNil(BlankBMP);
          FreeAndNil(NumbersBMP);
        end;
      end;


  end;

end;



procedure TROMData.DrawLevelTile(pTileNumber : Byte);
var
  i,x : Integer;
  TilePal : Array [0..1,0..1] Of Byte;
begin

  if Assigned(_Tiles) = false then
    exit;
  TilePal[1,1] := (ROM[CurrentLevel.AttributeOffset+ptilenumber] shr 6) and 3;
  tilepal[1,0] := (ROM[CurrentLevel.AttributeOffset+ptilenumber] shr 4) and 3;
  tilepal[0,1] := (ROM[CurrentLevel.AttributeOffset+ptilenumber] shr 2) and 3;
  tilepal[0,0] := (ROM[CurrentLevel.AttributeOffset+ptilenumber]) and 3;
  for i := 0 to 3 do
    for x := 0 to 3 do
      ROM.DrawNESTile(@_PatternTable[ROM[CurrentLevel.TSAOffset+ (pTileNumber * 16) + (i *4 + x)]*16],_Tiles,(pTileNumber * 32) + x * 8,i*8,@_Palette[tilepal[i div 2,x div 2],0])

end;

procedure TROMData.DrawPatternBar(pBitmap: TBitmap32; pIndex: Integer;
  pInterLeaveType: TInterLeaveType;pPal : Integer);
var
  i,x : Integer;
begin

  if pInterLeaveType = None then
  begin
    for i := 0 to 3 do
      for x := 0 to 15 do
        ROM.DrawNESTile(@ROM.RawROM[((pIndex * $400) + self._PatternTableStart) + (i*16 + x) * 16],pBitmap,x*8,i*8,@_Palette[pPal,0]);
  end
  else if pInterLeaveType = InterLeave4 then
  begin
    for x := 0 to 1 do
      for i := 0 to 31 do
        ROM.DrawNESTile(@ROM.RawROM[((pIndex * $400) + self._PatternTableStart) + (x*32 + i) * 16],pBitmap,(i div 2) *8,(x*16)+(i mod 2) *8,@_Palette[pPal,0]);
  end
  else if pInterLeaveType = InterLeave8 then
  begin
    for x := 0 to 15 do
      for i := 0 to 3 do
        ROM.DrawNESTile(@ROM.RawROM[((pIndex * $400) + self._PatternTableStart) + (x * 4 + i) * 16],pBitmap,(x div 2 * 16) + (i div 2) *8,(x mod 2 * 16) + (i mod 2) *8,@_Palette[pPal,0]);
  end;

end;

procedure TROMData.DrawPatternTable(pBitmap : TBitmap32; pPal : Integer);
var
  i,x : Integer;
begin
  for i := 0 to 15 do
    for x := 0 to 15 do
      ROM.DrawNESTile(@_PatternTable[(i*16 + x) * 16],pBitmap,x*8,i*8,@_Palette[pPal,0])
end;

function TROMData.DrawTileSelector(pIndex : Integer;pBitmap : TBitmap32): Boolean;
var
  i : Integer;
begin
  if Assigned(_Tiles) = False then
  begin
    result := false;

  end
  else
  begin
    for i := 0 to 5 do
    begin
      if _DrawBlock[pindex + i] = False then
      begin
        if Assigned(_tiles) = True then DrawLevelTile(pindex + i);
        _DrawBlock[pindex + i] := True;
      end;
      pBitmap.Draw(bounds(0,i * 32,32,32),bounds((pindex+i) * 32,0,32,32),_tiles);
    end;
    result := true;
  end;

//  _Tiles.SaveToFile('C:\test.bmp');  
end;

procedure TROMData.DumpPatternTable(pFilename : String);
var
  Mem : TMemoryStream;
  i : Integer;
begin

  Mem := TMemoryStream.Create;
  try
    Mem.SetSize(high(self._PatternTable));

    Mem.Position :=0;

    for i := 0 to mem.Size do
      Mem.Write(self._PatternTable[i],1);

    Mem.SaveToFile(pFilename);
  finally
    FreeAndNil(Mem);
  end;

end;

function TROMData.EditTSA(pBlock,pTileIndex1,pTileIndex2 : Integer; pNewTile : Byte): Integer;
begin
  ROM[CurrentLevel.TSAOffset+ (pBlock * 16) + (pTileIndex1 *4 + pTileIndex2)] := pNewTile;
  DrawLevelTile(pBlock);
  result := 1;
end;

procedure TROMData.ExpandCHR(pNumberOfCHR: Integer);
begin

  if pNumberOfCHR = ROM.CHRCount then exit;

  if pNumberOfCHR < ROM.CHRCount then exit;

//  showmessage(IntToStr(ROM.ROMSize));
  ROM[5] := pNumberOfCHR;
  ROM.SetROMLength($10 + (ROM.PRGCount * $4000) + (pNumberOfCHR * $2000));
  ROM.Changed := True;
//  showmessage(IntToStr(ROM.ROMSize));
end;

function TROMData.Export8x8Pat(pID: Integer) : T8x8Graphic;
var
  x,y : Integer;
  curBit, curBit2 : Char;
  TempBin1,TempBin2, TempBin3 : String;
  Tile1 : Array [0..15] of Byte;
  p8x8 : T8x8Graphic;
begin
  For y := 0 To 15 do
    Tile1[y] := self._PatternTable[(pID * 16) +y];

  for y := 0 to 7 do
  begin
    TempBin1 := ROM.ByteToBin(Tile1[y]);
    TempBin2 := ROM.ByteToBin(Tile1[y + 8]);
    for x := 0  to 7 do
    begin
      CurBit := TempBin1[x + 1];
      CurBit2 := TempBin2[x + 1];
      TempBin3 := CurBit + CurBit2;

      if TempBin3 = '00' Then
        p8x8.Pixels[y,x] := 0
      else if TempBin3 = '10' Then
        p8x8.Pixels[y,x] := 1
      else if TempBin3 = '01' Then
        p8x8.Pixels[y,x] := 2
      else if TempBin3 = '11' Then
        p8x8.Pixels[y,x] := 3;
    end;
  end;
  result := p8x8;
end;

procedure TROMData.GenerateBlockListing(pStringList: TStringList);
var
  i : Integer;
begin

  for i:= 0 to CurrentLevel.NumberOfBlocks -1 do
    pStringList.Add(CurrentLevel.Blocks[i].Name);

end;

function TROMData.GetBlock: Integer;
begin
  result := self._Blocks;
end;

function TROMData.GetLevel: Integer;
begin
  result := self._Level;
end;

function TROMData.LoadDataFile(pFilename: String) : Boolean;
var
  ini : TMemINIHexFile;
  i,x,NumberOfLevels : Integer;
  LevelLoad :TLevel;
  BlockLoad : TLevelBlock;
begin
  result := false;

  if FileExists(pFilename) = false then result := true;

  ini := TMemINIHexFile.Create(pFilename);
  try
    self.Properties := T1BytePropertyList.Create(True);
    Properties.Capacity := 14;
    Properties.Add(T1ByteProperty.Create('BGPalStart',INI.ReadHexValue('General','BGPalStart')));
    Properties.Add(T1ByteProperty.Create('SprPalStart',INI.ReadHexValue('General','SprPalStart')));
    Properties.Add(T1ByteProperty.Create('Sprite1Pal',INI.ReadHexValue('General','Sprite1')));
    Properties.Add(T1ByteProperty.Create('Sprite3Pal',INI.ReadHexValue('General','Sprite3')));
    Properties.Add(T1ByteProperty.Create('TrevPal',INI.ReadHexValue('General','TrevPal')));

    Properties.Add(T1ByteProperty.Create('SyphaPal',INI.ReadHexValue('General','SyphaPal')));
    Properties.Add(T1ByteProperty.Create('GrantPal',INI.ReadHexValue('General','GrantPal')));
    Properties.Add(T1ByteProperty.Create('AlucPal',INI.ReadHexValue('General','AlucPal')));
    Properties.Add(T1ByteProperty.Create('PrayingIntroPal',INI.ReadHexValue('General','PrayingIntroPal')));
    Properties.Add(T1ByteProperty.Create('Debug',INI.ReadHexValue('General','DebugOffset')));

    Properties.Add(T1ByteProperty.Create('GlobalEnemyPointers',INI.ReadHexValue('GlobalData','GlobalEnemyPointers')));
    Properties.Add(T1ByteProperty.Create('GlobalCandlePointers',INI.ReadHexValue('GlobalData','GlobalCandlePointers')));
    Properties.Add(T1ByteProperty.Create('GlobalCandleDataStart',INI.ReadHexValue('GlobalData','GlobalCandleDataStart')));
    Properties.Add(T1ByteProperty.Create('GlobalEnemyDataStart',INI.ReadHexValue('GlobalData','GlobalEnemyDataStart')));

    self._NumGlobalEnemy := INI.ReadHexValue('GlobalData','GlobalEnemyAmount');
    self._NumGlobalCandle := INI.ReadHexValue('GlobalData','GlobalCandleAmount');

    self._PatternTableStart := INI.ReadHexValue('General','PatternTableStart');
    self._DefaultBGPattern1 := INI.ReadHexValue('General','DefaultBGPattern1');
    self._DefaultBGPattern4 := INI.ReadHexValue('General','DefaultBGPattern4');


    self.Damage := TDamage.Create;
    // Load in the damage settings.
    self.Damage.TrevorPointerOffset := INI.ReadHexValue('Damage','TrevorDamPoi');
    self.Damage.AlucardPointerOffset := INI.ReadHexValue('Damage','AlucardDamPoi');
    self.Damage.GrantPointerOffset := INI.ReadHexValue('Damage','GrantDamPoi');
    self.Damage.SyphaPointerOffset := INI.ReadHexValue('Damage','SyphaDamPoi');
    self.Damage.DamageScheme1Offset := INI.ReadHexValue('Damage','DamageScheme1');
    self.Damage.DamageScheme2Offset := INI.ReadHexValue('Damage','DamageScheme2');

    self.Levels := TLevelList.Create(True);
    // Now load in the number of levels to load
    NumberOfLevels := (INI.ReadInteger('General','NumberOfLevels')) - 1;
    Levels.Capacity := NumberOfLevels + 1;
    // Now loop through all the blocks
    for i := 0 to NumberOfLevels do
    begin
      self.Levels.Add(TLevel.Create);
      LevelLoad := self.levels.last;

      LevelLoad.Name := INI.ReadString('Level' + IntToStr(i),'Name');
      LevelLoad.FirstBGPalOffset := INI.ReadHexValue('Level' + IntToStr(i),'BGPalFirst');
      LevelLoad.TSAOffset := INI.ReadHexValue('Level' + IntToStr(i),'TSA');
      LevelLoad.AttributeOffset := INI.ReadHexValue('Level' + IntToStr(i),'Attribute');
      LevelLoad.NumberOfTiles := INI.ReadInteger('Level' + IntToStr(i),'Tiles');
      LevelLoad.NumberOfBlocks := INI.ReadInteger('Level' + IntToStr(i),'NumberOfBlocks');
      LevelLoad.CHRSwitchOffset := INI.ReadHexValue('Level' + IntToStr(i),'CHRSwitch');

      LevelLoad.Blocks := TBlockList.Create(True);
      LevelLoad.Blocks.Capacity := LevelLoad.NumberOfBlocks;
      for x := 0 to LevelLoad.NumberOfBlocks - 1 do
      begin
        LevelLoad.Blocks.Add(TLevelBlock.Create);
        BlockLoad := LevelLoad.Blocks.Last;
        BlockLoad.Properties := T1BytePropertyList.Create(true);
        BlockLoad.Properties.Capacity := 4;
        BlockLoad.Properties.Add(T1ByteProperty.Create('BGPatternTable',INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'BGPattern')));
        BlockLoad.Properties.Add(T1ByteProperty.Create('SprPatternTable',INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'SprPattern')));
        BlockLoad.Properties.Add(T1ByteProperty.Create('Door',INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Door')));
        BlockLoad.Properties.Add(T1ByteProperty.Create('Entrance',INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'EntranceOffset')));
        BlockLoad.Name := INI.ReadString('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Name');
        BlockLoad.BGPatternTableOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'BGPattern');
        BlockLoad.SprPatternTableOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'SprPattern');
        BlockLoad.PointerOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Pointer');

//        BlockLoad._Offset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Start');
        BlockLoad.BGPalSetupOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'BGPalRest');
        BlockLoad.SprPalSetupOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'SprPal');
        BlockLoad.BGPatternTable1 := self._DefaultBGPattern1;
        BlockLoad.BGPatternTable4 := self._DefaultBGPattern4;
        BlockLoad.Verticalscroll := INI.ReadBool('Level' + IntToStr(i),'Block' + IntToStr(x) + 'VertScroll',false);
        BlockLoad.StairPointerOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'StairPointer');
        BlockLoad.DoorOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Door');
        BlockLoad.MirrorWithBlockNo := INI.ReadInteger('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Mirror',-1);
        BlockLoad.TimeOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'Time');
        BlockLoad.SpecialObjectOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'SpecObjPointer');
        BlockLoad.EnemyOffset := INI.ReadHexValue('Level' + IntToStr(i),'Block' + IntToStr(x) + 'EnemyPointer');
        BlockLoad.CalculateOffsetFromPointer;
//        BlockLoad._PalettePointer := StrToInt('$' + INI.ReadString('Level' + IntToStr(i),'Block' + IntToStr(x) + 'PalettePointer','0'));
      end;
    end;
  finally
    FreeAndNil(INI);
  end;
end;

procedure TROMData.SetLevel(pLevel: Integer);
var
  i : Integer;
begin
  if self._Blocks > -1 then
  begin

    SaveCurrentPalette();
  end;
  for i := 0 to 255 do
    _DrawBlock[i] := False;
  self._Level := pLevel;
  self.CurrentLevel := self.Levels[self._Level];
  self._Blocks := 0;
  self.CurrentBlock := self.CurrentLevel.Blocks[self._Blocks];
  self._BlocksPosition := 0;
  CurrentLevel.LoadCHRSwitchingData;
  CurrentBlock.LoadBGPattern;
  CurrentBlock.LoadSprPattern;
  CurrentBlock.LoadBGPalSetup;
  CurrentBlock.LoadSprPalSetup;
  LoadCurrentPalette();
  LoadPatternTable();
//  DumpPatternTable('c:\test.nes');
  LoadRoomTiles;


end;

procedure TROMData.LoadPatternTable();
var
  i : Integer;
begin

  for i := 0 to 1023 do
    _PatternTable[i] := rom[((CurrentBlock.BGPatternTable1 * $400) + self._PatternTableStart)+i];

  for i := 0 to 1023 do
    _PatternTable[i + 1024] := rom[((CurrentBlock.BGPatternTable2 * $400) + self._PatternTableStart)+i];

  for i := 0 to 1023 do
    _PatternTable[i + 2048] := rom[((CurrentBlock.BGPatternTable3 * $400) + self._PatternTableStart)+i];

  for i := 0 to 1023 do
    _PatternTable[i + 3072] := rom[((CurrentBlock.BGPatternTable4 * $400) + self._PatternTableStart)+i];

end;

procedure TROMData.SavePatternTable();
var
  i : Integer;
begin

  for i := 0 to 1023 do
    rom[((CurrentBlock.BGPatternTable1 * $400) + self._PatternTableStart)+i] := _PatternTable[i];

  for i := 0 to 1023 do
    rom[((CurrentBlock.BGPatternTable2 * $400) + self._PatternTableStart)+i] := _PatternTable[i + 1024];

  for i := 0 to 1023 do
    rom[((CurrentBlock.BGPatternTable3 * $400) + self._PatternTableStart)+i] := _PatternTable[i + 2048];

  for i := 0 to 1023 do
    rom[((CurrentBlock.BGPatternTable4 * $400) + self._PatternTableStart)+i] := _PatternTable[i + 3072];


end;


procedure TROMData.LoadCurrentPalette();
var
  i,x : Integer;
begin

  for i := 1 to 3 do
    self._Palette[0,i] := ROM[CurrentLevel.FirstBGPalOffset + i];

  for i := 0 to 6 do
    self._Palette[i,0] := $0F;

  for x := 0 to 2 do
    for i := 0 to 2 do
      self._Palette[x+1,i+1] := ROM[(self.Properties['BGPalStart'].Offset + (CurrentBlock.BGPalType * 9)) + ((x * 3) + i) ];

  for i := 0 to 2 do
    self._Palette[5,i+1] := ROM[(Properties['SprPalStart'].Offset + (CurrentBlock.SprPalType * 3)) + i ];

  for i := 0 to 2 do
    self._Palette[4,i+1] := ROM[Properties['Sprite1Pal'].Offset +i];

  for i := 0 to 2 do
    self._Palette[6,i+1] := ROM[Properties['Sprite3Pal'].Offset+i];
end;

procedure TROMData.SaveCurrentPalette;
var
  i,x : Integer;
begin

  for i := 1 to 3 do
    ROM[CurrentLevel.FirstBGPalOffset + i] := self._Palette[0,i];

  for x := 0 to 2 do
    for i := 0 to 2 do
      ROM[(Properties['BGPalStart'].Offset + (CurrentBlock.BGPalType * 9)) + ((x * 3) + i) ] := self._Palette[x+1,i+1];

  for i := 0 to 2 do
    ROM[(Properties['SprPalStart'].Offset + (CurrentBlock.SprPalType * 3)) + i] := self._Palette[5,i+1];

  for i := 0 to 2 do
    ROM[Properties['Sprite1Pal'].Offset+i] := self._Palette[4,i+1];

  for i := 0 to 2 do
    ROM[Properties['Sprite3Pal'].Offset+i] := self._Palette[6,i+1];
end;


procedure TROMData.SetBlock(const Value: Integer);
var
  i : Integer;
begin
  if self._Blocks > -1 then
  begin
    SaveCurrentPalette();
  end;

  for i := 0 to 255 do
    _DrawBlock[i] := False;
  self._Blocks := Value;
  self.CurrentBlock := Self.CurrentLevel.Blocks[self._Blocks];
  self._BlocksPosition := 0;
  CurrentBlock.LoadBGPattern;
  CurrentBlock.LoadSprPattern;
  CurrentBlock.LoadBGPalSetup;
  CurrentBlock.LoadSprPalSetup;
  LoadCurrentPalette();
  LoadPatternTable();
//  DumpPatternTable('C:\test.nes');
  LoadRoomTiles;
end;


function TROMData.GetBlockPosition: Integer;
begin
  result := self._BlocksPosition;
end;

procedure TROMData.SetBlockPosition(const Value: Integer);
begin
  self._BlocksPosition := Value;
  LoadRoomTiles;
end;

function TROMData.IncrementBlockAttributes(pBlock,pTileIndex1,pTileIndex2 : Integer): Integer;
var
  TilePal : Array [0..1,0..1] Of Byte;
begin

  TilePal[1,1] := (ROM[CurrentLevel.AttributeOffset + pBlock] shr 6) and 3;
  tilepal[1,0] := (ROM[CurrentLevel.AttributeOffset + pBlock] shr 4) and 3;
  tilepal[0,1] := (ROM[CurrentLevel.AttributeOffset + pBlock] shr 2) and 3;
  tilepal[0,0] := (ROM[CurrentLevel.AttributeOffset + pBlock]) and 3;

  if tilepal[pTileIndex1,pTileIndex2] = 3 then
    tilepal[pTileIndex1,pTileIndex2] := 0
  else
    inc(tilepal[pTileIndex1,pTileIndex2]);

  ROM[CurrentLevel.AttributeOffset + pBlock] := (TilePal[1,1] shl 6) + (TilePal[1,0] shl 4) + (TilePal[0,1] shl 2) + (TilePal[0,0]);

  DrawLevelTile(pBlock);

  result := 1;

end;

procedure TROMData.RefreshOnScreenTiles(pTileSelectorValue : Byte;pReloadPatternTable : Boolean);
var
  i, x,offset : integer;
  value : Byte;
begin

  if pReloadPatternTable = true then
  begin
    self.LoadPatternTable;
  end;
  // Reset all the tiles back to the false drawing state.
  for i := 0 to 255 do
    _DrawBlock[i] := false;
  if CurrentBlock.Verticalscroll = true then
  begin
    for i := 0 to 7 do
      for x := 0 to 7 do
      begin
        offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 64) +1;
        value := ROM[offset  + (i * 8) + x];
        if _DrawBlock[value] = false then
        begin
          DrawLevelTile(value);
          _DrawBlock[value] := True;
        end;
      end;
  end
  else if CurrentBlock.Verticalscroll = false then
  begin
    for i := 0 to 5 do
      for x := 0 to 7 do
      begin
        offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 48) +1;
        value := ROM[offset  + (i * 8) + x];
        if _DrawBlock[value] = false then
        begin
          DrawLevelTile(value);
          _DrawBlock[value] := True;
        end;
      end;
  end;

  // Now scroll through the blocks displayed in the tile selector
  for i := pTileSelectorValue to pTileSelectorValue + 5 do
    if _DrawBlock[i] = false then
    begin
      DrawLevelTile(i);
      _DrawBlock[i] := True;
    end;


end;


function TROMData.GetStairUnderMouse(pX,pY : Integer): Integer;
var
  i : Integer;
  Stair : TStair;
begin

  result := -1;
  
  if Assigned(CurrentBlock.Stairs) = False then exit;
  if CurrentBlock.Stairs.Count = 0 then
    exit;
  if CurrentBlock.VerticalScroll = False then
  begin
    for i := CurrentBlock.Stairs.Count - 1 downto 0 do
    begin
      Stair := CurrentBlock.Stairs.Items[i];

      if Stair.ScreenNumber = self._BlocksPosition then
      begin
        if ((pX >= Stair.X) and (pX <= Stair.X + 8)) and ((pY >= (Stair.Y)) and (pY <= (Stair.Y) + 8)) then
        begin
          result := i;
//        showmessage(IntToStr(stair._Direction));
          break;
        end;
      end;
    end;
  end
  else
  begin
    for i := CurrentBlock.Stairs.Count - 1 downto 0 do
    begin
      Stair := CurrentBlock.Stairs.Items[i];

      if Stair.ScreenNumber = self._BlocksPosition then
      begin
        if ((pX >= Stair.X) and (pX <= Stair.X + 8)) and ((pY >= (Stair.Y)) and (pY <= (Stair.Y) + 8)) then
        begin
          result := i;
//        showmessage(IntToStr(stair._Direction));
          break;
        end;
      end;
    end;
  end;


end;

procedure TROMData.IncrementStairDirection(pStairID : Integer);
var
  Stair : TStair;
begin

  Stair := CurrentLevel.Blocks[self._Blocks].Stairs[pStairID];
  if Stair.Direction = 3 then
    Stair.Direction := 0
  else
    Stair.Direction :=Stair.Direction + 1;

end;

function TROMData.GetDoorUnderMouse(pX, pY: Integer): Integer;
begin

  result := -1;

  if Assigned(CurrentBlock.Doors) = False then exit;

  if (pY >= CurrentBlock.Doors.Y2) and (pY <= CurrentBlock.Doors.Y2 + 16) then
  begin
    if CurrentBlock.Doors.Direction = 0 then
    begin
      if (pX >= 0) and (pX <= 16) then
        result := 1
    end
    else if CurrentBlock.Doors.Direction = 1 then
    begin
      if (pX >= 240) and (pX <= 256) then
        result := 1;
    end;
  end;

  if (pY >= CurrentBlock.Doors.Y1) and (pY <= CurrentBlock.Doors.Y1 + 16) then
  begin
    if CurrentBlock.Doors.Direction = 0 then
    begin
      if (pX >= 0) and (pX <= 16) then
        result := 0
    end
    else if CurrentBlock.Doors.Direction = 1 then
    begin
      if (pX >= 240) and (pX <= 256) then
        result := 0;
    end;
  end;
end;

function TROMData.GetEntranceUnderMouse(pX, pY: integer): Integer;
begin

  result := -1;

  if Assigned(CurrentBlock.Entrance) = false then exit;

  if (pX >= CurrentBlock.Entrance.X) and (pX <= CurrentBlock.Entrance.X + 16) then
    if (pY >= CurrentBlock.Entrance.Y) and (pY <= CurrentBlock.Entrance.Y + 16) then
      result := 0;
end;


function TROMData.ReturnNESPal(pElement: Integer): TColor32;
begin
  result := ROM.NESPal[pElement];
end;

function TROMData.IsCV3ROM: Boolean;
begin
  if (ROM.MapperNumber = 5) and (ROM.PRGCount = 16) then
    result := true
  else if (ROM.MapperNumber = 24) and (ROM.PRGCount = 16) then
    result := true
  else
    result := false;

end;

procedure TROMData.LoadDefaultPalette;
begin
  ROM.LoadDefaultPalette;
end;

procedure TROMData.LoadPaletteFile(pFilename: String);
begin
  ROM.LoadPaletteFile(pFilename);
end;

procedure TROMData.LoadCharacterPalette;
var
  i : Integer;
begin
  for i := 7 to 10 do
    self._Palette[i,0] := $0F;
  // Trevor's Palette
  for i := 0 to 2 do
    _Palette[7,i+1] := ROM[Properties['TrevPal'].Offset + i];
  // Grant's Palette
  for i := 0 to 2 do
    _Palette[8,i+1] := ROM[Properties['GrantPal'].Offset + i];
  // Sypha's Palette
  for i := 0 to 2 do
    _Palette[9,i+1] := ROM[Properties['SyphaPal'].Offset + i];
  // Alucard's Palette
  for i := 0 to 2 do
    _Palette[10,i+1] := ROM[Properties['AlucPal'].Offset + i];
end;

procedure TROMData.SaveCharacterPalette;
var
  i : Integer;
begin
  // Trevor's Palette
  for i := 0 to 2 do
    ROM[Properties['TrevPal'].Offset + i] := _Palette[7,i+1];
  // Grant's Palette
  for i := 0 to 2 do
    ROM[Properties['GrantPal'].Offset + i] := _Palette[8,i+1];
  // Sypha's Palette
  for i := 0 to 2 do
    ROM[Properties['SyphaPal'].Offset + i] := _Palette[9,i+1];
  // Alucard's Palette
  for i := 0 to 2 do
    ROM[Properties['AlucPal'].Offset + i] := _Palette[10,i+1];
end;

function TROMData.GetNumberOfPatternBars: Integer;
begin
  result :=  ROM.CHRCount * 8; 
end;

procedure TROMData.LoadPrayingIntroPalette;
var
  i,x : Integer;
begin
  for i := 0 to 7 do
    for x := 0 to 3 do
      self._PrayingIntroPalette[i,x] := ROM[Properties['PrayingIntroPal'].Offset + (i * 4) + x];

  for i := 0 to 7 do
    Self._PrayingIntroPalette[i,0] := Self._PrayingIntroPalette[4,0];

end;

procedure TROMData.SavePrayingIntroPalette;
var
  i,x : Integer;
begin
  for i := 0 to 7 do
    for x := 0 to 3 do
      ROM[Properties['PrayingIntroPal'].Offset + (i * 4) + x] := self._PrayingIntroPalette[i,x];
end;

procedure TROMData.Save;
var
  i,x : Integer;
begin
  SaveStairsData();
  SaveEntranceData();
  SaveSpecialObjectsData;
  SaveDoorsData;
  SaveEnemyData;

  for i := 0 to Levels.Count -1 do
  begin
    Levels[i].SaveCHRSwitchingData;


    for x := 0 to Levels[i].Blocks.Count -1 do
    begin
      Levels[i].Blocks[x].SaveBGPattern;
      Levels[i].Blocks[x].SaveSprPattern;
      Levels[i].Blocks[x].SaveBGPalSetup;
      Levels[i].Blocks[x].SaveSprPalSetup;

      Levels[i].Blocks[x].SaveDoorsData;

    end;
  end;


  SaveCurrentPalette();
  SaveGlobalEnemyData;
  SaveGlobalCandleData;
  ROM.Save;
end;

function TROMData.GetDebugStatus: Boolean;
begin
  if Properties['Debug'].Value = $E4 then
    result := True
  else
    result := False;
end;

procedure TROMData.SetDebugStatus(const Value: Boolean);
begin
  if Value = True then
    Properties['Debug'].Value := $E4
  else
    Properties['Debug'].Value := $90;
end;

function TROMData.GetSpecialObjectUnderMouse(pX, pY: Integer): Integer;
var
  SpecObj : TSpecialObject;
  i : integer;
begin
  result := -1;

  if Assigned(CurrentBlock.SpecialObjects) = false then exit;

  if CurrentBlock.SpecialObjects.Count = 0 then
    exit;
  if CurrentBlock.VerticalScroll = False then
  begin
    for i := CurrentBlock.SpecialObjects.Count - 1 downto 0 do
    begin
      SpecObj := CurrentBlock.SpecialObjects[i];

      if SpecObj.ScreenNumber = self._BlocksPosition then
      begin
        if ((pX >= SpecObj.X - CurrentBlock.SpecialObjects[i].HTileOffX) and (pX <= SpecObj.X - CurrentBlock.SpecialObjects[i].HTileOffX + 16)) and ((pY >= SpecObj.Y - CurrentBlock.SpecialObjects[i].HTileOffY) and (pY <= SpecObj.Y  - CurrentBlock.SpecialObjects[i].HTileOffY + 16)) then
        begin
          result := i;
//        showmessage(IntToStr(stair._Direction));
          break;
        end;
      end;
    end;

  end
  else
  begin
    for i := CurrentBlock.SpecialObjects.Count - 1 downto 0 do
    begin
      SpecObj := CurrentBlock.SpecialObjects[i];

      if SpecObj.ScreenNumber = self._BlocksPosition then
      begin
        if ((pY >= SpecObj.X  - CurrentBlock.SpecialObjects[i].VTileOffY) and (pY <= (SpecObj.X - CurrentBlock.SpecialObjects[i].VTileOffY) + 16)) then
          if ((pX >= SpecObj.Y  - CurrentBlock.SpecialObjects[i].VTileOffX) and (pX <= (SpecObj.Y - CurrentBlock.SpecialObjects[i].VTileOffX) + 16)) then
          begin
            result := i;
  //        showmessage(IntToStr(stair._Direction));
            break;
          end;
      end;
    end;
  end;

end;

function TROMData.GetVerticalEnemyUnderMouse(pX, pY: Integer): Integer;
var
  i : Integer;
begin

  result := -1;

  if Assigned(CurrentBlock.VerticalEnemies) = False then exit;
  if CurrentBlock.VerticalEnemies.Count = 0 then
    exit;
  if CurrentBlock.VerticalScroll = True then
  begin
    for i := CurrentBlock.VerticalEnemies.Count - 1 downto 0 do
    begin
      if CurrentBlock.VerticalEnemies[i].ScreenNumber = self._BlocksPosition then
      begin
        if ((pX >= CurrentBlock.VerticalEnemies[i].X) and (pX <= CurrentBlock.VerticalEnemies[i].X + 16)) and ((pY >= (CurrentBlock.VerticalEnemies[i].Y)) and (pY <= (CurrentBlock.VerticalEnemies[i].Y) + 16)) then
        begin
          result := i;
//        showmessage(IntToStr(stair._Direction));
          break;
        end;
      end;
    end;
  end;


end;

function TROMData.GetFilename: String;
begin
  result := ROM.Filename;
end;

procedure TROMData.Import8x8Pat(pID: Integer; p8x8: T8x8Graphic);
var
  x,y : Integer;
  TempBin1, TempBin2 : String;
  Tile1 : Array [0..15] of Byte;
begin
  For y := 0 To 15 do
    Tile1[y] := self._PatternTable[(pID * 16) +y];

  for y := 0 to 7 do
  begin
    for x := 0  to 7 do
    begin

      TempBin1 := IntToStr(p8x8.Pixels[y,x] and 1) + TempBin1;
      TempBin2 := IntToStr(p8x8.Pixels[y,x] shr 1) + TempBin2;


    end;

    self._PatternTable[(pID * 16) +y] := ROM.BinToByte(TempBin1);
    self._PatternTable[(pID * 16) +y + 8] := ROM.BinToByte(TempBin2);

  end;

end;

function TROMData.GetPal(index1, index2: Integer): Byte;
begin
  result := self._Palette[index1,index2];
end;

procedure TROMData.SetPal(index1, index2: Integer; const Value: Byte);
begin
  self._Palette[index1,index2] := Value;
end;

function TROMData.GetChanged : Boolean;
begin
  result := ROM.Changed;
end;

procedure TROMData.SetChanged(pBool : Boolean);
begin
  ROM.Changed := pBool;
end;

function TROMData.GetPrayPal(index1, index2: Integer): Byte;
begin
  result := self._PrayingIntroPalette[index1,index2];
end;

procedure TROMData.SetPrayPal(index1, index2: Integer; const Value: Byte);
begin
  self._PrayingIntroPalette[index1,index2] := Value;
end;

procedure TROMData.LoadGlobalEnemyData;
var
  i,offset : Integer;
begin

  if Assigned(GlobalEnemies) = True then
    FreeAndNil(GlobalEnemies);

  GlobalEnemies := TGlobalEnemyList.Create(true);
  GlobalEnemies.Capacity := _NumGlobalEnemy;
  for i := 0 to self._NumGlobalEnemy -1 do
  begin
    GlobalEnemies.Add(TGlobalEnemy.Create);

    offset := ROM.PointerToOffset(Properties['GlobalEnemyPointers'].Offset + (i * 2));

    GlobalEnemies.Last.ID := ROM[Offset];
    GlobalEnemies.Last.X := ROM[Offset + 1];
    GlobalEnemies.Last.Y := ROM[Offset + 2] - $28;
    GlobalEnemies.Last.Unknown1 := ROM[Offset + 3];
    GlobalEnemies.Last.Unknown2 := ROM[Offset + 4];
  end;

end;

procedure TROMData.LoadGlobalCandleData;
var
  i,offset : Integer;
  temp : TGlobalCandle;
begin
  if Assigned(GlobalCandles) = True then
    FreeAndNil(GlobalCandles);

  GlobalCandles := TGlobalCandleList.Create(true);
  GlobalCandles.Capacity := _NumGlobalCandle;
  for i := 0 to self._NumGlobalCandle -1 do
  begin
    GlobalCandles.Add(TGlobalCandle.Create);

    offset := ROM.PointerToOffset(self.Properties['GlobalCandlePointers'].Offset + (i * 2));
    temp := GlobalCandles.Last;
    temp.CandleType := ROM[Offset];
    temp.DropItem := ROM[Offset + 1];
    temp.X := ROM[Offset + 2];
    temp.Y := ROM[Offset + 3] - $28;
  end;

end;

procedure TROMData.SaveGlobalEnemyData;
begin

end;

procedure TROMData.SaveGlobalCandleData;
var
  i,offset : Integer;
begin

  if Assigned(GlobalCandles) = False then exit;


  for i := 0 to _NumGlobalCandle -1 do
  begin
    offset := ROM.PointerToOffset(self.Properties['GlobalCandlePointers'].Offset + (i * 2));

    ROM[Offset] := GlobalCandles[i].CandleType;
    ROM[Offset + 1] := GlobalCandles[i].DropItem;
    ROM[Offset + 2] := GlobalCandles[i].X;
    ROM[Offset + 3] := GlobalCandles[i].Y + $28;

  end;

end;

procedure TROMData.LoadRoomTiles;
var
  i, x, offset, value : Integer;
begin

  if CurrentBlock.Verticalscroll = True then
  begin
    offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 64) +1;

    For i := 0 To 7 do
    begin
      For x := 0 To 7 do
      begin
        value := ROM[offset  + (i * 8) + x];
        if _DrawBlock[value] = False then
        begin
          if assigned(_tiles) = true then DrawLevelTile(value);
          _DrawBlock[value] := True;
        end;

      end;

    end;

  end
  else if CurrentBlock.Verticalscroll = false then
  begin
    offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 48) +1;
    For i := 0 To 5 do
    begin
      For x := 0 To 7 do
      begin
        value := ROM[offset  + (i * 8) + x];
        if _DrawBlock[value] = False then
        begin
          if assigned(_tiles) = true then DrawLevelTile(value);
          _DrawBlock[value] := True;
        end;

      end;

    end;

  end;
end;

procedure TROMData.SetRoomData(pX,pY : Integer;pTile : Byte);
var
  Offset : Integer;
begin

  if CurrentBlock.VerticalScroll then
    offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 64) +1
  else
    offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 48) +1;

  ROM[offset  + (pX * 8) + pY] := pTile;
end;

function TROMData.GetRoomData(pX,pY : Integer): Byte;
var
  Offset : Integer;
begin

  if CurrentBlock.VerticalScroll then
    offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 64) +1
  else
    offset := CurrentBlock.BlockOffset + (self._BlocksPosition * 48) +1;

  result := ROM[offset  + (pX * 8) + pY];
end;

function TROMData.DetectObjUnderMouse(pX,pY : Integer) : TObjDetect;
var
  Obj : TObjDetect;
  ObjIndex : Integer;
begin
  Obj.ObjType := uConsts.NONETYPE;
  Obj.ObjIndex := -1;

  result := obj;

  ObjIndex := GetStairUnderMouse(pX,pY);

  if ObjIndex > -1 then
  begin
    Obj.ObjType := uConsts.STAIRTYPE;
    Obj.ObjIndex := ObjIndex;
    result := obj;
    exit;
  end;

  ObjIndex := GetDoorUnderMouse(px,py);

  if ObjIndex > -1 then
  begin
    Obj.ObjType := uConsts.DOORTYPE;
    Obj.ObjIndex := ObjIndex;
    result := obj;
    exit;
  end;

  ObjIndex := GetEntranceUnderMouse(px,py);

  if ObjIndex > -1 then
  begin
    Obj.ObjType := uConsts.ENTRANCETYPE;
    Obj.ObjIndex := ObjIndex;
    result := obj;
    exit;
  end;

  ObjIndex := GetSpecialObjectUnderMouse(px,py);

  if ObjIndex > -1 then
  begin
    Obj.ObjType := uConsts.SPECOBJTYPE;
    Obj.ObjIndex := ObjIndex;
    result := obj;
    exit;
  end;

  if CurrentBlock.VerticalScroll = True then
  begin
    ObjIndex := self.GetVerticalEnemyUnderMouse(pX,pY);
    if ObjIndex > -1 then
    begin
      Obj.ObjType := uConsts.VERTICALENEMYTYPE;
      Obj.ObjIndex := ObjIndex;
      result := obj;
      exit;
    end;
  end;

end;

procedure TROMData.LoadColonSeparatedFile(pStringList : TStringList;pFilename : String;pIncludeIndex : Boolean);
var
  ColonFile : TStringList;
  Index : String;
  i, count : Integer;
begin

  for i := 0 to 255 do
    pStringList.Add('$' + IntToHex(i,2) + ' - N/A');

  // Now load in the enemy names from the file 'enemy.dat' in the data directory.
  if FileExists(pFilename) = True then
  begin
    ColonFile := TStringList.Create;
    ColonFile.LoadFromFile(pFilename);

    for i := 0 to ColonFile.Count - 1 do
    begin
      if copy(ColonFile[i],1,2) <> '//' then
      begin
        count := 1;
        Index := '';
        while ((ColonFile[i][count] <> ':') or (count = length(ColonFile[i]))) do
        begin
          Index := Index + ColonFile[i][count];
          inc(Count);
        end;
        inc(Count);
        if pIncludeIndex = true then
          pStringList[StrToInt('$' + Index)] := '$' + Index + ' - ' + copy(ColonFile[i],Count,Length(ColonFile[i]) - count +1)
        else
          pStringList[StrToInt('$' + Index)] := copy(ColonFile[i],Count,Length(ColonFile[i]) - count +1);        
      end;

    end;

  end;
  FreeAndNil(ColonFile);

end;

// Exposes the ROM object's PointerToOffset function.
function TROMData.PointerToOffset(pOffset : Integer; pBank: Integer = $0; pMemAddress : Integer = $8000): Integer;
begin
  result := ROM.PointerToOffset(pOffset,pBank,pMemAddress);
end;

procedure TROMData.LoadEntranceData;
var
  InvScr : Array Of Byte;
  i,x,z,offset : Integer;
  Entrance : TEntrance;
begin


  for i := 0 to Levels.Count -1 do
  begin
    for x := 0 to Levels[i].Blocks.Count -1 do
    begin
      offset := Levels[i].Blocks[x].Properties['Entrance'].Offset;
      if (offset > 0) then
      begin
        if Assigned(Levels[i].Blocks[x].Entrance) = True then
          FreeAndNil(Levels[i].Blocks[x].Entrance);

        Levels[i].Blocks[x].Entrance := TEntrance.Create;

        Entrance := Levels[i].Blocks[x].Entrance;

        if Levels[i].Blocks[x].VerticalScroll = true then
        begin
          SetLength(InvScr,Levels[i].Blocks[x].BlockLength +1);

          for z := Levels[i].Blocks[x].BlockLength downto 0 do
            InvScr[z] := Levels[i].Blocks[x].BlockLength - z;

          Entrance.x := (ROM[offset]) and $F0;
          Entrance.y := (ROM[offset] shl 4);
          Entrance.ScreenNumber := InvScr[ROM[offset + 1]];
        end
        else
        begin
          Entrance.x := (ROM[offset]) and $F0;
          Entrance.y := (ROM[offset] shl 4) - $20;
          Entrance.ScreenNumber := ROM[offset + 1];
        end;
      end;
    end;

  end;


end;

procedure TROMData.SaveEntranceData;
var
  InvScr : Array Of Byte;
  i,x,z,offset : Integer;
  Entrance : TEntrance;
begin
  for i := 0 to Levels.Count -1 do
  begin

    for x := 0 to Levels[i].Blocks.Count -1 do
    begin
      offset := Levels[i].Blocks[x].Properties['Entrance'].Offset;
      if (offset > 0) and (Assigned(Levels[i].Blocks[x].Entrance) = True) then
      begin
        Entrance := Levels[i].Blocks[x].Entrance;

        if Levels[i].Blocks[x].VerticalScroll = true then
        begin
          SetLength(InvScr,Levels[i].Blocks[x].BlockLength +1);
          for z := 0 to Levels[i].Blocks[x].BlockLength do
            InvScr[z] := Levels[i].Blocks[x].BlockLength - z;

    //      Entrances._ScreenNumber := InvScr[ROM[_EntranceOffset + 1]];
          ROM[offset] := ((Entrance.Y) shr 4) + (Entrance.X and $F0);
          ROM[offset+1] := InvScr[Entrance.ScreenNumber];
        end
        else
        begin
          ROM[offset] := ((Entrance.Y + $20) shr 4) + (Entrance.X and $F0);
          ROM[offset+1] := Entrance.ScreenNumber;
        end;

      end;

    end;
  end;

end;


procedure TROMData.LoadSpecialObjectsData;
var
  i,x,z : Integer;
  SpecObj : TSpecialObject;
begin
  for i := 0 to Levels.Count -1 do
  begin
    for x := 0 to Levels[i].Blocks.Count -1 do
    begin

      if Levels[i].Blocks[x].SpecialObjectOffset > 0 then
      begin
        z := ROM.PointerToOffset(Levels[i].Blocks[x].SpecialObjectOffset);
        if Assigned(Levels[i].Blocks[x].SpecialObjects) = false then
        begin
          Levels[i].Blocks[x].SpecialObjects := TSpecialObjectList.Create(True);
          // Now we load in all the stairs.
          while (ROM[z] < $FF) do
          begin
            Levels[i].Blocks[x].SpecialObjects.Add(TSpecialObject.Create);
            SpecObj := Levels[i].Blocks[x].SpecialObjects.Last;
            SpecObj.ScreenNumber := ROM[z];
            SpecObj.X := ROM[z + 1];
            SpecObj.Unknown1 := ROM[z + 2];
            SpecObj.ID := ROM[z + 3];
            SpecObj.Y := ROM[z + 4];
            SpecObj.Unknown2 := ROM[z + 5];
            SpecObj.Unknown3 := ROM[z + 6];
            SpecObj.Unknown4 := ROM[z + 7];
            inc(z,8);
          end;
        end;
      end;
    end;
  end;

end;

procedure TROMData.SaveSpecialObjectsData;
begin

end;

procedure TROMData.LoadDoorsData;
var
  i,x : Integer;
  Doors : TDoor;
begin
  for i := 0 to Levels.Count -1 do
  begin

    for x := 0 to Levels[i].Blocks.Count -1 do
    begin

      if Levels[i].Blocks[x].DoorOffset > 0 then
      begin
        if Assigned(Levels[i].Blocks[x].Doors) = True then
          FreeAndNil(Levels[i].Blocks[x].Doors);

        Levels[i].Blocks[x].Doors := TDoor.Create;

        Doors := Levels[i].Blocks[x].Doors;

        Doors.ScreenNumber := ROM[Levels[i].Blocks[x].DoorOffset];
        Doors.Direction := ROM[Levels[i].Blocks[x].DoorOffset + 1];
        Doors.Y1 := ROM[Levels[i].Blocks[x].DoorOffset + 2] - $20;
        Doors.Y2 := ROM[Levels[i].Blocks[x].DoorOffset + 3] - $20;

      end;

    end;

  end;



end;

procedure TROMData.SaveDoorsData;
begin

end;

procedure TROMData.LoadStairsData;
var
  i,x,offset : Integer;
begin
  for i := 0 to Levels.Count -1 do
  begin

    for x := 0 to Levels[i].Blocks.Count -1 do
    begin
      offset := ROM.PointerToOffset(Levels[i].Blocks[x].StairPointerOffset);
      if Assigned(Levels[i].Blocks[x].Stairs) then
        FreeAndNil(Levels[i].Blocks[x].Stairs);

      Levels[i].Blocks[x].Stairs := TStairList.Create(true);

      while (ROM[offset] < $FF) do
      begin
        Levels[i].Blocks[x].Stairs.Add(TStair.Create);
        if Levels[i].Blocks[x].VerticalScroll = False then
        begin
          Levels[i].Blocks[x].Stairs.Last.Direction := ROM[offset] shr 6;
          Levels[i].Blocks[x].Stairs.Last.Y := ((ROM[offset] and $3f) * 16) - 16;
          Levels[i].Blocks[x].Stairs.Last.X := ROM[offset+1];
          Levels[i].Blocks[x].Stairs.Last.ScreenNumber := ROM[offset+2] and $3F;
          Levels[i].Blocks[x].Stairs.Last.UnknownData := ROM[offset+2] and $C0;
          inc(offset,3);
        end
        else
        begin
          Levels[i].Blocks[x].Stairs.Last.Direction := ROM[offset] shr 6;
          Levels[i].Blocks[x].Stairs.Last.ScreenNumber := ROM[offset] and $3F;
          Levels[i].Blocks[x].Stairs.Last.Y := ROM[offset+1] + $10;
          Levels[i].Blocks[x].Stairs.Last.X := ROM[offset+2];
          inc(offset,3);
        end;
      end;

    end;

  end;

end;

procedure TROMData.SaveStairsData;
var
  offset,i,x,z : Integer;
  Stair : TStair;
begin
  for i := 0 to Levels.Count -1 do
  begin

    for x := 0 to Levels[i].Blocks.Count -1 do
    begin
      offset := ROM.PointerToOffset(Levels[i].Blocks[x].StairPointerOffset);

      if (Assigned(Levels[i].Blocks[x].Stairs) = True) and (Levels[i].Blocks[x].Stairs.Count > 0) then
      begin
    for z := 0 to Levels[i].Blocks[x].Stairs.Count - 1 do
    begin
      if Levels[i].Blocks[x].Verticalscroll = false then
      begin
        Stair := Levels[i].Blocks[x].Stairs[z];
        ROM[offset + (z*3)] := (Stair.Direction shl 6) + (((Stair.Y + 16) div 16) and $3F) ;
        ROM[offset + (z*3+1)] := Stair.X;
        ROM[offset + (z*3+2)] := Stair.ScreenNumber and $3F;
      end
      else
      begin
        Stair := Levels[i].Blocks[x].Stairs[z];
        ROM[offset + (z*3)] := (Stair.Direction shl 6) + (Stair.ScreenNumber and $3F);
        ROM[offset + (z*3+1)] := Stair.Y - $10;
        ROM[offset + (z*3+2)] := Stair.X;
      end;
    end;
      end;

    end;

  end;

end;

procedure TROMData.LoadEnemyData;
var
  i,x,z,size,offset : Integer;
  VertEne : TVerticalEnemy;
begin

  for i:= 0 to Levels.Count -1 do
  begin

    for x := 0 to Levels[i].Blocks.Count -1 do
    begin

      if Levels[i].Blocks[x].EnemyOffset > 0 then
      begin

        if Levels[i].Blocks[x].VerticalScroll = True then
        begin
          offset := ROM.PointerToOffset(Levels[i].Blocks[x].EnemyOffset);

          if Assigned(Levels[i].Blocks[x].VerticalEnemies) = False then
            FreeAndNil(Levels[i].Blocks[x].VerticalEnemies);

          Levels[i].Blocks[x].VerticalEnemies := TVerticalEnemyList.Create(True);
          // Now we load in all the vertical enemies.
          while (ROM[offset] < $FF) do
          begin
            Levels[i].Blocks[x].VerticalEnemies.Add(TVerticalEnemy.Create);
            VertEne := Levels[i].Blocks[x].VerticalEnemies.Last;

            VertEne.ScreenNumber := ROM[offset];
            VertEne.Y := ROM[offset + 1];
            VertEne.EnType := ROM[offset + 2];
            VertEne.X := ROM[offset + 3];
            VertEne.Item := ROM[offset + 4];
            VertEne.Unknown := ROM[offset + 5];
            VertEne.Direction := ROM[offset + 6];

            inc(offset,7);
          end;


        end
        else
        begin
          offset := ROM.PointerToOffset(Levels[i].Blocks[x].EnemyOffset);
          size := ((Levels[i].Blocks[x].BlockLength +1) * 8) + 4;
          Levels[i].Blocks[x].EnemyData := TByteList.Create(size);

          for z := 0 to size-1 do
            Levels[i].Blocks[x].EnemyData[z] := ROM[offset+z];
        end;

      end;

    end;

  end;


end;

procedure TROMData.SaveEnemyData;
var
  i,x : Integer;
  offset,z : Integer;

begin
  for i := 0 to Levels.Count -1 do
  begin

    for x := 0 to Levels[i].Blocks.count -1 do
    begin

      if Levels[i].Blocks[x].EnemyOffset > 0 then
      begin

        offset := ROM.PointerToOffset(Levels[i].Blocks[x].EnemyOffset);

        if Levels[i].Blocks[x].VerticalScroll = False then
        begin


          for z := 0 to Levels[i].Blocks[x].EnemyData.Count -1 do
          begin
            ROM[offset+i] := Levels[i].Blocks[x].EnemyData[i];
          end;

        end
        else
        begin

          for z := 0 to Levels[i].Blocks[x].VerticalEnemies.Count -1 do
          begin

{            VertEne := Levels[i].Blocks[x].VerticalEnemies.Last;

            VertEne.ScreenNumber := ROM[offset];
            VertEne.Y := ROM[offset + 1];
            VertEne.EnType := ROM[offset + 2];
            VertEne.X := ROM[offset + 3];
            VertEne.Item := ROM[offset + 4];
            VertEne.Unknown := ROM[offset + 5];
            VertEne.Direction := ROM[offset + 6];}

            inc(offset,7);
          end;
          
        end;

      end;

    end;

  end;

end;

function TROMData.GetGlobalDataAmount(pType,pID : Byte) : Integer;
var
  i,amount : Integer;
begin
  amount := 0;

  if pType = 0 then
  begin

    for i := 0 to GlobalEnemies.Count -1 do
    begin
      if GlobalEnemies[i].ID = pID then
        inc(amount);
    end;

  end
  else if pType >= 1 then
  // if it is neither of the above, treat it as an enemy
  begin
    for i := 0 to GlobalCandles.Count -1 do
    begin
      if GlobalCandles[i].DropItem = pID then
        inc(amount);
    end;


  end;

  result := amount;
end;

procedure TROMData.EditEnemyData(pX,pY : Integer;pMode : Byte;pID : Integer;pIndex : Integer);
var
  i : Integer;
  indexcount : Integer;
begin
  // Enemy Editing
  if pMode = 0 then
  begin
    indexcount := 0;
    if CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + ((pX div 64) * 2)] = 00 then
    begin

      for i := 0 to GlobalEnemies.Count -1 do
      begin
        if GlobalEnemies[i].ID = pID then
        begin
          if (indexcount >= pIndex * uConsts.NUMENEDISP) and (indexcount < (pIndex + 1) * uConsts.NUMENEDISP) then
          begin
            if (pX mod 64 >= GlobalEnemies[i].X) and ((pX mod 64) <= GlobalEnemies[i].X +$10 )
              and (pY >= GlobalEnemies[i].Y) and (pY <= GlobalEnemies[i].Y + $8) then
              begin
                CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + ((pX div 64) * 2)] := i;
                ROM.Changed := True;
                break;

              end;
          end;
          inc(indexcount);
        end;

      end;

    end
    else
    begin
      ROM.Changed := True;
      CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + ((pX div 64) * 2)] := 00;
    end;


  end
  // Candle-editing
  else
  begin

    indexcount := 0;

    if CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + ((pX div 64) * 2) + 1] = 00 then
    begin
      for i := 0 to GlobalCandles.Count -1 do
      begin
        if (GlobalCandles[i].CandleType = pMode + $8F) and (GlobalCandles[i].DropItem = pID) then
        begin
          if (indexcount >= pIndex * uConsts.NUMENEDISP) and (indexcount < (pIndex + 1) * uConsts.NUMENEDISP) then
          begin
            if (pX mod 64 >= GlobalCandles[i].X) and ((pX mod 64) <= GlobalCandles[i].X +$10 )
              and (pY >= GlobalCandles[i].Y) and (pY <= GlobalCandles[i].Y + $8) then
              begin
                CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + ((pX div 64) * 2) + 1] := i;
                ROM.Changed := True;
                break;

              end;
          end;


          inc(indexcount);

        end;

      end;
    end
    else
    begin
      CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + ((pX div 64) * 2) + 1] := 00;
      ROM.Changed := True;
    end;

  end;

end;

procedure TROMData.DrawEnemyData(pBitmap: TBitmap32; pMode: Byte;pID : Byte;pIndex : Byte);
var
  i,x,indexcount : Integer;
  EnemyData : Byte;
  Numbers, UsedNumbers : TBitmap32;
begin

  if FileExists(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp') = false then
    exit;

  if FileExists(ExtractFileDir(Application.ExeName) + '\Data\usednumbers.bmp') = false then
    exit;

  Numbers := TBitmap32.Create;
  Numbers.Height := 8;
  Numbers.Width := 128;
  Numbers.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');
  Numbers.MasterAlpha := 200;
  Numbers.DrawMode := dmBlend;
  UsedNumbers := TBitmap32.Create;
  UsedNumbers.Height := 8;
  UsedNumbers.Width := 128;
  UsedNumbers.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\usednumbers.bmp');

  // Enemies
  if pMode = 0 then
  begin
    for x := 0 to 3 do
    begin
      EnemyData := CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + (x * 2)];
      indexcount := 0;
      if EnemyData = 00 then
      begin
        for i := 0 to GlobalEnemies.Count -1 do
        begin
          if (GlobalEnemies[i].ID = pID) then
          begin
            if (indexcount >= pIndex * uConsts.NUMENEDISP) and (indexcount < (pIndex + 1) * uConsts.NUMENEDISP) then
            begin
              pBitmap.Draw(bounds(GlobalEnemies[i].X + (x * 64),GlobalEnemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(i,2)[1]) * 8,0,8,8),Numbers);
              pBitmap.Draw(bounds(GlobalEnemies[i].X + (x * 64) + 8,GlobalEnemies[i].Y,8,8),bounds(StrToInt('$' + IntToHex(i,2)[2]) * 8,0,8,8),Numbers);
            end;
            inc(indexcount);
          end;
        end;
      end
      else
      begin
        pBitmap.Draw(bounds(GlobalEnemies[EnemyData].X + (x * 64),GlobalEnemies[EnemyData].Y,8,8),bounds(StrToInt('$' + IntToHex(EnemyData,2)[1]) * 8,0,8,8),UsedNumbers);
        pBitmap.Draw(bounds(GlobalEnemies[EnemyData].X + (x * 64) + 8,GlobalEnemies[EnemyData].Y,8,8),bounds(StrToInt('$' + IntToHex(EnemyData,2)[2]) * 8,0,8,8),UsedNumbers);
      end;

    end;

  end
  // Candles
  else if pMode >0 then
  begin
    for x := 0 to 3 do
    begin

      EnemyData := CurrentBlock.EnemyData[(8 * _BlocksPosition) + 2 + (x * 2) + 1];
      indexcount := 0;
      if EnemyData = 00 then
      begin
        for i := 0 to GlobalCandles.Count -1 do
        begin
          if (GlobalCandles[i].CandleType = pMode + $8F) and (GlobalCandles[i].DropItem = pID) then
          begin
            if (indexcount >= pIndex * uConsts.NUMENEDISP) and (indexcount < (pIndex + 1) * uConsts.NUMENEDISP) then
            begin
              pBitmap.Draw(bounds(GlobalCandles[i].X + (x * 64),GlobalCandles[i].Y,8,8),bounds(StrToInt('$' + IntToHex(i,2)[1]) * 8,0,8,8),Numbers);
              pBitmap.Draw(bounds(GlobalCandles[i].X + (x * 64) + 8,GlobalCandles[i].Y,8,8),bounds(StrToInt('$' + IntToHex(i,2)[2]) * 8,0,8,8),Numbers);
            end;
            inc(indexcount);
          end;
        end;
      end
      else
      begin
        pBitmap.Draw(bounds(GlobalCandles[EnemyData].X + (x * 64),GlobalCandles[EnemyData].Y,8,8),bounds(StrToInt('$' + IntToHex(EnemyData,2)[1]) * 8,0,8,8),UsedNumbers);
        pBitmap.Draw(bounds(GlobalCandles[EnemyData].X + (x * 64) + 8,GlobalCandles[EnemyData].Y,8,8),bounds(StrToInt('$' + IntToHex(EnemyData,2)[2]) * 8,0,8,8),UsedNumbers);
      end;

    end;
  end;

  FreeAndNil(Numbers);
  FreeAndNil(UsedNumbers);

end;

function TROMData.GetEnemyCandleUnderMouse(pX,pY : Integer;pMode : Byte;pID : Integer;pIndex : Integer) : Integer;
var
  i : Integer;
  indexcount : Integer;
begin
  result := -1;
  // Enemy Editing
  if pMode = 0 then
  begin
    indexcount := 0;

    for i := 0 to GlobalEnemies.Count -1 do
    begin
      if GlobalEnemies[i].ID = pID then
      begin
        if (indexcount >= pIndex * uConsts.NUMENEDISP) and (indexcount < (pIndex + 1) * uConsts.NUMENEDISP) then
        begin
          if (pX mod 64 >= GlobalEnemies[i].X) and ((pX mod 64) <= GlobalEnemies[i].X +$10 )
            and (pY >= GlobalEnemies[i].Y) and (pY <= GlobalEnemies[i].Y + $8) then
            begin
              result := i;

              break;

            end;
        end;
        inc(indexcount);
      end;

    end;

  end
  // Candle-editing
  else
  begin

    indexcount := 0;


    for i := 0 to GlobalCandles.Count -1 do
    begin
      if (GlobalCandles[i].CandleType = pMode + $8F) and (GlobalCandles[i].DropItem = pID) then
      begin
        if (indexcount >= pIndex * uConsts.NUMENEDISP) and (indexcount < (pIndex + 1) * uConsts.NUMENEDISP) then
        begin
          if (pX mod 64 >= GlobalCandles[i].X) and ((pX mod 64) <= GlobalCandles[i].X +$10 )
            and (pY >= GlobalCandles[i].Y) and (pY <= GlobalCandles[i].Y + $8) then
            begin
              result := i;

              break;

            end;
        end;


        inc(indexcount);

      end;

    end;


  end;
end;

end.
