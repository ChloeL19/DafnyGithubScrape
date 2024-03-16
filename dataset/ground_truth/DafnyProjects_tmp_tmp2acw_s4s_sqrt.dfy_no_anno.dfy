
method sqrt(x: real) returns (r: real)
method testSqrt() {
  var r := sqrt(4.0);
  //if (2.0 < r) { monotonicSquare(2.0, r); }
  if (r < 2.0) { monotonicSquare(r, 2.0); }
}

lemma monotonicMult(c: real, x: real, y: real)
{}


lemma monotonicSquare(x: real, y: real)
{
    monotonicMult(x, x, y);
}



