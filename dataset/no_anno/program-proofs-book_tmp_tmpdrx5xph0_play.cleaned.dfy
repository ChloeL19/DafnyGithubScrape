method Triple(x: int) returns (r : int)
{
    var y := x / 2;
    r := 6 * y;
}

method Caller(){
method Caller(){
    var i := Triple(18);
    print(i);
}
