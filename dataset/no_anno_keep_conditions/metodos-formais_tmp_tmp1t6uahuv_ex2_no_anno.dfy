method Dobro(x:int) returns (r:int)
    ensures r == 2*x

method Triplo(x:int) returns (r:int)
    ensures r == 3*x
{
    var y := Dobro(x);
    r := x + y;
}
