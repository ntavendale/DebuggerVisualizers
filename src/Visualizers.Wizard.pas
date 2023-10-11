unit Visualizers.Wizard;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Dialogs, ToolsAPI,
  WinApi.Windows, Visualizers.Config.Form, Visualizers.Config, DeploymentAPI;


// Even though IOTAMenuWizard is also an IOTAWizard we still need to have both
// IOTAWizard interface specifically mentioned in order to use it with the
// IOTAWizardServices.AddWizard method.
type
  TVisualizersWizard = class(TInterfacedObject, IOTAWizard, IOTAMenuWizard)
   public
     { IOTANotifier implementation. IOTAWizard is also an IOTANotifier.        }
     { NOTE: ToolsAPI.pas contains a decalration for a TNotifierObject, which  }
     {       provides a do nothing stub for these methods, so you could just   }
     {       inherit from that instead of inheriting directly from             }
     {       TInterfacedObject and implementing the IOTANotifier stub methods  }
     {       yourself.                                                         }
     procedure AfterSave;
     procedure BeforeSave;
     procedure Destroyed;
     procedure Modified;

     { IOTAWizard implementation }
     procedure Execute;
     function GetIDString: String;
     function GetName: String;
     function GetState: TWizardState;

     { IOTAMenuWizard implementation }
     function GetMenuText: string;
   end;

implementation

procedure TVisualizersWizard.Execute;
var
  LForm: TfmVisualizerConfig;
begin
  OutputDebugString('In Execute');
  LForm := TfmVisualizerConfig.Create(nil);
  try
    LForm.ShowModal;
    TVisualizerConfig.Load;
  finally
    LForm.Free;
  end;
end;

function TVisualizersWizard.GetIDString: String;
begin
  Result := 'ATS Debugger Visualizers';
end;

function TVisualizersWizard.GetName: String;
begin
  Result := 'ATS Debugger Visualizers';
end;

function TVisualizersWizard.GetState: TWizardState;
begin
  // Only two posibilities:
  //   wsEnabled
  //   wsChecked
  Result := [wsEnabled];
end;

procedure TVisualizersWizard.AfterSave;
begin
  OutputDebugString('After Save');
end;

procedure TVisualizersWizard.BeforeSave;
begin
  OutputDebugString('Before Save');
end;

procedure TVisualizersWizard.Destroyed;
begin
  OutputDebugString('Destroyed');
end;

procedure TVisualizersWizard.Modified;
begin
  OutputDebugString('Modified');
end;

// Method for IOTAMenuWizard implementation
// Makes our wizard accessable from the manu.
// Unfortunately it's only the help menu.
function TVisualizersWizard.GetMenuText: string;
begin
  Result := 'ATS Debugger Visualizer';
end;

end.
