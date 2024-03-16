function sumInts( n: int ): int
{
    if n == 0 then
        0
    else
        sumInts(n-1)+n
}


method SumIntsLoop( n: int ) returns ( s: int )
{
    s := 0;
    var k := 0;
    while k != n
        decreases n-k;
    {
        k := k+1;
        s := s+k;
    }
}

method Main()
{
    var x := SumIntsLoop(100);
    print x;

}


