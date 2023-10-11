unit Visualizers.Config.Form;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ComCtrls, Visualizers.Config, ToolsAPI;

type
  TfmVisualizerConfig = class(TForm)
    pnMain: TPanel;
    pnBottom: TPanel;
    pcMain: TPageControl;
    tsIntegers: TTabSheet;
    pnButtons: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    gbDefaults: TGroupBox;
    cbDisplayType: TComboBox;
    GroupBox1: TGroupBox;
    cbHexPrefix: TComboBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure DispalyConfig;
    function AllOK: Boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

constructor TfmVisualizerConfig.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  DispalyConfig;
end;

procedure TfmVisualizerConfig.DispalyConfig;
begin
  if VIEW_HEX = TVisualizerConfig.DefaultView then
    cbDisplayType.ItemIndex := 0
  else if VIEW_OCT = TVisualizerConfig.DefaultView then
    cbDisplayType.ItemIndex := 2
  else if VIEW_BIN = TVisualizerConfig.DefaultView then
    cbDisplayType.ItemIndex := 3
  else
    cbDisplayType.ItemIndex := 1;

  if HEX_PREFIX_CPP = TVisualizerConfig.HexPrefix then
    cbHexPrefix.ItemIndex := 1
  else if HEX_PREFIX_DELPHI = TVisualizerConfig.HexPrefix then
    cbHexPrefix.ItemIndex := 2
  else
    cbHexPrefix.ItemIndex := 0;
end;

function TfmVisualizerConfig.AllOK: Boolean;
begin
  Result := FALSE;
  if -1 = cbDisplayType.ItemIndex then
  begin
    MessageDlg('You must select a default display type.', mtError, [mbOK], 0);
    EXIT;
  end;
  case cbDisplayType.ItemIndex of
    0: TVisualizerConfig.DefaultView := VIEW_HEX;
    1: TVisualizerConfig.DefaultView := VIEW_DEC;
    2: TVisualizerConfig.DefaultView := VIEW_OCT;
    3: TVisualizerConfig.DefaultView := VIEW_BIN;
  end;

  if -1 = cbHexPrefix.ItemIndex then
  begin
    MessageDlg('You must select a hexadecimal prefix.', mtError, [mbOK], 0);
    EXIT;
  end;
  case cbHexPrefix.ItemIndex of
    0: TVisualizerConfig.HexPrefix := HEX_PREFIX_NONE;
    1: TVisualizerConfig.HexPrefix := HEX_PREFIX_CPP;
    2: TVisualizerConfig.HexPrefix := HEX_PREFIX_DELPHI;
  end;
  TVisualizerConfig.Save;
  Result := TRUE;
end;

procedure TfmVisualizerConfig.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfmVisualizerConfig.btnOKClick(Sender: TObject);
begin
  if AllOK then
  begin
    (BorlandIDEServices As IOTAMessageServices).AddTitleMessage('Visualizer Config Saved');
    ModalResult := mrOK;
  end;
end;

end.
