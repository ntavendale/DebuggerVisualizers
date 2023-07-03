program VisualizerTester;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  WinApi.Windows;

function GetSum(Operand1, Operand2: Int64): Int64;
var
  LSum : Int64;
begin
  LSum := Operand1 + Operand2;
  Result := LSum + 2;
end;

var
  FEvent: THandle;
  LSumOffset: Int64;

function ConsoleEventProc(CtrlType: DWORD): BOOL; stdcall;
begin
  if (CTRL_CLOSE_EVENT = CtrlType) or (CTRL_C_EVENT = CtrlType) then
    SetEvent(FEvent);
  Result := True;
end;

begin
  try
    FEvent := CreateEvent(nil, TRUE, FALSE, nil);
    { TODO -oUser -cConsole Main : Insert code here }
    LSumOffset := GetSum(4294967297, -$04);
    Writeln('Output: ', LSumOffset);

    WaitForSingleObject(FEvent, INFINITE);
    CloseHandle(FEvent);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
