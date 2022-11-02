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
  CheckEquals(3/100, FLayer.weights.fields[0][1], 0.01,'Outside of Range');
  CheckEquals(86/100, FLayer.weights.fields[0][2], 0.01,'Outside of Range');
  CheckEquals(20/100, FLayer.weights.fields[1][0], 0.01,'Outside of Range');
  CheckEquals(27/100, FLayer.weights.fields[1][1], 0.01,'Outside of Range');
  CheckEquals(67/100, FLayer.weights.fields[1][2], 0.01,'Outside of Range');
end;

procedure TestTLayer.Testactivate;
var
  ReturnValue: TVector;
  vec: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  vec := TVector.Create([0,-1,2,1]);
  ReturnValue := FLayer.activate(vec);
  vec.Free;
  vec := nil;

  // TODO: Methodenergebnisse prüfen
  CheckEquals(0,ReturnValue.fields[0]);
  CheckEquals(0,ReturnValue.fields[1]);
  CheckEquals(2,ReturnValue.fields[2]);
  CheckEquals(1,ReturnValue.fields[3]);
  ReturnValue.Free;
  ReturnValue := nil;
end;

procedure TestTLayer.Testforwardpass;
var
  ReturnValue: TVector;
  inputVector: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  FLayer.randomInitialize;
  inputVector := TVector.Create([1,2]);

  ReturnValue := FLayer.forwardpass(inputVector);
  inputVector.Free;
  inputVector := nil;
  // TODO: Methodenergebnisse prüfen

  CheckEquals(0.06 ,ReturnValue.fields[0], 0.01,'Outside of Range');
  CheckEquals(0.74, ReturnValue.fields[1], 0.01,'Outside of Range');
  CheckEquals(0.63, ReturnValue.fields[2], 0.01,'Outside of Range');
  ReturnValue.Free;
  ReturnValue := nil;
end;

procedure TestTLayer.Testbackwardpass;
var
  ReturnValue: TVector;
  inputVector: TVector;
begin
  // TODO: Methodenaufrufparameter einrichten
  inputVector := TVector.Create([1,2,3]);
  ReturnValue := FLayer.backwardpass(inputVector);
  inputVector.Free;
  inputVector := nil;
  // TODO: Methodenergebnisse prüfen
  CheckEquals(0.06 ,ReturnValue.fields[0], 0.01,'Outside of Range');

  ReturnValue.Free;
  ReturnValue := nil;
end;

initialization
  // Alle Testfälle beim Testprogramm registrieren
  RegisterTest(TestTLayer.Suite);
end.

