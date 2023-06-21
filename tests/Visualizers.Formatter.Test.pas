unit Visualizers.Formatter.Test;

interface
uses
  System.SysUtils, DUnitX.TestFramework, Visualizers.Formatter;

type

  [TestFixture]
  TFormatterTester = class(TObject)
  public
    [Test]
    procedure TestIntegerBin;
    [Test]
    procedure TestCardinalBin;
    [Test]
    procedure TestShortIntBin;
    [Test]
    procedure TestByteBin;
    [Test]
    procedure TestSmallIntBin;
    [Test]
    procedure TestWordBin;
    [Test]
    procedure TestInt64Bin;
    [Test]
    procedure TestUInt64Bin;
    [Test]
    procedure TestIntegerDec;
    [Test]
    procedure TestCardinalDec;
    [Test]
    procedure TestShortIntDec;
    [Test]
    procedure TestByteDec;
    [Test]
    procedure TestSmallIntDec;
    [Test]
    procedure TestWordDec;
    [Test]
    procedure TestInt64Dec;
    [Test]
    procedure TestUInt64Dec;
    [Test]
    procedure TestIntegerHex;
    [Test]
    procedure TestCardinalHex;
    [Test]
    procedure TestShortIntHex;
    [Test]
    procedure TestByteHex;
    [Test]
    procedure TestSmallIntHex;
    [Test]
    procedure TestWordHex;
    [Test]
    procedure TestInt64Hex;
    [Test]
    procedure TestUInt64Hex;
    [Test]
    procedure TestIntegerOct;
    [Test]
    procedure TestCardinalOct;
    [Test]
    procedure TestShortIntOct;
    [Test]
    procedure TestByteOct;
  end;

implementation

procedure TFormatterTester.TestIntegerBin;
var
  LInteger: Integer;
