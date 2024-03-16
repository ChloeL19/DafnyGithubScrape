//Problem 01
method sumOdds(n: nat) returns (sum: nat)
{
    sum := 1;
    var i := 0;

    while i < n-1
    {
        i := i + 1;
        sum := sum + 2 * i + 1;
    }

}

//problem02
//a)
method intDiv(n:int, d:int) returns (q:int, r:int)
{
    q := 0;
    r := n;
    while r >= d
        r := r-1;
    {
        r := r - d;
        q := q + 1;
    } 
}


