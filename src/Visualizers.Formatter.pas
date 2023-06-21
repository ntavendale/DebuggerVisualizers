unit Visualizers.Formatter;

interface

uses
  System.SysUtils, System.Classes, WinApi.Windows, Visualizers.Config;

type
  TFormatter = class
  public
    { Public declarations }
    class function IntToOct(AValue: Integer; ADigits: Integer): String;

    class function ShortIntEvalResultToHex(AValue: String): String;
    class function ByteEvalResultToHex(AValue: String): String;
    class function SmallIntEvalResultToHex(AValue: String): String;
    class function WordEvalResultToHex(AValue: String): String;
    class function IntegerEvalResultToHex(AValue: String): String;
    class function CardinalEvalResultToHex(AValue: String): String;
    class function Int64EvalResultToHex(AValue: String): String;
    class function UInt64EvalResultToHex(AValue: String): String;

    class function ShortIntEvalResultToDec(AValue: String): String;
    class function ByteEvalResultToDec(AValue: String): String;
    class function SmallIntEvalResultToDec(AValue: String): String;
    class function WordEvalResultToDec(AValue: String): String;
    class function IntegerEvalResultToDec(AValue: String): String;
    class function CardinalEvalResultToDec(AValue: String): String;
    class function Int64EvalResultToDec(AValue: String): String;
    class function UInt64EvalResultToDec(AValue: String): String;

    class function ShortIntEvalResultToOct(AValue: String): String;
    class function ByteEvalResultToOct(AValue: String): String;
    class function SmallIntEvalResultToOct(AValue: String): String;
    class function WordEvalResultToOct(AValue: String): String;
    class function IntegerEvalResultToOct(AValue: String): String;
    class function CardinalEvalResultToOct(AValue: String): String;
    class function Int64EvalResultToOct(AValue: String): String;
    class function UInt64EvalResultToOct(AValue: String): String;

    class function ShortIntEvalResultToBin(AValue: String): String;
    class function ByteEvalResultToBin(AValue: String): String;
    class function SmallIntEvalResultToBin(AValue: String): String;
    class function WordEvalResultToBin(AValue: String): String;
    class function IntegerEvalResultToBin(AValue: String): String;
    class function CardinalEvalResultToBin(AValue: String): String;
    class function Int64EvalResultToBin(AValue: String): String;
    class function UInt64EvalResultToBin(AValue: String): String;

    class function FormatShortIntEvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatByteEvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatSmallIntEvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatWordEvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatInt32EvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatUInt32EvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatInt64EvalResult(EvalResult: String; AView: String = String.Empty): String;
    class function FormatUInt64EvalResult(EvalResult: String; AView: String = String.Empty): String;
  end;

implementation

class function TFormatter.IntToOct(AValue: Longint; ADigits: Integer): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
begin
  LOct := TStringBuilder.Create;
  try
    while AValue <> 0 do
    begin
      LRemainder  := AValue mod 8;
      AValue := AValue div 8;
      LOct.Insert(0,LRemainder);
    end;
    Result := LOct.ToString;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.ShortIntEvalResultToHex(AValue: String): String;
var
  LInt: ShortInt;
begin
  LInt := StrToIntDef(AValue, 0);
  Result := IntToHex(LInt, 2);
end;

class function TFormatter.ByteEvalResultToHex(AValue: String): String;
var
  LInt: Byte;
begin
  LInt := StrToUIntDef(AValue, 0);
  Result := IntToHex(LInt, 2);
end;

class function TFormatter.SmallIntEvalResultToHex(AValue: String): String;
var
  LInt: SmallInt;
begin
  LInt := StrToIntDef(AValue, 0);
  Result := IntToHex(LInt, 4);
end;

class function TFormatter.WordEvalResultToHex(AValue: String): String;
var
  LInt: Word;
begin
  LInt := StrToUIntDef(AValue, 0);
  Result := IntToHex(LInt, 4);
end;

class function TFormatter.IntegerEvalResultToHex(AValue: String): String;
var
  LInt: Integer;
