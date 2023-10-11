unit Visualizers.ExernalViewerUpater;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ToolsApi, Vcl.Grids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Visualizers.Config, Visualizers.Formatter,
  Vcl.ComCtrls;

type
  TfmIntegerUpdater = class(TForm, IOTADebuggerVisualizerExternalViewerUpdater)
    pcMain: TPageControl;
    tsVisualizer: TTabSheet;
    pnBottom: TPanel;
    gbValues: TGroupBox;
    sgValues: TStringGrid;
    Panel1: TPanel;
    gbValue: TGroupBox;
    ebValue: TEdit;
    tsIDEInfo: TTabSheet;
    memIDEInfo: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgValuesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    FClosedCallback: TOTAVisualizerClosedProcedure;
    FTypeName: String;
    procedure SetGridValues(AEvalResult: String);
    procedure SetValueEdit(AEvalResult: String);
    procedure GetIDEInfo;
  public
    constructor Create(AOwner: TComponent; const AExpression, ATypeName, AEvalResult: string); reintroduce;
    { Public declarations }

    { Called when the visualizer should be closed (because the thread that
      created it has gone away) }
    procedure CloseVisualizer;

    { Called when the process is running or otherwise in a state where it is
      unable to show data.  The recommended action is to show "Process not
      accessible", "Out of scope", or something similar (like is shown in the
      Watch window) }
    procedure MarkUnavailable(Reason: TOTAVisualizerUnavailableReason);

    { Called when the data for the visualizer needs to be refreshed }
    procedure RefreshVisualizer(const Expression, TypeName, EvalResult: string);

    { Called to set a callback that should be called to let the debugger know
      that the external viewer has been closed.  The CloseProc is a debugger-
      provided procedure that the visualizer UI should call when the user closes
      it. This tells the debugger (among other things) to stop refreshing this
      visualizer }
    procedure SetClosedCallback(ClosedProc: TOTAVisualizerClosedProcedure);
  end;

implementation

{$R *.dfm}

constructor TfmIntegerUpdater.Create(AOwner: TComponent; const AExpression, ATypeName, AEvalResult: string);
begin
  inherited Create(AOwner);
  sgValues.Cells[0, 0] := VIEW_HEX;
  sgValues.Cells[0, 1] := VIEW_DEC;
  sgValues.Cells[0, 2] := VIEW_OCT;
  sgValues.Cells[0, 3] := VIEW_BIN;
  FTypeName := ATypeName.ToUpper;
  SetGridValues(AEvalResult);
  Self.Caption := String.Format('%s (%s)', [AExpression, ATypeName]);
  gbValues.Caption := String.Format('%s (%s)', [AExpression, ATypeName]);
  pcMain.ActivePageIndex := 0;
  SetValueEdit(AEvalResult);
  GetIDEInfo;
end;

procedure TfmIntegerUpdater.SetGridValues(AEvalResult: String);
var
  LRec: TDebugIntValue;
begin
  OutputDebugString(PChar('Set Grid Values for ' + AEvalResult));
  if ('INTEGER' =  FTypeName) or (('NATIVEINT' = FTypeName) and (4 = SizeOf(NativeInt))) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(Integer));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('CARDINAL' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToUInt64(AEvalResult), SizeOf(Cardinal));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('SHORTINT' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(ShortInt));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('BYTE' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToUInt64(AEvalResult), SizeOf(Byte));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('SMALLINT' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(SmallInt));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('WORD' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToUInt64(AEvalResult), SizeOf(Word));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('INT64' =  FTypeName) or (('NATIVEINT' = FTypeName) and (8 = SizeOf(NativeInt))) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(Int64));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end
  else if ('UINT64' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToUInt64(AEvalResult), SizeOf(UInt64));
    sgValues.Cells[1, 0] :=  LRec.ToHex(TVisualizerConfig.HexPrefix, TRUE);
    sgValues.Cells[1, 1] :=  LRec.ToDecimal;
    sgValues.Cells[1, 2] :=  LRec.ToOct;
    sgValues.Cells[1, 3] :=  LRec.ToBin(TRUE);
  end;
end;

procedure TfmIntegerUpdater.SetValueEdit(AEvalResult: String);
var
  LRec: TDebugIntValue;
