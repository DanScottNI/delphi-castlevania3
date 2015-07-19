unit cMisc;

interface

uses SysUtils;

type
  TDamage = class
  private
    _TrevorOffset : Integer;
    _GrantOffset : Integer;
    _SyphaOffset : Integer;
    _AlucardOffset : Integer;
    _DamageScheme1Offset : Integer;
    _DamageScheme2Offset : Integer;
    function GetAlucardOffset: Integer;
    function GetGrantOffset: Integer;
    function GetSyphaOffset: Integer;
    function GetTrevorOffset: Integer;
    function GetDamageScheme1Data(index: Integer): Byte;
    function GetDamageScheme2Data(index: Integer): Byte;

    procedure SetAlucardOffset(const Value: Integer);
    procedure SetGrantOffset(const Value: Integer);
    procedure SetSyphaOffset(const Value: Integer);
    procedure SetTrevorOffset(const Value: Integer);
    procedure SetDamageScheme1Data(index: Integer; const Value: Byte);
    procedure SetDamageScheme2Data(index: Integer; const Value: Byte);
  public
    property TrevorPointerOffset : Integer read _TrevorOffset write _TrevorOffset;
    property GrantPointerOffset : Integer read _GrantOffset write _GrantOffset;
    property SyphaPointerOffset : Integer read _SyphaOffset write _SyphaOffset;
    property AlucardPointerOffset : Integer read _AlucardOffset write _AlucardOffset;
    property TrevorOffset : Integer read GetTrevorOffset write SetTrevorOffset;
    property GrantOffset : Integer read GetGrantOffset write SetGrantOffset;
    property SyphaOffset : Integer read GetSyphaOffset write SetSyphaOffset;
    property AlucardOffset : Integer read GetAlucardOffset write SetAlucardOffset;
    property DamageScheme1Offset : Integer read _DamageScheme1Offset write _DamageScheme1Offset;
    property DamageScheme2Offset : Integer read _DamageScheme2Offset write _DamageScheme2Offset;
    property DamageScheme1ROM [index : Integer] : Byte read GetDamageScheme1Data write SetDamageScheme1Data;
    property DamageScheme2ROM [index : Integer] : Byte read GetDamageScheme2Data write SetDamageScheme2Data;
    procedure SwitchCharacterPointer(pCharIndex : Integer);
  end;

implementation

uses uROM;

{ TDamage }

function TDamage.GetAlucardOffset: Integer;
begin
  result := ROM.PointerToOffset(_AlucardOffset);
end;

function TDamage.GetDamageScheme1Data(index: Integer): Byte;
begin
  result := ROM[self._DamageScheme1Offset + index];
end;

function TDamage.GetDamageScheme2Data(index: Integer): Byte;
begin
  result := ROM[self._DamageScheme2Offset + index];
end;

function TDamage.GetGrantOffset: Integer;
begin
  result := ROM.PointerToOffset(_GrantOffset);
end;

function TDamage.GetSyphaOffset: Integer;
begin
  result := ROM.PointerToOffset(_SyphaOffset);
end;

function TDamage.GetTrevorOffset: Integer;
begin
  result := ROM.PointerToOffset(_TrevorOffset);

end;

procedure TDamage.SetAlucardOffset(const Value: Integer);
var
  TempInt : Integer;
begin
  TempInt := (Value  - $38010) + $8000;

  ROM[self._AlucardOffset] := StrToInt('$' + Copy(IntToHex(TempInt,4),3,2));
  ROM[self._AlucardOffset+1] := StrToInt('$' + Copy(IntToHex(TempInt,4),1,2));
end;

procedure TDamage.SetDamageScheme1Data(index: Integer; const Value: Byte);
begin
  ROM[self._DamageScheme1Offset + index] := Value;
end;

procedure TDamage.SetDamageScheme2Data(index: Integer; const Value: Byte);
begin
  ROM[self._DamageScheme2Offset + index] := Value;
end;

procedure TDamage.SetGrantOffset(const Value: Integer);
var
  TempInt : Integer;
begin
  TempInt := (Value  - $38010) + $8000;
  ROM[self._GrantOffset] := StrToInt('$' + Copy(IntToHex(TempInt,4),3,2));
  ROM[self._GrantOffset+1] := StrToInt('$' + Copy(IntToHex(TempInt,4),1,2));
end;

procedure TDamage.SetSyphaOffset(const Value: Integer);
var
  TempInt : Integer;
begin
  TempInt := (Value  - $38010) + $8000;
  ROM[self._SyphaOffset] := StrToInt('$' + Copy(IntToHex(TempInt,4),3,2));
  ROM[self._SyphaOffset+1] := StrToInt('$' + Copy(IntToHex(TempInt,4),1,2));
end;

procedure TDamage.SetTrevorOffset(const Value: Integer);
var
  TempInt : Integer;
begin
  TempInt := (Value  - $38010) + $8000;
  ROM[self._TrevorOffset] := StrToInt('$' + Copy(IntToHex(TempInt,4),3,2));
  ROM[self._TrevorOffset+1] := StrToInt('$' + Copy(IntToHex(TempInt,4),1,2));
end;

procedure TDamage.SwitchCharacterPointer(pCharIndex: Integer);
begin
  // Trevor
  if pCharIndex = 0 then
  begin
    if self.TrevorOffset = self._DamageScheme1Offset then
      self.TrevorOffset := self._DamageScheme2Offset
    else if self.TrevorOffset = self._DamageScheme2Offset then
      self.TrevorOffset := self._DamageScheme1Offset;
  end
  // Grant
  else if pCharIndex = 1 then
  begin
    if self.GrantOffset = self._DamageScheme1Offset then
      self.GrantOffset := self._DamageScheme2Offset
    else if self.GrantOffset = self._DamageScheme2Offset then
      self.GrantOffset := self._DamageScheme1Offset;
  end
  // Sypha
  else if pCharIndex = 2 then
  begin
    if self.SyphaOffset = self._DamageScheme1Offset then
      self.SyphaOffset := self._DamageScheme2Offset
    else if self.SyphaOffset = self._DamageScheme2Offset then
      self.SyphaOffset := self._DamageScheme1Offset;
  end
  // Alucard
  else if pCharIndex = 3 then
  begin
    if self.AlucardOffset = self._DamageScheme1Offset then
      self.AlucardOffset := self._DamageScheme2Offset
    else if self.AlucardOffset = self._DamageScheme2Offset then
      self.AlucardOffset := self._DamageScheme1Offset;
  end
end;


end.
