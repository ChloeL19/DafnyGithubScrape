// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:cs "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:js "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:go "%s" >> "%t"
// RUN: %dafny /noVerify /compile:4 /compileTarget:java "%s" >> "%t"
// RUN: %diff "%s.expect" "%t"

method Main() {
  UnusedLabel();
  var c := new C;
  c.x := 4;
  c.LabelUsedInGhostCode();  // 10
  print c.x, "\n";
}

method UnusedLabel()
{
  // The following once resulted in malformed Go code, in particular generating an unused labeled.
  label foo: {}
}

class C {
  var x: int

  method LabelUsedInGhostCode()
  {
    x := x + 2;
    label A:
    x := x + 1;
    label B:
    x := x + 3;
  }
}

