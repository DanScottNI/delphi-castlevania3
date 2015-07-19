unit fDamageSettings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GR32_Image, GR32;

type
  TfrmDamage = class(TForm)
    Bitmap32List: TBitmap32List;
    cmdOK: TButton;
    cmdCancel: TButton;
    lblStage1to3: TLabel;
    imgStage1to3: TImage32;
    imgStage4toC: TImage32;
    lblStage4toC: TLabel;
    lblStageDtoE: TLabel;
    lblMovingSpikes: TLabel;
    imgMovingSpikes: TImage32;
    imgStageDtoE: TImage32;
    lblDamageScheme: TLabel;
    cbDamageScheme: TComboBox;
    lstCharacters: TListBox;
    lblCharacters: TLabel;
    cmdSwitchSchemes: TButton;
    cmdStage1to3Down: TButton;
    cmdStage4toCDown: TButton;
    cmdStageDtoEDown: TButton;
    cmdMovingSpikesDown: TButton;
    cmdStage1to3Up: TButton;
    cmdStage4toCUp: TButton;
    cmdStageDtoEUp: TButton;
    cmdMovingSpikesUp: TButton;
    procedure FormShow(Sender: TObject);
    procedure cbDamageSchemeChange(Sender: TObject);
    procedure lstCharactersClick(Sender: TObject);
    procedure cmdSwitchSchemesClick(Sender: TObject);
    procedure cmdStage1to3DownClick(Sender: TObject);
    procedure cmdStage4toCDownClick(Sender: TObject);
    procedure cmdStageDtoEDownClick(Sender: TObject);
    procedure cmdMovingSpikesDownClick(Sender: TObject);
    procedure cmdStage1to3UpClick(Sender: TObject);
    procedure cmdStage4toCUpClick(Sender: TObject);
    procedure cmdStageDtoEUpClick(Sender: TObject);
    procedure cmdMovingSpikesUpClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
  private
    DamageSchemes : Array [0..1,0..15] of Byte;
    CharacterOffsets : Array [0..3] of Integer;
    procedure PopulateListbox;
    procedure DrawDamage;
    procedure LoadDamageSettings;
    procedure SaveDamageSettings;
    procedure LoadCharacterPointers;
    procedure SaveCharacterPointers;
    procedure SwitchCharacterPointer(pCharIndex: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDamage: TfrmDamage;

implementation

uses uGlobal, uResourcestrings;



{$R *.dfm}

procedure TfrmDamage.FormShow(Sender: TObject);
begin
  LoadCharacterPointers();
  LoadDamageSettings();
  PopulateListBox;
  DrawDamage();
end;

procedure TfrmDamage.LoadCharacterPointers();
begin
  CharacterOffsets[0] := ROMData.Damage.TrevorOffset;
  CharacterOffsets[1] := ROMData.Damage.GrantOffset;
  CharacterOffsets[2] := ROMData.Damage.SyphaOffset;
  CharacterOffsets[3] := ROMData.Damage.AlucardOffset;
end;

procedure TfrmDamage.SaveCharacterPointers();
begin
  ROMData.Damage.TrevorOffset := CharacterOffsets[0];
  ROMData.Damage.GrantOffset := CharacterOffsets[1];
  ROMData.Damage.SyphaOffset := CharacterOffsets[2];
  ROMData.Damage.AlucardOffset := CharacterOffsets[3];
end;

procedure TfrmDamage.LoadDamageSettings();
var
  i : Integer;
begin
  for i := 0 to 15 do
    DamageSchemes[0,i] := ROMData.Damage.DamageScheme1ROM[i];

  for i := 0 to 15 do
    DamageSchemes[1,i] := ROMData.Damage.DamageScheme2ROM[i];
end;

procedure TfrmDamage.SaveDamageSettings();
var
  i : Integer;
begin
  for i := 0 to 15 do
    ROMData.Damage.DamageScheme1ROM[i] := DamageSchemes[0,i];

  for i := 0 to 15 do
    ROMData.Damage.DamageScheme2ROM[i] := DamageSchemes[1,i];

end;

procedure TfrmDamage.PopulateListbox();
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    lstCharacters.Items.Clear;
    if CharacterOffsets[0] = ROMData.Damage.DamageScheme1Offset then
      lstCharacters.Items.Add(TREVORTEXT);
    if CharacterOffsets[1] = ROMData.Damage.DamageScheme1Offset then
      lstCharacters.Items.Add(GRANTTEXT);
    if CharacterOffsets[2] = ROMData.Damage.DamageScheme1Offset then
      lstCharacters.Items.Add(SYPHATEXT);
    if CharacterOffsets[3] = ROMData.Damage.DamageScheme1Offset then
      lstCharacters.Items.Add(ALUCARDTEXT);
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    lstCharacters.Items.Clear;
    if CharacterOffsets[0] = ROMData.Damage.DamageScheme2Offset then
      lstCharacters.Items.Add(TREVORTEXT);
    if CharacterOffsets[1] = ROMData.Damage.DamageScheme2Offset then
      lstCharacters.Items.Add(GRANTTEXT);
    if CharacterOffsets[2] = ROMData.Damage.DamageScheme2Offset then
      lstCharacters.Items.Add(SYPHATEXT);
    if CharacterOffsets[3] = ROMData.Damage.DamageScheme2Offset then
      lstCharacters.Items.Add(ALUCARDTEXT);
  end;
end;

procedure TfrmDamage.cbDamageSchemeChange(Sender: TObject);
begin
  PopulateListBox;
  cmdSwitchSchemes.Caption := SCHEMEGENERIC;
  DrawDamage();
end;

procedure TfrmDamage.lstCharactersClick(Sender: TObject);
begin
  if lstCharacters.Items[lstCharacters.ItemIndex] = TREVORTEXT then
    cmdSwitchSchemes.Caption := SCHEME + TREVORTEXT
  else if lstCharacters.Items[lstCharacters.ItemIndex] = ALUCARDTEXT then
    cmdSwitchSchemes.Caption := SCHEME + ALUCARDTEXT
  else if lstCharacters.Items[lstCharacters.ItemIndex] = GRANTTEXT then
    cmdSwitchSchemes.Caption := SCHEME + GRANTTEXT
  else if lstCharacters.Items[lstCharacters.ItemIndex] = SYPHATEXT then
    cmdSwitchSchemes.Caption := SCHEME + SYPHATEXT;
end;

procedure TfrmDamage.DrawDamage();
var
  TempBitmap : TBitmap32;
  i : Integer;
  TempDam : Byte;
begin
  TempBitmap := TBitmap32.Create;
  try
    TempBitmap.Height := 12;
    TempBitmap.Width := 96;
    if cbDamageScheme.ItemIndex = 0 then
    begin
      TempDam := DamageSchemes[0,1];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgStage1to3.Bitmap := TempBitmap;


      TempDam := DamageSchemes[0,2];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgStage4toC.Bitmap := TempBitmap;

      TempDam := DamageSchemes[0,3];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgStageDtoE.Bitmap := TempBitmap;

      TempDam := DamageSchemes[0,7];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgMovingSpikes.Bitmap := TempBitmap;
    end
    else if cbDamageScheme.ItemIndex = 1 then
    begin
      TempDam := DamageSchemes[1,1];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgStage1to3.Bitmap := TempBitmap;


      TempDam := DamageSchemes[1,2];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgStage4toC.Bitmap := TempBitmap;

      TempDam := DamageSchemes[1,3];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgStageDtoE.Bitmap := TempBitmap;

      TempDam := DamageSchemes[1,7];

      if TempDam > 0 then
        inc(TempDam);

      for i := 0 to 15 - TempDam do
        tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[0]);
      if TempDam > 0 then
        for i := 16 - TempDam to 15 do
          tempBitmap.Draw(i*5,0,Bitmap32List.Bitmap[1]);

      imgMovingSpikes.Bitmap := TempBitmap;
    end;
  finally
    FreeAndNil(TempBitmap);
  end;
