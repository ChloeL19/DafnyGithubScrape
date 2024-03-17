method Index(n: int) returns (i: int) 
{
    i := n/2;
}

method Min(x: int, y: int) returns (m: int) 
{
    if (x >= y) {
        m := y;
    } else {
        m := x;
    }
}

method Max(x: int, y: int) returns (m: int) {
    if (x >= y) {
        m := x;
    } else {
        m := y;
    }
}


method MaxSum(x: int, y: int) returns (s: int, m: int)
{
    s := x + y;
    if (x >= y) {
        m := x;
    } else {
        m := y;
    }
}


method MaxSumCaller() {
    var x: int := 1928;
    var y: int := 1;
    var a, b: int;
    a, b := MaxSum(x, y);

}

method ReconstructFromMaxSum(s: int, m: int) returns (x: int, y: int)
{
    x := m;
    y := s - m;
}


method TestMaxSum(x: int, y: int) 
{
    var s, m := MaxSum(x, y);
    var xx, yy := ReconstructFromMaxSum(s, m);
}

