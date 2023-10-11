unit Visualizers.Debugger;

interface

uses
  System.SysUtils, System.Classes, WinApi.Windows, Vcl.Forms, ToolsApi,
  Visualizers.Config, Visualizers.Formatter, Visualizers.ExernalViewerUpater;

{
  There are three interfaces we must implement in order to complete our visualizer

  IOTADebuggerVisualizer
  ======================
  This interface provides the IDE with basic information about our visualizer.
  This includes it's name, description, identifier (used as key name for it in
  the Registry), the number of types it supports, and the names of those types.
  The Name and Description are shown in the Tools | Options dialog.

  IOTADebuggerVisualizerValueReplacer
  ===================================
  Implementing this interface allows us to control what a developer sees when
  hovering the mouse over a variable in the IDE as well as in the evaluator.

  IOTADebuggerVisualizerExternalViewer
  ====================================
  Implementing this interface allows us to control what a developer sees when
  hovering the mouse over a variable in the IDE as well as in the evaluator.
}

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

{ Implementation of IOTADebuggerVisualizer.GetSupportedTypeCount }
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

{ Implementation of IOTADebuggerVisualizer.GetSupportedType }
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

{ Implementation of IOTADebuggerVisualizer.GetVisualizerIdentifier }
function TDebuggerVisualizer.GetVisualizerIdentifier: string;
begin
  Result := VISUALIZER_IDENTIFIER;
end;

{ Implementation of IOTADebuggerVisualizer.GetVisualizerName }
function TDebuggerVisualizer.GetVisualizerName: string;
begin
  Result := 'ATS Integer Visualizer';
end;

{ Implementation of IOTADebuggerVisualizer.GetVisualizerDescription }
function TDebuggerVisualizer.GetVisualizerDescription: string;
begin
  Result := 'Integer Value Visualizer';
end;

{ Implementation of IOTADebuggerVisualizerValueReplacer.GetReplacementValue }
function TDebuggerVisualizer.GetReplacementValue(const Expression, TypeName, EvalResult: string): string;
var
  LUpperType: String;
  LRec: TDebugIntValue;
begin
  LUpperType := TypeName.ToUpper;
  OutputDebugString(PChar(String.Format('Expression: %s. Typename: %s', [Expression, TypeName])));
  try
    Result := EvalResult;
    if ('INTEGER' =  LUpperType) or (('NATIVEINT' = TypeName) and (4 = SizeOf(NativeInt))) then
    begin
      LRec := TDebugIntValue.CreateSigned(StrToInt64(EvalResult), SizeOf(Integer));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('SHORTINT' = LUpperType) then
    begin
      LRec := TDebugIntValue.CreateSigned(StrToInt64(EvalResult), SizeOf(ShortInt));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('SMALLINT' = LUpperType) then
    begin
      LRec := TDebugIntValue.CreateSigned(StrToInt64(EvalResult), SizeOf(SmallInt));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('INT64' =  LUpperType) or (('NATIVEINT' = TypeName) and (8 = SizeOf(NativeInt))) then
    begin
      LRec := TDebugIntValue.CreateSigned(StrToInt64(EvalResult), SizeOf(Int64));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('CARDINAL' =  LUpperType) or (('NATIVEUINT' = TypeName) and (4 = SizeOf(NativeUInt))) then
    begin
      LRec := TDebugIntValue.CreateUnsigned(StrToInt64(EvalResult), SizeOf(Cardinal));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('BYTE' = LUpperType) then
    begin
      LRec := TDebugIntValue.CreateUnsigned(StrToInt64(EvalResult), SizeOf(Byte));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('WORD' = LUpperType) then
    begin
      LRec := TDebugIntValue.CreateUnsigned(StrToInt64(EvalResult), SizeOf(Word));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end
    else if ('UINT64' =  LUpperType) or (('NATIVEUINT' = TypeName) and (8 = SizeOf(NativeInt))) then
    begin
      LRec := TDebugIntValue.CreateUnsigned(StrToInt64(EvalResult), SizeOf(UInt64));
      Result := LRec.Format(TVisualizerConfig.DefaultView);
    end;
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

function TDebuggerVisualizer.GetMenuText: string;
begin
  Result := 'ATS Integer Viewer';
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
