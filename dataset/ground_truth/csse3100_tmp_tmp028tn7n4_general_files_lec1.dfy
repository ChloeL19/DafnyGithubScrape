method MyMethod(x: int) returns (y: int)
    requires x >= 10
    ensures y >= 25
{
    var a := x + 3;
    var b := 12;
    y := a + b;
}
