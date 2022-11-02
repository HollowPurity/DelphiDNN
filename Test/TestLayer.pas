unit TestLayer;
{

  Delphi DUnit-Testfall
  ----------------------
  Diese Unit enthält ein Skeleton einer Testfallklasse, das vom Experten für Testfälle erzeugt wurde.
  Ändern Sie den erzeugten Code so, dass er die Methoden korrekt einrichtet und aus der 
  getesteten Unit aufruft.

}

interface

uses
  TestFramework, Matrix, Vector, Layer;

type
  // Testmethoden für Klasse TLayer

  TestTLayer = class(TTestCase)
  strict private
    FLayer: TLayer;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestrandomInitialize;
    procedure Testactivate;
    procedure Testforwardpass;
    procedure Testbackwardpass;
  end;

implementation

procedure TestTLayer.SetUp;
begin
  FLayer := TLayer.Create(2,3,ReLu);
end;

procedure TestTLayer.TearDown;
begin
  FLayer.Free;
  FLayer := nil;
end;

procedure TestTLayer.TestrandomInitialize;
begin
  FLayer.randomInitialize;

  CheckEquals(0, FLayer.weights.fields[0][0]);
  CheckEquals(0.03, FLayer.weights.fields[0][1]);
  CheckEquals(0.86, FLayer.weights.fields[0][2]);
  CheckEquals(0.27, FLayer.weights.fields[1][0]);
  CheckEquals(0.67, FLayer.weights.fields[1][1]);
  CheckEquals(0.31, FLayer.weights.fields[1][2]);
end;

procedure TestTLayer.Testactivate;
var
  ReturnValue: TVector;
  vec: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  vec := TVector.Create([0,-1,2,1]);
  ReturnValue := FLayer.activate(vec);

  // TODO: Methodenergebnisse prüfen
  CheckEquals(0,ReturnValue.fields[0]);
  CheckEquals(0,ReturnValue.fields[1]);
  CheckEquals(2,ReturnValue.fields[2]);
  CheckEquals(1,ReturnValue.fields[3]);
end;

procedure TestTLayer.Testforwardpass;
var
  ReturnValue: TVector;
  inputVector: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  inputVector := TVector.Create([1,2]);
  ReturnValue := FLayer.forwardpass(inputVector);
  // TODO: Methodenergebnisse prüfen
  CheckEquals(1, ReturnValue.fields[0]);
  CheckEquals(2, ReturnValue.fields[1]);
  CheckEquals(3, ReturnValue.fields[2]);
end;

procedure TestTLayer.Testbackwardpass;
var
  ReturnValue: TVector;
  inputVector: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  ReturnValue := FLayer.backwardpass(inputVector);
  // TODO: Methodenergebnisse prüfen
end;

initialization
  // Alle Testfälle beim Testprogramm registrieren
  RegisterTest(TestTLayer.Suite);
end.

