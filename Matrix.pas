unit Matrix;

interface
uses
Vector;

type
TDoubleArray = array of Double;
TDoubleMatrix = array of TDoubleArray;

type
TMatrix = class
  private
    fields : TDoubleMatrix;
  public
    procedure setFields(A : TDoubleMatrix);
    function readFields: TDoubleMatrix;
    function vectorMultiplication(v: TVector): TVector;
    function matrixMultiplication(A: TMatrix): TMatrix;
end;


implementation

{ TMatrix }

function TMatrix.matrixMultiplication(A: TMatrix): TMatrix;
begin

end;

function TMatrix.readFields: TDoubleMatrix;
begin

end;

procedure TMatrix.setFields(A: TDoubleMatrix);
begin

end;

function TMatrix.vectorMultiplication(v: TVector): TVector;
begin

end;
end.
