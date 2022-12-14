program DNNTests;
{

  Delphi DUnit-Testprojekt
  -------------------------
  Dieses Projekt enth?lt das DUnit-Test-Framework und die GUI/Konsolen-Test-Runner.
  F?gen Sie den Bedingungen in den Projektoptionen "CONSOLE_TESTRUNNER" hinzu,
  um den Konsolen-Test-Runner zu verwenden.  Ansonsten wird standardm??ig der
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

