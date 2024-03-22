method ReconstructFromMaxSum(s: int, m: int) returns (x: int, y: int)
    requires s - m <= m
    ensures s == x + y
    ensures (m == x || m == y) && x <= m && y <= m
{
    y := m;
    x := s - m;

    return x, y;
}