begin
  if ('INTEGER' =  FTypeName) or (('NATIVEINT' = FTypeName) and (4 = SizeOf(NativeInt))) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(Integer));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('SHORTINT' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(ShortInt));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('SMALLINT' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(SmallInt));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('INT64' =  FTypeName) or (('NATIVEINT' = FTypeName) and (8 = SizeOf(NativeInt))) then
  begin
    LRec := TDebugIntValue.CreateSigned(StrToInt64(AEvalResult), SizeOf(Int64));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('CARDINAL' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToInt64(AEvalResult), SizeOf(Cardinal));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('BYTE' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToInt64(AEvalResult), SizeOf(Cardinal));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('WORD' = FTypeName) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToInt64(AEvalResult), SizeOf(Word));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end
  else if ('UINT64' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    LRec := TDebugIntValue.CreateUnsigned(StrToInt64(AEvalResult), SizeOf(UInt64));
    ebValue.Text := LRec.Format(TVisualizerConfig.DefaultView);
  end;
end;

procedure TfmIntegerUpdater.GetIDEInfo;
var
  i: Integer;
  LServices: IOTAServices;
begin
   memIDEInfo.Lines.Clear;
  if Supports(BorlandIDEServices, IOTAServices, LServices) then
  begin
    memIDEInfo.Lines.Add('Startup Directory:');
    memIDEInfo.Lines.Add(LServices.GetStartupDirectory);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Preferred UI Languages:');
    memIDEInfo.Lines.Add(LServices.GetIDEPreferredUILanguages);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Application Data Directory:');
    memIDEInfo.Lines.Add(LServices.GetApplicationDataDirectory);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Local Application Data Directory:');
    memIDEInfo.Lines.Add(LServices.GetLocalApplicationDataDirectory);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Root Directory:');
    memIDEInfo.Lines.Add(LServices.GetRootDirectory);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Bin Directory:');
    memIDEInfo.Lines.Add(LServices.GetBinDirectory);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Template Directory:');
    memIDEInfo.Lines.Add(LServices.GetTemplateDirectory);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Active Designer Type:');
    memIDEInfo.Lines.Add(LServices.GetActiveDesignerType);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Base Registry Key:');
    memIDEInfo.Lines.Add(LServices.GetBaseRegistryKey);
    memIDEInfo.Lines.Add(String.Empty);

    memIDEInfo.Lines.Add('Product Identifier:');
    memIDEInfo.Lines.Add(LServices.GetProductIdentifier);
    memIDEInfo.Lines.Add(String.Empty);
  end else
    memIDEInfo.Lines.Add('IOTAServices Not Supported!!');
end;

procedure TfmIntegerUpdater.CloseVisualizer;
begin
  OutputDebugString(PChar('Close Visualizer called by IDE'));
  Self.Close;
end;

procedure TfmIntegerUpdater.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FClosedCallback) then
  begin
    OutputDebugString(PChar('CloseCallback running'));
    FClosedCallback;
  end else
    OutputDebugString(PChar('CloseCallback not assigned'));

  Action := caFree;
end;

procedure TfmIntegerUpdater.MarkUnavailable(Reason: TOTAVisualizerUnavailableReason);
begin
  case Reason of
    ovurProcessRunning: Self.Caption := 'ovurProcessRunning';
    ovurOutOfScope: Self.Caption := 'ovurOutOfScope';
  end;
end;

procedure TfmIntegerUpdater.RefreshVisualizer(const Expression, TypeName, EvalResult: string);
begin
  FTypeName := TypeName.ToUpper;
  SetGridValues(EvalResult);
  Self.Caption := String.Format('%s (%s)', [Expression, TypeName]);
  gbValues.Caption := String.Format('%s (%s)', [Expression, TypeName]);
  SetGridValues(EvalResult);
  SetValueEdit(EvalResult);
end;

procedure TfmIntegerUpdater.SetClosedCallback(ClosedProc: TOTAVisualizerClosedProcedure);
begin
  FClosedCallback := ClosedProc;
end;

procedure TfmIntegerUpdater.sgValuesSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  case ARow of
    0: ebValue.Text := String.Format('%s%s', [TVisualizerConfig.HexPrefix, (Sender as TStringGrid).Cells[1, ARow]]);
    1: ebValue.Text := (Sender as TStringGrid).Cells[1, ARow];
    2: ebValue.Text := (Sender as TStringGrid).Cells[1, ARow];
    3: ebValue.Text := (Sender as TStringGrid).Cells[1, ARow];
  end;
end;

end.
