unit fGlobalEnemyEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DanHexEdit, ComCtrls;

type
  TfrmGlobalEnemyEditor = class(TForm)
    lblID: TLabel;
    lblEnemyType: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    lvwEnemyData: TListView;
    cbEnemyType: TComboBox;
    txtX: TDanHexEdit;
    txtY: TDanHexEdit;
    lblUnknown1: TLabel;
    lblUnknown2: TLabel;
    txtUnknown1: TDanHexEdit;
    txtUnknown2: TDanHexEdit;
    cmdPreview: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvwEnemyDataClick(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdPreviewClick(Sender: TObject);
  private
    _Selected : Integer;
    _Initial : Integer;
    procedure DisplayEnemyData;overload;
    procedure LoadEnemyEditor;
    procedure SaveEnemyEditor;
    procedure SetEnabledProperty(pEnabled : Boolean);
    procedure DisplayEnemyData(pIndex : Integer);overload;
    { Private declarations }
  public
    property InitialSelected : Integer read _Initial write _Initial;
    { Public declarations }
  end;

var
  frmGlobalEnemyEditor: TfrmGlobalEnemyEditor;

implementation

{$R *.dfm}

uses uGlobal, fEnemyCandlePreview;

var
  _Offsets : TStringList;

procedure TfrmGlobalEnemyEditor.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  _Selected := -1;
  _Initial := 0;
  _Offsets := TStringList.Create;

  for i := 0 to ROMData.GlobalEnemies.Count -1 do
  begin
    _Offsets.Add(IntToHex(ROMData.PointerToOffset(ROMData.Properties['GlobalEnemyPointers'].Offset + (i * 2)),4));
  end;


  cbEnemyType.Items := ROMData.GlobalEnemyNames;

  DisplayEnemyData;

end;

procedure TfrmGlobalEnemyEditor.DisplayEnemyData;
var
  i : Integer;
begin

  // Suspend drawing of the listview until all items have
  // been entered into the listview.
  lvwEnemyData.Items.BeginUpdate;

  // Clear the listview's current contents.
  lvwEnemyData.Items.Clear;

  for i := 0 to ROMData.GlobalEnemies.Count -1 do
  begin
    with lvwEnemyData.Items.Add do
    begin
      Caption := IntToHex(i,2);
      if i > 0 then
        SubItems.Add(ROMData.GlobalEnemyNames[ROMData.GlobalEnemies[i].ID])
      else
        SubItems.Add('None');
      SubItems.Add(IntToHex(ROMData.GlobalEnemies[i].X,2));
      SubItems.Add(IntToHex(ROMData.GlobalEnemies[i].Y,2));
      SubItems.Add(IntToHex(ROMData.GlobalEnemies[i].Unknown1,2));
      SubItems.Add(IntToHex(ROMData.GlobalEnemies[i].Unknown2,2));
      SubItems.Add(_Offsets[i]);
    end;

  end;

  // Resume drawing of the listview
  lvwEnemyData.Items.EndUpdate;


end;

procedure TfrmGlobalEnemyEditor.DisplayEnemyData(pIndex : Integer);
begin
  lvwEnemyData.Items.BeginUpdate;
  lvwEnemyData.Items[pIndex].Caption := IntToHex(pIndex,2);
  if pIndex >0 then
    lvwEnemyData.Items[pIndex].SubItems[0] := ROMData.GlobalEnemyNames[ROMData.GlobalEnemies[pIndex].ID]
  else
    lvwEnemyData.Items[pIndex].SubItems[0] := 'None';
  lvwEnemyData.Items[pIndex].SubItems[1] := IntToHex(ROMData.GlobalEnemies[pIndex].X,2);
  lvwEnemyData.Items[pIndex].SubItems[2] := IntToHex(ROMData.GlobalEnemies[pIndex].Y,2);
  lvwEnemyData.Items[pIndex].SubItems[3] := IntToHex(ROMData.GlobalEnemies[pIndex].Unknown1,2);
  lvwEnemyData.Items[pIndex].SubItems[4] := IntToHex(ROMData.GlobalEnemies[pIndex].Unknown2,2);
  lvwEnemyData.Items.EndUpdate;
end;

procedure TfrmGlobalEnemyEditor.SetEnabledProperty(pEnabled : Boolean);
begin
  cbEnemyType.Enabled := pEnabled;
  lblEnemyType.Enabled := pEnabled;
  lblID.Enabled := pEnabled;

  lblX.Enabled := pEnabled;
  lblY.Enabled := pEnabled;
  txtX.Enabled := pEnabled;
  txtY.Enabled := pEnabled;
  lblUnknown1.Enabled := pEnabled;
  txtUnknown1.Enabled := pEnabled;
  lblUnknown2.Enabled := pEnabled;
  txtUnknown2.Enabled := pEnabled;
  cmdPreview.Enabled := pEnabled;
end;

procedure TfrmGlobalEnemyEditor.cmdOKClick(Sender: TObject);
begin
  ROMData.SaveGlobalEnemyData;
end;

procedure TfrmGlobalEnemyEditor.LoadEnemyEditor;
begin
  if _Selected > -1 then
    SaveEnemyEditor;

  if lvwEnemyData.ItemIndex > -1 then
  begin
    _Selected := lvwEnemyData.ItemIndex;
    if _Selected = 0 then
      SetEnabledProperty(False)
    else
      SetEnabledProperty(True);
    lblID.Caption := 'Selected ID: ' + IntToHex(_Selected,2);

    cbEnemyType.ItemIndex := cbEnemyType.Items.IndexOf(ROMData.GlobalEnemyNames[ROMData.GlobalEnemies[_Selected].ID]);
    txtX.Text := IntToHex(ROMData.GlobalEnemies[_Selected].X,2);
    txtY.Text := IntToHex(ROMData.GlobalEnemies[_Selected].Y,2);
    txtUnknown1.Text := IntToHex(ROMData.GlobalEnemies[_Selected].Unknown1,2);
    txtUnknown2.Text := IntToHex(ROMData.GlobalEnemies[_Selected].Unknown2,2);
  end
  else
  begin
    SetEnabledProperty(false);
    _Selected := -1;
    lblID.Caption := 'Selected ID: None';
    txtX.Text := '00';
    txtY.Text := '00';
    cbEnemyType.ItemIndex := -1;
    txtUnknown1.Text := '00';
    txtUnknown2.Text := '00';
  end;

end;

procedure TfrmGlobalEnemyEditor.SaveEnemyEditor;
var
  i : Integer;
begin
  for i := 0 to ROMData.GlobalEnemies.Count -1 do
  begin
    if _Offsets[i] = _Offsets[_Selected] then
    begin
      ROMData.GlobalEnemies[i].ID := cbEnemyType.ItemIndex;

      if Length(txtX.Text) > 0 then
        ROMData.GlobalEnemies[i].X := StrToInt('$' + txtX.Text);

      if Length(txtY.Text) > 0 then
        ROMData.GlobalEnemies[i].Y := StrToInt('$' + txtY.Text);

      if Length(txtUnknown1.Text) > 0 then
        ROMData.GlobalEnemies[i].Unknown1 := StrToInt('$' + txtUnknown1.Text);

      if Length(txtUnknown2.Text) > 0 then
        ROMData.GlobalEnemies[i].Unknown2 := StrToInt('$' + txtUnknown2.Text);


      DisplayEnemyData(i);
    end;
  end;
end;

procedure TfrmGlobalEnemyEditor.lvwEnemyDataClick(Sender: TObject);
begin
  LoadEnemyEditor;
end;

procedure TfrmGlobalEnemyEditor.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_Offsets);
end;

procedure TfrmGlobalEnemyEditor.Button1Click(Sender: TObject);
var
  i,x : Integer;
begin
  for i := 0 to _Offsets.Count -1 do
  begin

    for x := 0 to _Offsets.Count -1 do
    begin
      if i <> x then
        if _Offsets[i] = _Offsets[x] then
          showmessage(IntToHex(x,2) + '  is a duplicate of ' + IntToHex(i,2));
    end;

  end;
end;

procedure TfrmGlobalEnemyEditor.FormShow(Sender: TObject);
begin

  if _Initial > -1 then
  begin
    lvwEnemyData.ItemIndex :=  _Initial;
    lvwEnemyData.Items[_Initial].MakeVisible(True);
    LoadEnemyEditor;
  end;

end;

procedure TfrmGlobalEnemyEditor.cmdPreviewClick(Sender: TObject);
var
  Prev : TfrmEnemyCandlePreview;
begin
  Prev := TfrmEnemyCandlePreview.Create(self);
  try
    Prev.X := StrToInt('$' + txtX.Text);
    Prev.Y := StrToInt('$' + txtY.Text);
    Prev.ID := cbEnemyType.ItemIndex;
    Prev.ShowModal;
  finally
    FreeAndNil(Prev);
  end;

end;

end.
