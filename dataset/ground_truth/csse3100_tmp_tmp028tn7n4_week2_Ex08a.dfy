method Triple(x: int) returns (r: int)
    ensures r == 3 * x
{
    var y := Double(x);
    r := x + y;
}

method Double(x: int) returns (r: int)
    ensures r == 2 * x
