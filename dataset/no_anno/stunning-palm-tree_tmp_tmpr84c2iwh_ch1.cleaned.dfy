// Ex 1.3
method Triple (x: int) returns (r: int)
  ensures r == 3*x {
  var y := 2*x;
  r := y + x;
  assert r == 3*x;
}

method Caller() {
method Caller() {
  var t := Triple(18);
  assert t < 100;
}

// Ex 1.6
method MinUnderSpec (x: int, y: int) returns (r: int)
  ensures r <= x && r <= y {
  if x <= y {
    r := x - 1;
  } else {
    r := y - 1;
  }
}

method Min (x: int, y: int) returns (r: int)
  ensures r == x || r == y {
  if x <= y {
    r := x;
  } else {
    r := y;
  }
}

// Ex 1.7
method MaxSum (x: int, y: int) returns (s:int, m: int)
method MaxSumCaller() {
method MaxSumCaller() {
  var s, m := MaxSum(1928, 1);
  assert s == 1929;
  assert m == 1928;
}

// Ex 1.8
method ReconstructFromMaxSum (s: int, m: int ) returns (x: int, y: int)
{
  x := m;
  y := s - m;
}

method TestMaxSum(x: int, y: int)
{
  var s, m := MaxSum(x, y);
  var xx, yy := ReconstructFromMaxSum(s, m);
  assert (xx == x && yy == y) || (xx == y && yy == x);
}

// Ex 1.9
function Average (a: int, b: int): int {
function Average (a: int, b: int): int {
  (a + b) / 2
}

method Triple'(x: int) returns (r: int)
{
  // r := x + x + x + 1;  // does not meet spec of Triple, but does spec 1
  r := x + x + x;
}
