// RUN: %dafny /compile:0 "%s" > "%t"
// RUN: %diff "%s.expect" "%t"

module M {
  export
    provides A, A.New
  datatype A<T> = A(s:seq<T>) {
    static method New() returns (self: A<T>) {/* TODO */ }
  }
}

module M2 {
  import M

  method test() {/* TODO */ }
}


