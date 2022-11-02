unit DNNimplementation;

interface

uses Layer;
type
  TIntegerArray = array of Integer;

type
  TDNN = class
    private
     layers : array of TLayer;
    protected
    public
    procedure Create(numberOfLayers: integer; inputs: Integer; amountOfNodes: TIntegerArray);
end;
implementation

{ TDNN }

procedure TDNN.Create(numberOfLayers: integer; inputs: Integer; amountOfNodes: TIntegerArray);
var i : Integer;
begin
  SetLength(layers, numberOfLayers);
  layers[0] := TLayer.Create(inputs, amountOfNodes[0]);
  for I := 1 to numberOfLayers-1 do
  begin
      layers[i] := TLayer.Create(amountOfNodes[i-1], amountOfNodes[i]);
  end;

end;

end.
