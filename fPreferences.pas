unit fPreferences;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, GR32_Image, GR32, ComCtrls;

type
  TfrmPreferences = class(TForm)
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdRestoreDefaults: TButton;
    pgcPreferences: TPageControl;
    tshGeneral: TTabSheet;
    tshEmulatorSettings: TTabSheet;
    rdgEmuFileSettings: TRadioGroup;
    txtEmulatorPath: TEdit;
    lblEmulatorPath: TLabel;
    cmdBrowse: TButton;
    chkDisplayEmulatorSaveWarning: TCheckBox;
    tshDisplayOptions: TTabSheet;
    chkShowLeftMidText: TCheckBox;
    lblLeftTextColour: TLabel;
    imgLeftText: TImage32;
    cmdBrowseLeft: TButton;
    ColorDialog: TColorDialog;
    cmdBrowseRight: TButton;
    imgRightText: TImage32;
    lblMiddleTextColour: TLabel;
    imgGridlineColour: TImage32;
    cmdBrowseGridlines: TButton;
    chkShowGridlinesByDefault: TCheckBox;
    OpenDialog: TOpenDialog;
    lblGridlineColour: TLabel;
    cbDataFile: TComboBox;
    lblDatafile: TLabel;
    lblPalette: TLabel;
    cbPaletteFile: TComboBox;
    chkBackupFiles: TCheckBox;
    rdgWhenIncorrectMapper: TRadioGroup;
    chkAutoCheck: TCheckBox;
    tshIPS: TTabSheet;
    lblOriginalFile: TLabel;
    txtOriginalROMFilename: TEdit;
    cmdIPSBrowse: TButton;
    grpPatching: TGroupBox;
    lblSaveAsIPS: TLabel;
    txtSaveAsIPS: TEdit;
    cmdBrowseIPSSaveAs: TButton;
    lblIPSNoteSaveAs: TLabel;
    imgLunarIPS: TImage;
    lblLunarCompress: TLabel;
    lblFuSoYa: TLabel;
    SaveDialog: TSaveDialog;
    txtIconTransparency: TSpinEdit;
    lblIconTransparency: TLabel;
    chkDrawTransparentIcons: TCheckBox;
    rdgOpenDialog: TRadioGroup;
    procedure cmdBrowseLeftClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmdOKClick(Sender: TObject);
    procedure cmdBrowseRightClick(Sender: TObject);
    procedure cmdBrowseGridlinesClick(Sender: TObject);
    procedure cmdBrowseClick(Sender: TObject);
    procedure cmdRestoreDefaultsClick(Sender: TObject);
    procedure cmdIPSBrowseClick(Sender: TObject);
    procedure cmdBrowseIPSSaveAsClick(Sender: TObject);
  private
    procedure LoadPreferences();
    procedure SavePreferences();
    procedure LoadDataFiles();
    procedure LoadPaletteFiles();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreferences: TfrmPreferences;

implementation

{$R *.dfm}

uses uGlobal, uResourcestrings;

procedure TfrmPreferences.cmdBrowseLeftClick(Sender: TObject);
begin
  ColorDialog.Color := imgLeftText.Color;
  if ColorDialog.Execute then
  begin
    imgLeftText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.LoadPreferences();
begin
  imgLeftText.Color := WinColor(EditorConfig.LeftTextColour);
  imgRightText.Color := WinColor(EditorConfig.MiddleTextColour);
  imgGridlineColour.Color := WinColor(EditorConfig.GridlineColour);
  cbDataFile.ItemIndex := cbDataFile.Items.IndexOf(EditorConfig.DataFileName);
  cbPaletteFile.ItemIndex := cbPaletteFile.Items.IndexOf(EditorConfig.Palette);
  if cbPaletteFile.ItemIndex = -1 then
    cbPaletteFile.ItemIndex := 0;
  chkShowLeftMidText.Checked := EditorConfig.DispLeftMidText;
  chkShowGridlinesByDefault.Checked := EditorConfig.GridlinesOnByDefault;
  chkBackupFiles.Checked := EditorConfig.BackupFilesWhenSaving;
  chkDisplayEmulatorSaveWarning.Checked := EditorConfig.EmulatorDisplaySaveWarning;
  rdgEmuFileSettings.ItemIndex := EditorConfig.EmulatorFileSettings;
  txtEmulatorPath.Text := EditorConfig.EmulatorPath;
  chkDrawTransparentIcons.Checked := EditorConfig.DrawTransparentIcons;
  txtIconTransparency.Value := EditorConfig.IconTransparency;
  rdgWhenIncorrectMapper.ItemIndex := EditorConfig.MapperWarnings;
  chkAutoCheck.Checked := EditorConfig.AutoCheck;
  txtOriginalROMFilename.Text := EditorConfig.OriginalROMFile;
  txtSaveAsIPS.Text := EditorConfig.IPSOutput;
  rdgOpenDialog.ItemIndex := EditorConfig.CustomOpenDialog;
end;

