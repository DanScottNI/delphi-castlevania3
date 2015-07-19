unit cEnemy;

interface

uses contnrs;

type
  TVerticalEnemy = class
  private
    _ScreenNumber : Byte;
    _Y : SmallInt;
    _EnType : Byte;
    _X : SmallInt;
    _Item : Byte;
    _Unknown : Byte;
    _Direction : Byte;
  public
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property X : SmallInt read _X write _X;
    property EnType : Byte read _EnType write _EnType;
    property Y : SmallInt read _Y write _Y;
    property Item : Byte read _Item write _Item;
    property Unknown : Byte read _Unknown write _Unknown;
    property Direction : Byte read _Direction write _Direction;
  end;

  { This is a class that will be used to store the
    vertical enemies. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TVerticalEnemyList = class(TObjectList)
  protected
    function GetVerticalEnemyItem(Index: Integer) : TVerticalEnemy;
    procedure SetVerticalEnemyItem(Index: Integer; const Value: TVerticalEnemy);
  public
    function Last : TVerticalEnemy;
    property Items[Index: Integer] : TVerticalEnemy read GetVerticalEnemyItem write SetVerticalEnemyItem;default;
  end;

  // This class stores the global candle data i.e. which byte corresponds to which candle.
  TGlobalCandle = class
  private
    _CandleType : Byte;
    _CandleDropItem : Byte;
    _X : Byte;
    _Y : Byte;
  public
    property CandleType : byte read _CandleType write _CandleType;
    property DropItem : Byte read _CandleDropItem write _CandleDropItem;
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
  end;
    { This is a class that will be used to store the
    global enemies. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TGlobalCandleList = class(TObjectList)
  protected
    function GetItem(Index: Integer) : TGlobalCandle;
    procedure SetItem(Index: Integer; const Value: TGlobalCandle);
  public
    function Last : TGlobalCandle;
    property Items[Index: Integer] : TGlobalCandle read GetItem write SetItem;default;
  end;

  // This class stores the global enemy data.
  TGlobalEnemy = class
  private
    _ID : Byte;
    _X : Byte;
    _Y : Byte;
    _Unknown1 : Byte;
    _Unknown2 : Byte;
  public
    property ID : Byte read _ID write _ID;
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
    property Unknown1 : Byte read _Unknown1 write _Unknown1;
    property Unknown2 : Byte read _Unknown2 write _Unknown2;
  end;

    { This is a class that will be used to store the
    global enemies. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TGlobalEnemyList = class(TObjectList)
  protected
    function GetItem(Index: Integer) : TGlobalEnemy;
    procedure SetItem(Index: Integer; const Value: TGlobalEnemy);
  public
    function Last : TGlobalEnemy;
    property Items[Index: Integer] : TGlobalEnemy read GetItem write SetItem;default;
  end;

implementation

uses uROM;

{ TVerticalEnemyList }

function TVerticalEnemyList.GetVerticalEnemyItem(
  Index: Integer): TVerticalEnemy;
begin
  Result := TVerticalEnemy(inherited Items[Index]);
end;

function TVerticalEnemyList.Last: TVerticalEnemy;
begin
  result := TVerticalEnemy(inherited Last);
end;

procedure TVerticalEnemyList.SetVerticalEnemyItem(Index: Integer;
  const Value: TVerticalEnemy);
begin
  inherited Items[Index] := Value;
end;

{ TGlobalCandleList }

function TGlobalCandleList.GetItem(Index: Integer): TGlobalCandle;
begin
  Result := TGlobalCandle(inherited Items[Index]);
end;

function TGlobalCandleList.Last: TGlobalCandle;
begin
  result := TGlobalCandle(inherited Last);
end;

procedure TGlobalCandleList.SetItem(Index: Integer;const Value: TGlobalCandle);
begin
  inherited Items[Index] := Value;
end;

{ TGlobalEnemyList }

function TGlobalEnemyList.GetItem(Index: Integer): TGlobalEnemy;
begin
  Result := TGlobalEnemy(inherited Items[Index]);
end;

function TGlobalEnemyList.Last: TGlobalEnemy;
begin
  result := TGlobalEnemy(inherited Last);
end;

procedure TGlobalEnemyList.SetItem(Index: Integer;const Value: TGlobalEnemy);
begin
  inherited Items[Index] := Value;
end;

end.
