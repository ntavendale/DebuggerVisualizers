unit Visualizers.Wizard;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Dialogs, ToolsAPI,
  WinApi.Windows, Visualizers.Config.Form, Visualizers.Config, DeploymentAPI;

type
  TVisualizersWizard = class(TInterfacedObject, IOTAWizard, IOTAMenuWizard)
   public
     procedure Execute;
     function GetIDString: String;
     function GetName: String;
     function GetState: TWizardState;
     procedure AfterSave;
     procedure BeforeSave;
     procedure Destroyed;
     procedure Modified;
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
  Result := 'Oamaru Debugger Visualizers';
end;

function TVisualizersWizard.GetName: String;
begin
  Result := 'Oamaru Debugger Visualizers';
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
  //
end;

function TVisualizersWizard.GetMenuText: string;
begin
  Result := 'Oamaru Debugger Visualizers';
end;

end.
