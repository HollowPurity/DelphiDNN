unit DNNimplementation;

interface

uses Layer, Vector, Matrix, Math;
type
  TIntegerArray = array of Integer;

type
  TDNN = class
    private
     layers : array of TLayer;
    protected
    public
    procedure Create(numberOfLayers: integer; inputs: Integer; amountOfNodes: TIntegerArray);
    Procedure pass(input : TVector; groundTruth: TVector); overload;
    Procedure pass(input : TMatrix; groundTruths: TMatrix); overload;
    Procedure backpropagate(loss: Double);
    function loss(input : TVector; groundTruth: TVector) : TVector;

end;
implementation

{ TDNN }

procedure TDNN.backpropagate(loss: Double);
begin

end;

procedure TDNN.Create(numberOfLayers: integer; inputs: Integer; amountOfNodes: TIntegerArray);
var i : Integer;
begin
  SetLength(layers, numberOfLayers);
  layers[0] := TLayer.Create(inputs, amountOfNodes[0],ReLu);
  for I := 1 to numberOfLayers-1 do
  begin
      layers[i] := TLayer.Create(amountOfNodes[i-1], amountOfNodes[i],ReLu);
  end;

end;

function TDNN.loss(input : TVector; GroundTruth : TVector): TVector;
var
i : Integer;
loss, MeanSquareError: double;
begin
loss := 0;
for I := 0 to Length(input.fields)-1 do
  begin
    loss := loss
            + input.fields[i]
            * System.LN(groundTruth.fields[i] + System.Exp(-15));
  end;
  meanSquareError := loss/Length(input.fields);

end;

procedure TDNN.pass(input: TVector; GroundTruth: TVector);
var
i : Integer;
begin
  for i := 0 to Length(self.layers)-1 do
  begin
    input := self.layers[i].forwardpass(input);
  end;
  self.backpropagate(loss(input, GroundTruth));
end;

Procedure pass(input : TMatrix; groundTruths: TMatrix);
begin

end;

end.
