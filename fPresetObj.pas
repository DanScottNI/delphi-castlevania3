unit fPresetObj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TfrmPresetObj = class(TForm)
    PageControl1: TPageControl;
    tshCogs: TTabSheet;
    tshTrapdoors: TTabSheet;
    tshTrapdoorsWithSpikes: TTabSheet;
    tshAcid: TTabSheet;
    tshTiltingLedges: TTabSheet;
    tshPendulums: TTabSheet;
    lblCogType: TLabel;
    lblDirection: TLabel;
    lblX: TLabel;
    lblY: TLabel;
    lblScreen: TLabel;
    lblCogID: TLabel;
    lblTrapdoorID: TLabel;
    lblTrapdoorX: TLabel;
    lblTrapdoorY: TLabel;
    cmdOK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPresetObj: TfrmPresetObj;

implementation

{$R *.dfm}

end.
