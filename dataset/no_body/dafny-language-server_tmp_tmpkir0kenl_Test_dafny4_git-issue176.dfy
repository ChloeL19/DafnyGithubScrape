// RUN: %dafny /compile:0  "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

predicate Thing1() {
    var m := map[0 := 1];
    forall i :: i in m ==> i == 0
}

datatype Context = Context(foo: map<int, int>)

predicate Thing2(ctx: Context) {
   var ctx' := ctx.(foo := map[0 := 1]);
   forall i :: i in ctx'.foo ==> i == 0
}

method Main() {/* TODO */ }
