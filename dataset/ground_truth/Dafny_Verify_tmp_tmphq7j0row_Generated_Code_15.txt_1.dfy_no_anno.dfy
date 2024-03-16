method main(n: int, k: int) returns (k_out: int)
{
	k_out := k;
    var j: int := 0;
    while(j < n)
    {
        j := j + 1;
        k_out := k_out - 1;
    }
}
