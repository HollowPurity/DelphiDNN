unit Layer;

interface

uses Vector, Matrix;

type ActivationFunction = function (d : Double) : Double;

type
  TLayer = class
    biases: TVector;
    weights : TMatrix;
    activationFunction : ActivationFunction;
    constructor Create(amountOfinputs: Integer; amountOfoutputs: Integer; aFunction: ActivationFunction);
    procedure randomInitialize;
    function activate(vec : TVector): TVector;
    function forwardpass(inputVector: TVector) : TVector;
    function backwardpass(inputVector: TVector) :TVector;
end;

  function ReLu(d : Double) : Double;
  function Sigmoid (d: Double): Double;
implementation

function TLayer.activate(vec: TVector): TVector;
var
i :Integer;
arr : TDoubleArray;
begin

  SetLength(arr, Length(vec.fields));
  for i := 0 to Length(vec.fields)-1 do
    begin
      arr[i] := activationFunction(vec.fields[i]);
    end;
  Result := TVector.Create(arr);
end;

function TLayer.backwardpass(inputVector: TVector): TVector;
begin

end;

constructor TLayer.Create(amountOfinputs: Integer; amountOfoutputs: Integer; aFunction : ActivationFunction);
begin
  weights := TMatrix.Create;
  weights.setSize(amountOfinputs, amountOfoutputs);
  biases := TVector.Create();
  setLength(biases.fields, amountOfinputs);
  self.activationFunction := aFunction;
end;

function TLayer.forwardpass(inputVector: TVector): TVector;
begin
Result :=  weights.vectorMultiplication(inputVector);
Result.addition(biases);
//Result := acitvate(Result);
end;

procedure TLayer.randomInitialize;
var
i,j : Integer;
begin
RandSeed := 0;
for I := 0 to weights.getColumnLength-1 do
  begin
  for J := 0 to weights.getRowLength do
    begin
      weights.fields[i][j] := System.Random(100)/100;
    end;
  end;

i := 0;
 for I := 0 to Length(biases.fields)-1 do
   begin
     biases.fields[i] := System.Random(1);
   end;
end;

function ReLU(d: Double) : Double;
begin
  if d > 0 then
  begin
    Result := d;
  end
  else
  begin
    Result := 0;
  end;
end;

function Sigmoid(d: Double) : Double;
begin
  Result := 1/(1+System.Exp(-d));
end;
end.
