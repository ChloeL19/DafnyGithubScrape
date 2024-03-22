class A {

  var value: int

  method m(i: int)
    requires i == 6
    requires value == 42
    modifies this
  {/* TODO */ }
}

