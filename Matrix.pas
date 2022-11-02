unit Matrix;

interface
uses
SysUtils,
Vector;

type
TDoubleMatrix = array of TDoubleArray;

type
TMatrix = class
  protected
    function dotMultiply(arr1 : TDoubleArray; arr2 : TDoubleArray) : double;
  public
    fields : TDoubleMatrix;
    procedure setSize(rows : Integer; columns : Integer);
    procedure setFields(A : TDoubleMatrix);
    procedure transpose;
    function getRowLength : Integer;
    function getColumnLength: Integer;
    function vectorMultiplication(v: TVector): TVector;
    function matrixMultiplication(A: TMatrix): TMatrix;
end;


implementation

{ TMatrix }

function TMatrix.dotMultiply(arr1, arr2: TDoubleArray): double;
var
i : Integer;
begin
Result := 0;
  for I := 0 to Length(arr1)-1 do
  begin
    Result := Result + arr1[i]*arr2[i];
  end;

end;

function TMatrix.getColumnLength: Integer;
begin
  Result := Length(fields);
end;

function TMatrix.getRowLength: Integer;
begin
  Result := Length(fields[0]);
end;

function TMatrix.matrixMultiplication(A: TMatrix): TMatrix;
var
arr : TDoubleArray;
i,j: Integer;
begin
  if A.getColumnLength <> self.getRowLength then
  begin
    raise Exception.Create('Invalid Matrix times Matrix Operation') at @A;
  end;

  A.transpose;
  Result := TMatrix.Create;
  Result.setSize(self.getColumnLength,A.getRowLength);
  for i := 0 to getColumnlength-1 do
  begin
    for j := 0 to getColumnLength-1 do
      begin
        Result.fields[i][j] := Self.dotMultiply(Self.fields[i],A.fields[j]);
      end;
  end;
end;

procedure TMatrix.setFields(A: TDoubleMatrix);
begin
  fields := A;
end;

procedure TMatrix.setSize(rows : Integer; columns: Integer);
var
i : Integer;
begin
setlength(fields, rows);
for i := 0 to rows-1 do
  setLength(fields[i], columns);
end;

procedure TMatrix.transpose;
var
M : TDoubleMatrix;
arr : TDoubleArray;
i,j : Integer;
begin

setLength(M, Length(self.fields[0]));
setLength(arr, Length(self.fields));
for I := 0 to Length(self.fields[0])-1 do
  begin
    for j := 0 to Length(self.fields)-1 do
    begin
        arr[j] := self.fields[j][i];
    end;

    M[i] := copy(arr);
  end;
  self.setFields(M);
end;

function TMatrix.vectorMultiplication(v: TVector): TVector;
var
 I: Integer;
 a: TDoubleArray;
begin
{
  We must check if the Vector and Matrix can be multiplied as the multiplication
  is not definied if the row length is diffent than the vector length
}
  if Length(v.fields) <> self.getRowLength then
  begin
    raise Exception.Create('Invalid Matrix and Vector Operation') at @v;
  end;

  {
   The Resulting Vector is always the length of the Matrix Column Length
  }
  SetLength(a, getColumnLength);
  for I := 0 to getColumnLength-1 do
  begin
    a[i] := v.dotMultiplication(fields[i]);
  end;
  Result := TVector.Create(a);
end;
end.
