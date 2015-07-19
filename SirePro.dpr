program SirePro;

{%File 'ChangeLog.txt'}
{%File 'Data\Castlevania 3 - Draculas Curse (U).ini'}
{%File 'Data\enemy.dat'}
{%File 'Data\candleitem.dat'}

uses
  Forms,
  fSire in 'fSire.pas' {frmSireMain},
  fOpenDialog in 'fOpenDialog.pas' {frmOpenDialog},
  fAbout in 'fAbout.pas' {frmAbout},
  fTSA in 'fTSA.pas' {frmTSAEditor},
  fPalette in 'fPalette.pas' {frmPaletteEditor},
  fBlockProperties in 'fBlockProperties.pas' {frmBlockProperties},
  fPreferences in 'fPreferences.pas' {frmPreferences},
  fTextEditor in 'fTextEditor.pas' {frmTextEditor},
  fDamageSettings in 'fDamageSettings.pas' {frmDamage},
  fLevelProperties in 'fLevelProperties.pas' {frmLevelProperties},
  fCheatEditor in 'fCheatEditor.pas' {frmCheatEditor},
  fCHRExp in 'fCHRExp.pas' {frmCHRExpansion},
  fROMPatches in 'fROMPatches.pas' {frmROMPatches},
  fGlobalEnemyEditor in 'fGlobalEnemyEditor.pas' {frmGlobalEnemyEditor},
  fGlobalCandleEditor in 'fGlobalCandleEditor.pas' {frmGlobalCandleEditor},
  fTileEditor in 'fTileEditor.pas' {frm8x8TileEditor},
  fLevelStats in 'fLevelStats.pas' {frmLevelStatistics},
  fObjectProp in 'fObjectProp.pas' {frmObjProperties},
  cROMData in 'cROMData.pas',
  cConfiguration in 'cConfiguration.pas',
  cEnemy in 'cEnemy.pas',
  cSpecObj in 'cSpecObj.pas',
  cLevelObj in 'cLevelObj.pas',
  cMisc in 'cMisc.pas',
  cGraphics in 'cGraphics.pas',
  cLevel in 'cLevel.pas',
  uROM in 'uROM.pas',
  uGlobal in 'uGlobal.pas',
  uLunarcompress in 'uLunarcompress.pas',
  uResourcestrings in 'uResourcestrings.pas',
  uConsts in 'uConsts.pas',
  fEnemyDataInspector in 'fEnemyDataInspector.pas' {frmEnemyDataInspector},
  fEnemyCandlePreview in 'fEnemyCandlePreview.pas' {frmEnemyCandlePreview},
  fPresetObj in 'fPresetObj.pas' {frmPresetObj},
  cPresetObj in 'cPresetObj.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sire v1.0';
  Application.CreateForm(TfrmSireMain, frmSireMain);
  Application.Run;
end.
