unit fPalette;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32,GR32_Image, GR32_Layers, ComCtrls;

type
  TfrmPaletteEditor = class(TForm)
    lbl000F: TLabel;
    lbl101F: TLabel;
    lbl202F: TLabel;
    lbl303F: TLabel;
    lblCurrentPalette: TLabel;
    imgNESColours: TImage32;
    cmdOK: TButton;
    cmdCancel: TButton;
    pgcPalettes: TPageControl;
    tshBGPalettes: TTabSheet;
    tshSprPalettes: TTabSheet;
    imgBGPal1: TImage32;
    imgBGPal2: TImage32;
    imgBGPal3: TImage32;
    imgBGPal4: TImage32;
    lblBGPalType: TLabel;
    cbBGPalType: TComboBox;
    lblSprPalType: TLabel;
    cbSprPalType: TComboBox;
    imgSprPal1: TImage32;
    imgSprPal2: TImage32;
    imgSprPal3: TImage32;
    lblPalettes: TLabel;
    lblBGNotice: TLabel;
    lblSprPal: TLabel;
    lblCharacterPalettes: TLabel;
    imgTrevorPal: TImage32;
    imgGrantPal: TImage32;
    imgSyphaPal: TImage32;
    imgAlucardPal: TImage32;
    lblTrevorPal: TLabel;
    lblGrantPal: TLabel;
    lblSyphaPal: TLabel;
    lblAlucardPal: TLabel;
    tshPrayingIntro: TTabSheet;
    imgPraIntBG1: TImage32;
    imgPraIntBG2: TImage32;
    imgPraIntBG3: TImage32;
    imgPraIntBG4: TImage32;
    imgPraIntSpr1: TImage32;
    imgPraIntSpr2: TImage32;
    imgPraIntSpr3: TImage32;
    imgPraIntSpr4: TImage32;
    lblPrayIntroNotice: TLabel;
    lblSpriteNotice: TLabel;
    procedure FormShow(Sender: TObject);
    procedure imgNESColoursMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer; Layer: TCustomLayer);
    procedure imgNESColoursMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgBGPal1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgBGPal2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgBGPal3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgBGPal4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure imgSprPal1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSprPal3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgTrevorPalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgGrantPalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgSyphaPalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgAlucardPalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure cbBGPalTypeChange(Sender: TObject);
    procedure cbSprPalTypeChange(Sender: TObject);
    procedure imgPraIntBG1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntBG2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntBG3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntBG4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntSpr1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntSpr2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntSpr3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
    procedure imgPraIntSpr4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
  private
    TileX, TileY : Integer;
    CurColour : Byte;  
    procedure DrawNESColours;
    procedure DisplayBGPalette;
    procedure DisplaySprPalette;
    procedure DisplayPrayingIntroPalette;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPaletteEditor: TfrmPaletteEditor;

implementation

uses uGlobal, fSire,uResourcestrings;

{$R *.dfm}

