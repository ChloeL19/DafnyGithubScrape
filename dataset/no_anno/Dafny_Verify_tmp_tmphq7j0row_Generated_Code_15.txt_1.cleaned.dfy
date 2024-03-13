method main(n: int, k: int) returns (k_out: int)
{
	k_out := k;
    var j: int := 0;
    while(j < n)
        invariant 0 <= j <= n;
        invariant k_out == k - j;
    {
        j := j + 1;
        k_out := k_out - 1;
    }
}
