unit ActivationFunctions;

interface

type TActivationFunctions = function(d: double) : double;

implementation

function Sigmoid(d: double) : double;
begin

end;

function ReLu(d: double): double;
begin
  if d>0 then
  begin
    Result := d;
  end
  else
  begin
    Result := 0;
  end;
end;

end.
