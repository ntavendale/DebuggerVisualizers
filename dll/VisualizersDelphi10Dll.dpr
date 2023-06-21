library VisualizersDelphi10Dll;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

// To get dll to see ToolsApi.pas etc and compile you need to have the correct
// packages referenced in the project settings.
//
// 1. Go into Project Options->Packages->Runtime Packages
// 2. Check "Link With Runtime Packages"
// 3. Put DesignIDE in packages list. Remove everything else.
//
// Dpn't bother trying to put -LUDeseginIDE in the compiler options. It
// doesn't work (at least not in Delphi projects, I don't know about C++ Builder)
// and the coompiler just spits out a message about an invalid compiler option.

uses
  System.SysUtils,
  System.Classes,
  WinApi.Windows,
  ToolsAPI,
  Visualizers.Debugger in '..\src\Visualizers.Debugger.pas',
  Visualizers.Config in '..\src\Visualizers.Config.pas',
  Visualizers.Registration in '..\src\Visualizers.Registration.pas',
  Visualizers.Config.Form in '..\src\Visualizers.Config.Form.pas' {fmVisualizerConfig},
  Visualizers.Wizard in '..\src\Visualizers.Wizard.pas',
  Visualizers.Formatter in '..\src\Visualizers.Formatter.pas',
  Visualizers.ExernalViewerUpater in '..\src\Visualizers.ExernalViewerUpater.pas' {fmIntegerUpdater};

{$R *.res}

function InitWizard(const BorlandIDEServices : IBorlandIDEServices;  RegisterProc : TWizardRegisterProc;  var Terminate : TWizardTerminateProc) : Boolean; stdcall;
var
  LVisualizer: TDebuggerVisualizer;
begin
  TVisualizerConfig.IsDll := TRUE;
  // BorlandIDEServices is a global variable inmitilaized bu the Delphi/C++ builder IDE
  Result := nil <> BorlandIDEServices;
  if not Result then
  begin
    OutputDebugString('No IDE Services!');
    EXIT;
  end;

  // Set up Debugger Visualizer
  LVisualizer := InitialiseVisualizer(BorlandIDEServices);
  (BorlandIDEServices As IOTADebuggerServices).RegisterDebugVisualizer(LVisualizer);

  // Add help menu item to adjust defaults
  RegisterProc(InitialiseWizard(BorlandIDEServices));
end;

// WizardEntryPoint is a constant defined in ToolsApi.pas
// The IDE looks for a fuction with that specific name when
// loading the dll.
exports InitWizard name WizardEntryPoint;

begin
end.
