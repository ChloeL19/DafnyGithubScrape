// RUN: %dafny /compile:1 /compileTarget:cs /print:"%t.print" /dprint:"%t.dprint" "%s" "%S%{dirsep}ExternCopyFromTraitLibrary.cs" > "%t"
// RUN: %diff "%s.expect" "%t"
module {:extern "M"} M {
  trait {:extern} T1 {
    method {:extern "m1_ext"} m1()
  }
  class {/* TODO */ } C1 extends T1 {

    method {:extern "m1_ext_different"} m1() {/* TODO */ }
  }

  trait {:extern} T2 {
    method {:extern "m2_ext"} m2()
  }
  class {/* TODO */ } C2 extends T2 {

    method m2() {/* TODO */ }
  }
}
