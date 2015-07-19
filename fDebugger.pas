unit fDebugger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmDebugger = class(TForm)
    Memo1: TMemo;
  private
    { Private declarations }
  public
    procedure AddLine(pString : String);
    { Public declarations }
  end;

var
  frmDebugger: TfrmDebugger;

implementation

{$R *.dfm}

procedure TfrmDebugger.AddLine(pString : String);
begin
  Memo1.Lines.Add(pString); 
end;

end.
