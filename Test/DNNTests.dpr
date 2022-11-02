program DNNTests;
{

  Delphi DUnit-Testprojekt
  -------------------------
  Dieses Projekt enthält das DUnit-Test-Framework und die GUI/Konsolen-Test-Runner.
  Fügen Sie den Bedingungen in den Projektoptionen "CONSOLE_TESTRUNNER" hinzu,
  um den Konsolen-Test-Runner zu verwenden.  Ansonsten wird standardmäßig der
  GUI-Test-Runner verwendet.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  TestVector in 'TestVector.pas',
  Vector in '..\Vector.pas',
  TestMatrix in 'TestMatrix.pas',
  Matrix in '..\Matrix.pas',
  TestLayer in 'TestLayer.pas',
  Layer in '..\Layer.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

