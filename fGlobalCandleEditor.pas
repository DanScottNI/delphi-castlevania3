unit fGlobalCandleEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DanHexEdit;

type
  TfrmGlobalCandleEditor = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    lvwCandleData: TListView;
    lblID: TLabel;
    lblCandleType: TLabel;
    lblDroppedItem: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    cbCandleType: TComboBox;
    cbDroppedItem: TComboBox;
    txtX: TDanHexEdit;
    txtY: TDanHexEdit;
    cmdPreview: TButton;
    procedure cmdOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvwCandleDataDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdPreviewClick(Sender: TObject);
  private
    _Selected : Integer;
    _Initial : Integer;
    procedure SaveCandleEditor;
    procedure LoadCandleEditor;
    procedure SetEnabledProperty(pEnabled : Boolean);

    procedure DisplayCandleData;overload;
    procedure DisplayCandleData(pIndex : Integer);overload;
    { Private declarations }
  public
    property InitialSelected : Integer read _Initial write _Initial;
    { Public declarations }
  end;


var
  frmGlobalCandleEditor: TfrmGlobalCandleEditor;


implementation

uses uGlobal,cEnemy, uResourcestrings,uConsts,fEnemyCandlePreview;

{$R *.dfm}

var
  _CandleTypes,_Offsets : TStringList;

procedure TfrmGlobalCandleEditor.DisplayCandleData;
var
  i : Integer;
begin

  // Suspend drawing of the listview until all items have
  // been entered into the listview.
  lvwCandleData.Items.BeginUpdate;

  // Clear the listview's current contents.
  lvwCandleData.Items.Clear;

  for i := 0 to ROMData.GlobalCandles.Count -1 do
  begin
    with lvwCandleData.Items.Add do
    begin
      Caption := IntToHex(i,2);
      if i > 0 then
        SubItems.Add(ROMData.GlobalEnemyNames[ROMData.GlobalCandles[i].CandleType])
      else
        SubItems.Add('None');
      SubItems.Add(ROMData.GlobalCandleItems[ROMData.GlobalCandles[i].DropItem]);
      SubItems.Add(IntToHex(ROMData.GlobalCandles[i].X,2));
      SubItems.Add(IntToHex(ROMData.GlobalCandles[i].Y,2));
      SubItems.Add(_Offsets[i]);
    end;

  end;

  // Resume drawing of the listview
  lvwCandleData.Items.EndUpdate;

end;

procedure TfrmGlobalCandleEditor.DisplayCandleData(pIndex : Integer);
begin
  lvwCandleData.Items.BeginUpdate;
  lvwCandleData.Items[pIndex].Caption := IntToHex(pIndex,2);
  if pIndex > 0 then
    lvwCandleData.Items[pIndex].SubItems[0] := ROMData.GlobalEnemyNames[ROMData.GlobalCandles[pIndex].CandleType]
  else
    lvwCandleData.Items[pIndex].SubItems[0] := 'None';
  lvwCandleData.Items[pIndex].SubItems[1] := ROMData.GlobalCandleItems[ROMData.GlobalCandles[pIndex].DropItem];
  lvwCandleData.Items[pIndex].SubItems[2] := IntToHex(ROMData.GlobalCandles[pIndex].X,2);
  lvwCandleData.Items[pIndex].SubItems[3] := IntToHex(ROMData.GlobalCandles[pIndex].Y,2);
  lvwCandleData.Items.EndUpdate;
end;

procedure TfrmGlobalCandleEditor.FormCreate(Sender: TObject);
var
  i : Integer;
begin
  _Selected := -1;
  _Initial := -1;
  _CandleTypes := TStringList.Create;
  _CandleTypes.Add(ROMData.GlobalEnemyNames[0]);
  _CandleTypes.Add(ROMData.GlobalEnemyNames[$90]);
  _CandleTypes.Add(ROMData.GlobalEnemyNames[$91]);
  _CandleTypes.Add(ROMData.GlobalEnemyNames[$92]);

  _Offsets := TStringList.Create;

  for i := 0 to ROMData.GlobalCandles.Count -1 do
  begin
    _Offsets.Add(IntToHex(ROMData.PointerToOffset(ROMData.Properties['GlobalCandlePointers'].Offset + (i * 2)),4));
  end;

  cbCandleType.Items := _CandleTypes;
  cbDroppedItem.Items := ROMData.GlobalCandleItems;

  DisplayCandleData;
