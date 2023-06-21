unit Visualizers.Config;

interface

uses
  System.SysUtils, System.Classes, System.Json, WinApi.Windows, System.Win.Registry;

const
  VIEW_HEX = 'hex';
  VIEW_OCT = 'oct';
  VIEW_DEC = 'dec';
  VIEW_BIN = 'bin';

  HEX_PREFIX_NONE   = '';
  HEX_PREFIX_CPP    = '0x';
  HEX_PREFIX_DELPHI = '$';

type
  TVisualizerConfig = class
  private
    class var FIsDll: Boolean;
    class var FDefaultView: String;
    class var FHexPrefix: String;
    class procedure FromJson(AValue: String);
    class function ToJson: String;
  public
    class property IsDll: Boolean read FIsDll write FIsDll;
    class property DefaultView: String read FDefaultView write FDefaultView;
    class property HexPrefix: String read FHexPrefix write FHexPrefix;
    class procedure Load;
    class procedure Save;
  end;

implementation

var LDelphiVer: Integer = 0;

function GetVer: String;
begin
  Result := String.Empty;
  {$IFDEF VER330}
  Result := '20.0'; //10.3 Rio
  {$ENDIF};
  {$IFDEF VER340}
  Result := '21.0'; //10.4 Sysdney
  {$ENDIF};
  {$IFDEF VER350}
  Result := '22.0'; //11.1 Alexandria
  {$ENDIF};
end;

class procedure TVisualizerConfig.FromJson(AValue: String);
var
  LJson: TJSONObject;
  LDefaultView: String;
begin
  LJson := TJSONObject.ParseJSONValue(AValue) as TJSONObject;
  if nil = LJson then
  begin
    OutputDebugString('Parse Failed');
    EXIT;
  end;
  try
    FDefaultView := VIEW_DEC;
    if nil <> LJson.Values['defaultView'] then
    begin
      LDefaultView := LJson.Values['defaultView'].Value.ToLower;
      if (VIEW_HEX = LDefaultView) or (VIEW_DEC = LDefaultView) or (VIEW_OCT = LDefaultView) or (VIEW_BIN = LDefaultView) then
        FDefaultView := LDefaultView;
    end;
    FHexPrefix := HEX_PREFIX_NONE;
    if nil <> LJson.Values['hexPrefix'] then
    begin
      FHexPrefix := LJson.Values['hexPrefix'].Value;
      if (HEX_PREFIX_NONE <> FHexPrefix) and (HEX_PREFIX_CPP <> FHexPrefix) and (HEX_PREFIX_DELPHI <> FHexPrefix) then
        FHexPrefix := HEX_PREFIX_NONE;
    end;
  finally
    LJson.Free;
  end;
end;

class function TVisualizerConfig.ToJson: String;
var
  LJson: TJSONObject;
begin
  LJson := TJSONObject.Create;
  try
    LJson.AddPair('defaultView', FDefaultView);
    LJson.AddPair('hexPrefix', FHexPrefix);
    Result := LJson.ToJSON;
  finally
    LJson.Free;
  end;
end;

class procedure TVisualizerConfig.Load;
var
  LReg: TRegistry;
  LKey: String;
  LData: String;
begin
  LKey := String.Format('Software\Oamaru\Delphi\OTA\%s\Visualizers', [GetVer]);
  LReg := TRegistry.Create(KEY_READ);
  try
    LReg.RootKey:= HKEY_CURRENT_USER;
    if LReg.OpenKey(LKey, FALSE) then
    begin
      LData := LReg.ReadString('DebuggerConfig');
      FromJson(LData);
      LReg.CloseKey;
    end;
  finally
    LReg.Free;
  end;
end;

class procedure TVisualizerConfig.Save;
var
  LReg: TRegistry;
LKey: String;
begin
  LKey := String.Format('Software\Oamaru\Delphi\OTA\%s\Visualizers', [GetVer]);
  LReg := TRegistry.Create(KEY_ALL_ACCESS);
  try
    LReg.RootKey:= HKEY_CURRENT_USER;
    if LReg.OpenKey(LKey, TRUE) then
    begin
      OutputDebugString(PChar('Saved To Key: ' + LKey));
      LReg.WriteString('DebuggerConfig', ToJson);
      LReg.CloseKey;
    end else
    begin
      LKey := String.Format('Software\Oamaru\Delphi\OTA\%s\Visualizers', [GetVer]);
      OutputDebugString(PChar('Could not OpenKey: ' + LKey));
    end;
  finally
    LReg.Free;
  end;
end;

end.
