program VisualizerTester;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  WinApi.Windows;

function GetSum(Operand1, Operand2: WORD): Integer;
var
  LSum : Integer;
begin
  LSum := Operand1 + Operand2;
  Result := LSum + 2;
end;

procedure StringsSample;
var
  LTemp : TStrings;
begin
  LTemp := TStringList.Create;
  try
    LTemp.Add('Goodbye');
    LTemp.Add('Cruel');
    LTemp.Add('World');
  finally
    LTemp.Free;
  end;
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
    StringsSample;
    { TODO -oUser -cConsole Main : Insert code here }
    LSumOffset := GetSum(65535, $04);
    Writeln('Output: ', LSumOffset);

    WaitForSingleObject(FEvent, INFINITE);
    CloseHandle(FEvent);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
