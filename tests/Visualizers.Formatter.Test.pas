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
begin
  var LRec := TDebugIntValue.CreateUnsigned($00010001, Sizeof(Integer));
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001', LRec.ToBin );

  LRec.UInt64Val := $00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );

  LRec.UInt64Val := $60010A0F;
  Assert.AreEqual('0110 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestCardinalBin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($00010001, Sizeof(Cardinal));
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001', LRec.ToBin );

  LRec.UInt64Val := $00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );

  LRec.UInt64Val := $F0010A0F;
  Assert.AreEqual('1111 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestShortIntBin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($01, Sizeof(ShortInt));
  Assert.AreEqual('0000 0001', LRec.ToBin );

  LRec.UInt64Val := $0F;
  Assert.AreEqual('0000 1111', LRec.ToBin );

  LRec.UInt64Val := $6F;
  Assert.AreEqual('0110 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestByteBin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($01, Sizeof(Byte));
  Assert.AreEqual('0000 0001', LRec.ToBin );

  LRec.UInt64Val := $0F;
  Assert.AreEqual('0000 1111', LRec.ToBin );

  LRec.UInt64Val := $AF;
  Assert.AreEqual('1010 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestSmallIntBin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($0001, Sizeof(SmallInt));
  Assert.AreEqual('0000 0000 0000 0001', LRec.ToBin );

  LRec.UInt64Val := $0A0F;
  Assert.AreEqual('0000 1010 0000 1111', LRec.ToBin );

  LRec.UInt64Val := $6A0F;
  Assert.AreEqual('0110 1010 0000 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestWordBin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($0001, Sizeof(Word));
  Assert.AreEqual('0000 0000 0000 0001', LRec.ToBin );

  LRec.UInt64Val := $AA0F;
  Assert.AreEqual('1010 1010 0000 1111', LRec.ToBin );

  LRec.UInt64Val := $FA0F;
  Assert.AreEqual('1111 1010 0000 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestInt64Bin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($0001000100010001, Sizeof(Int64));
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001', LRec.ToBin );

  LRec.UInt64Val := $00010A0F00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111 0000 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );

  LRec.UInt64Val := $60010A0F60010A0F;
  Assert.AreEqual('0110 0000 0000 0001 0000 1010 0000 1111 0110 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestUInt64Bin;
begin
  var LRec := TDebugIntValue.CreateUnsigned($0001000100010001, Sizeof(UInt64));
  Assert.AreEqual('0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001 0000 0000 0000 0001', LRec.ToBin );

  LRec.UInt64Val := $00010A0F00010A0F;
  Assert.AreEqual('0000 0000 0000 0001 0000 1010 0000 1111 0000 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );

  LRec.UInt64Val := $F0010A0FF0010A0F;
  Assert.AreEqual('1111 0000 0000 0001 0000 1010 0000 1111 1111 0000 0000 0001 0000 1010 0000 1111', LRec.ToBin );
end;

procedure TFormatterTester.TestIntegerDec;
begin
  var LRec := TDebugIntValue.CreateSigned($00010001, Sizeof(Integer));
  Assert.AreEqual('65537', LRec.ToDecimal);

  LRec.SetSigned($00010A0F, Sizeof(Integer));
  Assert.AreEqual('68111', LRec.ToDecimal);

  LRec.SetSigned(-$00010A0F, Sizeof(Integer));
  Assert.AreEqual('-68111', LRec.ToDecimal);

  LRec.SetSigned($60010A0F, Sizeof(Integer));
  Assert.AreEqual('1610680847', LRec.ToDecimal);
end;

procedure TFormatterTester.TestCardinalDec;
begin
  var LRec := TDebugIntValue.CreateUnsigned($00010001, Sizeof(Cardinal));
  Assert.AreEqual('65537', LRec.ToDecimal);

  LRec.SetUnsigned($00010A0F, Sizeof(Cardinal));
  Assert.AreEqual('68111', LRec.ToDecimal);

  LRec.SetUnsigned($F0010A0F, Sizeof(Cardinal));
  Assert.AreEqual('4026599951', LRec.ToDecimal);
end;

procedure TFormatterTester.TestShortIntDec;
begin
  var LRec := TDebugIntValue.CreateSigned($01, Sizeof(ShortInt));
  Assert.AreEqual('1', LRec.ToDecimal);

  LRec.SetSigned($0F, Sizeof(ShortInt));
  Assert.AreEqual('15', LRec.ToDecimal);

  LRec.SetSigned(-$0F, Sizeof(ShortInt));
  Assert.AreEqual('-15', LRec.ToDecimal);

  LRec.SetSigned($6F, Sizeof(ShortInt));
  Assert.AreEqual('111', LRec.ToDecimal);
end;

procedure TFormatterTester.TestByteDec;
begin
  var LRec := TDebugIntValue.CreateUnsigned($01, SizeOf(Byte));
  Assert.AreEqual('1', LRec.ToDecimal);

  LRec.SetUnsigned($0F, SizeOf(Byte));
  Assert.AreEqual('15', LRec.ToDecimal);

  LRec.SetUnsigned($AF, SizeOf(Byte));
  Assert.AreEqual('175', LRec.ToDecimal);
end;

procedure TFormatterTester.TestSmallIntDec;
begin
  var LRec := TDebugIntValue.CreateSigned($0001, Sizeof(SmallInt));
  Assert.AreEqual('1', LRec.ToDecimal);

  LRec.SetSigned($0A0F, Sizeof(SmallInt));
  Assert.AreEqual('2575', LRec.ToDecimal);

  LRec.SetSigned(-$0A0F, Sizeof(SmallInt));
  Assert.AreEqual('-2575', LRec.ToDecimal);

  LRec.SetSigned($6A0F, Sizeof(SmallInt));
  Assert.AreEqual('27151', LRec.ToDecimal);
end;

procedure TFormatterTester.TestWordDec;
begin
  var LRec := TDebugIntValue.CreateUnsigned($0001, Sizeof(Word));
  Assert.AreEqual('1', LRec.ToDecimal);

  LRec.SetUnsigned($AA0F, Sizeof(Word));
  Assert.AreEqual('43535', LRec.ToDecimal);

  LRec.SetUnsigned($FA0F, Sizeof(Word));
  Assert.AreEqual('64015', LRec.ToDecimal);
end;

procedure TFormatterTester.TestInt64Dec;
var
  LInteger: Int64;
begin
  var LRec := TDebugIntValue.CreateSigned($0001000100010001, Sizeof(Int64));
  Assert.AreEqual('281479271743489', LRec.ToDecimal);

  LRec.SetSigned($00010A0F00010A0F, Sizeof(Int64));
  Assert.AreEqual('292534517565967', LRec.ToDecimal);

  LRec.SetSigned(-$00010A0F00010A0F, Sizeof(Int64));
  Assert.AreEqual('-292534517565967', LRec.ToDecimal);

  LRec.SetSigned($60010A0F60010A0F, Sizeof(Int64));
  Assert.AreEqual('6917821563769260559', LRec.ToDecimal);
end;

procedure TFormatterTester.TestUInt64Dec;
begin
  var LRec := TDebugIntValue.CreateUnsigned($0001000100010001, Sizeof(UInt64));
  Assert.AreEqual('281479271743489', LRec.ToDecimal);

  LRec.SetUnsigned($00010A0F00010A0F, Sizeof(UInt64));
  Assert.AreEqual('292534517565967', LRec.ToDecimal);

  LRec.SetUnsigned($F0010A0FF0010A0F, Sizeof(UInt64));
  Assert.AreEqual('17294115107646802447', LRec.ToDecimal);
end;

procedure TFormatterTester.TestIntegerHex;
begin
  var LRec := TDebugIntValue.CreateUnsigned(65537, Sizeof(Integer));
  Assert.AreEqual('0001 0001', LRec.ToHex );
  Assert.AreEqual('$00010001', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(68111, SizeOf(Integer));
  Assert.AreEqual('0001 0A0F', LRec.ToHex );
  Assert.AreEqual('$00010A0F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(-68111, SizeOf(Integer));
  Assert.AreEqual('-0001 0A0F', LRec.ToHex );
  Assert.AreEqual('-$00010A0F', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(1610680847, SizeOf(Integer));
  Assert.AreEqual('6001 0A0F', LRec.ToHex );
  Assert.AreEqual('$60010A0F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestCardinalHex;
begin
  var LRec := TDebugIntValue.CreateUnsigned(65537, Sizeof(Cardinal));
  Assert.AreEqual('0001 0001', LRec.ToHex );
  Assert.AreEqual('$00010001', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(1610680847, SizeOf(Cardinal));
  Assert.AreEqual('6001 0A0F', LRec.ToHex );
  Assert.AreEqual('$60010A0F', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(4026599951, SizeOf(Cardinal));
  Assert.AreEqual('F001 0A0F', LRec.ToHex );
  Assert.AreEqual('$F0010A0F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestShortIntHex;
var
  LShortInt: ShortInt;
begin
  var LRec := TDebugIntValue.CreateSigned(1, Sizeof(ShortInt));
  Assert.AreEqual('0001', LRec.ToHex );
  Assert.AreEqual('$0001', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(15, SizeOf(ShortInt));
  Assert.AreEqual('000F', LRec.ToHex );
  Assert.AreEqual('$000F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(-15, SizeOf(ShortInt));
  Assert.AreEqual('-000F', LRec.ToHex );
  Assert.AreEqual('-$000F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(111, SizeOf(ShortInt));
  Assert.AreEqual('006F', LRec.ToHex );
  Assert.AreEqual('$006F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestByteHex;
begin
  var LRec := TDebugIntValue.CreateUnsigned(1, Sizeof(Byte));
  Assert.AreEqual('0001', LRec.ToHex );
  Assert.AreEqual('$0001', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(15, SizeOf(Byte));
  Assert.AreEqual('000F', LRec.ToHex );
  Assert.AreEqual('$000F', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(175, SizeOf(Byte));
  Assert.AreEqual('00AF', LRec.ToHex );
  Assert.AreEqual('$00AF', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestSmallIntHex;
begin
  var LRec := TDebugIntValue.CreateSigned(1, Sizeof(SmallInt));
  Assert.AreEqual('0001', LRec.ToHex );
  Assert.AreEqual('$0001', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(2575, SizeOf(SmallInt));
  Assert.AreEqual('0A0F', LRec.ToHex );
  Assert.AreEqual('$0A0F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(-2575, SizeOf(SmallInt));
  Assert.AreEqual('-0A0F', LRec.ToHex );
  Assert.AreEqual('-$0A0F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(27151, SizeOf(SmallInt));
  Assert.AreEqual('6A0F', LRec.ToHex );
  Assert.AreEqual('$6A0F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestWordHex;
begin
  var LRec := TDebugIntValue.CreateUnsigned(1, Sizeof(SmallInt));
  Assert.AreEqual('0001', LRec.ToHex );
  Assert.AreEqual('$0001', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(43535, SizeOf(Word));
  Assert.AreEqual('AA0F', LRec.ToHex );
  Assert.AreEqual('$AA0F', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(64015, SizeOf(Word));
  Assert.AreEqual('FA0F', LRec.ToHex );
  Assert.AreEqual('$FA0F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestInt64Hex;
begin
  var LRec := TDebugIntValue.CreateSigned(281479271743489, Sizeof(Int64));
  Assert.AreEqual('0001 0001 0001 0001', LRec.ToHex );
  Assert.AreEqual('$0001000100010001', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(292534517565967, SizeOf(Int64));
  Assert.AreEqual('0001 0A0F 0001 0A0F', LRec.ToHex );
  Assert.AreEqual('$00010A0F00010A0F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(-292534517565967, SizeOf(Int64));
  Assert.AreEqual('-0001 0A0F 0001 0A0F', LRec.ToHex );
  Assert.AreEqual('-$00010A0F00010A0F', LRec.ToHex('$', FALSE) );

  LRec.SetSigned(6917821563769260559, SizeOf(Int64));
  Assert.AreEqual('6001 0A0F 6001 0A0F', LRec.ToHex );
  Assert.AreEqual('$60010A0F60010A0F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestUInt64Hex;
begin
  var LRec := TDebugIntValue.CreateUnsigned(281479271743489, SizeOf(UInt64));
  Assert.AreEqual('0001 0001 0001 0001', LRec.ToHex );
  Assert.AreEqual('$0001000100010001', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(292534517565967, SizeOf(UInt64));
  Assert.AreEqual('0001 0A0F 0001 0A0F', LRec.ToHex );
  Assert.AreEqual('$00010A0F00010A0F', LRec.ToHex('$', FALSE) );

  LRec.SetUnsigned(17294115107646802447, SizeOf(UInt64));
  Assert.AreEqual('F001 0A0F F001 0A0F', LRec.ToHex );
  Assert.AreEqual('$F0010A0FF0010A0F', LRec.ToHex('$', FALSE) );
end;

procedure TFormatterTester.TestIntegerOct;
begin
  var LRec := TDebugIntValue.CreateSigned(1, Sizeof(Integer));
  Assert.AreEqual('001', LRec.ToOct);

  LRec.SetSigned(65537, Sizeof(Integer));
  Assert.AreEqual('200 001', LRec.ToOct);

  LRec.SetSigned(68111, Sizeof(Integer));
  Assert.AreEqual('205 017', LRec.ToOct);

  LRec.SetSigned(-68111, Sizeof(Integer));
  Assert.AreEqual('-205 017', LRec.ToOct);

  LRec.SetSigned(1610680847, Sizeof(Integer));
  Assert.AreEqual('014 000 205 017', LRec.ToOct);
end;

procedure TFormatterTester.TestCardinalOct;
begin
  var LRec := TDebugIntValue.CreateUnsigned(1, Sizeof(Cardinal));
  Assert.AreEqual('001', LRec.ToOct);

  LRec.SetUnsigned(65537, Sizeof(Cardinal));
  Assert.AreEqual('200 001', LRec.ToOct);

  LRec.SetUnsigned(68111, Sizeof(Cardinal));
  Assert.AreEqual('205 017', LRec.ToOct);

  LRec.SetUnsigned(4026599951, Sizeof(Cardinal));
  Assert.AreEqual('036 000 205 017', LRec.ToOct);
end;

procedure TFormatterTester.TestShortIntOct;
begin
  var LRec := TDebugIntValue.CreateSigned(1, Sizeof(ShortInt));
  Assert.AreEqual('001', LRec.ToOct);

  LRec.SetSigned(15, Sizeof(ShortInt));
  Assert.AreEqual('017', LRec.ToOct);

  LRec.SetSigned(-15, Sizeof(ShortInt));
  Assert.AreEqual('-017', LRec.ToOct);

  LRec.SetSigned(111, Sizeof(ShortInt));
  Assert.AreEqual('157', LRec.ToOct);
end;

procedure TFormatterTester.TestByteOct;
begin
  var LRec := TDebugIntValue.CreateUnsigned(1, SizeOf(Byte));
  Assert.AreEqual('001', LRec.ToOct);

  LRec.SetUnsigned(15, SizeOf(Byte));
  Assert.AreEqual('017', LRec.ToOct);

  LRec.SetUnsigned(175, SizeOf(Byte));
  Assert.AreEqual('257', LRec.ToOct);
end;

initialization
  TDUnitX.RegisterTestFixture(TFormatterTester);
end.
