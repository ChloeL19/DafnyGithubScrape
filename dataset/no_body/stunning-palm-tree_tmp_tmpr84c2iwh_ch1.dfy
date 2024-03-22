// Ex 1.3
method Triple (x: int) returns (r: int)
  ensures r == 3*x {/* TODO */ }

method Caller() {/* TODO */ }

// Ex 1.6
method MinUnderSpec (x: int, y: int) returns (r: int)
  ensures r <= x && r <= y {/* TODO */ }

method Min (x: int, y: int) returns (r: int)
  ensures r <= x && r <= y
  ensures r == x || r == y {/* TODO */ }

// Ex 1.7
method MaxSum (x: int, y: int) returns (s:int, m: int)
  ensures s == x + y
  ensures x <= m && y <= m
  ensures m == x || m == y
// look ma, no implementation!

method MaxSumCaller() {/* TODO */ }

// Ex 1.8
method ReconstructFromMaxSum (s: int, m: int ) returns (x: int, y: int)
  // requires (0 < s && s / 2 < m && m < s)
  requires s - m <= m
  ensures s == x + y
  ensures (m == y || m == x) && x <= m && y <= m
{/* TODO */ }

method TestMaxSum(x: int, y: int)
  // requires x > 0 && y > 0 && x != y
{/* TODO */ }

// Ex 1.9
function Average (a: int, b: int): int {
  (a + b) / 2
}

method Triple'(x: int) returns (r: int)
  // spec 1: ensures Average(r, 3*x) == 3*x
  ensures Average(2*r, 6*x) == 6*x
{/* TODO */ }
