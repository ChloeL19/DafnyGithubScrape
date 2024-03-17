class A {
  var z1: array<nat>
  var z2: array<nat>

  method mm()
  {
    var a: array<nat> := z1;
    a := z2;
    z2[0] := 27;
                            // z2; in pre-state z2[0] == 17
                            // z2; z2[0] is currently 27
  }
}

