// RUN: %dafny /compile:3 /spillTargetCode:2 /compileTarget:cs "%s" CSharpStyling2.cs > "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {/* TODO */ }

class MyClass {
  var u: int
  constructor {:extern} (x: int)
  constructor Init(y: bool) {
    u := if y then 2 else -2;
  }
  constructor {:extern} Make(y: bool)
  method {:extern} OneResultExtern(z: int) returns (r: int)
  method OneResult(z: int) returns (r: int) {/* TODO */ }
  method {:extern} TwoResultsExtern(z: int) returns (r: int, s: int)
  method TwoResults(z: int) returns (r: int, s: int) {/* TODO */ }
}

