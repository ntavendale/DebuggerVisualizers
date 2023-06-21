unit Visualizers.Registration;

interface

uses
  System.SysUtils, System.Classes, WinApi.Windows, Vcl.Forms, ToolsApi,
  Visualizers.Debugger, Visualizers.Config, Visualizers.Wizard;

procedure Register;
function InitialiseVisualizer(BIDES : IBorlandIDEServices) : TDebuggerVisualizer;
function InitialiseWizard(BIDES : IBorlandIDEServices) : TVisualizersWizard;

implementation

var
  FVisualizer: IOTADebuggerVisualizer = nil;
  FWizardIndex : Integer = 0;

procedure Register;
var
  LWizard: TVisualizersWizard;
begin
  TVisualizerConfig.IsDll := FALSE;

  // Set up Debugger Visualizer
  FVisualizer := InitialiseVisualizer(BorlandIDEServices);
  (BorlandIDEServices As IOTADebuggerServices).RegisterDebugVisualizer(FVisualizer);

  // Add help menu item to adjust defaults
  LWizard := InitialiseWizard(BorlandIDEServices);
  FWizardIndex := (BorlandIDEServices As IOTAWizardServices).AddWizard(LWizard);
end;

function InitialiseVisualizer(BIDES : IBorlandIDEServices) : TDebuggerVisualizer;
begin
  OutputDebugString('Load Visualizer Config');
  TVisualizerConfig.Load;
  Result := TDebuggerVisualizer.Create;
  Application.Handle := (BIDES As IOTAServices).GetParentHandle;
end;

function InitialiseWizard(BIDES : IBorlandIDEServices) : TVisualizersWizard;
begin
  Result := TVisualizersWizard.Create;
  Application.Handle := (BIDES As IOTAServices).GetParentHandle;
end;

(** Do nothing **)
initialization
(** Removes the visualizer using the Debugger services IF FWiardIndex > 0. **)
finalization
  if not TVisualizerConfig.IsDll then
  begin
    (BorlandIDEServices As IOTADebuggerServices).UnregisterDebugVisualizer(FVisualizer);
    if FWizardIndex > 0 Then
    (BorlandIDEServices As IOTAWizardServices).RemoveWizard(FWizardIndex);
  end;

end.
