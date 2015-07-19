unit fEnemyCandlePreview;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GR32_Image, GR32;

type
  TfrmEnemyCandlePreview = class(TForm)
    imgPreview: TImage32;
    procedure FormShow(Sender: TObject);
    procedure imgPreviewClick(Sender: TObject);
  private
    _X, _Y : SmallInt;
    _ID : Byte;
    procedure DrawPreview;
    { Private declarations }
  public
    property X : SmallInt read _X write _X;
    property Y : SmallInt read _Y write _Y;
    property ID : Byte read _ID write _ID;
    { Public declarations }
  end;

var
  frmEnemyCandlePreview: TfrmEnemyCandlePreview;

implementation

{$R *.dfm}

uses uGlobal;

procedure TfrmEnemyCandlePreview.DrawPreview;
var
  LevelBMP : TBitmap32;
  Numbers : TBitmap32;
begin
  LevelBMP := TBitmap32.Create;
  try
    Numbers := TBitmap32.Create;
    Numbers.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\numbers.bmp');

    LevelBMP.Width := 256;
    LevelBMP.Height := 192;

    ROMData.DrawCurrentScreen(LevelBMP,nil,$0,-1,0);
    LevelBMP.Draw(bounds(_X,_Y,8,8),bounds(StrToInt('$' + IntToHex(_ID,2)[1]) * 8,0,8,8),Numbers);
    LevelBMP.Draw(bounds(_X+8,_Y,8,8),bounds(StrToInt('$' + IntToHex(_ID,2)[2]) * 8,0,8,8),Numbers);
    imgPreview.Bitmap := LevelBMP;
  finally
    FreeAndNil(Numbers);
    FreeAndNil(LevelBMP);
  end;
end;

procedure TfrmEnemyCandlePreview.FormShow(Sender: TObject);
begin
  DrawPreview;
end;

procedure TfrmEnemyCandlePreview.imgPreviewClick(Sender: TObject);
begin
  modalresult := mrOk;
end;

end.
