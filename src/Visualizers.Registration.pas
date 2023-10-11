unit Visualizers.Registration;

interface

uses
  System.SysUtils, System.Classes, WinApi.Windows, Vcl.Forms, ToolsApi,
  Visualizers.Debugger, Visualizers.Config, Visualizers.Wizard;

procedure Register;
procedure UnRegister;
function InitialiseVisualizer(BIDES : IBorlandIDEServices) : TDebuggerVisualizer;
function InitialiseWizard(BIDES : IBorlandIDEServices) : TVisualizersWizard;

implementation

var
  FVisualizer: IOTADebuggerVisualizer = nil;
  FWizardIndex : Integer = 0;

procedure Register;
var
  LWizard: TVisualizersWizard;
  DbgSvc: IOTADebuggerServices;
  WizSvc: IOTAWizardServices;
begin
  TVisualizerConfig.IsDll := FALSE;
  // Set up Debugger Visualizer
  FVisualizer := InitialiseVisualizer(BorlandIDEServices);
  if Supports(BorlandIDEServices, IOTADebuggerServices, DbgSvc) then
  begin
    DbgSvc.RegisterDebugVisualizer(FVisualizer);
    if Supports(BorlandIDEServices, IOTAWizardServices, WizSvc) then
    begin
      // Add help menu item to adjust defaults
      LWizard := InitialiseWizard(BorlandIDEServices);
      FWizardIndex := WizSvc.AddWizard(LWizard);
    end else
    begin
      DbgSvc.UnregisterDebugVisualizer(FVisualizer);
      OutputDebugString('IOTAWizardServices Not Supported');
    end;
  end else
    OutputDebugString('IOTADebuggerServices Not Supported');
end;

(** Removes the visualizer using the Debugger services If FWiardIndex > 0. **)
procedure UnRegister;
var
  DbgSvc: IOTADebuggerServices;
  WizSvc: IOTAWizardServices;
begin
  if (FWizardIndex > 0) and Supports(BorlandIDEServices, IOTAWizardServices, WizSvc) then
  begin
    WizSvc.RemoveWizard(FWizardIndex);
    if Supports(BorlandIDEServices, IOTADebuggerServices, DbgSvc) then
      DbgSvc.UnregisterDebugVisualizer(FVisualizer);
  end;
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

finalization
  if not TVisualizerConfig.IsDll then UnRegister;

end.
