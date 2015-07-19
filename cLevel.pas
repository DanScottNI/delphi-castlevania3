unit cLevel;

interface

uses cLevelObj, cEnemy, cSpecObj, contnrs, OffsetList, ByteList;

type
  TLevelBlock = class
  private
    _Name : String;
    // This is the length of the level position
    // +1 is usually the start of the data.
    _Offset : Integer;
    _Verticalscroll : Boolean;
    _BGPatternTableOffset : Integer;
    _BGPatternTable1 : Byte;
    _BGPatternTable2 : Byte;
    _BGPatternTable3 : Byte;
    _BGPatternTable4 : Byte;
    _SprPatternTableSecondQuest : Byte;
    _BGPalSetupOffset : Integer;
    _BGPalType : Byte;
    _SprPalSetupOffset : Integer;
    _SprPalType : Byte;
    _SprPatternTableOffset : Integer;
    _SprPatternTable2 : Byte;
    _SprPatternTable3 : Byte;
//    _PalettePointer : Integer;
    _StairPointer : Integer;
    _DoorOffset : Integer;
    _MirrorWithBlockNo : Integer;
    _PointerOffset : Integer;
    _TimeOffset : Integer;
    _SpecialObjectOffset : Integer;
    _EnemyOffset : Integer;

    function GetBlockLength: byte;
    procedure SetBlockLength(const Value: byte);
    function GetTime: Integer;
  public
    Stairs : TStairList;
    Doors : TDoor;
    Entrance : TEntrance;
    VerticalEnemies : TVerticalEnemyList;
    SpecialObjects : TSpecialObjectList;
    Properties : T1BytePropertyList;
    EnemyData : TByteList;
    destructor Destroy;override;
    property Name : String read _Name write _Name;
    property BlockOffset : Integer read _Offset;
    property BGPatternTableOffset : Integer read _BGPatternTableOffset write _BGPatternTableOffset;
    property PointerOffset : Integer read _PointerOffset write _PointerOffset;
    property BGPalSetupOffset : Integer read _BGPalSetupOffset write _BGPalSetupOffset;
    property SprPalSetupOffset : Integer read _SprPalSetupOffset write _SprPalSetupOffset;
    property SprPatternTableOffset : Integer read _SprPatternTableOffset write _SprPatternTableOffset;
    property VerticalScroll : Boolean read _VerticalScroll write _VerticalScroll;
    property BGPatternTable1 : Byte read _BGPatternTable1 write _BGPatternTable1;
    property BGPatternTable2 : Byte read _BGPatternTable2 write _BGPatternTable2;
    property BGPatternTable3 : Byte read _BGPatternTable3 write _BGPatternTable3;
    property BGPatternTable4 : Byte read _BGPatternTable4 write _BGPatternTable4;
    property SprPatternTable2 : Byte read _SprPatternTable2 write _SprPatternTable2;
    property SprPatternTable3 : Byte read _SprPatternTable3 write _SprPatternTable3;
    property SprPatternTableSecondQuest : Byte read _SprPatternTableSecondQuest write _SprPatternTableSecondQuest;
    property BGPalType : Byte read _BGPalType write _BGPalType;
    property SprPalType : Byte read _SprPalType write _SprPalType;
    property BGPaletteOffset : Integer read _BGPalSetupOffset write _BGPalSetupOffset;
    property SprPaletteOffset : Integer read _SprPalSetupOffset write _SprPalSetupOffset;
    property StairPointerOffset : Integer read _StairPointer write _StairPointer;
    property DoorOffset : Integer read _DoorOffset write _DoorOffset;
    property MirrorWithBlockNo : Integer read _MirrorWithBlockNo write _MirrorWithBlockNo;
    property TimeOffset : Integer read _TimeOffset write _TimeOffset;
    property SpecialObjectOffset : Integer read _SpecialObjectOffset write _SpecialObjectOffset;
    property EnemyOffset : Integer read _EnemyOffset write _EnemyOffset;
    property BlockLength : byte read GetBlockLength write SetBlockLength;
    property Time : Integer read GetTime;
    procedure CalculateOffsetFromPointer;
    procedure LoadBGPattern;
    procedure LoadSprPattern;
    procedure LoadBGPalSetup;
    procedure LoadSprPalSetup;
    procedure SaveBGPattern;
    procedure SaveSprPattern;
    procedure SaveBGPalSetup;
    procedure SaveSprPalSetup;
    procedure SaveDoorsData;
    function StairPointer : String;
    function BlockPointer : String;
    function EnemyPointer : String;
  end;

  { This is a class that will be used to store the
    stairs. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TBlockList = class(TObjectList)
  protected
    function GetBlockItem(Index: Integer) : TLevelBlock;
    procedure SetBlockItem(Index: Integer; const Value: TLevelBlock);
  public
    function Last : TLevelBlock;
    property Items[Index: Integer] : TLevelBlock read GetBlockItem write SetBlockItem;default;
    procedure Add(pNewItem : TLevelBlock);
  end;

  TLevel = class
  private
    _Name : String;
    _FirstBGPalOffset : Integer;
    _TSAOffset : Integer;
    _AttributeOffset : Integer;
    _NumberOfTiles : Byte;
    _NumberOfBlocks : Byte;
    _CHRSwitchOffset : Integer;
    _CHRSwitchSpeed : Byte;
    _CHRSwitch1 : Byte;
    _CHRSwitch2 : Byte;
    _CHRSwitch3 : Byte;
    _MaxStairs : Integer;
    _MaxVerticalEnemies : Integer;
    _MaxSpecObj : Integer;
  public
    Blocks : TBlockList;
    destructor Destroy;override;
    procedure LoadCHRSwitchingData;
    procedure SaveCHRSwitchingData;
    property Name : String read _Name write _Name;
    property FirstBGPalOffset : Integer read _FirstBGPalOffset write _FirstBGPalOffset;
    property TSAOffset : Integer read _TSAOffset write _TSAOffset;
    property AttributeOffset : Integer read _AttributeOffset write _AttributeOffset;
    property NumberOfTiles : Byte read _NumberOfTiles write _NumberOfTiles;
    property NumberOfBlocks : Byte read _NumberOfBlocks write _NumberOfBlocks;
    property CHRSwitchOffset : Integer read _CHRSwitchOffset write _CHRSwitchOffset;
    property CHRSwitchSpeed : Byte read _CHRSwitchSpeed write _CHRSwitchSpeed;
    property CHRSwitch1 : Byte read _CHRSwitch1 write _CHRSwitch1;
    property CHRSwitch2 : Byte read _CHRSwitch2 write _CHRSwitch2;
    property CHRSwitch3 : Byte read _CHRSwitch3 write _CHRSwitch3;
    property MaximumStairs : Integer read _MaxStairs write _MaxStairs;
    property MaximumVerticalEnemies : Integer read _MaxVerticalEnemies write _MaxVerticalEnemies;
    property MaximumSpecialObjects : Integer read _MaxSpecObj write _MaxSpecObj;
  end;

  { This is a class that will be used to store the
    levels. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TLevelList = class(TObjectList)
  protected
    function GetLevelItem(Index: Integer) : TLevel;
    procedure SetLevelItem(Index: Integer; const Value: TLevel);
  public
    function Last : TLevel;
    property Items[Index: Integer] : TLevel read GetLevelItem write SetLevelItem;default;
    procedure Add(pNewItem : TLevel);    
  end;


implementation

uses uROM, sysutils;

{ TBlockList }

function TBlockList.GetBlockItem(Index: Integer): TLevelBlock;
begin
  Result := TLevelBlock(inherited Items[Index]);
end;

function TBlockList.Last: TLevelBlock;
begin
  result := TLevelBlock(inherited Last);
end;

procedure TBlockList.SetBlockItem(Index: Integer;
  const Value: TLevelBlock);
begin
  inherited Items[Index] := Value;
end;

procedure TBlockList.Add(pNewItem : TLevelBlock);
begin
  inherited Add(pNewItem);
end;

{ TLevelBlock }

procedure TLevelBlock.CalculateOffsetFromPointer;
var
  LevelPointer : Integer;
begin

  // Now we work out where the pointer leads to.
  LevelPointer := StrToInt('$' + IntToHex(ROM[self._PointerOffset + 1],2) + IntToHex(ROM[self._PointerOffset],2));

  // Now we subtract $8000 from the pointer, subtract $10
  // from the offset, divide the offset of the pointer by $4000
  // then multiply it by $4000 and add $10. This should work out the
  // precise address of the stairs. Hopefully. :)
  self._Offset := (LevelPointer - $8000) + (((self._PointerOffset - $10) div $4000) * $4000 + $10);
end;

function TLevelBlock.GetBlockLength: byte;
begin
  result := ROM[self._Offset];
end;

function TLevelBlock.GetTime: Integer;
begin
  result := ROM[self._TimeOffset] shr 4;
end;

procedure TLevelBlock.LoadBGPalSetup;
begin
  self._BGPalType := ROM[self._BGPalSetupOffset];
end;

procedure TLevelBlock.LoadBGPattern;
begin
  self._BGPatternTable2 := ROM[self._BGPatternTableOffset];
  self._BGPatternTable3 := ROM[self._BGPatternTableOffset + 1];
end;

procedure TLevelBlock.LoadSprPalSetup;
begin
  self._SprPalType := ROM[self._SprPalSetupOffset];
end;

procedure TLevelBlock.LoadSprPattern;
begin
  self._SprPatternTableSecondQuest := ROM[self._BGPatternTableOffset +2];
  self._SprPatternTable2 := ROM[self._SprPatternTableOffset];
  self._SprPatternTable3 := ROM[self._SprPatternTableOffset + 1];   
end;

procedure TLevelBlock.SaveBGPalSetup;
begin
  ROM[self._BGPalSetupOffset] := self._BGPalType;
end;

procedure TLevelBlock.SaveBGPattern;
begin
  ROM[self._BGPatternTableOffset] := self._BGPatternTable2;
  ROM[self._BGPatternTableOffset+1] := self._BGPatternTable3;
end;

procedure TLevelBlock.SaveSprPalSetup;
begin
  ROM[self._SprPalSetupOffset] := self._SprPalType;
end;

procedure TLevelBlock.SaveSprPattern;
begin
  ROM[self._BGPatternTableOffset +2] := self._SprPatternTableSecondQuest;
  ROM[self._SprPatternTableOffset] := self._SprPatternTable2;
  ROM[self._SprPatternTableOffset + 1] := self._SprPatternTable3;
end;

procedure TLevelBlock.SetBlockLength(const Value: byte);
begin
  ROM[self._Offset] := Value;
end;



{ TLevel }

procedure TLevel.LoadCHRSwitchingData;
begin
  if self._CHRSwitchOffset > 0 then
  begin
    self._CHRSwitchSpeed := ROM[self._CHRSwitchOffset];
    self._CHRSwitch1 := ROM[self._CHRSwitchOffset + 1];
    self._CHRSwitch2 := ROM[self._CHRSwitchOffset + 2];
    self._CHRSwitch3 := ROM[self._CHRSwitchOffset + 3];
  end;
end;

procedure TLevel.SaveCHRSwitchingData;
begin
  if self._CHRSwitchOffset > 0 then
  begin
    ROM[self._CHRSwitchOffset] := self._CHRSwitchSpeed;
    ROM[self._CHRSwitchOffset + 1] := self._CHRSwitch1;
    ROM[self._CHRSwitchOffset + 2] := self._CHRSwitch2;
    ROM[self._CHRSwitchOffset + 3] := self._CHRSwitch3;
  end;
end;

destructor TLevel.Destroy;
begin
  FreeAndNil(self.Blocks);

  inherited;
end;

destructor TLevelBlock.Destroy;
begin
  FreeAndNil(Stairs);
  FreeAndNil(Entrance);
  FreeAndNil(Doors);
  FreeAndNil(VerticalEnemies);
  FreeAndNil(SpecialObjects);
  FreeAndNil(EnemyData);
  FreeAndNil(Properties);
  inherited;
end;

procedure TLevelBlock.SaveDoorsData();
begin
  if (_DoorOffset > 0) and (Assigned(Doors) = True) then
  begin
    ROM[_DoorOffset] := Doors.ScreenNumber;
    ROM[_DoorOffset + 1] := Doors.Direction;
    ROM[_DoorOffset + 2] := Doors.Y1 + $20;
    ROM[_DoorOffset + 3] := Doors.Y2 + $20;
  end;
end;


function TLevelBlock.StairPointer : String;
begin
  result := IntToHex(ROM.PointerToOffset(self._StairPointer),2);
end;

function TLevelBlock.BlockPointer : String;
begin
  result := IntToHex(ROM.PointerToOffset(self._PointerOffset),2);
end;

function TLevelBlock.EnemyPointer : String;
begin
{  ROM.ReturnOffsetPointerStr()
  result := IntToHex(ROM.ReturnPointerOffset(self._EnemyOffset),2);}
  result := ROM.OffsetToPointerS(self._EnemyOffset,$8000);
end;
{ TLevelList }

function TLevelList.GetLevelItem(Index: Integer): TLevel;
begin
  Result := TLevel(inherited Items[Index]);
end;

function TLevelList.Last: TLevel;
begin
  result := TLevel(inherited Last);
end;

procedure TLevelList.SetLevelItem(Index: Integer; const Value: TLevel);
begin
  inherited Items[Index] := Value;
end;

procedure TLevelList.Add(pNewItem : TLevel);
begin
  inherited Add(pNewItem);
end;

end.
