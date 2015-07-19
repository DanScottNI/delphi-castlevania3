unit uLunarcompress;

interface
  uses forms, windows;

  function LunarIPSCreate(hwnd : Hwnd; IPSFileName : PChar; ROMFileName : PChar; ROM2FileName : PChar;  Flags : LongWord) : longint;stdcall;
implementation

  function LunarIPSCreate; external 'Lunar Compress.dll';

end.
