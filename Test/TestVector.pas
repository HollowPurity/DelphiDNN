unit TestVector;
{

  Delphi DUnit-Testfall
  ----------------------
  Diese Unit enth�lt ein Skeleton einer Testfallklasse, das vom Experten f�r Testf�lle erzeugt wurde.
  �ndern Sie den erzeugten Code so, dass er die Methoden korrekt einrichtet und aus der
  getesteten Unit aufruft.

}

interface

uses
  TestFramework, Vector;

type
  // Testmethoden f�r Klasse TVector

  TestTVector = class(TTestCase)
  strict private
    FVector: TVector;
    vector: TVector;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestsetFields;
    procedure Testaddition;
    procedure TestSMultiplication;
    procedure TestdotMultiplication;
  end;

implementation

procedure TestTVector.SetUp;
begin
  FVector := TVector.Create([1,2,3]);
  vector := TVector.Create([1,2,3]);
end;

procedure TestTVector.TearDown;
begin
  FVector.Free;
  FVector := nil;
  vector.Free;
  vector := nil;
end;

{
 This Test is of course Trivial, however it's always a nice test to have,
 to remember the syntax of Testing Functions as well as testing if Indexing
 has been changed from one Delphi Version to another
}
procedure TestTVector.TestsetFields;
var
  V: TDoubleArray;
begin
  // Setup
  V := [1,2,3];
  FVector.setFields(V);

  // Pr�fen
  CheckEquals(1, V[0]);
  CheckEquals(2, V[1]);
  CheckEquals(3, V[2]);
end;

procedure TestTVector.Testaddition;
begin
  // setup
  FVector.addition(vector);

  // pr�fen
  CheckEquals(2, FVector.fields[0]);
  CheckEquals(4, FVector.fields[1]);
  CheckEquals(6, FVector.fields[2]);
end;

procedure TestTVector.TestSMultiplication;
var
  d: Double;
begin
  //Setup
  d := 3;
  FVector.SMultiplication(d);

  //Pr�fen
  CheckEquals(3, FVector.fields[0]);
  CheckEquals(6, FVector.fields[1]);
  CheckEquals(9, FVector.fields[2]);
end;

procedure TestTVector.TestdotMultiplication;
var
  ReturnValue: Double;
begin
  // Setup
  ReturnValue := FVector.dotMultiplication(vector);

  // Pr�fen
  CheckEquals(14, ReturnValue);
end;

initialization
  // Alle Testf�lle beim Testprogramm registrieren
  RegisterTest(TestTVector.Suite);
end.

