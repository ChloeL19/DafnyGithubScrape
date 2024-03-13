method Triple(x: int) returns (r : int)
    ensures r == 3*x
    requires x % 2 == 0
{
    var y := x / 2;
    r := 6 * y;
}

method Caller(){
    var i := Triple(18);
    print(i);
}
