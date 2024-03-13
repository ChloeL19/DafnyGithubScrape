method doub(a:real, b:real) returns (c:int)
{
    var a1: real := a;
    c := 1;
    while a1 < b
        decreases *;
    {
        a1 := a1 * 2.0;
        c := c + 1;
    }
} 

method Main()
{
    var c:= doub(2.0, 5.0);
    print c;
}
