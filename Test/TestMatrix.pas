unit TestMatrix;
{

  Delphi DUnit-Testfall
  ----------------------
  Diese Unit enthält ein Skeleton einer Testfallklasse, das vom Experten für Testfälle erzeugt wurde.
  Ändern Sie den erzeugten Code so, dass er die Methoden korrekt einrichtet und aus der 
  getesteten Unit aufruft.

}

interface

uses
  TestFramework, Matrix, SysUtils, Vector;

type
  // Testmethoden für Klasse TMatrix

  TestTMatrix = class(TTestCase)
  strict private
    FMatrix: TMatrix;
    v1,v2,v3 : Tvector;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestsetFields;
    procedure TestgetRowLength;
    procedure TestgetColumnLength;
    procedure TestvectorMultiplication;
    procedure TestmatrixMultiplication;
  end;

implementation

procedure TestTMatrix.SetUp;
begin
  FMatrix := TMatrix.Create;
  v1 := TVector.Create([1,2,3]);
  v2 := TVector.Create([4,5,6]);
  v3 := TVector.Create([7,8,9]);
  FMatrix.setFields([v1.fields,v2.fields,v3.fields]);
end;

procedure TestTMatrix.TearDown;
begin
  FMatrix.Free;
  FMatrix := nil;
  v1.Free;
  v1 := nil;
  v2.Free;
  v2 := nil;
  v3.Free;
  v3 := nil;
end;

procedure TestTMatrix.TestsetFields;
var
  A: TDoubleMatrix;
  v4,v5: TVector;
begin
  // Setup
  v4 := TVector.Create([1,2,3]);
  v5 := TVector.Create([4,5,6]);
  FMatrix.setFields([v4.fields,v5.fields]);

  // Prüfung
  CheckEquals(1, FMatrix.fields[0][0]);
  CheckEquals(2, FMatrix.fields[0][1]);
  CheckEquals(3, FMatrix.fields[0][2]);
  CheckEquals(4, FMatrix.fields[1][0]);
  CheckEquals(5, FMatrix.fields[1][1]);
  CheckEquals(6, FMatrix.fields[1][2]);
end;

procedure TestTMatrix.TestgetRowLength;
var
  ReturnValue: Integer;
begin
  // Setup
  ReturnValue := FMatrix.getRowLength;

  // Prüfung
  CheckEquals(3,FMatrix.getRowLength);
end;

procedure TestTMatrix.TestgetColumnLength;
var
  ReturnValue: Integer;
begin
  //Setup
  ReturnValue := FMatrix.getColumnLength;

  // Prüfen
  Checkequals(3, FMatrix.getColumnLength);
end;

procedure TestTMatrix.TestvectorMultiplication;
var
  ReturnValue: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  ReturnValue := FMatrix.vectorMultiplication(v1);

  // TODO: Methodenergebnisse prüfen
  CheckEquals(14,ReturnValue.fields[0]);
  CheckEquals(32,ReturnValue.fields[1]);
  CheckEquals(50,ReturnValue.fields[2]);

  ReturnValue.Free;
  ReturnValue := nil;
end;

procedure TestTMatrix.TestmatrixMultiplication;
var
  ReturnValue: TMatrix;
  A: TMatrix;
begin
  //Setup
  A := TMatrix.Create;
  A.setFields([v1.fields,v2.fields,v3.fields]);
  ReturnValue := FMatrix.matrixMultiplication(A);

  // TODO: Methodenergebnisse prüfen
  checkEquals(30,ReturnValue.fields[0][0]);
  checkEquals(36,ReturnValue.fields[0][1]);
  checkEquals(42,ReturnValue.fields[0][2]);
  checkEquals(66,ReturnValue.fields[1][0]);
  checkEquals(81,ReturnValue.fields[1][1]);
  checkEquals(96,ReturnValue.fields[1][2]);
  checkEquals(102,ReturnValue.fields[2][0]);
  checkEquals(126,ReturnValue.fields[2][1]);
  checkEquals(150,ReturnValue.fields[2][2]);
end;

initialization
  // Alle Testfälle beim Testprogramm registrieren
  RegisterTest(TestTMatrix.Suite);
end.

