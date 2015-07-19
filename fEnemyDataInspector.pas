unit fEnemyDataInspector;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmEnemyDataInspector = class(TForm)
    cmdOK: TButton;
    lstEnemyData: TListBox;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnemyDataInspector: TfrmEnemyDataInspector;

implementation

{$R *.dfm}

uses uGlobal;

procedure TfrmEnemyDataInspector.FormShow(Sender: TObject);
var
  i : Integer;
begin
  lstEnemyData.Items.BeginUpdate;
  for i := 0 to ROMData.CurrentBlock.EnemyData.Count -1 do
  begin
    if i mod 2 = 0 then
      lstEnemyData.Items.Add('E - '+IntToHex(ROMData.CurrentBlock.EnemyData[i],2))
    else
      lstEnemyData.Items.Add('C - '+IntToHex(ROMData.CurrentBlock.EnemyData[i],2));
  end;
  lstEnemyData.Items.EndUpdate;
end;

end.
