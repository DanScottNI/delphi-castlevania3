unit cSpecObj;

interface

uses contnrs;

type
  TFixedPos = class
  private
    _X : SmallInt;
    _Y : SmallInt;
    _Screen : Byte;
    _Misc : Array [0..7] of Byte;
  public
    property X : SmallInt read _X write _X;
    property Y : SmallInt read _Y write _Y;
    property Screen : Byte read _Screen write _Screen;
    property Misc1 : Byte read _Misc[0] write _Misc[0];
    property Misc2 : Byte read _Misc[1] write _Misc[1];
    property Misc3 : Byte read _Misc[2] write _Misc[2];
    property Misc4 : Byte read _Misc[3] write _Misc[3];
    property Misc5 : Byte read _Misc[4] write _Misc[4];
    property Misc6 : Byte read _Misc[5] write _Misc[5];
    property Misc7 : Byte read _Misc[6] write _Misc[6];
    property Misc8 : Byte read _Misc[7] write _Misc[7];
  end;

  TFixedPosList = class(TObjectList)
  protected
    function GetFixedPosItem(Index: Integer) : TFixedPos;
    procedure SetFixedPosItem(Index: Integer; const Value: TFixedPos);
  public
    function Last : TFixedPos;
    property Items[Index: Integer] : TFixedPos read GetFixedPosItem write SetFixedPosItem;default;
  end;

  TSpecialObjType = class
  private
    _Name : String;
    _PicID : Byte;
    // 0 = no, 1 = yes, 2=only allow vertical moving.
    _UsesFixedPos : Byte;
    _AvailableHorz : Boolean;
    _AvailableVert : Boolean;
    _NumFixedPos : SmallInt;
    _Style : Byte;
  public
    FixedPos : TFixedPosList;
    property Name : String read _Name write _Name;
    property ID : Byte read _PicID write _PicID;
    property UsesFixedPosition : Byte read _UsesFixedPos write _UsesFixedPos;
    property AvailableHorizontal : Boolean read _AvailableHorz write _AvailableHorz;
    property AvailableVertical : Boolean read _AvailableVert write _AvailableVert;
    property NumberOfFixedPositions : SmallInt read _NumFixedPos write _NumFixedPos;
    property Style : Byte read _Style write _Style;
  end;

  TSpecialObject = class
  private
    _ScreenNumber : Byte;
    _X : SmallInt;
    _Unknown1 : Byte;
    _ID : Byte;
    _Y : SmallInt;
    _Unknown2 : Byte;
    _Unknown3 : Byte;
    _Unknown4 : Byte;
    function GetHTileXOff: Integer;
    function GetHTileYOff: Integer;
    function GetVTileXOff: Integer;
    function GetVTileYOff: Integer;
    function GetXMinVTile : Byte;
    function GetXMinHTile : Byte;
    function GetYMinVTile : Byte;
    function GetYMinHTile : Byte;
  public
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property X : SmallInt read _X write _X;
    property Unknown1 : Byte read _Unknown1 write _Unknown1;
    property ID : Byte read _ID write _ID;
    property Y : SmallInt read _Y write _Y;
    property Unknown2 : Byte read _Unknown2 write _Unknown2;
    property Unknown3 : Byte read _Unknown3 write _Unknown3;
    property Unknown4 : Byte read _Unknown4 write _Unknown4;
    property XMinVTile : Byte read GetXMinVTile;
    property XMinHTile : Byte read GetXMinHTile;
    property YMinVTile : Byte read GetYMinVTile;
    property YMinHTile : Byte read GetYMinHTile;
    property VTileOffY : Integer read GetVTileYOff;
    property VTileOffX : Integer read GetVTileXOff;
    property HTileOffY : Integer read GetHTileYOff;
    property HTileOffX : Integer read GetHTileXOff;
  end;


  { This is a class that will be used to store the
    special objects. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TSpecialObjectList = class(TObjectList)
  protected
    function GetSpecialObjectItem(Index: Integer) : TSpecialObject;
    procedure SetSpecialObjectItem(Index: Integer; const Value: TSpecialObject);
  public
    function Last : TSpecialObject;
    property Items[Index: Integer] : TSpecialObject read GetSpecialObjectItem write SetSpecialObjectItem;default;
  end;


implementation

uses uROM,uConsts;


{ TSpecialObject }

function TSpecialObject.GetHTileXOff: Integer;
begin
  result := 0;
  if ID = uConsts.SPECOBJBREAKABLEBLOCK then
  begin
    result := 8;
  end
  else if ID = SPECOBJTRAPDOOR then
  begin
    result := 8;
  end
  else if ID = SPECOBJSMALLCOG then
  begin
    result := 8;
  end
  else if ID = SPECOBJLARGECOG then
  begin
    result := $8;
  end
  else if ID = SPECOBJTRAPDOORWITHSPIKES then
  begin
    result := $8;
  end
  else if ID = SPECOBJHORIZONTALPLATFORM then
  begin
    result := $0;
  end
  else if ID = SPECOBJVERTICALPLATFORM then
  begin
    result := $8;
  end
  else if ID = SPECOBJCRUSHER then
  begin
    result := $8;
  end
  else if ID = SPECOBJMOVINGSPIKES then
  begin
    result := $8;
  end
end;

function TSpecialObject.GetHTileYOff: Integer;
begin
  result := 0;
  if ID = SPECOBJBREAKABLEBLOCK then
  begin
    result := 40;
  end
  else if ID = SPECOBJTRAPDOOR then
  begin
    result := 36;
  end
  else if ID = SPECOBJSMALLCOG then
  begin
    result := 36;
  end
  else if ID = SPECOBJLARGECOG then
  begin
    result := $30;
  end
  else if ID = SPECOBJTRAPDOORWITHSPIKES then
  begin
    result := $28;
  end
  else if ID = SPECOBJHORIZONTALPLATFORM then
  begin
    result := $20;
  end
  else if ID = SPECOBJVERTICALPLATFORM then
  begin
    result := $28;
  end
end;

function TSpecialObject.GetVTileXOff: Integer;
begin
  result := 0;
  if ID = SPECOBJBREAKABLEBLOCK then
  begin
    result := 28;
  end
  else if ID = SPECOBJBREAKABLEBLOCKV then
  begin
    result := 8;
  end
  else if ID = SPECOBJTRAPDOOR then
  begin
    result := 8;
  end
  else if ID = SPECOBJSMALLCOG then
  begin
    result := 8;
  end
end;

function TSpecialObject.GetVTileYOff: Integer;
begin
  result := 0;
  if ID = SPECOBJBREAKABLEBLOCK then
  begin
    result := 0;
  end
  else if ID = SPECOBJBREAKABLEBLOCKV then
  begin
    result := 4;
  end
  else if ID = SPECOBJTRAPDOOR then
  begin
    result := 0;
  end
  else if ID = SPECOBJSMALLCOG then
  begin
    result := 4;
  end
end;

function TSpecialObject.GetXMinVTile : Byte;
begin
  result := self.Y - GetVTileXOff;
end;

function TSpecialObject.GetXMinHTile : Byte;
begin
  result := self.X - GetHTileXOff;
end;

function TSpecialObject.GetYMinVTile : Byte;
begin
  result := self.X - GetVTileYOff;
end;

function TSpecialObject.GetYMinHTile : Byte;
begin
  result := self.Y - GetHTileYOff;
end;

{ TSpecialObjectList }

function TSpecialObjectList.GetSpecialObjectItem(
  Index: Integer): TSpecialObject;
begin
  Result := TSpecialObject(inherited Items[Index]);
end;

function TSpecialObjectList.Last: TSpecialObject;
begin
  result := TSpecialObject(inherited Last);
end;

procedure TSpecialObjectList.SetSpecialObjectItem(Index: Integer;
  const Value: TSpecialObject);
begin
  inherited Items[Index] := Value;
end;

{ TFixedPosList }

function TFixedPosList.GetFixedPosItem(Index: Integer): TFixedPos;
begin
  Result := TFixedPos(inherited Items[Index]);
end;

function TFixedPosList.Last: TFixedPos;
begin
  result := TFixedPos(inherited Last);
end;

procedure TFixedPosList.SetFixedPosItem(Index: Integer;const Value: TFixedPos);
begin
  inherited Items[Index] := Value;
end;

end.
