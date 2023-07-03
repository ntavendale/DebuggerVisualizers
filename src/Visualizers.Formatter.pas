unit Visualizers.Formatter;

interface

uses
  System.SysUtils, System.Classes, WinApi.Windows, Visualizers.Config,
  System.Generics.Collections, System.Math;

const
  LHexArray: array[0..255] of String = ('00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '0A', '0B', '0C', '0D', '0E', '0F', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '1A', '1B', '1C', '1D', '1E', '1F', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '2A', '2B', '2C', '2D', '2E', '2F', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '3A', '3B', '3C', '3D', '3E', '3F', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '4A', '4B', '4C', '4D', '4E', '4F', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '5A', '5B', '5C', '5D', '5E', '5F', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '6A', '6B', '6C', '6D', '6E', '6F', '70', '71', '72', '73', '74', '75', '76', '77', '78', '79', '7A', '7B', '7C', '7D', '7E', '7F',
                                        '80', '81', '82', '83', '84', '85', '86', '87', '88', '89', '8A', '8B', '8C', '8D', '8E', '8F', '90', '91', '92', '93', '94', '95', '96', '97', '98', '99', '9A', '9B', '9C', '9D', '9E', '9F', 'A0', 'A1', 'A2', 'A3', 'A4', 'A5', 'A6', 'A7', 'A8', 'A9', 'AA', 'AB', 'AC', 'AD', 'AE', 'AF', 'B0', 'B1', 'B2', 'B3', 'B4', 'B5', 'B6', 'B7', 'B8', 'B9', 'BA', 'BB', 'BC', 'BD', 'BE', 'BF', 'C0', 'C1', 'C2', 'C3', 'C4', 'C5', 'C6', 'C7', 'C8', 'C9', 'CA', 'CB', 'CC', 'CD', 'CE', 'CF', 'D0', 'D1', 'D2', 'D3', 'D4', 'D5', 'D6', 'D7', 'D8', 'D9', 'DA', 'DB', 'DC', 'DD', 'DE', 'DF', 'E0', 'E1', 'E2', 'E3', 'E4', 'E5', 'E6', 'E7', 'E8', 'E9', 'EA', 'EB', 'EC', 'ED', 'EE', 'EF', 'F0', 'F1', 'F2', 'F3', 'F4', 'F5', 'F6', 'F7', 'F8', 'F9', 'FA', 'FB', 'FC', 'FD', 'FE', 'FF');
  LBinArray: array[0..255] of String = ('0000 0000', '0000 0001', '0000 0010', '0000 0011', '0000 0100', '0000 0101', '0000 0110', '0000 0111', '0000 1000', '0000 1001', '0000 1010', '0000 1011', '0000 1100', '0000 1101', '0000 1110', '0000 1111', '0001 0000', '0001 0001', '0001 0010', '0001 0011', '0001 0100', '0001 0101', '0001 0110', '0001 0111', '0001 1000', '0001 1001', '0001 1010', '0001 1011', '0001 1100', '0001 1101', '0001 1110', '0001 1111', '0010 0000', '0010 0001', '0010 0010', '0010 0011', '0010 0100', '0010 0101', '0010 0110', '0010 0111', '0010 1000', '0010 1001', '0010 1010', '0010 1011', '0010 1100', '0010 1101', '0010 1110', '0010 1111', '0011 0000', '0011 0001', '0011 0010', '0011 0011', '0011 0100', '0011 0101', '0011 0110', '0011 0111', '0011 1000', '0011 1001', '0011 1010',
                                        '0011 1011', '0011 1100', '0011 1101', '0011 1110', '0011 1111', '0100 0000', '0100 0001', '0100 0010', '0100 0011', '0100 0100', '0100 0101', '0100 0110', '0100 0111', '0100 1000', '0100 1001', '0100 1010', '0100) 1011', '0100 1100', '0100 1101', '0100 1110', '0100 1111', '0101 0000', '0101 0001', '0101 0010', '0101 0011', '0101 0100', '0101 0101', '0101 0110', '0101 0111', '0101 1000', '0101 1001', '0101 1010', '0101 1011', '0101 1100', '0101 1101', '0101 1110', '0101 1111', '0110 0000', '0110 0001', '0110 0010', '0110 0011', '0110 0100', '0110 0101', '0110 0110', '0110 0111', '0110 1000', '0110 1001', '0110 1010', '0110 1011', '0110 1100', '0110 1101', '0110 1110', '0110 1111', '0111 0000', '0111 0001', '0111 0010', '0111 0011', '0111 0100', '0111 0101',
                                        '0111 0110', '0111 0111', '0111 1000', '0111 1001', '0111 1010', '0111 1011', '0111 1100', '0111 1101', '0111 1110', '0111 1111', '1000 0000', '1000 0001', '1000 0010', '1000 0011', '1000 0100', '1000 0101', '1000 0110', '1000 0111', '1000 1000', '1000 1001', '1000 1010', '1000 1011', '1000 1100', '1000 1101', '1000 1110', '1000 1111', '1001 0000', '1001 0001', '1001 0010', '1001 0011', '1001 0100', '1001 0101', '1001 0110', '1001 0111', '1001 1000', '1001 1001', '1001 1010', '1001 1011', '1001 1100', '1001 1101', '1001 1110', '1001 1111', '1010 0000', '1010 0001', '1010 0010', '1010 0011', '1010 0100', '1010 0101', '1010 0110', '1010 0111', '1010 1000', '1010 1001', '1010 1010', '1010 1011', '1010 1100', '1010 1101', '1010 1110', '1010 1111', '1011 0000',
                                        '1011 0001', '1011 0010', '1011 0011', '1011 0100', '1011 0101', '1011 0110', '1011 0111', '1011 1000', '1011 1001', '1011 1010', '1011 1011', '1011 1100', '1011 1101', '1011 1110', '1011 1111', '1100 0000', '1100 0001', '1100 0010', '1100 0011', '1100 0100', '1100 0101', '1100 0110', '1100 0111', '1100 1000', '1100 1001', '1100 1010', '1100 1011', '1100 1100', '1100 1101', '1100 1110', '1100 1111', '1101 0000', '1101 0001', '1101 0010', '1101 0011', '1101 0100', '1101 0101', '1101 0110', '1101 0111', '1101 1000', '1101 1001', '1101 1010', '1101 1011', '1101 1100', '1101 1101', '1101 1110', '1101 1111', '1110 0000', '1110 0001', '1110 0010', '1110 0011', '1110 0100', '1110 0101', '1110 0110', '1110 0111', '1110 1000', '1110 1001', '1110 1010', '1110 1011',
                                        '1110 1100', '1110 1101', '1110 1110', '1110 1111', '1111 0000', '1111 0001', '1111 0010', '1111 0011', '1111 0100', '1111 0101', '1111 0110', '1111 0111', '1111 1000', '1111 1001', '1111 1010', '1111 1011', '1111 1100', '1111 1101', '1111 1110', '1111 1111');