procedure TfrmPaletteEditor.DrawNESColours();
var
  i,x : Integer;
  TempBitmap : TBitmap32;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Width := 287;
    TempBitmap.Height := 74;

    for i := 0 to 3 do
      for x :=0 to 15 do
        TempBitmap.FillRect(x*18,i*18 + 1,(x*18)+17,i*18+18,ROMData.ReturnNESPal((i*16) + x));

    tempbitmap.Line(0,0,0,74, clBlack32);


    if TileX = 0 then
      TempBitmap.FrameRectS(TileX,TileY,TileX+18,TileY+19,clRed32)

    else
      TempBitmap.FrameRectS(TileX-1,TileY,TileX+18,TileY+19,clRed32);

    imgNESColours.Bitmap := TempBitmap;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmPaletteEditor.DisplayPrayingIntroPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;

      imgPraIntBG1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntBG1.Hint := imgPraIntBG1.Hint + '$' + IntToHex(ROMData.PrayingPalette[0,i],2)  + ' ';
      end;
      imgPraIntBG1.Hint := TrimRight(imgPraIntBG1.Hint);
      imgPraIntBG1.Bitmap := TempBitmap;


      imgPraIntBG2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntBG2.Hint := imgPraIntBG2.Hint + '$' + IntToHex(ROMData.PrayingPalette[1,i],2)  + ' ';
      end;
      imgPraIntBG2.Hint := TrimRight(imgPraIntBG2.Hint);
      imgPraIntBG2.Bitmap := TempBitmap;

      imgPraIntBG3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntBG3.Hint := imgPraIntBG3.Hint + '$' + IntToHex(ROMData.PrayingPalette[2,i],2)  + ' ';
      end;
      imgPraIntBG3.Hint := TrimRight(imgPraIntBG3.Hint);
      imgPraIntBG3.Bitmap := TempBitmap;

      imgPraIntBG4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntBG4.Hint := imgPraIntBG4.Hint + '$' + IntToHex(ROMData.PrayingPalette[3,i],2)  + ' ';
      end;
      imgPraIntBG4.Hint := TrimRight(imgPraIntBG4.Hint);
      imgPraIntBG4.Bitmap := TempBitmap;

      imgPraIntSpr1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[4,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntSpr1.Hint := imgPraIntSpr1.Hint + '$' + IntToHex(ROMData.PrayingPalette[4,i],2)  + ' ';
      end;
      imgPraIntSpr1.Hint := TrimRight(imgPraIntSpr1.Hint);
      imgPraIntSpr1.Bitmap := TempBitmap;

      imgPraIntSpr2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[5,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntSpr2.Hint := imgPraIntSpr2.Hint + '$' + IntToHex(ROMData.PrayingPalette[5,i],2)  + ' ';
      end;
      imgPraIntSpr2.Hint := TrimRight(imgPraIntSpr2.Hint);
      imgPraIntSpr2.Bitmap := TempBitmap;

      imgPraIntSpr3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[6,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntSpr3.Hint := imgPraIntSpr3.Hint + '$' + IntToHex(ROMData.PrayingPalette[6,i],2)  + ' ';
      end;
      imgPraIntSpr3.Hint := TrimRight(imgPraIntSpr3.Hint);
      imgPraIntSpr3.Bitmap := TempBitmap;

      imgPraIntSpr4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.PrayingPalette[7,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgPraIntSpr4.Hint := imgPraIntSpr4.Hint + '$' + IntToHex(ROMData.PrayingPalette[7,i],2)  + ' ';
      end;
      imgPraIntSpr4.Hint := TrimRight(imgPraIntSpr4.Hint);
      imgPraIntSpr4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;


end;

procedure TfrmPaletteEditor.DisplaySprPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  cbSprPalType.ItemIndex := ROMData.CurrentBlock.SprPalType;
  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;
      imgSprPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[4,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal1.Hint := imgSprPal1.Hint + '$' + IntToHex(ROMData.Palette[4,i],2)  + ' ';
      end;
      imgSprPal1.Hint := TrimRight(imgSprPal1.Hint);
      imgSprPal1.Bitmap := TempBitmap;

      imgSprPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[5,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal2.Hint := imgSprPal2.Hint + '$' + IntToHex(ROMData.Palette[5,i],2)  + ' ';
      end;
      imgSprPal2.Hint := TrimRight(imgSprPal2.Hint);
      imgSprPal2.Bitmap := TempBitmap;

      imgSprPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[6,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSprPal3.Hint := imgSprPal3.Hint + '$' + IntToHex(ROMData.Palette[6,i],2)  + ' ';
      end;
      imgSprPal3.Hint := TrimRight(imgSprPal3.Hint);
      imgSprPal3.Bitmap := TempBitmap;

      imgTrevorPal.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[7,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgTrevorPal.Hint := imgTrevorPal.Hint + '$' + IntToHex(ROMData.Palette[7,i],2)  + ' ';
      end;
      imgTrevorPal.Hint := TrimRight(imgTrevorPal.Hint);
      imgTrevorPal.Bitmap := TempBitmap;

      imgGrantPal.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[8,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgGrantPal.Hint := imgGrantPal.Hint + '$' + IntToHex(ROMData.Palette[8,i],2)  + ' ';
      end;
      imgGrantPal.Hint := TrimRight(imgGrantPal.Hint);
      imgGrantPal.Bitmap := TempBitmap;

      imgSyphaPal.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[9,i]));
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgSyphaPal.Hint := imgSyphaPal.Hint + '$' + IntToHex(ROMData.Palette[9,i],2)  + ' ';
      end;
      imgSyphaPal.Hint := TrimRight(imgSyphaPal.Hint);
      imgSyphaPal.Bitmap := TempBitmap;

      imgAlucardPal.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[10,i]));
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgAlucardPal.Hint := imgAlucardPal.Hint + '$' + IntToHex(ROMData.Palette[10,i],2)  + ' ';
      end;
      imgAlucardPal.Hint := TrimRight(imgAlucardPal.Hint);
      imgAlucardPal.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;

end;

procedure TfrmPaletteEditor.DisplayBGPalette();
var
  TempBitmap : TBitmap32;
  i : Integer;
begin
  cbBGPalType.ItemIndex := ROMData.CurrentBlock.BGPalType;

  TempBitmap := TBitmap32.Create;
  try
    with TempBitmap do
    begin
      Width := 100;
      Height := 25;
      imgBGPal1.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[0,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgBGPal1.Hint := imgBGPal1.Hint + '$' + IntToHex(ROMData.Palette[0,i],2)  + ' ';
      end;
      imgBGPal1.Hint := TrimRight(imgBGPal1.Hint);
      imgBGPal1.Bitmap := TempBitmap;


      imgBGPal2.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[1,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgBGPal2.Hint := imgBGPal2.Hint + '$' + IntToHex(ROMData.Palette[1,i],2)  + ' ';
      end;
      imgBGPal2.Hint := TrimRight(imgBGPal2.Hint);
      imgBGPal2.Bitmap := TempBitmap;

      imgBGPal3.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[2,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgBGPal3.Hint := imgBGPal3.Hint + '$' + IntToHex(ROMData.Palette[2,i],2)  + ' ';
      end;
      imgBGPal3.Hint := TrimRight(imgBGPal3.Hint);
      imgBGPal3.Bitmap := TempBitmap;

      imgBGPal4.Hint := '';
      for i := 0 to 3 do
      begin
        FillRect(i * 25,0,i *25 + 25,25, ROMData.ReturnNESPal(ROMData.Palette[3,i]) );
        FrameRectS(i * 25,0,i * 25 + 25,25,clBlack32);
        imgBGPal4.Hint := imgBGPal4.Hint + '$' + IntToHex(ROMData.Palette[3,i],2)  + ' ';
      end;
      imgBGPal4.Hint := TrimRight(imgBGPal4.Hint);
      imgBGPal4.Bitmap := TempBitmap;

    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;


procedure TfrmPaletteEditor.FormShow(Sender: TObject);
begin
  ROMData.LoadPrayingIntroPalette;
  DrawNESColours();
  DisplayBGPalette();
  DisplaySprPalette();
  DisplayPrayingIntroPalette();
end;

procedure TfrmPaletteEditor.imgNESColoursMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer; Layer: TCustomLayer);
begin
  lblCurrentPalette.Caption := CURRENTCOLOURPAL + IntToHex(((X div 18) + (Y div 18) * 16),2);
end;

procedure TfrmPaletteEditor.imgNESColoursMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  CurColour := ((X div 18) + (Y div 18) * 16);
  TileX := (X div 18) * 18;
  TileY := (y div 18) * 18;
  DrawNESColours();
end;

procedure TfrmPaletteEditor.imgBGPal1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[0, x div 25] := CurColour;
    DisplayBGPalette();
    TfrmSireMain(Owner).RedrawScreen();
  end;
end;

procedure TfrmPaletteEditor.imgBGPal2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[1, x div 25] := CurColour;
    DisplayBGPalette();
    TfrmSireMain(Owner).RedrawScreen();
  end;
end;

procedure TfrmPaletteEditor.imgBGPal3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[2, x div 25] := CurColour;
    DisplayBGPalette();
    TfrmSireMain(Owner).RedrawScreen();
  end;
end;

procedure TfrmPaletteEditor.imgBGPal4MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[3, x div 25] := CurColour;
    DisplayBGPalette();
    TfrmSireMain(Owner).RedrawScreen();
  end;
end;

procedure TfrmPaletteEditor.cmdCancelClick(Sender: TObject);
begin
  ROMData.CurrentBlock.LoadBGPalSetup;
  ROMData.CurrentBlock.LoadSprPalSetup;
  ROMData.LoadCurrentPalette;
  ROMData.LoadCharacterPalette;
  ROMData.LoadPrayingIntroPalette;
  TfrmSireMain(Owner).RedrawScreen;
end;

procedure TfrmPaletteEditor.cmdOKClick(Sender: TObject);
begin
  ROMData.SavePrayingIntroPalette;
  ROMData.SaveCurrentPalette;
  ROMData.SaveCharacterPalette;
end;

procedure TfrmPaletteEditor.imgSprPal1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[4, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.imgSprPal2MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[5, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.imgSprPal3MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[6, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.imgTrevorPalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[7, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.imgGrantPalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[8, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.imgSyphaPalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[9, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.imgAlucardPalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.Palette[10, x div 25] := CurColour;
    DisplaySprPalette();
  end;
end;

procedure TfrmPaletteEditor.cbBGPalTypeChange(Sender: TObject);
begin

  ROMData.CurrentBlock.BGPalType := cbBGPalType.ItemIndex;
  ROMData.LoadCurrentPalette;
  DisplayBGPalette();
  TfrmSireMain(Owner).RedrawScreen;
end;

procedure TfrmPaletteEditor.cbSprPalTypeChange(Sender: TObject);
begin
  ROMData.CurrentBlock.SprPalType := cbSprPalType.ItemIndex;
  ROMData.LoadCurrentPalette;
  DisplaySprPalette();
end;

procedure TfrmPaletteEditor.imgPraIntBG1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[0, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntBG2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[1, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntBG3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[2, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntBG4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[3, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntSpr1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
var
  i : Integer;
begin
  if x div 25 = 0 then
  begin
    for i := 0 to 7 do
      ROMData.PrayingPalette[i, 0] := CurColour;
    DisplayPrayingIntroPalette();      
  end
  else
  begin
    ROMData.PrayingPalette[4, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntSpr2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[5, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntSpr3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[6, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

procedure TfrmPaletteEditor.imgPraIntSpr4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer;
  Layer: TCustomLayer);
begin
  if x div 25 = 0 then
    showmessage(COLOURNOEDIT)
  else
  begin
    ROMData.PrayingPalette[7, x div 25] := CurColour;
    DisplayPrayingIntroPalette();
  end;
end;

end.
