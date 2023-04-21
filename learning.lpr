{**********************************************************
 This program is to learn
 modern pascal using freepascal compiler
 and lazarus id

 The idea is to do a little trip
 through the language to compare it with C and a bit with C++

 Dont forget check some links:
 https://wiki.freepascal.org/Lazarus_IDE_Shortcuts
 https://wiki.freepascal.org/Lazarus_IDE_Tools
***********************************************************}

program learning;
{
 This program is to learn
 modern pascal using freepascal compiler
 and lazarus id

 The idea is to do a little trip
 through the language to compare it with C and a bit with C++

 Dont forget check some links:
 https://wiki.freepascal.org/Lazarus_IDE_Shortcuts
 https://wiki.freepascal.org/Lazarus_IDE_Tools
}

procedure inOut;
var
  myStr: String; //by default strings are utf8 strings
begin
  Write('This is an example');
  writeln;
  myStr := 'this is a string';
  myStr := myStr + ' too';
  writeln(myStr);
end;

{
 system functions
 https://www.freepascal.org/docs-html/rtl/system/stringfunctions.html
 sysutils functions
 https://www.freepascal.org/docs-html/rtl/sysutils/stringfunctions.html
}

procedure strUse;
var
  myStr: String;
  other: String[100]; //override dynamic string here
begin
  SetLength(myStr, 1024); //
  SetLength(other, 512);
  myStr:='Hello';
  other:='Hi Flisol';
  writeln('myStr len ', Length(myStr));
  writeln('other len ', Length(other));
  writeln('Flisol is in ', Pos('Flisol', other));
  insert('Pascal ', other, 1);
  writeln(other);
  writeln;
end;


procedure PointersAndRecords;
type
  MyPacketRecord = packed record
    b1, b2 : Byte
  end;

var
  pointer : PByte;
  myPacRec : MyPacketRecord;
begin
  myPacRec.b1:=6;
  myPacRec.b2:=8;

  pointer := @myPacRec.b1;
  writeln('Printing record values:');
  write('b1 ', pointer^, ' b2 ', (pointer+1)^);
  writeln;
end;

procedure ArraysofArraysUse;
var
  myMatrix : array of array of Int32;
  val: Int32;
  i,j : UInt8;
  pointer : PInt32;
begin
  SetLength(myMatrix, 3, 4);
  WriteLn('Dims ', Length(myMatrix),'*' ,Length(myMatrix[0]));
  writeln('Array of arrays');
  val := 10;
  for i := 0 to Pred(3) do
    begin
    for j := 0 to Pred(4) do
      begin
        myMatrix[i][j] := val;
        write(val:5, ' ');
        val := val + 1;
      end;
    writeln;
    end;

  writeln;
  writeln('using pointers');
  pointer := @myMatrix[0][0];
  for i := 0 to Pred(3) do
    begin
    for j := 0 to Pred(4) do
      begin
        write(pointer^, ' ');
        inc(pointer);
      end;
    writeln;
    end;
  writeln;
end;

begin
  inOut;
  strUse;
  PointersAndRecords;
  ArraysofArraysUse;
  readln;
end.