type
  TDebugIntValue = record
    ValueSize: NativeInt;
    IsNegative: Boolean;
    constructor CreateUnsigned(AValue: UInt64; ASize: NativeInt); overload;
    constructor CreateSigned(AValue: Int64; ASize: NativeInt); overload;
    function ToHex(APrefix: String = String.Empty; ASpaces: Boolean = TRUE): String;
    function ToBin(ASpaces: Boolean = TRUE): String;
    function ToDecimal: String;
    function Format(AView: String): String;
    function ToOct: String;
    procedure SetUnsigned(AValue: UInt64; ASize: NativeInt);
    procedure SetSigned(AValue: Int64; ASize: NativeInt);
    function GetInt64Value: Int64;
    case Integer of
      0: (UInt64Val: UInt64);
      1: (ByteArrayVal: array[0..7] of Byte);
  end;


implementation

constructor TDebugIntValue.CreateUnsigned(AValue: UInt64; ASize: NativeInt);
begin
  ValueSize := ASize;
  UInt64Val := AValue;
  IsNegative := FALSE;
end;

constructor TDebugIntValue.CreateSigned(AValue: Int64; ASize: NativeInt);
begin
  ValueSize := ASize;
  UInt64Val := Abs(AValue);
  IsNegative := (AValue < 0);
