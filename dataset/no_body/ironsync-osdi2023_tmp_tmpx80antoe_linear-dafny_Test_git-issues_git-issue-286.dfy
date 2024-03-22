// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

datatype Option<T> = None | Some(t:T)

class C {
  method m(x: Option<bool>) {/* TODO */ }
}

class D<T> {
  method mm(x: Option<int>) {/* TODO */ }
}


