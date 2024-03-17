class A {

  var value: int

  method m(i: int)
  {
    var j: int := 17;
    value := 43;
    label L:
    j := 18;
    value := 44;
    label M:
    // value is this.value; 'this' is the same
    // same reference in current and pre state but the
    // values stored in the heap as its fields are different;
    // '.value' evaluates to 42 in the pre-state, 43 at L,
    // and 44 in the current state
  }
}