end;

function TDebugIntValue.ToHex(APrefix: String = String.Empty; ASpaces: Boolean = TRUE): String;
var
  LHex: TStringBuilder;
begin
  LHex := TStringBuilder.Create;
  try
    // Windows is little endian. The least significan byte is stored in the
    // smallest memory address i.e, the beginning of the array.
    var LCount: Integer := Max(ValueSize, 2);
    for var i := 0 to (LCount - 1) do
    begin
      // We display hex Word by Word with a space between.
      if ASpaces and (LHex.Length in [4, 9, 14]) then
        LHex.Insert(0,' ');

      LHex.Insert(0, LHexArray[ ByteArrayVal[i]] );
    end;

    if not String.IsNullOrWhitespace(APrefix) then
      LHex.Insert(0, APrefix);

    if IsNegative then
      LHex.Insert(0, '-');

    Result := LHex.ToString;
  finally
    LHex.Free;
  end;
end;

function TDebugIntValue.ToBin(ASpaces: Boolean = TRUE): String;
var
  LBin: TStringBuilder;
begin
  LBin := TStringBuilder.Create;
  try
    // Windows is little endian. The least significan byte is stored in the
    // smallest memory address i.e, the beginning of the array.
    for var i := 0 to (ValueSize - 1) do
    begin
      // We display binary Nibble By Nibble with a min of 2.
      if ASpaces and (LBin.Length in [9, 19, 29, 39, 49, 59, 69]) then
        LBin.Insert(0,' ');
      LBin.Insert(0, LBinArray[ ByteArrayVal[i]] );
    end;

    Result := LBin.ToString;
  finally
    LBin.Free;
  end;
end;

function TDebugIntValue.ToDecimal: String;
begin
  if IsNegative then
    Result := IntToStr((0-UInt64Val))
  else
    Result := UIntToStr(UInt64Val)
end;

function TDebugIntValue.Format(AView: String): String;
begin
  if VIEW_HEX = AView then
    Result := ToHex(TVisualizerConfig.HexPrefix)
  else if VIEW_OCT = AView then
    Result := ToOct
  else if VIEW_BIN = AView then
    Result := ToBin
  else
    Result := ToDecimal;
end;


function TDebugIntValue.ToOct: String;
var
  LOct: TStringBuilder;
  LRemainder: LongInt;
  LValue: UInt64;
  LPad: Integer;
begin
  LValue := UInt64Val;
  LPad := 3;
  LOct := TStringBuilder.Create;
  try
    while LValue <> 0 do
    begin
      if (LOct.Length in [3, 7, 11, 15, 19, 23, 27, 31, 35, 39, 43, 47]) then
      begin
        LOct.Insert(0,' ');
        LPad := 3;
      end;
      LRemainder  := LValue mod 8;
      LValue := LValue div 8;
      LOct.Insert(0,LRemainder);
      Dec(LPad);
    end;
    LOct.Insert(0, '0', LPad);
    if IsNegative then
      LOct.Insert(0, '-');
    Result:= LOct.ToString;
  finally
    LOct.Free;
  end;
end;

procedure TDebugIntValue.SetUnsigned(AValue: UInt64; ASize: NativeInt);
begin
  ValueSize := ASize;
  UInt64Val := AValue;
  IsNegative := FALSE;
end;

procedure TDebugIntValue.SetSigned(AValue: Int64; ASize: NativeInt);
begin
  ValueSize := ASize;
  UInt64Val := Abs(AValue);
  IsNegative := AValue < 0;
end;

function TDebugIntValue.GetInt64Value: Int64;
begin
  if IsNegative then
    Result := (0 - UInt64Val)
  else
    Result := UInt64Val;
end;

end.
