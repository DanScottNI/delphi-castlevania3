unit cLevelObj;

interface

uses contnrs;

type

  TDoor = class
  private
    _Direction : Byte;
    _Y1 : Byte;
    _Y2 : Byte;
    _ScreenNumber : Byte;
  public
    property Direction : Byte read _Direction write _Direction;
    property Y1 : Byte read _Y1 write _Y1;
    property Y2 : Byte read _Y2 write _Y2;
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
  end;

  TEntrance = class
  private
    _Offset : Integer;
    _X : Integer;
    _Y : Byte;
    _ScreenNumber : Integer;
  public
    property Offset : Integer read _Offset write _Offset;
    property X : Integer read _X write _X;
    property Y : Byte read _Y write _Y;
    property ScreenNumber : Integer read _ScreenNumber write _ScreenNumber;
  end;

  TStair = class
  private
    _X : Byte;
    _Y : Byte;
    _Direction : Byte;
    _ScreenNumber : Byte;
    _UnknownData : Byte;
  public
    property X : Byte read _X write _X;
    property Y : Byte read _Y write _Y;
    property Direction : Byte read _Direction write _Direction;
    property ScreenNumber : Byte read _ScreenNumber write _ScreenNumber;
    property UnknownData : Byte read _UnknownData write _UnknownData;
  end;

  { This is a class that will be used to store the
    stairs. This is a descendant of the TObjectList class.
    The reason that I am not using a TObjectList, is that
    for every access, you have to explicitly cast your objects
    to their correct type.}
  TStairList = class(TObjectList)
  protected
    function GetStairItem(Index: Integer) : TStair;
    procedure SetStairItem(Index: Integer; const Value: TStair);
  public
    function Last : TStair;
    property Items[Index: Integer] : TStair read GetStairItem write SetStairItem;default;
  end;


implementation

{ TStairList }

function TStairList.GetStairItem(Index: Integer): TStair;
begin
  Result := TStair(inherited Items[Index]);
end;

function TStairList.Last: TStair;
begin
  result := TStair(inherited Last);
end;

procedure TStairList.SetStairItem(Index: Integer; const Value: TStair);
begin
  inherited Items[Index] := Value;
end;

end.
