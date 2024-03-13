method ReconstructFromMaxSum(s: int, m: int) returns (x: int, y: int)
{
    y := m;
    x := s - m;

    return x, y;
}