begin
  LInt := StrToIntDef(AValue, 0);
  Result := IntToHex(LInt, 8);
end;

class function TFormatter.CardinalEvalResultToHex(AValue: String): String;
var
  LInt: Cardinal;
begin
  LInt := StrToUIntDef(AValue, 0);
  Result := IntToHex(LInt, 8);
end;

class function TFormatter.Int64EvalResultToHex(AValue: String): String;
var
  LInt: Int64;
begin
  LInt := StrToInt64Def(AValue, 0);
  Result := IntToHex(LInt, 16);
end;

class function TFormatter.UInt64EvalResultToHex(AValue: String): String;
var
  LInt: UInt64;
begin
  LInt := StrToUInt64Def(AValue, 0);
  Result := IntToHex(LInt, 16);
end;

class function TFormatter.ShortIntEvalResultToDec(AValue: String): String;
var
  LInt: ShortInt;
begin
  LInt := StrToIntDef(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.ByteEvalResultToDec(AValue: String): String;
var
  LInt: Byte;
begin
  LInt := StrToUIntDef(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.SmallIntEvalResultToDec(AValue: String): String;
var
  LInt: SmallInt;
begin
  LInt := StrToIntDef(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.WordEvalResultToDec(AValue: String): String;
var
  LInt: Word;
begin
  LInt := StrToUIntDef(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.IntegerEvalResultToDec(AValue: String): String;
var
  LInt: Integer;
begin
  LInt := StrToIntDef(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.CardinalEvalResultToDec(AValue: String): String;
var
  LInt: Cardinal;
begin
  LInt := StrToUIntDef(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.Int64EvalResultToDec(AValue: String): String;
var
  LInt: Int64;
begin
  LInt := StrToInt64Def(AValue, 0);
  Result := IntToStr(LInt);
end;

class function TFormatter.UInt64EvalResultToDec(AValue: String): String;
var
  LInt: UInt64;
begin
  LInt := StrToUInt64Def(AValue, 0);
  Result := UIntToStr(LInt);
end;

class function TFormatter.ShortIntEvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: ShortInt;
begin
  LInteger:= StrToIntDef(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.ByteEvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: Byte;
begin
  LInteger:= StrToIntDef(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.SmallIntEvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: SmallInt;
begin
  LInteger:= StrToIntDef(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.WordEvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: Word;
begin
  LInteger:= StrToUIntDef(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.IntegerEvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: Integer;
begin
  LInteger:= StrToIntDef(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.CardinalEvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: Cardinal;
begin
  LInteger:= StrToUIntDef(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.Int64EvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: Int64;
begin
  LInteger:= StrToInt64Def(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.UInt64EvalResultToOct(AValue: String): String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LIntermediate: String;
  LIndex: Integer;
  LInteger: UInt64;
begin
  LInteger:= StrToUInt64Def(AValue, 0);
  LOct := TStringBuilder.Create;
  try
    while LInteger <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
        LOct.Insert(0,' ');
      LRemainder  := LInteger mod 8;
      LInteger := LInteger div 8;
      LOct.Insert(0,LRemainder);
    end;
    LIntermediate := LOct.ToString;
    LIndex := LIntermediate.IndexOf(' ');
    if ((-1 = LIndex) and (LIntermediate.Length = 1)) or (1 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 2, '0')
    else if ((-1 = LIndex) and (LIntermediate.Length = 2)) or (2 = LIndex) then
      Result:= LIntermediate.PadLeft(LIntermediate.Length + 1, '0')
    else
      Result:= LIntermediate;
  finally
    LOct.Free;
  end;
end;

class function TFormatter.ShortIntEvalResultToBin(AValue: String): String;
var
  LInt: ShortInt;
  LByte: Byte;
  LBinary: TStringBuilder;
begin
  LInt := StrToIntDef(AValue, 0);
  LByte := $80;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LByte > 0 do
    begin
      if LByte = (LByte and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if 4 = LBinary.Length then
        LBinary.Append(' ');
      LByte := LByte shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.ByteEvalResultToBin(AValue: String): String;
var
  LInt: Byte;
  LByte: Byte;
  LBinary: TStringBuilder;
begin
  LInt := StrToUIntDef(AValue, 0);
  LByte := $80;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LByte > 0 do
    begin
      if LByte = (LByte and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if 4 = LBinary.Length then
        LBinary.Append(' ');
      LByte := LByte shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.SmallIntEvalResultToBin(AValue: String): String;
var
  LInt: SmallInt;
  LByte: Word;
  LBinary: TStringBuilder;
begin
  LInt := StrToIntDef(AValue, 0);
  LByte := $8000;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LByte > 0 do
    begin
      if LByte = (LByte and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if (LBinary.Length in [4, 9, 14]) then
        LBinary.Append(' ');
      LByte := LByte shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.WordEvalResultToBin(AValue: String): String;
var
  LInt: Word;
  LByte: Word;
  LBinary: TStringBuilder;
begin
  LInt := StrToUIntDef(AValue, 0);
  LByte := $8000;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LByte > 0 do
    begin
      if LByte = (LByte and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if (LBinary.Length in [4, 9, 14]) then
        LBinary.Append(' ');
      LByte := LByte shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.IntegerEvalResultToBin(AValue: String): String;
var
  LInt: Integer;
  LByte: Cardinal;
  LBinary: TStringBuilder;
begin
  LInt := StrToIntDef(AValue, 0);
  LByte := $80000000;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LByte > 0 do
    begin
      if LByte = (LByte and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if (LBinary.Length in [4, 9, 14, 19, 24, 29, 34]) then
        LBinary.Append(' ');
      LByte := LByte shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.CardinalEvalResultToBin(AValue: String): String;
var
  LInt: Cardinal;
  LByte: Cardinal;
  LBinary: TStringBuilder;
begin
  LInt := StrToUIntDef(AValue, 0);
  LByte := $80000000;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LByte > 0 do
    begin
      if LByte = (LByte and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if (LBinary.Length in [4, 9, 14, 19, 24, 29, 34]) then
        LBinary.Append(' ');
      LByte := LByte shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.Int64EvalResultToBin(AValue: String): String;
var
  LInt: Int64;
  LBytes: UInt64;
  LBinary: TStringBuilder;
begin
  LInt := StrToInt64Def(AValue, 0);
  LBytes :=  $8000000000000000;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LBytes > 0 do
    begin
      if LBytes = (LBytes and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if (LBinary.Length in [4, 9, 14, 19, 24, 29, 34, 39, 44, 49, 54, 59, 64, 69, 74]) then
        LBinary.Append(' ');
      LBytes := LBytes shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.UInt64EvalResultToBin(AValue: String): String;
var
  LInt: Uint64;
  LBytes: Uint64;
  LBinary: TStringBuilder;
begin
  LInt := StrToUInt64Def(AValue, 0);
  LBytes := $8000000000000000;
  Result := String.Empty;
  LBinary := TStringBuilder.Create;
  try
    while LBytes > 0 do
    begin
      if LBytes = (LBytes and LInt) then
        LBinary.Append('1')
      else
        LBinary.Append('0');
      if (LBinary.Length in [4, 9, 14, 19, 24, 29, 34, 39, 44, 49, 54, 59, 64, 69, 74]) then
        LBinary.Append(' ');
      LBytes := LBytes shr 1;
    end;
    Result := LBinary.ToString;
  finally
    LBinary.Free;
  end;
end;

class function TFormatter.FormatShortIntEvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if (VIEW_HEX = LView) then
      String.Format('%s%s', [TVisualizerConfig.HexPrefix, ShortIntEvalResultToHex(EvalResult)])
    else if VIEW_OCT = LView then
      Result := ShortIntEvalResultToOct(EvalResult)
    else if VIEW_BIN = LView then
      Result := ShortIntEvalResultToBin(EvalResult)
    else
      Result := ShortIntEvalResultToDec(EvalResult);
    LMsg := String.Format('Type: 8 Bit Sigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatByteEvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      String.Format('%s%s', [TVisualizerConfig.HexPrefix, ByteEvalResultToHex(Evalresult)])
    else if VIEW_OCT = LView then
      Result := ByteEvalResultToOct(Evalresult)
    else if VIEW_BIN = LView then
      Result := ByteEvalResultToBin(Evalresult)
    else
      Result := ByteEvalResultToDec(Evalresult);
    LMsg := String.Format('Type: 8 Bit Sigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatSmallIntEvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      String.Format('%s%s', [TVisualizerConfig.HexPrefix, SmallIntEvalResultToHex(EvalResult)])
    else if VIEW_OCT = LView then
      Result := SmallIntEvalResultToOct(EvalResult)
    else if VIEW_BIN = LView then
      Result := SmallIntEvalResultToBin(EvalResult)
    else
      Result := SmallIntEvalResultToDec(EvalResult);
    LMsg := String.Format('Type: 8 Bit Sigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatWordEvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      String.Format('%s%s', [TVisualizerConfig.HexPrefix, WordEvalResultToHex(EvalResult)])
    else if VIEW_OCT = LView then
      Result := WordEvalResultToOct(EvalResult)
    else if VIEW_BIN = LView then
      Result := WordEvalResultToBin(EvalResult)
    else
      Result := WordEvalResultToDec(EvalResult);
    LMsg := String.Format('Type: 8 Bit Sigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatInt32EvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      Result := String.Format('%s%s', [TVisualizerConfig.HexPrefix, IntegerEvalResultToHex(Evalresult)])
    else if VIEW_OCT = LView then
      Result := IntegerEvalResultToOct(Evalresult)
    else if VIEW_BIN = LView then
      Result := IntegerEvalResultToBin(Evalresult)
    else
      Result := IntegerEvalResultToDec(Evalresult);

    LMsg := String.Format('Type: 32 Bit Sigend Integer. EvalResult: %s. NewResult: %s. View as: %s. Prefix: %s.', [EvalResult, Result, LView, TVisualizerConfig.HexPrefix]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatUInt32EvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      String.Format('%s%s', [TVisualizerConfig.HexPrefix, CardinalEvalResultToHex(Evalresult)])
    else if VIEW_OCT = LView then
      Result := CardinalEvalResultToOct(Evalresult)
    else if VIEW_BIN = LView then
      Result := CardinalEvalResultToBin(Evalresult)
    else
      Result := CardinalEvalResultToDec(Evalresult);
    LMsg := String.Format('Type: 32 Bit Sigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatInt64EvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      Result := String.Format('%s%s', [TVisualizerConfig.HexPrefix, Int64EvalResultToHex(Evalresult)])
    else if VIEW_OCT = LView then
      Result := Int64EvalResultToOct(Evalresult)
    else if VIEW_BIN = LView then
      Result := Int64EvalResultToBin(Evalresult)
    else
      Result := Int64EvalResultToDec(Evalresult);
    LMsg := String.Format('Type: 64 Bit Sigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

class function TFormatter.FormatUInt64EvalResult(EvalResult: String; AView: String = String.Empty): String;
var
  LMsg: String;
  LView: String;
begin
  LView := AView;
  if String.IsNullOrWhiteSpace(LView) then
    LView := TVisualizerConfig.DefaultView;

  Result := EvalResult;
  try
    if VIEW_HEX = LView then
      Result := String.Format('%s%s', [TVisualizerConfig.HexPrefix, UInt64EvalResultToHex(Evalresult)])
    else if VIEW_OCT = LView then
      Result := UInt64EvalResultToOct(Evalresult)
    else if VIEW_BIN = LView then
      Result := UInt64EvalResultToBin(Evalresult)
    else
      Result := UInt64EvalResultToDec(Evalresult);
    LMsg := String.Format('Type: 64 Bit Unsigend Integer. EvalResult: %s. NewResult: %s', [EvalResult, Result]);
    OutputDebugString(PChar(LMsg));
  except
    on E:Exception do
      OutputDebugString(PChar(String.Format('%s: %s', [E.ClassType.ClassName + ': ' + E.Message])));
  end;
end;

end.
