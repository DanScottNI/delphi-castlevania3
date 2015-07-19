unit fTSA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, GR32, GR32_Layers, GR32_Image;

type
  TfrmTSAEditor = class(TForm)
    imgTSA: TImage32;
    procedure FormShow(Sender: TObject);
    procedure imgTSAMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    TileX, TileY : Integer;
    { Private declarations }
  public
    procedure DrawPatternTable;  
    { Public declarations }
  end;

var
  frmTSAEditor: TfrmTSAEditor;

implementation

uses uGlobal,fSire, fTileEditor;

{$R *.dfm}

procedure TfrmTSAEditor.DrawPatternTable();
var
  TSA : TBitmap32;
begin
  TSA := TBitmap32.Create;
  try
    TSA.Width := 128;
    TSA.Height := 128;
    ROMData.DrawPatternTable(TSA,EditorConfig.LastPaletteTSA);
    TSA.FrameRectS(TileX,TileY,TileX+8,TileY + 8,clRed32);
    imgTSA.Bitmap := TSA;
  finally
    FreeAndNil(TSA);
  end;
end;

procedure TfrmTSAEditor.FormShow(Sender: TObject);
begin
  DrawPatternTable();
  TfrmSireMain(Owner).CurTSABlock := 0;
end;

procedure TfrmTSAEditor.imgTSAMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  Tile : Integer;
  TilEd : Tfrm8x8TileEditor;
begin
  if (Button = mbMiddle) or ((ssShift in Shift) and (Button = mbLeft)) then
  begin
    Tile := ((y div 16) * 16 * 16) + ((X div 16) * 16);
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
    //showmessage(IntToStr(Y));
    TfrmSireMain(Owner).CurTSABlock := Tile div 16;
    TilEd := Tfrm8x8TileEditor.Create(self);
    try
      TilEd.TileID := TfrmSireMain(Owner).CurTSABlock;
      DrawPatternTable();
      TilEd.ShowModal;
      if TilEd.ModalResult = mrOK then
      begin
        DrawPatternTable();
        ROMData.SavePatternTable();
        TfrmSireMain(Owner).RedrawScreen;
        TfrmSireMain(Owner).UpdateTitleCaption;
      end;
    finally
      FreeAndNil(TilEd);
    end;
  end
  else if button = mbLeft then
  begin
    Tile := ((y div 16) * 16 * 16) + ((X div 16) * 16);
    TileX := (X div 16) * 8;
    TileY := (y div 16) * 8;
    //showmessage(IntToStr(Y));
    TfrmSireMain(Owner).CurTSABlock := Tile div 16;
  end
  else if button = mbRight then
  begin
    if EditorConfig.LastPaletteTSA = 3 then
      EditorConfig.LastPaletteTSA := 0
    else
      EditorConfig.LastPaletteTSA := EditorConfig.LastPaletteTSA + 1;
  end;
  DrawPatternTable();

end;

procedure TfrmTSAEditor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  TfrmSireMain(Owner).CurTSABlock := -1;
  Action := caFree;
end;

end.