end;

procedure TfrmGlobalCandleEditor.FormDestroy(Sender: TObject);
begin
  FreeAndNil(_CandleTypes);
  FreeAndNil(_Offsets);
end;

procedure TfrmGlobalCandleEditor.LoadCandleEditor;
begin
  if _Selected > -1 then
    SaveCandleEditor;

  if lvwCandleData.ItemIndex > -1 then
  begin
    _Selected := lvwCandleData.ItemIndex;
    if _Selected = 0 then
      SetEnabledProperty(False)
    else
      SetEnabledProperty(True);
      
    lblID.Caption := 'Selected ID: ' + IntToHex(_Selected,2);
    cbCandleType.ItemIndex := cbCandleType.Items.IndexOf(ROMData.GlobalEnemyNames[ROMData.GlobalCandles[_Selected].CandleType]);
    cbDroppedItem.ItemIndex := cbDroppedItem.Items.IndexOf(ROMData.GlobalCandleItems[ROMData.GlobalCandles[_Selected].DropItem]);
    txtX.Text := IntToHex(ROMData.GlobalCandles[_Selected].X,2);
    txtY.Text := IntToHex(ROMData.GlobalCandles[_Selected].Y,2);
  end
  else
  begin
    SetEnabledProperty(false);
    _Selected := -1;
    lblID.Caption := 'Selected ID: None';
    txtX.Text := '00';
    txtY.Text := '00';
    cbDroppedItem.ItemIndex := -1;
    cbCandleType.ItemIndex := -1;
  end;

end;

procedure TfrmGlobalCandleEditor.SetEnabledProperty(pEnabled : Boolean);
begin
  cbCandleType.Enabled := pEnabled;
  cbDroppedItem.Enabled := pEnabled;
  lblDroppedItem.Enabled := pEnabled;
  lblCandleType.Enabled := pEnabled;
  lblID.Enabled := pEnabled;
  lblX.Enabled := pEnabled;
  lblY.Enabled := pEnabled;
  txtX.Enabled := pEnabled;
  txtY.Enabled := pEnabled;
  cmdPreview.Enabled := pEnabled;
end;

procedure TfrmGlobalCandleEditor.SaveCandleEditor;
var
  i : Integer;
begin
  for i := 0 to ROMData.GlobalCandles.Count -1 do
  begin
    if _Offsets[i] = _Offsets[_Selected] then
    begin
      if cbCandleType.ItemIndex = 00 then
        ROMData.GlobalCandles[i].CandleType := $00
      else if cbCandleType.ItemIndex = 1 then
        ROMData.GlobalCandles[i].CandleType := $90
      else if cbCandleType.ItemIndex = 2 then
        ROMData.GlobalCandles[i].CandleType := $91
      else if cbCandleType.ItemIndex = 3 then
        ROMData.GlobalCandles[i].CandleType := $92;

      ROMData.GlobalCandles[i].DropItem := cbDroppedItem.ItemIndex;

      if Length(txtX.Text) > 0 then
        ROMData.GlobalCandles[i].X := StrToInt('$' + txtX.Text);

      if Length(txtY.Text) > 0 then
        ROMData.GlobalCandles[i].Y := StrToInt('$' + txtY.Text);

      DisplayCandleData(i);
    end;
  end;

end;

procedure TfrmGlobalCandleEditor.lvwCandleDataDblClick(Sender: TObject);
begin
  LoadCandleEditor;
end;

procedure TfrmGlobalCandleEditor.cmdOKClick(Sender: TObject);
begin
  ROMData.SaveGlobalCandleData;
end;

procedure TfrmGlobalCandleEditor.FormShow(Sender: TObject);
begin
  if _Initial > -1 then
  begin
    lvwCandleData.ItemIndex :=  _Initial;
    lvwCandleData.Items[_Initial].MakeVisible(True);
    LoadCandleEditor;
  end;
end;

procedure TfrmGlobalCandleEditor.cmdPreviewClick(Sender: TObject);
var
  Prev : TfrmEnemyCandlePreview;
begin
  Prev := TfrmEnemyCandlePreview.Create(self);
  try
    Prev.X := StrToInt('$' + txtX.Text);
    Prev.Y := StrToInt('$' + txtY.Text);
    Prev.ID := cbDroppedItem.ItemIndex;
    Prev.ShowModal;
  finally
    FreeAndNil(Prev);
  end;
end;

end.
