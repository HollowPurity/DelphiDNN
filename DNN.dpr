program DNN;

uses
  System.StartUpCopy,
  FMX.Forms,
  DNNmain in 'DNNmain.pas' {Form1},
  DNNimplementation in 'DNNimplementation.pas',
  Layer in 'Layer.pas',
  DNNMath in 'DNNMath.pas',
  Vector in 'Vector.pas',
  Matrix in 'Matrix.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