end;

procedure TfrmDamage.cmdSwitchSchemesClick(Sender: TObject);
begin
  if cmdSwitchSchemes.Caption = SCHEMEGENERIC then exit;

  if lstCharacters.Items.Count = 0 then exit;

  if lstCharacters.Items[lstCharacters.ItemIndex] = TREVORTEXT then
    SwitchCharacterPointer(0)
  else if lstCharacters.Items[lstCharacters.ItemIndex] = ALUCARDTEXT then
    SwitchCharacterPointer(3)
  else if lstCharacters.Items[lstCharacters.ItemIndex] = GRANTTEXT then
    SwitchCharacterPointer(1)
  else if lstCharacters.Items[lstCharacters.ItemIndex] = SYPHATEXT then
    SwitchCharacterPointer(2);
  cmdSwitchSchemes.Caption := SCHEMEGENERIC;
  PopulateListBox;
end;

procedure TfrmDamage.SwitchCharacterPointer(pCharIndex: Integer);
begin
  // Trevor
  if pCharIndex = 0 then
  begin
    if CharacterOffsets[0] = ROMData.Damage.DamageScheme1Offset then
      CharacterOffsets[0] := ROMData.Damage.DamageScheme2Offset
    else if CharacterOffsets[0] = ROMData.Damage.DamageScheme2Offset then
      CharacterOffsets[0] := ROMData.Damage.DamageScheme1Offset;
  end
  // Grant
  else if pCharIndex = 1 then
  begin
    if CharacterOffsets[1] = ROMData.Damage.DamageScheme1Offset then
      CharacterOffsets[1] := ROMData.Damage.DamageScheme2Offset
    else if CharacterOffsets[1] = ROMData.Damage.DamageScheme2Offset then
      CharacterOffsets[1] := ROMData.Damage.DamageScheme1Offset;
  end
  // Sypha
  else if pCharIndex = 2 then
  begin
    if CharacterOffsets[2] = ROMData.Damage.DamageScheme1Offset then
      CharacterOffsets[2] := ROMData.Damage.DamageScheme2Offset
    else if CharacterOffsets[2] = ROMData.Damage.DamageScheme2Offset then
      CharacterOffsets[2] := ROMData.Damage.DamageScheme1Offset;
  end
  // Alucard
  else if pCharIndex = 3 then
  begin
    if CharacterOffsets[3] = ROMData.Damage.DamageScheme1Offset then
      CharacterOffsets[3] := ROMData.Damage.DamageScheme2Offset
    else if CharacterOffsets[3] = ROMData.Damage.DamageScheme2Offset then
      CharacterOffsets[3] := ROMData.Damage.DamageScheme1Offset;
  end
