unit fCheatEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmCheatEditor = class(TForm)
    lstCheats: TListBox;
    txtCheat: TEdit;
    cmdApply: TButton;
    cmdOK: TButton;
    cmdCancel: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCheatEditor: TfrmCheatEditor;

implementation

{$R *.dfm}

end.
