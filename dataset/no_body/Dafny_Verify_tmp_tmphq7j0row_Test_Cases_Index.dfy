method Index(n: int) returns (i: int) 
requires 1 <= n
ensures 0 <= i < n
{/* TODO */ }

method Min(x: int, y: int) returns (m: int) 
ensures m <= x && m <= y
ensures m == x || m == y
{/* TODO */ }

method Max(x: int, y: int) returns (m: int) {/* TODO */ }


method MaxSum(x: int, y: int) returns (s: int, m: int)
  ensures s == x + y
  ensures m == if x >= y then x else y
{/* TODO */ }


method MaxSumCaller() {/* TODO */ }

method ReconstructFromMaxSum(s: int, m: int) returns (x: int, y: int)
    requires s <= 2 * m
    ensures s == (x + y)
    ensures (m == x || m == y) && x <= m && y <= m
{/* TODO */ }


method TestMaxSum(x: int, y: int) 
{/* TODO */ }