procedure TfrmPreferences.SavePreferences();
begin
  EditorConfig.LeftTextColour := Color32(imgLeftText.Color);
  EditorConfig.MiddleTextColour := Color32(imgRightText.Color);
  EditorConfig.GridlineColour := Color32(imgGridlineColour.Color);
  EditorConfig.DataFileName := cbDataFile.Items[cbDataFile.ItemIndex];
  EditorConfig.Palette := cbPaletteFile.Items[cbPaletteFile.ItemIndex];
  EditorConfig.DispLeftMidText := chkShowLeftMidText.Checked;
  EditorConfig.GridlinesOnByDefault := chkShowGridlinesByDefault.Checked;
  EditorConfig.BackupFilesWhenSaving := chkBackupFiles.Checked;
  EditorConfig.EmulatorDisplaySaveWarning := chkDisplayEmulatorSaveWarning.Checked;
  EditorConfig.EmulatorFileSettings := rdgEmuFileSettings.ItemIndex;
  EditorConfig.EmulatorPath := txtEmulatorPath.Text;
  EditorConfig.DrawTransparentIcons := chkDrawTransparentIcons.Checked;
  EditorConfig.IconTransparency := txtIconTransparency.Value;
  EditorConfig.MapperWarnings :=rdgWhenIncorrectMapper.ItemIndex;
  EditorConfig.AutoCheck := chkAutoCheck.Checked;
  EditorConfig.OriginalROMFile := txtOriginalROMFilename.Text;
  EditorConfig.IPSOutput := txtSaveAsIPS.Text;
  EditorConfig.CustomOpenDialog := rdgOpenDialog.ItemIndex;
end;

procedure TfrmPreferences.FormShow(Sender: TObject);
begin
  if Assigned(ROMData) = False then
  begin
    cbDataFile.Enabled := True;
    lblDataFile.Enabled := True;
  end
  else
  begin
    cbDataFile.Enabled := False;
    lblDataFile.Enabled := False;
  end;

  LoadPaletteFiles();
  LoadDataFiles();

  LoadPreferences;
end;

procedure TfrmPreferences.cmdOKClick(Sender: TObject);
begin
  SavePreferences;
end;

procedure TfrmPreferences.cmdBrowseRightClick(Sender: TObject);
begin
  ColorDialog.Color := imgRightText.Color;
  if ColorDialog.Execute then
  begin
    imgRightText.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.cmdBrowseGridlinesClick(Sender: TObject);
begin
  ColorDialog.Color := imgGridlineColour.Color;
  if ColorDialog.Execute then
  begin
    imgGridlineColour.Color := ColorDialog.Color;
  end;
end;

procedure TfrmPreferences.cmdBrowseClick(Sender: TObject);
begin
  OpenDialog.Title := SELECTEMU;
  OpenDialog.Filter := 'NES Emulator (*.exe)|*.exe';
  if (txtEmulatorPath.Text <> '') and (DirectoryExists(ExtractFileDir(txtEmulatorPath.Text))) then
    OpenDialog.InitialDir := ExtractFileDir(txtEmulatorPath.Text);

  if OpenDialog.Execute then
  begin
    if (OpenDialog.FileName <> '') and (FileExists(OpenDialog.Filename)) then
    begin
      txtEmulatorPath.Text := OpenDialog.FileName;
      txtEmulatorPath.SelStart := Length(txtEmulatorPath.Text);
    end;
  end;
end;

procedure TfrmPreferences.cmdRestoreDefaultsClick(Sender: TObject);
begin
  EditorConfig.LoadDefaultSettings;
  EditorConfig.Save;
  LoadPreferences;
end;

procedure TfrmPreferences.LoadDataFiles();
{var
  sr: TSearchRec;}
begin

  cbDataFile.Items.Clear;

  {if FindFirst(ExtractFileDir(Application.ExeName)+ '\Data\*.ini', faAnyFile, sr) = 0 then
  begin
    repeat
      cbDataFile.Items.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;}

  cbDataFile.Items.LoadFromFile(ExtractFileDir(Application.ExeName) + '\Data\data.dat');
end;

procedure TfrmPreferences.LoadPaletteFiles();
var
  sr: TSearchRec;
begin

  cbPaletteFile.Items.Clear;

  if FindFirst(ExtractFileDir(Application.ExeName)+ '\Data\Palettes\*.pal', faAnyFile, sr) = 0 then
  begin
    repeat
      cbPaletteFile.Items.Add(sr.Name);

    until FindNext(sr) <> 0;
    FindClose(sr);
  end;

//  cbPaletteFile.Items.LoadFromFile(ExtractFileDir(Application.Exename) + '\Data\Palettes\pal.dat');
end;

procedure TfrmPreferences.cmdIPSBrowseClick(Sender: TObject);
begin

  OpenDialog.Title := '';
  OpenDialog.Filter := 'iNES Image (*.nes)|*.nes';

  if (txtOriginalROMFilename.Text <> '') and (DirectoryExists(ExtractFileDir(txtOriginalROMFilename.Text))) then
    OpenDialog.InitialDir := ExtractFileDir(txtOriginalROMFilename.Text)
  else
    OpenDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if OpenDialog.Execute then
  begin
    if (OpenDialog.FileName <> '') and (FileExists(OpenDialog.Filename)) then
    begin
      txtOriginalROMFilename.Text := OpenDialog.FileName;
      txtOriginalROMFilename.SelStart := Length(txtOriginalROMFilename.Text);
    end;
  end;

end;

procedure TfrmPreferences.cmdBrowseIPSSaveAsClick(Sender: TObject);
begin
  if (txtSaveAsIPS.Text <> '') and (DirectoryExists(ExtractFileDir(txtSaveAsIPS.Text))) then
    SaveDialog.InitialDir := ExtractFileDir(txtSaveAsIPS.Text)
  else
    SaveDialog.InitialDir := ExtractFileDir(Application.ExeName);

  if SaveDialog.Execute then
  begin
    txtSaveAsIPS.Text := SaveDialog.FileName;
    txtSaveAsIPS.SelStart := Length(txtSaveAsIPS.Text);
  end;
end;

end.
