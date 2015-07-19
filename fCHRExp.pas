unit fCHRExp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin;

type
  TfrmCHRExpansion = class(TForm)
    lblNumberOfCHRBanks: TLabel;
    cmdOK: TButton;
    cmdCancel: TButton;
    txtCHRBanks: TSpinEdit;
    procedure cmdOKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCHRExpansion: TfrmCHRExpansion;

implementation

uses uGlobal;

{$R *.dfm}

procedure TfrmCHRExpansion.cmdOKClick(Sender: TObject);
begin
  ROMData.ExpandCHR(txtCHRBanks.Value); 
end;

end.
