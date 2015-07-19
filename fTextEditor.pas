unit fTextEditor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmTextEditor = class(TForm)
    lblText: TLabel;
    cbText: TComboBox;
    mmoText: TMemo;
    cmdOK: TButton;
    cmdCancel: TButton;
    cmdUpdate: TButton;
    Shape1: TShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTextEditor: TfrmTextEditor;

implementation

{$R *.dfm}

end.
