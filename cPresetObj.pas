unit cPresetObj;

interface

  type
    TCog = class
    private
      _Type : Byte;
      _Screen : Byte;
      _Direction : Byte;
      _X : SmallInt;
      _Y : SmallInt;
    public
      property CogType : Byte read _Type write _Type;
      property Screen : Byte read _Screen write _Screen;
      property Direction : Byte read _Direction write _Direction;
      property X : SmallInt read _X write _X;
      property Y : SmallInt read _Y write _Y;
    end;

implementation

end.