end;

procedure TfrmDamage.cmdStage1to3DownClick(Sender: TObject);
begin

  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,1] < $0F then
      inc(DamageSchemes[0,1])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,1] < $0F then
      inc(DamageSchemes[1,1]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdStage4toCDownClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,2] < $0F then
      inc(DamageSchemes[0,2])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,2] < $0F then
      inc(DamageSchemes[1,2]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdStageDtoEDownClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,3] < $0F then
      inc(DamageSchemes[0,3])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,3] < $0F then
      inc(DamageSchemes[1,3]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdMovingSpikesDownClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,7] < $0F then
      inc(DamageSchemes[0,7])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,7] < $0F then
      inc(DamageSchemes[1,7]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdStage1to3UpClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,1] > $0 then
      dec(DamageSchemes[0,1])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,1] > $0 then
      dec(DamageSchemes[1,1]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdStage4toCUpClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,2] > $0 then
      dec(DamageSchemes[0,2])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,2] > $0 then
      dec(DamageSchemes[1,2]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdStageDtoEUpClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,3] > $0 then
      dec(DamageSchemes[0,3])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,3] > $0 then
      dec(DamageSchemes[1,3]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdMovingSpikesUpClick(Sender: TObject);
begin
  if cbDamageScheme.ItemIndex = 0 then
  begin
    if DamageSchemes[0,7] > $0 then
      dec(DamageSchemes[0,7])
  end
  else if cbDamageScheme.ItemIndex = 1 then
  begin
    if DamageSchemes[1,7] > $0 then
      dec(DamageSchemes[1,7]);
  end;
  DrawDamage();
end;

procedure TfrmDamage.cmdOKClick(Sender: TObject);
begin
  SaveDamageSettings();
  SaveCharacterPointers();
end;

end.