begin
  LInteger := $00010001;
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001', TFormatter.IntegerEvalResultToBin(IntToStr(LInteger)));

  LInteger := $00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111', TFormatter.IntegerEvalResultToBin(IntToStr(LInteger)));

  LInteger := $60010A0F;
  Assert.AreEqual('0110 0000 0000 0001 0000 1010 0000 1111', TFormatter.IntegerEvalResultToBin(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestCardinalBin;
var
  LInteger: Cardinal;
begin
  LInteger := $00010001;
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001', TFormatter.CardinalEvalResultToBin(UIntToStr(LInteger)));

  LInteger := $00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111', TFormatter.CardinalEvalResultToBin(UIntToStr(LInteger)));

  LInteger := $F0010A0F;
  Assert.AreEqual('1111 0000 0000 0001 0000 1010 0000 1111', TFormatter.CardinalEvalResultToBin(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestShortIntBin;
var
  LShortInt: ShortInt;
begin
  LShortInt := $01;
  Assert.AreEqual('0000 0001', TFormatter.ShortIntEvalResultToBin(IntToStr(LShortInt)));

  LShortInt := $0F;
  Assert.AreEqual('0000 1111', TFormatter.ShortIntEvalResultToBin(IntToStr(LShortInt)));

  LShortInt := $6F;
  Assert.AreEqual('0110 1111', TFormatter.ShortIntEvalResultToBin(IntToStr(LShortInt)));
end;

procedure TFormatterTester.TestByteBin;
var
  LByte: Cardinal;
begin
  LByte := $01;
  Assert.AreEqual('0000 0001', TFormatter.ByteEvalResultToBin(IntToStr(LByte)));

  LByte := $0F;
  Assert.AreEqual('0000 1111', TFormatter.ByteEvalResultToBin(IntToStr(LByte)));

  LByte := $AF;
  Assert.AreEqual('1010 1111', TFormatter.ByteEvalResultToBin(IntToStr(LByte)));
end;

procedure TFormatterTester.TestSmallIntBin;
var
  LSmallInt: SmallInt;
begin
  LSmallInt := $0001;
  Assert.AreEqual('0000 0000 0000 0001', TFormatter.SmallIntEvalResultToBin(IntToStr(LSmallInt)));

  LSmallInt := $0A0F;
  Assert.AreEqual('0000 1010 0000 1111', TFormatter.SmallIntEvalResultToBin(IntToStr(LSmallInt)));

  LSmallInt := $6A0F;
  Assert.AreEqual('0110 1010 0000 1111', TFormatter.SmallIntEvalResultToBin(IntToStr(LSmallInt)));
end;

procedure TFormatterTester.TestWordBin;
var
  LWord: Word;
begin
  LWord := $0001;
  Assert.AreEqual('0000 0000 0000 0001', TFormatter.WordEvalResultToBin(UIntToStr(LWord)));

  LWord := $AA0F;
  Assert.AreEqual('1010 1010 0000 1111', TFormatter.WordEvalResultToBin(UIntToStr(LWord)));

  LWord := $FA0F;
  Assert.AreEqual('1111 1010 0000 1111', TFormatter.WordEvalResultToBin(UIntToStr(LWord)));
end;

procedure TFormatterTester.TestInt64Bin;
var
  LInteger: Int64;
begin
  LInteger := $0001000100010001;
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001', TFormatter.Int64EvalResultToBin(IntToStr(LInteger)));

  LInteger := $00010A0F00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111 0000 0000 0000 0001 0000 1010 0000 1111', TFormatter.Int64EvalResultToBin(IntToStr(LInteger)));

  LInteger := $60010A0F60010A0F;
  Assert.AreEqual('0110 0000 0000 0001 0000 1010 0000 1111 0110 0000 0000 0001 0000 1010 0000 1111', TFormatter.Int64EvalResultToBin(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestUInt64Bin;
var
  LInteger: UInt64;
begin
  LInteger := $0001000100010001;
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001', TFormatter.UInt64EvalResultToBin(UIntToStr(LInteger)));

  LInteger := $00010A0F00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111 0000 0000 0000 0001 0000 1010 0000 1111', TFormatter.UInt64EvalResultToBin(UIntToStr(LInteger)));

  LInteger := $F0010A0FF0010A0F;
  Assert.AreEqual('1111 0000 0000 0001 0000 1010 0000 1111 1111 0000 0000 0001 0000 1010 0000 1111', TFormatter.UInt64EvalResultToBin(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestIntegerDec;
var
  LInteger: Integer;
begin
  LInteger := $00010001;
  Assert.AreEqual('65537', TFormatter.IntegerEvalResultToDec(IntToStr(LInteger)));

  LInteger := $00010A0F;
  Assert.AreEqual('68111', TFormatter.IntegerEvalResultToDec(IntToStr(LInteger)));

  LInteger := $60010A0F;
  Assert.AreEqual('1610680847', TFormatter.IntegerEvalResultToDec(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestCardinalDec;
var
  LInteger: Cardinal;
begin
  LInteger := $00010001;
  Assert.AreEqual('65537', TFormatter.CardinalEvalResultToDec(UIntToStr(LInteger)));

  LInteger := $00010A0F;
  Assert.AreEqual('68111', TFormatter.CardinalEvalResultToDec(UIntToStr(LInteger)));

  LInteger := $F0010A0F;
  Assert.AreEqual('4026599951', TFormatter.CardinalEvalResultToDec(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestShortIntDec;
var
  LShortInt: ShortInt;
begin
  LShortInt := $01;
  Assert.AreEqual('1', TFormatter.ShortIntEvalResultToDec(IntToStr(LShortInt)));

  LShortInt := $0F;
  Assert.AreEqual('15', TFormatter.ShortIntEvalResultToDec(IntToStr(LShortInt)));

  LShortInt := $6F;
  Assert.AreEqual('111', TFormatter.ShortIntEvalResultToDec(IntToStr(LShortInt)));
end;

procedure TFormatterTester.TestByteDec;
var
  LByte: Cardinal;
begin
  LByte := $01;
  Assert.AreEqual('1', TFormatter.ByteEvalResultToDec(IntToStr(LByte)));

  LByte := $0F;
  Assert.AreEqual('15', TFormatter.ByteEvalResultToDec(IntToStr(LByte)));

  LByte := $AF;
  Assert.AreEqual('175', TFormatter.ByteEvalResultToDec(IntToStr(LByte)));
end;

procedure TFormatterTester.TestSmallIntDec;
var
  LSmallInt: SmallInt;
begin
  LSmallInt := $0001;
  Assert.AreEqual('1', TFormatter.SmallIntEvalResultToDec(IntToStr(LSmallInt)));

  LSmallInt := $0A0F;
  Assert.AreEqual('2575', TFormatter.SmallIntEvalResultToDec(IntToStr(LSmallInt)));

  LSmallInt := $6A0F;
  Assert.AreEqual('27151', TFormatter.SmallIntEvalResultToDec(IntToStr(LSmallInt)));
end;

procedure TFormatterTester.TestWordDec;
var
  LWord: Word;
begin
  LWord := $0001;
  Assert.AreEqual('1', TFormatter.WordEvalResultToDec(UIntToStr(LWord)));

  LWord := $AA0F;
  Assert.AreEqual('43535', TFormatter.WordEvalResultToDec(UIntToStr(LWord)));

  LWord := $FA0F;
  Assert.AreEqual('64015', TFormatter.WordEvalResultToDec(UIntToStr(LWord)));
end;

procedure TFormatterTester.TestInt64Dec;
var
  LInteger: Int64;
begin
  LInteger := $0001000100010001;
  Assert.AreEqual('281479271743489', TFormatter.Int64EvalResultToDec(IntToStr(LInteger)));

  LInteger := $00010A0F00010A0F;
  Assert.AreEqual('292534517565967', TFormatter.Int64EvalResultToDec(IntToStr(LInteger)));

  LInteger := $60010A0F60010A0F;
  Assert.AreEqual('6917821563769260559', TFormatter.Int64EvalResultToDec(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestUInt64Dec;
var
  LInteger: UInt64;
begin
  LInteger := $0001000100010001;
  Assert.AreEqual('281479271743489', TFormatter.UInt64EvalResultToDec(UIntToStr(LInteger)));

  LInteger := $00010A0F00010A0F;
  Assert.AreEqual('292534517565967', TFormatter.UInt64EvalResultToDec(UIntToStr(LInteger)));

  LInteger := $F0010A0FF0010A0F;
  Assert.AreEqual('17294115107646802447', TFormatter.UInt64EvalResultToDec(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestIntegerHex;
var
  LInteger: Integer;
begin
  LInteger := 65537;
  Assert.AreEqual('00010001', TFormatter.IntegerEvalResultToHex(IntToStr(LInteger)));

  LInteger := 68111;
  Assert.AreEqual('00010A0F', TFormatter.IntegerEvalResultToHex(IntToStr(LInteger)));

  LInteger := 1610680847;
  Assert.AreEqual('60010A0F', TFormatter.IntegerEvalResultToHex(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestCardinalHex;
var
  LInteger: Cardinal;
begin
  LInteger := 65537;
  Assert.AreEqual('00010001', TFormatter.CardinalEvalResultToHex(UIntToStr(LInteger)));

  LInteger := 68111;
  Assert.AreEqual('00010A0F', TFormatter.CardinalEvalResultToHex(UIntToStr(LInteger)));

  LInteger := 4026599951;
  Assert.AreEqual('F0010A0F', TFormatter.CardinalEvalResultToHex(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestShortIntHex;
var
  LShortInt: ShortInt;
begin
  LShortInt := 1;
  Assert.AreEqual('01', TFormatter.ShortIntEvalResultToHex(IntToStr(LShortInt)));

  LShortInt := 15;
  Assert.AreEqual('0F', TFormatter.ShortIntEvalResultToHex(IntToStr(LShortInt)));

  LShortInt := 111;
  Assert.AreEqual('6F', TFormatter.ShortIntEvalResultToHex(IntToStr(LShortInt)));
end;

procedure TFormatterTester.TestByteHex;
var
  LByte: Cardinal;
begin
  LByte := 1;
  Assert.AreEqual('01', TFormatter.ByteEvalResultToHex(IntToStr(LByte)));

  LByte := 15;
  Assert.AreEqual('0F', TFormatter.ByteEvalResultToHex(IntToStr(LByte)));

  LByte := 175;
  Assert.AreEqual('AF', TFormatter.ByteEvalResultToHex(IntToStr(LByte)));
end;

procedure TFormatterTester.TestSmallIntHex;
var
  LSmallInt: SmallInt;
begin
  LSmallInt := 1;
  Assert.AreEqual('0001', TFormatter.SmallIntEvalResultToHex(IntToStr(LSmallInt)));

  LSmallInt := 2575;
  Assert.AreEqual('0A0F', TFormatter.SmallIntEvalResultToHex(IntToStr(LSmallInt)));

  LSmallInt := 27151;
  Assert.AreEqual('6A0F', TFormatter.SmallIntEvalResultToHex(IntToStr(LSmallInt)));
end;

procedure TFormatterTester.TestWordHex;
var
  LWord: Word;
begin
  LWord := 1;
  Assert.AreEqual('0001', TFormatter.WordEvalResultToHex(UIntToStr(LWord)));

  LWord := 43535;
  Assert.AreEqual('AA0F', TFormatter.WordEvalResultToHex(UIntToStr(LWord)));

  LWord := 64015;
  Assert.AreEqual('FA0F', TFormatter.WordEvalResultToHex(UIntToStr(LWord)));
end;

procedure TFormatterTester.TestInt64Hex;
var
  LInteger: Int64;
begin
  LInteger := 281479271743489;
  Assert.AreEqual('0001000100010001', TFormatter.Int64EvalResultToHex(IntToStr(LInteger)));

  LInteger := 292534517565967;
  Assert.AreEqual('00010A0F00010A0F', TFormatter.Int64EvalResultToHex(IntToStr(LInteger)));

  LInteger := 6917821563769260559;
  Assert.AreEqual('60010A0F60010A0F', TFormatter.Int64EvalResultToHex(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestUInt64Hex;
var
  LInteger: UInt64;
begin
  LInteger := 281479271743489;
  Assert.AreEqual('0001000100010001', TFormatter.UInt64EvalResultToHex(UIntToStr(LInteger)));

  LInteger := 292534517565967;
  Assert.AreEqual('00010A0F00010A0F', TFormatter.UInt64EvalResultToHex(UIntToStr(LInteger)));

  LInteger := 17294115107646802447;
  Assert.AreEqual('F0010A0FF0010A0F', TFormatter.UInt64EvalResultToHex(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestIntegerOct;
var
  LInteger: Integer;
begin
  LInteger := 1;
  Assert.AreEqual('001', TFormatter.IntegerEvalResultToOct(IntToStr(LInteger)));

  LInteger := 65537;
  Assert.AreEqual('200 001', TFormatter.IntegerEvalResultToOct(IntToStr(LInteger)));

  LInteger := 68111;
  Assert.AreEqual('205 017', TFormatter.IntegerEvalResultToOct(IntToStr(LInteger)));

  LInteger := 1610680847;
  Assert.AreEqual('014 000 205 017', TFormatter.IntegerEvalResultToOct(IntToStr(LInteger)));
end;

procedure TFormatterTester.TestCardinalOct;
var
  LInteger: Cardinal;
begin
  LInteger := 1;
  Assert.AreEqual('001', TFormatter.IntegerEvalResultToOct(IntToStr(LInteger)));

  LInteger := 65537;
  Assert.AreEqual('200 001', TFormatter.CardinalEvalResultToOct(IntToStr(LInteger)));

  LInteger := 68111;
  Assert.AreEqual('205 017', TFormatter.CardinalEvalResultToOct(IntToStr(LInteger)));

  LInteger := 4026599951;
  Assert.AreEqual('036 000 205 017', TFormatter.CardinalEvalResultToOct(UIntToStr(LInteger)));
end;

procedure TFormatterTester.TestShortIntOct;
var
  LShortInt: ShortInt;
begin
  LShortInt := 1;
  Assert.AreEqual('001', TFormatter.ShortIntEvalResultToOct(IntToStr(LShortInt)));

  LShortInt := 15;
  Assert.AreEqual('017', TFormatter.ShortIntEvalResultToOct(IntToStr(LShortInt)));

  LShortInt := 111;
  Assert.AreEqual('157', TFormatter.ShortIntEvalResultToOct(IntToStr(LShortInt)));
end;

procedure TFormatterTester.TestByteOct;
var
  LByte: Cardinal;
begin
  LByte := 1;
  Assert.AreEqual('001', TFormatter.ByteEvalResultToOct(IntToStr(LByte)));

  LByte := 15;
  Assert.AreEqual('017', TFormatter.ByteEvalResultToOct(IntToStr(LByte)));

  LByte := 175;
  Assert.AreEqual('257', TFormatter.ByteEvalResultToOct(IntToStr(LByte)));
end;

initialization
  TDUnitX.RegisterTestFixture(TFormatterTester);
end.
