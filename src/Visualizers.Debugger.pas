unit Visualizers.Debugger;

interface

uses
  System.SysUtils, System.Classes, WinApi.Windows, Vcl.Forms, ToolsApi,
  Visualizers.Config, Visualizers.Formatter, Visualizers.ExernalViewerUpater;

type
  TDebuggerVisualizer = class(TInterfacedObject,
                              IOTADebuggerVisualizer,
                              IOTADebuggerVisualizerValueReplacer,
                              IOTADebuggerVisualizerExternalViewer)
  private
  { Private declarations }
  public
    { Public declarations }
    function GetSupportedTypeCount: Integer;
    procedure GetSupportedType(Index: Integer; var TypeName: string; var AllDescendants: Boolean); overload;
    function GetVisualizerIdentifier: string;
    function GetVisualizerName: string;
    function GetVisualizerDescription: string;
    function GetReplacementValue(const Expression, TypeName, EvalResult: string): string;
    function GetMenuText: string;
    { Show is called when the user selects this visualizer type from the list
      of the installed visualizers for a given type.  You should create and
      show the UI of your visualizer and return an interface that is used
      by the debugger to communicate with the visualizer. "SuggestedLeft" and
      "SuggestedTop" are the suggested screen coordinates for the visualizer }
    function Show(const Expression, TypeName, EvalResult: string;
      SuggestedLeft, SuggestedTop: Integer): IOTADebuggerVisualizerExternalViewerUpdater;
  end;



implementation

function TDebuggerVisualizer.GetSupportedTypeCount: Integer;
begin
  try
    Result := 10;
  except
    on E:Exception do
    begin
      Result := 0;
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
    end;
  end;
end;

procedure TDebuggerVisualizer.GetSupportedType(Index: Integer; var TypeName: string; var AllDescendants: Boolean);
var
  LMsg: String;
begin
  try
    LMsg := String.Format('GetSupportedType Index: %d', [Index]);
    OutputDebugString(PChar(LMsg));

    if 0 = Index then
    begin
      TypeName := 'Integer';
      AllDescendants := TRUE;
    end
    else if 1 = Index then
    begin
      TypeName := 'ShortInt';
      AllDescendants := TRUE;
    end
    else if 2 = Index then
    begin
      TypeName := 'SmallInt';
      AllDescendants := TRUE;
    end
    else if 3 = Index then
    begin
      TypeName := 'NativeInt';
      AllDescendants := TRUE;
    end
    else if 4 = Index then
    begin
      TypeName := 'Cardinal';
      AllDescendants := TRUE;
    end
    else if 5 = Index then
    begin
      TypeName := 'Byte';
      AllDescendants := TRUE;
    end
    else if 6 = Index then
    begin
      TypeName := 'Word';
      AllDescendants := TRUE;
    end
    else if 7 = Index then
    begin
      TypeName := 'NativeUInt';
      AllDescendants := TRUE;
    end
    else if 8 = Index then
    begin
      TypeName := 'Int64';
      AllDescendants := TRUE;
    end
    else if 9 = Index then
    begin
      TypeName := 'UInt64';
      AllDescendants := TRUE;
    end;
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

function TDebuggerVisualizer.GetVisualizerIdentifier: string;
begin
  Result := 'OamaruVisualizer';
end;

function TDebuggerVisualizer.GetVisualizerName: string;
begin
  Result := 'Oamaru Integer Visualizer';
end;

function TDebuggerVisualizer.GetVisualizerDescription: string;
begin
  Result := 'Integer Value Visualizer';
end;

function TDebuggerVisualizer.GetReplacementValue(const Expression, TypeName, EvalResult: string): string;
var
  LUpperType: String;
begin
  LUpperType := TypeName.ToUpper;
  OutputDebugString(PChar(String.Format('Expression: %s. Typename: %s', [Expression, TypeName])));
  try
    Result := EvalResult;
    if ('INTEGER' =  LUpperType) or (('NATIVEINT' = TypeName) and (4 = SizeOf(NativeInt))) then
    begin
      Result := TFormatter.FormatInt32EvalResult(EvalResult);
    end
    else if ('SHORTINT' = LUpperType) then
    begin
      Result := TFormatter.FormatShortIntEvalResult(EvalResult);
    end
    else if ('SMALLINT' = LUpperType) then
    begin
      Result := TFormatter.FormatShortIntEvalResult(EvalResult);
    end
    else if ('INT64' =  LUpperType) or (('NATIVEINT' = TypeName) and (8 = SizeOf(NativeInt))) then
    begin
      Result := TFormatter.FormatInt64EvalResult(EvalResult);
    end;
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

function TDebuggerVisualizer.GetMenuText: string;
begin
  Result := 'Oamaru Integer Viewer'
end;

function TDebuggerVisualizer.Show(const Expression, TypeName, EvalResult: string; SuggestedLeft, SuggestedTop: Integer): IOTADebuggerVisualizerExternalViewerUpdater;
var
  fm: TfmIntegerUpdater;
begin
  fm := TfmIntegerUpdater.Create(nil, Expression, TypeName, EvalResult);
  fm.Left := SuggestedLeft;
  fm.Top := SuggestedTop;
  fm.Show;
  Result := fm;
end;

end.
