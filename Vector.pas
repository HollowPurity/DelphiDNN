unit Vector;

interface
uses
  System.SysUtils, Dialogs;
type
TDoubleArray = array of Double;

type
TVector = class
  public
  fields : TDoubleArray;
  procedure setFields(V : TDoubleArray);
  procedure addition(vector : TVector);
  procedure SMultiplication(d : Double);
  function dotMultiplication(vector : TVector): Double;
end;
implementation

 { TVector }

procedure TVector.setFields(V: TDoubleArray);
begin
  fields := V;
end;

procedure TVector.addition(vector: TVector);
var i,j: Integer;
begin
  try
    if Length(fields) >= Length(vector.fields)
      then j := Length(fields)
      else j := Length(vector.fields);

    begin
      for i:=0 to j-1 do
      begin
        fields[i] := fields[i] + vector.fields[i];
      end;
  end
  except
    On E : Exception do
    begin
      Showmessage('Exception class name ='+E.classname);
    end;
  end;

end;

procedure TVector.SMultiplication(d: Double);
var i: Integer;
begin
  for i:=0 to Length(fields)-1 do
    begin
      fields[i] := fields[i] *d;
    end;
end;

function TVector.dotMultiplication(vector: TVector): Double;
var i,j : Integer;
begin
  if Length(fields) >= Length(vector.fields) then j := Length(fields)
  else j := Length(vector.fields);

  begin
    Result := 0;
    for i:=0 to j-1 do
    begin
      Result := Result + fields[i] * vector.fields[i];
    end;
  end
end;
end.
