unit Visualizers.ExernalViewerUpater;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ToolsApi, Vcl.Grids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Visualizers.Config, Visualizers.Formatter;

type
  TfmIntegerUpdater = class(TForm, IOTADebuggerVisualizerExternalViewerUpdater)
    Panel1: TPanel;
    pnBottom: TPanel;
    gbValues: TGroupBox;
    sgValues: TStringGrid;
    gbValue: TGroupBox;
    ebValue: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sgValuesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
  private
    { Private declarations }
    FClosedCallback: TOTAVisualizerClosedProcedure;
    FTypeName: String;
    procedure SetGridValues(AEvalResult: String);
    procedure SetValueEdit(AEvalResult: String);
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
  SetValueEdit(AEvalResult);
end;

procedure TfmIntegerUpdater.SetGridValues(AEvalResult: String);
begin
  if ('INTEGER' =  FTypeName) or (('NATIVEINT' = FTypeName) and (4 = SizeOf(NativeInt))) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.IntegerEvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.IntegerEvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.IntegerEvalResultToOct(AEvalResult);
    sgValues.Cells[1, 3] :=  TFormatter.IntegerEvalResultToBin(AEvalResult);
  end
  else if ('CARDINAL' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.CardinalEvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.CardinalEvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.CardinalEvalResultToOct(AEvalResult);
    sgValues.Cells[1, 3] :=  TFormatter.CardinalEvalResultToBin(AEvalResult);
  end
  else if ('SHORTINT' = FTypeName) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.ShortIntEvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.ShortIntEvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.ShortIntEvalResultToOct(AEvalResult);
  end
  else if ('BYTE' = FTypeName) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.ByteEvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.ByteEvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.ByteEvalResultToOct(AEvalResult);
  end
  else if ('SMALLINT' = FTypeName) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.SmallIntEvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.SmallIntEvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.SmallIntEvalResultToOct(AEvalResult);
  end
  else if ('WORD' = FTypeName) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.WordEvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.WordEvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.WordEvalResultToOct(AEvalResult);
  end
  else if ('INT64' =  FTypeName) or (('NATIVEINT' = FTypeName) and (8 = SizeOf(NativeInt))) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.Int64EvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.Int64EvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.Int64EvalResultToOct(AEvalResult);
  end
  else if ('UINT64' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    sgValues.Cells[1, 0] :=  TFormatter.UInt64EvalResultToHex(AEvalResult);
    sgValues.Cells[1, 1] :=  TFormatter.UInt64EvalResultToDec(AEvalResult);
    sgValues.Cells[1, 2] :=  TFormatter.UInt64EvalResultToOct(AEvalResult);
  end;
end;

procedure TfmIntegerUpdater.SetValueEdit(AEvalResult: String);
begin
  if ('INTEGER' =  FTypeName) or (('NATIVEINT' = FTypeName) and (4 = SizeOf(NativeInt))) then
  begin
    ebValue.Text := TFormatter.FormatInt32EvalResult(AEvalResult);
  end
  else if ('CARDINAL' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    ebValue.Text := TFormatter.FormatUInt32EvalResult(AEvalResult);
  end
  else if ('SHORTINT' = FTypeName) then
  begin
    ebValue.Text := TFormatter.FormatShortIntEvalResult(AEvalResult);
  end
  else if ('BYTE' = FTypeName) then
  begin
    ebValue.Text := TFormatter.FormatByteEvalResult(AEvalResult);
  end
  else if ('SMALLINT' = FTypeName) then
  begin
    ebValue.Text := TFormatter.FormatSmallIntEvalResult(AEvalResult);
  end
  else if ('WORD' = FTypeName) then
  begin
    ebValue.Text := TFormatter.FormatWordEvalResult(AEvalResult);
  end
  else if ('INT64' =  FTypeName) or (('NATIVEINT' = FTypeName) and (8 = SizeOf(NativeInt))) then
  begin
    ebValue.Text := TFormatter.FormatInt64EvalResult(AEvalResult);
  end
  else if ('UINT64' =  FTypeName) or (('NATIVEUINT' = FTypeName) and (4 = SizeOf(NativeUInt))) then
  begin
    ebValue.Text := TFormatter.FormatUInt64EvalResult(AEvalResult);
  end;
end;

procedure TfmIntegerUpdater.CloseVisualizer;
begin
  Self.Close;
end;

procedure TfmIntegerUpdater.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(FClosedCallback) then
    FClosedCallback;
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
