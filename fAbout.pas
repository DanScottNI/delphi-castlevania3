unit fAbout;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, shellapi, ComCtrls;

type
  TfrmAbout = class(TForm)
    cmdOK: TButton;
    lblHomepage: TLabel;
    lblThanks: TLabel;
    lblDescription: TLabel;
    ScrollBox1: TScrollBox;
    lblGreetings: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure lblHomepageClick(Sender: TObject);
    procedure lblHomepageMouseEnter(Sender: TObject);
    procedure lblHomepageMouseLeave(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

uses  uResourcestrings,uGlobal;

{$R *.dfm}

procedure TfrmAbout.FormCreate(Sender: TObject);
begin

  Caption := 'About ' + APPLICATIONTITLE;
  if DEBUG then
    Caption := Caption + DEBUGTEXT;
//  grpTripNSlip.Caption := 'About ' + APPLICATIONNAME;

end;

procedure TfrmAbout.lblHomepageClick(Sender: TObject);
begin
  ShellExecute(GetDesktopWindow(), 'open', PChar('http://dan.panicus.org'), nil, nil, SW_SHOWNORMAL);
end;

procedure TfrmAbout.lblHomepageMouseEnter(Sender: TObject);
begin
  lblHomepage.Font.Style := [fsUnderline];
end;

procedure TfrmAbout.lblHomepageMouseLeave(Sender: TObject);
begin
  lblHomepage.Font.Style := [];
end;

end.
