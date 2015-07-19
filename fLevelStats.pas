unit fLevelStats;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmLevelStatistics = class(TForm)
    lvwBlocksData: TListView;
    cmdOK: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLevelStatistics: TfrmLevelStatistics;

implementation

{$R *.dfm}

uses uGlobal;

procedure TfrmLevelStatistics.FormShow(Sender: TObject);
var
  i : Integer;
begin
  lvwBlocksData.Items.BeginUpdate;
  for i := 0 to ROMData.CurrentLevel.Blocks.Count -1 do
  begin
    with lvwBlocksData.Items.Add do
    begin                                                                                         
      Caption := ROMData.CurrentLevel.Blocks[i].Name;
      SubItems.Add(IntToHex(ROMData.CurrentLevel.Blocks[i].BlockLength,2));
      SubItems.Add(IntToHex(ROMData.CurrentLevel.Blocks[i].BlockOffset,5));
      if Assigned(ROMData.CurrentLevel.Blocks[i].Stairs) then
        SubItems.Add(IntToStr(ROMData.CurrentLevel.Blocks[i].Stairs.Count))
      else
        SubItems.Add('N/A');

      if Assigned(ROMData.CurrentLevel.Blocks[i].SpecialObjects) then
        SubItems.Add(IntToStr(ROMData.CurrentLevel.Blocks[i].SpecialObjects.Count))
      else
        SubItems.Add('N/A');

    end;
  end;
  lvwBlocksData.Items.EndUpdate;
end;

end.
